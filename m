Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F62221638D;
	Mon, 19 Jan 2026 12:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768824965; cv=none; b=UmpLVOyETGSjZmY8cbtDROBHTGkdYVPGJC5fSbrVYF9fFCW4eYpPXHrltTNL/i2g4WYRiyzzKGVQWgr3i40VAHcE6dGxUgIJHiYuFSyGqThTsYp3S8Am7l/rZLZLluc2vJdwav6VJeWl1v1TvmYA4PM3H7E4WS8me8zDBsAMhmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768824965; c=relaxed/simple;
	bh=mAIfiFozDuAPomDjgXYFb/eMtPc4eQbfPQyMsKIFuxA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=iSy3d7Y7330nSiN9Cy0ZEZknk+ENatt14lV76hvXS+YAR15Rk0PXDqi66xaqMZgYrbeJoIcEcRPGEjnNR7TfXgbyfOpjXZYSl/IxuiJaERLURIZYw2s5K1RNz1OF9hGj+WOEzj2wuyRnxBOXdy9YfK4SX/LqKelOI7L/58M0vvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ppdS5Qxn; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ppdS5Qxn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=0XvcKCyFVn2QJUm
	C4vemsBCgTmQkcQiAIQ0pyYhwoRM=; b=ppdS5QxnnqDaylf69Ph5Pl2zE/Zjn/k
	15k4NinHwLhyOdP8L5NVQENb280Wijhm98rGA5zTmqeYvO07uy5X/enA7NJkDtLi
	x6k9FRR/d99VMg5Wgd5R1R5BzotNKwnoKla13dD4aSUwAlWoXgbkN+bSwAoSxc/+
	cx1b6o/MqiAE=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wBHtZdDIG5pljmWGw--.3726S8;
	Mon, 19 Jan 2026 20:15:12 +0800 (CST)
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
Subject: [PATCH v5 6/8] hwmon: (ina3221) Support for writing alert limit values and modify the 'ina3221_read_value' function
Date: Mon, 19 Jan 2026 07:14:44 -0500
Message-Id: <20260119121446.17469-7-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260119121446.17469-1-wenliang202407@163.com>
References: <20260119121446.17469-1-wenliang202407@163.com>
X-CM-TRANSID:_____wBHtZdDIG5pljmWGw--.3726S8
X-Coremail-Antispam: 1Uf129KBjvJXoW3JryUGw45tw17GF1DJrykAFb_yoWxKry5p3
	yfCF1rtr17tr4Svw4vkFs5WFyrAr1xW3y2vr9rK39ava1UJ3Wv9r1kta1Fyry5GFn3ZFsr
	X347AF1UCanrGaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0Jjn_-9UUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/xtbC6BAS5WluIFCpHQAA3M
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

SQ52210 adds power, current, and limit registers. The ina3221_read_value
function has been refactored to adapt to the new register data reading
format.

Each channel supports four new alert trigger modes, but only one trigger
mode can be active at any given time. Alert values are stored in the same
register. The sq52210_alert_limit_write function has been added to write
alert threshold values and configure alert source type.

Signed-off-by: Wenliang Yan <wenliang202407@163.com>
---
 drivers/hwmon/ina3221.c | 163 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 160 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index 4b2888be0ae2..cb292fee564b 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -66,6 +66,14 @@
 #define INA3221_MASK_ENABLE_SCC_MASK	GENMASK(14, 12)
 
 #define SQ52210_ALERT_CONFIG_MASK	GENMASK(15, 4)
+#define SQ52210_MASK_ALERT_CHANNEL1 (BIT(15) | BIT(12) | BIT(9) | BIT(6))
+#define SQ52210_MASK_ALERT_CHANNEL2 (BIT(14) | BIT(11) | BIT(8) | BIT(5))
+#define SQ52210_MASK_ALERT_CHANNEL3 (BIT(13) | BIT(10) | BIT(7) | BIT(4))
+
+#define SQ52210_ALERT_ALL_SUL_MASK	(BIT(15) | BIT(14) | BIT(13))
+#define SQ52210_ALERT_ALL_BOL_MASK	(BIT(12) | BIT(11) | BIT(10))
+#define SQ52210_ALERT_ALL_BUL_MASK	(BIT(9) | BIT(8) | BIT(7))
+#define SQ52210_ALERT_ALL_POL_MASK	(BIT(6) | BIT(5) | BIT(4))
 
 #define INA3221_CONFIG_DEFAULT		0x7127
 #define INA3221_RSHUNT_DEFAULT		10000
