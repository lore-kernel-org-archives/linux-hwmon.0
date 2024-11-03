Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F31ECAD2D;
	Sun,  3 Nov 2024 16:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730651986; cv=none; b=oVm3GgUzTbE4tkeFkOIs8tuTatzchfjp76venX33wOWx1zgZxyubnRcz5cAzX77Wq3C5u2ntlaPIFj32U8d+nSYHHSJAJBQXtmi4Re0ykQKzVS/aHAkdWChl4IVvc5rkN/3AhCzaAaIJ9bY1m5Qr/zeYBb/y6gzV9xYQb54p4us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730651986; c=relaxed/simple;
	bh=Js6qClh2+6fHOgTYmqRNmgSlzisFmVMm7d41Puztt50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NHt5rtD/Nd2owjRLBSh/eAPYRyGyKJaMjJqKwjsuYXX8KUJmtziMMC82VCdoRkryGor1C1+W+O3x6jTWdXpzOf3NaMPDi4OuSYiT6eUcP4/IwW79ELJ/88JjS8rh3AxrPCWtZKOLGPUcGSUPD3wvPtdYwzTvU52ULFrjCFdY0Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=KfZW1QMd; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="KfZW1QMd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=ktB+W
	weeX2/diaeWYZK5/zaAW2tLPaEetGJHXiQqYek=; b=KfZW1QMd9+7lCl1Tr918G
	ZMF4/xgFMVUUcT9eImeHRsK40kv6JPkhNlsYcy1fRLgl4rr3R3Vj+uyC32edjZZJ
	BbGIpBSpBpShBa1pzPJYSzz7ZWeCQjK4OdeWEnEqvV1duN/6gbPSh+br50UbNJ3q
	yTY+2/EbHV1ZjpGG9vj4Lc=
Received: from 100ask.localdomain (unknown [112.10.131.71])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDXX6gupydnXah8Ew--.35873S2;
	Mon, 04 Nov 2024 00:39:11 +0800 (CST)
From: Wenliang <wenliang202407@163.com>
To: linux@roeck-us.net
Cc: book <book@100ask.localdomain>,
	jdelvare@suse.com,
	corbet@lwn.net,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH linux dev-6.11 v3 1/2] hwmon: (ina226) Add support for SY24655
Date: Sun,  3 Nov 2024 11:39:07 -0500
Message-ID: <20241103163908.11890-1-wenliang202407@163.com>
X-Mailer: git-send-email 2.47.0.229.g8f8d6eee53
In-Reply-To: <706d4821-2637-4aac-869b-822f69aebbfa@roeck-us.net>
References: <706d4821-2637-4aac-869b-822f69aebbfa@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXX6gupydnXah8Ew--.35873S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Kr15Cr4UCFW5WrW3JFW8Zwb_yoWDCw43pr
	ZxG34ftrW8tFy3Xr4Dt3yUGr15Awn7ArW8Cr18G34ruFn8Aryvkr1Utr18tFWUGrykAF4U
	tFyktry8Cr1UJrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UQBMiUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbiNQ+M02cnoLAwsQAAs0

From: book <book@100ask.localdomain>

Signed-off-by: book <book@100ask.localdomain>
---

v3:Support the SY24655 for current and voltage detection as well as
power calculation.
SY24655 provides a power accumulator. Add support for the power1_average
attribute to report the average power. Add EIN register and
ACCUM_CONFIG register addresses for SY24655. Add a 48 bit read function
to meet the average power read.

 Documentation/hwmon/ina2xx.rst | 27 +++++++++-
 drivers/hwmon/Kconfig          |  2 +-
 drivers/hwmon/ina2xx.c         | 96 ++++++++++++++++++++++++++++++++--
 3 files changed, 118 insertions(+), 7 deletions(-)

diff --git a/Documentation/hwmon/ina2xx.rst b/Documentation/hwmon/ina2xx.rst
index 1ce161e6c0bf..a3860aae444c 100644
--- a/Documentation/hwmon/ina2xx.rst
+++ b/Documentation/hwmon/ina2xx.rst
@@ -63,6 +63,17 @@ Supported chips:
 
 	       https://www.ti.com/
 
+  * Silergy SY24655
+
+    Prefix: 'sy24655'
+
+    Addresses: I2C 0x40 - 0x4f
+
+    Datasheet: Publicly available at the Silergy website
+
+	       https://us1.silergy.com/
+
+
 Author: Lothar Felten <lothar.felten@gmail.com>
 
 Description
@@ -85,6 +96,11 @@ bus supply voltage.
 INA260 is a high or low side current and power monitor with integrated shunt
 resistor.
 
+The SY24655 is a high- and low-side current shunt and power monitor with an I2C
+interface. The SY24655 supports both shunt drop and supply voltage, with
+programmable calibration value and conversion times. The SY24655 can also
+calculate average power for use in energy conversion.
+
 The shunt value in micro-ohms can be set via platform data or device tree at
 compile-time or via the shunt_resistor attribute in sysfs at run-time. Please
 refer to the Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml for bindings
