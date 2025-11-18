Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C11258EF0;
	Tue, 18 Nov 2025 12:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763470400; cv=none; b=O3wqIVP3A1SUqG92jNcxpM5kghR4eiDA0oY5b9SU0qNRMUXb6VQ3F29QZN0Rns4+m+F+bEx60xcQyYb8cMRAnk96W8met8mtEzNmE08XNjtczincUKsWX8GKXjh4NSoGfOLiBXt1t+gHATxT44tymf/Ac1t4Hl6c+wb7X0xxDyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763470400; c=relaxed/simple;
	bh=RAuFNXS+YY+wIKdSyUvoUOT64fbvfDuz+CVllre0+dw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=opC58hxCxw/px0HOWW7s79cdtOcFN6X55tms1zxqetgY5lNMh3TyG57dXrbki+osbae6Y9JFa7N5KdNbWWZLs7cMMgvfMr4SPOIot7r9px602Gqugt8jV2V29bD8Tarr5QZZDTp1mkuYAe/Arx63LSd/8w/hLB4z7Ipwc/obqf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=H7SNEnVT; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="H7SNEnVT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=ZRoqeIUCfF06GBM
	hp9pDfuud+73ZPkjSr7txCdSHIlo=; b=H7SNEnVTQN8PEScgHcV9TbtJl9z2W7c
	ywNDpMx9szCN7jhRnC8q6tanXPYUhwn+B6oIJ1zRcUaTtFP/GSUFw34DJB5TnoFw
	FvWRTyyweyBMOLRqt98y+17phzLGNKwFOhFPLUIbhwq0cjt4WLC5y3TYBBgwkbZ+
	CCH4A2LIc0zY=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3E8H1axxpyxYsBA--.3548S10;
	Tue, 18 Nov 2025 20:52:19 +0800 (CST)
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
Subject: [PATCH v2 8/8] hwmon: (ina3221) Modify write/read functions for 'in' and 'curr' attribute
Date: Tue, 18 Nov 2025 07:51:48 -0500
Message-Id: <20251118125148.95603-9-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251118125148.95603-1-wenliang202407@163.com>
References: <20251118125148.95603-1-wenliang202407@163.com>
X-CM-TRANSID:_____wD3E8H1axxpyxYsBA--.3548S10
X-Coremail-Antispam: 1Uf129KBjvJXoWxurW5uFy5GFW7urWftF1DWrg_yoWrtFy5p3
	yUGFWrtrWjq3WSgwsakF4DWrn8trWxX3y2yr9rK39Yva1UAryq9FyrG3Wq9345Gr93WF4x
	JayxtFWUua1qvr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUWRR_UUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/xtbCwAN8UGkcbAOuEwAA3I
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Modified the relevant read/write functions for 'in' and 'curr' attributes,
adding support for crit, lcrit, crit_alarm, and lcrit_alarm features.

Signed-off-by: Wenliang Yan <wenliang202407@163.com>
---
 drivers/hwmon/ina3221.c | 96 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 92 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index 197fc3a468e4..2f05ee6c72a9 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -373,6 +373,12 @@ static const u8 ina3221_in_reg[] = {
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
@@ -435,6 +441,38 @@ static int ina3221_read_in(struct device *dev, u32 attr, int channel, long *val)
 	case hwmon_in_enable:
 		*val = ina3221_is_enabled(ina, channel);
 		return 0;
+	case hwmon_in_crit:
+	case hwmon_in_lcrit:
+		if (!ina3221_is_enabled(ina, channel))
+			return -ENODATA;
+
+		if (channel >= INA3221_NUM_CHANNELS)
+			return -EOPNOTSUPP;
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
@@ -494,6 +532,25 @@ static int ina3221_read_curr(struct device *dev, u32 attr,
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
+		reg = alert_flag[channel];
+
+		fallthrough;
 	case hwmon_curr_crit_alarm:
 	case hwmon_curr_max_alarm:
 		/* No actual register read if channel is disabled */
@@ -690,10 +747,9 @@ static int ina3221_write_chip(struct device *dev, u32 attr, long val)
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
@@ -736,6 +792,22 @@ static int ina3221_write_curr(struct device *dev, u32 attr,
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
+		return sq52210_alert_limit_write(ina, attr, channel, val);
+	default:
+		return 0;
+	}
+}
+
 static int ina3221_write_enable(struct device *dev, int channel, bool enable)
 {
 	struct ina3221_data *ina = dev_get_drvdata(dev);
@@ -784,6 +856,22 @@ static int ina3221_write_enable(struct device *dev, int channel, bool enable)
 	return ret;
 }
 
+static int ina3221_write_in(struct device *dev, u32 attr, int channel, long val)
+{
+	struct ina3221_data *ina = dev_get_drvdata(dev);
+
+	switch (attr) {
+	case hwmon_in_lcrit:
+		return sq52210_alert_limit_write(ina, attr, channel, val);
+	case hwmon_in_crit:
+		return sq52210_alert_limit_write(ina, attr, channel, val);
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
@@ -833,7 +921,7 @@ static int ina3221_write(struct device *dev, enum hwmon_sensor_types type,
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

