Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8294379991;
	Fri, 16 Jan 2026 11:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768563366; cv=none; b=IbsSmBtuvSd3SNTCu6keWKi78M9Z5lBwehdrBNRXf+SvIJup8WkcWThfbtCBurbxRKxPlTg4kM/HiCP5XPAMpHm0XGuQFPhMlqtcYDm8QxdSyzd+URKdWzYRDGhQVlrceHqHgPY1PEUX4QxYY1OFZcN9Kb5p+JZ79x0bIQe+6Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768563366; c=relaxed/simple;
	bh=BtBwMiTUdoBh7vj0VTpf/+jUDDijAoIJOvggCKIOdLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pzq9/ZZckLrG5/itmxK/xEGoYxxpj8l8/CkdcmOAR9DEyLVQrEwMOIHCloKuuk+gNEJpA4HpaS12uBGPX8VjQV5yw3Mv18eOji4em226l0g2qhfQgZXEYXRGBYNHr067OF3NyM45e9vU9Ayy2m+M3W7irrkhs9WRfQDnV3nh6H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3396C1A0E9A;
	Fri, 16 Jan 2026 12:36:03 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C8E741A0E94;
	Fri, 16 Jan 2026 12:36:02 +0100 (CET)
Received: from NXL37714.wbi.nxp.com (nxl37714.wbi.nxp.com [10.31.156.112])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 9CBC8180007B;
	Fri, 16 Jan 2026 19:36:00 +0800 (+08)
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
Subject: [PATCH v4 2/3] hwmon: (tmp108) Add support for P3T1035 and P3T2030
Date: Fri, 16 Jan 2026 17:05:53 +0530
Message-ID: <20260116113554.986-2-mayankmahajan.x@nxp.com>
X-Mailer: git-send-email 2.47.1.windows.1
In-Reply-To: <20260116113554.986-1-mayankmahajan.x@nxp.com>
References: <20260116113554.986-1-mayankmahajan.x@nxp.com>
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

 drivers/hwmon/Kconfig  |   2 +-
 drivers/hwmon/tmp108.c | 203 +++++++++++++++++++++++++++++++++--------
 2 files changed, 164 insertions(+), 41 deletions(-)

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
index 60a237cbedbc..d308e2aed18a 100644
--- a/drivers/hwmon/tmp108.c
+++ b/drivers/hwmon/tmp108.c
@@ -17,9 +17,16 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
+#include <linux/util_macros.h>

 #define	DRIVER_NAME "tmp108"

+enum tmp108_hw_id {
+	P3T1035_ID,		/* For sensors p3t1035 and p3t2030 */
+	P3T1085_ID,
+	TMP108_ID,
+};
+
 #define	TMP108_REG_TEMP		0x00
 #define	TMP108_REG_CONF		0x01
 #define	TMP108_REG_TLOW		0x02
@@ -61,6 +68,7 @@
 #define TMP108_CONVRATE_1HZ		TMP108_CONF_CR0		/* Default */
 #define TMP108_CONVRATE_4HZ		TMP108_CONF_CR1
 #define TMP108_CONVRATE_16HZ		(TMP108_CONF_CR0|TMP108_CONF_CR1)
+#define TMP108_CONVRATE_SHIFT		13

 #define TMP108_CONF_HYSTERESIS_MASK	(TMP108_CONF_HYS0|TMP108_CONF_HYS1)
 #define TMP108_HYSTERESIS_0C		0x0000
@@ -70,12 +78,23 @@

 #define TMP108_CONVERSION_TIME_MS	30	/* in milli-seconds */

+#define TMP108_CONF_CR0_POS		13
+#define TMP108_CONF_CR1_POS		14
+#define TMP108_CONF_CONVRATE_FLD	GENMASK(TMP108_CONF_CR1_POS, TMP108_CONF_CR0_POS)
+
 struct tmp108 {
-	struct regmap *regmap;
-	u16 orig_config;
-	unsigned long ready_time;
+	struct regmap		*regmap;
+	u16			orig_config;
+	unsigned long		ready_time;
+	enum tmp108_hw_id	hw_id;
+	bool			config_reg_16bits;
+	ushort			*sample_times;
+	size_t			n_sample_times;
 };

+ushort p3t1035_sample_times[] = {4000, 1000, 250, 125};
+ushort tmp108_sample_times[] = {4000, 1000, 250, 63};
+
 /* convert 12-bit TMP108 register value to milliCelsius */
 static inline int tmp108_temp_reg_to_mC(s16 val)
 {
@@ -101,21 +120,7 @@ static int tmp108_read(struct device *dev, enum hwmon_sensor_types type,
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
+			*temp = tmp108->sample_times[FIELD_GET(TMP108_CONF_CONVRATE_FLD, regval)];
 			return 0;
 		}
 		return -EOPNOTSUPP;
@@ -192,22 +197,17 @@ static int tmp108_write(struct device *dev, enum hwmon_sensor_types type,
 {
 	struct tmp108 *tmp108 = dev_get_drvdata(dev);
 	u32 regval, mask;
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
+			index = find_closest_descending(temp, tmp108->sample_times,
+							tmp108->n_sample_times);
 			return regmap_update_bits(tmp108->regmap,
 						  TMP108_REG_CONF,
 						  TMP108_CONF_CONVRATE_MASK,
-						  mask);
+						  FIELD_PREP(TMP108_CONF_CONVRATE_FLD, index));
 		}
 		return -EOPNOTSUPP;
 	}
