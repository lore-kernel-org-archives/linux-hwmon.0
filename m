Return-Path: <nicoleotsuka@gmail.com>
Return-path: <nicoleotsuka@gmail.com>
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net
Cc: afd@ti.com,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] hwmon: ina3221: Add suspend and resume functions
Date: Sat, 29 Sep 2018 14:44:07 -0700
Message-Id: <20180929214407.27208-4-nicoleotsuka@gmail.com>
In-Reply-To: <20180929214407.27208-1-nicoleotsuka@gmail.com>
References: <20180929214407.27208-1-nicoleotsuka@gmail.com>
List-ID: <linux-hwmon@vger.kernel.org>

Depending on the hardware design, an INA3221 chip might lose
its power during system suspend/resume. So this patch adds
a set of suspend and resume functions to cache the register
values including config register value and limit settings.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
Changelog
v1->v2:
 * Added power-down setting during suspend for power saving

 drivers/hwmon/ina3221.c | 63 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index e0c4f4d83f4e..877952efaa88 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -38,6 +38,8 @@
 #define INA3221_WARN3			0x0c
 #define INA3221_MASK_ENABLE		0x0f
 
+#define INA3221_CONFIG_MODE_MASK	GENMASK(2, 0)
+#define INA3221_CONFIG_MODE_POWERDOWN	0
 #define INA3221_CONFIG_MODE_SHUNT	BIT(0)
 #define INA3221_CONFIG_MODE_BUS		BIT(1)
 #define INA3221_CONFIG_MODE_CONTINUOUS	BIT(2)
@@ -91,11 +93,13 @@ static const unsigned int register_channel[] = {
  * @regmap: Register map of the device
  * @fields: Register fields of the device
  * @shunt_resistors: Array of resistor values per channel
+ * @reg_config: Register value of INA3221_CONFIG
  */
 struct ina3221_data {
 	struct regmap *regmap;
 	struct regmap_field *fields[F_MAX_FIELDS];
 	int shunt_resistors[INA3221_NUM_CHANNELS];
+	u32 reg_config;
 };
 
 static int ina3221_read_value(struct ina3221_data *ina, unsigned int reg,
@@ -415,9 +419,67 @@ static int ina3221_probe(struct i2c_client *client,
 		return PTR_ERR(hwmon_dev);
 	}
 
+	dev_set_drvdata(dev, ina);
+
 	return 0;
 }
 
+#ifdef CONFIG_PM
+static int ina3221_suspend(struct device *dev)
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
+static int ina3221_resume(struct device *dev)
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
+#endif
+
+static const struct dev_pm_ops ina3221_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(ina3221_suspend, ina3221_resume)
+};
+
 static const struct of_device_id ina3221_of_match_table[] = {
 	{ .compatible = "ti,ina3221", },
 	{ /* sentinel */ }
@@ -435,6 +497,7 @@ static struct i2c_driver ina3221_i2c_driver = {
 	.driver = {
 		.name = INA3221_DRIVER_NAME,
 		.of_match_table = ina3221_of_match_table,
+		.pm = &ina3221_pm,
 	},
 	.id_table = ina3221_ids,
 };
-- 
2.17.1
