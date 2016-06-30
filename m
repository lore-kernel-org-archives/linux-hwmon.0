Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:34124 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751203AbcF3Gpa (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Thu, 30 Jun 2016 02:45:30 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v3 1/4] hwmon: (lm75) Handle cleanup with devm_add_action
Date: Wed, 29 Jun 2016 23:45:25 -0700
Message-Id: <1467269128-7448-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Use devm_add_action() to register the function to restore the original
chip configuration. Use devm_hwmon_device_register_with_groups()
to register the hwmon device, and drop the remove function as no
longer needed.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2, v3: No change

 drivers/hwmon/lm75.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 69166ab3151d..0df745501a1f 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -76,7 +76,6 @@ static const u8 LM75_REG_TEMP[3] = {
 /* Each client has this additional data */
 struct lm75_data {
 	struct i2c_client	*client;
-	struct device		*hwmon_dev;
 	struct mutex		update_lock;
 	u8			orig_conf;
 	u8			resolution;	/* In bits, between 9 and 12 */
@@ -185,10 +184,19 @@ static const struct thermal_zone_of_device_ops lm75_of_thermal_ops = {
 
 /* device probe and removal */
 
+static void lm75_remove(void *data)
+{
+	struct lm75_data *lm75 = data;
+	struct i2c_client *client = lm75->client;
+
+	i2c_smbus_write_byte_data(client, LM75_REG_CONF, lm75->orig_conf);
+}
+
 static int
 lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
 {
 	struct device *dev = &client->dev;
+	struct device *hwmon_dev;
 	struct lm75_data *data;
 	int status;
 	u8 set_mask, clr_mask;
@@ -298,29 +306,22 @@ lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	new |= set_mask;
 	if (status != new)
 		lm75_write_value(client, LM75_REG_CONF, new);
-	dev_dbg(dev, "Config %02x\n", new);
 
-	data->hwmon_dev = hwmon_device_register_with_groups(dev, client->name,
-							    data, lm75_groups);
-	if (IS_ERR(data->hwmon_dev))
-		return PTR_ERR(data->hwmon_dev);
+	devm_add_action(dev, lm75_remove, data);
 
-	devm_thermal_zone_of_sensor_register(data->hwmon_dev, 0,
-					     data->hwmon_dev,
-					     &lm75_of_thermal_ops);
+	dev_dbg(dev, "Config %02x\n", new);
 
-	dev_info(dev, "%s: sensor '%s'\n",
-		 dev_name(data->hwmon_dev), client->name);
+	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
+							   data, lm75_groups);
+	if (IS_ERR(hwmon_dev))
+		return PTR_ERR(hwmon_dev);
 
-	return 0;
-}
+	devm_thermal_zone_of_sensor_register(hwmon_dev, 0,
+					     hwmon_dev,
+					     &lm75_of_thermal_ops);
 
-static int lm75_remove(struct i2c_client *client)
-{
-	struct lm75_data *data = i2c_get_clientdata(client);
+	dev_info(dev, "%s: sensor '%s'\n", dev_name(hwmon_dev), client->name);
 
-	hwmon_device_unregister(data->hwmon_dev);
-	lm75_write_value(client, LM75_REG_CONF, data->orig_conf);
 	return 0;
 }
 
@@ -489,7 +490,6 @@ static struct i2c_driver lm75_driver = {
 		.pm	= LM75_DEV_PM_OPS,
 	},
 	.probe		= lm75_probe,
-	.remove		= lm75_remove,
 	.id_table	= lm75_ids,
 	.detect		= lm75_detect,
 	.address_list	= normal_i2c,
-- 
2.5.0

