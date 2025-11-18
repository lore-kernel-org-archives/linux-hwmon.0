Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5987125485A;
	Tue, 18 Nov 2025 12:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763470431; cv=none; b=kcJezdCOYbTRdDnV4P1YyH8LEZ6JYY1PVwb2tuy9Xm4A/5aMrPFmG4iUNGwOMtpoI0sZgCW3hrAicBJ69q4tf4y/JPc3FPK5DNX4EYYKYv/6La+JneZOsJksdLKTcD1ZER93y1e0S3I/BFYlL55+x5Qz6oloSoPbxmxugDqPUs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763470431; c=relaxed/simple;
	bh=5r/mkah7BxF6eSsZ16rFYJR0MCWPz+WdGY5pbGPTk8A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=HIs2OwU1GxXyLtwnRUVBTJbkN3KidUEBeSxlGGiSQ0YUEw4pY6wywUrWK+daBSmfndIjqC25Z00slITk1rsCKm1otauIzvr+bS8CoK/e7IpCpfRm5pwJt1z5nOt3hMxsNtsk2SElCe8Wc9pvO808uiDvPSf1shnne6yS67oXFAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=APTRksmR; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="APTRksmR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=u8irVI8h+9/Scz3
	sRLGoolEEOnAYwhZVNrzu6+BJyug=; b=APTRksmRlbUcco9Mruqd58S/So8yMeW
	X/EjGTSJlXNlw8ZpzPbjj5Tw0ldaypTxR0Y5mJ7Ds0zM52ra8kcToorWNSN9Slc0
	2xE06lBPTN7lepP2UvweQAHKs1cCbA3UmX5YxAWFU2ivVOw1cXyjqLYn/PNcZIUR
	Gsw9kopGHHQU=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3E8H1axxpyxYsBA--.3548S6;
	Tue, 18 Nov 2025 20:52:13 +0800 (CST)
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
Subject: [PATCH v2 4/8] hwmon: (ina3221) Support alert configuration
Date: Tue, 18 Nov 2025 07:51:44 -0500
Message-Id: <20251118125148.95603-5-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251118125148.95603-1-wenliang202407@163.com>
References: <20251118125148.95603-1-wenliang202407@163.com>
X-CM-TRANSID:_____wD3E8H1axxpyxYsBA--.3548S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxCF48KrWUGrWkCF4furW3KFg_yoW5XFy5pF
	43K34Fq342qF4Sgan2kan5GFyrt34xWFW2yr9rW340qFsrGryjqrs5Ga4DtFyYvFn5ZFy2
	qay7tr4DCanFyaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JjaKZJUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/xtbCwB17T2kca-2tYwAA3E
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Add alert configuration during chip initialization.

Signed-off-by: Wenliang Yan <wenliang202407@163.com>
---
 drivers/hwmon/ina3221.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index b5fa984a5a25..8ea75f407055 100644
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
@@ -780,7 +787,6 @@ static ssize_t ina3221_shunt_store(struct device *dev,
 
 	/* Update summation_shunt_resistor for summation channel */
 	ina->summation_shunt_resistor = ina3221_summation_shunt_resistor(ina);
-
 	/*
 	 * The current and power registers can only be used when
 	 * all enabled channels have identical shunt resistors
@@ -1096,6 +1102,17 @@ static int ina3221_resume(struct device *dev)
 		}
 	}
 
+	/* Restore alert config register value to hardware */
+	if (ina->config->has_alerts) {
+		ret = regmap_update_bits(ina->regmap, SQ52210_ALERT_CONFIG,
+					 SQ52210_ALERT_CONFIG_MASK,
+					 ina->alert_type_select);
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

