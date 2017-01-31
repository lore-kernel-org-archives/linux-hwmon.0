Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46731 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751064AbdAaQig (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 31 Jan 2017 11:38:36 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v0VFi7Nn078674
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Jan 2017 10:44:19 -0500
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
        by mx0a-001b2d01.pphosted.com with ESMTP id 28akc1877k-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Jan 2017 10:44:18 -0500
Received: from localhost
        by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Tue, 31 Jan 2017 08:44:18 -0700
From: eajames@linux.vnet.ibm.com
To: linux@roeck-us.net
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        jdelvare@suse.com, corbet@lwn.net, mark.rutland@arm.com,
        robh+dt@kernel.org, wsa@the-dreams.de, andrew@aj.id.au,
        joel@jms.id.au, benh@kernel.crashing.org,
        "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux v5 5/6] hwmon: occ: Add hwmon implementation for the P8 OCC
Date: Tue, 31 Jan 2017 09:43:56 -0600
In-Reply-To: <1485877437-13598-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1485877437-13598-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1485877437-13598-6-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Add code to tie the hwmon sysfs code and the POWER8 OCC code together, as
well as probe the entire driver from the I2C bus. I2C is the communication
method between the BMC and the P8 OCC.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/devicetree/bindings/hwmon/occ.txt |  13 +++
 drivers/hwmon/occ/Kconfig                       |  14 ++++
 drivers/hwmon/occ/Makefile                      |   1 +
 drivers/hwmon/occ/p8_occ_i2c.c                  | 104 ++++++++++++++++++++++++
 4 files changed, 132 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/occ.txt
 create mode 100644 drivers/hwmon/occ/p8_occ_i2c.c

diff --git a/Documentation/devicetree/bindings/hwmon/occ.txt b/Documentation/devicetree/bindings/hwmon/occ.txt
new file mode 100644
index 0000000..b0d2b36
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/occ.txt
@@ -0,0 +1,13 @@
+HWMON I2C driver for IBM POWER CPU OCC (On Chip Controller)
+
+Required properties:
+ - compatible: must be "ibm,p8-occ-i2c"
+ - reg: physical address
+
+Example:
+i2c3: i2c-bus@100 {
+	occ@50 {
+		compatible = "ibm,p8-occ-i2c";
+		reg = <0x50>;
+	};
+};
diff --git a/drivers/hwmon/occ/Kconfig b/drivers/hwmon/occ/Kconfig
index cdb64a7..3a5188f 100644
--- a/drivers/hwmon/occ/Kconfig
+++ b/drivers/hwmon/occ/Kconfig
@@ -13,3 +13,17 @@ menuconfig SENSORS_PPC_OCC
 
 	  This driver can also be built as a module. If so, the module
 	  will be called occ.
+
+if SENSORS_PPC_OCC
+
+config SENSORS_PPC_OCC_P8_I2C
+	tristate "POWER8 OCC hwmon support"
+	depends on I2C
+	help
+	 Provide a hwmon sysfs interface for the POWER8 On-Chip Controller,
+	 exposing temperature, frequency and power measurements.
+
+	 This driver can also be built as a module. If so, the module will be
+	 called p8-occ-i2c.
+
+endif
diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
index a6881f9..9294b58 100644
--- a/drivers/hwmon/occ/Makefile
+++ b/drivers/hwmon/occ/Makefile
@@ -1 +1,2 @@
 obj-$(CONFIG_SENSORS_PPC_OCC) += occ.o occ_sysfs.o
+obj-$(CONFIG_SENSORS_PPC_OCC_P8_I2C) += occ_scom_i2c.o occ_p8.o p8_occ_i2c.o
diff --git a/drivers/hwmon/occ/p8_occ_i2c.c b/drivers/hwmon/occ/p8_occ_i2c.c
new file mode 100644
index 0000000..6273040
--- /dev/null
+++ b/drivers/hwmon/occ/p8_occ_i2c.c
@@ -0,0 +1,104 @@
+/*
+ * p8_occ_i2c.c - hwmon OCC driver
+ *
+ * This file contains the i2c layer for accessing the P8 OCC over i2c bus.
+ *
+ * Copyright 2016 IBM Corp.
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
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+#include "occ_p8.h"
+#include "occ_scom_i2c.h"
+#include "occ_sysfs.h"
+#include "scom.h"
+
+#define P8_OCC_I2C_NAME	"p8-occ-i2c"
+
+int p8_i2c_getscom(void *bus, u32 address, u64 *data)
+{
+	/* P8 i2c slave requires address to be shifted by 1 */
+	address = address << 1;
+
+	return occ_i2c_getscom(bus, address, data);
+}
+
+int p8_i2c_putscom(void *bus, u32 address, u32 data0, u32 data1)
+{
+	/* P8 i2c slave requires address to be shifted by 1 */
+	address = address << 1;
+
+	return occ_i2c_putscom(bus, address, data0, data1);
+}
+
+static struct occ_bus_ops p8_bus_ops = {
+	.getscom = p8_i2c_getscom,
+	.putscom = p8_i2c_putscom,
+};
+
+static int p8_occ_probe(struct i2c_client *client,
+			const struct i2c_device_id *id)
+{
+	struct occ *occ;
+	struct occ_sysfs *hwmon;
+	const u32 *sensor_hwmon_configs = p8_get_sensor_hwmon_configs();
+
+	occ = p8_occ_start(&client->dev, client, &p8_bus_ops);
+	if (IS_ERR(occ))
+		return PTR_ERR(occ);
+
+	hwmon = occ_sysfs_start(&client->dev, occ, sensor_hwmon_configs,
+				P8_OCC_I2C_NAME);
+	if (IS_ERR(hwmon))
+		return PTR_ERR(hwmon);
+
+	i2c_set_clientdata(client, occ);
+
+	return 0;
+}
+
+/* used by old-style board info. */
+static const struct i2c_device_id occ_ids[] = {
+	{ P8_OCC_I2C_NAME, 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, occ_ids);
+
+/* used by device table */
+static const struct of_device_id occ_of_match[] = {
+	{ .compatible = "ibm,p8-occ-i2c" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, occ_of_match);
+
+static struct i2c_driver p8_occ_driver = {
+	.class = I2C_CLASS_HWMON,
+	.driver = {
+		.name = P8_OCC_I2C_NAME,
+		.of_match_table = occ_of_match,
+	},
+	.probe = p8_occ_probe,
+	.id_table = occ_ids,
+};
+
+module_i2c_driver(p8_occ_driver);
+
+MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
+MODULE_DESCRIPTION("BMC P8 OCC hwmon driver");
+MODULE_LICENSE("GPL");
-- 
1.8.3.1

