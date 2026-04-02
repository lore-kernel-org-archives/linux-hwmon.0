Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013CF3B894D;
	Thu,  2 Apr 2026 08:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117701; cv=none; b=KRXG9vu3uYzhPb/dwr8MwpNNNIZrHFA4puHlJpfHC1F9rQXjj6POah7Cv1D9ql7uHu6KDnxgI/P3B2CRa3EGDAEG3a9X5aX4Hf82/hahrk8MDSX3gqAJyYSBLue8td8JfP9cD7ejgzmc2DuwdtWsd9i0+xq0Aya6KUbHhi9F5Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117701; c=relaxed/simple;
	bh=NqkxFQppk3TF9YepZXIed859oxydqeNwi/jz/nyDSrI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=OcxsdAcp0tIZ2SD3D/V716lMeWIQMaD5pse4aHRQmn3IwXuViAL9OxeNtv7FJAqNwUhoqBS1gyLvr6mJlJ7pWd+EidDh4Evj5Xcmy3PrVuNgT7hZCoFGNfpDTJXXE59TWb2n8Z3slKKwh/MIdtaeiFNv/xezEgmSGMUREWaJctc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=D4/9YQSw; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="D4/9YQSw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=AgF5lCj2h/x1g2e
	RoPEDU5WDkzVm6dCe1oSWtwMFS3I=; b=D4/9YQSwDqT6j2MwoVnDsfFZM/l996k
	qZ6MKb8Cu9N0aZ2YsLETBp308YKdquC0u5MAeW1dqelZQQm4T1OlLa0j6q0k7EG/
	HZoM4oPSXrTw3lpLMJwQHm6KtgkXteyQByHmx6L94kG6ZwxoojKeFgogT2f6pSh+
	VxZ/7115QWFQ=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCX5UBEJc5pC9uuUw--.170S9;
	Thu, 02 Apr 2026 16:14:10 +0800 (CST)
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
Subject: [PATCH v7 7/8] hwmon: (ina3221) Support alert_limit_write function and write/read functions for 'power' attribute
Date: Thu,  2 Apr 2026 04:13:49 -0400
Message-Id: <20260402081350.65559-8-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260402081350.65559-1-wenliang202407@163.com>
References: <20260402081350.65559-1-wenliang202407@163.com>
X-CM-TRANSID:QCgvCgCX5UBEJc5pC9uuUw--.170S9
X-Coremail-Antispam: 1Uf129KBjvJXoW3JrWxtr4kKw1UCw13ZrykGrg_yoW3Wryxp3
	yxCa4rtr47tr1furs2kFs8G3WFvw4xXay2yr9rK3sava1UAF9Y9ryrta4vyFyUGr13ZF47
	Xay7AFy5uanrGFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUzGQDUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/xtbC5xNrP2nOJVO5-AAA30
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Each channel supports four new alert trigger modes, but only one trigger
mode can be active at any given time. Alert values are stored in the same
register. The sq52210_alert_limit_write function has been added to write
alert threshold values and configure alert source type.

SQ52210 adds power attributes to report power data and implements
corresponding read/write functions for this purpose. This includes
reading power values, reading alert thresholds, reading alert
trigger status, and writing alert thresholds.

Signed-off-by: Wenliang Yan <wenliang202407@163.com>
---
 drivers/hwmon/ina3221.c | 176 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 176 insertions(+)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index 06e42512a235..361d1be979e1 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -92,6 +92,9 @@ enum ina3221_fields {
 	/* Alert Flags: SF is the summation-alert flag */
 	F_SF, F_CF3, F_CF2, F_CF1,
 
+	/* Alert Flags: AFF is the alert function flag */
+	F_AFF3, F_AFF2, F_AFF1,
+
 	/* sentinel */
 	F_MAX_FIELDS
 };
