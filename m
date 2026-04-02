Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB0D32ED24;
	Thu,  2 Apr 2026 08:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117692; cv=none; b=qQsh6bFLlFF6luqdOhvmt5beBI77/RZiVsgESoXAc+qauGYCzgrBbUujvdG/3yS5fFURKks4k4yffqpAovxwTbB9jRtxVqDfOkjv42/hRIwAidZLGltNn96TcSEsrn+wbu6mfLk38f4TR65erlvUY7Czuq9wV15CsWrbJkubazo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117692; c=relaxed/simple;
	bh=dUkkZHYey7BZzpb0fTIQid8SBjXfkS8TzA9BdhO8tFY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Mc9Rr1M8pi8y7WxJjz4JMcFziKh5OG0gmX4DYnrTL8bzwu08ECqA0chX/aMQtju9ekfk4OC/EukvbHFuh2gMUypRveuexKyZ1AIWrzksLCXC5SnPUYWzKo3k5UbhRtQrmEuknwlbfJPDJKbbbXTyXkn0CZUmI3hAcsWzp72sPC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=OZ/PyqNx; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="OZ/PyqNx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=+v5Xg+kWjmKbK5f
	EihGrPO5x4iH9HqOpoWxZg+Vd674=; b=OZ/PyqNx93ikLYWnP2WAHx1kbf9ZyFg
	TQEyMH/+kr5JhxtQSOWwyilLJfxL34+0p8Io72x9VYezB9Inz3hSQ+w41MN3bw8G
	0AldHEQoqRWW5DklZxHR7YauS3M7V15Af/xVurR6NQcuCynqDYHZxKbGr+GNpu8s
	3ZVdV6zHsnoM=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCX5UBEJc5pC9uuUw--.170S5;
	Thu, 02 Apr 2026 16:14:04 +0800 (CST)
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
Subject: [PATCH v7 3/8] hwmon: (ina3221) Pre-calculate current and power LSB
Date: Thu,  2 Apr 2026 04:13:45 -0400
Message-Id: <20260402081350.65559-4-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260402081350.65559-1-wenliang202407@163.com>
References: <20260402081350.65559-1-wenliang202407@163.com>
X-CM-TRANSID:QCgvCgCX5UBEJc5pC9uuUw--.170S5
X-Coremail-Antispam: 1Uf129KBjvJXoW3Jr4kGF47WrW3Jw1kur1fCrg_yoW7XF4DpF
	4rKr1rta40q3WfKa9Ikw4xGF1rtr97Jr42krZrWw1IqFsFkryqk3yrJFyDtFy5Ar15ZF13
	X3y7tr4Duan2yaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRYLvtUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/xtbCvwxqPmnOJUwfBQAA3z
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

The LSB for current and power can be pre-calculated for data read/write
operations. The current LSB is determined by the calibration value and
shunt resistor value, with the calibration value fixed within the driver.
The power LSB can be derived from the current LSB.

Signed-off-by: Wenliang Yan <wenliang202407@163.com>
---
 drivers/hwmon/ina3221.c | 85 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index 47ef4fe694ea..e99ac5ef4d8a 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -67,6 +67,7 @@
 
 #define INA3221_CONFIG_DEFAULT		0x7127
 #define INA3221_RSHUNT_DEFAULT		10000
