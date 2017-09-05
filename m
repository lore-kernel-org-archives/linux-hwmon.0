Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:40220 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1754097AbdIEFhI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 5 Sep 2017 01:37:08 -0400
From: Vadim Pasternak <vadimp@mellanox.com>
To: linux@roeck-us.net, robh+dt@kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v3 1/2] hwmon: (max6621) Add support for Maxim MAX6621 temperature sensor
Date: Tue,  5 Sep 2017 07:34:07 +0000
Message-Id: <1504596848-160952-2-git-send-email-vadimp@mellanox.com>
In-Reply-To: <1504596848-160952-1-git-send-email-vadimp@mellanox.com>
References: <1504596848-160952-1-git-send-email-vadimp@mellanox.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

MAX6621 is a PECI-to-I2C translator provides an efficient, low-cost
solution for PECI-to-SMBus/I2C protocol conversion. It allows reading the
temperature from the PECI-compliant host directly from up to four
PECI-enabled CPUs.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
v2->v3
 Comments pointed out by Guenter:
 - arrange includes in alphabetic order;
 - use regmap for caching the value of temp_offset to have attribute value
   matching hardware value.
 - Add to regmap writable, readable, volatile definitions and add cache
   initialization to probe;
 - have label attribute as RO;
 - change if string layout in max6621_verify_reg_data;
 - change hwmon_temp_alarm to hwmon_temp_crit_alarm;
 - in max6621_read for reading hwmon_temp_crit_alarm set *val to 0 at
   beginning of the case statement to recover from the case, when there is
   no alert, f.e. reading MAX6621_TEMP_ALERT_CAUSE should result in
   MAX6621_ALERT_DIS, which will return error, but alarm should be
   returned as 0 in such case;
 - clear the alert automatically after reading MAX6621_TEMP_ALERT_CAUSE;
 - align clear alert on channels, which report alert temperature.
   It requires access to the same register, but will be aligned with
   the attribute's definitions;
 Fixes added by Vadim:
 - change MIN/MAX temperature defaults to -127000/128000;
 - add initialization of CONFIG1 register;
 v1->v2
 Comments pointed out by Guenter:
 - arrange includes in alphabetic order;
 - add include for bitops.h;
 - remove MAX6621_REG_NON_WRITEABLE_REG;
 - drop temp_min, temp_max, temp_reset_history attributes;
 - remove redundant braces in max6621_verify_reg_data;
 - fix return code in max6621_verify_reg_data;
 - not report channels which are not physically connected;
 - use u32 for regval in max6621_read and max6621_write;
 - provide in temprature offset in milli-degrees C;
 - drop hwmon_temp_fault attribute;
 - drop activation point setting in CONFIG2 reg, leave it for user space;
 Comments pointed out by Jiri:
 - fixe device name;
 Fixes added by Vadim:
 - modify names in max6621_temp_labels;
 - add hwmon_temp_alarm attribute and hwmon_temp_crit attributes per
   socket;
 - fix defines for MIN and MAX temperature;
---
 drivers/hwmon/Kconfig   |  14 ++
 drivers/hwmon/Makefile  |   1 +
 drivers/hwmon/max6621.c | 602 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 617 insertions(+)
 create mode 100644 drivers/hwmon/max6621.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 5b9a61f..325d161 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -855,6 +855,20 @@ tristate "MAX31722 temperature sensor"
 	  This driver can also be built as a module. If so, the module
 	  will be called max31722.
 
+config SENSORS_MAX6621
+	tristate "Maxim MAX6621 sensor chip"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  If you say yes here you get support for MAX6621 sensor chip.
+	  MAX6621 is a PECI-to-I2C translator provides an efficient,
+	  low-cost solution for PECI-to-SMBus/I2C protocol conversion.
+	  It allows reading the temperature from the PECI-compliant
+	  host directly from up to four PECI-enabled CPUs.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called max6621.
+
 config SENSORS_MAX6639
 	tristate "Maxim MAX6639 sensor chip"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index d4641a9..43333cb 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -116,6 +116,7 @@ obj-$(CONFIG_SENSORS_MAX1619)	+= max1619.o
 obj-$(CONFIG_SENSORS_MAX1668)	+= max1668.o
 obj-$(CONFIG_SENSORS_MAX197)	+= max197.o
 obj-$(CONFIG_SENSORS_MAX31722)	+= max31722.o
