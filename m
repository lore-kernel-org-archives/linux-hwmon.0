Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:38275 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753296AbdCNUzj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Mar 2017 16:55:39 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v2EKraDD045971
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Mar 2017 16:55:28 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
        by mx0a-001b2d01.pphosted.com with ESMTP id 296nfvpsf9-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Mar 2017 16:55:28 -0400
Received: from localhost
        by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Tue, 14 Mar 2017 16:55:27 -0400
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux@roeck-us.net
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        jdelvare@suse.com, corbet@lwn.net, mark.rutland@arm.com,
        robh+dt@kernel.org, wsa@the-dreams.de, andrew@aj.id.au,
        benh@kernel.crashing.org, joel@jms.id.au,
        "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux v9 4/5] hwmon: occ: Add callbacks for parsing P8 OCC datastructures
Date: Tue, 14 Mar 2017 15:55:05 -0500
In-Reply-To: <1489524906-19411-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1489524906-19411-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1489524906-19411-5-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Add functions to parse the data structures that are specific to the OCC
on the POWER8 processor. These are the sensor data structures, including
temperature, frequency, power, and "caps."

Signed-off-by: Edward A. James <eajames@us.ibm.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/hwmon/occ    |   9 ++
 drivers/hwmon/occ/Makefile |   2 +-
 drivers/hwmon/occ/occ_p8.c | 256 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/occ/occ_p8.h |  25 +++++
 4 files changed, 291 insertions(+), 1 deletion(-)
 create mode 100644 drivers/hwmon/occ/occ_p8.c
 create mode 100644 drivers/hwmon/occ/occ_p8.h

diff --git a/Documentation/hwmon/occ b/Documentation/hwmon/occ
index 580af26..4ec8842 100644
--- a/Documentation/hwmon/occ
+++ b/Documentation/hwmon/occ
@@ -27,6 +27,15 @@ Currently, all versions of the OCC support four types of sensor data: power,
 temperature, frequency, and "caps," which indicate limits and thresholds used
 internally on the OCC.
 
+The format for the POWER8 OCC sensor data can be found in the P8 OCC
+specification:
+github.com/open-power/docs/blob/master/occ/OCC_OpenPwr_FW_Interfaces.pdf
+This document provides the details of the OCC sensors: power, frequency,
+temperature, and caps. These sensor formats are specific to the POWER8 OCC. A
+number of data structures, such as command format, response headers, and the
+like, are also defined in this specification, and are common to both POWER8 and
+POWER9 OCCs.
+
 sysfs Entries
 -------------
 
diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
index 9cc36e7..f59cca4 100644
--- a/drivers/hwmon/occ/Makefile
+++ b/drivers/hwmon/occ/Makefile
@@ -1 +1 @@
-obj-$(CONFIG_SENSORS_IBM_OCC) += occ.o occ_sysfs.o occ_scom_i2c.o
+obj-$(CONFIG_SENSORS_IBM_OCC) += occ.o occ_sysfs.o occ_scom_i2c.o occ_p8.o
diff --git a/drivers/hwmon/occ/occ_p8.c b/drivers/hwmon/occ/occ_p8.c
new file mode 100644
index 0000000..ae8b453
--- /dev/null
+++ b/drivers/hwmon/occ/occ_p8.c
@@ -0,0 +1,256 @@
+/*
+ * occ_p8.c - OCC hwmon driver
+ *
+ * This file contains the Power8-specific methods and data structures for
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
+#include "occ_p8.h"
+
+/* P8 OCC sensor data format */
+struct p8_occ_sensor {
+	u16 sensor_id;
+	u16 value;
+};
+
+struct p8_power_sensor {
+	u16 sensor_id;
+	u32 update_tag;
+	u32 accumulator;
+	u16 value;
+};
+
+struct p8_caps_sensor {
+	u16 curr_powercap;
+	u16 curr_powerreading;
+	u16 norm_powercap;
+	u16 max_powercap;
+	u16 min_powercap;
+	u16 user_powerlimit;
+};
+
+/* value, sensor_id */
+#define FREQ_SENSOR_CONFIG	(HWMON_I_INPUT | HWMON_I_LABEL)
+#define TEMP_SENSOR_CONFIG	(HWMON_T_INPUT | HWMON_T_LABEL)
+
+/* value, sensor_id, accumulator, update_tag */
+#define POWER_SENSOR_CONFIG					\
+(								\
+	HWMON_P_INPUT | HWMON_P_LABEL | HWMON_P_AVERAGE |	\
+	HWMON_P_AVERAGE_INTERVAL				\
+)
+
+/* curr_powercap, max_powercap, min_powercap, norm_powercap, user_powerlimit */
+#define CAPS_SENSOR_CONFIG						\
+(									\
+	HWMON_P_CAP | HWMON_P_CAP_MAX | HWMON_P_CAP_MIN | HWMON_P_MAX |	\
+	HWMON_P_ALARM							\
+)
+
+static const u32 p8_sensor_hwmon_configs[MAX_OCC_SENSOR_TYPE] = {
+	FREQ_SENSOR_CONFIG,
+	TEMP_SENSOR_CONFIG,
+	POWER_SENSOR_CONFIG,
+	CAPS_SENSOR_CONFIG,
+};
+
+void p8_parse_sensor(u8 *data, void *sensor, int sensor_type, int off,
+		     int snum)
+{
+	switch (sensor_type) {
+	case FREQ:
+	case TEMP:
+	{
+		struct p8_occ_sensor *os =
+			&(((struct p8_occ_sensor *)sensor)[snum]);
+
+		os->sensor_id = be16_to_cpu(get_unaligned((u16 *)&data[off]));
+		os->value = be16_to_cpu(get_unaligned((u16 *)&data[off + 2]));
+	}
+		break;
+	case POWER:
+	{
+		struct p8_power_sensor *ps =
+			&(((struct p8_power_sensor *)sensor)[snum]);
+
+		ps->sensor_id = be16_to_cpu(get_unaligned((u16 *)&data[off]));
+		ps->update_tag =
+			be32_to_cpu(get_unaligned((u32 *)&data[off + 2]));
+		ps->accumulator =
+			be32_to_cpu(get_unaligned((u32 *)&data[off + 6]));
+		ps->value = be16_to_cpu(get_unaligned((u16 *)&data[off + 10]));
+	}
+		break;
+	case CAPS:
+	{
+		struct p8_caps_sensor *cs =
+			&(((struct p8_caps_sensor *)sensor)[snum]);
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
+	}
+		break;
+	};
+}
+
+void *p8_alloc_sensor(struct device *dev, int sensor_type, int num_sensors)
+{
+	switch (sensor_type) {
+	case FREQ:
+	case TEMP:
+		return devm_kzalloc(dev, num_sensors *
+				    sizeof(struct p8_occ_sensor), GFP_KERNEL);
+	case POWER:
+		return devm_kzalloc(dev, num_sensors *
+				    sizeof(struct p8_power_sensor),
+				    GFP_KERNEL);
+	case CAPS:
+		return devm_kzalloc(dev, num_sensors *
+				    sizeof(struct p8_caps_sensor), GFP_KERNEL);
+	default:
+		return NULL;
+	}
+}
+
+int p8_get_sensor(struct occ *driver, int sensor_type, int sensor_num,
+		  u32 hwmon, long *val)
+{
+	int rc = 0;
+	void *sensor;
+
+	if (sensor_type == POWER) {
+		if (hwmon == hwmon_power_cap || hwmon == hwmon_power_cap_max ||
+		    hwmon == hwmon_power_cap_min || hwmon == hwmon_power_max ||
+		    hwmon == hwmon_power_alarm)
+			sensor_type = CAPS;
+	}
+
+	sensor = occ_get_sensor(driver, sensor_type);
+	if (!sensor)
+		return -ENODEV;
+
+	switch (sensor_type) {
+	case FREQ:
+	case TEMP:
+	{
+		struct p8_occ_sensor *os =
+			&(((struct p8_occ_sensor *)sensor)[sensor_num]);
+
+		if (hwmon == hwmon_in_input || hwmon == hwmon_temp_input)
+			*val = os->value;
+		else if (hwmon == hwmon_in_label || hwmon == hwmon_temp_label)
+			*val = os->sensor_id;
+		else
+			rc = -EOPNOTSUPP;
+	}
+		break;
+	case POWER:
+	{
+		struct p8_power_sensor *ps =
+			&(((struct p8_power_sensor *)sensor)[sensor_num]);
+
+		switch (hwmon) {
+		case hwmon_power_input:
+			*val = ps->value;
+			break;
+		case hwmon_power_label:
+			*val = ps->sensor_id;
+			break;
+		case hwmon_power_average:
+			*val = ps->accumulator;
+			break;
+		case hwmon_power_average_interval:
+			*val = ps->update_tag;
+			break;
+		default:
+			rc = -EOPNOTSUPP;
+		}
+	}
+		break;
+	case CAPS:
+	{
+		struct p8_caps_sensor *cs =
+			&(((struct p8_caps_sensor *)sensor)[sensor_num]);
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
+static const struct occ_ops p8_ops = {
+	.parse_sensor = p8_parse_sensor,
+	.alloc_sensor = p8_alloc_sensor,
+	.get_sensor = p8_get_sensor,
+};
+
+static const struct occ_init_data p8_init = {
+	.command_addr = 0xFFFF6000,
+	.response_addr = 0xFFFF7000,
+	.ops = &p8_ops,
+};
+
+const u32 *p8_get_sensor_hwmon_configs()
+{
+	return p8_sensor_hwmon_configs;
+}
+
+struct occ *p8_occ_init(struct device *dev, void *bus,
+			const struct occ_bus_ops *bus_ops)
+{
+	return occ_init(dev, bus, bus_ops, &p8_init);
+}
+
+MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
+MODULE_DESCRIPTION("P8 OCC sensors");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwmon/occ/occ_p8.h b/drivers/hwmon/occ/occ_p8.h
new file mode 100644
index 0000000..5f9cceb
--- /dev/null
+++ b/drivers/hwmon/occ/occ_p8.h
@@ -0,0 +1,25 @@
+/*
+ * occ_p8.h - OCC hwmon driver
+ *
+ * This file contains Power8-specific function prototypes
+ *
+ * Copyright 2017 IBM Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#ifndef __OCC_P8_H__
+#define __OCC_P8_H__
+
+struct device;
+struct occ;
+struct occ_bus_ops;
+
+const u32 *p8_get_sensor_hwmon_configs(void);
+struct occ *p8_occ_init(struct device *dev, void *bus,
+			const struct occ_bus_ops *bus_ops);
+
+#endif /* __OCC_P8_H__ */
-- 
1.8.3.1

