Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27D0E14A09C;
	Mon, 13 Jan 2025 03:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736740347; cv=none; b=UAFsRN6QjjIyMtsTg/dyL9vlXysWEH8mjObuk75s0UzUqvMlup0YCPH3buXC5WaNT+MTf5vHu0uOqLq256VYsDQvLpTtVjRcQ9S9f7hNJHH6tnULy9r9YVUnLm2XRFc6OGh723Kc4ZBorB7LieJ3jXTcGGMnmFNgMRnOZpMbYUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736740347; c=relaxed/simple;
	bh=41pVECwXexWrRn4JhbF2x1gtU4k9xcJCUPxQ4xsD+XM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mYIgrRhMk+zQnHFWmgW4YzXPmZUHInQ7toh8ZF+x7mbYOBF+k2vVbwSB2PkWspN3gLDSzGumTfXk/0B9uic3yg7buoSwj9DpNGz2W/XFTDRaSNuJxmDWLLLcU5rJjf1/jt0R3arf3DKn4AQeEEEOzncnvAwRWL2OSpgFrUVjEDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=kichSEGW; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="kichSEGW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=dWaXE
	AS//Lwj1K1U4oLpRFhGORLZU1Bgcxvq8BLP1aI=; b=kichSEGW8bfE7wlSO6Aw+
	soPW0oJP+C31lpSV3KFAszOZWtAaSymF08Q4T5PbBf+Ii3oYpyQAsF2sLYryAPfb
	yg3a6GEdCxCsCMPMX62ZY4DoadT5lXjLYceX7givW+11YUJxA96Xe3WGd6i+0hoK
	ym8rSjELux4ho6Pu7wxbHg=
Received: from silergy-System-Product-Name.silergy.inc (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3n1u4jYRnlJg_Fw--.9826S6;
	Mon, 13 Jan 2025 11:51:37 +0800 (CST)
From: Wenliang Yan <wenliang202407@163.com>
To: linux@roeck-us.net,
	Jean Delvare <jdelvare@suse.com>
Cc: Wenliang Yan <wenliang202407@163.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] hwmon:(ina238)Add support for SQ52206
Date: Mon, 13 Jan 2025 11:50:23 +0800
Message-ID: <20250113035023.365697-3-wenliang202407@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250113035023.365697-1-wenliang202407@163.com>
References: <20250113035023.365697-1-wenliang202407@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3n1u4jYRnlJg_Fw--.9826S6
X-Coremail-Antispam: 1Uf129KBjvAXoW3uFyfWr4fCFW7uFW3Kr1rZwb_yoW8WF1kto
	Wavrs3uw4UGw1fArWFkw18CFW7Xr4jkr48ZF1UKrWDuFyIqrn8Ka4fZ34xWFyrZws0gFyx
	Wr1UGw1rXa1qy3Wkn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjTRiL05UUUUU
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbiRwzT02eEie9kEQAAs7

Add support for SQ52206 to the Ina238 driver. Add registers,
add calculation formulas, increase compatibility, add
compatibility programs for multiple chips.

Signed-off-by: Wenliang Yan <wenliang202407@163.com>
---

Incorporate four additional registers to the original register
set of SQ52206 beyond INA238.

The ADC measurement range of SQ52206 is divided into 1/2/4, so
change the configuration of INA238_ADC_CONFIG.

SQ52206's calculation of power read values is different from
INA238.Add new value of BUS_VOLTAGE_LSB and DIE-TEMP_LSB for
SQ52206. As a result of these changes, modify both the power
and temperature read and write operations.

Add new parameters in struct ina238_data to save the chip type
and different configurations for each chip type, promoting
program reusability.

Due to the temperature reading of SQ52206 being a signed 16 bit
value, while INA238 is a 12 bit value. So we changed the
temperature reading function.

Extract the chip initialization process into a separate function
named ina238_init to facilitate adjustments for various chips.

Add a corresponding compatible to the driver.

Add a 40 bit data reading function to prepare for energy reading.

Energy attributes are 5bytes wide, so modified the function for
energy1_input to use u64.

Add HWMON_P_INPUT_HIGHEST for power.

 Documentation/hwmon/ina238.rst |  15 +++
 drivers/hwmon/ina238.c         | 207 ++++++++++++++++++++++++++++-----
 2 files changed, 190 insertions(+), 32 deletions(-)

