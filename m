Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB32E37C11E;
	Wed, 14 Jan 2026 08:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768378722; cv=none; b=fOIWS+yWv1cxGkNbZIkrycHVOubexZDtGjOQY5ZjGMIylxLS46aYvVljgjjzBCEMd5CqD3+Cc+mhthyOQo94k1lmfQ8Gj9CvwMPsWQfj0wTnhdItNeDeeBBPH9hrBEnf4kPI/iI1kfYBSJLe2V2UaR0G3ecJJYRKtcLVjXEQNJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768378722; c=relaxed/simple;
	bh=tKkHj585uRbwOBJnr4w4WFhS6cK3mEZfhTBJS3Gkwj0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=S7F6caxgAXcgu0NDzLNAjxjuQyFtEjZxEI4gJZAONfc/PnP2OGdJrDpmKVos6INmVc0RjVS3f686ygourbkEDOiflxNH1An/UdFK/f5ePswO7HtnVTOOJAG1tdkB+g9DmSc8TSwVplE8YxnPEtYKl1jZVYWs/dZWnGUjGxTPVZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ODSNlQmI; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ODSNlQmI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=UEnLV/mo+rvCzPn
	hi5Ysb5BkCmL3hyM1+qpTjHLGeh0=; b=ODSNlQmIBj0P78zyQoTy/fHZ9GjluPm
	o/idz0ECKQvqzmt3t33WbkYRtL4XjiWDF6odo6p5kl0pwCDKuZ1sN2MYHsThb9l/
	FAVXNwoNtHB8QtbX6kvjitfVCJEvhx42mrdp5vsRN5JUGnyJk/ZfP6hlMLco0IWm
	OixGCt5awyvw=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wB3LaYsUWdpIIuhFg--.292S10;
	Wed, 14 Jan 2026 16:18:00 +0800 (CST)
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
Subject: [PATCH v4 RESEND 8/8] hwmon: (ina3221) Modify write/read functions for 'in' and 'curr' attribute
Date: Wed, 14 Jan 2026 03:17:41 -0500
Message-Id: <20260114081741.111340-9-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260114081741.111340-1-wenliang202407@163.com>
References: <20260114081741.111340-1-wenliang202407@163.com>
X-CM-TRANSID:_____wB3LaYsUWdpIIuhFg--.292S10
X-Coremail-Antispam: 1Uf129KBjvJXoWxurW5uFy5GFW7urWDGF4DJwb_yoW7Jr1Dp3
	yUGFWrtrWjq3WSgrs2kF4DWrn8tr4xW3y2yr9rK3sYva1UAryqkFyrG3Wq9345GryfWF4x
	JayxtFWUua1Dtr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUXeOdUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/xtbC5xiWamlnUTjPlQAA3+
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Modified the relevant read/write functions for 'in' and 'curr' attributes,
adding support for crit, lcrit, crit_alarm, and lcrit_alarm features.

Signed-off-by: Wenliang Yan <wenliang202407@163.com>
---
 drivers/hwmon/ina3221.c | 101 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 97 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index a1ac998378fb..9494518bf0b5 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -380,6 +380,12 @@ static const u8 ina3221_in_reg[] = {
 	INA3221_SHUNT_SUM,
 };
 
+static const u8 alert_flag[] = {
+	F_AFF1,
+	F_AFF2,
+	F_AFF3,
+};
+
 static int ina3221_read_chip(struct device *dev, u32 attr, long *val)
 {
 	struct ina3221_data *ina = dev_get_drvdata(dev);
@@ -442,6 +448,40 @@ static int ina3221_read_in(struct device *dev, u32 attr, int channel, long *val)
 	case hwmon_in_enable:
 		*val = ina3221_is_enabled(ina, channel);
 		return 0;
+	case hwmon_in_crit:
+	case hwmon_in_lcrit:
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
@@ -501,6 +541,28 @@ static int ina3221_read_curr(struct device *dev, u32 attr,
 		/* Return current in mA */
 		*val = DIV_ROUND_CLOSEST(voltage_nv, resistance_uo);
 		return 0;
+	case hwmon_curr_lcrit:
+		if (!resistance_uo)
+			return -ENODATA;
+
+		if (channel >= INA3221_NUM_CHANNELS)
+			return -EOPNOTSUPP;
+
+		reg = limit_regs[channel];
+		ret = ina3221_read_value(ina, reg, &regval);
+		if (ret)
+			return ret;
+
+		/* Return current in mA */
+		*val = DIV_ROUND_CLOSEST(regval * ina->current_lsb_uA, 1000);
+		return 0;
+	case hwmon_curr_lcrit_alarm:
+		if (channel >= INA3221_NUM_CHANNELS)
+			return -EOPNOTSUPP;
+
+		reg = alert_flag[channel];
+
+		fallthrough;
 	case hwmon_curr_crit_alarm:
 	case hwmon_curr_max_alarm:
 		/* No actual register read if channel is disabled */
@@ -698,10 +760,9 @@ static int ina3221_write_chip(struct device *dev, u32 attr, long val)
 	}
 }
 
-static int ina3221_write_curr(struct device *dev, u32 attr,
-			      int channel, long val)
+static int ina3221_write_curr_shunt(struct ina3221_data *ina, u32 attr,
+				int channel, long val)
 {
-	struct ina3221_data *ina = dev_get_drvdata(dev);
 	struct ina3221_input *input = ina->inputs;
 	u8 reg = ina3221_curr_reg[attr][channel];
 	int resistance_uo, current_ma, voltage_uv;
@@ -744,6 +805,22 @@ static int ina3221_write_curr(struct device *dev, u32 attr,
 	return regmap_write(ina->regmap, reg, regval);
 }
 
+static int ina3221_write_curr(struct device *dev, u32 attr,
+			      int channel, long val)
+{
+	struct ina3221_data *ina = dev_get_drvdata(dev);
+
+	switch (attr) {
+	case hwmon_curr_crit:
+	case hwmon_curr_max:
+		return ina3221_write_curr_shunt(ina, attr, channel, val);
+	case hwmon_curr_lcrit:
+		return sq52210_alert_limit_write(ina, SQ52210_ALERT_SUL, channel, val);
+	default:
+		return 0;
+	}
+}
+
 static int ina3221_write_enable(struct device *dev, int channel, bool enable)
 {
 	struct ina3221_data *ina = dev_get_drvdata(dev);
@@ -792,6 +869,22 @@ static int ina3221_write_enable(struct device *dev, int channel, bool enable)
 	return ret;
 }
 
+static int ina3221_write_in(struct device *dev, u32 attr, int channel, long val)
+{
+	struct ina3221_data *ina = dev_get_drvdata(dev);
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
@@ -841,7 +934,7 @@ static int ina3221_write(struct device *dev, enum hwmon_sensor_types type,
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

