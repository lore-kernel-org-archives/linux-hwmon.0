Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/6] hwmon: (lm90) Use devm_hwmon_device_register_with_groups
Date: Thu, 30 Jun 2016 06:50:57 -0700
Message-Id: <1467294661-23879-2-git-send-email-linux@roeck-us.net>
In-Reply-To: <1467294661-23879-1-git-send-email-linux@roeck-us.net>
References: <1467294661-23879-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Since all other cleanup handled with devm_add_action, we can use
devm_hwmon_device_register_with_groups() to register the hwmon
device, and drop the remove function.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm90.c | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 4b530ef731aa..9d733cb0504c 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -366,7 +366,6 @@ enum lm90_temp11_reg_index {
 
 struct lm90_data {
 	struct i2c_client *client;
-	struct device *hwmon_dev;
 	const struct attribute_group *groups[6];
 	struct mutex update_lock;
 	char valid; /* zero until following fields are valid */
@@ -1527,6 +1526,7 @@ static int lm90_probe(struct i2c_client *client,
 	struct i2c_adapter *adapter = to_i2c_adapter(dev->parent);
 	struct lm90_data *data;
 	struct regulator *regulator;
+	struct device *hwmon_dev;
 	int groups = 0;
 	int err;
 
@@ -1595,10 +1595,10 @@ static int lm90_probe(struct i2c_client *client,
 		devm_add_action(dev, lm90_remove_pec, dev);
 	}
 
-	data->hwmon_dev = hwmon_device_register_with_groups(dev, client->name,
-							    data, data->groups);
-	if (IS_ERR(data->hwmon_dev))
-		return PTR_ERR(data->hwmon_dev);
+	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
+							   data, data->groups);
+	if (IS_ERR(hwmon_dev))
+		return PTR_ERR(hwmon_dev);
 
 	if (client->irq) {
 		dev_dbg(dev, "IRQ: %d\n", client->irq);
@@ -1608,24 +1608,11 @@ static int lm90_probe(struct i2c_client *client,
 						"lm90", client);
 		if (err < 0) {
 			dev_err(dev, "cannot request IRQ %d\n", client->irq);
-			goto exit_unregister;
+			return err;
 		}
 	}
 
 	return 0;
-
-exit_unregister:
-	hwmon_device_unregister(data->hwmon_dev);
-	return err;
-}
-
-static int lm90_remove(struct i2c_client *client)
-{
-	struct lm90_data *data = i2c_get_clientdata(client);
-
-	hwmon_device_unregister(data->hwmon_dev);
-
-	return 0;
 }
 
 static void lm90_alert(struct i2c_client *client, unsigned int flag)
@@ -1659,7 +1646,6 @@ static struct i2c_driver lm90_driver = {
 		.name	= "lm90",
 	},
 	.probe		= lm90_probe,
-	.remove		= lm90_remove,
 	.alert		= lm90_alert,
 	.id_table	= lm90_id,
 	.detect		= lm90_detect,
-- 
2.5.0
