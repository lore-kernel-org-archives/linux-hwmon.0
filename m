Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:47603 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932185AbdGJN5Q (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Jul 2017 09:57:16 -0400
From: Andrew Jeffery <andrew@aj.id.au>
To: linux@roeck-us.net, linux-hwmon@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, jdelvare@suse.com,
        linux-kernel@vger.kernel.org, joel@jms.id.au,
        openbmc@lists.ozlabs.org, msbarth@linux.vnet.ibm.com,
        mspinler@linux.vnet.ibm.com
Subject: [RFC PATCH 3/4] pmbus: Allow dynamic fan coefficient values
Date: Mon, 10 Jul 2017 23:26:17 +0930
Message-Id: <20170710135618.13661-4-andrew@aj.id.au>
In-Reply-To: <20170710135618.13661-1-andrew@aj.id.au>
References: <20170710135618.13661-1-andrew@aj.id.au>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Some PMBus chips, such as the MAX31785, use different coefficients for
FAN_COMMAND_[1-4] depending on whether the fan is in PWM (percent duty)
or RPM mode. Add a callback to allow the driver to provide the
applicable coefficients to avoid imposing on devices that don't have
this requirement.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/pmbus/pmbus.h      |  18 +++++--
 drivers/hwmon/pmbus/pmbus_core.c | 112 ++++++++++++++++++++++++++++++++-------
 2 files changed, 108 insertions(+), 22 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index 927eabc1b273..338ecc8b25a4 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -345,6 +345,12 @@ enum pmbus_sensor_classes {
 enum pmbus_data_format { linear = 0, direct, vid };
 enum vrm_version { vr11 = 0, vr12 };
 
+struct pmbus_coeffs {
+	int m; /* mantissa for direct data format */
+	int b; /* offset */
+	int R; /* exponent */
+};
+
 struct pmbus_driver_info {
 	int pages;		/* Total number of pages */
 	enum pmbus_data_format format[PSC_NUM_CLASSES];
@@ -353,9 +359,7 @@ struct pmbus_driver_info {
 	 * Support one set of coefficients for each sensor type
 	 * Used for chips providing data in direct mode.
 	 */
-	int m[PSC_NUM_CLASSES];	/* mantissa for direct data format */
-	int b[PSC_NUM_CLASSES];	/* offset */
-	int R[PSC_NUM_CLASSES];	/* exponent */
+	struct pmbus_coeffs coeffs[PSC_NUM_CLASSES];
 
 	u32 func[PMBUS_PAGES];	/* Functionality, per page */
 	/*
@@ -382,6 +386,14 @@ struct pmbus_driver_info {
 	int (*identify)(struct i2c_client *client,
 			struct pmbus_driver_info *info);
 
+	/*
+	 * If a fan's coefficents change over time (e.g. between RPM and PWM
+	 * mode), then the driver can provide a function for retrieving the
+	 * currently applicable coefficients.
+	 */
+	const struct pmbus_coeffs *(*get_fan_coeffs)(
+			const struct pmbus_driver_info *info, int index,
+			enum pmbus_fan_mode mode, int command);
 	/* Allow the driver to interpret the fan command value */
 	int (*get_pwm_mode)(int id, u8 fan_config, u16 fan_command);
 	int (*set_pwm_mode)(int id, long mode, u8 *fan_config,
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 3b0a55bbbd2c..4ff6a1fd5cce 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -58,10 +58,11 @@
 struct pmbus_sensor {
 	struct pmbus_sensor *next;
 	char name[PMBUS_NAME_SIZE];	/* sysfs sensor name */
-	struct device_attribute attribute;
+	struct sensor_device_attribute attribute;
 	u8 page;		/* page number */
 	u16 reg;		/* register */
 	enum pmbus_sensor_classes class;	/* sensor class */
+	const struct pmbus_coeffs *coeffs;
 	bool update;		/* runtime sensor update needed */
 	int data;		/* Sensor data.
 				   Negative if there was a read error */
@@ -89,6 +90,7 @@ struct pmbus_fan_ctrl {
 	u8 id;
 	u8 config;
 	u16 command;
+	const struct pmbus_coeffs *coeffs;
 };
 #define to_pmbus_fan_ctrl_attr(_attr) \
 	container_of(_attr, struct pmbus_fan_ctrl_attr, attribute)
@@ -511,9 +513,15 @@ static long pmbus_reg2data_direct(struct pmbus_data *data,
 	long val = (s16) sensor->data;
 	long m, b, R;
 
-	m = data->info->m[sensor->class];
-	b = data->info->b[sensor->class];
-	R = data->info->R[sensor->class];
+	if (sensor->coeffs) {
+		m = sensor->coeffs->m;
+		b = sensor->coeffs->b;
+		R = sensor->coeffs->R;
+	} else {
+		m = data->info->coeffs[sensor->class].m;
+		b = data->info->coeffs[sensor->class].b;
+		R = data->info->coeffs[sensor->class].R;
+	}
 
 	if (m == 0)
 		return 0;
@@ -663,9 +671,15 @@ static u16 pmbus_data2reg_direct(struct pmbus_data *data,
 {
 	long m, b, R;
 
-	m = data->info->m[sensor->class];
-	b = data->info->b[sensor->class];
-	R = data->info->R[sensor->class];
+	if (sensor->coeffs) {
+		m = sensor->coeffs->m;
+		b = sensor->coeffs->b;
+		R = sensor->coeffs->R;
+	} else {
+		m = data->info->coeffs[sensor->class].m;
+		b = data->info->coeffs[sensor->class].b;
+		R = data->info->coeffs[sensor->class].R;
+	}
 
 	/* Power is in uW. Adjust R and b. */
 	if (sensor->class == PSC_POWER) {
@@ -796,7 +810,9 @@ static ssize_t pmbus_show_sensor(struct device *dev,
 				 struct device_attribute *devattr, char *buf)
 {
 	struct pmbus_data *data = pmbus_update_device(dev);
-	struct pmbus_sensor *sensor = to_pmbus_sensor(devattr);
+	struct pmbus_sensor *sensor;
+
+	sensor = to_pmbus_sensor(to_sensor_dev_attr(devattr));
 
 	if (sensor->data < 0)
 		return sensor->data;
@@ -810,12 +826,14 @@ static ssize_t pmbus_set_sensor(struct device *dev,
 {
 	struct i2c_client *client = to_i2c_client(dev->parent);
 	struct pmbus_data *data = i2c_get_clientdata(client);
-	struct pmbus_sensor *sensor = to_pmbus_sensor(devattr);
+	struct pmbus_sensor *sensor;
 	ssize_t rv = count;
 	long val = 0;
 	int ret;
 	u16 regval;
 
+	sensor = to_pmbus_sensor(to_sensor_dev_attr(devattr));
+
 	if (kstrtol(buf, 10, &val) < 0)
 		return -EINVAL;
 
@@ -856,6 +874,7 @@ static ssize_t pmbus_show_fan_command(struct device *dev,
 	}
 
 	sensor.class = PSC_FAN;
+	sensor.coeffs = fan->coeffs;
 	if (mode == percent)
 		sensor.data = fan->command * 255 / 100;
 	else
@@ -882,6 +901,29 @@ static ssize_t pmbus_show_pwm(struct device *dev,
 				      buf);
 }
 
+static int pmbus_update_fan_coeffs(struct pmbus_data *data,
+				   struct pmbus_fan_ctrl *fan,
+				   enum pmbus_fan_mode mode)
+{
+	const struct pmbus_driver_info *info = data->info;
+	struct pmbus_sensor *curr = data->sensors;
+
+	fan->coeffs = info->get_fan_coeffs(info, fan->index, mode,
+					   PMBUS_FAN_COMMAND_1 + fan->id);
+
+	while (curr) {
+		if (curr->class == PSC_FAN &&
+				curr->attribute.index == fan->index) {
+			curr->coeffs = info->get_fan_coeffs(info, fan->index,
+							    mode, curr->reg);
+		}
+
+		curr = curr->next;
+	}
+
+	return 0;
+}
+
 static ssize_t pmbus_set_fan_command(struct device *dev,
 				     enum pmbus_fan_mode mode,
 				     struct pmbus_fan_ctrl *fan,
@@ -889,6 +931,7 @@ static ssize_t pmbus_set_fan_command(struct device *dev,
 {
 	struct i2c_client *client = to_i2c_client(dev->parent);
 	struct pmbus_data *data = i2c_get_clientdata(client);
+	const struct pmbus_driver_info *info = data->info;
 	int config_addr, command_addr;
 	struct pmbus_sensor sensor;
 	ssize_t rv;
@@ -899,7 +942,13 @@ static ssize_t pmbus_set_fan_command(struct device *dev,
 
 	mutex_lock(&data->update_lock);
 
+	if (info->format[PSC_FAN] == direct && info->get_fan_coeffs) {
+		pmbus_update_fan_coeffs(data, fan, mode);
+		sensor.coeffs = fan->coeffs;
+	}
+
 	sensor.class = PSC_FAN;
+	sensor.attribute.index = fan->index;
 
 	val = pmbus_data2reg(data, &sensor, val);
 
@@ -968,6 +1017,8 @@ static ssize_t pmbus_show_pwm_enable(struct device *dev,
 		struct pmbus_sensor sensor = {
 			.class = PSC_FAN,
 			.data = fan->command,
+			.attribute.index = fan->index,
+			.coeffs = fan->coeffs,
 		};
 		long command;
 
@@ -992,6 +1043,7 @@ static ssize_t pmbus_set_pwm_enable(struct device *dev,
 	struct pmbus_fan_ctrl *fan = pwm_enable_to_pmbus_fan_ctrl(da);
 	struct i2c_client *client = to_i2c_client(dev->parent);
 	struct pmbus_data *data = i2c_get_clientdata(client);
+	const struct pmbus_driver_info *info = data->info;
 	int config_addr, command_addr;
 	struct pmbus_sensor sensor;
 	ssize_t rv = count;
@@ -1003,15 +1055,21 @@ static ssize_t pmbus_set_pwm_enable(struct device *dev,
 	mutex_lock(&data->update_lock);
 
 	sensor.class = PSC_FAN;
+	sensor.attribute.index = fan->index;
+
+	if (info->format[PSC_FAN] == direct && info->get_fan_coeffs) {
+		pmbus_update_fan_coeffs(data, fan, percent);
+		sensor.coeffs = fan->coeffs;
+	}
 
 	config_addr = (fan->id < 2) ? PMBUS_FAN_CONFIG_12 : PMBUS_FAN_CONFIG_34;
 	command_addr = config_addr + 1 + (fan->id & 1);
 
-	if (data->info->set_pwm_mode) {
+	if (info->set_pwm_mode) {
 		u8 config = PB_FAN_CONFIG_PUT(fan->id, fan->config);
 		u16 command = fan->command;
 
-		rv = data->info->set_pwm_mode(fan->id, mode, &config, &command);
+		rv = info->set_pwm_mode(fan->id, mode, &config, &command);
 		if (rv < 0)
 			goto done;
 
@@ -1138,7 +1196,7 @@ static struct pmbus_sensor *pmbus_add_sensor(struct pmbus_data *data,
 	sensor = devm_kzalloc(data->dev, sizeof(*sensor), GFP_KERNEL);
 	if (!sensor)
 		return NULL;
-	a = &sensor->attribute;
+	a = &sensor->attribute.dev_attr;
 
 	snprintf(sensor->name, sizeof(sensor->name), "%s%d_%s",
 		 name, seq, type);
@@ -1146,9 +1204,9 @@ static struct pmbus_sensor *pmbus_add_sensor(struct pmbus_data *data,
 	sensor->reg = reg;
 	sensor->class = class;
 	sensor->update = update;
-	pmbus_dev_attr_init(a, sensor->name,
+	pmbus_attr_init(&sensor->attribute, sensor->name,
 			    readonly ? S_IRUGO : S_IRUGO | S_IWUSR,
-			    pmbus_show_sensor, pmbus_set_sensor);
+			    pmbus_show_sensor, pmbus_set_sensor, seq);
 
 	if (pmbus_add_attribute(data, &a->attr))
 		return NULL;
@@ -1886,7 +1944,7 @@ static const u32 pmbus_fan_status_flags[] = {
 /* Fans */
 static int pmbus_add_fan_ctrl(struct i2c_client *client,
 		struct pmbus_data *data, int index, int page, int id,
-		u8 config)
+		u8 config, const struct pmbus_coeffs *coeffs)
 {
 	struct pmbus_fan_ctrl *fan;
 	int rv;
@@ -1898,6 +1956,7 @@ static int pmbus_add_fan_ctrl(struct i2c_client *client,
 	fan->index = index;
 	fan->page = page;
 	fan->id = id;
+	fan->coeffs = coeffs;
 	fan->config = config;
 
 	rv = _pmbus_read_word_data(client, page,
@@ -1921,6 +1980,8 @@ static int pmbus_add_fan_attributes(struct i2c_client *client,
 				    struct pmbus_data *data)
 {
 	const struct pmbus_driver_info *info = data->info;
+	const struct pmbus_coeffs *coeffs = NULL;
+	enum pmbus_fan_mode mode;
 	int index = 1;
 	int page;
 	int ret;
@@ -1929,6 +1990,7 @@ static int pmbus_add_fan_attributes(struct i2c_client *client,
 		int f;
 
 		for (f = 0; f < ARRAY_SIZE(pmbus_fan_registers); f++) {
+			struct pmbus_sensor *sensor;
 			int regval;
 
 			if (!(info->func[page] & pmbus_fan_flags[f]))
@@ -1949,13 +2011,25 @@ static int pmbus_add_fan_attributes(struct i2c_client *client,
 			    (!(regval & (PB_FAN_1_INSTALLED >> ((f & 1) * 4)))))
 				continue;
 
-			if (pmbus_add_sensor(data, "fan", "input", index,
-					     page, pmbus_fan_registers[f],
-					     PSC_FAN, true, true) == NULL)
+			sensor = pmbus_add_sensor(data, "fan", "input", index,
+						  page, pmbus_fan_registers[f],
+						  PSC_FAN, true, true);
+			if (!sensor)
 				return -ENOMEM;
 
+			/* Add coeffs here as we have access to the fan mode */
+			if (info->format[PSC_FAN] == direct &&
+					info->get_fan_coeffs) {
+				const u16 mask = PB_FAN_1_RPM >> ((f & 1) * 4);
+
+				mode = (regval & mask) ? rpm : percent;
+				coeffs = info->get_fan_coeffs(info, index, mode,
+							pmbus_fan_registers[f]);
+				sensor->coeffs = coeffs;
+			}
+
 			ret = pmbus_add_fan_ctrl(client, data, index, page, f,
-						 regval);
+						 regval, coeffs);
 			if (ret < 0)
 				return ret;
 
-- 
2.11.0

