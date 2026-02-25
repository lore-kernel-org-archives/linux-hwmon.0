Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0F83624C8;
	Wed, 25 Feb 2026 09:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772010265; cv=none; b=Q4VxQouKyYKNWf7qfiX5jT1pRQZVRj4SQbSG8BV9Nxl9fw6JOLGr6OR5x40ZJeFKsLwqrZF7MO1xSsCmOkG/xs4UFOOnLTLZsK+usU5Y1E00WdY4HdNnoaoqCtKZUVssQih+/bEtS9mvMl36drWchsRSxuLVGZx+dzLWvpN0qD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772010265; c=relaxed/simple;
	bh=Gt75cHT6L5cWi+x7dEuEj42L4ZWqSz69H0wXJAxT940=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=d9QhlF5m++cDlDttbtGCdQu2dQld6MTVZiJfANejV8bic8FRtVyPk0FXuDcqTDOmBirs8brDk8R+yFvAWem+Y3v4EJIDcgq9sHqRs9MGhVBcWcLMau71qvLiB2BTuSv3enxjJxbIQdHhMxKJZMO85E1+CHEYJjP6S9cRLx6mw1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=RuXe0sxu; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="RuXe0sxu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=Ifg6aglyA5pgVBE
	3C7J7/qZP05v0Bp5pksaS0RkFfIk=; b=RuXe0sxud9mWaLcAg5gx9TyIpDMN6Vm
	nzgixAGNCVkNsBcd8AtCV9/klzvf57ctJGM49TKI0aRaV6LsLXktFfUvu5d2+RLy
	MSE7a1dcPGMoA8/spfiy/90FUWP0MhMCKx/tT3jc6zu3oTg8nf3WYaxEVz9kkq9G
	aTSgewqhdu6Q=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3N4nlup5pilgzMg--.30498S10;
	Wed, 25 Feb 2026 17:03:45 +0800 (CST)
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
Subject: [PATCH v6 8/8] hwmon: (ina3221) Modify write/read functions for 'in' and 'curr' attribute
Date: Wed, 25 Feb 2026 04:03:24 -0500
Message-Id: <20260225090324.112145-9-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260225090324.112145-1-wenliang202407@163.com>
References: <20260225090324.112145-1-wenliang202407@163.com>
X-CM-TRANSID:_____wD3N4nlup5pilgzMg--.30498S10
X-Coremail-Antispam: 1Uf129KBjvJXoW3Gr4UWFW7tryxXr4ruFWxWFg_yoWxWw1fp3
	y5CFWrtrWjq3WSgrWIkFs8WFn8trWxW3y2yryDK39YvF4UAr909F95G3Wq9a45Cr93XF4x
	J3y7trWUua1DtFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUXeOdUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/xtbC5xLswGmeuvIyLgAA36
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Modified the relevant read/write functions for 'in' and 'curr' attributes,
adding support for crit, lcrit, crit_alarm, and lcrit_alarm features.

Signed-off-by: Wenliang Yan <wenliang202407@163.com>
---
 drivers/hwmon/ina3221.c | 109 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 102 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index f32f0f18e9b8..bb01a698ebe6 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -142,6 +142,12 @@ static const u8 limit_regs[] = {
 	SQ52210_ALERT_LIMIT3,
 };
 
