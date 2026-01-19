Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D4432F766;
	Mon, 19 Jan 2026 04:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768795523; cv=none; b=TFjxGaeeK5ra6+WMIorczHfOQi4hM3Epo6nMazXR/A7e5FUJIZrqFS49KtYrpQ1+YXgxIVyQEYX9rZbFPz9QQWyqr5t5smiddAxwmwcuCm6pfwFxKAl8+YTGoFa/DJ/lUxvnrhNswL/Gt9HPt2xrzd2ihyvB9csE2IXBdny+oQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768795523; c=relaxed/simple;
	bh=Ksl+mbjm94bAf42aCz/AP8vxJdVRDnCNSRnJBFteJo8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aAYc+ACpIRWtLiMp+192CZaKT+w4TekEJqtp8/m2wlUCsJH7wFfFgtkhdbzTt/Lyy/xeQYpVCn39jVPFKOzo73Q/30I07ra8pF/P81qPEXxBzeDgabfT4HkA2MZt2lYJ9X+k+4+jy2mzJFK7WstjkGWm3d+JknFeG50UvmbvzH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5E97B1A220A;
	Mon, 19 Jan 2026 05:05:04 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 282371A2208;
	Mon, 19 Jan 2026 05:05:04 +0100 (CET)
Received: from lsv031445.swis.in-blr01.nxp.com (lsv031445.swis.in-blr01.nxp.com [92.120.147.159])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id EF9531800086;
	Mon, 19 Jan 2026 12:05:02 +0800 (+08)
From: Mayank Mahajan <mayankmahajan.x@nxp.com>
To: linux@roeck-us.net,
	corbet@lwn.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: priyanka.jain@nxp.com,
	vikash.bansal@nxp.com,
	Mayank Mahajan <mayankmahajan.x@nxp.com>
Subject: [PATCH v5 2/3] hwmon: (tmp108) Add support for P3T1035 and P3T2030
Date: Mon, 19 Jan 2026 09:34:58 +0530
Message-Id: <20260119040459.2898998-2-mayankmahajan.x@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260119040459.2898998-1-mayankmahajan.x@nxp.com>
References: <20260119040459.2898998-1-mayankmahajan.x@nxp.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Add support for the P3T1035 & P3T2030 temperature sensor. While mostly
compatible with the TMP108, P3T1035 uses an 8-bit configuration register
instead of the 16-bit layout used by TMP108. Updated driver to handle
this difference during configuration read/write.

Signed-off-by: Mayank Mahajan <mayankmahajan.x@nxp.com>
---
V1 -> V2:
- Disabled hysteresis in is_visible function for P3T1035.
- Added tables for conversion rate similar to the LM75 driver.
- Implemented different bus access depending on the chip being used.
   - Removed regmap for 8 bits; now we are using one regmap as before.
   - Added read and write functions for i2c and i3c for use with regmap.
   - Mapped the 8-bit configuration register to a 16 bit value for P3T1035.
