Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36126 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727687AbeJZI0O (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 26 Oct 2018 04:26:14 -0400
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: jdelvare@suse.com, linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/5] hwmon: (ina3221) Add PM runtime support
Date: Thu, 25 Oct 2018 16:51:22 -0700
Message-Id: <20181025235122.3240-6-nicoleotsuka@gmail.com>
In-Reply-To: <20181025235122.3240-1-nicoleotsuka@gmail.com>
References: <20181025235122.3240-1-nicoleotsuka@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

If all three channels are disabled via in[123]_enable ABI,
the driver could suspend the chip for power saving purpose.

So this patch adds the PM runtime support in order to gain
more power control than system suspend and resume use case.

For PM runtime, there are a few related changes happening:
1) Added a new explicit hdev device pointer for all the PM
   runtime callbacks. This is because hwmon core registers
   a child device for each hwmon driver. So there might be
   a mismatch between two device pointers in the driver if
   mixing using them.
2) Passed the pm pointer via _with_info API to hwmon core
   so as to let the hwmon class control those callbacks.
3) Added a check in ina3221_is_enabled() to make sure that
   the chip is resumed.
4) Bypassed the unchanged status in ina3221_write_enable()
   in order to keep the PM runtime refcount being matched.
5) Removed the reset routine in the probe() by calling the
   resume() via pm_runtime_get_sync() instead, as they're
   similar. It's also necessary to do so to match initial
   PM refcount with the number of enabled channels.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
Changelog
v3->v4:
 * Passed pm pointer via _with_info API instead the i2c driver
v2->v3:
 * Improved a dev_err message
 * Added comments at pm_runtime_put_noidle() callbacks
 * Added pm_runtime header file in an alphabetical order
v1->v2:
 * Bypassed i2c_client->dev in suspend/resume()
 * Added a missing '\n' in one dev_err()

 drivers/hwmon/ina3221.c | 213 ++++++++++++++++++++++++++--------------
 1 file changed, 137 insertions(+), 76 deletions(-)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index 07dd6ef58d3e..974a29b1c8f0 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -20,6 +20,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #define INA3221_DRIVER_NAME		"ina3221"
@@ -53,6 +54,7 @@
 #define INA3221_CONFIG_CHs_EN_MASK	GENMASK(14, 12)
 #define INA3221_CONFIG_CHx_EN(x)	BIT(14 - (x))
 
