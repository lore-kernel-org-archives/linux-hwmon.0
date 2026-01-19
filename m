Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF381F5437;
	Mon, 19 Jan 2026 12:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768824953; cv=none; b=i8Vs5gNBexC2eg+6G06lCxis3eaK7lcbP4BJ4jJtx6scfWV/mh5eDx7mwYVgkm54lFW+Y6YikKx6S3VGIK/yZQtn1KnUo3Ua5Lovkd17pDrCvMejS307a0TirS8Tf2KGt0F7VHwmFh1qso/So6FoUS7pHLP/dz0KKWUxmyYVcW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768824953; c=relaxed/simple;
	bh=z6dbCNUriStuBV+KYYiPiE7y9WQMfgpr2xtzjWwHan8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=QXV435N4lQ9uzfUFdEB+eRH1em+xdli/jJrDHZ1O8cxwDyMLQqMBVfwDKW5OhsprubLqHk7caWjKOPFOBUSywNlVXPB34BBICFq34oCs905iVfwofupjNRBscm59nZ3HMtu0bIPI+/2jA94mlcSzW0A1Gf454b6/fp4zrWMKZSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=CQllNtJH; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="CQllNtJH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=WuEHeMrivFoEujO
	cr/xi2G/pphMy6vZiBBA1L4Xwt4w=; b=CQllNtJHER3T4cJ9sdMuvSpcpsLs2l3
	jNOOlj5ZEXUm4GZcmHs1qHo9HoGEQib5IEPOF2E6PYktnAcPRcmAaH7TOKbJBEcy
	qYl0GIfmbQv08sEWM7vwxwXFRmouBAFHlaT1LAtyfePSEaSR/lf/SHcMxItBa/fB
	wVGSxkcGzrss=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wBHtZdDIG5pljmWGw--.3726S5;
	Mon, 19 Jan 2026 20:15:05 +0800 (CST)
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
Subject: [PATCH v5 3/8] hwmon: (ina3221) Pre-calculate current and power LSB
Date: Mon, 19 Jan 2026 07:14:41 -0500
Message-Id: <20260119121446.17469-4-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260119121446.17469-1-wenliang202407@163.com>
References: <20260119121446.17469-1-wenliang202407@163.com>
X-CM-TRANSID:_____wBHtZdDIG5pljmWGw--.3726S5
X-Coremail-Antispam: 1Uf129KBjvJXoW3JryUAFy5JF4rtw4kAw13urg_yoW7Xry3pF
	4fKryrta40qF1fKa9Ikw4xGF1rtr97Jr47KrZrGw1IqFsFkryqk3yrJFyDtFy5Ary5ZF17
	X3y7tr4Duws2yaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRFD73UUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/xtbCwAoQ42luIEqtfgAA3H
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
index 47ef4fe694ea..b5fa984a5a25 100644
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
+	bool has_current;	/* chip has internal current reg */
+	bool has_power;		/* chip has internal power reg */
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
+		.has_current = false,
+		.has_power = false,
+	},
+	[sq52210] = {
+		.has_current = true,
+		.has_power = true,
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
+		if (ina->config->has_current) {
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
+		if (ina->config->has_current) {
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