@@ -108,8 +124,8 @@ power1_input		Power(uW) measurement channel
 shunt_resistor		Shunt resistance(uOhm) channel (not for ina260)
 ======================= ===============================================
 
-Additional sysfs entries for ina226, ina230, ina231, and ina260
----------------------------------------------------------------
+Additional sysfs entries for ina226, ina230, ina231, ina260, and sy24655
+------------------------------------------------------------------------
 
 ======================= ====================================================
 curr1_lcrit		Critical low current
@@ -130,6 +146,13 @@ update_interval		data conversion time; affects number of samples used
 			to average results for shunt and bus voltages.
 ======================= ====================================================
 
+Sysfs entries for sy24655 only
+------------------------------
+
+======================= ====================================================
+power1_average		average power from last reading to the present.
+======================= ====================================================
+
 .. note::
 
    - Configure `shunt_resistor` before configure `power1_crit`, because power
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 85c34080a407..a55d9a88ce7d 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2178,7 +2178,7 @@ config SENSORS_INA2XX
 	select REGMAP_I2C
 	help
 	  If you say yes here you get support for INA219, INA220, INA226,
-	  INA230, INA231, and INA260 power monitor chips.
+	   INA230, INA231, INA260, and SY24655 power monitor chips.
 
 	  The INA2xx driver is configured for the default configuration of
 	  the part as described in the datasheet.
diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index cecc80a41a97..16fdbc0eb1f9 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -51,12 +51,19 @@
 #define INA226_ALERT_LIMIT		0x07
 #define INA226_DIE_ID			0xFF
 
-#define INA2XX_MAX_REGISTERS		8
+/* SY24655 register definitions */
+#define SY24655_EIN				0x0A
+#define SY24655_ACCUM_CONFIG	0x0D
+#define INA2XX_MAX_REGISTERS		0x0D
 
 /* settings - depend on use case */
 #define INA219_CONFIG_DEFAULT		0x399F	/* PGA=8 */
 #define INA226_CONFIG_DEFAULT		0x4527	/* averages=16 */
 #define INA260_CONFIG_DEFAULT		0x6527	/* averages=16 */
+#define SY24655_CONFIG_DEFAULT		0x4527	/* averages=16 */
+
+/* (only for sy24655) */
+#define SY24655_ACCUM_CONFIG_DEFAULT	0x044C	/* continuous mode, clear after read*/
 
 /* worst case is 68.10 ms (~14.6Hz, ina219) */
 #define INA2XX_CONVERSION_RATE		15
@@ -97,6 +104,7 @@ static bool ina2xx_writeable_reg(struct device *dev, unsigned int reg)
 	case INA2XX_CALIBRATION:
 	case INA226_MASK_ENABLE:
 	case INA226_ALERT_LIMIT:
+	case SY24655_ACCUM_CONFIG:
 		return true;
 	default:
 		return false;
@@ -127,12 +135,13 @@ static const struct regmap_config ina2xx_regmap_config = {
 	.writeable_reg = ina2xx_writeable_reg,
 };
 