V2 -> V3:
- Remove changes not relevant to adding a new device in the driver.
- Address warnings due to incorrect usage of casting operations.
- Remove the usage of P3T2030 as it's functionally identical to P3T1035.
V3 -> V4:
- Add GENMASK for getting mask for conversion rates.
- Add static arrays for containing sample times for different sensors.
- Remove redundant code such as checking for NULL pointer in probe.
- Improve readability by removing double negation.
- Remove type cast where not required; make reg_buf & val_buf local.
V4 -> V5:
- Remove device ID and use a separate parameter structure instead.
- Revert formatting in the device structure back to the original one.

 drivers/hwmon/Kconfig  |   2 +-
 drivers/hwmon/tmp108.c | 197 +++++++++++++++++++++++++++++++++--------
 2 files changed, 161 insertions(+), 38 deletions(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 157678b821fc..31969bddc812 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2398,7 +2398,7 @@ config SENSORS_TMP108
 	select REGMAP_I3C if I3C
 	help
 	  If you say yes here you get support for Texas Instruments TMP108
-	  sensor chips and NXP P3T1085.
+	  sensor chips, NXP temperature sensors P3T1035, P3T1085 and P3T2030.

 	  This driver can also be built as a module. If so, the module
 	  will be called tmp108.
diff --git a/drivers/hwmon/tmp108.c b/drivers/hwmon/tmp108.c
index 60a237cbedbc..ae258fa7676e 100644
--- a/drivers/hwmon/tmp108.c
+++ b/drivers/hwmon/tmp108.c
@@ -17,6 +17,8 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
+#include <linux/util_macros.h>
+#include <linux/bitfield.h>

 #define	DRIVER_NAME "tmp108"

@@ -70,10 +72,36 @@

 #define TMP108_CONVERSION_TIME_MS	30	/* in milli-seconds */

+#define TMP108_CONF_CR0_POS		13
+#define TMP108_CONF_CR1_POS		14
+#define TMP108_CONF_CONVRATE_FLD	GENMASK(TMP108_CONF_CR1_POS, TMP108_CONF_CR0_POS)
+
 struct tmp108 {
 	struct regmap *regmap;
 	u16 orig_config;
 	unsigned long ready_time;
+	const struct tmp108_params *params;
+};
+
+struct tmp108_params {
+	bool config_reg_16bits;
+	const u16 *sample_times;
+	size_t n_sample_times;
+};
+
+static const u16 p3t1035_sample_times[] = {4000, 1000, 250, 125};
+static const u16 tmp108_sample_times[] = {4000, 1000, 250, 63};
+
+static const struct tmp108_params p3t1035_data = {
+	.sample_times = p3t1035_sample_times,
+	.n_sample_times  = ARRAY_SIZE(p3t1035_sample_times),
+	.config_reg_16bits = false,
+};
+
+static const struct tmp108_params tmp108_data = {
+	.sample_times = tmp108_sample_times,
+	.n_sample_times  = ARRAY_SIZE(tmp108_sample_times),
+	.config_reg_16bits = true,
 };

 /* convert 12-bit TMP108 register value to milliCelsius */
@@ -101,21 +129,8 @@ static int tmp108_read(struct device *dev, enum hwmon_sensor_types type,
 					  &regval);
 			if (err < 0)
 				return err;
-			switch (regval & TMP108_CONF_CONVRATE_MASK) {
-			case TMP108_CONVRATE_0P25HZ:
-			default:
-				*temp = 4000;
-				break;
-			case TMP108_CONVRATE_1HZ:
-				*temp = 1000;
-				break;
-			case TMP108_CONVRATE_4HZ:
-				*temp = 250;
-				break;
-			case TMP108_CONVRATE_16HZ:
-				*temp = 63;
-				break;
-			}
+			*temp = tmp108->params->sample_times[FIELD_GET(TMP108_CONF_CONVRATE_FLD,
+								       regval)];
 			return 0;
 		}
 		return -EOPNOTSUPP;
