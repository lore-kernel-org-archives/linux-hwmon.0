Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/6] hwmon: (lm95241) Fix overflow problems, write conversion rate to chip
Date: Sun,  7 Aug 2016 16:31:55 -0700
Message-Id: <1470612720-30165-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Writing the update_interval attribute could result in an overflow if
a number close to the maximum unsigned long was written. At the same
time, even though the chip supports setting the conversion rate,
the selected conversion rate was not actually written to the chip.

Fix the second problem by selecting valid (supported) conversion rates,
and writing the selected conversion rate to the chip. This also fixes the
first problem, since arbitrary conversion rates are now converted to
actually supported conversion rates.

Also, set the default chip conversion rate to 1 second. Previously, the
chip was configured for continuous conversion, but readings were only
retrieved every seond, which doesn't make much sense. If we only read a
value from the chip every second, we can as well save some power and only
convert in one-second intervals.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm95241.c | 40 +++++++++++++++++++++++++++++++++-------
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/lm95241.c b/drivers/hwmon/lm95241.c
index cdf19adaec79..a8cf666fe661 100644
--- a/drivers/hwmon/lm95241.c
+++ b/drivers/hwmon/lm95241.c
@@ -59,6 +59,7 @@ static const unsigned short normal_i2c[] = {
 #define CFG_CR0182 0x10
 #define CFG_CR1000 0x20
 #define CFG_CR2700 0x30
+#define CFG_CRMASK 0x30
 #define R1MS_SHIFT 0
 #define R2MS_SHIFT 2
 #define R1MS_MASK (0x01 << (R1MS_SHIFT))
@@ -91,7 +92,8 @@ static const u8 lm95241_reg_address[] = {
 struct lm95241_data {
 	struct i2c_client *client;
 	struct mutex update_lock;
-	unsigned long last_updated, interval;	/* in jiffies */
+	unsigned long last_updated;	/* in jiffies */
+	unsigned long interval;		/* in milli-seconds */
 	char valid;		/* zero until following fields are valid */
 	/* registers values */
 	u8 temp[ARRAY_SIZE(lm95241_reg_address)];
@@ -118,7 +120,8 @@ static struct lm95241_data *lm95241_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
-	if (time_after(jiffies, data->last_updated + data->interval) ||
+	if (time_after(jiffies, data->last_updated
+		       + msecs_to_jiffies(data->interval)) ||
 	    !data->valid) {
 		int i;
 
@@ -276,8 +279,7 @@ static ssize_t show_interval(struct device *dev, struct device_attribute *attr,
 {
 	struct lm95241_data *data = lm95241_update_device(dev);
 
-	return snprintf(buf, PAGE_SIZE - 1, "%lu\n", 1000 * data->interval
-			/ HZ);
+	return snprintf(buf, PAGE_SIZE - 1, "%lu\n", data->interval);
 }
 
 static ssize_t set_interval(struct device *dev, struct device_attribute *attr,
@@ -285,11 +287,35 @@ static ssize_t set_interval(struct device *dev, struct device_attribute *attr,
 {
 	struct lm95241_data *data = dev_get_drvdata(dev);
 	unsigned long val;
+	int convrate;
+	u8 config;
 
 	if (kstrtoul(buf, 10, &val) < 0)
 		return -EINVAL;
 
-	data->interval = val * HZ / 1000;
+	mutex_lock(&data->update_lock);
+
+	config = data->config & ~CFG_CRMASK;
+
+	if (val < 130) {
+		convrate = 76;
+		config |= CFG_CR0076;
+	} else if (val < 590) {
+		convrate = 182;
+		config |= CFG_CR0182;
+	} else if (val < 1850) {
+		convrate = 1000;
+		config |= CFG_CR1000;
+	} else {
+		convrate = 2700;
+		config |= CFG_CR2700;
+	}
+
+	data->interval = convrate;
+	data->config = config;
+	i2c_smbus_write_byte_data(data->client, LM95241_REG_RW_CONFIG,
+				  config);
+	mutex_unlock(&data->update_lock);
 
 	return count;
 }
@@ -362,8 +388,8 @@ static int lm95241_detect(struct i2c_client *new_client,
 static void lm95241_init_client(struct i2c_client *client,
 				struct lm95241_data *data)
 {
-	data->interval = HZ;	/* 1 sec default */
-	data->config = CFG_CR0076;
+	data->interval = 1000;
+	data->config = CFG_CR1000;
 	data->trutherm = (TT_OFF << TT1_SHIFT) | (TT_OFF << TT2_SHIFT);
 
 	i2c_smbus_write_byte_data(client, LM95241_REG_RW_CONFIG, data->config);
-- 
2.5.0