-enum ina2xx_ids { ina219, ina226, ina260 };
+enum ina2xx_ids { ina219, ina226, ina260, sy24655 };
 
 struct ina2xx_config {
 	u16 config_default;
 	bool has_alerts;	/* chip supports alerts and limits */
 	bool has_ishunt;	/* chip has internal shunt resistor */
+	bool has_power_average;	/* chip has internal shunt resistor */
 	int calibration_value;
 	int shunt_div;
 	int bus_voltage_shift;
@@ -149,6 +158,7 @@ struct ina2xx_data {
 	long power_lsb_uW;
 	struct mutex config_lock;
 	struct regmap *regmap;
+	struct i2c_client *client;
 };
 
 static const struct ina2xx_config ina2xx_config[] = {
@@ -161,6 +171,7 @@ static const struct ina2xx_config ina2xx_config[] = {
 		.power_lsb_factor = 20,
 		.has_alerts = false,
 		.has_ishunt = false,
+		.has_power_average = false,
 	},
 	[ina226] = {
 		.config_default = INA226_CONFIG_DEFAULT,
@@ -171,6 +182,7 @@ static const struct ina2xx_config ina2xx_config[] = {
 		.power_lsb_factor = 25,
 		.has_alerts = true,
 		.has_ishunt = false,
+		.has_power_average = false,
 	},
 	[ina260] = {
 		.config_default = INA260_CONFIG_DEFAULT,
@@ -180,6 +192,18 @@ static const struct ina2xx_config ina2xx_config[] = {
 		.power_lsb_factor = 8,
 		.has_alerts = true,
 		.has_ishunt = true,
+		.has_power_average = false,
+	},
+	[sy24655] = {
+		.config_default = SY24655_CONFIG_DEFAULT,
+		.calibration_value = 4096,
+		.shunt_div = 400,
+		.bus_voltage_shift = 0,
+		.bus_voltage_lsb = 1250,
+		.power_lsb_factor = 25,
+		.has_alerts = true,
+		.has_ishunt = false,
+		.has_power_average = true,
 	},
 };
 
@@ -485,6 +509,42 @@ static int ina2xx_in_read(struct device *dev, u32 attr, int channel, long *val)
 	return 0;
 }
 
+/*
+ * Configuring the READ_EIN (bit 10) of the ACCUM_CONFIG register to 1
+ * can clear accumulator and sample_count after reading the EIN register.
+ * This way, the average power between the last read and the current
+ * read can be obtained. By combining with accurate time data from
+ * outside, the energy consumption during that period can be calculated.
+ */
+static int sy24655_average_power_read(struct ina2xx_data *data, u8 reg, long *val)
+{
+	u8 template[6];
+	int ret;
+	long accumulator_24, sample_count;
+	unsigned int regval;
+
+	/* 48-bit register read */
+	ret = i2c_smbus_read_i2c_block_data(data->client, reg, 6, template);
+	if (ret < 0)
+		return ret;
+	if (ret != 6)
+		return -EIO;
+	accumulator_24 = ((template[3] << 16) |
+				(template[4] << 8) |
+				template[5]);
+	sample_count = ((template[0] << 16) |
+				(template[1] << 8) |
+				template[2]);
+	if (sample_count <= 0) {
+		*val = 0;
+		return 0;
+	}
+
+	*val = DIV_ROUND_CLOSEST(accumulator_24, sample_count) * data->power_lsb_uW;
+
+	return 0;
+}
+
 static int ina2xx_power_read(struct device *dev, u32 attr, long *val)
 {
 	struct ina2xx_data *data = dev_get_drvdata(dev);
@@ -492,6 +552,8 @@ static int ina2xx_power_read(struct device *dev, u32 attr, long *val)
 	switch (attr) {
 	case hwmon_power_input:
 		return ina2xx_read_init(dev, INA2XX_POWER, val);
+	case hwmon_power_average:
+		return sy24655_average_power_read(data, SY24655_EIN, val);
 	case hwmon_power_crit:
 		return ina226_alert_limit_read(data, INA226_POWER_OVER_LIMIT_MASK,
 					       INA2XX_POWER, val);
@@ -651,6 +713,7 @@ static umode_t ina2xx_is_visible(const void *_data, enum hwmon_sensor_types type
 {
 	const struct ina2xx_data *data = _data;
 	bool has_alerts = data->config->has_alerts;
+	bool has_power_average = data->config->has_power_average;
 	enum ina2xx_ids chip = data->chip;
 
 	switch (type) {
@@ -668,6 +731,11 @@ static umode_t ina2xx_is_visible(const void *_data, enum hwmon_sensor_types type
 			if (has_alerts)
 				return 0444;
 			break;
+		case hwmon_power_average:
+			if (has_power_average)
+				return 0444;
+			break;
+			return 0444;
 		default:
 			break;
 		}
@@ -734,7 +802,8 @@ static const struct hwmon_channel_info * const ina2xx_info[] = {
 	HWMON_CHANNEL_INFO(curr, HWMON_C_INPUT | HWMON_C_CRIT | HWMON_C_CRIT_ALARM |
 			   HWMON_C_LCRIT | HWMON_C_LCRIT_ALARM),
 	HWMON_CHANNEL_INFO(power,
-			   HWMON_P_INPUT | HWMON_P_CRIT | HWMON_P_CRIT_ALARM),
+			   HWMON_P_INPUT | HWMON_P_CRIT | HWMON_P_CRIT_ALARM |
+			   HWMON_P_AVERAGE),
 	NULL
 };
 
@@ -839,6 +908,19 @@ static int ina2xx_init(struct device *dev, struct ina2xx_data *data)
 				   INA226_ALERT_LATCH_ENABLE |
 						FIELD_PREP(INA226_ALERT_POLARITY, active_high));
 	}
+	if (data->config->has_power_average) {
+		if (data->chip == sy24655) {
+			/*
+			 * Initialize the power accumulation method to continuous
+			 * mode and clear the EIN register after each read of the
+			 * EIN register
+			 */
+			ret = regmap_write(regmap, SY24655_ACCUM_CONFIG,
+					   SY24655_ACCUM_CONFIG_DEFAULT);
+			if (ret < 0)
+				return ret;
+		}
+	}
 
 	if (data->config->has_ishunt)
 		return 0;
@@ -868,6 +950,7 @@ static int ina2xx_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	/* set the device type */
+	data->client = client;
 	data->config = &ina2xx_config[chip];
 	data->chip = chip;
 	mutex_init(&data->config_lock);
@@ -906,6 +989,7 @@ static const struct i2c_device_id ina2xx_id[] = {
 	{ "ina230", ina226 },
 	{ "ina231", ina226 },
 	{ "ina260", ina260 },
+	{ "sy24655", sy24655 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ina2xx_id);
@@ -935,7 +1019,11 @@ static const struct of_device_id __maybe_unused ina2xx_of_match[] = {
 		.compatible = "ti,ina260",
 		.data = (void *)ina260
 	},
-	{ },
+	{
+		.compatible = "silergy,sy24655",
+		.data = (void *)sy24655
+	},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, ina2xx_of_match);
 
-- 
2.47.0.229.g8f8d6eee53