@@ -192,22 +207,18 @@ static int tmp108_write(struct device *dev, enum hwmon_sensor_types type,
 {
 	struct tmp108 *tmp108 = dev_get_drvdata(dev);
 	u32 regval, mask;
+	size_t len;
+	u8 index;
 	int err;

 	if (type == hwmon_chip) {
 		if (attr == hwmon_chip_update_interval) {
-			if (temp < 156)
-				mask = TMP108_CONVRATE_16HZ;
-			else if (temp < 625)
-				mask = TMP108_CONVRATE_4HZ;
-			else if (temp < 2500)
-				mask = TMP108_CONVRATE_1HZ;
-			else
-				mask = TMP108_CONVRATE_0P25HZ;
+			len = tmp108->params->n_sample_times;
+			index = find_closest_descending(temp, tmp108->params->sample_times, len);
 			return regmap_update_bits(tmp108->regmap,
 						  TMP108_REG_CONF,
 						  TMP108_CONF_CONVRATE_MASK,
-						  mask);
+						  FIELD_PREP(TMP108_CONF_CONVRATE_FLD, index));
 		}
 		return -EOPNOTSUPP;
 	}
@@ -251,6 +262,8 @@ static int tmp108_write(struct device *dev, enum hwmon_sensor_types type,
 static umode_t tmp108_is_visible(const void *data, enum hwmon_sensor_types type,
 				 u32 attr, int channel)
 {
+	const struct tmp108 *tmp108 = data;
+
 	if (type == hwmon_chip && attr == hwmon_chip_update_interval)
 		return 0644;

@@ -264,8 +277,11 @@ static umode_t tmp108_is_visible(const void *data, enum hwmon_sensor_types type,
 		return 0444;
 	case hwmon_temp_min:
 	case hwmon_temp_max:
+		return 0644;
 	case hwmon_temp_min_hyst:
 	case hwmon_temp_max_hyst:
+		if (!tmp108->params->config_reg_16bits)
+			return 0;
 		return 0644;
 	default:
 		return 0;
@@ -311,6 +327,106 @@ static bool tmp108_is_volatile_reg(struct device *dev, unsigned int reg)
 	return reg == TMP108_REG_TEMP || reg == TMP108_REG_CONF;
 }

+static int tmp108_i2c_reg_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct i2c_client *client = context;
+	struct tmp108 *tmp108 = i2c_get_clientdata(client);
+	int ret;
+
+	if (reg == TMP108_REG_CONF && !tmp108->params->config_reg_16bits) {
+		ret = i2c_smbus_read_byte_data(client, TMP108_REG_CONF);
+		if (ret < 0)
+			return ret;
+		*val = ret << 8;
+		return 0;
+	}
+
+	ret = i2c_smbus_read_word_swapped(client, reg);
+	if (ret < 0)
+		return ret;
+	*val = ret;
+	return 0;
+}
+
+static int tmp108_i2c_reg_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct i2c_client *client = context;
+	struct tmp108 *tmp108 = i2c_get_clientdata(client);
+
+	if (reg == TMP108_REG_CONF && !tmp108->params->config_reg_16bits)
+		return i2c_smbus_write_byte_data(client, reg, val >> 8);
+	return i2c_smbus_write_word_swapped(client, reg, val);
+}
+
+static const struct regmap_bus tmp108_i2c_regmap_bus = {
+	.reg_read = tmp108_i2c_reg_read,
+	.reg_write = tmp108_i2c_reg_write,
+};
+
+static int tmp108_i3c_reg_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct i3c_device *i3cdev = context;
+	struct tmp108 *tmp108 = i3cdev_get_drvdata(i3cdev);
+	u8 reg_buf[1], val_buf[2];
+	struct i3c_xfer xfers[] = {
+		{
+			.rnw = false,
+			.len = 1,
+			.data.out = reg_buf,
+		},
+		{
+			.rnw = true,
+			.len = 2,
+			.data.in = val_buf,
+		},
+	};
+	int ret;
+
+	reg_buf[0] = reg;
+
+	if (reg == TMP108_REG_CONF && !tmp108->params->config_reg_16bits)
+		xfers[1].len--;
+
+	ret = i3c_device_do_xfers(i3cdev, xfers, 2, I3C_SDR);
+	if (ret < 0)
+		return ret;
+
+	*val = val_buf[0] << 8;
+	if (reg != TMP108_REG_CONF || tmp108->params->config_reg_16bits)
+		*val |= val_buf[1];
+
+	return 0;
+}
+
+static int tmp108_i3c_reg_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct i3c_device *i3cdev = context;
+	struct tmp108 *tmp108 = i3cdev_get_drvdata(i3cdev);
+	u8 val_buf[3];
+	struct i3c_xfer xfers[] = {
+		{
+			.rnw = false,
+			.len = 3,
+			.data.out = val_buf,
+		},
+	};
+
+	val_buf[0] = reg;
+	val_buf[1] = (val >> 8) & 0xff;
+
+	if (reg == TMP108_REG_CONF && !tmp108->params->config_reg_16bits)
+		xfers[0].len--;
+	else
+		val_buf[2] = val & 0xff;
+
+	return i3c_device_do_xfers(i3cdev, xfers, 1, I3C_SDR);
+}
+
+static const struct regmap_bus tmp108_i3c_regmap_bus = {
+	.reg_read = tmp108_i3c_reg_read,
+	.reg_write = tmp108_i3c_reg_write,
+};
+
 static const struct regmap_config tmp108_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 16,
@@ -323,7 +439,8 @@ static const struct regmap_config tmp108_regmap_config = {
 	.use_single_write = true,
 };

