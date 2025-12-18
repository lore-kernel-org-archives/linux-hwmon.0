Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC96B301002;
	Thu, 18 Dec 2025 09:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766048885; cv=none; b=USM+NZIHA+d6Vt1u6hxyHbB1W2P3dDOWZaOIKnZrNfgQSHpkjN7i/FtjPOc8E8sE2+ctKszzKNt2nBgDPYJ2eu/HM/Qb22O2sWo9r1u08FDgu7Bpk/ISvyn5U4JIQW4tcOQFC6UfntrgUfACX1lFItLSYFdWzPITlzJXPcTr7UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766048885; c=relaxed/simple;
	bh=hBhvsuW3B/69apNkWMzqRnqNgKxIb4+zXZeq0VpfECM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Fi/ydfGipVvYfkridMZzjSir0aUY6+0mcNAGA2nOgXZL1TWvH5OQwOp+huLfio5FpoJuW+bTpi2qY8LBv6JUSry++1zXGtLA68aHO60PsS2fIJXbCTdZ4Tw7HxH+GKfUZmEwkQ69OnfnJoCOJdKvgs6JWoIYAV+WfIFQP+3O1jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ohBito1P; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ohBito1P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=SeKIIdbs9uF8hF/
	ORo4qkiW+uv23+t/MhSqLxns7ow0=; b=ohBito1PkL2BHMRB4Z32qakZ8jyoh4p
	Ii/ft8+BePvkbtUr0j3T3GPco+OcK2lLwJyi5CsUNT2zy2rFYhqAaLRl8oR13wUx
	IRxNE4jVHr3mQb8roqymKcw6evyooqfziGMVaaScKnx+CSopx14WW3QGFyxd4QzL
	q7yiPKYSKdR8=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wBXPaw5xENpP8BcBA--.40S6;
	Thu, 18 Dec 2025 17:07:13 +0800 (CST)
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
Subject: [PATCH v4 4/8] hwmon: (ina3221) Support alert configuration
Date: Thu, 18 Dec 2025 04:06:55 -0500
Message-Id: <20251218090659.66991-5-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251218090659.66991-1-wenliang202407@163.com>
References: <20251218090659.66991-1-wenliang202407@163.com>
X-CM-TRANSID:_____wBXPaw5xENpP8BcBA--.40S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxCF48KrWUGrWkCF4furW3KFg_yoW5WFy5pF
	4ak34rt3W2qF4Sgws7Kan5KFyFy34xWF47trnrW340qFsrJryjvw1kKa4DtFyYvFn5ZFyx
	tay7tr4UCanrAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0Jj3Ef5UUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/xtbC5wFsQGlDxEFnXAAA3e
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Add alert configuration for initialization and resume.

Signed-off-by: Wenliang Yan <wenliang202407@163.com>
---
 drivers/hwmon/ina3221.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index b5fa984a5a25..c82ef2d23056 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -65,6 +65,8 @@
 
 #define INA3221_MASK_ENABLE_SCC_MASK	GENMASK(14, 12)
 
+#define SQ52210_ALERT_CONFIG_MASK	GENMASK(15, 4)
+
 #define INA3221_CONFIG_DEFAULT		0x7127
 #define INA3221_RSHUNT_DEFAULT		10000
 #define SQ52210_SHUNT_LSB			40000000	/* pV/LSB */
@@ -123,6 +125,7 @@ struct ina3221_input {
 enum ina3221_ids { ina3221, sq52210 };
 
 struct ina3221_config {
+	bool has_alerts;	/* chip supports alerts and limits */
 	bool has_current;	/* chip has internal current reg */
 	bool has_power;		/* chip has internal power reg */
 	int calibration_value;	/* calculate current_lsb */
@@ -140,6 +143,7 @@ struct ina3221_config {
  * @reg_config: Register value of INA3221_CONFIG
  * @summation_shunt_resistor: equivalent shunt resistor value for summation
  * @summation_channel_control: Value written to SCC field in INA3221_MASK_ENABLE
+ * @alert_type_select: Used to store the alert trigger type
  * @current_lsb_uA: The value of one LSB corresponding to the current register
  * @power_lsb_uW: The value of one LSB corresponding to the power register
  * @single_shot: running in single-shot operating mode
@@ -155,6 +159,7 @@ struct ina3221_data {
 	u32 reg_config;
 	int summation_shunt_resistor;
 	u32 summation_channel_control;
+	u32 alert_type_select;
 	long current_lsb_uA;
 	long power_lsb_uW;
 
@@ -163,10 +168,12 @@ struct ina3221_data {
 
 static const struct ina3221_config ina3221_config[] = {
 	[ina3221] = {
+		.has_alerts = false,
 		.has_current = false,
 		.has_power = false,
 	},
 	[sq52210] = {
+		.has_alerts = true,
 		.has_current = true,
 		.has_power = true,
 		/*
@@ -948,6 +955,10 @@ static int ina3221_probe(struct i2c_client *client)
 			ina->reg_config &= ~INA3221_CONFIG_CHx_EN(i);
 	}
 
+	/* Initialize alert_type_select */
+	if (ina->config->has_alerts)
+		ina->alert_type_select = 0;
+
 	/* Initialize summation_shunt_resistor for summation channel control */
 	ina->summation_shunt_resistor = ina3221_summation_shunt_resistor(ina);
 	for (i = 0; i < INA3221_NUM_CHANNELS; i++) {
@@ -1096,6 +1107,17 @@ static int ina3221_resume(struct device *dev)
 		}
 	}
 
+	/* Restore alert config register value to hardware */
+	if (ina->config->has_alerts) {
+		ret = regmap_update_bits(ina->regmap, SQ52210_ALERT_CONFIG,
+					 SQ52210_ALERT_CONFIG_MASK,
+					 ina->alert_type_select & SQ52210_ALERT_CONFIG_MASK);
+		if (ret) {
+			dev_err(dev, "Unable to select alert type\n");
+			return ret;
+		}
+	}
+
 	return 0;
 }
 
-- 
2.17.1