@@ -107,6 +110,10 @@ static const struct reg_field ina3221_reg_fields[] = {
 	[F_CF3] = REG_FIELD(INA3221_MASK_ENABLE, 7, 7),
 	[F_CF2] = REG_FIELD(INA3221_MASK_ENABLE, 8, 8),
 	[F_CF1] = REG_FIELD(INA3221_MASK_ENABLE, 9, 9),
+
+	[F_AFF3] = REG_FIELD(SQ52210_ALERT_CONFIG, 1, 1),
+	[F_AFF2] = REG_FIELD(SQ52210_ALERT_CONFIG, 2, 2),
+	[F_AFF1] = REG_FIELD(SQ52210_ALERT_CONFIG, 3, 3),
 };
 
 enum ina3221_channels {
@@ -123,6 +130,18 @@ enum sq52210_alert_types {
 	SQ52210_ALERT_POL
 };
 
+static const u32 alert_groups[] = {
+	SQ52210_MASK_ALERT_CHANNEL1,
+	SQ52210_MASK_ALERT_CHANNEL2,
+	SQ52210_MASK_ALERT_CHANNEL3,
+};
+
+static const u8 limit_regs[] = {
+	SQ52210_ALERT_LIMIT1,
+	SQ52210_ALERT_LIMIT2,
+	SQ52210_ALERT_LIMIT3,
+};
+
 /**
  * struct ina3221_input - channel input source specific information
  * @label: label of channel input source
@@ -504,6 +523,145 @@ static int ina3221_read_curr(struct device *dev, u32 attr,
 	}
 }
 
+static const u8 ina3221_power_reg[][INA3221_NUM_CHANNELS] = {
+	[hwmon_power_input] = { SQ52210_POWER1, SQ52210_POWER2, SQ52210_POWER3 },
+	[hwmon_power_crit] = { SQ52210_ALERT_LIMIT1, SQ52210_ALERT_LIMIT2,
+						SQ52210_ALERT_LIMIT3 },
+	[hwmon_power_crit_alarm] = { F_AFF1, F_AFF2, F_AFF3 },
+};
+
+static int ina3221_read_power(struct device *dev, u32 attr, int channel, long *val)
+{
+	struct ina3221_data *ina = dev_get_drvdata(dev);
+	u8 reg = ina3221_power_reg[attr][channel];
+	int regval, ret;
+
+	switch (attr) {
+	case hwmon_power_input:
+		if (!ina3221_is_enabled(ina, channel))
+			return -ENODATA;
+
+		/* Write CONFIG register to trigger a single-shot measurement */
+		if (ina->single_shot) {
+			regmap_write(ina->regmap, INA3221_CONFIG,
+				     ina->reg_config);
+
+			ret = ina3221_wait_for_data(ina);
+			if (ret)
+				return ret;
+		}
+
+		fallthrough;
+	case hwmon_power_crit:
+		ret = ina3221_read_value(ina, reg, &regval);
+		if (ret)
+			return ret;
+		/* Return power in uW */
+		*val = (u64)regval * (u64)ina->power_lsb_uW;
+		return 0;
+	case hwmon_power_crit_alarm:
+		/* No actual register read if channel is disabled */
+		if (!ina3221_is_enabled(ina, channel)) {
+			/* Return 0 for alert flags */
+			*val = 0;
+			return 0;
+		}
+
+		ret = regmap_field_read(ina->fields[reg], &regval);
+		if (ret)
+			return ret;
+		*val = regval;
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int sq52210_alert_limit_write(struct ina3221_data *ina,
+			enum sq52210_alert_types type, int channel, long val)
+{
+	struct regmap *regmap = ina->regmap;
+	int item = channel % INA3221_NUM_CHANNELS;
+	u8 limit_reg;
+	u32 alert_group, alert_mask = 0;
+	int regval = 0;
+	int ret;
+
+	if (item >= ARRAY_SIZE(alert_groups) || (type == SQ52210_ALERT_POL && val < 0))
+		return -EINVAL;
+
+	alert_group = alert_groups[item];
+	limit_reg = limit_regs[item];
+
+	/* Clear alerts for this channel group first */
+	ret = regmap_update_bits(regmap, SQ52210_ALERT_CONFIG, alert_group, 0);
+	if (ret)
+		return ret;
+
+	/* Determine alert type and calculate register value */
+	switch (type) {
+	/*
+	 * The alert warning logic is implemented by comparing the limit register values
+	 * with the corresponding alert source register values. The shunt voltage and bus
+	 * voltage are 13-bit signed values, while power is a 16-bit unsigned value.
+	 * However, the lower 3 bits of the limit register default to 0. Therefore, when
+	 * setting warning values, the lower 3 bits will be forced to 0.
+	 * The conversion formulas for the corresponding register values are:
+	 *     bus_voltage: (regval / 8mV) << 3 == (regval / 1mV)
+	 *     shunt_voltage: (regval / 40uV) << 3 == (regval / 5uV)
+	 *     current: (regval / current_lsb) & 0xfff8
+	 *     power: (regval / current_lsb) & 0xfff8
+	 */
+	case SQ52210_ALERT_SUL:
+		/*
+		 * For SUL configuration, directly convert it to current
+		 * settings implemented in the ina3221_write_curr function.
+		 */
+		return -EOPNOTSUPP;
+	case SQ52210_ALERT_BOL:
+		/* BOL: Bus Over Limit - BIT(12), BIT(11), BIT(10) */
+		alert_mask = BIT(12 - item);
+		/* Bus Register, signed register */
+		regval = val & 0xfff8;
+		regval = clamp_val(regval, -32760, 32760);
+		break;
+	case SQ52210_ALERT_BUL:
+		/* BUL: Bus Under Limit - BIT(9), BIT(8), BIT(7) */
+		alert_mask = BIT(9 - item);
+		/* Bus Register, signed register */
+		regval = val & 0xfff8;
+		regval = clamp_val(regval, -32760, 32760);
+		break;
+	case SQ52210_ALERT_POL:
+		/* POL: Power Over Limit - BIT(6), BIT(5), BIT(4) */
+		alert_mask = BIT(6 - item);
+		/* Power Register, unsigned register */
+		regval = (u32)DIV_U64_ROUND_CLOSEST((u64)val, ina->power_lsb_uW);
+		regval = clamp_val(regval, 0, 65528) & 0xfff8;
+		break;
+	default:
+		/* For unsupported attributes, just clear the configuration */
+		ina->alert_type_select &= ~alert_group;
+		return -EOPNOTSUPP;
+	}
+
+	/* Write limit register value */
+	ret = regmap_write(regmap, limit_reg, regval);
+	if (ret)
+		return ret;
+
+	/* Update alert configuration if limit value is non-zero */
+	if (regval) {
+		ina->alert_type_select = (ina->alert_type_select & ~alert_group) | alert_mask;
+		ret = regmap_update_bits(regmap, SQ52210_ALERT_CONFIG,
+					alert_group, alert_mask);
+	} else {
+		ina->alert_type_select &= ~alert_group;
+	}
+
+	return ret;
+}
+
 static int ina3221_write_chip(struct device *dev, u32 attr, long val)
 {
 	struct ina3221_data *ina = dev_get_drvdata(dev);
@@ -640,6 +798,18 @@ static int ina3221_write_enable(struct device *dev, int channel, bool enable)
 	return ret;
 }
 
+static int ina3221_write_power(struct device *dev, u32 attr, int channel, long val)
+{
+	struct ina3221_data *ina = dev_get_drvdata(dev);
+
+	switch (attr) {
+	case hwmon_power_crit:
+		return sq52210_alert_limit_write(ina, SQ52210_ALERT_POL, channel, val);
+	default:
+		return 0;
+	}
+}
+
 static int ina3221_read(struct device *dev, enum hwmon_sensor_types type,
 			u32 attr, int channel, long *val)
 {
@@ -656,6 +826,9 @@ static int ina3221_read(struct device *dev, enum hwmon_sensor_types type,
 	case hwmon_curr:
 		ret = ina3221_read_curr(dev, attr, channel, val);
 		break;
+	case hwmon_power:
+		ret = ina3221_read_power(dev, attr, channel, val);
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
@@ -679,6 +852,9 @@ static int ina3221_write(struct device *dev, enum hwmon_sensor_types type,
 	case hwmon_curr:
 		ret = ina3221_write_curr(dev, attr, channel, val);
 		break;
+	case hwmon_power:
+		ret = ina3221_write_power(dev, attr, channel, val);
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
-- 
2.17.1

