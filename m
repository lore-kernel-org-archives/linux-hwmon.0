Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/6] hwmon: (lm90) Use devm_add_action for cleanup
Date: Thu, 30 Jun 2016 06:50:56 -0700
Message-Id: <1467294661-23879-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Use devm_add_action where possible to simplify error handling and
cleanup on remove.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm90.c | 40 ++++++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index e30a5939dc0d..4b530ef731aa 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -369,7 +369,6 @@ struct lm90_data {
 	struct device *hwmon_dev;
 	const struct attribute_group *groups[6];
 	struct mutex update_lock;
-	struct regulator *regulator;
 	char valid; /* zero until following fields are valid */
 	unsigned long last_updated; /* in jiffies */
 	int kind;
@@ -1404,8 +1403,11 @@ static int lm90_detect(struct i2c_client *client,
 	return 0;
 }
 
-static void lm90_restore_conf(struct i2c_client *client, struct lm90_data *data)
+static void lm90_restore_conf(void *_data)
 {
+	struct lm90_data *data = _data;
+	struct i2c_client *client = data->client;
+
 	/* Restore initial configuration */
 	i2c_smbus_write_byte_data(client, LM90_REG_W_CONVRATE,
 				  data->convrate_orig);
@@ -1456,6 +1458,8 @@ static void lm90_init_client(struct i2c_client *client, struct lm90_data *data)
 	config &= 0xBF;	/* run */
 	if (config != data->config_orig) /* Only write if changed */
 		i2c_smbus_write_byte_data(client, LM90_REG_W_CONFIG1, config);
+
+	devm_add_action(&client->dev, lm90_restore_conf, data);
 }
 
 static bool lm90_is_tripped(struct i2c_client *client, u16 *status)
@@ -1506,6 +1510,16 @@ static irqreturn_t lm90_irq_thread(int irq, void *dev_id)
 		return IRQ_NONE;
 }
 
+static void lm90_remove_pec(void *dev)
+{
+	device_remove_file(dev, &dev_attr_pec);
+}
+
+static void lm90_regulator_disable(void *regulator)
+{
+	regulator_disable(regulator);
+}
+
 static int lm90_probe(struct i2c_client *client,
 		      const struct i2c_device_id *id)
 {
@@ -1526,6 +1540,8 @@ static int lm90_probe(struct i2c_client *client,
 		return err;
 	}
 
+	devm_add_action(dev, lm90_regulator_disable, regulator);
+
 	data = devm_kzalloc(dev, sizeof(struct lm90_data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
@@ -1534,8 +1550,6 @@ static int lm90_probe(struct i2c_client *client,
 	i2c_set_clientdata(client, data);
 	mutex_init(&data->update_lock);
 
-	data->regulator = regulator;
-
 	/* Set the device type */
 	data->kind = id->driver_data;
 	if (data->kind == adm1032) {
@@ -1577,15 +1591,14 @@ static int lm90_probe(struct i2c_client *client,
 	if (client->flags & I2C_CLIENT_PEC) {
 		err = device_create_file(dev, &dev_attr_pec);
 		if (err)
-			goto exit_restore;
+			return err;
+		devm_add_action(dev, lm90_remove_pec, dev);
 	}
 
 	data->hwmon_dev = hwmon_device_register_with_groups(dev, client->name,
 							    data, data->groups);
-	if (IS_ERR(data->hwmon_dev)) {
-		err = PTR_ERR(data->hwmon_dev);
-		goto exit_remove_pec;
-	}
+	if (IS_ERR(data->hwmon_dev))
+		return PTR_ERR(data->hwmon_dev);
 
 	if (client->irq) {
 		dev_dbg(dev, "IRQ: %d\n", client->irq);
@@ -1603,12 +1616,6 @@ static int lm90_probe(struct i2c_client *client,
 
 exit_unregister:
 	hwmon_device_unregister(data->hwmon_dev);
-exit_remove_pec:
-	device_remove_file(dev, &dev_attr_pec);
-exit_restore:
-	lm90_restore_conf(client, data);
-	regulator_disable(data->regulator);
-
 	return err;
 }
 
@@ -1617,9 +1624,6 @@ static int lm90_remove(struct i2c_client *client)
 	struct lm90_data *data = i2c_get_clientdata(client);
 
 	hwmon_device_unregister(data->hwmon_dev);
-	device_remove_file(&client->dev, &dev_attr_pec);
-	lm90_restore_conf(client, data);
-	regulator_disable(data->regulator);
 
 	return 0;
 }
-- 
2.5.0
