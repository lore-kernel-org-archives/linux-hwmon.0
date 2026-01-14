Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C4E36C0CA;
	Wed, 14 Jan 2026 08:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768378727; cv=none; b=Cm+M2TlGA7FkrMjVmRiyzyW9T9Erbzo9PYQjTUBOkHzO6wXBNv4hOjs3EYSf2kQuOm2UDaNTcbNsGvhlgM5naljznhX2OUTKY4OgOZzuOvpzLcqdiwSmpNslnTqniB3P7QYhDCesG74XhYkatuGkYz1CiLLAyVqs6XzTCLOufk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768378727; c=relaxed/simple;
	bh=RH7ASWKQFsQ/K/ZQT1O576kfsspyIqlJhgko+1brvIY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=ppx28AlSAczFqGv+KdaVI6NaZFHwqsyU15GtQPJKKn+LGyxiUZwsoNdnJc7ZTPfwHKeXDAb0oD36+lDh9jG6zpGXriXNTp/KE/fD4h4kb/tkSkFcRPcpNxD5xpe9ueIhkH2SdiZ4oRgjUAsN9ksQ9EpNebmuUBBxZkalKiJyLt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=BNgZ5EHi; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="BNgZ5EHi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=zZD1jx9ZKsatF5B
	7bD5UlDyEA4YVAEsL4Vw/i6rSL2k=; b=BNgZ5EHimpnJ4DSumZFlb2dZ2RH/V2W
	4eB9OhQbR6vpI1BoJyb16CIGD4ghY0dgBkBse9Jlkort6V/IbMl+TrTT+A9Nmz31
	jTZbQZ2dk5f0fxt/eUoLeDf3B9FUyyH9FdlH+zBpC93iJH50AbPrOi24DqgZqck3
	TbvgEQ2MGxTk=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wB3LaYsUWdpIIuhFg--.292S9;
	Wed, 14 Jan 2026 16:17:59 +0800 (CST)
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
Subject: [PATCH v4 RESEND 7/8] hwmon: (ina3221) Support write/read functions for 'power' attribute
Date: Wed, 14 Jan 2026 03:17:40 -0500
Message-Id: <20260114081741.111340-8-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260114081741.111340-1-wenliang202407@163.com>
References: <20260114081741.111340-1-wenliang202407@163.com>
X-CM-TRANSID:_____wB3LaYsUWdpIIuhFg--.292S9
X-Coremail-Antispam: 1Uf129KBjvJXoWxXFy3tr48WFWxXw1UCw43Awb_yoWrWF4xp3
	y0kFWrtr4jq3WS9wsakFs8Gw15tr4xX3y2yr9Fk3sava1UZrn0gFyrt3Wqya4UCry3Xr47
	tayxAryru3ZrKr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUXeOdUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/xtbC5xeVaWlnUTfPfgAA3V
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
index 38dbcd8046bd..a1ac998378fb 100644
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
 static int sq52210_alert_limit_write(struct ina3221_data *ina,
 			enum sq52210_alert_types type, int channel, long val)
 {
@@ -731,6 +792,18 @@ static int ina3221_write_enable(struct device *dev, int channel, bool enable)
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
@@ -747,6 +820,9 @@ static int ina3221_read(struct device *dev, enum hwmon_sensor_types type,
 	case hwmon_curr:
 		ret = ina3221_read_curr(dev, attr, channel, val);
 		break;
+	case hwmon_power:
+		ret = ina3221_read_power(dev, attr, channel, val);
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
@@ -770,6 +846,9 @@ static int ina3221_write(struct device *dev, enum hwmon_sensor_types type,
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

