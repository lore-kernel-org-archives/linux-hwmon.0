Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45785 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727658AbeJZI0N (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 26 Oct 2018 04:26:13 -0400
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: jdelvare@suse.com, linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/5] hwmon: (ina3221) Serialize sysfs ABI accesses
Date: Thu, 25 Oct 2018 16:51:20 -0700
Message-Id: <20181025235122.3240-4-nicoleotsuka@gmail.com>
In-Reply-To: <20181025235122.3240-1-nicoleotsuka@gmail.com>
References: <20181025235122.3240-1-nicoleotsuka@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This change adds a mutex to serialize accesses of sysfs attributes.

This is required when polling CVRF bit of the MASK/ENABLE register
because this bit is cleared on a read of this MASK/ENABLE register
or a write to CONFIG register, which means that this bit might be
accidentally cleared by reading other fields like alert flags.

So this patch adds a mutex lock to protect the write() and read()
callbacks. The read_string() callback won't need the lock since it
just returns the label without touching any hardware register.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
Changlog
v1->v4:
 * N/A

 drivers/hwmon/ina3221.c | 51 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 45 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index 26cdf3342d80..10e8347a3c80 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -18,6 +18,7 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/regmap.h>
 
@@ -94,12 +95,14 @@ struct ina3221_input {
  * @regmap: Register map of the device
  * @fields: Register fields of the device
  * @inputs: Array of channel input source specific structures
+ * @lock: mutex lock to serialize sysfs attribute accesses
  * @reg_config: Register value of INA3221_CONFIG
  */
 struct ina3221_data {
 	struct regmap *regmap;
 	struct regmap_field *fields[F_MAX_FIELDS];
 	struct ina3221_input inputs[INA3221_NUM_CHANNELS];
+	struct mutex lock;
 	u32 reg_config;
 };
 
@@ -265,29 +268,53 @@ static int ina3221_write_enable(struct device *dev, int channel, bool enable)
 static int ina3221_read(struct device *dev, enum hwmon_sensor_types type,
 			u32 attr, int channel, long *val)
 {
+	struct ina3221_data *ina = dev_get_drvdata(dev);
+	int ret;
+
+	mutex_lock(&ina->lock);
+
 	switch (type) {
 	case hwmon_in:
 		/* 0-align channel ID */
-		return ina3221_read_in(dev, attr, channel - 1, val);
+		ret = ina3221_read_in(dev, attr, channel - 1, val);
+		break;
 	case hwmon_curr:
-		return ina3221_read_curr(dev, attr, channel, val);
+		ret = ina3221_read_curr(dev, attr, channel, val);
+		break;
 	default:
-		return -EOPNOTSUPP;
+		ret = -EOPNOTSUPP;
+		break;
 	}
+
+	mutex_unlock(&ina->lock);
+
+	return ret;
 }
 
 static int ina3221_write(struct device *dev, enum hwmon_sensor_types type,
 			 u32 attr, int channel, long val)
 {
+	struct ina3221_data *ina = dev_get_drvdata(dev);
+	int ret;
+
+	mutex_lock(&ina->lock);
+
 	switch (type) {
 	case hwmon_in:
 		/* 0-align channel ID */
-		return ina3221_write_enable(dev, channel - 1, val);
+		ret = ina3221_write_enable(dev, channel - 1, val);
+		break;
 	case hwmon_curr:
-		return ina3221_write_curr(dev, attr, channel, val);
+		ret = ina3221_write_curr(dev, attr, channel, val);
+		break;
 	default:
-		return -EOPNOTSUPP;
+		ret = -EOPNOTSUPP;
+		break;
 	}
+
+	mutex_unlock(&ina->lock);
+
+	return ret;
 }
 
 static int ina3221_read_string(struct device *dev, enum hwmon_sensor_types type,
@@ -582,6 +609,7 @@ static int ina3221_probe(struct i2c_client *client,
 	if (ret)
 		return ret;
 
+	mutex_init(&ina->lock);
 	dev_set_drvdata(dev, ina);
 
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, ina,
@@ -589,12 +617,22 @@ static int ina3221_probe(struct i2c_client *client,
 							 ina3221_groups);
 	if (IS_ERR(hwmon_dev)) {
 		dev_err(dev, "Unable to register hwmon device\n");
+		mutex_destroy(&ina->lock);
 		return PTR_ERR(hwmon_dev);
 	}
 
 	return 0;
 }
 
+static int ina3221_remove(struct i2c_client *client)
+{
+	struct ina3221_data *ina = dev_get_drvdata(&client->dev);
+
+	mutex_destroy(&ina->lock);
+
+	return 0;
+}
+
 static int __maybe_unused ina3221_suspend(struct device *dev)
 {
 	struct ina3221_data *ina = dev_get_drvdata(dev);
@@ -663,6 +701,7 @@ MODULE_DEVICE_TABLE(i2c, ina3221_ids);
 
 static struct i2c_driver ina3221_i2c_driver = {
 	.probe = ina3221_probe,
+	.remove = ina3221_remove,
 	.driver = {
 		.name = INA3221_DRIVER_NAME,
 		.of_match_table = ina3221_of_match_table,
-- 
2.17.1
