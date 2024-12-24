Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED4B68F66;
	Tue, 24 Dec 2024 06:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735022386; cv=none; b=uGV1X8RfN0VWMRmierX676az4hF6T+6FtAC7rsO6hiJ5gKhQB/sGRZtvHfXdRcNtyU7DDa2StJEEEpmVbJ0YrxAmlR3LZMZ1sAPfa3dYo62KIqb/dHYonKUQ3Y7bTA/zM+oPMJwJcfNw9UCI/j5WoHYhEKTwgmaeFO2IpesXJqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735022386; c=relaxed/simple;
	bh=G9amN2HCu2TQkAqkTiZWZ6oqUT8NdxgAA1llFZyxO9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sqJgkyqGwCAxJphm8BD3jK20yPQ4f9yqUYd+1ZvHKAmf08m1/KfnjzRBnj1Un5wHd5frT1GNFHkDGEfw6H7QicuiuJj5UQ8nYwoX0822brAz7NQYpzub4HLqIcTenk7uk6b/A6ou5edCnb1VcXR/+vXrQ6ZS4yeMCPtx7dwXGsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=B4jmMheP; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="B4jmMheP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=5o4P7
	VtiRR5ZHAQLaofcmHnUpYcagvo62Ql2R8DcOpo=; b=B4jmMheP54YDVVlen3clp
	BVcWNohFTMtg2A5obcRf4fbNBn9hJk5MFWc539Uw17smhGNTAWYVx3Z7R8wyk4qm
	m/uBEZ2argp6PaQJL22tgaSRN8/q5WTXRj3ureWvZXxpPVlOyfjiclPiTgBKKfpc
	zc3rPekWO7ndHbBQihj03E=
Received: from silergy-System-Product-Name.silergy.inc (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDnT8tRVmpnWko3BQ--.38652S5;
	Tue, 24 Dec 2024 14:36:06 +0800 (CST)
From: Wenliang Yan <wenliang202407@163.com>
To: linux@roeck-us.net,
	Jean Delvare <jdelvare@suse.com>
Cc: Wenliang <wenliang202407@163.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] hwmon:(ina238)Add support for SQ52206
Date: Tue, 24 Dec 2024 14:35:57 +0800
Message-ID: <20241224063559.391061-2-wenliang202407@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241224063559.391061-1-wenliang202407@163.com>
References: <20241224063559.391061-1-wenliang202407@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnT8tRVmpnWko3BQ--.38652S5
X-Coremail-Antispam: 1Uf129KBjvAXoW3uFyfWr45ZryUJF43urykZrb_yoW8GF48Ao
	W3Zrs7Xw1UGw18CFWv9w1rurW7XrWjyrs5A3WUtrZ0vFyIqrsxKa4fZ34xWFyrXF1vgr97
	Wwn5G3WfXay0v3Z7n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjfU75fHUUUUU
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbiMAq-02dqSyHX5gAAsA

From: Wenliang <wenliang202407@163.com>

Add support for SQ52206 to the Ina238 driver. Add registers,
add calculation formulas, increase compatibility, adjust
struct and chip initialization.

Signed-off-by: Wenliang <wenliang202407@163.com>
---

Incorporate four additional registers to the original register
set of SQ52206 beyond INA238.
The ADC measurement range of SQ52206 is divided into 1/2/4,
so change the configuration of INA238_ADC_CONFIG.
SQ52206's calculation of power read values is different from
INA238.Add new value of BUS_VOLTAGE_LSB and DIE-TEMP_LSB for
SQ52206. As a result of these changes, modify both the power
and temperature read and write operations.
Add kind and struct ina238_config *config in struct ina238_data
to save the chip type and different configurations for each
chip type, promoting program reusability.
Due to the temperature reading of SQ52206 being a signed 16 bit
value, while INA238 is a 12 bit value. So we changed the
temperature reading function.
Extract the chip initialization process into a separate function
named ina238_init to facilitate adjustments for various chip types.
Add a corresponding compatible to the driver.

 drivers/hwmon/ina238.c | 209 ++++++++++++++++++++++++++++-------------
 1 file changed, 144 insertions(+), 65 deletions(-)

diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index 2d9f12f68d50..131f5faefdb3 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -21,11 +21,14 @@
 #define INA238_CONFIG			0x0
 #define INA238_ADC_CONFIG		0x1
 #define INA238_SHUNT_CALIBRATION	0x2