diff --git a/Documentation/hwmon/ina238.rst b/Documentation/hwmon/ina238.rst
index d9f479984420..d1b93cf8627f 100644
--- a/Documentation/hwmon/ina238.rst
+++ b/Documentation/hwmon/ina238.rst
@@ -14,6 +14,12 @@ Supported chips:
     Datasheet:
 	https://www.ti.com/lit/gpn/ina238
 
+  * Silergy SQ52206
+
+    Prefix: 'SQ52206'
+
+    Addresses: I2C 0x40 - 0x4f
+
 Author: Nathan Rossi <nathan.rossi@digi.com>
 
 Description
@@ -54,3 +60,12 @@ temp1_input		Die temperature measurement (mC)
 temp1_max		Maximum die temperature threshold (mC)
 temp1_max_alarm		Maximum die temperature alarm
 ======================= =======================================================
+
+Additional sysfs entries for sq52206
+------------------------------------
+
+======================= =======================================================
+energy1_input		Energy measurement (mJ)
+
+power1_input_highest	Peak Power (uW)
+======================= =======================================================
diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index 2d9f12f68d50..6c5bc10c3a1f 100644
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
+#define SQ52206_CONFIG_ADCRANGE_HIGH	BIT(4)
+#define SQ52206_CONFIG_ADCRANGE_LOW		BIT(3)
 
 #define INA238_DIAG_ALERT_TMPOL		BIT(7)
 #define INA238_DIAG_ALERT_SHNTOL	BIT(6)
@@ -44,12 +50,13 @@
 #define INA238_DIAG_ALERT_BUSUL		BIT(3)
 #define INA238_DIAG_ALERT_POL		BIT(2)
 
-#define INA238_REGISTERS		0x11
+#define INA238_REGISTERS		0x20
 
 #define INA238_RSHUNT_DEFAULT		10000 /* uOhm */
 
 /* Default configuration of device on reset. */
 #define INA238_CONFIG_DEFAULT		0
+#define SQ52206_CONFIG_DEFAULT		0x0005
 /* 16 sample averaging, 1052us conversion time, continuous mode */
 #define INA238_ADC_CONFIG_DEFAULT	0xfb6a
 /* Configure alerts to be based on averaged value (SLOWALERT) */
@@ -87,14 +94,19 @@
  *  shunt = 0x4000 / (819.2 * 10^6) / 0.001 = 20000 uOhms (with 1mA/lsb)
  *
  *  Current (mA) = register value * 20000 / rshunt / 4 * gain
- *  Power (W) = 0.2 * register value * 20000 / rshunt / 4 * gain
+ *  Power (mW) = 0.2 * register value * 20000 / rshunt / 4 * gain
+ *  (Specific for SQ52206)
+ *  Power (mW) = 0.24 * register value * 20000 / rshunt / 4 * gain
+ *  Energy (mJ) = 16 * 0.24 * register value * 20000 / rshunt / 4 * gain
  */
 #define INA238_CALIBRATION_VALUE	16384
 #define INA238_FIXED_SHUNT		20000
 
 #define INA238_SHUNT_VOLTAGE_LSB	5 /* 5 uV/lsb */
 #define INA238_BUS_VOLTAGE_LSB		3125 /* 3.125 mV/lsb */
