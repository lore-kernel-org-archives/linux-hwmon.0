Return-path: <matthew.weber@rockwellcollins.com>
From: Matt Weber <matthew.weber@rockwellcollins.com>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net,
	jdelvare@suse.com,
	Matt Weber <matthew.weber@rockwellcollins.com>,
	Ronak Desai <ronak.desai@rockwellcollins.com>
Subject: [PATCH 1/2] hwmon: (ucd9000) basic device tree support
Date: Thu, 18 Aug 2016 23:00:23 -0500
Message-Id: <1471579224-16075-1-git-send-email-matthew.weber@rockwellcollins.com>
List-ID: <linux-hwmon@vger.kernel.org>

Enables basic enumeration of ucd9000 devices via device tree.

Signed-off-by: Ronak Desai <ronak.desai@rockwellcollins.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 drivers/hwmon/pmbus/ucd9000.c | 38 +++++++++++++++++++++++++++++++++++---
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index fbb1479..207c30e 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -27,6 +27,9 @@
 #include <linux/i2c.h>
 #include <linux/i2c/pmbus.h>
 #include "pmbus.h"
+#ifdef CONFIG_OF
+#include <linux/of.h>
+#endif
 
 enum chips { ucd9000, ucd90120, ucd90124, ucd9090, ucd90910 };
 
@@ -108,6 +111,18 @@ static int ucd9000_read_byte_data(struct i2c_client *client, int page, int reg)
 	return ret;
 }
 
+#ifdef CONFIG_OF
+static struct of_device_id ucd9000_dt_match[] = {
+	{ .compatible = "ti,ucd9000", .data = (void *)ucd9000 },
+	{ .compatible = "ti,ucd90120", .data = (void *)ucd90120 },
+	{ .compatible = "ti,ucd90124", .data = (void *)ucd90124 },
+	{ .compatible = "ti,ucd9090", .data = (void *)ucd9090 },
+	{ .compatible = "ti,ucd90910", .data = (void *)ucd90910 },
+	{ }
+};
+#endif
+
+
 static const struct i2c_device_id ucd9000_id[] = {
 	{"ucd9000", ucd9000},
 	{"ucd90120", ucd90120},
@@ -118,6 +133,20 @@ static const struct i2c_device_id ucd9000_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, ucd9000_id);
 
+static inline int ucd9000_get_driver_data(struct i2c_client *i2c,
+		const struct i2c_device_id *id)
+{
+#ifdef CONFIG_OF
+	if (i2c->dev.of_node) {
+		const struct of_device_id *match;
+		match = of_match_node(ucd9000_dt_match, i2c->dev.of_node);
+		return (int)match->data;
+	}
+#endif
+	return (int)id->driver_data;
+}
+
+
 static int ucd9000_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
@@ -150,10 +179,10 @@ static int ucd9000_probe(struct i2c_client *client,
 		return -ENODEV;
 	}
 
-	if (id->driver_data != ucd9000 && id->driver_data != mid->driver_data)
+	if ((ucd9000_get_driver_data(client,id) != ucd9000) &&
+			(ucd9000_get_driver_data(client, id) != mid->driver_data))
 		dev_notice(&client->dev,
-			   "Device mismatch: Configured %s, detected %s\n",
-			   id->name, mid->name);
+			   "Device mismatch: Detected %s device\n", mid->name);
 
 	data = devm_kzalloc(&client->dev, sizeof(struct ucd9000_data),
 			    GFP_KERNEL);
@@ -233,6 +262,9 @@ static int ucd9000_probe(struct i2c_client *client,
 static struct i2c_driver ucd9000_driver = {
 	.driver = {
 		.name = "ucd9000",
+#ifdef CONFIG_OF
+		.of_match_table = of_match_ptr(ucd9000_dt_match),
+#endif
 	},
 	.probe = ucd9000_probe,
 	.remove = pmbus_do_remove,
-- 
1.9.1
