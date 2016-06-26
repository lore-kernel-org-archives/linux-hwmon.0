Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Jean Delvare <jdelvare@suse.com>
Cc: Nishanth Menon <nm@ti.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 5/5] hwmon: (tmp102) Convert to use regmap, and drop local cache
Date: Sat, 25 Jun 2016 19:40:25 -0700
Message-Id: <1466908825-14222-5-git-send-email-linux@roeck-us.net>
In-Reply-To: <1466908825-14222-1-git-send-email-linux@roeck-us.net>
References: <1466908825-14222-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

By concerting the driver to regmap, we can use regmap to cache non-volatile
registers. Stop caching the temperature register; while potentially reading
it more often can result in reading it more often than necessary, this is
offset by the gain due to not re-reading the limit registers.

Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Set use_single_rw to indicate that the chip can not perform
    read operations crossing register boundaries.
    Use REGCACHE_RBTREE instead REGCACHE_FLAT. REGCACHE_FLAT does not
    initialize the cache from the chip unless num_reg_defaults_raw is
    provided. If it is provided without actual cache values, it complains
    with 'No cache defaults, reading back from HW'. REGCACHE_RBTREE
    automatically initializes register values from the chip if no
    defaults are provided, and does not complain about it.

Note: I'll drop the Cc: to Mark later.

 drivers/hwmon/tmp102.c | 156 +++++++++++++++++++++++++------------------------
 1 file changed, 79 insertions(+), 77 deletions(-)

diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
index 487b4ef5992c..e4a2314a2c49 100644
--- a/drivers/hwmon/tmp102.c
+++ b/drivers/hwmon/tmp102.c
@@ -24,6 +24,7 @@
 #include <linux/mutex.h>
 #include <linux/device.h>
 #include <linux/jiffies.h>
+#include <linux/regmap.h>
 #include <linux/thermal.h>
 #include <linux/of.h>
 
@@ -61,13 +62,9 @@
 #define CONVERSION_TIME_MS		35	/* in milli-seconds */
 
 struct tmp102 {
-	struct i2c_client *client;
-	struct mutex lock;
+	struct regmap *regmap;
 	u16 config_orig;
-	unsigned long last_update;
 	unsigned long ready_time;
-	bool valid;
-	int temp[3];
 };
 
 /* convert left adjusted 13-bit TMP102 register value to milliCelsius */
@@ -82,16 +79,11 @@ static inline u16 tmp102_mC_to_reg(int val)
 	return (val * 128) / 1000;
 }
 
-static const u8 tmp102_reg[] = {
-	TMP102_TEMP_REG,
-	TMP102_TLOW_REG,
-	TMP102_THIGH_REG,
-};
-
-static struct tmp102 *tmp102_update_device(struct device *dev)
+static int tmp102_read_temp(void *dev, int *temp)
 {
 	struct tmp102 *tmp102 = dev_get_drvdata(dev);
-	struct i2c_client *client = tmp102->client;
+	unsigned int reg;
+	int ret;
 
 	/* Is it too early to return a conversion ? */
 	if (time_before(jiffies, tmp102->ready_time)) {
@@ -100,28 +92,11 @@ static struct tmp102 *tmp102_update_device(struct device *dev)
 		msleep(jiffies_to_msecs(sleeptime));
 	}
 
-	mutex_lock(&tmp102->lock);
-	if (!tmp102->valid ||
-	    time_after(jiffies, tmp102->last_update + HZ / 3)) {
-		int i;
-		for (i = 0; i < ARRAY_SIZE(tmp102->temp); ++i) {
-			int status = i2c_smbus_read_word_swapped(client,
-								 tmp102_reg[i]);
-			if (status > -1)
-				tmp102->temp[i] = tmp102_reg_to_mC(status);
-		}
-		tmp102->last_update = jiffies;
-		tmp102->valid = true;
-	}
-	mutex_unlock(&tmp102->lock);
-	return tmp102;
-}
-
-static int tmp102_read_temp(void *dev, int *temp)
-{
-	struct tmp102 *tmp102 = tmp102_update_device(dev);
+	ret = regmap_read(tmp102->regmap, TMP102_TEMP_REG, &reg);
+	if (ret < 0)
+		return ret;
 
-	*temp = tmp102->temp[0];
+	*temp = tmp102_reg_to_mC(reg);
 
 	return 0;
 }
