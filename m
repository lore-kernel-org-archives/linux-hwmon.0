Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A143815C5;
	Tue, 13 Jan 2026 09:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768294925; cv=none; b=crKLY4J84P+dyPXRWx79MoOrgYMJpTkywHitwtBK2NP2461jJStM1K0T0nPN/zF3oGKEvxU4AvWjE0XrFheJwDAEDFhxGIvaMYfj1jfWbAwcNiA+HjxzrM3feuqpwbunZgYdeKMLwVDnxDgVPTGrrK7osc6QmPNvx2kn5KKGNP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768294925; c=relaxed/simple;
	bh=wNS71q1c/mVJ8egfaggPHK7wTIBBjHWQW1j7nxECQ60=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RwUfwQkEA3HflKC2KLj2Ln5qYPXUO6/ITUVDUGEpYkB8cWp+LAnDUlmHxliWC0c3V8W5VZLxB1BCBkarhWihffEIDO8kIR/J6WPJ52kAx4wNGwxSshn2ktJ/P3b9mzbWAsWhY2QrrzAcK5nCJR0v55OGUelawjQPWDJ+rh29KBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id DBBE0200AF2;
	Tue, 13 Jan 2026 09:52:11 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 7E7E1200960;
	Tue, 13 Jan 2026 09:52:11 +0100 (CET)
Received: from NXL37714.wbi.nxp.com (nxl37714.wbi.nxp.com [10.31.156.112])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 085B51800241;
	Tue, 13 Jan 2026 16:52:09 +0800 (+08)
From: Mayank Mahajan <mayankmahajan.x@nxp.com>
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: priyanka.jain@nxp.com,
	vikash.bansal@nxp.com,
	Mayank Mahajan <mayankmahajan.x@nxp.com>
Subject: [PATCH 1/3] hwmon: (tmp108) Add support for P3T1035 and P3T2030
Date: Tue, 13 Jan 2026 14:22:07 +0530
Message-ID: <20260113085207.1608-1-mayankmahajan.x@nxp.com>
X-Mailer: git-send-email 2.47.1.windows.1
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
 drivers/hwmon/Kconfig  |   2 +-
 drivers/hwmon/tmp108.c | 293 ++++++++++++++++++++++++++++++++++-------
 2 files changed, 243 insertions(+), 52 deletions(-)

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
index 60a237cbedbc..073d1a735911 100644
--- a/drivers/hwmon/tmp108.c
+++ b/drivers/hwmon/tmp108.c
@@ -11,6 +11,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/i2c.h>
+#include <linux/i3c/master.h>
 #include <linux/i3c/device.h>
 #include <linux/init.h>
 #include <linux/jiffies.h>
@@ -20,13 +21,19 @@
 
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
 #define	TMP108_REG_THIGH	0x03
 
-#define TMP108_TEMP_MIN_MC	-50000 /* Minimum millicelcius. */
-#define TMP108_TEMP_MAX_MC	127937 /* Maximum millicelcius. */
+#define TMP108_TEMP_MIN_MC	-50000 /* Minimum millicelsius. */
+#define TMP108_TEMP_MAX_MC	127937 /* Maximum millicelsius. */
 
 /* Configuration register bits.
  * Note: these bit definitions are byte swapped.
@@ -70,10 +77,39 @@
 
 #define TMP108_CONVERSION_TIME_MS	30	/* in milli-seconds */
 
