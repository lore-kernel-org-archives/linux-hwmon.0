Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:34144 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751831AbcF3Gpb (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Thu, 30 Jun 2016 02:45:31 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v3 2/4] hwmon: (lm75) Drop lm75_read_value and lm75_write_value
Date: Wed, 29 Jun 2016 23:45:26 -0700
Message-Id: <1467269128-7448-2-git-send-email-linux@roeck-us.net>
In-Reply-To: <1467269128-7448-1-git-send-email-linux@roeck-us.net>
References: <1467269128-7448-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

lm75_read_value and lm75_write_value don't really add any value.
Replace with direct smbus access functions.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2, v3: No change

 drivers/hwmon/lm75.c | 42 +++++++++---------------------------------
 1 file changed, 9 insertions(+), 33 deletions(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 0df745501a1f..7b18cbd4a5ec 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -89,8 +89,6 @@ struct lm75_data {
 						   2 = hyst */
 };
 
-static int lm75_read_value(struct i2c_client *client, u8 reg);
-static int lm75_write_value(struct i2c_client *client, u8 reg, u16 value);
 static struct lm75_data *lm75_update_device(struct device *dev);
 
 
@@ -156,7 +154,7 @@ static ssize_t set_temp(struct device *dev, struct device_attribute *da,
 	temp = clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
 	data->temp[nr] = DIV_ROUND_CLOSEST(temp  << (resolution - 8),
 					   1000) << (16 - resolution);
-	lm75_write_value(client, LM75_REG_TEMP[nr], data->temp[nr]);
+	i2c_smbus_write_word_swapped(client, LM75_REG_TEMP[nr], data->temp[nr]);
 	mutex_unlock(&data->update_lock);
 	return count;
 }
@@ -296,7 +294,7 @@ lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	}
 
 	/* configure as specified */
-	status = lm75_read_value(client, LM75_REG_CONF);
+	status = i2c_smbus_read_byte_data(client, LM75_REG_CONF);
 	if (status < 0) {
 		dev_dbg(dev, "Can't read config? %d\n", status);
 		return status;
@@ -305,7 +303,7 @@ lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	new = status & ~clr_mask;
 	new |= set_mask;
 	if (status != new)
-		lm75_write_value(client, LM75_REG_CONF, new);
+		i2c_smbus_write_byte_data(client, LM75_REG_CONF, new);
 
 	devm_add_action(dev, lm75_remove, data);
 
@@ -450,13 +448,13 @@ static int lm75_suspend(struct device *dev)
 {
 	int status;
 	struct i2c_client *client = to_i2c_client(dev);
-	status = lm75_read_value(client, LM75_REG_CONF);
+	status = i2c_smbus_read_byte_data(client, LM75_REG_CONF);
 	if (status < 0) {
 		dev_dbg(&client->dev, "Can't read config? %d\n", status);
 		return status;
 	}
 	status = status | LM75_SHUTDOWN;
-	lm75_write_value(client, LM75_REG_CONF, status);
+	i2c_smbus_write_byte_data(client, LM75_REG_CONF, status);
 	return 0;
 }
 
@@ -464,13 +462,13 @@ static int lm75_resume(struct device *dev)
 {
 	int status;
 	struct i2c_client *client = to_i2c_client(dev);
-	status = lm75_read_value(client, LM75_REG_CONF);
+	status = i2c_smbus_read_byte_data(client, LM75_REG_CONF);
 	if (status < 0) {
 		dev_dbg(&client->dev, "Can't read config? %d\n", status);
 		return status;
 	}
 	status = status & ~LM75_SHUTDOWN;
-	lm75_write_value(client, LM75_REG_CONF, status);
+	i2c_smbus_write_byte_data(client, LM75_REG_CONF, status);
 	return 0;
 }
 
@@ -497,29 +495,6 @@ static struct i2c_driver lm75_driver = {
 
 /*-----------------------------------------------------------------------*/
 
-/* register access */
-
-/*
- * All registers are word-sized, except for the configuration register.
- * LM75 uses a high-byte first convention, which is exactly opposite to
- * the SMBus standard.
- */
-static int lm75_read_value(struct i2c_client *client, u8 reg)
-{
-	if (reg == LM75_REG_CONF)
-		return i2c_smbus_read_byte_data(client, reg);
-	else
-		return i2c_smbus_read_word_swapped(client, reg);
-}
-
-static int lm75_write_value(struct i2c_client *client, u8 reg, u16 value)
-{
-	if (reg == LM75_REG_CONF)
-		return i2c_smbus_write_byte_data(client, reg, value);
-	else
-		return i2c_smbus_write_word_swapped(client, reg, value);
-}
-
 static struct lm75_data *lm75_update_device(struct device *dev)
 {
 	struct lm75_data *data = dev_get_drvdata(dev);
@@ -536,7 +511,8 @@ static struct lm75_data *lm75_update_device(struct device *dev)
 		for (i = 0; i < ARRAY_SIZE(data->temp); i++) {
 			int status;
 
-			status = lm75_read_value(client, LM75_REG_TEMP[i]);
+			status = i2c_smbus_read_word_swapped(client,
+							     LM75_REG_TEMP[i]);
 			if (unlikely(status < 0)) {
 				dev_dbg(dev,
 					"LM75: Failed to read value: reg %d, error %d\n",
-- 
2.5.0

