Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAB323EA96;
	Tue, 18 Nov 2025 12:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763470417; cv=none; b=HX2m328hn9Wa9XS1QVZYdcLloT/4yId2IvDAOFKutg2V35y3ZEjo2F2ErXs3tSJJe0k1XZ+PXiGrPUvrFKmoRbbAFR3ayP7QVsADY3BJpHTctiTtoH4qhZfMODYbv4uEX3Mv1DWq9Mh5Dyzyi+Ew+y3VFj1qLZLpf5+3V8JPnwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763470417; c=relaxed/simple;
	bh=tROLsi+cdIltw4Fkt5nT3V9nSQcfZGxxFkYHr2m2QFI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=iYBaO4QjMZlSZKHeZgTDbU9apwe6MG+8KUn67Tkz9P47H8Kr7r//UoK/9gxvCfyDW05pkOjFBcwjyg70yw+LySoCok00rlXueMvKK6CPudvGIPrv7IPiagDLFMPDnpbOpsQpo8MdjrAZPal3ae4ObO51bDjusGjGZGxDL5QSniM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Rf9OQW9c; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Rf9OQW9c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=kbvn73TZ4ab7ipf
	A4ba5VfADFcsSSdv0JCxl/42SZns=; b=Rf9OQW9c7cJLnzr/v+4j6sDwSRpRTvU
	A5nEg9Yadt/MbXgXBvIPTlZQxX9vktjZkgi4CuXEpsBnSV878zzVZnndwqhyNO7X
	V+3onxrjfzXTCfFrJGZ9xu03t9QdHEhQceCJXQzF2BHdDl6hqkdiNvNxCa3xeZ8D
	VVP7MjI8fPjc=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3E8H1axxpyxYsBA--.3548S9;
	Tue, 18 Nov 2025 20:52:18 +0800 (CST)
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
Subject: [PATCH v2 7/8] hwmon: (ina3221) Support write/read functions for 'power' attribute
Date: Tue, 18 Nov 2025 07:51:47 -0500
Message-Id: <20251118125148.95603-8-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251118125148.95603-1-wenliang202407@163.com>
References: <20251118125148.95603-1-wenliang202407@163.com>
X-CM-TRANSID:_____wD3E8H1axxpyxYsBA--.3548S9
X-Coremail-Antispam: 1Uf129KBjvJXoWxXFy3tr48WFWxZr1DKrykXwb_yoWrWF47p3
	y0kFWrtr4UtF1S9ws3KFs8Gw15tr4xX34Iyr9Fk3savF4UZr909Fyrt3Wqya4UAry3XF47
	tayxAryru3ZrKrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUWRR_UUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbiGQoK02kcZIu7sQABsb
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

SQ52210 adds power attributes to report power data and implements
corresponding read/write functions for this purpose. This includes
reading power values, reading alert thresholds, reading alert
trigger status, and writing alert thresholds.

Signed-off-by: Wenliang Yan <wenliang202407@163.com>
---
 drivers/hwmon/ina3221.c | 79 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index 9a25a1b40856..197fc3a468e4 100644
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
@@ -505,6 +512,60 @@ static int ina3221_read_curr(struct device *dev, u32 attr,
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
+		/* Return power in mW */
+		*val = DIV_ROUND_CLOSEST(regval * ina->power_lsb_uW, 1000);
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
 static int sq52210_alert_limit_write(struct ina3221_data *ina, u32 attr, int channel, long val)
 {
 	struct regmap *regmap = ina->regmap;
@@ -723,6 +784,18 @@ static int ina3221_write_enable(struct device *dev, int channel, bool enable)
 	return ret;
 }
 
+static int ina3221_write_power(struct device *dev, u32 attr, int channel, long val)
+{
+	struct ina3221_data *ina = dev_get_drvdata(dev);
+
+	switch (attr) {
+	case hwmon_power_crit:
+		return sq52210_alert_limit_write(ina, attr, channel, val);
+	default:
+		return 0;
+	}
+}
+
 static int ina3221_read(struct device *dev, enum hwmon_sensor_types type,
 			u32 attr, int channel, long *val)
 {
@@ -739,6 +812,9 @@ static int ina3221_read(struct device *dev, enum hwmon_sensor_types type,
 	case hwmon_curr:
 		ret = ina3221_read_curr(dev, attr, channel, val);
 		break;
+	case hwmon_power:
+		ret = ina3221_read_power(dev, attr, channel, val);
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
@@ -762,6 +838,9 @@ static int ina3221_write(struct device *dev, enum hwmon_sensor_types type,
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

