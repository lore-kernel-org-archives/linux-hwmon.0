Return-Path: <nicoleotsuka@gmail.com>
Return-path: <nicoleotsuka@gmail.com>
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] hwmon: (ina3221) Add PM runtime support
Date: Tue, 16 Oct 2018 18:24:26 -0700
Message-Id: <20181017012426.26958-6-nicoleotsuka@gmail.com>
In-Reply-To: <20181017012426.26958-1-nicoleotsuka@gmail.com>
References: <20181017012426.26958-1-nicoleotsuka@gmail.com>
List-ID: <linux-hwmon@vger.kernel.org>

If all three channels are disabled via in[123]_enable ABI,
the driver could suspend the chip for power saving purpose.

So this patch addsd the PM runtime support in order to gain
more power control than system suspend and resume use case.

For PM runtime, there are a few related changes happening:
1) Added a new explicit hdev device pointer for all the pm
   runtime callbacks. This is because hwmon core registers
   a child device for each hwmon driver. So there might be
   a mismatch between two device pointers in the driver if
   mixing using them.
2) Added a check in ina3221_is_enabled() to make sure that
   the chip is resumed.
3) Bypassed the unchanged status in ina3221_write_enable()
   in order to keep the pm runtime refcount being matched.
4) Removed the reset routine in the probe() by calling the
   resume() via pm_runtime_get_sync(), as they're similar.
   It's also necessary to do so to match initial refcount
   with the number of enabled channels.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/hwmon/ina3221.c | 104 +++++++++++++++++++++++++++++++---------
 1 file changed, 82 insertions(+), 22 deletions(-)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index 160ddc404d73..5ad3ab22b07a 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -21,6 +21,7 @@
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/regmap.h>
+#include <linux/pm_runtime.h>
 
 #define INA3221_DRIVER_NAME		"ina3221"
 
@@ -47,6 +48,7 @@
 #define INA3221_CONFIG_CHx_EN(x)	BIT(14 - (x))
 #define INA3221_CONFIG_CHs_EN_MASK	GENMASK(14, 12)
 
