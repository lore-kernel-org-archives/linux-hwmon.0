Return-path: <eajames@linux.vnet.ibm.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux@roeck-us.net
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        jdelvare@suse.com, corbet@lwn.net, mark.rutland@arm.com,
        robh+dt@kernel.org, wsa@the-dreams.de, andrew@aj.id.au,
        benh@kernel.crashing.org, joel@jms.id.au,
        "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux v8 6/6] hwmon: occ: Add callbacks for parsing P9 OCC datastructures
Date: Tue, 14 Feb 2017 14:34:23 -0600
In-Reply-To: <1487104463-4253-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1487104463-4253-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1487104463-4253-7-git-send-email-eajames@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>

From: "Edward A. James" <eajames@us.ibm.com>

Add functions to parse the data structures that are specific to the OCC
on the POWER9 processor. These are the sensor data structures, including
temperature, frequency, power, and "caps."

Signed-off-by: Edward A. James <eajames@us.ibm.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/hwmon/occ    |   3 +
 drivers/hwmon/occ/Kconfig  |  11 ++
 drivers/hwmon/occ/Makefile |   2 +
 drivers/hwmon/occ/occ_p9.c | 320 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/occ/occ_p9.h |  25 ++++
 5 files changed, 361 insertions(+)
 create mode 100644 drivers/hwmon/occ/occ_p9.c
 create mode 100644 drivers/hwmon/occ/occ_p9.h

diff --git a/Documentation/hwmon/occ b/Documentation/hwmon/occ
index 4ec8842..8fb3f41 100644
--- a/Documentation/hwmon/occ
+++ b/Documentation/hwmon/occ
@@ -36,6 +36,9 @@ number of data structures, such as command format, response headers, and the
 like, are also defined in this specification, and are common to both POWER8 and
 POWER9 OCCs.
 
+There is currently no public P9 OCC specification, and the data structures
+defined in the POWER9 OCC driver are subject to change.
+
 sysfs Entries
 -------------
 
diff --git a/drivers/hwmon/occ/Kconfig b/drivers/hwmon/occ/Kconfig
index d521720..5b8ca27 100644
--- a/drivers/hwmon/occ/Kconfig
+++ b/drivers/hwmon/occ/Kconfig
@@ -25,4 +25,15 @@ config SENSORS_IBM_OCC_P8_I2C
 	  This driver can also be built as a module. If so, the module will be
 	  called hwmon_occ_p8.
 
+config SENSORS_IBM_OCC_P9
+	tristate "POWER9 OCC hwmon support"
+	depends on !SENSORS_IBM_OCC_P8_I2C
+	help
+	  Provide a hwmon sysfs interface for the POWER9 On-Chip Controller,
+	  exposing temperature, frequency, and power measurements. This
+	  interface runs on the service processor, not the POWER CPU.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called hwmon_occ_p9.
+
 endif
diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
index 864b044..7b3a612 100644
--- a/drivers/hwmon/occ/Makefile
+++ b/drivers/hwmon/occ/Makefile
@@ -1,3 +1,5 @@
 obj-$(CONFIG_SENSORS_IBM_OCC_P8_I2C) += hwmon_occ_p8.o
+obj-$(CONFIG_SENSORS_IBM_OCC_P9) += hwmon_occ_p9.o
 
 hwmon_occ_p8-objs := occ.o occ_sysfs.o occ_scom_i2c.o occ_p8.o occ_p8_i2c.o
