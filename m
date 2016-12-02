Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:33652 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753253AbcLBCdY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Dec 2016 21:33:24 -0500
Received: by mail-pg0-f66.google.com with SMTP id 3so6367375pgd.0
        for <linux-hwmon@vger.kernel.org>; Thu, 01 Dec 2016 18:33:24 -0800 (PST)
From: John Muir <john@jmuir.com>
To: Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: John Muir <john@jmuir.com>, John Muir <muirj@google.com>,
        Anatol Pomazau <anatol@google.com>
Subject: [PATCH v3 1/2] hwmon: Add Texas Instruments TMP108 temperature sensor driver.
Date: Thu,  1 Dec 2016 18:32:41 -0800
Message-Id: <1480645962-55584-2-git-send-email-john@jmuir.com>
In-Reply-To: <1480645962-55584-1-git-send-email-john@jmuir.com>
References: <1480538179-75901-1-git-send-email-john@jmuir.com>
 <1480645962-55584-1-git-send-email-john@jmuir.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Add support for the TI TMP108 temperature sensor with some device
configuration parameters.

Signed-off-by: John Muir <john@jmuir.com>
---
 Documentation/hwmon/tmp108 |  36 ++++
 drivers/hwmon/Kconfig      |  11 ++
 drivers/hwmon/Makefile     |   1 +
 drivers/hwmon/tmp108.c     | 466 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 514 insertions(+)
 create mode 100644 Documentation/hwmon/tmp108
 create mode 100644 drivers/hwmon/tmp108.c

diff --git a/Documentation/hwmon/tmp108 b/Documentation/hwmon/tmp108
new file mode 100644
index 0000000..25802df
--- /dev/null
+++ b/Documentation/hwmon/tmp108
@@ -0,0 +1,36 @@
+Kernel driver tmp108
+====================
+
+Supported chips:
+  * Texas Instruments TMP108
+    Prefix: 'tmp108'
+    Addresses scanned: none
+    Datasheet: http://www.ti.com/product/tmp108
+
+Author:
+	John Muir <john@jmuir.com>
+
+Description
+-----------
+
+The Texas Instruments TMP108 implements one temperature sensor. An alert pin
+can be set when temperatures exceed minimum or maximum values plus or minus a
+hysteresis value. (This driver does not support interrupts for the alert pin,
+and the device runs in comparator mode.)
+
+The sensor is accurate to 0.75C over the range of -25 to +85 C, and to 1.0
+degree from -40 to +125 C. Resolution of the sensor is 0.0625 degree. The
+operating temperature has a minimum of -55 C and a maximum of +150 C.
+Hysteresis values can be set to 0, 1, 2, or 4C.
+
+The TMP108 has a programmable update rate that can select between 8, 4, 1, and
+0.5 Hz.
+
+By default the TMP108 reads the temperature continuously. To conserve power,
+the TMP108 has a one-shot mode where the device is normally shut-down. When a
+one shot is requested the temperature is read, the result can be retrieved,
+and then the device is shut down automatically. (This driver only supports
+continuous mode.)
+
+The driver provides the common sysfs-interface for temperatures (see
+Documentation/hwmon/sysfs-interface under Temperatures).
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 45cef3d..4c173de 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1591,6 +1591,17 @@ config SENSORS_TMP103
 	  This driver can also be built as a module.  If so, the module
 	  will be called tmp103.
 
+config SENSORS_TMP108
+	tristate "Texas Instruments TMP108"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  If you say yes here you get support for Texas Instruments TMP108
+	  sensor chips.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called tmp108.
+
 config SENSORS_TMP401
 	tristate "Texas Instruments TMP401 and compatibles"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index aecf4ba..51e5256 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -152,6 +152,7 @@ obj-$(CONFIG_SENSORS_TC74)	+= tc74.o
 obj-$(CONFIG_SENSORS_THMC50)	+= thmc50.o
 obj-$(CONFIG_SENSORS_TMP102)	+= tmp102.o
 obj-$(CONFIG_SENSORS_TMP103)	+= tmp103.o
+obj-$(CONFIG_SENSORS_TMP108)	+= tmp108.o
 obj-$(CONFIG_SENSORS_TMP401)	+= tmp401.o
 obj-$(CONFIG_SENSORS_TMP421)	+= tmp421.o
 obj-$(CONFIG_SENSORS_TWL4030_MADC)+= twl4030-madc-hwmon.o
