Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from atl4mhob14.myregisteredsite.com ([209.17.115.52]:56856 "EHLO
        atl4mhob14.myregisteredsite.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1754398AbcHVGsH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 22 Aug 2016 02:48:07 -0400
Received: from mailpod.hostingplatform.com ([10.30.71.204])
        by atl4mhob14.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id u7M6m1aE019867
        for <linux-hwmon@vger.kernel.org>; Mon, 22 Aug 2016 02:48:01 -0400
From: Mike Looijmans <mike.looijmans@topic.nl>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net, linux-kernel@vger.kernel.org, hjk@hansjkoch.de,
        Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH v5] hwmon: (max6650.c) Add devicetree support
Date: Mon, 22 Aug 2016 08:47:51 +0200
Message-Id: <1471848471-13144-1-git-send-email-mike.looijmans@topic.nl>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Parse devicetree parameters for voltage and prescaler setting. This allows
using multiple max6550 devices with varying settings, and also makes it
possible to instantiate and configure the device using devicetree.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
v5: Accept only 12V or 5V supply voltage
v4: Vendor prefix "maxim," for devicetree properties and compatible string
    Split documentation into separate patch
v3: Resubmit because wrong mailing lists used
    Fix style errors as reported by checkpatch.pl
    Fix bug in DT parsing of fan-prescale
v2: Add devicetree binding documentation
    Code changes as suggested by Guenter
    Reduce log info, output only a single line
 drivers/hwmon/max6650.c | 47 ++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
index 162a520..c87517a 100644
--- a/drivers/hwmon/max6650.c
+++ b/drivers/hwmon/max6650.c
@@ -39,6 +39,7 @@
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
+#include <linux/of_device.h>
 
 /*
  * Insmod parameters
@@ -48,7 +49,7 @@
 static int fan_voltage;
 /* prescaler: Possible values are 1, 2, 4, 8, 16 or 0 for don't change */
 static int prescaler;
-/* clock: The clock frequency of the chip the driver should assume */
+/* clock: The clock frequency of the chip (max6651 can be clocked externally) */
 static int clock = 254000;
 
 module_param(fan_voltage, int, S_IRUGO);
@@ -133,6 +134,19 @@ static const u8 tach_reg[] = {
 	MAX6650_REG_TACH3,
 };
 
+static const struct of_device_id max6650_dt_match[] = {
+	{
+		.compatible = "maxim,max6650",
+		.data = (void *)1
+	},
+	{
+		.compatible = "maxim,max6651",
+		.data = (void *)4
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, max6650_dt_match);
+
 static struct max6650_data *max6650_update_device(struct device *dev)
 {
 	struct max6650_data *data = dev_get_drvdata(dev);
@@ -566,6 +580,17 @@ static int max6650_init_client(struct max6650_data *data,
 	struct device *dev = &client->dev;
 	int config;
 	int err = -EIO;
+	u32 voltage;
+	u32 prescale;
+
+	if (of_property_read_u32(dev->of_node, "maxim,fan-microvolt",
+				 &voltage))
+		voltage = fan_voltage;
+	else
+		voltage /= 1000000; /* Microvolts to volts */
+	if (of_property_read_u32(dev->of_node, "maxim,fan-prescale",
+				 &prescale))
+		prescale = prescaler;
 
 	config = i2c_smbus_read_byte_data(client, MAX6650_REG_CONFIG);
 
@@ -574,7 +599,7 @@ static int max6650_init_client(struct max6650_data *data,
 		return err;
 	}
 
-	switch (fan_voltage) {
+	switch (voltage) {
 	case 0:
 		break;
 	case 5:
@@ -584,14 +609,10 @@ static int max6650_init_client(struct max6650_data *data,
 		config |= MAX6650_CFG_V12;
 		break;
 	default:
-		dev_err(dev, "illegal value for fan_voltage (%d)\n",
-			fan_voltage);
+		dev_err(dev, "illegal value for fan_voltage (%d)\n", voltage);
 	}
 
-	dev_info(dev, "Fan voltage is set to %dV.\n",
-		 (config & MAX6650_CFG_V12) ? 12 : 5);
-
-	switch (prescaler) {
+	switch (prescale) {
 	case 0:
 		break;
 	case 1:
@@ -614,10 +635,11 @@ static int max6650_init_client(struct max6650_data *data,
 			 | MAX6650_CFG_PRESCALER_16;
 		break;
 	default:
-		dev_err(dev, "illegal value for prescaler (%d)\n", prescaler);
+		dev_err(dev, "illegal value for prescaler (%d)\n", prescale);
 	}
 
-	dev_info(dev, "Prescaler is set to %d.\n",
+	dev_info(dev, "Fan voltage: %dV, prescaler: %d.\n",
+		 (config & MAX6650_CFG_V12) ? 12 : 5,
 		 1 << (config & MAX6650_CFG_PRESCALER_MASK));
 
 	/*
@@ -651,6 +673,8 @@ static int max6650_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
 	struct device *dev = &client->dev;
+	const struct of_device_id *of_id =
+		of_match_device(of_match_ptr(max6650_dt_match), dev);
 	struct max6650_data *data;
 	struct device *hwmon_dev;
 	int err;
@@ -661,7 +685,7 @@ static int max6650_probe(struct i2c_client *client,
 
 	data->client = client;
 	mutex_init(&data->update_lock);
-	data->nr_fans = id->driver_data;
+	data->nr_fans = of_id ? (int)(uintptr_t)of_id->data : id->driver_data;
 
 	/*
 	 * Initialize the max6650 chip
@@ -691,6 +715,7 @@ MODULE_DEVICE_TABLE(i2c, max6650_id);
 static struct i2c_driver max6650_driver = {
 	.driver = {
 		.name	= "max6650",
+		.of_match_table = of_match_ptr(max6650_dt_match),
 	},
 	.probe		= max6650_probe,
 	.id_table	= max6650_id,
-- 
1.9.1

