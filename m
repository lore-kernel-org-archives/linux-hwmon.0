Return-path: <eajames@linux.vnet.ibm.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux@roeck-us.net
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        jdelvare@suse.com, corbet@lwn.net, mark.rutland@arm.com,
        robh+dt@kernel.org, wsa@the-dreams.de, andrew@aj.id.au,
        benh@kernel.crashing.org, joel@jms.id.au,
        "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux v8 5/6] hwmon: occ: Add hwmon implementation for the P8 OCC
Date: Tue, 14 Feb 2017 14:34:22 -0600
In-Reply-To: <1487104463-4253-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1487104463-4253-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1487104463-4253-6-git-send-email-eajames@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>

From: "Edward A. James" <eajames@us.ibm.com>

Add code to tie the hwmon sysfs code and the POWER8 OCC code together,
as well as probe the entire driver from the I2C bus. I2C is the
communication method between the BMC and the P8 OCC.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/hwmon/occ.txt | 13 ++++
 drivers/hwmon/occ/Kconfig                       | 15 ++++
 drivers/hwmon/occ/Makefile                      |  4 +-
 drivers/hwmon/occ/occ_p8_i2c.c                  | 99 +++++++++++++++++++++++++
 4 files changed, 130 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/occ.txt
 create mode 100644 drivers/hwmon/occ/occ_p8_i2c.c

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
index 61be588..d521720 100644
--- a/drivers/hwmon/occ/Kconfig
+++ b/drivers/hwmon/occ/Kconfig
@@ -11,3 +11,18 @@ menuconfig SENSORS_IBM_OCC
 
 	  Generally this is used by management controllers such as a BMC
 	  on an OpenPower system.
+
+if SENSORS_IBM_OCC
+
+config SENSORS_IBM_OCC_P8_I2C
+	tristate "POWER8 OCC hwmon support"
+	depends on I2C
+	help
+	  Provide a hwmon sysfs interface for the POWER8 On-Chip Controller,
+	  exposing temperature, frequency and power measurements. This
+	  interface runs on the service processor, not the POWER CPU.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called hwmon_occ_p8.
+
+endif
diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
index f59cca4..864b044 100644
--- a/drivers/hwmon/occ/Makefile
+++ b/drivers/hwmon/occ/Makefile
@@ -1 +1,3 @@
-obj-$(CONFIG_SENSORS_IBM_OCC) += occ.o occ_sysfs.o occ_scom_i2c.o occ_p8.o
+obj-$(CONFIG_SENSORS_IBM_OCC_P8_I2C) += hwmon_occ_p8.o
+
+hwmon_occ_p8-objs := occ.o occ_sysfs.o occ_scom_i2c.o occ_p8.o occ_p8_i2c.o
diff --git a/drivers/hwmon/occ/occ_p8_i2c.c b/drivers/hwmon/occ/occ_p8_i2c.c
new file mode 100644
index 0000000..2b4f6dd
--- /dev/null
+++ b/drivers/hwmon/occ/occ_p8_i2c.c
@@ -0,0 +1,99 @@
+/*
+ * occ_p8_i2c.c - hwmon OCC driver
+ *
+ * This file contains the i2c layer for accessing the P8 OCC over i2c bus.
+ *
+ * Copyright 2017 IBM Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
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
+#define OCC_P8_I2C_NAME	"p8-occ-i2c"
+
+int p8_i2c_getscom(void *bus, u32 address, u64 *data)
+{
+	/* P8 i2c slave requires scom address to be shifted by 1 */
+	address = address << 1;
+
+	return occ_i2c_getscom(bus, address, data);
+}
+
+int p8_i2c_putscom(void *bus, u32 address, u32 data0, u32 data1)
+{
+	/* P8 i2c slave requires scom address to be shifted by 1 */
+	address = address << 1;
+
+	return occ_i2c_putscom(bus, address, data0, data1);
+}
+
+static const struct occ_bus_ops p8_bus_ops = {
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
+	occ = p8_occ_init(&client->dev, client, &p8_bus_ops);
+	if (IS_ERR(occ))
+		return PTR_ERR(occ);
+
+	hwmon = occ_sysfs_start(&client->dev, occ, sensor_hwmon_configs,
+				OCC_P8_I2C_NAME);
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
+	{ OCC_P8_I2C_NAME, 0 },
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
+		.name = OCC_P8_I2C_NAME,
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
