Return-path: <joel@jms.id.au>
From: Joel Stanley <joel@jms.id.au>
To: linux@roeck-us.net,
	devicetree@vger.kernel.org
Cc: jk@ozlabs.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: (adm1031) Add device tree support
Date: Tue, 29 Mar 2016 19:20:43 +1030
Message-Id: <1459241443-28392-1-git-send-email-joel@jms.id.au>
List-ID: <linux-hwmon@vger.kernel.org>

This adds a of_device_id table so we can probe the driver using the
device tree.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 Documentation/devicetree/bindings/hwmon/adm1276.txt | 21 +++++++++++++++++++++
 drivers/hwmon/pmbus/adm1275.c                       | 15 +++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/adm1276.txt

diff --git a/Documentation/devicetree/bindings/hwmon/adm1276.txt b/Documentation/devicetree/bindings/hwmon/adm1276.txt
new file mode 100644
index 000000000000..45eb51867c1b
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adm1276.txt
@@ -0,0 +1,21 @@
+* Analog Devices ADM1275 and compatabile power monitors
+
+Required node properties:
+
+ - compatible: manufacturer and chip name, one of
+
+    "adi,adm1075"
+    "adi,adm1275"
+    "adi,adm1276"
+    "adi,adm1278"
+    "adi,adm1293"
+    "adi,adm1294"
+
+- reg: I2C bus address of the device
+
+Example adm1275 node:
+
+power-sensor {
+	compatible = "adi,adm1278";
+	reg = <0x4c>;
+}
diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index 3baa4f4a8c5e..1476a127dbdb 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -22,6 +22,7 @@
 #include <linux/slab.h>
 #include <linux/i2c.h>
 #include <linux/bitops.h>
+#include <linux/of.h>
 #include "pmbus.h"
 
 enum chips { adm1075, adm1275, adm1276, adm1278, adm1293, adm1294 };
@@ -344,6 +345,19 @@ static const struct i2c_device_id adm1275_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, adm1275_id);
 
+#ifdef CONFIG_OF
+static const struct of_device_id adm1275_of_match[] = {
+	{ .compatible = "adi,adm1075" },
+	{ .compatible = "adi,adm1275" },
+	{ .compatible = "adi,adm1276" },
+	{ .compatible = "adi,adm1278" },
+	{ .compatible = "adi,adm1293" },
+	{ .compatible = "adi,adm1294" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, adm1275_of_match);
+#endif
+
 static int adm1275_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
@@ -598,6 +612,7 @@ static int adm1275_probe(struct i2c_client *client,
 static struct i2c_driver adm1275_driver = {
 	.driver = {
 		   .name = "adm1275",
+		   .of_match_table = of_match_ptr(adm1275_of_match),
 		   },
 	.probe = adm1275_probe,
 	.remove = pmbus_do_remove,
-- 
2.7.4