@@ -108,6 +116,13 @@ enum ina3221_channels {
 	INA3221_NUM_CHANNELS
 };
 
+enum sq52210_alert_types {
+	SQ52210_ALERT_SUL,
+	SQ52210_ALERT_BOL,
+	SQ52210_ALERT_BUL,
+	SQ52210_ALERT_POL
+};
+
 /**
  * struct ina3221_input - channel input source specific information
  * @label: label of channel input source
@@ -272,6 +287,18 @@ static inline int ina3221_wait_for_data(struct ina3221_data *ina)
 					      cvrf, cvrf, wait, wait * 2);
 }
 
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
 static int ina3221_read_value(struct ina3221_data *ina, unsigned int reg,
 			      int *val)
 {
@@ -284,13 +311,55 @@ static int ina3221_read_value(struct ina3221_data *ina, unsigned int reg,
 
 	/*
 	 * Shunt Voltage Sum register has 14-bit value with 1-bit shift
+	 * Current registers have 15-bit value
+	 * Power registers have 16-bit value
+	 * ALERT_LIMIT registers have 16-bit value with 3-bit shift
 	 * Other Shunt Voltage registers have 12 bits with 3-bit shift
 	 */
-	if (reg == INA3221_SHUNT_SUM || reg == INA3221_CRIT_SUM)
+	switch (reg) {
+	case INA3221_SHUNT_SUM:
+	case INA3221_CRIT_SUM:
 		*val = sign_extend32(regval >> 1, 14);
-	else
+		break;
+	case SQ52210_CURRENT1:
+	case SQ52210_CURRENT2:
+	case SQ52210_CURRENT3:
+		*val = sign_extend32(regval, 15);
+		break;
+	case SQ52210_POWER1:
+	case SQ52210_POWER2:
+	case SQ52210_POWER3:
+		*val = regval;
+		break;
+	case INA3221_BUS1:
+	case INA3221_BUS2:
+	case INA3221_BUS3:
+	case INA3221_SHUNT1:
+	case INA3221_SHUNT2:
+	case INA3221_SHUNT3:
+	case INA3221_WARN1:
+	case INA3221_WARN2:
+	case INA3221_WARN3:
+	case INA3221_CRIT1:
+	case INA3221_CRIT2:
+	case INA3221_CRIT3:
 		*val = sign_extend32(regval >> 3, 12);
-
+		break;
+	case SQ52210_ALERT_LIMIT1:
+	case SQ52210_ALERT_LIMIT2:
+	case SQ52210_ALERT_LIMIT3:
+		if (ina->alert_type_select & SQ52210_ALERT_ALL_SUL_MASK)
+			*val = sign_extend32(regval, 15);
+		else if (ina->alert_type_select & (SQ52210_ALERT_ALL_BOL_MASK
+					| SQ52210_ALERT_ALL_BUL_MASK))
+			*val = regval >> 3;
+		else if (ina->alert_type_select & SQ52210_ALERT_ALL_POL_MASK)
+			*val = regval;
+		break;
+	default:
+		*val = 0;
+		return -EOPNOTSUPP;
+	};
 	return 0;
 }
 
@@ -443,6 +512,94 @@ static int ina3221_read_curr(struct device *dev, u32 attr,
 	}
 }
 
+static int sq52210_alert_limit_write(struct ina3221_data *ina,
+			enum sq52210_alert_types type, int channel, long val)
+{
+	struct regmap *regmap = ina->regmap;
+	int item = channel % INA3221_NUM_CHANNELS;
+	u8 limit_reg;
+	u32 alert_group, alert_mask = 0;
+	int regval = 0;
+	int ret;
+	u64 power_uW;
+
+	if (item >= ARRAY_SIZE(alert_groups) || ((type == SQ52210_ALERT_POL) && val < 0))
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
+		/* SUL: Shunt Under Limit - BIT(15), BIT(14), BIT(13) */
+		alert_mask = BIT(15 - item);
+		/* Shunt Register, signed register */
+		regval = DIV_ROUND_CLOSEST(val, 5) & 0xfff8;
+		regval = clamp_val(regval, -32760, 32760);
+		break;
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
+		/* Power Register, unsigned register, result in mW */
+		power_uW = (u64)val * 1000ULL;
+		regval = (u32)DIV_U64_ROUND_CLOSEST(power_uW, ina->power_lsb_uW);
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
-- 
2.17.1