@@ -251,6 +251,8 @@ static int tmp108_write(struct device *dev, enum hwmon_sensor_types type,
 static umode_t tmp108_is_visible(const void *data, enum hwmon_sensor_types type,
 				 u32 attr, int channel)
 {
+	const struct tmp108 *tmp108 = data;
+
 	if (type == hwmon_chip && attr == hwmon_chip_update_interval)
 		return 0644;

@@ -264,8 +266,11 @@ static umode_t tmp108_is_visible(const void *data, enum hwmon_sensor_types type,
 		return 0444;
 	case hwmon_temp_min:
 	case hwmon_temp_max:
+		return 0644;
 	case hwmon_temp_min_hyst:
 	case hwmon_temp_max_hyst:
+		if (tmp108->hw_id == P3T1035_ID)
+			return 0;
 		return 0644;
 	default:
 		return 0;
@@ -311,6 +316,106 @@ static bool tmp108_is_volatile_reg(struct device *dev, unsigned int reg)
 	return reg == TMP108_REG_TEMP || reg == TMP108_REG_CONF;
 }

+static int tmp108_i2c_reg_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct i2c_client *client = context;
+	struct tmp108 *tmp108 = i2c_get_clientdata(client);
+	int ret;
+
+	if (reg == TMP108_REG_CONF && !tmp108->config_reg_16bits) {
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
+	if (reg == TMP108_REG_CONF && !tmp108->config_reg_16bits)
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
+	if (reg == TMP108_REG_CONF && !tmp108->config_reg_16bits)
+		xfers[1].len--;
+
+	ret = i3c_device_do_xfers(i3cdev, xfers, 2, I3C_SDR);
+	if (ret < 0)
+		return ret;
+
+	*val = val_buf[0] << 8;
+	if (reg != TMP108_REG_CONF || tmp108->config_reg_16bits)
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
+	if (reg == TMP108_REG_CONF && !tmp108->config_reg_16bits)
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
@@ -323,7 +428,8 @@ static const struct regmap_config tmp108_regmap_config = {
 	.use_single_write = true,
 };

-static int tmp108_common_probe(struct device *dev, struct regmap *regmap, char *name)
+static int tmp108_common_probe(struct device *dev, struct regmap *regmap, char *name,
+			       enum tmp108_hw_id hw_id)
 {
 	struct device *hwmon_dev;
 	struct tmp108 *tmp108;
@@ -340,6 +446,15 @@ static int tmp108_common_probe(struct device *dev, struct regmap *regmap, char *

 	dev_set_drvdata(dev, tmp108);
 	tmp108->regmap = regmap;
+	tmp108->hw_id = hw_id;
+	tmp108->config_reg_16bits = (hw_id == P3T1035_ID) ? false : true;
+	if (hw_id == P3T1035_ID) {
+		tmp108->sample_times = p3t1035_sample_times;
+		tmp108->n_sample_times = ARRAY_SIZE(p3t1035_sample_times);
+	} else {
+		tmp108->sample_times = tmp108_sample_times;
+		tmp108->n_sample_times = ARRAY_SIZE(tmp108_sample_times);
+	}

 	err = regmap_read(tmp108->regmap, TMP108_REG_CONF, &config);
 	if (err < 0) {
@@ -351,7 +466,6 @@ static int tmp108_common_probe(struct device *dev, struct regmap *regmap, char *
 	/* Only continuous mode is supported. */
 	config &= ~TMP108_CONF_MODE_MASK;
 	config |= TMP108_MODE_CONTINUOUS;
-
 	/* Only comparator mode is supported. */
 	config &= ~TMP108_CONF_TM;

@@ -384,17 +498,20 @@ static int tmp108_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct regmap *regmap;
+	enum tmp108_hw_id hw_id;

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
+	hw_id = (unsigned long)i2c_get_match_data(client);
+
+	return tmp108_common_probe(dev, regmap, client->name, hw_id);
 }

 static int tmp108_suspend(struct device *dev)
@@ -420,15 +537,17 @@ static int tmp108_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(tmp108_dev_pm_ops, tmp108_suspend, tmp108_resume);

 static const struct i2c_device_id tmp108_i2c_ids[] = {
-	{ "p3t1085" },
-	{ "tmp108" },
-	{ }
+	{ "p3t1035", P3T1035_ID },
+	{ "p3t1085", P3T1085_ID },
+	{ "tmp108", TMP108_ID },
+	{}
 };
 MODULE_DEVICE_TABLE(i2c, tmp108_i2c_ids);

 static const struct of_device_id tmp108_of_ids[] = {
-	{ .compatible = "nxp,p3t1085", },
-	{ .compatible = "ti,tmp108", },
+	{ .compatible = "nxp,p3t1035", .data = (void *)(uintptr_t)P3T1035_ID },
+	{ .compatible = "nxp,p3t1085", .data = (void *)(uintptr_t)P3T1085_ID },
+	{ .compatible = "ti,tmp108", .data = (void *)(uintptr_t)TMP108_ID },
 	{}
 };
 MODULE_DEVICE_TABLE(of, tmp108_of_ids);
@@ -444,7 +563,8 @@ static struct i2c_driver tmp108_driver = {
 };

 static const struct i3c_device_id p3t1085_i3c_ids[] = {
-	I3C_DEVICE(0x011b, 0x1529, NULL),
+	I3C_DEVICE(0x011B, 0x1529, (void *)P3T1085_ID),
+	I3C_DEVICE(0x011B, 0x152B, (void *)P3T1035_ID),
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
+	return tmp108_common_probe(dev, regmap, "p3t1085_i3c", (unsigned long)id->data);
 }

 static struct i3c_driver p3t1085_driver = {
--
2.34.1