+obj-$(CONFIG_SENSORS_MAX6621)	+= max6621.o
 obj-$(CONFIG_SENSORS_MAX6639)	+= max6639.o
 obj-$(CONFIG_SENSORS_MAX6642)	+= max6642.o
 obj-$(CONFIG_SENSORS_MAX6650)	+= max6650.o
diff --git a/drivers/hwmon/max6621.c b/drivers/hwmon/max6621.c
new file mode 100644
index 0000000..7c0122a
--- /dev/null
+++ b/drivers/hwmon/max6621.c
@@ -0,0 +1,602 @@
+/*
+ * Hardware monitoring driver for Maxim MAX6621
+ *
+ * Copyright (c) 2017 Mellanox Technologies. All rights reserved.
+ * Copyright (c) 2017 Vadim Pasternak <vadimp@mellanox.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/bitops.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/regmap.h>
+
+#define MAX6621_DRV_NAME		"max6621"
+#define MAX6621_TEMP_INPUT_REG_NUM	9
+#define MAX6621_TEMP_INPUT_MIN		-127000
+#define MAX6621_TEMP_INPUT_MAX		128000
+
+#define MAX6621_TEMP_S0D0_REG		0x00
+#define MAX6621_TEMP_S0D1_REG		0x01
+#define MAX6621_TEMP_S1D0_REG		0x02
+#define MAX6621_TEMP_S1D1_REG		0x03
+#define MAX6621_TEMP_S2D0_REG		0x04
+#define MAX6621_TEMP_S2D1_REG		0x05
+#define MAX6621_TEMP_S3D0_REG		0x06
+#define MAX6621_TEMP_S3D1_REG		0x07
+#define MAX6621_TEMP_MAX_REG		0x08
+#define MAX6621_TEMP_MAX_ADDR_REG	0x0a
+#define MAX6621_TEMP_ALERT_CAUSE_REG	0x0b
+#define MAX6621_CONFIG0_REG		0x0c
+#define MAX6621_CONFIG1_REG		0x0d
+#define MAX6621_CONFIG2_REG		0x0e
+#define MAX6621_CONFIG3_REG		0x0f
+#define MAX6621_TEMP_S0_ALERT_REG	0x10
+#define MAX6621_TEMP_S1_ALERT_REG	0x11
+#define MAX6621_TEMP_S2_ALERT_REG	0x12
+#define MAX6621_TEMP_S3_ALERT_REG	0x13
+#define MAX6621_CLEAR_ALERT_REG		0x15
+#define MAX6621_REG_MAX			(MAX6621_CLEAR_ALERT_REG + 1)
+#define MAX6621_REG_TEMP_SHIFT		0x06
+
+#define MAX6621_ENABLE_TEMP_ALERTS_BIT	4
+#define MAX6621_ENABLE_I2C_CRC_BIT	5
+#define MAX6621_ENABLE_ALTERNATE_DATA	6
+#define MAX6621_ENABLE_LOCKUP_TO	7
+#define MAX6621_ENABLE_S0D0_BIT		8
+#define MAX6621_ENABLE_S0D1_BIT		9
+#define MAX6621_ENABLE_S1D0_BIT		10
+#define MAX6621_ENABLE_S1D1_BIT		11
+#define MAX6621_ENABLE_S2D0_BIT		12
+#define MAX6621_ENABLE_S2D1_BIT		13
+#define MAX6621_ENABLE_S3D0_BIT		14
+#define MAX6621_ENABLE_S3D1_BIT		15
+#define MAX6621_ENABLE_TEMP_ALL		GENMASK(MAX6621_ENABLE_S3D1_BIT, \
+						MAX6621_ENABLE_S0D0_BIT)
+#define MAX6621_POLL_DELAY_MASK		0x5
+#define MAX6621_CONFIG0_INIT		(MAX6621_ENABLE_TEMP_ALL | \
+					 BIT(MAX6621_ENABLE_LOCKUP_TO) | \
+					 BIT(MAX6621_ENABLE_I2C_CRC_BIT) | \
+					 MAX6621_POLL_DELAY_MASK)
+#define MAX6621_PECI_BIT_TIME		0x2
+#define MAX6621_PECI_RETRY_NUM		0x3
+#define MAX6621_CONFIG1_INIT		((MAX6621_PECI_BIT_TIME << 8) | \
+					 MAX6621_PECI_RETRY_NUM)
+
+/* Error codes */
+#define MAX6621_TRAN_FAILED	0x8100	/*
+					 * PECI transaction failed for more
+					 * than the configured number of
+					 * consecutive retries.
+					 */
+#define MAX6621_POOL_DIS	0x8101	/*
+					 * Polling disabled for requested
+					 * socket/domain.
+					 */
+#define MAX6621_POOL_UNCOMPLETE	0x8102	/*
+					 * First poll not yet completed for
+					 * requested socket/domain (on
+					 * startup).
+					 */
+#define MAX6621_SD_DIS		0x8103	/*
+					 * Read maximum temperature requested,
+					 * but no sockets/domains enabled or
+					 * all enabled sockets/domains have
+					 * errors; or read maximum temperature
+					 * address requested, but read maximum
+					 * temperature was not called.
+					 */
+#define MAX6621_ALERT_DIS	0x8104	/*
+					 * Get alert socket/domain requested,
+					 * but no alert active.
+					 */
+#define MAX6621_PECI_ERR_MIN	0x8000	/* Intel spec PECI error min value. */
+#define MAX6621_PECI_ERR_MAX	0x80ff	/* Intel spec PECI error max value. */
+
+static const u32 max6621_temp_regs[] = {
+	MAX6621_TEMP_MAX_REG, MAX6621_TEMP_S0D0_REG, MAX6621_TEMP_S1D0_REG,
+	MAX6621_TEMP_S2D0_REG, MAX6621_TEMP_S3D0_REG, MAX6621_TEMP_S0D1_REG,
+	MAX6621_TEMP_S1D1_REG, MAX6621_TEMP_S2D1_REG, MAX6621_TEMP_S3D1_REG,
+};
+
+static const char *const max6621_temp_labels[] = {
+	"maximum",
+	"socket0_0",
+	"socket1_0",
+	"socket2_0",
+	"socket3_0",
+	"socket0_1",
+	"socket1_1",
+	"socket2_1",
+	"socket3_1",
+};
+
+static const int max6621_temp_alert_chan2reg[] = {
+	MAX6621_CLEAR_ALERT_REG,
+	MAX6621_TEMP_S0_ALERT_REG,
+	MAX6621_TEMP_S1_ALERT_REG,
+	MAX6621_TEMP_S2_ALERT_REG,
+	MAX6621_TEMP_S3_ALERT_REG,
+};
+
+/**
+ * struct max6621_data - private data:
+ *
+ * @client: I2C client;
+ * @regmap: register map handle;
+ * @input_chan2reg: mapping from channel to register;
+ */
+struct max6621_data {
+	struct i2c_client	*client;
+	struct regmap		*regmap;
+	int			input_chan2reg[MAX6621_TEMP_INPUT_REG_NUM + 1];
+};
+
+static long max6621_temp_mc2reg(long val)
+{
+	return (val / 1000L) << MAX6621_REG_TEMP_SHIFT;
+}
+
+static umode_t
+max6621_is_visible(const void *data, enum hwmon_sensor_types type, u32 attr,
+		   int channel)
+{
+	/* Skip channels which are not physically conncted. */
+	if (((struct max6621_data *)data)->input_chan2reg[channel] < 0)
+		return 0;
+
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+		case hwmon_temp_label:
+			return 0444;
+		case hwmon_temp_offset:
+		case hwmon_temp_crit:
+		case hwmon_temp_crit_alarm:
+			return 0644;
+		default:
+			break;
+		}
+
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int max6621_verify_reg_data(struct device *dev, int regval)
+{
+	if (regval >= MAX6621_PECI_ERR_MIN &&
+	    regval <= MAX6621_PECI_ERR_MAX) {
+		dev_dbg(dev, "PECI error code - err 0x%04x.\n",
+			regval);
+
+		return -EINVAL;
+	}
+
+	switch (regval) {
+	case MAX6621_TRAN_FAILED:
+		dev_dbg(dev, "PECI transaction failed - err 0x%04x.\n",
+			regval);
+		break;
+	case MAX6621_POOL_DIS:
+		dev_dbg(dev, "Polling disabled - err 0x%04x.\n", regval);
+		break;
+	case MAX6621_POOL_UNCOMPLETE:
+		dev_dbg(dev, "First poll not completed on startup - err 0x%04x.\n",
+			regval);
+		break;
+	case MAX6621_SD_DIS:
+		dev_dbg(dev, "Resource is disabled - err 0x%04x.\n", regval);
+		break;
+	case MAX6621_ALERT_DIS:
+		dev_dbg(dev, "No alert active - err 0x%04x.\n", regval);
+		break;
+	default:
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int
+max6621_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+	     int channel, long *val)
+{
+	struct max6621_data *data = dev_get_drvdata(dev);
+	u32 regval;
+	int reg;
+	s8 temp;
+	int ret;
+
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+			reg = data->input_chan2reg[channel];
+			ret = regmap_read(data->regmap, reg, &regval);
+			if (ret)
+				return ret;
+
+			ret = max6621_verify_reg_data(dev, regval);
+			if (ret)
+				return ret;
+
+			/*
+			 * Bit MAX6621_REG_TEMP_SHIFT represents 1 degree step.
+			 * The temperature is given in two's complement and 8
+			 * bits is used for the register conversion.
+			 */
+			temp = (regval >> MAX6621_REG_TEMP_SHIFT);
+			*val = temp * 1000L;
+
+			break;
+		case hwmon_temp_offset:
+			ret = regmap_read(data->regmap, MAX6621_CONFIG2_REG,
+					  &regval);
+			if (ret)
+				return ret;
+
+			ret = max6621_verify_reg_data(dev, regval);
+			if (ret)
+				return ret;
+
+			*val = (regval >> MAX6621_REG_TEMP_SHIFT) *
+			       1000L;
+
+			break;
+		case hwmon_temp_crit:
+			reg = max6621_temp_alert_chan2reg[channel];
+			ret = regmap_read(data->regmap, reg, &regval);
+			if (ret)
+				return ret;
+
+			ret = max6621_verify_reg_data(dev, regval);
+			if (ret)
+				return ret;
+
+			*val = regval * 1000L;
+
+			break;
+		case hwmon_temp_crit_alarm:
+			/*
+			 * Set val to zero to recover the case, when reading
+			 * MAX6621_TEMP_ALERT_CAUSE_REG results in for example
+			 * MAX6621_ALERT_DIS. Reading will return with error,
+			 * but in such case alarm should be returned as 0.
+			 */
+			*val = 0;
+			ret = regmap_read(data->regmap,
+					  MAX6621_TEMP_ALERT_CAUSE_REG,
+					  &regval);
+			if (ret)
+				return ret;
+
+			ret = max6621_verify_reg_data(dev, regval);
+			if (ret < 0)
+				return ret;
+
+			/*
+			 * Clear the alert automatically, using send-byte
+			 * smbus protocol for clearing alert.
+			 */
+			if (regval) {
+				ret = i2c_smbus_write_byte(data->client,
+						MAX6621_CLEAR_ALERT_REG);
+				if (!ret)
+					return ret;
+			}
+
+			*val = !!regval;
+
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int
+max6621_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+	      int channel, long val)
+{
+	struct max6621_data *data = dev_get_drvdata(dev);
+	u32 reg;
+
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_offset:
+			/* Clamp to allowed range to prevent overflow. */
+			val = clamp_val(val, MAX6621_TEMP_INPUT_MIN,
+					MAX6621_TEMP_INPUT_MAX);
+			val = max6621_temp_mc2reg(val);
+
+			return regmap_write(data->regmap,
+					    MAX6621_CONFIG2_REG, val);
+		case hwmon_temp_crit:
+			reg = max6621_temp_alert_chan2reg[channel];
+			/* Clamp to allowed range to prevent overflow. */
+			val = clamp_val(val, MAX6621_TEMP_INPUT_MIN,
+					MAX6621_TEMP_INPUT_MAX);
+			val = val / 1000L;
+
+			return regmap_write(data->regmap, reg, val);
+		case hwmon_temp_crit_alarm:
+			/*
+			 * Use i2c_smbus_write_byte, since
+			 * MAX6621_CLEAR_ALERT_REG access expects send-byte
+			 * smbus protocol for clearing alert.
+			 */
+			return i2c_smbus_write_byte(data->client,
+						    MAX6621_CLEAR_ALERT_REG);
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int
+max6621_read_string(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+		    int channel, const char **str)
+{
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_label:
+			*str = max6621_temp_labels[channel];
+			return 0;
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static bool max6621_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MAX6621_CONFIG0_REG:
+	case MAX6621_CONFIG1_REG:
+	case MAX6621_CONFIG2_REG:
+	case MAX6621_CONFIG3_REG:
+	case MAX6621_TEMP_S0_ALERT_REG:
+	case MAX6621_TEMP_S1_ALERT_REG:
+	case MAX6621_TEMP_S2_ALERT_REG:
+	case MAX6621_TEMP_S3_ALERT_REG:
+	case MAX6621_TEMP_ALERT_CAUSE_REG:
+		return true;
+	}
+	return false;
+}
+
+static bool max6621_readable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MAX6621_TEMP_S0D0_REG:
+	case MAX6621_TEMP_S0D1_REG:
+	case MAX6621_TEMP_S1D0_REG:
+	case MAX6621_TEMP_S1D1_REG:
+	case MAX6621_TEMP_S2D0_REG:
+	case MAX6621_TEMP_S2D1_REG:
+	case MAX6621_TEMP_S3D0_REG:
+	case MAX6621_TEMP_S3D1_REG:
+	case MAX6621_TEMP_MAX_REG:
+	case MAX6621_TEMP_MAX_ADDR_REG:
+	case MAX6621_CONFIG0_REG:
+	case MAX6621_CONFIG1_REG:
+	case MAX6621_CONFIG2_REG:
+	case MAX6621_CONFIG3_REG:
+	case MAX6621_TEMP_S0_ALERT_REG:
+	case MAX6621_TEMP_S1_ALERT_REG:
+	case MAX6621_TEMP_S2_ALERT_REG:
+	case MAX6621_TEMP_S3_ALERT_REG:
+		return true;
+	}
+	return false;
+}
+
+static bool max6621_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MAX6621_TEMP_S0D0_REG:
+	case MAX6621_TEMP_S0D1_REG:
+	case MAX6621_TEMP_S1D0_REG:
+	case MAX6621_TEMP_S1D1_REG:
+	case MAX6621_TEMP_S2D0_REG:
+	case MAX6621_TEMP_S2D1_REG:
+	case MAX6621_TEMP_S3D0_REG:
+	case MAX6621_TEMP_S3D1_REG:
+	case MAX6621_TEMP_MAX_REG:
+	case MAX6621_TEMP_S0_ALERT_REG:
+	case MAX6621_TEMP_S1_ALERT_REG:
+	case MAX6621_TEMP_S2_ALERT_REG:
+	case MAX6621_TEMP_S3_ALERT_REG:
+	case MAX6621_TEMP_ALERT_CAUSE_REG:
+		return true;
+	}
+	return false;
+}
+
+static const struct reg_default max6621_regmap_default[] = {
+	{ MAX6621_CONFIG0_REG, MAX6621_CONFIG0_INIT },
+	{ MAX6621_CONFIG1_REG, MAX6621_CONFIG1_INIT },
+};
+
+static const struct regmap_config max6621_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 16,
+	.max_register = MAX6621_REG_MAX,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
+	.cache_type = REGCACHE_FLAT,
+	.writeable_reg = max6621_writeable_reg,
+	.readable_reg = max6621_readable_reg,
+	.volatile_reg = max6621_volatile_reg,
+	.reg_defaults = max6621_regmap_default,
+	.num_reg_defaults = ARRAY_SIZE(max6621_regmap_default),
+};
+
+static u32 max6621_chip_config[] = {
+	HWMON_C_REGISTER_TZ,
+	0
+};
+
+static const struct hwmon_channel_info max6621_chip = {
+	.type = hwmon_chip,
+	.config = max6621_chip_config,
+};
+
+static const u32 max6621_temp_config[] = {
+	HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_OFFSET,
+	HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_CRIT_ALARM | HWMON_T_LABEL,
+	HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_CRIT_ALARM | HWMON_T_LABEL,
+	HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_CRIT_ALARM | HWMON_T_LABEL,
+	HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_CRIT_ALARM | HWMON_T_LABEL,
+	HWMON_T_INPUT | HWMON_T_LABEL,
+	HWMON_T_INPUT | HWMON_T_LABEL,
+	HWMON_T_INPUT | HWMON_T_LABEL,
+	HWMON_T_INPUT | HWMON_T_LABEL,
+	0
+};
+
+static const struct hwmon_channel_info max6621_temp = {
+	.type = hwmon_temp,
+	.config = max6621_temp_config,
+};
+
+static const struct hwmon_channel_info *max6621_info[] = {
+	&max6621_chip,
+	&max6621_temp,
+	NULL
+};
+
+static const struct hwmon_ops max6621_hwmon_ops = {
+	.read = max6621_read,
+	.write = max6621_write,
+	.read_string = max6621_read_string,
+	.is_visible = max6621_is_visible,
+};
+
+static const struct hwmon_chip_info max6621_chip_info = {
+	.ops = &max6621_hwmon_ops,
+	.info = max6621_info,
+};
+
+static int max6621_probe(struct i2c_client *client,
+			 const struct i2c_device_id *id)
+{
+	struct device *dev = &client->dev;
+	struct max6621_data *data;
+	struct device *hwmon_dev;
+	int i;
+	int ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->regmap = devm_regmap_init_i2c(client, &max6621_regmap_config);
+	if (IS_ERR(data->regmap))
+		return PTR_ERR(data->regmap);
+
+	i2c_set_clientdata(client, data);
+	data->client = client;
+
+	/* Set CONFIG0 register masking temperature alerts and PEC. */
+	ret = regmap_write(data->regmap, MAX6621_CONFIG0_REG,
+			   MAX6621_CONFIG0_INIT);
+	if (ret)
+		return ret;
+
+	/* Set CONFIG1 register for PEC access retry number. */
+	ret = regmap_write(data->regmap, MAX6621_CONFIG1_REG,
+			   MAX6621_CONFIG1_INIT);
+	if (ret)
+		return ret;
+
+	/* Sync registers with hardware. */
+	regcache_mark_dirty(data->regmap);
+	ret = regcache_sync(data->regmap);
+	if (ret)
+		return ret;
+
+	/* Verify which temperature input registers are enabled. */
+	for (i = 0; i < MAX6621_TEMP_INPUT_REG_NUM; i++) {
+		ret = i2c_smbus_read_word_data(client, max6621_temp_regs[i]);
+		if (ret < 0)
+			return ret;
+		ret = max6621_verify_reg_data(dev, ret);
+		if (ret) {
+			data->input_chan2reg[i] = -1;
+			continue;
+		}
+
+		data->input_chan2reg[i] = max6621_temp_regs[i];
+	}
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
+							 data,
+							 &max6621_chip_info,
+							 NULL);
+
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static const struct i2c_device_id max6621_id[] = {
+	{ MAX6621_DRV_NAME, 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, max6621_id);
+
+static const struct of_device_id max6621_of_match[] = {
+	{ .compatible = "maxim,max6621" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, max6621_of_match);
+
+static struct i2c_driver max6621_driver = {
+	.class		= I2C_CLASS_HWMON,
+	.driver = {
+		.name = MAX6621_DRV_NAME,
+		.of_match_table = of_match_ptr(max6621_of_match),
+	},
+	.probe		= max6621_probe,
+	.id_table	= max6621_id,
+};
+
+module_i2c_driver(max6621_driver);
+
+MODULE_AUTHOR("Vadim Pasternak <vadimp@mellanox.com>");
+MODULE_DESCRIPTION("Driver for Maxim MAX6621");
+MODULE_LICENSE("GPL");
-- 
2.1.4