+#define INA3221_CONFIG_DEFAULT		0x7127
 #define INA3221_RSHUNT_DEFAULT		10000
 
 enum ina3221_fields {
@@ -103,6 +105,7 @@ struct ina3221_input {
 
 /**
  * struct ina3221_data - device specific information
+ * @hdev: Device pointer of hwmon child device, used for pm runtime
  * @regmap: Register map of the device
  * @fields: Register fields of the device
  * @inputs: Array of channel input source specific structures
@@ -110,6 +113,7 @@ struct ina3221_input {
  * @reg_config: Register value of INA3221_CONFIG
  */
 struct ina3221_data {
+	struct device *hdev;
 	struct regmap *regmap;
 	struct regmap_field *fields[F_MAX_FIELDS];
 	struct ina3221_input inputs[INA3221_NUM_CHANNELS];
@@ -119,7 +123,8 @@ struct ina3221_data {
 
 static inline bool ina3221_is_enabled(struct ina3221_data *ina, int channel)
 {
-	return ina->reg_config & INA3221_CONFIG_CHx_EN(channel);
+	return pm_runtime_active(ina->hdev) &&
+	       (ina->reg_config & INA3221_CONFIG_CHx_EN(channel));
 }
 
 /* Lookup table for Bus and Shunt conversion times in usec */
@@ -290,21 +295,48 @@ static int ina3221_write_enable(struct device *dev, int channel, bool enable)
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
+			dev_err(dev, "Failed to get PM runtime\n");
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
+
+	/* For disabling routine, decrease refcount or suspend() at last */
+	if (!enable)
+		pm_runtime_put_sync(ina->hdev);
 
 	return 0;
+
+fail:
+	if (enable) {
+		dev_err(dev, "Failed to enable channel %d: error %d\n",
+			channel, ret);
+		pm_runtime_put_sync(ina->hdev);
+	}
+
+	return ret;
 }
 
 static int ina3221_read(struct device *dev, enum hwmon_sensor_types type,
@@ -461,9 +493,66 @@ static const struct hwmon_ops ina3221_hwmon_ops = {
 	.write = ina3221_write,
 };
 
+static int __maybe_unused ina3221_suspend(struct device *dev)
+{
+	struct ina3221_data *ina = dev_get_drvdata(dev);
+	int ret;
+
+	/* Save config register value and enable cache-only */
+	ret = regmap_read(ina->regmap, INA3221_CONFIG, &ina->reg_config);
+	if (ret)
+		return ret;
+
+	/* Set to power-down mode for power saving */
+	ret = regmap_update_bits(ina->regmap, INA3221_CONFIG,
+				 INA3221_CONFIG_MODE_MASK,
+				 INA3221_CONFIG_MODE_POWERDOWN);
+	if (ret)
+		return ret;
+
+	regcache_cache_only(ina->regmap, true);
+	regcache_mark_dirty(ina->regmap);
+
+	return 0;
+}
+
+static int __maybe_unused ina3221_resume(struct device *dev)
+{
+	struct ina3221_data *ina = dev_get_drvdata(dev);
+	int ret;
+
+	regcache_cache_only(ina->regmap, false);
+
+	/* Software reset the chip */
+	ret = regmap_field_write(ina->fields[F_RST], true);
+	if (ret) {
+		dev_err(dev, "Unable to reset device\n");
+		return ret;
+	}
+
+	/* Restore cached register values to hardware */
+	ret = regcache_sync(ina->regmap);
+	if (ret)
+		return ret;
+
+	/* Restore config register value to hardware */
+	ret = regmap_write(ina->regmap, INA3221_CONFIG, ina->reg_config);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct dev_pm_ops ina3221_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+	SET_RUNTIME_PM_OPS(ina3221_suspend, ina3221_resume, NULL)
+};
+
 static const struct hwmon_chip_info ina3221_chip_info = {
 	.ops = &ina3221_hwmon_ops,
 	.info = ina3221_info,
+	.pm = &ina3221_pm,
 };
 
 /* Extra attribute groups */
@@ -599,7 +688,6 @@ static int ina3221_probe(struct i2c_client *client,
 {
 	struct device *dev = &client->dev;
 	struct ina3221_data *ina;
-	struct device *hwmon_dev;
 	int i, ret;
 
 	ina = devm_kzalloc(dev, sizeof(*ina), GFP_KERNEL);
@@ -631,104 +719,78 @@ static int ina3221_probe(struct i2c_client *client,
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
+	/* pm_runtime_put_noidle() will decrease the PM refcount until 0 */
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
+	/* pm_runtime_put_noidle() will decrease the PM refcount until 0 */
+	for (i = 0; i < INA3221_NUM_CHANNELS; i++)
+		pm_runtime_put_noidle(ina->hdev);
 
 	mutex_destroy(&ina->lock);
 
 	return 0;
 }
 
-static int __maybe_unused ina3221_suspend(struct device *dev)
-{
-	struct ina3221_data *ina = dev_get_drvdata(dev);
-	int ret;
-
-	/* Save config register value and enable cache-only */
-	ret = regmap_read(ina->regmap, INA3221_CONFIG, &ina->reg_config);
-	if (ret)
-		return ret;
-
-	/* Set to power-down mode for power saving */
-	ret = regmap_update_bits(ina->regmap, INA3221_CONFIG,
-				 INA3221_CONFIG_MODE_MASK,
-				 INA3221_CONFIG_MODE_POWERDOWN);
-	if (ret)
-		return ret;
-
-	regcache_cache_only(ina->regmap, true);
-	regcache_mark_dirty(ina->regmap);
-
-	return 0;
-}
-
-static int __maybe_unused ina3221_resume(struct device *dev)
-{
-	struct ina3221_data *ina = dev_get_drvdata(dev);
-	int ret;
-
-	regcache_cache_only(ina->regmap, false);
-
-	/* Software reset the chip */
-	ret = regmap_field_write(ina->fields[F_RST], true);
-	if (ret) {
-		dev_err(dev, "Unable to reset device\n");
-		return ret;
-	}
-
-	/* Restore cached register values to hardware */
-	ret = regcache_sync(ina->regmap);
-	if (ret)
-		return ret;
-
-	/* Restore config register value to hardware */
-	ret = regmap_write(ina->regmap, INA3221_CONFIG, ina->reg_config);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-static const struct dev_pm_ops ina3221_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(ina3221_suspend, ina3221_resume)
-};
-
 static const struct of_device_id ina3221_of_match_table[] = {
 	{ .compatible = "ti,ina3221", },
 	{ /* sentinel */ }
@@ -747,7 +809,6 @@ static struct i2c_driver ina3221_i2c_driver = {
 	.driver = {
 		.name = INA3221_DRIVER_NAME,
 		.of_match_table = ina3221_of_match_table,
-		.pm = &ina3221_pm,
 	},
 	.id_table = ina3221_ids,
 };
-- 
2.17.1