+#define SQ52206_SHUNT_TEMPCO		0x3
 #define INA238_SHUNT_VOLTAGE		0x4
 #define INA238_BUS_VOLTAGE		0x5
 #define INA238_DIE_TEMP			0x6
 #define INA238_CURRENT			0x7
 #define INA238_POWER			0x8
+#define SQ52206_ENERGY			0x9
+#define SQ52206_CHARGE			0xa
 #define INA238_DIAG_ALERT		0xb
 #define INA238_SHUNT_OVER_VOLTAGE	0xc
 #define INA238_SHUNT_UNDER_VOLTAGE	0xd
@@ -33,9 +36,12 @@
 #define INA238_BUS_UNDER_VOLTAGE	0xf
 #define INA238_TEMP_LIMIT		0x10
 #define INA238_POWER_LIMIT		0x11
+#define SQ52206_POWER_PEAK		0x20
 #define INA238_DEVICE_ID		0x3f /* not available on INA237 */
 
 #define INA238_CONFIG_ADCRANGE		BIT(4)
+#define SQ52206_CONFIG_ADCRANGE		GENMASK(4, 3)
+#define SQ52206_READ_ADCRANGE(reg)		FIELD_GET(SQ52206_CONFIG_ADCRANGE, reg)
 
 #define INA238_DIAG_ALERT_TMPOL		BIT(7)
 #define INA238_DIAG_ALERT_SHNTOL	BIT(6)
@@ -44,7 +50,7 @@
 #define INA238_DIAG_ALERT_BUSUL		BIT(3)
 #define INA238_DIAG_ALERT_POL		BIT(2)
 
-#define INA238_REGISTERS		0x11
+#define INA238_MAX_REGISTERS		0x20
 
 #define INA238_RSHUNT_DEFAULT		10000 /* uOhm */
 
@@ -87,27 +93,63 @@
  *  shunt = 0x4000 / (819.2 * 10^6) / 0.001 = 20000 uOhms (with 1mA/lsb)
  *
  *  Current (mA) = register value * 20000 / rshunt / 4 * gain
- *  Power (W) = 0.2 * register value * 20000 / rshunt / 4 * gain
+ *  Power (mW) = 0.2 * register value * 20000 / rshunt / 4 * gain
+ *  (Specific for SQ52206)
+ *  Power (mW) = 0.24 * register value * 20000 / rshunt / 4 * gain
  */
 #define INA238_CALIBRATION_VALUE	16384
-#define INA238_FIXED_SHUNT		20000
+#define INA238_FIXED_SHUNT			20000
 
 #define INA238_SHUNT_VOLTAGE_LSB	5 /* 5 uV/lsb */
 #define INA238_BUS_VOLTAGE_LSB		3125 /* 3.125 mV/lsb */
-#define INA238_DIE_TEMP_LSB		125 /* 125 mC/lsb */
+#define INA238_DIE_TEMP_LSB			1250000 /* 125 mC/lsb */
+#define SQ52206_BUS_VOLTAGE_LSB		3750 /* 3.75 mV/lsb */
+#define SQ52206_DIE_TEMP_LSB		78125 /* 7.8125 mC/lsb */
 
 static const struct regmap_config ina238_regmap_config = {
-	.max_register = INA238_REGISTERS,
+	.max_register = INA238_MAX_REGISTERS,
 	.reg_bits = 8,
 	.val_bits = 16,
 };
 
+enum ina238_ids { ina238, ina237, sq52206 };
+
+struct ina238_config {
+	u16 config_default;
+	int calibration_value;
+	int bus_voltage_lsb;    /* uV */
+	int temp_lsb;   /* mC */
+};
+
 struct ina238_data {
+	const struct ina238_config *config;
 	struct i2c_client *client;
 	struct mutex config_lock;
 	struct regmap *regmap;
 	u32 rshunt;
 	int gain;
+	int kind;
+};
+
+static const struct ina238_config ina238_config[] = {
+	[ina238] = {
+		.config_default = INA238_CONFIG_DEFAULT,
+		.calibration_value = INA238_CALIBRATION_VALUE,
+		.bus_voltage_lsb = INA238_BUS_VOLTAGE_LSB,
+		.temp_lsb = INA238_DIE_TEMP_LSB,
+	},
+	[ina237] = {
+		.config_default = INA238_CONFIG_DEFAULT,
+		.calibration_value = INA238_CALIBRATION_VALUE,
+		.bus_voltage_lsb = INA238_BUS_VOLTAGE_LSB,
+		.temp_lsb = INA238_DIE_TEMP_LSB,
+	},
+	[sq52206] = {
+		.config_default = INA238_CONFIG_DEFAULT,
+		.calibration_value = INA238_CALIBRATION_VALUE,
+		.bus_voltage_lsb = SQ52206_BUS_VOLTAGE_LSB,
+		.temp_lsb = SQ52206_DIE_TEMP_LSB,
+	},
 };
 
 static int ina238_read_reg24(const struct i2c_client *client, u8 reg, u32 *val)