-#define INA238_DIE_TEMP_LSB		125 /* 125 mC/lsb */
+#define INA238_DIE_TEMP_LSB			1250000 /* 125 mC/lsb */
+#define SQ52206_BUS_VOLTAGE_LSB		3750 /* 3.75 mV/lsb */
+#define SQ52206_DIE_TEMP_LSB		78125 /* 7.8125 mC/lsb */
 
 static const struct regmap_config ina238_regmap_config = {
 	.max_register = INA238_REGISTERS,
@@ -102,7 +114,20 @@ static const struct regmap_config ina238_regmap_config = {
 	.val_bits = 16,
 };
 
+enum ina238_ids { ina238, ina237, sq52206 };
+
+struct ina238_config {
+	bool has_power_highest;		/* chip detection power peak */
+	bool has_energy;		/* chip detection energy */
+	u8 temp_shift;
+	u32 power_calculate_factor;		/*fixed parameters for power calculate*/
+	u16 config_default;
+	int bus_voltage_lsb;    /* uV */
+	int temp_lsb;   /* mC */
+};
+
 struct ina238_data {
+	const struct ina238_config *config;
 	struct i2c_client *client;
 	struct mutex config_lock;
 	struct regmap *regmap;
@@ -110,6 +135,36 @@ struct ina238_data {
 	int gain;
 };
 
+static const struct ina238_config ina238_config[] = {
+	[ina238] = {
+		.has_energy = false,
+		.has_power_highest = false,
+		.temp_shift = 4,
+		.power_calculate_factor = 20,
+		.config_default = INA238_CONFIG_DEFAULT,
+		.bus_voltage_lsb = INA238_BUS_VOLTAGE_LSB,
+		.temp_lsb = INA238_DIE_TEMP_LSB,
+	},
+	[ina237] = {
+		.has_energy = false,
+		.has_power_highest = false,
+		.temp_shift = 4,
+		.power_calculate_factor = 20,
+		.config_default = INA238_CONFIG_DEFAULT,
+		.bus_voltage_lsb = INA238_BUS_VOLTAGE_LSB,
+		.temp_lsb = INA238_DIE_TEMP_LSB,
+	},
+	[sq52206] = {
+		.has_energy = true,
+		.has_power_highest = true,
+		.temp_shift = 0,
+		.power_calculate_factor = 24,
+		.config_default = SQ52206_CONFIG_DEFAULT,
+		.bus_voltage_lsb = SQ52206_BUS_VOLTAGE_LSB,
+		.temp_lsb = SQ52206_DIE_TEMP_LSB,
+	},
+};
+
 static int ina238_read_reg24(const struct i2c_client *client, u8 reg, u32 *val)
 {
 	u8 data[3];
@@ -126,6 +181,24 @@ static int ina238_read_reg24(const struct i2c_client *client, u8 reg, u32 *val)
 	return 0;
 }
 
+static int ina238_read_reg40(const struct i2c_client *client, u8 reg, u64 *val)
+{
+	u8 data[5];
+	u32 low;
+	int err;
+
+	/* 40-bit register read */
+	err = i2c_smbus_read_i2c_block_data(client, reg, 5, data);
+	if (err < 0)
+		return err;
+	if (err != 5)
+		return -EIO;
+	low = (data[1] << 24) | (data[2] << 16) | (data[3] << 8) | data[4];
+	*val = ((long long)data[0] << 32) | low;
+
+	return 0;
+}
+
 static int ina238_read_in(struct device *dev, u32 attr, int channel,
 			  long *val)
 {
@@ -197,10 +270,10 @@ static int ina238_read_in(struct device *dev, u32 attr, int channel,
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
@@ -225,8 +298,8 @@ static int ina238_write_in(struct device *dev, u32 attr, int channel,
 	case 0:
 		/* signed value, clamp to max range +/-163 mV */
 		regval = clamp_val(val, -163, 163);
-		regval = (regval * 1000 * (4 - data->gain + 1)) /
-			 INA238_SHUNT_VOLTAGE_LSB;
+		regval = (regval * 1000 * 4) /
+			 INA238_SHUNT_VOLTAGE_LSB * data->gain;
 		regval = clamp_val(regval, S16_MIN, S16_MAX);
 
 		switch (attr) {
@@ -242,7 +315,7 @@ static int ina238_write_in(struct device *dev, u32 attr, int channel,
 	case 1:
 		/* signed value, positive values only. Clamp to max 102.396 V */
 		regval = clamp_val(val, 0, 102396);
-		regval = (regval * 1000) / INA238_BUS_VOLTAGE_LSB;
+		regval = (regval * 1000) / data->config->bus_voltage_lsb;
 		regval = clamp_val(regval, 0, S16_MAX);
 
 		switch (attr) {
@@ -297,8 +370,19 @@ static int ina238_read_power(struct device *dev, u32 attr, long *val)
 			return err;
 
 		/* Fixed 1mA lsb, scaled by 1000000 to have result in uW */
-		power = div_u64(regval * 1000ULL * INA238_FIXED_SHUNT *
-				data->gain, 20 * data->rshunt);
+		power = div_u64(regval * data->config->power_calculate_factor * 50ULL *
+				INA238_FIXED_SHUNT * data->gain, 20 * data->rshunt);
+		/* Clamp value to maximum value of long */
+		*val = clamp_val(power, 0, LONG_MAX);
+		break;
+	case hwmon_power_input_highest:
+		err = ina238_read_reg24(data->client, SQ52206_POWER_PEAK, &regval);
+		if (err)
+			return err;
+
+		/* Fixed 1mA lsb, scaled by 1000000 to have result in uW */
+		power = div_u64(regval * data->config->power_calculate_factor * 50ULL *
+				INA238_FIXED_SHUNT * data->gain, 20 * data->rshunt);
 		/* Clamp value to maximum value of long */
 		*val = clamp_val(power, 0, LONG_MAX);
 		break;
@@ -311,8 +395,8 @@ static int ina238_read_power(struct device *dev, u32 attr, long *val)
 		 * Truncated 24-bit compare register, lower 8-bits are
 		 * truncated. Same conversion to/from uW as POWER register.
 		 */
-		power = div_u64((regval << 8) * 1000ULL * INA238_FIXED_SHUNT *
-			       data->gain, 20 * data->rshunt);
+		power = div_u64((regval << 8) * data->config->power_calculate_factor *
+		50ULL * INA238_FIXED_SHUNT * data->gain, 20 * data->rshunt);
 		/* Clamp value to maximum value of long */
 		*val = clamp_val(power, 0, LONG_MAX);
 		break;
@@ -344,8 +428,8 @@ static int ina238_write_power(struct device *dev, u32 attr, long val)
 	 * register.
 	 */
 	regval = clamp_val(val, 0, LONG_MAX);
-	regval = div_u64(val * 20ULL * data->rshunt,
-			 1000ULL * INA238_FIXED_SHUNT * data->gain);
+	regval = div_u64(val * data->config->power_calculate_factor * data->rshunt,
+			1000ULL * INA238_FIXED_SHUNT * data->gain);
 	regval = clamp_val(regval >> 8, 0, U16_MAX);
 
 	return regmap_write(data->regmap, INA238_POWER_LIMIT, regval);
@@ -362,17 +446,17 @@ static int ina238_read_temp(struct device *dev, u32 attr, long *val)
 		err = regmap_read(data->regmap, INA238_DIE_TEMP, &regval);
 		if (err)
 			return err;
-
-		/* Signed, bits 15-4 of register, result in mC */
-		*val = ((s16)regval >> 4) * INA238_DIE_TEMP_LSB;
+		/* Signed, result in mC */
+		*val = div_s64(((s16)regval >> data->config->temp_shift) *
+						data->config->temp_lsb, 10000);
 		break;
 	case hwmon_temp_max:
 		err = regmap_read(data->regmap, INA238_TEMP_LIMIT, &regval);
 		if (err)
 			return err;
-
-		/* Signed, bits 15-4 of register, result in mC */
-		*val = ((s16)regval >> 4) * INA238_DIE_TEMP_LSB;
+		/* Signed, result in mC */
+		*val = div_s64(((s16)regval >> data->config->temp_shift) *
+						data->config->temp_lsb, 10000);
 		break;
 	case hwmon_temp_max_alarm:
 		err = regmap_read(data->regmap, INA238_DIAG_ALERT, &regval);
@@ -396,13 +480,31 @@ static int ina238_write_temp(struct device *dev, u32 attr, long val)
 	if (attr != hwmon_temp_max)
 		return -EOPNOTSUPP;
 
-	/* Signed, bits 15-4 of register */
-	regval = (val / INA238_DIE_TEMP_LSB) << 4;
-	regval = clamp_val(regval, S16_MIN, S16_MAX) & 0xfff0;
+	/* Signed */
+	regval = div_u64(val*10000, data->config->temp_lsb) << data->config->temp_shift;
+	regval = clamp_val(regval, S16_MIN, S16_MAX) & (0xffff << data->config->temp_shift);
 
 	return regmap_write(data->regmap, INA238_TEMP_LIMIT, regval);
 }
 
+static ssize_t energy1_input_show(struct device *dev,
+				  struct device_attribute *da, char *buf)
+{
+	struct ina238_data *data = dev_get_drvdata(dev);
+	int ret;
+	u64 val;
+
+	ret = ina238_read_reg40(data->client, SQ52206_ENERGY, &val);
+	if (ret)
+		return ret;
+
+	/* result in microJoule */
+	val = div_u64(val * 96 * INA238_FIXED_SHUNT * data->gain,
+			       data->rshunt * 100);
+
+	return sprintf(buf, "%llu\n", val);
+}
+
 static int ina238_read(struct device *dev, enum hwmon_sensor_types type,
 		       u32 attr, int channel, long *val)
 {
@@ -452,6 +554,9 @@ static umode_t ina238_is_visible(const void *drvdata,
 				 enum hwmon_sensor_types type,
 				 u32 attr, int channel)
 {
+	const struct ina238_data *data = drvdata;
+	bool has_power_highest = data->config->has_power_highest;
+
 	switch (type) {
 	case hwmon_in:
 		switch (attr) {
@@ -479,6 +584,10 @@ static umode_t ina238_is_visible(const void *drvdata,
 			return 0444;
 		case hwmon_power_max:
 			return 0644;
+		case hwmon_power_input_highest:
+			if (has_power_highest)
+				return 0444;
+			break;
 		default:
 			return 0;
 		}
@@ -512,7 +621,8 @@ static const struct hwmon_channel_info * const ina238_info[] = {
 			   HWMON_C_INPUT),
 	HWMON_CHANNEL_INFO(power,
 			   /* 0: power */
-			   HWMON_P_INPUT | HWMON_P_MAX | HWMON_P_MAX_ALARM),
+			   HWMON_P_INPUT | HWMON_P_MAX |
+			   HWMON_P_MAX_ALARM | HWMON_P_INPUT_HIGHEST),
 	HWMON_CHANNEL_INFO(temp,
 			   /* 0: die temperature */
 			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_ALARM),
@@ -530,6 +640,15 @@ static const struct hwmon_chip_info ina238_chip_info = {
 	.info = ina238_info,
 };
 
+/* energy attributes are 5bytes wide so we need u64 */
+static DEVICE_ATTR_RO(energy1_input);
+
+static struct attribute *ina238_attrs[] = {
+	&dev_attr_energy1_input.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(ina238);
+
 static int ina238_probe(struct i2c_client *client)
 {
 	struct ina2xx_platform_data *pdata = dev_get_platdata(&client->dev);
@@ -537,13 +656,19 @@ static int ina238_probe(struct i2c_client *client)
 	struct device *hwmon_dev;
 	struct ina238_data *data;
 	int config;
+	enum ina238_ids chip;
 	int ret;
 
+	chip = (uintptr_t)i2c_get_match_data(client);
+
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
 	data->client = client;
+	/* set the device type */
+	data->config = &ina238_config[chip];
+
 	mutex_init(&data->config_lock);
 
 	data->regmap = devm_regmap_init_i2c(client, &ina238_regmap_config);
@@ -564,14 +689,19 @@ static int ina238_probe(struct i2c_client *client)
 	/* load shunt gain value */
 	if (device_property_read_u32(dev, "ti,shunt-gain", &data->gain) < 0)
 		data->gain = 4; /* Default of ADCRANGE = 0 */
-	if (data->gain != 1 && data->gain != 4) {
+	if (data->gain != 1 && data->gain != 2 && data->gain != 4) {
 		dev_err(dev, "invalid shunt gain value %u\n", data->gain);
 		return -EINVAL;
 	}
 
 	/* Setup CONFIG register */
-	config = INA238_CONFIG_DEFAULT;
-	if (data->gain == 1)
+	config = data->config->config_default;
+	if (chip == sq52206)
+		if (data->gain == 1)
+			config |= SQ52206_CONFIG_ADCRANGE_HIGH; /* ADCRANGE = 10/11 is /1 */
+		else if (data->gain == 2)
+			config |= SQ52206_CONFIG_ADCRANGE_LOW; /* ADCRANGE = 01 is /2 */
+	else if (data->gain == 1)
 		config |= INA238_CONFIG_ADCRANGE; /* ADCRANGE = 1 is /1 */
 	ret = regmap_write(data->regmap, INA238_CONFIG, config);
 	if (ret < 0) {
@@ -605,7 +735,8 @@ static int ina238_probe(struct i2c_client *client)
 
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
 							 &ina238_chip_info,
-							 NULL);
+							 data->config->has_energy ?
+								NULL : ina238_groups);
 	if (IS_ERR(hwmon_dev))
 		return PTR_ERR(hwmon_dev);
 
@@ -616,14 +747,26 @@ static int ina238_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ina238_id[] = {
-	{ "ina238" },
+	{ "ina237", ina237 },
+	{ "ina238", ina238 },
+	{ "sq52206", sq52206 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ina238_id);
 
 static const struct of_device_id __maybe_unused ina238_of_match[] = {
-	{ .compatible = "ti,ina237" },
-	{ .compatible = "ti,ina238" },
+	{
+		.compatible = "silergy,sq52206",
+		.data = (void *)sq52206
+	},
+	{
+		.compatible = "ti,ina237",
+		.data = (void *)ina237
+	},
+	{
+		.compatible = "ti,ina238",
+		.data = (void *)ina238
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, ina238_of_match);
-- 
2.43.0