-static int tmp108_common_probe(struct device *dev, struct regmap *regmap, char *name)
+static int tmp108_common_probe(struct device *dev, struct regmap *regmap, char *name,
+			       const struct tmp108_params *params)
 {
 	struct device *hwmon_dev;
 	struct tmp108 *tmp108;
@@ -340,6 +457,7 @@ static int tmp108_common_probe(struct device *dev, struct regmap *regmap, char *

 	dev_set_drvdata(dev, tmp108);
 	tmp108->regmap = regmap;
+	tmp108->params = params;

 	err = regmap_read(tmp108->regmap, TMP108_REG_CONF, &config);
 	if (err < 0) {
@@ -351,7 +469,6 @@ static int tmp108_common_probe(struct device *dev, struct regmap *regmap, char *
 	/* Only continuous mode is supported. */
 	config &= ~TMP108_CONF_MODE_MASK;
 	config |= TMP108_MODE_CONTINUOUS;
-
 	/* Only comparator mode is supported. */
 	config &= ~TMP108_CONF_TM;

@@ -386,15 +503,15 @@ static int tmp108_probe(struct i2c_client *client)
 	struct regmap *regmap;

 	if (!i2c_check_functionality(client->adapter,
-				     I2C_FUNC_SMBUS_WORD_DATA))
+				     I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA))
 		return dev_err_probe(dev, -ENODEV,
 				     "adapter doesn't support SMBus word transactions\n");

-	regmap = devm_regmap_init_i2c(client, &tmp108_regmap_config);
+	regmap = devm_regmap_init(dev, &tmp108_i2c_regmap_bus, client, &tmp108_regmap_config);
 	if (IS_ERR(regmap))
 		return dev_err_probe(dev, PTR_ERR(regmap), "regmap init failed");

-	return tmp108_common_probe(dev, regmap, client->name);
+	return tmp108_common_probe(dev, regmap, client->name, i2c_get_match_data(client));
 }

 static int tmp108_suspend(struct device *dev)
@@ -420,15 +537,17 @@ static int tmp108_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(tmp108_dev_pm_ops, tmp108_suspend, tmp108_resume);

 static const struct i2c_device_id tmp108_i2c_ids[] = {
-	{ "p3t1085" },
-	{ "tmp108" },
-	{ }
+	{ "p3t1035", (unsigned long)&p3t1035_data },
+	{ "p3t1085", (unsigned long)&tmp108_data },
+	{ "tmp108", (unsigned long)&tmp108_data },
+	{}
 };
 MODULE_DEVICE_TABLE(i2c, tmp108_i2c_ids);

 static const struct of_device_id tmp108_of_ids[] = {
-	{ .compatible = "nxp,p3t1085", },
-	{ .compatible = "ti,tmp108", },
+	{ .compatible = "nxp,p3t1035", .data = &p3t1035_data },
+	{ .compatible = "nxp,p3t1085", .data = &tmp108_data },
+	{ .compatible = "ti,tmp108", .data = &tmp108_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, tmp108_of_ids);
@@ -444,7 +563,8 @@ static struct i2c_driver tmp108_driver = {
 };

 static const struct i3c_device_id p3t1085_i3c_ids[] = {
-	I3C_DEVICE(0x011b, 0x1529, NULL),
+	I3C_DEVICE(0x011B, 0x1529, &tmp108_data),
+	I3C_DEVICE(0x011B, 0x152B, &p3t1035_data),
 	{}
 };
 MODULE_DEVICE_TABLE(i3c, p3t1085_i3c_ids);
@@ -453,13 +573,16 @@ static int p3t1085_i3c_probe(struct i3c_device *i3cdev)
 {
 	struct device *dev = i3cdev_to_dev(i3cdev);
 	struct regmap *regmap;
+	const struct i3c_device_id *id;

-	regmap = devm_regmap_init_i3c(i3cdev, &tmp108_regmap_config);
+	regmap = devm_regmap_init(dev, &tmp108_i3c_regmap_bus, i3cdev, &tmp108_regmap_config);
 	if (IS_ERR(regmap))
 		return dev_err_probe(dev, PTR_ERR(regmap),
 				     "Failed to register i3c regmap\n");

-	return tmp108_common_probe(dev, regmap, "p3t1085_i3c");
+	id = i3c_device_match_id(i3cdev, p3t1085_i3c_ids);
+
+	return tmp108_common_probe(dev, regmap, "p3t1085_i3c", id->data);
 }

 static struct i3c_driver p3t1085_driver = {
--
2.34.1
