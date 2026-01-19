Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA092512E6;
	Mon, 19 Jan 2026 12:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768824967; cv=none; b=Mlg+gmKDrd3MKJNTmiZDc6BrjzWX8b56U6krAve5WyFPtsDaJub6g8K/RZLG9gu3oV9mVhwjaaw+Dv1Nxh62j+ueX0dYb63R4CHa2hM7ZEOv+sEgEeWCZS7UC5ipADxb3hmtRSO68g3CypqaZlMASP3Hq+/uKSkOrj10HY4upkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768824967; c=relaxed/simple;
	bh=YuPVP77vtjEHj/gJO8wjd20Ss1fiQheCeVUVT27Cn8I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=rxZu9UlJstmB46EkQC9Ou7jrSZknKmqh/Xp3w1BRglY/tIcJxNir0BaaifyZmz+/dXbjnvmn8BkSkbhMlBC5yVB7DefObJ2v6TBIlN6Sr9NIVjR5bWVuxq/VE0EoDXuoP+1p9QS/UjC/i3TAs28JYesYNPreQ8cx8QnzVlOZ3YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=MYpyAgjN; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="MYpyAgjN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=aR3HDueLetwRpZs
	tt8M58tW2Jb/r6AWYTK+piBCx8cU=; b=MYpyAgjNU32TQTi415VXNbMsqNhsto6
	8hr3Bvv2FweH4wuhbTHA2Ao++ku97i1YJYT63v8XnBhup/tVa8qmNe5UE+8HKPFv
	ika2bKbuo9m0gX66U824jBhfaUR95wMN1rVI1g42mOe4tq+bT0bh17cZGnemKtLI
	l50eMskYrUAY=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wBHtZdDIG5pljmWGw--.3726S9;
	Mon, 19 Jan 2026 20:15:13 +0800 (CST)
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
Subject: [PATCH v5 7/8] hwmon: (ina3221) Support write/read functions for 'power' attribute
Date: Mon, 19 Jan 2026 07:14:45 -0500
Message-Id: <20260119121446.17469-8-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260119121446.17469-1-wenliang202407@163.com>
References: <20260119121446.17469-1-wenliang202407@163.com>
X-CM-TRANSID:_____wBHtZdDIG5pljmWGw--.3726S9
X-Coremail-Antispam: 1Uf129KBjvJXoWxXFy3tr48Ar1rGrWUuFWxJFb_yoWrWFykp3
	yjkFWrtw4Ut3WfuwsakFs8Gw1Yqr4xX3y2yr9Fk3savF4UZr909ryrt3Wvy34UCry3XF47
	tayxAryru3ZrKrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUXeOdUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/xtbCwBES5WluIFGt-wAA3C
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
index cb292fee564b..2338b3288950 100644
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
@@ -512,6 +519,60 @@ static int ina3221_read_curr(struct device *dev, u32 attr,
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
+		*val = DIV_U64_ROUND_CLOSEST((u64)regval * (u64)ina->power_lsb_uW, 1000);
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
 static int sq52210_alert_limit_write(struct ina3221_data *ina,
 			enum sq52210_alert_types type, int channel, long val)
 {
@@ -736,6 +797,18 @@ static int ina3221_write_enable(struct device *dev, int channel, bool enable)
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
@@ -752,6 +825,9 @@ static int ina3221_read(struct device *dev, enum hwmon_sensor_types type,
 	case hwmon_curr:
 		ret = ina3221_read_curr(dev, attr, channel, val);
 		break;
+	case hwmon_power:
+		ret = ina3221_read_power(dev, attr, channel, val);
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
@@ -775,6 +851,9 @@ static int ina3221_write(struct device *dev, enum hwmon_sensor_types type,
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