+#define INA3221_CONFIG_DEFAULT		0x7127
 #define INA3221_RSHUNT_DEFAULT		10000
 
 enum ina3221_fields {
@@ -97,6 +99,7 @@ struct ina3221_input {
 
 /**
  * struct ina3221_data - device specific information
+ * @hdev: Device pointer of hwmon child device, used for pm runtime
  * @regmap: Register map of the device
  * @fields: Register fields of the device
  * @inputs: Array of channel input source specific structures
@@ -104,6 +107,7 @@ struct ina3221_input {
  * @reg_config: Register value of INA3221_CONFIG
  */
 struct ina3221_data {
+	struct device *hdev;
 	struct regmap *regmap;
 	struct regmap_field *fields[F_MAX_FIELDS];
 	struct ina3221_input inputs[INA3221_NUM_CHANNELS];
@@ -113,7 +117,8 @@ struct ina3221_data {
 
 static inline bool ina3221_is_enabled(struct ina3221_data *ina, int channel)
 {
-	return ina->reg_config & INA3221_CONFIG_CHx_EN(channel);
+	return pm_runtime_active(ina->hdev) &&
+	       (ina->reg_config & INA3221_CONFIG_CHx_EN(channel));
 }
 
 static inline int ina3221_wait_for_data_if_active(struct ina3221_data *ina)
@@ -262,19 +267,33 @@ static int ina3221_write_enable(struct device *dev, int channel, bool enable)
 {
 	struct ina3221_data *ina = dev_get_drvdata(dev);
 	u16 config, mask = INA3221_CONFIG_CHx_EN(channel);
+	u16 config_old = ina->reg_config & mask;
 	int ret;
 
 	config = enable ? mask : 0;
 
+	/* Bypass if enable status is not being changed */
+	if (config_old == config)
+		return 0;
+
+	/* For enabling routine, increase refcount and resume() at first */
+	if (enable) {
+		ret = pm_runtime_get_sync(ina->hdev);
+		if (ret < 0) {
+			dev_err(dev, "Failed to get PM runtime");
+			return ret;
+		}
+	}
+
 	/* Enable or disable the channel */
 	ret = regmap_update_bits(ina->regmap, INA3221_CONFIG, mask, config);
 	if (ret)
-		return ret;
+		goto fail;
 
 	/* Cache the latest config register value */
 	ret = regmap_read(ina->regmap, INA3221_CONFIG, &ina->reg_config);
 	if (ret)
-		return ret;
+		goto fail;
 
 	/* Make sure data conversion is finished */
 	ret = ina3221_wait_for_data_if_active(ina);
@@ -283,7 +302,20 @@ static int ina3221_write_enable(struct device *dev, int channel, bool enable)
 		return ret;
 	}
 
+	/* For disabling routine, decrease refcount or suspend() at last */
+	if (!enable)
+		pm_runtime_put_sync(ina->hdev);
+
 	return 0;
+
+fail:
+	if (enable) {
+		dev_err(dev, "Reverting channel%d enabling: %d\n",
+			channel, ret);
+		pm_runtime_put_sync(ina->hdev);
+	}
+
+	return ret;
 }
 
 static int ina3221_read(struct device *dev, enum hwmon_sensor_types type,
@@ -578,7 +610,6 @@ static int ina3221_probe(struct i2c_client *client,
 {
 	struct device *dev = &client->dev;
 	struct ina3221_data *ina;
-	struct device *hwmon_dev;
 	int i, ret;
 
 	ina = devm_kzalloc(dev, sizeof(*ina), GFP_KERNEL);
@@ -610,44 +641,71 @@ static int ina3221_probe(struct i2c_client *client,
 		return ret;
 	}
 
-	ret = regmap_field_write(ina->fields[F_RST], true);
-	if (ret) {
-		dev_err(dev, "Unable to reset device\n");
-		return ret;
-	}
-
-	/* Sync config register after reset */
-	ret = regmap_read(ina->regmap, INA3221_CONFIG, &ina->reg_config);
-	if (ret)
-		return ret;
+	/* The driver will be reset, so use reset value */
+	ina->reg_config = INA3221_CONFIG_DEFAULT;
 
 	/* Disable channels if their inputs are disconnected */
 	for (i = 0; i < INA3221_NUM_CHANNELS; i++) {
 		if (ina->inputs[i].disconnected)
 			ina->reg_config &= ~INA3221_CONFIG_CHx_EN(i);
 	}
-	ret = regmap_write(ina->regmap, INA3221_CONFIG, ina->reg_config);
-	if (ret)
-		return ret;
 
 	mutex_init(&ina->lock);
 	dev_set_drvdata(dev, ina);
 
-	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, ina,
+	/* Fence sysfs nodes till pm_runtime is resumed */
+	mutex_lock(&ina->lock);
+
+	/* Use the returned hdev for pm_runtime */
+	ina->hdev = devm_hwmon_device_register_with_info(dev, client->name, ina,
 							 &ina3221_chip_info,
 							 ina3221_groups);
-	if (IS_ERR(hwmon_dev)) {
+	if (IS_ERR(ina->hdev)) {
 		dev_err(dev, "Unable to register hwmon device\n");
-		mutex_destroy(&ina->lock);
-		return PTR_ERR(hwmon_dev);
+		ret = PTR_ERR(ina->hdev);
+		goto fail_lock;
 	}
 
+	/* Enable PM runtime -- status is suspended by default */
+	pm_runtime_enable(ina->hdev);
+
+	/* Initialize (resume) the device */
+	for (i = 0; i < INA3221_NUM_CHANNELS; i++) {
+		if (ina->inputs[i].disconnected)
+			continue;
+		/* Match the refcount with number of enabled channels */
+		ret = pm_runtime_get_sync(ina->hdev);
+		if (ret < 0)
+			goto fail_pm;
+	}
+
+	mutex_unlock(&ina->lock);
+
 	return 0;
+
+fail_pm:
+	pm_runtime_disable(ina->hdev);
+	pm_runtime_set_suspended(ina->hdev);
+	for (i = 0; i < INA3221_NUM_CHANNELS; i++)
+		pm_runtime_put_noidle(ina->hdev);
+fail_lock:
+	mutex_unlock(&ina->lock);
+	mutex_destroy(&ina->lock);
+
+	return ret;
 }
 
 static int ina3221_remove(struct i2c_client *client)
 {
 	struct ina3221_data *ina = dev_get_drvdata(&client->dev);
+	int i;
+
+	pm_runtime_disable(ina->hdev);
+	pm_runtime_set_suspended(ina->hdev);
+
+	/* Decrease the PM refcount */
+	for (i = 0; i < INA3221_NUM_CHANNELS; i++)
+		pm_runtime_put_noidle(ina->hdev);
 
 	mutex_destroy(&ina->lock);
 
@@ -712,7 +770,9 @@ static int __maybe_unused ina3221_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops ina3221_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(ina3221_suspend, ina3221_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+	SET_RUNTIME_PM_OPS(ina3221_suspend, ina3221_resume, NULL)
 };
 
 static const struct of_device_id ina3221_of_match_table[] = {
-- 
2.17.1