@@ -197,10 +239,10 @@ static int ina238_read_in(struct device *dev, u32 attr, int channel,
 		regval = (s16)regval;
 		if (channel == 0)
 			/* gain of 1 -> LSB / 4 */
-			*val = (regval * INA238_SHUNT_VOLTAGE_LSB) /
-			       (1000 * (4 - data->gain + 1));
+			*val = (regval * INA238_SHUNT_VOLTAGE_LSB) *
+					data->gain / (1000 * 4);
 		else
-			*val = (regval * INA238_BUS_VOLTAGE_LSB) / 1000;
+			*val = (regval * data->config->bus_voltage_lsb) / 1000;
 		break;
 	case hwmon_in_max_alarm:
 	case hwmon_in_min_alarm:
@@ -225,8 +267,8 @@ static int ina238_write_in(struct device *dev, u32 attr, int channel,
 	case 0:
 		/* signed value, clamp to max range +/-163 mV */
 		regval = clamp_val(val, -163, 163);
-		regval = (regval * 1000 * (4 - data->gain + 1)) /
-			 INA238_SHUNT_VOLTAGE_LSB;
+		regval = (regval * 1000 * 4) /
+			 INA238_SHUNT_VOLTAGE_LSB * data->gain;
 		regval = clamp_val(regval, S16_MIN, S16_MAX);
 
 		switch (attr) {
@@ -242,7 +284,7 @@ static int ina238_write_in(struct device *dev, u32 attr, int channel,
 	case 1:
 		/* signed value, positive values only. Clamp to max 102.396 V */
 		regval = clamp_val(val, 0, 102396);
-		regval = (regval * 1000) / INA238_BUS_VOLTAGE_LSB;
+		regval = (regval * 1000) / data->config->bus_voltage_lsb;
 		regval = clamp_val(regval, 0, S16_MAX);
 
 		switch (attr) {
@@ -295,10 +337,14 @@ static int ina238_read_power(struct device *dev, u32 attr, long *val)
 		err = ina238_read_reg24(data->client, INA238_POWER, &regval);
 		if (err)
 			return err;
-
-		/* Fixed 1mA lsb, scaled by 1000000 to have result in uW */
-		power = div_u64(regval * 1000ULL * INA238_FIXED_SHUNT *
-				data->gain, 20 * data->rshunt);
+		if (data->kind == sq52206)
+			/* Fixed 1mA lsb, scaled by 1000000 to have result in uW */
+			power = div_u64(regval * 1200ULL * INA238_FIXED_SHUNT *
+					data->gain, 20 * data->rshunt);
+		else
+			/* Fixed 1mA lsb, scaled by 1000000 to have result in uW */
+			power = div_u64(regval * 1000ULL * INA238_FIXED_SHUNT *
+					data->gain, 20 * data->rshunt);
 		/* Clamp value to maximum value of long */
 		*val = clamp_val(power, 0, LONG_MAX);
 		break;
@@ -311,8 +357,12 @@ static int ina238_read_power(struct device *dev, u32 attr, long *val)
 		 * Truncated 24-bit compare register, lower 8-bits are
 		 * truncated. Same conversion to/from uW as POWER register.
 		 */
-		power = div_u64((regval << 8) * 1000ULL * INA238_FIXED_SHUNT *
-			       data->gain, 20 * data->rshunt);
+		if (data->kind == sq52206)
+			power = div_u64((regval << 8) * 1200ULL * INA238_FIXED_SHUNT *
+					data->gain, 20 * data->rshunt);
+		else
+			power = div_u64((regval << 8) * 1000ULL * INA238_FIXED_SHUNT *
+					data->gain, 20 * data->rshunt);
 		/* Clamp value to maximum value of long */
 		*val = clamp_val(power, 0, LONG_MAX);
 		break;
@@ -344,8 +394,12 @@ static int ina238_write_power(struct device *dev, u32 attr, long val)
 	 * register.
 	 */
 	regval = clamp_val(val, 0, LONG_MAX);
-	regval = div_u64(val * 20ULL * data->rshunt,
-			 1000ULL * INA238_FIXED_SHUNT * data->gain);
+	if (data->kind == sq52206)
+		regval = div_u64(val * 20ULL * data->rshunt,
+				1000ULL * INA238_FIXED_SHUNT * data->gain);
+	else
+		regval = div_u64(val * 24ULL * data->rshunt,
+				1000ULL * INA238_FIXED_SHUNT * data->gain);
 	regval = clamp_val(regval >> 8, 0, U16_MAX);
 
 	return regmap_write(data->regmap, INA238_POWER_LIMIT, regval);
@@ -362,17 +416,29 @@ static int ina238_read_temp(struct device *dev, u32 attr, long *val)
 		err = regmap_read(data->regmap, INA238_DIE_TEMP, &regval);
 		if (err)
 			return err;
-
+		if (data->kind == sq52206)
+			/* Signed, bits 15-0 of register, result in mC */
+			regval = div_s64((s16)regval * data->config->temp_lsb,
+								10000);
+		else
 		/* Signed, bits 15-4 of register, result in mC */
-		*val = ((s16)regval >> 4) * INA238_DIE_TEMP_LSB;
+			*val = div_s64(((s16)regval >> 4) *
+							data->config->temp_lsb, 10000);
+		*val = clamp_val(regval, S16_MIN, S16_MAX);
 		break;
 	case hwmon_temp_max:
 		err = regmap_read(data->regmap, INA238_TEMP_LIMIT, &regval);
 		if (err)
 			return err;
-
-		/* Signed, bits 15-4 of register, result in mC */
-		*val = ((s16)regval >> 4) * INA238_DIE_TEMP_LSB;
+		if (data->kind == sq52206)
+			/* Signed, bits 15-0 of register, result in mC */
+			regval = div_s64((s16)regval * data->config->temp_lsb,
+								10000);
+		else
+			/* Signed, bits 15-4 of register, result in mC */
+			*val = div_s64(((s16)regval >> 4) *
+							data->config->temp_lsb, 10000);
+		*val = clamp_val(regval, S16_MIN, S16_MAX);
 		break;
 	case hwmon_temp_max_alarm:
 		err = regmap_read(data->regmap, INA238_DIAG_ALERT, &regval);
@@ -396,9 +462,14 @@ static int ina238_write_temp(struct device *dev, u32 attr, long val)
 	if (attr != hwmon_temp_max)
 		return -EOPNOTSUPP;
 
-	/* Signed, bits 15-4 of register */
-	regval = (val / INA238_DIE_TEMP_LSB) << 4;
-	regval = clamp_val(regval, S16_MIN, S16_MAX) & 0xfff0;
+	if (data->kind == sq52206) {
+		regval = div_u64(val*10000, data->config->temp_lsb);
+		regval = clamp_val(regval, S16_MIN, S16_MAX);
+	} else {
+		/* Signed, bits 15-4 of register */
+		regval = div_u64(val*10000, data->config->temp_lsb) << 4;
+		regval = clamp_val(regval, S16_MIN, S16_MAX) & 0xfff0;
+	}
 
 	return regmap_write(data->regmap, INA238_TEMP_LIMIT, regval);
 }
@@ -530,20 +601,58 @@ static const struct hwmon_chip_info ina238_chip_info = {
 	.info = ina238_info,
 };
 
+/*
+ * Initialize the configuration and calibration registers.
+ */
+static int ina238_init(struct ina238_data *data)
+{
+	int ret = 0;
+	int config;
+	/* Setup CONFIG register */
+	config = data->config->config_default;
+	if (data->gain == 1)
+		config |= INA238_CONFIG_ADCRANGE; /* ADCRANGE = 1 is /1 */
+	ret = regmap_write(data->regmap, INA238_CONFIG, config);
+	if (ret < 0)
+		return ret;
+	/* Setup ADC_CONFIG register */
+	ret = regmap_write(data->regmap, INA238_ADC_CONFIG,
+				INA238_ADC_CONFIG_DEFAULT);
+	if (ret < 0)
+		return ret;
+	/* Setup SHUNT_CALIBRATION register with fixed value */
+	ret = regmap_write(data->regmap, INA238_SHUNT_CALIBRATION,
+				data->config->calibration_value);
+	if (ret < 0)
+		return ret;
+	/* Setup alert/alarm configuration */
+	ret = regmap_write(data->regmap, INA238_DIAG_ALERT,
+				INA238_DIAG_ALERT_DEFAULT);
+	if (ret < 0)
+		return ret;
+	return 0;
+}
+static const struct i2c_device_id ina238_id[];
 static int ina238_probe(struct i2c_client *client)
 {
 	struct ina2xx_platform_data *pdata = dev_get_platdata(&client->dev);
 	struct device *dev = &client->dev;
 	struct device *hwmon_dev;
 	struct ina238_data *data;
-	int config;
+	enum ina238_ids chip;
 	int ret;
 
+	chip = (uintptr_t)i2c_get_match_data(client);
+
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
+	data->kind = chip;
 	data->client = client;
+	/* set the device type */
+	data->config = &ina238_config[data->kind];
+
 	mutex_init(&data->config_lock);
 
 	data->regmap = devm_regmap_init_i2c(client, &ina238_regmap_config);
@@ -564,48 +673,15 @@ static int ina238_probe(struct i2c_client *client)
 	/* load shunt gain value */
 	if (device_property_read_u32(dev, "ti,shunt-gain", &data->gain) < 0)
 		data->gain = 4; /* Default of ADCRANGE = 0 */
-	if (data->gain != 1 && data->gain != 4) {
+	if (data->gain != 1 && data->gain != 2 && data->gain != 4) {
 		dev_err(dev, "invalid shunt gain value %u\n", data->gain);
 		return -EINVAL;
 	}
-
-	/* Setup CONFIG register */
-	config = INA238_CONFIG_DEFAULT;
-	if (data->gain == 1)
-		config |= INA238_CONFIG_ADCRANGE; /* ADCRANGE = 1 is /1 */
-	ret = regmap_write(data->regmap, INA238_CONFIG, config);
-	if (ret < 0) {
-		dev_err(dev, "error configuring the device: %d\n", ret);
-		return -ENODEV;
-	}
-
-	/* Setup ADC_CONFIG register */
-	ret = regmap_write(data->regmap, INA238_ADC_CONFIG,
-			   INA238_ADC_CONFIG_DEFAULT);
-	if (ret < 0) {
-		dev_err(dev, "error configuring the device: %d\n", ret);
-		return -ENODEV;
-	}
-
-	/* Setup SHUNT_CALIBRATION register with fixed value */
-	ret = regmap_write(data->regmap, INA238_SHUNT_CALIBRATION,
-			   INA238_CALIBRATION_VALUE);
-	if (ret < 0) {
-		dev_err(dev, "error configuring the device: %d\n", ret);
-		return -ENODEV;
-	}
-
-	/* Setup alert/alarm configuration */
-	ret = regmap_write(data->regmap, INA238_DIAG_ALERT,
-			   INA238_DIAG_ALERT_DEFAULT);
-	if (ret < 0) {
-		dev_err(dev, "error configuring the device: %d\n", ret);
-		return -ENODEV;
-	}
+	ret = ina238_init(data);
 
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
 							 &ina238_chip_info,
-							 NULL);
+							 ina238_groups);
 	if (IS_ERR(hwmon_dev))
 		return PTR_ERR(hwmon_dev);
 
@@ -616,7 +692,9 @@ static int ina238_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ina238_id[] = {
-	{ "ina238" },
+	{ "ina238", ina238 },
+	{ "ina237", ina237 },
+	{ "sq52206", sq52206 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ina238_id);
@@ -624,6 +702,7 @@ MODULE_DEVICE_TABLE(i2c, ina238_id);
 static const struct of_device_id __maybe_unused ina238_of_match[] = {
 	{ .compatible = "ti,ina237" },
 	{ .compatible = "ti,ina238" },
+	{ .compatible = "silergy,sq52206" },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, ina238_of_match);
-- 
2.43.0

