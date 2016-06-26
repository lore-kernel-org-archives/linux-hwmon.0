Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:35510 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751852AbcFZCkp (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sat, 25 Jun 2016 22:40:45 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Jean Delvare <jdelvare@suse.com>
Cc: Nishanth Menon <nm@ti.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 3/5] hwmon: (tmp102) Improve handling of initial read delay
Date: Sat, 25 Jun 2016 19:40:23 -0700
Message-Id: <1466908825-14222-3-git-send-email-linux@roeck-us.net>
In-Reply-To: <1466908825-14222-1-git-send-email-linux@roeck-us.net>
References: <1466908825-14222-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

If the chip was in shutdown mode when the driver was loaded, the first
conversion is ready no more than 35 milli-seconds after the chip was
taken out of shutdown. The driver delay was so far set to 333 ms (HZ / 3),
which is much higher than the maximum time needed by the chip.

Reduce the time to 35 milli-seconds. Instead of returning -EAGAIN if data
is not yet available, go to sleep for the remaining time.

Introduce a 'valid' flag to ensure that sensor data is actually read
even if requested less than 333 ms after the driver was loaded.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: No change

 drivers/hwmon/tmp102.c | 44 ++++++++++++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 16 deletions(-)

diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
index 5bdf262e6a0e..615f9c176aaf 100644
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
@@ -78,8 +82,16 @@ static struct tmp102 *tmp102_update_device(struct device *dev)
 	struct tmp102 *tmp102 = dev_get_drvdata(dev);
 	struct i2c_client *client = tmp102->client;
 
+	/* Is it too early to return a conversion ? */
+	if (time_before(jiffies, tmp102->ready_time)) {
+		unsigned long sleeptime = tmp102->ready_time - jiffies;
+
+		msleep(jiffies_to_msecs(sleeptime));
+	}
+
 	mutex_lock(&tmp102->lock);
-	if (time_after(jiffies, tmp102->last_update + HZ / 3)) {
+	if (!tmp102->valid ||
+	    time_after(jiffies, tmp102->last_update + HZ / 3)) {
 		int i;
 		for (i = 0; i < ARRAY_SIZE(tmp102->temp); ++i) {
 			int status = i2c_smbus_read_word_swapped(client,
@@ -88,7 +100,7 @@ static struct tmp102 *tmp102_update_device(struct device *dev)
 				tmp102->temp[i] = tmp102_reg_to_mC(status);
 		}
 		tmp102->last_update = jiffies;
-		tmp102->first_time = false;
+		tmp102->valid = true;
 	}
 	mutex_unlock(&tmp102->lock);
 	return tmp102;
@@ -98,12 +110,6 @@ static int tmp102_read_temp(void *dev, int *temp)
 {
 	struct tmp102 *tmp102 = tmp102_update_device(dev);
 
-	/* Is it too early even to return a conversion? */
-	if (tmp102->first_time) {
-		dev_dbg(dev, "%s: Conversion not ready yet..\n", __func__);
-		return -EAGAIN;
-	}
-
 	*temp = tmp102->temp[0];
 
 	return 0;
@@ -116,10 +122,6 @@ static ssize_t tmp102_show_temp(struct device *dev,
 	struct sensor_device_attribute *sda = to_sensor_dev_attr(attr);
 	struct tmp102 *tmp102 = tmp102_update_device(dev);
 
-	/* Is it too early even to return a read? */
-	if (tmp102->first_time)
-		return -EAGAIN;
-
 	return sprintf(buf, "%d\n", tmp102->temp[sda->index]);
 }
 
@@ -224,11 +226,18 @@ static int tmp102_probe(struct i2c_client *client,
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
@@ -261,12 +270,15 @@ static int tmp102_suspend(struct device *dev)
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

