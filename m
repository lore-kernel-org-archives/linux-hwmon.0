Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Jean Delvare <jdelvare@suse.com>
Cc: Nishanth Menon <nm@ti.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/5] hwmon: (tmp102) Use devm_add_action to register cleanup function
Date: Thu, 23 Jun 2016 17:28:24 -0700
Message-Id: <1466728108-2512-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

By registering a cleanup function with devm_add_action(), we can
simplify the error path in the probe function and drop the remove
function entirely.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/tmp102.c | 54 ++++++++++++++++++--------------------------------
 1 file changed, 19 insertions(+), 35 deletions(-)

diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
index f1e96fd7f445..befd06b6f3a5 100644
--- a/drivers/hwmon/tmp102.c
+++ b/drivers/hwmon/tmp102.c
@@ -52,7 +52,6 @@
 
 struct tmp102 {
 	struct i2c_client *client;
-	struct device *hwmon_dev;
 	struct mutex lock;
 	u16 config_orig;
 	unsigned long last_update;
@@ -173,6 +172,15 @@ static const struct thermal_zone_of_device_ops tmp102_of_thermal_ops = {
 	.get_temp = tmp102_read_temp,
 };
 
+static void tmp102_restore_config(void *data)
+{
+	struct tmp102 *tmp102 = data;
+	struct i2c_client *client = tmp102->client;
+
+	i2c_smbus_write_word_swapped(client, TMP102_CONF_REG,
+				     tmp102->config_orig);
+}
+
 static int tmp102_probe(struct i2c_client *client,
 				  const struct i2c_device_id *id)
 {
@@ -201,66 +209,43 @@ static int tmp102_probe(struct i2c_client *client,
 		return status;
 	}
 	tmp102->config_orig = status;
+
+	devm_add_action(dev, tmp102_restore_config, tmp102);
+
 	status = i2c_smbus_write_word_swapped(client, TMP102_CONF_REG,
 					      TMP102_CONFIG);
 	if (status < 0) {
 		dev_err(dev, "error writing config register\n");
-		goto fail_restore_config;
+		return status;
 	}
 	status = i2c_smbus_read_word_swapped(client, TMP102_CONF_REG);
 	if (status < 0) {
 		dev_err(dev, "error reading config register\n");
-		goto fail_restore_config;
+		return status;
 	}
 	status &= ~TMP102_CONFIG_RD_ONLY;
 	if (status != TMP102_CONFIG) {
 		dev_err(dev, "config settings did not stick\n");
-		status = -ENODEV;
-		goto fail_restore_config;
+		return -ENODEV;
 	}
 	tmp102->last_update = jiffies;
 	/* Mark that we are not ready with data until conversion is complete */
 	tmp102->first_time = true;
 	mutex_init(&tmp102->lock);
 
-	hwmon_dev = hwmon_device_register_with_groups(dev, client->name,
-						      tmp102, tmp102_groups);
+	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
+							   tmp102,
+							   tmp102_groups);
 	if (IS_ERR(hwmon_dev)) {
 		dev_dbg(dev, "unable to register hwmon device\n");
-		status = PTR_ERR(hwmon_dev);
-		goto fail_restore_config;
+		return PTR_ERR(hwmon_dev);
 	}
-	tmp102->hwmon_dev = hwmon_dev;
 	devm_thermal_zone_of_sensor_register(hwmon_dev, 0, hwmon_dev,
 					     &tmp102_of_thermal_ops);
 
 	dev_info(dev, "initialized\n");
 
 	return 0;
-
-fail_restore_config:
-	i2c_smbus_write_word_swapped(client, TMP102_CONF_REG,
-				     tmp102->config_orig);
-	return status;
-}
-
-static int tmp102_remove(struct i2c_client *client)
-{
-	struct tmp102 *tmp102 = i2c_get_clientdata(client);
-
-	hwmon_device_unregister(tmp102->hwmon_dev);
-
-	/* Stop monitoring if device was stopped originally */
-	if (tmp102->config_orig & TMP102_CONF_SD) {
-		int config;
-
-		config = i2c_smbus_read_word_swapped(client, TMP102_CONF_REG);
-		if (config >= 0)
-			i2c_smbus_write_word_swapped(client, TMP102_CONF_REG,
-						     config | TMP102_CONF_SD);
-	}
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -303,7 +288,6 @@ static struct i2c_driver tmp102_driver = {
 	.driver.name	= DRIVER_NAME,
 	.driver.pm	= &tmp102_dev_pm_ops,
 	.probe		= tmp102_probe,
-	.remove		= tmp102_remove,
 	.id_table	= tmp102_id,
 };
 
-- 
2.5.0