@@ -131,9 +106,24 @@ static ssize_t tmp102_show_temp(struct device *dev,
 				char *buf)
 {
 	struct sensor_device_attribute *sda = to_sensor_dev_attr(attr);
-	struct tmp102 *tmp102 = tmp102_update_device(dev);
+	struct tmp102 *tmp102 = dev_get_drvdata(dev);
+	int regaddr = sda->index;
+	unsigned int reg;
+	int err;
+
+	/* Is it too early to return a conversion ? */
+	if (regaddr == TMP102_TEMP_REG &&
+	    time_before(jiffies, tmp102->ready_time)) {
+		unsigned long sleeptime = tmp102->ready_time - jiffies;
+
+		msleep(jiffies_to_msecs(sleeptime));
+	}
+
+	err = regmap_read(tmp102->regmap, regaddr, &reg);
+	if (err < 0)
+		return err;
 
-	return sprintf(buf, "%d\n", tmp102->temp[sda->index]);
+	return sprintf(buf, "%d\n", tmp102_reg_to_mC(reg));
 }
 
 static ssize_t tmp102_set_temp(struct device *dev,
@@ -142,29 +132,26 @@ static ssize_t tmp102_set_temp(struct device *dev,
 {
 	struct sensor_device_attribute *sda = to_sensor_dev_attr(attr);
 	struct tmp102 *tmp102 = dev_get_drvdata(dev);
-	struct i2c_client *client = tmp102->client;
+	int reg = sda->index;
 	long val;
-	int status;
+	int err;
 
 	if (kstrtol(buf, 10, &val) < 0)
 		return -EINVAL;
 	val = clamp_val(val, -256000, 255000);
 
-	mutex_lock(&tmp102->lock);
-	tmp102->temp[sda->index] = val;
-	status = i2c_smbus_write_word_swapped(client, tmp102_reg[sda->index],
-					      tmp102_mC_to_reg(val));
-	mutex_unlock(&tmp102->lock);
-	return status ? : count;
+	err = regmap_write(tmp102->regmap, reg, tmp102_mC_to_reg(val));
+	return err ? : count;
 }
 
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, tmp102_show_temp, NULL , 0);
+static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, tmp102_show_temp, NULL,
+			  TMP102_TEMP_REG);
 
 static SENSOR_DEVICE_ATTR(temp1_max_hyst, S_IWUSR | S_IRUGO, tmp102_show_temp,
-			  tmp102_set_temp, 1);
+			  tmp102_set_temp, TMP102_TLOW_REG);
 
 static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO, tmp102_show_temp,