+/* P3T1035 (8-bit) Configuration register bits (Conf @ 0x01) */
+#define P3T1035_CONF_M0			0x01	/* Sensor mode. */
+#define P3T1035_CONF_M1			0x02
+#define P3T1035_CONF_LC			0x04	/* Latch FH/FL until Conf is read */
+#define P3T1035_CONF_FL			0x08	/* Flag Low  */
+#define P3T1035_CONF_FH			0x10	/* Flag High */
+#define P3T1035_CONF_CR0		0x20	/* Conversion rate */
+#define P3T1035_CONF_CR1		0x40
+#define P3T1035_CONF_ID			0x80
+
+/* Defaults set by the hardware upon reset. */
+#define P3T1035_CONF_DEFAULTS		(P3T1035_CONF_M1)
+/* These bits are read-only. */
+#define P3T1035_CONF_READ_ONLY		(P3T1035_CONF_FL | P3T1035_CONF_FH | P3T1035_CONF_ID)
+
+#define P3T1035_CONF_MODE_MASK		(P3T1035_CONF_M0 | P3T1035_CONF_M1)
+#define P3T1035_MODE_SHUTDOWN		0x00
+#define P3T1035_MODE_ONE_SHOT		P3T1035_CONF_M0	/* M1:M0 = 01 */
+#define P3T1035_MODE_CONTINUOUS		P3T1035_CONF_M1	/* M1:M0 = 10 */
+
+#define P3T1035_CONF_CONVRATE_MASK	(P3T1035_CONF_CR0 | P3T1035_CONF_CR1)
+/* 00=0.25Hz, 01=1Hz, 10=4Hz, 11=8Hz */
+#define P3T1035_CONVRATE_0P25HZ		0x00
+#define P3T1035_CONVRATE_1HZ		P3T1035_CONF_CR0
+#define P3T1035_CONVRATE_4HZ		P3T1035_CONF_CR1
+#define P3T1035_CONVRATE_8HZ		(P3T1035_CONF_CR0 | P3T1035_CONF_CR1)
+
 struct tmp108 {
 	struct regmap *regmap;
+	struct regmap *regmap_8;
 	u16 orig_config;
 	unsigned long ready_time;
+	enum tmp108_hw_id hw_id;
 };
 
 /* convert 12-bit TMP108 register value to milliCelsius */
