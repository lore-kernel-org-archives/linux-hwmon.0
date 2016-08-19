Return-path: <matthew.weber@rockwellcollins.com>
From: Matt Weber <matthew.weber@rockwellcollins.com>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net,
	jdelvare@suse.com,
	Matt Weber <matthew.weber@rockwellcollins.com>,
	Ronak Desai <ronak.desai@rockwellcollins.com>
Subject: [PATCH] hwmon: (amc6821) basic device tree support
Date: Thu, 18 Aug 2016 23:00:58 -0500
Message-Id: <1471579258-16148-1-git-send-email-matthew.weber@rockwellcollins.com>
List-ID: <linux-hwmon@vger.kernel.org>

Enables basic enumeration of a amc6821 device via device tree.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Ronak Desai <ronak.desai@rockwellcollins.com>
---
 drivers/hwmon/amc6821.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/hwmon/amc6821.c b/drivers/hwmon/amc6821.c
index 12e851a..77b5cf4 100644
--- a/drivers/hwmon/amc6821.c
+++ b/drivers/hwmon/amc6821.c
@@ -32,6 +32,9 @@
 #include <linux/err.h>
 #include <linux/mutex.h>
 
+#ifdef CONFIG_OF
+#include <linux/of.h>
+#endif
 /*
  * Addresses to scan.
  */
@@ -996,6 +999,12 @@ static int amc6821_probe(struct i2c_client *client,
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
+#ifdef CONFIG_OF
+static const struct of_device_id amc6821_dt_match[] = {
+	{ .compatible = "ti,amc6821", .data = (void *)amc6821 },
+	{ }
+};
+#endif
 static const struct i2c_device_id amc6821_id[] = {
 	{ "amc6821", amc6821 },
 	{ }
@@ -1007,6 +1016,9 @@ static struct i2c_driver amc6821_driver = {
 	.class = I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "amc6821",
+#ifdef CONFIG_OF
+		.of_match_table = of_match_ptr(amc6821_dt_match),
+#endif
 	},
 	.probe = amc6821_probe,
 	.id_table = amc6821_id,
-- 
1.9.1