+static const u8 alert_flag[] = {
+	F_AFF1,
+	F_AFF2,
+	F_AFF3,
+};
+
 /**
  * struct ina3221_input - channel input source specific information
  * @label: label of channel input source
@@ -446,6 +452,42 @@ static int ina3221_read_in(struct device *dev, u32 attr, int channel, long *val)
 	case hwmon_in_enable:
 		*val = ina3221_is_enabled(ina, channel);
 		return 0;
+	case hwmon_in_crit:
+	case hwmon_in_lcrit:
+		/* Only for Bus Voltage */
+		if (channel >= INA3221_NUM_CHANNELS)
+			return -EOPNOTSUPP;
+
+		if (!ina3221_is_enabled(ina, channel))
+			return -ENODATA;
+
+		reg = limit_regs[channel];
+		ret = ina3221_read_value(ina, reg, &regval);
+		if (ret)
+			return ret;
+		/*
+		 * Scale of bus voltage (mV): LSB is 8mV
+		 */
+		*val = regval * 8;
+		return 0;
+	case hwmon_in_crit_alarm:
+	case hwmon_in_lcrit_alarm:
+		/* Only for Bus Voltage */
+		if (channel >= INA3221_NUM_CHANNELS)
+			return -EOPNOTSUPP;
+		/* No actual register read if channel is disabled */
+		if (!ina3221_is_enabled(ina, channel)) {
+			/* Return 0 for alert flags */
+			*val = 0;
+			return 0;
+		}
+
+		reg = alert_flag[channel];
+		ret = regmap_field_read(ina->fields[reg], &regval);
+		if (ret)
+			return ret;
+		*val = regval;
+		return 0;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -457,8 +499,16 @@ static const u8 ina3221_curr_reg[][INA3221_NUM_CHANNELS + 1] = {
 	[hwmon_curr_max] = { INA3221_WARN1, INA3221_WARN2, INA3221_WARN3, 0 },
 	[hwmon_curr_crit] = { INA3221_CRIT1, INA3221_CRIT2,
 			      INA3221_CRIT3, INA3221_CRIT_SUM },
+	[hwmon_curr_lcrit] = { SQ52210_ALERT_LIMIT1, SQ52210_ALERT_LIMIT2,
+			      SQ52210_ALERT_LIMIT3, 0 },
 	[hwmon_curr_max_alarm] = { F_WF1, F_WF2, F_WF3, 0 },
 	[hwmon_curr_crit_alarm] = { F_CF1, F_CF2, F_CF3, F_SF },
+	[hwmon_curr_lcrit_alarm] = { F_AFF1, F_AFF2, F_AFF3, 0 },
+};
+static const u8 sq52210_curr_reg[INA3221_NUM_CHANNELS] = {
+	SQ52210_CURRENT1,
+	SQ52210_CURRENT2,
+	SQ52210_CURRENT3
 };
 
 static int ina3221_read_curr(struct device *dev, u32 attr,
@@ -467,6 +517,7 @@ static int ina3221_read_curr(struct device *dev, u32 attr,
 	struct ina3221_data *ina = dev_get_drvdata(dev);
 	struct ina3221_input *input = ina->inputs;
 	u8 reg = ina3221_curr_reg[attr][channel];
+	bool has_current_reg = ina->config->has_current_reg;
 	int resistance_uo, voltage_nv;
 	int regval, ret;
 
@@ -489,10 +540,20 @@ static int ina3221_read_curr(struct device *dev, u32 attr,
 			if (ret)
 				return ret;
 		}
+		if (has_current_reg == true) {
+			reg = sq52210_curr_reg[channel];
+			ret = ina3221_read_value(ina, reg, &regval);
+			if (ret)
+				return ret;
+			/* Return current in mA */
+			*val = DIV_U64_ROUND_CLOSEST((u64)regval * (u64)ina->current_lsb_uA, 1000);
+			return 0;
+		}
 
 		fallthrough;
 	case hwmon_curr_crit:
 	case hwmon_curr_max:
+	case hwmon_curr_lcrit:
 		if (!resistance_uo)
 			return -ENODATA;
 
@@ -507,6 +568,7 @@ static int ina3221_read_curr(struct device *dev, u32 attr,
 		return 0;
 	case hwmon_curr_crit_alarm:
 	case hwmon_curr_max_alarm:
+	case hwmon_curr_lcrit_alarm:
 		/* No actual register read if channel is disabled */
 		if (!ina3221_is_enabled(ina, channel)) {
 			/* Return 0 for alert flags */
@@ -617,7 +679,9 @@ static int sq52210_alert_limit_write(struct ina3221_data *ina,
 		 * For SUL configuration, directly convert it to current
 		 * settings implemented in the ina3221_write_curr function.
 		 */
-		return -EOPNOTSUPP;
+		alert_mask = BIT(15 - channel);
+		regval = val;
+		break;
 	case SQ52210_ALERT_BOL:
 		/* BOL: Bus Over Limit - BIT(12), BIT(11), BIT(10) */
 		alert_mask = BIT(12 - item);
@@ -711,12 +775,18 @@ static int ina3221_write_curr(struct device *dev, u32 attr,
 	struct ina3221_input *input = ina->inputs;
 	u8 reg = ina3221_curr_reg[attr][channel];
 	int resistance_uo, current_ma, voltage_uv;
-	int regval;
+	int regval, ret;
 
-	if (channel > INA3221_CHANNEL3)
-		resistance_uo = ina->summation_shunt_resistor;
-	else
+	if (attr == hwmon_curr_lcrit) {
+		if (channel > INA3221_CHANNEL3)
+			return -EOPNOTSUPP;
 		resistance_uo = input[channel].shunt_resistor;
+	} else {
+		if (channel > INA3221_CHANNEL3)
+			resistance_uo = ina->summation_shunt_resistor;
+		else
+			resistance_uo = input[channel].shunt_resistor;
+	}
 
 	if (!resistance_uo)
 		return -EOPNOTSUPP;
@@ -747,7 +817,12 @@ static int ina3221_write_curr(struct device *dev, u32 attr,
 	else
 		regval = DIV_ROUND_CLOSEST(voltage_uv, 5) & 0xfff8;
 
-	return regmap_write(ina->regmap, reg, regval);
+	if (attr == hwmon_curr_lcrit)
+		ret = sq52210_alert_limit_write(ina, SQ52210_ALERT_SUL, channel, regval);
+	else
+		ret = regmap_write(ina->regmap, reg, regval);
+
+	return ret;
 }
 
 static int ina3221_write_enable(struct device *dev, int channel, bool enable)
@@ -798,6 +873,26 @@ static int ina3221_write_enable(struct device *dev, int channel, bool enable)
 	return ret;
 }
 
+static int ina3221_write_in(struct device *dev, u32 attr, int channel, long val)
+{
+	struct ina3221_data *ina = dev_get_drvdata(dev);
+
+	if (attr == hwmon_in_lcrit || attr == hwmon_in_crit)
+		if (channel >= INA3221_NUM_CHANNELS)
+			return -EOPNOTSUPP;
+
+	switch (attr) {
+	case hwmon_in_lcrit:
+		return sq52210_alert_limit_write(ina, SQ52210_ALERT_BUL, channel, val);
+	case hwmon_in_crit:
+		return sq52210_alert_limit_write(ina, SQ52210_ALERT_BOL, channel, val);
+	case hwmon_in_enable:
+		return ina3221_write_enable(dev, channel, val);
+	default:
+		return 0;
+	}
+}
+
 static int ina3221_write_power(struct device *dev, u32 attr, int channel, long val)
 {
 	struct ina3221_data *ina = dev_get_drvdata(dev);
@@ -847,7 +942,7 @@ static int ina3221_write(struct device *dev, enum hwmon_sensor_types type,
 		break;
 	case hwmon_in:
 		/* 0-align channel ID */
-		ret = ina3221_write_enable(dev, channel - 1, val);
+		ret = ina3221_write_in(dev, attr, channel - 1, val);
 		break;
 	case hwmon_curr:
 		ret = ina3221_write_curr(dev, attr, channel, val);
-- 
2.17.1

