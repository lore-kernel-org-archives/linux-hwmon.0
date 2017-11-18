Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:40715 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1757685AbdKRD0r (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 17 Nov 2017 22:26:47 -0500
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-hwmon@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, linux@roeck-us.net,
        robh+dt@kernel.org, mark.rutland@arm.com, jdelvare@suse.com,
        corbet@lwn.net, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: [PATCH v5 1/4] pmbus (core): Add fan control support
Date: Sat, 18 Nov 2017 13:56:03 +1030
Message-Id: <498eae37a262231c5e7dbd3c9418dbe5a7cd8fb6.1510974230.git-series.andrew@aj.id.au>
In-Reply-To: <cover.8f64654fcede136901874050318e64de7f1a68cb.1510974230.git-series.andrew@aj.id.au>
References: <cover.8f64654fcede136901874050318e64de7f1a68cb.1510974230.git-series.andrew@aj.id.au>
In-Reply-To: <cover.8f64654fcede136901874050318e64de7f1a68cb.1510974230.git-series.andrew@aj.id.au>
References: <cover.8f64654fcede136901874050318e64de7f1a68cb.1510974230.git-series.andrew@aj.id.au>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Expose fanX_target, pwmX and pwmX_enable hwmon sysfs attributes.

Fans in a PMBus device are driven by the configuration of two registers,
FAN_CONFIG_x_y and FAN_COMMAND_x: FAN_CONFIG_x_y dictates how the fan
and the tacho operate (if installed), while FAN_COMMAND_x sets the
desired fan rate. The unit of FAN_COMMAND_x is dependent on the
operational fan mode, RPM or PWM percent duty, as determined by the
corresponding configuration in FAN_CONFIG_x_y.

The mapping of fanX_target, pwmX and pwmX_enable onto FAN_CONFIG_x_y and
FAN_COMMAND_x is implemented with the addition of virtual registers to
facilitate the necessary side-effects of each access:

1. PMBUS_VIRT_FAN_TARGET_x
2. PMBUS_VIRT_PWM_x
3. PMBUS_VIRT_PWM_ENABLE_x

Some complexity arises with the fanX_target and pwmX attributes both mapping
onto FAN_COMMAND_x: There is no general mapping between PWM percent duty and
RPM, so we can't display values in either attribute in terms of the other
(which in my mind is the intuitive, if impossible, behaviour). This problem
also affects the pwmX_enable attribute which allows userspace to switch between
full speed, manual PWM and a number of automatic control modes, possibly
including a switch to RPM behaviour (e.g. automatically adjusting PWM duty to
reach a RPM target, the behaviour of fanX_target).

The next most intuitive behaviour is for fanX_target and pwmX to simply be
independent, to retain their most recently set value even if that value is not
active on the hardware (due to switching to the alternative control mode). This
property of retaining the value independent of the hardware state has useful
results for both userspace and the kernel: Userspace always sees a sensible
value in the attribute (the last thing it was set to, as opposed to 0 or
receiving an error on read), and the kernel can use the attributes as a value
cache. This latter point eases the implementation of pwmX_enable, which can
look up the associated pmbus_sensor object, take its cached value and apply it
to hardware on changing control mode. This ensures we will not arbitrarily set
a PWM value as an RPM value or vice versa, and we can assume that the RPM or
PWM value set was sensible at least at some point in the past.

Finally, the DIRECT mode coefficients of some controllers is different between
RPM and PWM percent duty control modes, so PSC_PWM is introduced to capture the
necessary coefficients. As pmbus core had no PWM support previously PSC_FAN
continues to be used to capture the RPM DIRECT coefficients, but in order to
avoid falsely applying RPM scaling to PWM values I have introduced the
PMBUS_HAVE_PWM12 and PMB_BUS_HAVE_PWM34 feature bits. These feature bits allow
drivers to explicitly declare PWM support in order to have the attributes
exposed.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/pmbus/pmbus.h      |  39 ++++-
 drivers/hwmon/pmbus/pmbus_core.c | 240 +++++++++++++++++++++++++++++---
 2 files changed, 261 insertions(+), 18 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index fa613bd209e3..b54d7604d3ef 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -190,6 +190,33 @@ enum pmbus_regs {
 	PMBUS_VIRT_VMON_UV_FAULT_LIMIT,
 	PMBUS_VIRT_VMON_OV_FAULT_LIMIT,
 	PMBUS_VIRT_STATUS_VMON,
+
+	/*
+	 * RPM and PWM Fan control
+	 *
+	 * Drivers wanting to expose PWM control must define the behaviour of
+	 * PMBUS_VIRT_PWM_[1-4] and PMBUS_VIRT_PWM_ENABLE_[1-4] in the
+	 * {read,write}_word_data callback.
+	 *
+	 * pmbus core provides a default implementation for
+	 * PMBUS_VIRT_FAN_TARGET_[1-4].
+	 *
+	 * TARGET, PWM and PWM_ENABLE members must be defined sequentially;
+	 * pmbus core uses the difference between the provided register and
+	 * it's _1 counterpart to calculate the FAN/PWM ID.
+	 */
+	PMBUS_VIRT_FAN_TARGET_1,
+	PMBUS_VIRT_FAN_TARGET_2,
+	PMBUS_VIRT_FAN_TARGET_3,
+	PMBUS_VIRT_FAN_TARGET_4,
+	PMBUS_VIRT_PWM_1,
+	PMBUS_VIRT_PWM_2,
+	PMBUS_VIRT_PWM_3,
+	PMBUS_VIRT_PWM_4,
+	PMBUS_VIRT_PWM_ENABLE_1,
+	PMBUS_VIRT_PWM_ENABLE_2,
+	PMBUS_VIRT_PWM_ENABLE_3,
+	PMBUS_VIRT_PWM_ENABLE_4,
 };
 
 /*
@@ -223,6 +250,8 @@ enum pmbus_regs {
 #define PB_FAN_1_RPM			BIT(6)
 #define PB_FAN_1_INSTALLED		BIT(7)
 
+enum pmbus_fan_mode { percent = 0, rpm };
+
 /*
  * STATUS_BYTE, STATUS_WORD (lower)
  */
@@ -313,6 +342,7 @@ enum pmbus_sensor_classes {
 	PSC_POWER,
 	PSC_TEMPERATURE,
 	PSC_FAN,
+	PSC_PWM,
 	PSC_NUM_CLASSES		/* Number of power sensor classes */
 };
 
@@ -339,6 +369,8 @@ enum pmbus_sensor_classes {
 #define PMBUS_HAVE_STATUS_FAN34	BIT(17)
 #define PMBUS_HAVE_VMON		BIT(18)
 #define PMBUS_HAVE_STATUS_VMON	BIT(19)
+#define PMBUS_HAVE_PWM12	BIT(20)
+#define PMBUS_HAVE_PWM34	BIT(21)
 
 enum pmbus_data_format { linear = 0, direct, vid };
 enum vrm_version { vr11 = 0, vr12, vr13 };
@@ -421,5 +453,10 @@ int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
 int pmbus_do_remove(struct i2c_client *client);
 const struct pmbus_driver_info *pmbus_get_driver_info(struct i2c_client
 						      *client);
-
+int pmbus_get_fan_rate_device(struct i2c_client *client, int page, int id,
+			      enum pmbus_fan_mode mode);
+int pmbus_get_fan_rate_cached(struct i2c_client *client, int page, int id,
+			      enum pmbus_fan_mode mode);
+int pmbus_update_fan(struct i2c_client *client, int page, int id,
+		     u8 config, u8 mask, u16 command);
 #endif /* PMBUS_H */
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 52a58b8b6e1b..631db88526b6 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -64,6 +64,7 @@ struct pmbus_sensor {
 	u16 reg;		/* register */
 	enum pmbus_sensor_classes class;	/* sensor class */
 	bool update;		/* runtime sensor update needed */
+	bool convert;		/* Whether or not to apply linear/vid/direct */
 	int data;		/* Sensor data.
 				   Negative if there was a read error */
 };
@@ -128,6 +129,27 @@ struct pmbus_debugfs_entry {
 	u8 reg;
 };
 
+static const int pmbus_fan_rpm_mask[] = {
+	PB_FAN_1_RPM,
+	PB_FAN_2_RPM,
+	PB_FAN_1_RPM,
+	PB_FAN_2_RPM,
+};
+
+static const int pmbus_fan_config_registers[] = {
+	PMBUS_FAN_CONFIG_12,
+	PMBUS_FAN_CONFIG_12,
+	PMBUS_FAN_CONFIG_34,
+	PMBUS_FAN_CONFIG_34
+};
+
+static const int pmbus_fan_command_registers[] = {
+	PMBUS_FAN_COMMAND_1,
+	PMBUS_FAN_COMMAND_2,
+	PMBUS_FAN_COMMAND_3,
+	PMBUS_FAN_COMMAND_4,
+};
+
 void pmbus_clear_cache(struct i2c_client *client)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
@@ -197,6 +219,28 @@ int pmbus_write_word_data(struct i2c_client *client, int page, u8 reg,
 }
 EXPORT_SYMBOL_GPL(pmbus_write_word_data);
 
+
+static int pmbus_write_virt_reg(struct i2c_client *client, int page, int reg,
+				u16 word)
+{
+	int bit;
+	int id;
+	int rv;
+
+	switch (reg) {
+	case PMBUS_VIRT_FAN_TARGET_1 ... PMBUS_VIRT_FAN_TARGET_4:
+		id = reg - PMBUS_VIRT_FAN_TARGET_1;
+		bit = pmbus_fan_rpm_mask[id];
+		rv = pmbus_update_fan(client, page, id, bit, bit, word);
+		break;
+	default:
+		rv = -ENXIO;
+		break;
+	}
+
+	return rv;
+}
+
 /*
  * _pmbus_write_word_data() is similar to pmbus_write_word_data(), but checks if
  * a device specific mapping function exists and calls it if necessary.
@@ -213,11 +257,38 @@ static int _pmbus_write_word_data(struct i2c_client *client, int page, int reg,
 		if (status != -ENODATA)
 			return status;
 	}
+
 	if (reg >= PMBUS_VIRT_BASE)
-		return -ENXIO;
+		return pmbus_write_virt_reg(client, page, reg, word);
+
 	return pmbus_write_word_data(client, page, reg, word);
 }
 
+int pmbus_update_fan(struct i2c_client *client, int page, int id,
+	             u8 config, u8 mask, u16 command)
+{
+	int from;
+	int rv;
+	u8 to;
+
+	from = pmbus_read_byte_data(client, page,
+				    pmbus_fan_config_registers[id]);
+	if (from < 0)
+		return from;
+
+	to = (from & ~mask) | (config & mask);
+	if (to != from) {
+		rv = pmbus_write_byte_data(client, page,
+					   pmbus_fan_config_registers[id], to);
+		if (rv < 0)
+			return rv;
+	}
+
+	return _pmbus_write_word_data(client, page,
+				      pmbus_fan_command_registers[id], command);
+}
+EXPORT_SYMBOL_GPL(pmbus_update_fan);
+
 int pmbus_read_word_data(struct i2c_client *client, int page, u8 reg)
 {
 	int rv;
@@ -230,6 +301,24 @@ int pmbus_read_word_data(struct i2c_client *client, int page, u8 reg)
 }
 EXPORT_SYMBOL_GPL(pmbus_read_word_data);
 
+static int pmbus_read_virt_reg(struct i2c_client *client, int page, int reg)
+{
+	int rv;
+	int id;
+
+	switch (reg) {
+	case PMBUS_VIRT_FAN_TARGET_1 ... PMBUS_VIRT_FAN_TARGET_4:
+		id = reg - PMBUS_VIRT_FAN_TARGET_1;
+		rv = pmbus_get_fan_rate_device(client, page, id, rpm);
+		break;
+	default:
+		rv = -ENXIO;
+		break;
+	}
+
+	return rv;
+}
+
 /*
  * _pmbus_read_word_data() is similar to pmbus_read_word_data(), but checks if
  * a device specific mapping function exists and calls it if necessary.
@@ -245,8 +334,10 @@ static int _pmbus_read_word_data(struct i2c_client *client, int page, int reg)
 		if (status != -ENODATA)
 			return status;
 	}
+
 	if (reg >= PMBUS_VIRT_BASE)
-		return -ENXIO;
+		return pmbus_read_virt_reg(client, page, reg);
+
 	return pmbus_read_word_data(client, page, reg);
 }
 
@@ -311,6 +402,66 @@ static int _pmbus_read_byte_data(struct i2c_client *client, int page, int reg)
 	return pmbus_read_byte_data(client, page, reg);
 }
 
+static struct pmbus_sensor *pmbus_find_sensor(struct pmbus_data *data, int page,
+					      int reg)
+{
+	struct pmbus_sensor *sensor;
+
+	for (sensor = data->sensors; sensor; sensor = sensor->next) {
+		if (sensor->page == page && sensor->reg == reg)
+			return sensor;
+	}
+
+	return NULL;
+}
+
+static int pmbus_get_fan_rate(struct i2c_client *client, int page, int id,
+			      enum pmbus_fan_mode mode,
+			      bool from_cache)
+{
+	struct pmbus_data *data = i2c_get_clientdata(client);
+	bool want_rpm, have_rpm;
+	struct pmbus_sensor *s;
+	int config;
+	int reg;
+
+	want_rpm = (mode == rpm);
+
+	if (from_cache) {
+		reg = want_rpm ? PMBUS_VIRT_FAN_TARGET_1 : PMBUS_VIRT_PWM_1;
+		s = pmbus_find_sensor(data, page, reg + id);
+
+		return s->data;
+	}
+
+	config = pmbus_read_byte_data(client, page,
+				      pmbus_fan_config_registers[id]);
+	if (config < 0)
+		return config;
+
+	have_rpm = !!(config & pmbus_fan_rpm_mask[id]);
+	if (want_rpm == have_rpm)
+		return pmbus_read_word_data(client, page,
+					    pmbus_fan_command_registers[id]);
+
+	/* Can't sensibly map between RPM and PWM, just return zero */
+	return 0;
+}
+
+int pmbus_get_fan_rate_device(struct i2c_client *client, int page, int id,
+			      enum pmbus_fan_mode mode)
+{
+	return pmbus_get_fan_rate(client, page, id, mode, false);
+}
+EXPORT_SYMBOL_GPL(pmbus_get_fan_rate_device);
+
+int pmbus_get_fan_rate_cached(struct i2c_client *client, int page, int id,
+			      enum pmbus_fan_mode mode)
+{
+	return pmbus_get_fan_rate(client, page, id, mode, true);
+}
+EXPORT_SYMBOL_GPL(pmbus_get_fan_rate_cached);
+
 static void pmbus_clear_fault_page(struct i2c_client *client, int page)
 {
 	_pmbus_write_byte(client, page, PMBUS_CLEAR_FAULTS);
@@ -512,7 +663,7 @@ static long pmbus_reg2data_direct(struct pmbus_data *data,
 	/* X = 1/m * (Y * 10^-R - b) */
 	R = -R;
 	/* scale result to milli-units for everything but fans */
-	if (sensor->class != PSC_FAN) {
+	if (!(sensor->class == PSC_FAN || sensor->class == PSC_PWM)) {
 		R += 3;
 		b *= 1000;
 	}
@@ -566,6 +717,9 @@ static long pmbus_reg2data(struct pmbus_data *data, struct pmbus_sensor *sensor)
 {
 	long val;
 
+	if (!sensor->convert)
+		return sensor->data;
+
 	switch (data->info->format[sensor->class]) {
 	case direct:
 		val = pmbus_reg2data_direct(data, sensor);
@@ -669,7 +823,7 @@ static u16 pmbus_data2reg_direct(struct pmbus_data *data,
 	}
 
 	/* Calculate Y = (m * X + b) * 10^R */
-	if (sensor->class != PSC_FAN) {
+	if (!(sensor->class == PSC_FAN || sensor->class == PSC_PWM)) {
 		R -= 3;		/* Adjust R and b for data in milli-units */
 		b *= 1000;
 	}
@@ -700,6 +854,9 @@ static u16 pmbus_data2reg(struct pmbus_data *data,
 {
 	u16 regval;
 
+	if (!sensor->convert)
+		return val;
+
 	switch (data->info->format[sensor->class]) {
 	case direct:
 		regval = pmbus_data2reg_direct(data, sensor, val);
@@ -912,7 +1069,8 @@ static struct pmbus_sensor *pmbus_add_sensor(struct pmbus_data *data,
 					     const char *name, const char *type,
 					     int seq, int page, int reg,
 					     enum pmbus_sensor_classes class,
-					     bool update, bool readonly)
+					     bool update, bool readonly,
+					     bool convert)
 {
 	struct pmbus_sensor *sensor;
 	struct device_attribute *a;
@@ -922,12 +1080,18 @@ static struct pmbus_sensor *pmbus_add_sensor(struct pmbus_data *data,
 		return NULL;
 	a = &sensor->attribute;
 
-	snprintf(sensor->name, sizeof(sensor->name), "%s%d_%s",
-		 name, seq, type);
+	if (type)
+		snprintf(sensor->name, sizeof(sensor->name), "%s%d_%s",
+			 name, seq, type);
+	else
+		snprintf(sensor->name, sizeof(sensor->name), "%s%d",
+			 name, seq);
+
 	sensor->page = page;
 	sensor->reg = reg;
 	sensor->class = class;
 	sensor->update = update;
+	sensor->convert = convert;
 	pmbus_dev_attr_init(a, sensor->name,
 			    readonly ? S_IRUGO : S_IRUGO | S_IWUSR,
 			    pmbus_show_sensor, pmbus_set_sensor);
@@ -1026,7 +1190,7 @@ static int pmbus_add_limit_attrs(struct i2c_client *client,
 			curr = pmbus_add_sensor(data, name, l->attr, index,
 						page, l->reg, attr->class,
 						attr->update || l->update,
-						false);
+						false, true);
 			if (!curr)
 				return -ENOMEM;
 			if (l->sbit && (info->func[page] & attr->sfunc)) {
@@ -1065,7 +1229,7 @@ static int pmbus_add_sensor_attrs_one(struct i2c_client *client,
 			return ret;
 	}
 	base = pmbus_add_sensor(data, name, "input", index, page, attr->reg,
-				attr->class, true, true);
+				attr->class, true, true, true);
 	if (!base)
 		return -ENOMEM;
 	if (attr->sfunc) {
@@ -1589,13 +1753,6 @@ static const int pmbus_fan_registers[] = {
 	PMBUS_READ_FAN_SPEED_4
 };
 
-static const int pmbus_fan_config_registers[] = {
-	PMBUS_FAN_CONFIG_12,
-	PMBUS_FAN_CONFIG_12,
-	PMBUS_FAN_CONFIG_34,
-	PMBUS_FAN_CONFIG_34
-};
-
 static const int pmbus_fan_status_registers[] = {
 	PMBUS_STATUS_FAN_12,
 	PMBUS_STATUS_FAN_12,
@@ -1618,6 +1775,46 @@ static const u32 pmbus_fan_status_flags[] = {
 };
 
 /* Fans */
+static int pmbus_add_fan_ctrl(struct i2c_client *client,
+		struct pmbus_data *data, int index, int page, int id,
+		u8 config)
+{
+	struct pmbus_sensor *sensor;
+	int rv;
+
+	rv = _pmbus_read_word_data(client, page,
+				   pmbus_fan_command_registers[id]);
+	if (rv < 0)
+		return rv;
+
+	sensor = pmbus_add_sensor(data, "fan", "target", index, page,
+				  PMBUS_VIRT_FAN_TARGET_1 + id, PSC_FAN,
+				  false, false, true);
+
+	if (!sensor)
+		return -ENOMEM;
+
+	if (!((data->info->func[page] & PMBUS_HAVE_PWM12) ||
+			(data->info->func[page] & PMBUS_HAVE_PWM34)))
+		return 0;
+
+	sensor = pmbus_add_sensor(data, "pwm", NULL, index, page,
+				  PMBUS_VIRT_PWM_1 + id, PSC_PWM,
+				  false, false, true);
+
+	if (!sensor)
+		return -ENOMEM;
+
+	sensor = pmbus_add_sensor(data, "pwm", "enable", index, page,
+				  PMBUS_VIRT_PWM_ENABLE_1 + id, PSC_PWM,
+				  true, false, false);
+
+	if (!sensor)
+		return -ENOMEM;
+
+	return 0;
+}
+
 static int pmbus_add_fan_attributes(struct i2c_client *client,
 				    struct pmbus_data *data)
 {
@@ -1652,9 +1849,18 @@ static int pmbus_add_fan_attributes(struct i2c_client *client,
 
 			if (pmbus_add_sensor(data, "fan", "input", index,
 					     page, pmbus_fan_registers[f],
-					     PSC_FAN, true, true) == NULL)
+					     PSC_FAN, true, true, true) == NULL)
 				return -ENOMEM;
 
+			/* Fan control */
+			if (pmbus_check_word_register(client, page,
+					pmbus_fan_command_registers[f])) {
+				ret = pmbus_add_fan_ctrl(client, data, index,
+							 page, f, regval);
+				if (ret < 0)
+					return ret;
+			}
+
 			/*
 			 * Each fan status register covers multiple fans,
 			 * so we have to do some magic.
-- 
git-series 0.9.1
