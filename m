Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40876 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727319AbeJDOnH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Oct 2018 10:43:07 -0400
Received: by mail-lf1-f66.google.com with SMTP id t22-v6so6055285lfb.7
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Oct 2018 00:51:09 -0700 (PDT)
From: Wojciech Slenska <wojciech.slenska@gmail.com>
To: linux-hwmon@vger.kernel.org
Cc: Wojciech Slenska <wojciech.slenska@gmail.com>
Subject: [PATCH] hwmon: (sht3x) add devicetree support
Date: Thu,  4 Oct 2018 09:50:51 +0200
Message-Id: <1538639451-28264-1-git-send-email-wojciech.slenska@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
---
 Documentation/devicetree/bindings/hwmon/sht3x.txt | 16 +++++++++++++
 drivers/hwmon/sht3x.c                             | 28 ++++++++++++++++++++---
 2 files changed, 41 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/sht3x.txt

diff --git a/Documentation/devicetree/bindings/hwmon/sht3x.txt b/Documentation/devicetree/bindings/hwmon/sht3x.txt
new file mode 100644
index 0000000..80b117e
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/sht3x.txt
@@ -0,0 +1,16 @@
+Sensirion SHT3x Humidity and Temperature Sensor
+
+Required node properties:
+- compatible: "sensirion,sht3x" or "sensirion,sts3x"
+- reg: I2C bus address of the device
+
+Optional properties:
+- blocking-io: enable blocking mode on i2c
+- no-high-precision: disable high accuracy
+
+Example sht3x node:
+
+sensor {
+	compatible = "sensirion,sht3x";
+	reg = <0x4a>;
+}
diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index 370b57d..1f8b7e7 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -31,6 +31,7 @@
 #include <linux/slab.h>
 #include <linux/jiffies.h>
 #include <linux/platform_data/sht3x.h>
+#include <linux/of.h>
 
 /* commands (high precision mode) */
 static const unsigned char sht3x_cmd_measure_blocking_hpm[]    = { 0x2c, 0x06 };
@@ -699,6 +700,7 @@ static int sht3x_probe(struct i2c_client *client,
 	struct i2c_adapter *adap = client->adapter;
 	struct device *dev = &client->dev;
 	const struct attribute_group **attribute_groups;
+	struct device_node *np = client->dev.of_node;
 
 	/*
 	 * we require full i2c support since the sht3x uses multi-byte read and
@@ -724,8 +726,16 @@ static int sht3x_probe(struct i2c_client *client,
 	data->client = client;
 	crc8_populate_msb(sht3x_crc8_table, SHT3X_CRC8_POLYNOMIAL);
 
-	if (client->dev.platform_data)
-		data->setup = *(struct sht3x_platform_data *)dev->platform_data;
+	if (np) {
+		if (of_find_property(np, "blocking-io", NULL))
+			data->setup.blocking_io = true;
+		if (of_find_property(np, "no-high-precision", NULL))
+			data->setup.high_precision = false;
+	} else {
+		if (client->dev.platform_data)
+			data->setup = *(struct sht3x_platform_data *)
+				dev->platform_data;
+	}
 
 	sht3x_select_command(data);
 
@@ -768,8 +778,20 @@ static const struct i2c_device_id sht3x_ids[] = {
 
 MODULE_DEVICE_TABLE(i2c, sht3x_ids);
 
+#ifdef CONFIG_OF
+static const struct of_device_id sht3x_dt_match[] = {
+	{ .compatible = "sensirion,sht3x" },
+	{ .compatible = "sensirion,sts3x" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, sht3x_dt_match);
+#endif
+
 static struct i2c_driver sht3x_i2c_driver = {
-	.driver.name = "sht3x",
+	.driver = {
+		.name = "sht3x",
+		.of_match_table = of_match_ptr(sht3x_dt_match),
+	},
 	.probe       = sht3x_probe,
 	.id_table    = sht3x_ids,
 };
-- 
2.7.4