+#define SQ52210_SHUNT_LSB			40000000	/* pV/LSB */
 
 enum ina3221_fields {
 	/* Configuration */
@@ -121,8 +122,16 @@ struct ina3221_input {
 
 enum ina3221_ids { ina3221, sq52210 };
 
+struct ina3221_config {
+	bool has_current_reg;	/* chip has internal current reg */
+	bool has_power_reg;		/* chip has internal power reg */
+	int calibration_value;	/* calculate current_lsb */
+	int power_lsb_factor;
+};
+
 /**
  * struct ina3221_data - device specific information
+ * @config:	Used to store characteristics of different chips
  * @chip: Chip type identifier
  * @pm_dev: Device pointer for pm runtime
  * @regmap: Register map of the device
@@ -131,9 +140,12 @@ enum ina3221_ids { ina3221, sq52210 };
  * @reg_config: Register value of INA3221_CONFIG
  * @summation_shunt_resistor: equivalent shunt resistor value for summation
  * @summation_channel_control: Value written to SCC field in INA3221_MASK_ENABLE
+ * @current_lsb_uA: The value of one LSB corresponding to the current register
+ * @power_lsb_uW: The value of one LSB corresponding to the power register
  * @single_shot: running in single-shot operating mode
  */
 struct ina3221_data {
+	const struct ina3221_config *config;
 	enum ina3221_ids chip;
 
 	struct device *pm_dev;
@@ -143,10 +155,30 @@ struct ina3221_data {
 	u32 reg_config;
 	int summation_shunt_resistor;
 	u32 summation_channel_control;
+	long current_lsb_uA;
+	long power_lsb_uW;
 
 	bool single_shot;
 };
 
+static const struct ina3221_config ina3221_config[] = {
+	[ina3221] = {
+		.has_current_reg = false,
+		.has_power_reg = false,
+	},
+	[sq52210] = {
+		.has_current_reg = true,
+		.has_power_reg = true,
+		/*
+		 * With this default value configuration,
+		 * the following formula can be obtained:
+		 * Current_LSB = Shunt_LSB / Rshunt
+		 */
+		.calibration_value = 256,
+		.power_lsb_factor = 20,
+	},
+};
+
 static inline bool ina3221_is_enabled(struct ina3221_data *ina, int channel)
 {
 	/* Summation channel checks shunt resistor values */
@@ -697,6 +729,25 @@ static const struct hwmon_chip_info ina3221_chip_info = {
 };
 
 /* Extra attribute groups */
+
+/*
+ * Calculate the value corresponding to one LSB of the current and
+ * power registers.
+ * formula : Current_LSB = Shunt_LSB / Rshunt
+ *           Power_LSB = power_lsb_factor * Current_LSB
+ */
+static int ina3221_set_shunt(struct ina3221_data *ina, unsigned long val)
+{
+	if (!val || val > SQ52210_SHUNT_LSB)
+		return -EINVAL;
+
+	ina->current_lsb_uA = DIV_ROUND_CLOSEST(SQ52210_SHUNT_LSB, val);
+	ina->power_lsb_uW = ina->config->power_lsb_factor *
+			    ina->current_lsb_uA;
+
+	return 0;
+}
+
 static ssize_t ina3221_shunt_show(struct device *dev,
 				  struct device_attribute *attr, char *buf)
 {
@@ -730,6 +781,17 @@ static ssize_t ina3221_shunt_store(struct device *dev,
 	/* Update summation_shunt_resistor for summation channel */
 	ina->summation_shunt_resistor = ina3221_summation_shunt_resistor(ina);
 
+	/*
+	 * The current and power registers can only be used when
+	 * all enabled channels have identical shunt resistors
+	 */
+	if (ina->summation_shunt_resistor) {
+		if (ina->config->has_current_reg) {
+			ret = ina3221_set_shunt(ina, val);
+			if (ret < 0)
+				return ret;
+		}
+	}
 	return count;
 }
 
@@ -846,6 +908,7 @@ static int ina3221_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	ina->chip = chip;
+	ina->config = &ina3221_config[chip];
 
 	ina->regmap = devm_regmap_init_i2c(client, &ina3221_regmap_config);
 	if (IS_ERR(ina->regmap)) {
@@ -892,6 +955,16 @@ static int ina3221_probe(struct i2c_client *client)
 			ina->summation_channel_control |= BIT(14 - i);
 	}
 
+	/*
+	 * The current and power registers can only be used when
+	 * all enabled channels have identical shunt resistors
+	 */
+	if (ina->summation_shunt_resistor) {
+		ret = ina3221_set_shunt(ina, ina->summation_shunt_resistor);
+		if (ret < 0)
+			return ret;
+	}
+
 	ina->pm_dev = dev;
 	dev_set_drvdata(dev, ina);
 
@@ -1009,6 +1082,18 @@ static int ina3221_resume(struct device *dev)
 			dev_err(dev, "Unable to control summation channel\n");
 			return ret;
 		}
+		/*
+		 * The calibration register can only be enabled when all
+		 * shunt resistor values are identical.
+		 */
+		if (ina->config->has_current_reg) {
+			ret = regmap_write(ina->regmap, SQ52210_CALIBRATION,
+						ina->config->calibration_value);
+			if (ret) {
+				dev_err(dev, "Unable to set calibration value\n");
+				return ret;
+			}
+		}
 	}
 
 	return 0;
-- 
2.17.1