+hwmon_occ_p9-objs := occ.o occ_sysfs.o occ_p9.o
diff --git a/drivers/hwmon/occ/occ_p9.c b/drivers/hwmon/occ/occ_p9.c
new file mode 100644
index 0000000..646d764
--- /dev/null
+++ b/drivers/hwmon/occ/occ_p9.c
@@ -0,0 +1,320 @@
+/*
+ * occ_p9.c - OCC hwmon driver
+ *
+ * This file contains the Power9-specific methods and data structures for
+ * the OCC hwmon driver.
+ *
+ * Copyright 2017 IBM Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <asm/unaligned.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include "occ.h"
+#include "occ_p9.h"
+
+/* P9 OCC sensor data format */
+struct p9_temp_sensor {
+	u32 sensor_id;
+	u8 fru_type;
+	u8 value;
+};
+
+struct p9_freq_sensor {
+	u32 sensor_id;
+	u16 value;
+};
+
+struct p9_power_sensor {
+	u32 sensor_id;
+	u8 function_id;
+	u8 apss_channel;
+	u16 reserved;
+	u32 update_tag;
+	u64 accumulator;
+	u16 value;
+};
+
+struct p9_caps_sensor {
+	u16 curr_powercap;
+	u16 curr_powerreading;
+	u16 norm_powercap;
+	u16 max_powercap;
+	u16 min_powercap;
+	u16 user_powerlimit;
+	u8 user_powerlimit_source;
+};
+
+/* value, sensor_id */
+#define FREQ_SENSOR_CONFIG	(HWMON_I_INPUT | HWMON_I_LABEL)
+
+/* value, sensor_id, fru_type */
+#define TEMP_SENSOR_CONFIG	(HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_TYPE)
+
+/* value, sensor_id, accumulator[0], accumulator[1], update_tag,
+ * (function_id | (appss_channel << 8)
+ */
+#define POWER_SENSOR_CONFIG						\
+(									\
+	HWMON_P_INPUT | HWMON_P_LABEL | HWMON_P_AVERAGE_MIN |		\
+	HWMON_P_AVERAGE_MAX | HWMON_P_AVERAGE_INTERVAL |		\
+	HWMON_P_RESET_HISTORY						\
+)
+
+/* curr_powercap, max_powercap, min_powercap, norm_powercap, user_powerlimit
+ * user_powerlimit_source
+ */
+#define CAPS_SENSOR_CONFIG						\
+(									\
+	HWMON_P_CAP | HWMON_P_CAP_MAX | HWMON_P_CAP_MIN | HWMON_P_MAX |	\
+	HWMON_P_ALARM | HWMON_P_CAP_ALARM				\
+)
+
+static const u32 p9_sensor_hwmon_configs[MAX_OCC_SENSOR_TYPE] = {
+	FREQ_SENSOR_CONFIG,
+	TEMP_SENSOR_CONFIG,
+	POWER_SENSOR_CONFIG,
+	CAPS_SENSOR_CONFIG,
+};
+
+void p9_parse_sensor(u8 *data, void *sensor, int sensor_type, int off,
+		     int snum)
+{
+	switch (sensor_type) {
+	case FREQ:
+	{
+		struct p9_freq_sensor *fs =
+			&(((struct p9_freq_sensor *)sensor)[snum]);
+
+		fs->sensor_id = be32_to_cpu(get_unaligned((u32 *)&data[off]));
+		fs->value = be16_to_cpu(get_unaligned((u16 *)&data[off + 4]));
+	}
+		break;
+	case TEMP:
+	{
+		struct p9_temp_sensor *ts =
+			&(((struct p9_temp_sensor *)sensor)[snum]);
+
+		ts->sensor_id = be32_to_cpu(get_unaligned((u32 *)&data[off]));
+		ts->fru_type = data[off + 4];
+		ts->value = data[off + 5];
+	}
+		break;
+	case POWER:
+	{
+		struct p9_power_sensor *ps =
+			&(((struct p9_power_sensor *)sensor)[snum]);
+
+		ps->sensor_id = be32_to_cpu(get_unaligned((u32 *)&data[off]));
+		ps->function_id = data[off + 4];
+		ps->apss_channel = data[off + 5];
+		ps->update_tag =
+			be32_to_cpu(get_unaligned((u32 *)&data[off + 8]));
+		ps->accumulator =
+			be64_to_cpu(get_unaligned((u64 *)&data[off + 12]));
+		ps->value = be16_to_cpu(get_unaligned((u16 *)&data[off + 20]));
+	}
+		break;
+	case CAPS:
+	{
+		struct p9_caps_sensor *cs =
+			&(((struct p9_caps_sensor *)sensor)[snum]);
+
+		cs->curr_powercap =
+			be16_to_cpu(get_unaligned((u16 *)&data[off]));
+		cs->curr_powerreading =
+			be16_to_cpu(get_unaligned((u16 *)&data[off + 2]));
+		cs->norm_powercap =
+			be16_to_cpu(get_unaligned((u16 *)&data[off + 4]));
+		cs->max_powercap =
+			be16_to_cpu(get_unaligned((u16 *)&data[off + 6]));
+		cs->min_powercap =
+			be16_to_cpu(get_unaligned((u16 *)&data[off + 8]));
+		cs->user_powerlimit =
+			be16_to_cpu(get_unaligned((u16 *)&data[off + 10]));
+		cs->user_powerlimit_source = data[off + 12];
+	}
+		break;
+	};
+}
+
+void *p9_alloc_sensor(struct device *dev, int sensor_type, int num_sensors)
+{
+	switch (sensor_type) {
+	case FREQ:
+		return devm_kzalloc(dev, num_sensors *
+				    sizeof(struct p9_freq_sensor), GFP_KERNEL);
+	case TEMP:
+		return devm_kzalloc(dev, num_sensors *
+				    sizeof(struct p9_temp_sensor), GFP_KERNEL);
+	case POWER:
+		return devm_kzalloc(dev, num_sensors *
+				    sizeof(struct p9_power_sensor),
+				    GFP_KERNEL);
+	case CAPS:
+		return devm_kzalloc(dev, num_sensors *
+				    sizeof(struct p9_caps_sensor), GFP_KERNEL);
+	default:
+		return NULL;
+	}
+}
+
+int p9_get_sensor(struct occ *driver, int sensor_type, int sensor_num,
+		  u32 hwmon, long *val)
+{
+	int rc = 0;
+	void *sensor;
+
+	if (sensor_type == POWER) {
+		if (hwmon == hwmon_power_cap || hwmon == hwmon_power_cap_max ||
+		    hwmon == hwmon_power_cap_min || hwmon == hwmon_power_max ||
+		    hwmon == hwmon_power_alarm ||
+		    hwmon == hwmon_power_cap_alarm)
+			sensor_type = CAPS;
+	}
+
+	sensor = occ_get_sensor(driver, sensor_type);
+	if (!sensor)
+		return -ENODEV;
+
+	switch (sensor_type) {
+	case FREQ:
+	{
+		struct p9_freq_sensor *fs =
+			&(((struct p9_freq_sensor *)sensor)[sensor_num]);
+
+		switch (hwmon) {
+		case hwmon_in_input:
+			*val = fs->value;
+			break;
+		case hwmon_in_label:
+			*val = fs->sensor_id;
+			break;
+		default:
+			rc = -EOPNOTSUPP;
+		}
+	}
+		break;
+	case TEMP:
+	{
+		struct p9_temp_sensor *ts =
+			&(((struct p9_temp_sensor *)sensor)[sensor_num]);
+
+		switch (hwmon) {
+		case hwmon_temp_input:
+			*val = ts->value;
+			break;
+		case hwmon_temp_type:
+			*val = ts->fru_type;
+			break;
+		case hwmon_temp_label:
+			*val = ts->sensor_id;
+			break;
+		default:
+			rc = -EOPNOTSUPP;
+		}
+	}
+		break;
+	case POWER:
+	{
+		struct p9_power_sensor *ps =
+			&(((struct p9_power_sensor *)sensor)[sensor_num]);
+
+		switch (hwmon) {
+		case hwmon_power_input:
+			*val = ps->value;
+			break;
+		case hwmon_power_label:
+			*val = ps->sensor_id;
+			break;
+		case hwmon_power_average_min:
+			*val = ((u32 *)(&ps->accumulator))[0];
+			break;
+		case hwmon_power_average_max:
+			*val = ((u32 *)(&ps->accumulator))[1];
+			break;
+		case hwmon_power_average_interval:
+			*val = ps->update_tag;
+			break;
+		case hwmon_power_reset_history:
+			*val = ps->function_id | (ps->apss_channel << 8);
+			break;
+		default:
+			rc = -EOPNOTSUPP;
+		}
+	}
+		break;
+	case CAPS:
+	{
+		struct p9_caps_sensor *cs =
+			&(((struct p9_caps_sensor *)sensor)[sensor_num]);
+
+		switch (hwmon) {
+		case hwmon_power_cap:
+			*val = cs->curr_powercap;
+			break;
+		case hwmon_power_cap_max:
+			*val = cs->max_powercap;
+			break;
+		case hwmon_power_cap_min:
+			*val = cs->min_powercap;
+			break;
+		case hwmon_power_max:
+			*val = cs->norm_powercap;
+			break;
+		case hwmon_power_alarm:
+			*val = cs->user_powerlimit;
+			break;
+		case hwmon_power_cap_alarm:
+			*val = cs->user_powerlimit_source;
+			break;
+		default:
+			rc = -EOPNOTSUPP;
+		}
+	}
+		break;
+	default:
+		rc = -EINVAL;
+	}
+
+	return rc;
+}
+
+static const struct occ_ops p9_ops = {
+	.parse_sensor = p9_parse_sensor,
+	.alloc_sensor = p9_alloc_sensor,
+	.get_sensor = p9_get_sensor,
+};
+
+static const struct occ_init_data p9_init = {
+	.command_addr = 0xFFFBE000,
+	.response_addr = 0xFFFBF000,
+	.ops = &p9_ops,
+};
+
+const u32 *p9_get_sensor_hwmon_configs()
+{
+	return p9_sensor_hwmon_configs;
+}
+
+struct occ *p9_occ_init(struct device *dev, void *bus,
+			const struct occ_bus_ops *bus_ops)
+{
+	return occ_init(dev, bus, bus_ops, &p9_init);
+}
+
+MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
+MODULE_DESCRIPTION("P9 OCC sensors");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwmon/occ/occ_p9.h b/drivers/hwmon/occ/occ_p9.h
new file mode 100644
index 0000000..0fd647a
--- /dev/null
+++ b/drivers/hwmon/occ/occ_p9.h
@@ -0,0 +1,25 @@
+/*
+ * occ_p9.h - OCC hwmon driver
+ *
+ * This file contains Power9-specific function prototypes
+ *
+ * Copyright 2017 IBM Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#ifndef __OCC_P9_H__
+#define __OCC_P9_H__
+
+struct device;
+struct occ;
+struct occ_bus_ops;
+
+const u32 *p9_get_sensor_hwmon_configs(void);
+struct occ *p9_occ_init(struct device *dev, void *bus,
+			const struct occ_bus_ops *bus_ops);
+
+#endif /* __OCC_P9_H__ */
-- 
1.8.3.1