@@ -97,6 +133,27 @@ static int tmp108_read(struct device *dev, enum hwmon_sensor_types type,
 
 	if (type == hwmon_chip) {
 		if (attr == hwmon_chip_update_interval) {
+			if (tmp108->hw_id == P3T1035_ID) {
+				err = regmap_read(tmp108->regmap_8, TMP108_REG_CONF, &regval);
+				if (err < 0)
+					return err;
+				switch (regval & P3T1035_CONF_CONVRATE_MASK) {
+				case P3T1035_CONVRATE_0P25HZ:
+				default:
+					*temp = 4000;
+					break;
+				case P3T1035_CONVRATE_1HZ:
+					*temp = 1000;
+					break;
+				case P3T1035_CONVRATE_4HZ:
+					*temp = 250;
+					break;
+				case P3T1035_CONVRATE_8HZ:
+					*temp = 125;
+					break;
+				}
+				return 0;
+			}
 			err = regmap_read(tmp108->regmap, TMP108_REG_CONF,
 					  &regval);
 			if (err < 0)
@@ -144,11 +201,19 @@ static int tmp108_read(struct device *dev, enum hwmon_sensor_types type,
 		break;
 	case hwmon_temp_min_alarm:
 	case hwmon_temp_max_alarm:
-		err = regmap_read(tmp108->regmap, TMP108_REG_CONF, &regval);
-		if (err < 0)
-			return err;
-		*temp = !!(regval & (attr == hwmon_temp_min_alarm ?
-				     TMP108_CONF_FL : TMP108_CONF_FH));
+		if (tmp108->hw_id == P3T1035_ID) {
+			err = regmap_read(tmp108->regmap_8, TMP108_REG_CONF, &regval);
+			if (err < 0)
+				return err;
+			*temp = !!(regval & (attr == hwmon_temp_min_alarm ?
+					     P3T1035_CONF_FL : P3T1035_CONF_FH));
+		} else {
+			err = regmap_read(tmp108->regmap, TMP108_REG_CONF, &regval);
+			if (err < 0)
+				return err;
+			*temp = !!(regval & (attr == hwmon_temp_min_alarm ?
+					     TMP108_CONF_FL : TMP108_CONF_FH));
+		}
 		break;
 	case hwmon_temp_min_hyst:
 	case hwmon_temp_max_hyst:
@@ -196,6 +261,18 @@ static int tmp108_write(struct device *dev, enum hwmon_sensor_types type,
 
 	if (type == hwmon_chip) {
 		if (attr == hwmon_chip_update_interval) {
+			if (tmp108->hw_id == P3T1035_ID) {
+				if (temp < 187)
+					mask = P3T1035_CONVRATE_8HZ;
+				else if (temp < 625)
+					mask = P3T1035_CONVRATE_4HZ;
+				else if (temp < 2500)
+					mask = P3T1035_CONVRATE_1HZ;
+				else
+					mask = P3T1035_CONVRATE_0P25HZ;
+				return regmap_update_bits(tmp108->regmap_8, TMP108_REG_CONF,
+							  P3T1035_CONF_CONVRATE_MASK, mask);
+			}
 			if (temp < 156)
 				mask = TMP108_CONVRATE_16HZ;
 			else if (temp < 625)
@@ -282,6 +359,15 @@ static const struct hwmon_channel_info * const tmp108_info[] = {
 	NULL
 };
 
+static const struct hwmon_channel_info * const p3t1035_info[] = {
+	HWMON_CHANNEL_INFO(chip,
+			   HWMON_C_REGISTER_TZ | HWMON_C_UPDATE_INTERVAL),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
+			   HWMON_T_MIN_ALARM | HWMON_T_MAX_ALARM),
+	NULL
+};
+
 static const struct hwmon_ops tmp108_hwmon_ops = {
 	.is_visible = tmp108_is_visible,
 	.read = tmp108_read,
@@ -293,11 +379,19 @@ static const struct hwmon_chip_info tmp108_chip_info = {
 	.info = tmp108_info,
 };
 
+static const struct hwmon_chip_info p3t1035_chip_info = {
+	.ops = &tmp108_hwmon_ops,
+	.info = p3t1035_info,
+};
+
 static void tmp108_restore_config(void *data)
 {
 	struct tmp108 *tmp108 = data;
 
-	regmap_write(tmp108->regmap, TMP108_REG_CONF, tmp108->orig_config);
+	if (tmp108->hw_id == P3T1035_ID)
+		regmap_write(tmp108->regmap_8, TMP108_REG_CONF, tmp108->orig_config);
+	else
+		regmap_write(tmp108->regmap, TMP108_REG_CONF, tmp108->orig_config);
 }
 
 static bool tmp108_is_writeable_reg(struct device *dev, unsigned int reg)
@@ -323,8 +417,22 @@ static const struct regmap_config tmp108_regmap_config = {
 	.use_single_write = true,
 };
 
-static int tmp108_common_probe(struct device *dev, struct regmap *regmap, char *name)
+static const struct regmap_config p3t1035_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = TMP108_REG_CONF,
+	.writeable_reg = tmp108_is_writeable_reg,
+	.volatile_reg = tmp108_is_volatile_reg,
+	.val_format_endian = REGMAP_ENDIAN_BIG,
+	.cache_type = REGCACHE_MAPLE,
+	.use_single_read = true,
+	.use_single_write = true,
+};
+
+static int tmp108_common_probe(struct device *dev, struct regmap *regmap, struct regmap *regmap_8,
+			       char *name, enum tmp108_hw_id hw_id)
 {
+	const struct hwmon_chip_info *chip_info;
 	struct device *hwmon_dev;
 	struct tmp108 *tmp108;
 	u32 config;
@@ -340,50 +448,79 @@ static int tmp108_common_probe(struct device *dev, struct regmap *regmap, char *
 
 	dev_set_drvdata(dev, tmp108);
 	tmp108->regmap = regmap;
+	tmp108->hw_id = hw_id;
+	if (hw_id == P3T1035_ID)
+		tmp108->regmap_8 = regmap_8;
+	else
+		tmp108->regmap_8 = NULL;
 
-	err = regmap_read(tmp108->regmap, TMP108_REG_CONF, &config);
-	if (err < 0) {
-		dev_err(dev, "error reading config register: %d", err);
-		return err;
-	}
-	tmp108->orig_config = config;
+	tmp108->ready_time = jiffies;
 
-	/* Only continuous mode is supported. */
-	config &= ~TMP108_CONF_MODE_MASK;
-	config |= TMP108_MODE_CONTINUOUS;
+	if (tmp108->hw_id == P3T1035_ID) {
+		err = regmap_read(tmp108->regmap_8, TMP108_REG_CONF, &config);
+		if (err < 0) {
+			dev_err_probe(dev, err, "Error reading config register");
+			return err;
+		}
+		tmp108->orig_config = config;
 
-	/* Only comparator mode is supported. */
-	config &= ~TMP108_CONF_TM;
+		/* Only continuous mode is supported. */
+		config &= ~P3T1035_CONF_MODE_MASK;
+		config |= P3T1035_MODE_CONTINUOUS;
 
-	err = regmap_write(tmp108->regmap, TMP108_REG_CONF, config);
-	if (err < 0) {
-		dev_err(dev, "error writing config register: %d", err);
-		return err;
-	}
+		/* Latch control is not supported. */
+		config &= ~P3T1035_CONF_LC;
 
-	tmp108->ready_time = jiffies;
-	if ((tmp108->orig_config & TMP108_CONF_MODE_MASK) ==
-	    TMP108_MODE_SHUTDOWN)
-		tmp108->ready_time +=
-			msecs_to_jiffies(TMP108_CONVERSION_TIME_MS);
+		err = regmap_write(tmp108->regmap_8, TMP108_REG_CONF, config);
+		if (err < 0) {
+			dev_err_probe(dev, err, "Error writing config register");
+			return err;
+		}
+
+		if ((tmp108->orig_config & P3T1035_CONF_MODE_MASK) == P3T1035_MODE_SHUTDOWN)
+			tmp108->ready_time += msecs_to_jiffies(TMP108_CONVERSION_TIME_MS);
+	} else {
+		err = regmap_read(tmp108->regmap, TMP108_REG_CONF, &config);
+		if (err < 0) {
+			dev_err_probe(dev, err, "Error reading config register");
+			return err;
+		}
+		tmp108->orig_config = config;
+
+		/* Only continuous mode is supported. */
+		config &= ~TMP108_CONF_MODE_MASK;
+		config |= TMP108_MODE_CONTINUOUS;
+
+		/* Only comparator mode is supported. */
+		config &= ~TMP108_CONF_TM;
+
+		err = regmap_write(tmp108->regmap, TMP108_REG_CONF, config);
+		if (err < 0) {
+			dev_err_probe(dev, err, "Error writing config register");
+			return err;
+		}
+
+		if ((tmp108->orig_config & TMP108_CONF_MODE_MASK) == TMP108_MODE_SHUTDOWN)
+			tmp108->ready_time += msecs_to_jiffies(TMP108_CONVERSION_TIME_MS);
+	}
 
 	err = devm_add_action_or_reset(dev, tmp108_restore_config, tmp108);
 	if (err) {
-		dev_err(dev, "add action or reset failed: %d", err);
+		dev_err_probe(dev, err, "Add action or reset failed");
 		return err;
 	}
 
-	hwmon_dev = devm_hwmon_device_register_with_info(dev, name,
-							 tmp108,
-							 &tmp108_chip_info,
-							 NULL);
+	chip_info = (hw_id == P3T1035_ID) ? &p3t1035_chip_info : &tmp108_chip_info;
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, name, tmp108, chip_info, NULL);
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
 static int tmp108_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	struct regmap *regmap;
+	struct regmap *regmap, *regmap_8;
+	enum tmp108_hw_id hw_id;
+	const void *of_data;
 
 	if (!i2c_check_functionality(client->adapter,
 				     I2C_FUNC_SMBUS_WORD_DATA))
@@ -394,15 +531,42 @@ static int tmp108_probe(struct i2c_client *client)
 	if (IS_ERR(regmap))
 		return dev_err_probe(dev, PTR_ERR(regmap), "regmap init failed");
 
-	return tmp108_common_probe(dev, regmap, client->name);
+	/* Prefer OF match data (DT-first systems) */
+	of_data = device_get_match_data(&client->dev);
+	if (of_data) {
+		hw_id = (enum tmp108_hw_id)(uintptr_t)of_data;
+	} else {
+		/* Fall back to legacy I2C ID table */
+		const struct i2c_device_id *id = i2c_client_get_device_id(client);
+
+		if (!id) {
+			dev_err_probe(dev, -ENODEV, "No matching device ID for i2c device\n");
+			return -ENODEV;
+		}
+		hw_id = (enum tmp108_hw_id)id->driver_data;
+	}
+
+	if (hw_id == P3T1035_ID) {
+		regmap_8 = devm_regmap_init_i2c(client, &p3t1035_regmap_config);
+		if (IS_ERR(regmap_8))
+			return dev_err_probe(dev, PTR_ERR(regmap_8), "regmap_8 init failed");
+	} else {
+		regmap_8 = NULL;
+	}
+
+	return tmp108_common_probe(dev, regmap, regmap_8, client->name, hw_id);
 }
 
 static int tmp108_suspend(struct device *dev)
 {
 	struct tmp108 *tmp108 = dev_get_drvdata(dev);
 
-	return regmap_update_bits(tmp108->regmap, TMP108_REG_CONF,
-				  TMP108_CONF_MODE_MASK, TMP108_MODE_SHUTDOWN);
+	if (tmp108->hw_id == P3T1035_ID)
+		return regmap_update_bits(tmp108->regmap_8, TMP108_REG_CONF,
+					  P3T1035_CONF_MODE_MASK, P3T1035_MODE_SHUTDOWN);
+	else
+		return regmap_update_bits(tmp108->regmap, TMP108_REG_CONF,
+					  TMP108_CONF_MODE_MASK, TMP108_MODE_SHUTDOWN);
 }
 
 static int tmp108_resume(struct device *dev)
@@ -410,8 +574,12 @@ static int tmp108_resume(struct device *dev)
 	struct tmp108 *tmp108 = dev_get_drvdata(dev);
 	int err;
 
-	err = regmap_update_bits(tmp108->regmap, TMP108_REG_CONF,
-				 TMP108_CONF_MODE_MASK, TMP108_MODE_CONTINUOUS);
+	if (tmp108->hw_id == P3T1035_ID)
+		err = regmap_update_bits(tmp108->regmap_8, TMP108_REG_CONF,
+					 P3T1035_CONF_MODE_MASK, P3T1035_MODE_CONTINUOUS);
+	else
+		err = regmap_update_bits(tmp108->regmap, TMP108_REG_CONF,
+					 TMP108_CONF_MODE_MASK, TMP108_MODE_CONTINUOUS);
 	tmp108->ready_time = jiffies +
 			     msecs_to_jiffies(TMP108_CONVERSION_TIME_MS);
 	return err;
@@ -420,16 +588,20 @@ static int tmp108_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(tmp108_dev_pm_ops, tmp108_suspend, tmp108_resume);
 
 static const struct i2c_device_id tmp108_i2c_ids[] = {
-	{ "p3t1085" },
-	{ "tmp108" },
-	{ }
+	{ "p3t1035", P3T1035_ID },
+	{ "p3t1085", P3T1085_ID },
+	{ "p3t2030", P3T1035_ID },
+	{ "tmp108", TMP108_ID },
+	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(i2c, tmp108_i2c_ids);
 
 static const struct of_device_id tmp108_of_ids[] = {
-	{ .compatible = "nxp,p3t1085", },
-	{ .compatible = "ti,tmp108", },
-	{}
+	{ .compatible = "nxp,p3t1035", .data = (void *)(uintptr_t)P3T1035_ID },
+	{ .compatible = "nxp,p3t1085", .data = (void *)(uintptr_t)P3T1085_ID },
+	{ .compatible = "nxp,p3t2030", .data = (void *)(uintptr_t)P3T1035_ID },
+	{ .compatible = "ti,tmp108", .data = (void *)(uintptr_t)TMP108_ID },
+	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, tmp108_of_ids);
 
@@ -444,22 +616,41 @@ static struct i2c_driver tmp108_driver = {
 };
 
 static const struct i3c_device_id p3t1085_i3c_ids[] = {
-	I3C_DEVICE(0x011b, 0x1529, NULL),
-	{}
+	I3C_DEVICE(0x011B, 0x1529, (void *)P3T1085_ID),
+	I3C_DEVICE(0x011B, 0x152B, (void *)P3T1035_ID),
+	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(i3c, p3t1085_i3c_ids);
 
 static int p3t1085_i3c_probe(struct i3c_device *i3cdev)
 {
 	struct device *dev = i3cdev_to_dev(i3cdev);
-	struct regmap *regmap;
+	struct regmap *regmap, *regmap_8;
+	const struct i3c_device_id *id;
+	enum tmp108_hw_id hw_id;
 
 	regmap = devm_regmap_init_i3c(i3cdev, &tmp108_regmap_config);
 	if (IS_ERR(regmap))
 		return dev_err_probe(dev, PTR_ERR(regmap),
 				     "Failed to register i3c regmap\n");
 
-	return tmp108_common_probe(dev, regmap, "p3t1085_i3c");
+	id = i3c_device_match_id(i3cdev, p3t1085_i3c_ids);
+	if (!id) {
+		dev_err_probe(dev, -ENODEV, "No matching device ID for i3c device\n");
+		return -ENODEV;
+	}
+	hw_id = (enum tmp108_hw_id)(uintptr_t)id->data;
+
+	if (hw_id == P3T1035_ID) {
+		regmap_8 = devm_regmap_init_i3c(i3cdev, &p3t1035_regmap_config);
+		if (IS_ERR(regmap_8))
+			return dev_err_probe(dev, PTR_ERR(regmap_8),
+					     "Failed to register i3c regmap_8\n");
+	} else {
+		regmap_8 = NULL;
+	}
+
+	return tmp108_common_probe(dev, regmap, regmap_8, "p3t1085_i3c", hw_id);
 }
 
 static struct i3c_driver p3t1085_driver = {
-- 
2.34.1