-			  tmp102_set_temp, 2);
+			  tmp102_set_temp, TMP102_THIGH_REG);
 
 static struct attribute *tmp102_attrs[] = {
 	&sensor_dev_attr_temp1_input.dev_attr.attr,
@@ -181,19 +168,39 @@ static const struct thermal_zone_of_device_ops tmp102_of_thermal_ops = {
 static void tmp102_restore_config(void *data)
 {
 	struct tmp102 *tmp102 = data;
-	struct i2c_client *client = tmp102->client;
 
-	i2c_smbus_write_word_swapped(client, TMP102_CONF_REG,
-				     tmp102->config_orig);
+	regmap_write(tmp102->regmap, TMP102_CONF_REG, tmp102->config_orig);
+}
+
+static bool tmp102_is_writeable_reg(struct device *dev, unsigned int reg)
+{
+	return reg != TMP102_TEMP_REG;
+}
+
+static bool tmp102_is_volatile_reg(struct device *dev, unsigned int reg)
+{
+	return reg == TMP102_TEMP_REG;
 }
 
+static const struct regmap_config tmp102_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 16,
+	.max_register = TMP102_THIGH_REG,
+	.writeable_reg = tmp102_is_writeable_reg,
+	.volatile_reg = tmp102_is_volatile_reg,
+	.val_format_endian = REGMAP_ENDIAN_BIG,
+	.cache_type = REGCACHE_RBTREE,
+	.use_single_rw = true,
+};
+
 static int tmp102_probe(struct i2c_client *client,
 				  const struct i2c_device_id *id)
 {
 	struct device *dev = &client->dev;
 	struct device *hwmon_dev;
 	struct tmp102 *tmp102;
-	int status;
+	unsigned int regval;
+	int err;
 
 	if (!i2c_check_functionality(client->adapter,
 				     I2C_FUNC_SMBUS_WORD_DATA)) {
@@ -207,35 +214,36 @@ static int tmp102_probe(struct i2c_client *client,
 		return -ENOMEM;
 
 	i2c_set_clientdata(client, tmp102);
-	tmp102->client = client;
 
-	status = i2c_smbus_read_word_swapped(client, TMP102_CONF_REG);
-	if (status < 0) {
+	tmp102->regmap = devm_regmap_init_i2c(client, &tmp102_regmap_config);
+	if (IS_ERR(tmp102->regmap))
+		return PTR_ERR(tmp102->regmap);
+
+	err = regmap_read(tmp102->regmap, TMP102_CONF_REG, &regval);
+	if (err < 0) {
 		dev_err(dev, "error reading config register\n");
-		return status;
+		return err;
 	}
 
-	if ((status & ~TMP102_CONFREG_MASK) !=
+	if ((regval & ~TMP102_CONFREG_MASK) !=
 	    (TMP102_CONF_R0 | TMP102_CONF_R1)) {
 		dev_err(dev, "unexpected config register value\n");
 		return -ENODEV;
 	}
 
-	tmp102->config_orig = status;
+	tmp102->config_orig = regval;
 
 	devm_add_action(dev, tmp102_restore_config, tmp102);
 
-	status &= ~TMP102_CONFIG_CLEAR;
-	status |= TMP102_CONFIG_SET;
+	regval &= ~TMP102_CONFIG_CLEAR;
+	regval |= TMP102_CONFIG_SET;
 
-	status = i2c_smbus_write_word_swapped(client, TMP102_CONF_REG, status);
-	if (status < 0) {
+	err = regmap_write(tmp102->regmap, TMP102_CONF_REG, regval);
+	if (err < 0) {
 		dev_err(dev, "error writing config register\n");
-		return status;
+		return err;
 	}
 
-	mutex_init(&tmp102->lock);
-
 	tmp102->ready_time = jiffies;
 	if (tmp102->config_orig & TMP102_CONF_SD) {
 		/*
@@ -264,30 +272,24 @@ static int tmp102_probe(struct i2c_client *client,
 static int tmp102_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
-	int config;
-
-	config = i2c_smbus_read_word_swapped(client, TMP102_CONF_REG);
-	if (config < 0)
-		return config;
+	struct tmp102 *tmp102 = i2c_get_clientdata(client);
 
-	config |= TMP102_CONF_SD;
-	return i2c_smbus_write_word_swapped(client, TMP102_CONF_REG, config);
+	return regmap_update_bits(tmp102->regmap, TMP102_CONF_REG,
+				  TMP102_CONF_SD, TMP102_CONF_SD);
 }
 
 static int tmp102_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct tmp102 *tmp102 = i2c_get_clientdata(client);
-	int config;
+	int err;
 
-	config = i2c_smbus_read_word_swapped(client, TMP102_CONF_REG);
-	if (config < 0)
-		return config;
+	err = regmap_update_bits(tmp102->regmap, TMP102_CONF_REG,
+				 TMP102_CONF_SD, 0);
 
 	tmp102->ready_time = jiffies + msecs_to_jiffies(CONVERSION_TIME_MS);
 
-	config &= ~TMP102_CONF_SD;
-	return i2c_smbus_write_word_swapped(client, TMP102_CONF_REG, config);
+	return err;
 }
 #endif /* CONFIG_PM */
 
-- 
2.5.0