diff --git a/drivers/hwmon/tmp108.c b/drivers/hwmon/tmp108.c
new file mode 100644
index 0000000..895ae82
--- /dev/null
+++ b/drivers/hwmon/tmp108.c
@@ -0,0 +1,466 @@
+/* Texas Instruments TMP108 SMBus temperature sensor driver
+ *
+ * Copyright (C) 2016 John Muir <john@jmuir.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/jiffies.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+#define	DRIVER_NAME "tmp108"
+
+#define	TMP108_REG_TEMP		0x00
+#define	TMP108_REG_CONF		0x01
+#define	TMP108_REG_TLOW		0x02
+#define	TMP108_REG_THIGH	0x03
+
+#define TMP108_TEMP_MIN_MC	-50000 /* Minimum millicelcius. */
+#define TMP108_TEMP_MAX_MC	127937 /* Maximum millicelcius. */
+
+/* Configuration register bits.
+ * Note: these bit definitions are byte swapped.
+ */
+#define TMP108_CONF_M0		0x0100 /* Sensor mode. */
+#define TMP108_CONF_M1		0x0200
+#define TMP108_CONF_TM		0x0400 /* Thermostat mode. */
+#define TMP108_CONF_FL		0x0800 /* Watchdog flag - TLOW */
+#define TMP108_CONF_FH		0x1000 /* Watchdog flag - THIGH */
+#define TMP108_CONF_CR0		0x2000 /* Conversion rate. */
+#define TMP108_CONF_CR1		0x4000
+#define TMP108_CONF_ID		0x8000
+#define TMP108_CONF_HYS0	0x0010 /* Hysteresis. */
+#define TMP108_CONF_HYS1	0x0020
+#define TMP108_CONF_POL		0x0080 /* Polarity of alert. */
+
+/* Defaults set by the hardware upon reset. */
+#define TMP108_CONF_DEFAULTS		(TMP108_CONF_CR0 | TMP108_CONF_TM |\
+					 TMP108_CONF_HYS0 | TMP108_CONF_M1)
+/* These bits are read-only. */
+#define TMP108_CONF_READ_ONLY		(TMP108_CONF_FL | TMP108_CONF_FH |\
+					 TMP108_CONF_ID)
+
+#define TMP108_CONF_MODE_MASK		(TMP108_CONF_M0|TMP108_CONF_M1)
+#define TMP108_MODE_SHUTDOWN		0x0000
+#define TMP108_MODE_ONE_SHOT		TMP108_CONF_M0
+#define TMP108_MODE_CONTINUOUS		TMP108_CONF_M1		/* Default */
+					/* When M1 is set, M0 is ignored. */
+
+#define TMP108_CONF_CONVRATE_MASK	(TMP108_CONF_CR0|TMP108_CONF_CR1)
+#define TMP108_CONVRATE_0P25HZ		0x0000
+#define TMP108_CONVRATE_1HZ		TMP108_CONF_CR0		/* Default */
+#define TMP108_CONVRATE_4HZ		TMP108_CONF_CR1
+#define TMP108_CONVRATE_16HZ		(TMP108_CONF_CR0|TMP108_CONF_CR1)
+
+#define TMP108_CONF_HYSTERESIS_MASK	(TMP108_CONF_HYS0|TMP108_CONF_HYS1)
+#define TMP108_HYSTERESIS_0C		0x0000
+#define TMP108_HYSTERESIS_1C		TMP108_CONF_HYS0	/* Default */
+#define TMP108_HYSTERESIS_2C		TMP108_CONF_HYS1
+#define TMP108_HYSTERESIS_4C		(TMP108_CONF_HYS0|TMP108_CONF_HYS1)
+
+#define TMP108_CONVERSION_TIME_MS	30	/* in milli-seconds */
+
+struct tmp108 {
+	struct regmap *regmap;
+	u16 orig_config;
+	unsigned long ready_time;
+};
+
+/* convert 12-bit TMP108 register value to milliCelsius */
+static inline int tmp108_temp_reg_to_mC(s16 val)
+{
+	return (val & ~0x0f) * 1000 / 256;
+}
+
+/* convert milliCelsius to left adjusted 12-bit TMP108 register value */
+static inline u16 tmp108_mC_to_temp_reg(int val)
+{
+	return (val * 256) / 1000;
+}
+
+static int tmp108_read(struct device *dev, enum hwmon_sensor_types type,
+		       u32 attr, int channel, long *temp)
+{
+	struct tmp108 *tmp108 = dev_get_drvdata(dev);
+	unsigned int regval;
+	int err, hyst;
+
+	if (type == hwmon_chip) {
+		if (attr == hwmon_chip_update_interval) {
+			err = regmap_read(tmp108->regmap, TMP108_REG_CONF,
+					  &regval);
+			if (err < 0)
+				return err;
+			switch (regval & TMP108_CONF_CONVRATE_MASK) {
+			case TMP108_CONVRATE_0P25HZ:
+			default:
+				*temp = 4000;
+				break;
+			case TMP108_CONVRATE_1HZ:
+				*temp = 1000;
+				break;
+			case TMP108_CONVRATE_4HZ:
+				*temp = 250;
+				break;
+			case TMP108_CONVRATE_16HZ:
+				*temp = 63;
+				break;
+			}
+			return 0;
+		}
+		return -EOPNOTSUPP;
+	}
+
+	switch (attr) {
+	case hwmon_temp_input:
+		/* Is it too early to return a conversion ? */
+		if (time_before(jiffies, tmp108->ready_time)) {
+			dev_dbg(dev, "%s: Conversion not ready yet..\n",
+				__func__);
+			return -EAGAIN;
+		}
+		err = regmap_read(tmp108->regmap, TMP108_REG_TEMP, &regval);
+		if (err < 0)
+			return err;
+		*temp = tmp108_temp_reg_to_mC(regval);
+		break;
+	case hwmon_temp_min:
+	case hwmon_temp_max:
+		err = regmap_read(tmp108->regmap, attr == hwmon_temp_min ?
+				  TMP108_REG_TLOW : TMP108_REG_THIGH, &regval);
+		if (err < 0)
+			return err;
+		*temp = tmp108_temp_reg_to_mC(regval);
+		break;
+	case hwmon_temp_min_alarm:
+	case hwmon_temp_max_alarm:
+		err = regmap_read(tmp108->regmap, TMP108_REG_CONF, &regval);
+		if (err < 0)
+			return err;
+		*temp = !!(regval & (attr == hwmon_temp_min_alarm ?
+				     TMP108_CONF_FL : TMP108_CONF_FH));
+		break;
+	case hwmon_temp_min_hyst:
+	case hwmon_temp_max_hyst:
+		err = regmap_read(tmp108->regmap, TMP108_REG_CONF, &regval);
+		if (err < 0)
+			return err;
+		switch (regval & TMP108_CONF_HYSTERESIS_MASK) {
+		case TMP108_HYSTERESIS_0C:
+		default:
+			hyst = 0;
+			break;
+		case TMP108_HYSTERESIS_1C:
+			hyst = 1000;
+			break;
+		case TMP108_HYSTERESIS_2C:
+			hyst = 2000;
+			break;
+		case TMP108_HYSTERESIS_4C:
+			hyst = 4000;
+			break;
+		}
+		err = regmap_read(tmp108->regmap, attr == hwmon_temp_min_hyst ?
+				  TMP108_REG_TLOW : TMP108_REG_THIGH, &regval);
+		if (err < 0)
+			return err;
+		*temp = tmp108_temp_reg_to_mC(regval);
+		if (attr == hwmon_temp_min_hyst)
+			*temp += hyst;
+		else
+			*temp -= hyst;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int tmp108_write(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long temp)
+{
+	struct tmp108 *tmp108 = dev_get_drvdata(dev);
+	u32 regval, mask;
+	int err;
+
+	if (type == hwmon_chip) {
+		if (attr == hwmon_chip_update_interval) {
+			if (temp < 156)
+				mask = TMP108_CONVRATE_16HZ;
+			else if (temp < 625)
+				mask = TMP108_CONVRATE_4HZ;
+			else if (temp < 2500)
+				mask = TMP108_CONVRATE_1HZ;
+			else
+				mask = TMP108_CONVRATE_0P25HZ;
+			return regmap_update_bits(tmp108->regmap,
+						  TMP108_REG_CONF,
+						  TMP108_CONF_CONVRATE_MASK,
+						  mask);
+		}
+		return -EOPNOTSUPP;
+	}
+
+	switch (attr) {
+	case hwmon_temp_min:
+	case hwmon_temp_max:
+		temp = clamp_val(temp, TMP108_TEMP_MIN_MC, TMP108_TEMP_MAX_MC);
+		return regmap_write(tmp108->regmap,
+				    attr == hwmon_temp_min ?
+					TMP108_REG_TLOW : TMP108_REG_THIGH,
+				    tmp108_mC_to_temp_reg(temp));
+	case hwmon_temp_min_hyst:
+	case hwmon_temp_max_hyst:
+		temp = clamp_val(temp, TMP108_TEMP_MIN_MC, TMP108_TEMP_MAX_MC);
+		err = regmap_read(tmp108->regmap,
+				  attr == hwmon_temp_min_hyst ?
+					TMP108_REG_TLOW : TMP108_REG_THIGH,
+				  &regval);
+		if (err < 0)
+			return err;
+		if (attr == hwmon_temp_min_hyst)
+			temp -= tmp108_temp_reg_to_mC(regval);
+		else
+			temp = tmp108_temp_reg_to_mC(regval) - temp;
+		if (temp < 500)
+			mask = TMP108_HYSTERESIS_0C;
+		else if (temp < 1500)
+			mask = TMP108_HYSTERESIS_1C;
+		else if (temp < 3000)
+			mask = TMP108_HYSTERESIS_2C;
+		else
+			mask = TMP108_HYSTERESIS_4C;
+		return regmap_update_bits(tmp108->regmap, TMP108_REG_CONF,
+					  TMP108_CONF_HYSTERESIS_MASK, mask);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static umode_t tmp108_is_visible(const void *data, enum hwmon_sensor_types type,
+				 u32 attr, int channel)
+{
+	if (type == hwmon_chip && attr == hwmon_chip_update_interval)
+		return 0644;
+
+	if (type != hwmon_temp)
+		return 0;
+
+	switch (attr) {
+	case hwmon_temp_input:
+	case hwmon_temp_min_alarm:
+	case hwmon_temp_max_alarm:
+		return 0444;
+	case hwmon_temp_min:
+	case hwmon_temp_max:
+	case hwmon_temp_min_hyst:
+	case hwmon_temp_max_hyst:
+		return 0644;
+	default:
+		return 0;
+	}
+}
+
+static u32 tmp108_chip_config[] = {
+	HWMON_C_REGISTER_TZ | HWMON_C_UPDATE_INTERVAL,
+	0
+};
+
+static const struct hwmon_channel_info tmp108_chip = {
+	.type = hwmon_chip,
+	.config = tmp108_chip_config,
+};
+
+static u32 tmp108_temp_config[] = {
+	HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN | HWMON_T_MIN_HYST
+		| HWMON_T_MAX_HYST | HWMON_T_MIN_ALARM | HWMON_T_MAX_ALARM,
+	0
+};
+
+static const struct hwmon_channel_info tmp108_temp = {
+	.type = hwmon_temp,
+	.config = tmp108_temp_config,
+};
+
+static const struct hwmon_channel_info *tmp108_info[] = {
+	&tmp108_chip,
+	&tmp108_temp,
+	NULL
+};
+
+static const struct hwmon_ops tmp108_hwmon_ops = {
+	.is_visible = tmp108_is_visible,
+	.read = tmp108_read,
+	.write = tmp108_write,
+};
+
+static const struct hwmon_chip_info tmp108_chip_info = {
+	.ops = &tmp108_hwmon_ops,
+	.info = tmp108_info,
+};
+
+static void tmp108_restore_config(void *data)
+{
+	struct tmp108 *tmp108 = data;
+
+	regmap_write(tmp108->regmap, TMP108_REG_CONF, tmp108->orig_config);
+}
+
+static bool tmp108_is_writeable_reg(struct device *dev, unsigned int reg)
+{
+	return reg != TMP108_REG_TEMP;
+}
+
+static bool tmp108_is_volatile_reg(struct device *dev, unsigned int reg)
+{
+	/* Configuration register must be volatile to enable FL and FH. */
+	return reg == TMP108_REG_TEMP || reg == TMP108_REG_CONF;
+}
+
+static const struct regmap_config tmp108_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 16,
+	.max_register = TMP108_REG_THIGH,
+	.writeable_reg = tmp108_is_writeable_reg,
+	.volatile_reg = tmp108_is_volatile_reg,
+	.val_format_endian = REGMAP_ENDIAN_BIG,
+	.cache_type = REGCACHE_RBTREE,
+	.use_single_rw = true,
+};
+
+static int tmp108_probe(struct i2c_client *client,
+			const struct i2c_device_id *id)
+{
+	struct device *dev = &client->dev;
+	struct device *hwmon_dev;
+	struct tmp108 *tmp108;
+	int err;
+	u32 config;
+
+	if (!i2c_check_functionality(client->adapter,
+				     I2C_FUNC_SMBUS_WORD_DATA)) {
+		dev_err(dev,
+			"adapter doesn't support SMBus word transactions\n");
+		return -ENODEV;
+	}
+
+	tmp108 = devm_kzalloc(dev, sizeof(*tmp108), GFP_KERNEL);
+	if (!tmp108)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, tmp108);
+
+	tmp108->regmap = devm_regmap_init_i2c(client, &tmp108_regmap_config);
+	if (IS_ERR(tmp108->regmap)) {
+		err = PTR_ERR(tmp108->regmap);
+		dev_err(dev, "regmap init failed: %d", err);
+		return err;
+	}
+
+	err = regmap_read(tmp108->regmap, TMP108_REG_CONF, &config);
+	if (err < 0) {
+		dev_err(dev, "error reading config register: %d", err);
+		return err;
+	}
+	tmp108->orig_config = config;
+
+	/* Only continuous mode is supported. */
+	config &= ~TMP108_CONF_MODE_MASK;
+	config |= TMP108_MODE_CONTINUOUS;
+
+	/* Only comparator mode is supported. */
+	config &= ~TMP108_CONF_TM;
+
+	err = regmap_write(tmp108->regmap, TMP108_REG_CONF, config);
+	if (err < 0) {
+		dev_err(dev, "error writing config register: %d", err);
+		return err;
+	}
+
+	tmp108->ready_time = jiffies;
+	if ((tmp108->orig_config & TMP108_CONF_MODE_MASK) ==
+	    TMP108_MODE_SHUTDOWN)
+		tmp108->ready_time +=
+			msecs_to_jiffies(TMP108_CONVERSION_TIME_MS);
+
+	err = devm_add_action_or_reset(dev, tmp108_restore_config, tmp108);
+	if (err) {
+		dev_err(dev, "add action or reset failed: %d", err);
+		return err;
+	}
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
+							 tmp108,
+							 &tmp108_chip_info,
+							 NULL);
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static int __maybe_unused tmp108_suspend(struct device *dev)
+{
+	struct tmp108 *tmp108 = dev_get_drvdata(dev);
+
+	return regmap_update_bits(tmp108->regmap, TMP108_REG_CONF,
+				  TMP108_CONF_MODE_MASK, TMP108_MODE_SHUTDOWN);
+}
+
+static int __maybe_unused tmp108_resume(struct device *dev)
+{
+	struct tmp108 *tmp108 = dev_get_drvdata(dev);
+	int err;
+
+	err = regmap_update_bits(tmp108->regmap, TMP108_REG_CONF,
+				 TMP108_CONF_MODE_MASK, TMP108_MODE_CONTINUOUS);
+	tmp108->ready_time = jiffies +
+			     msecs_to_jiffies(TMP108_CONVERSION_TIME_MS);
+	return err;
+}
+
+static SIMPLE_DEV_PM_OPS(tmp108_dev_pm_ops, tmp108_suspend, tmp108_resume);
+
+static const struct i2c_device_id tmp108_i2c_ids[] = {
+	{ "tmp108", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, tmp108_i2c_ids);
+
+#ifdef CONFIG_OF
+static const struct of_device_id tmp108_of_ids[] = {
+	{ .compatible = "ti,tmp108", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, tmp108_of_ids);
+#endif
+
+static struct i2c_driver tmp108_driver = {
+	.driver.name	= DRIVER_NAME,
+	.driver.pm	= &tmp108_dev_pm_ops,
+	.probe		= tmp108_probe,
+	.id_table	= tmp108_i2c_ids,
+};
+
+module_i2c_driver(tmp108_driver);
+
+MODULE_AUTHOR("John Muir <john@jmuir.com>");
+MODULE_DESCRIPTION("Texas Instruments TMP108 temperature sensor driver");
+MODULE_LICENSE("GPL");
-- 
2.8.0.rc3.226.g39d4020

