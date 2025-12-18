Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20DA2FA0DB;
	Thu, 18 Dec 2025 09:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766048884; cv=none; b=jp7cmRcrrAZhvizDSRxhCtJg9sUeKSMk4NhIsB/HyCciKFh6oumbALto9oiPB/PXm1i9y+h24NWJ6qHr03v2MddToE00B0CMJ3uj/wGjDkDKB5fy2IHOjbJk2G2R5w5QjwqKY5h+hJyWne/ick/0CaSlhmvKwTrAkhKQJwCbdVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766048884; c=relaxed/simple;
	bh=tKkHj585uRbwOBJnr4w4WFhS6cK3mEZfhTBJS3Gkwj0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=B9p87X2hiy62bFjPIlJw+goO+rVbZpCoOzNzkoCo/z7lMrRl5VxpSwPccCWac9S/oqHseCISBmzcaBFMkoC+2t6yVAVYVfpMfHYWaC3/9qi/WdoswzoBKfZ9JulYMemQw4FosdTnA2P1qJQXbKBYizodtzqhgtYCPT0hSUqpH/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=g+vOlUVc; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="g+vOlUVc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=UEnLV/mo+rvCzPn
	hi5Ysb5BkCmL3hyM1+qpTjHLGeh0=; b=g+vOlUVcZJgO/+s9QpNc3K/+wuN1J2Z
	xb05ziwioRuIlEgGi/LiZ3BTddky7PFNsgxujZ/TxsISlgF8UF97UPpt7g0Et0od
	+BqS79rwXR8ayq/if/idK65bpkFykBT6ISVtC9LrTWJbMrijUiEYXceO5hLNu88k
	StsKyYWsu+Bg=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wBXPaw5xENpP8BcBA--.40S10;
	Thu, 18 Dec 2025 17:07:20 +0800 (CST)
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
Subject: [PATCH v4 8/8] hwmon: (ina3221) Modify write/read functions for 'in' and 'curr' attribute
Date: Thu, 18 Dec 2025 04:06:59 -0500
Message-Id: <20251218090659.66991-9-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251218090659.66991-1-wenliang202407@163.com>
References: <20251218090659.66991-1-wenliang202407@163.com>
X-CM-TRANSID:_____wBXPaw5xENpP8BcBA--.40S10
X-Coremail-Antispam: 1Uf129KBjvJXoWxurW5uFy5GFW7urWDGF4DJwb_yoW7Jr1Dp3
	yUGFWrtrWjq3WSgrs2kF4DWrn8tr4xW3y2yr9rK3sYva1UAryqkFyrG3Wq9345GryfWF4x
	JayxtFWUua1Dtr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUXeOdUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/xtbC5whuQmlDxEhoaAAA3l
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

