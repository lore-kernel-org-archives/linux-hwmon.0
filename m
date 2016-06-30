Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Jean Delvare <jdelvare@suse.com>
Cc: Nishanth Menon <nm@ti.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v3 1/3] hwmon: (tmp102) Improve handling of initial read delay
Date: Wed, 29 Jun 2016 20:41:57 -0700
Message-Id: <1467258119-14071-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

If the chip was in shutdown mode when the driver was loaded, the first
conversion is ready no more than 35 milli-seconds after the chip was
taken out of shutdown. The driver delay was so far set to 333 ms (HZ / 3),
which is much higher than the maximum time needed by the chip.
Reduce the time to 35 milli-seconds.

Introduce a 'valid' flag to ensure that sensor data is actually read
even if requested less than 333 ms after the driver was loaded.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v3: Don't go to sleep if sensor readings are not available;
    instead, return -EAGAIN (matching previous behavior)
    tmp102_update_device() is now a void function.
v2: No change

Note: This series depends on the following two patches in -next.

hwmon: (tmp102) Drop FSF address
hwmon: (tmp102) Use devm_add_action to register cleanup function

 drivers/hwmon/tmp102.c | 44 ++++++++++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
index 5bdf262e6a0e..fd4a4515692a 100644
--- a/drivers/hwmon/tmp102.c
+++ b/drivers/hwmon/tmp102.c
@@ -13,6 +13,7 @@
  * GNU General Public License for more details.
  */
 
+#include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/slab.h>
@@ -46,13 +47,16 @@
 #define	TMP102_TLOW_REG			0x02
 #define	TMP102_THIGH_REG		0x03
 
+#define CONVERSION_TIME_MS		35	/* in milli-seconds */
+
 struct tmp102 {
 	struct i2c_client *client;
 	struct mutex lock;
 	u16 config_orig;
 	unsigned long last_update;
+	unsigned long ready_time;
+	bool valid;
 	int temp[3];
-	bool first_time;
 };
 
 /* convert left adjusted 13-bit TMP102 register value to milliCelsius */
@@ -73,13 +77,14 @@ static const u8 tmp102_reg[] = {
 	TMP102_THIGH_REG,
 };
 
-static struct tmp102 *tmp102_update_device(struct device *dev)
+static void tmp102_update_device(struct device *dev)
 {
 	struct tmp102 *tmp102 = dev_get_drvdata(dev);
 	struct i2c_client *client = tmp102->client;
 
 	mutex_lock(&tmp102->lock);
-	if (time_after(jiffies, tmp102->last_update + HZ / 3)) {
+	if (!tmp102->valid ||
+	    time_after(jiffies, tmp102->last_update + HZ / 3)) {
 		int i;
 		for (i = 0; i < ARRAY_SIZE(tmp102->temp); ++i) {
 			int status = i2c_smbus_read_word_swapped(client,
@@ -88,22 +93,22 @@ static struct tmp102 *tmp102_update_device(struct device *dev)
 				tmp102->temp[i] = tmp102_reg_to_mC(status);
 		}
 		tmp102->last_update = jiffies;
-		tmp102->first_time = false;
+		tmp102->valid = true;
 	}
 	mutex_unlock(&tmp102->lock);
-	return tmp102;
 }
 
 static int tmp102_read_temp(void *dev, int *temp)
 {
-	struct tmp102 *tmp102 = tmp102_update_device(dev);
+	struct tmp102 *tmp102 = dev_get_drvdata(dev);
 
-	/* Is it too early even to return a conversion? */
-	if (tmp102->first_time) {
+	if (time_before(jiffies, tmp102->ready_time)) {
 		dev_dbg(dev, "%s: Conversion not ready yet..\n", __func__);
 		return -EAGAIN;
 	}
 
+	tmp102_update_device(dev);
+
 	*temp = tmp102->temp[0];
 
 	return 0;
@@ -114,12 +119,13 @@ static ssize_t tmp102_show_temp(struct device *dev,
 				char *buf)
 {
 	struct sensor_device_attribute *sda = to_sensor_dev_attr(attr);
-	struct tmp102 *tmp102 = tmp102_update_device(dev);
+	struct tmp102 *tmp102 = dev_get_drvdata(dev);
 
-	/* Is it too early even to return a read? */
-	if (tmp102->first_time)
+	if (time_before(jiffies, tmp102->ready_time))
 		return -EAGAIN;
 
+	tmp102_update_device(dev);
+
 	return sprintf(buf, "%d\n", tmp102->temp[sda->index]);
 }
 
@@ -224,11 +230,18 @@ static int tmp102_probe(struct i2c_client *client,
 		dev_err(dev, "config settings did not stick\n");
 		return -ENODEV;
 	}
-	tmp102->last_update = jiffies;
-	/* Mark that we are not ready with data until conversion is complete */
-	tmp102->first_time = true;
+
 	mutex_init(&tmp102->lock);
 
+	tmp102->ready_time = jiffies;
+	if (tmp102->config_orig & TMP102_CONF_SD) {
+		/*
+		 * Mark that we are not ready with data until the first
+		 * conversion is complete
+		 */
+		tmp102->ready_time += msecs_to_jiffies(CONVERSION_TIME_MS);
+	}
+
 	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
 							   tmp102,
 							   tmp102_groups);
@@ -261,12 +274,15 @@ static int tmp102_suspend(struct device *dev)
 static int tmp102_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
+	struct tmp102 *tmp102 = i2c_get_clientdata(client);
 	int config;
 
 	config = i2c_smbus_read_word_swapped(client, TMP102_CONF_REG);
 	if (config < 0)
 		return config;
 
+	tmp102->ready_time = jiffies + msecs_to_jiffies(CONVERSION_TIME_MS);
+
 	config &= ~TMP102_CONF_SD;
 	return i2c_smbus_write_word_swapped(client, TMP102_CONF_REG, config);
 }
-- 
2.5.0
