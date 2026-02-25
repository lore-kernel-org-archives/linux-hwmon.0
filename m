Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3E33624A4;
	Wed, 25 Feb 2026 09:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772010283; cv=none; b=OdvCthYSBytRyUf9tjD4b+SQf7JfmV0IJvlsS65UtqxkXIiTnLeqW7LZ7LBAQJdyKXh6O++JCq8v1miWHdWragIfL9FEXXll4GMJMkJN3CRKyuJ/jOp0piMOH2lzn0w9ZRYwvuzeeQZxCHf20KR77z8LCsZpCmy7qgW+6boKtr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772010283; c=relaxed/simple;
	bh=304TDv5014m7Ux4mfAAfqPq4f5IZIonYDuT/BoqTjzg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=npFGIguVLEgG5CJ6sH8IAPFQi/1n4MEDsy3Oc8FKECP7hPmS4qQ/eFDRi9AY7eiUmjabMVW2akjJuUhrBemDVgSOWHhhxxv165iZ6hcmGJ3+3DmKc0L2bSvav0eobcZ7DNZUY5ecftPX+sDOKS28MSCds98a9T2YWdOfef4kf2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=jDTGTjo+; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="jDTGTjo+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=UmLJgRTsOfEcdmH
	LfWF0+EFCyL5MwH3DZWpb62HOov8=; b=jDTGTjo+BuOKXHhFMjQgcN8XkH/TvWu
	9CF6+6AvvPyJq7o5jym2BHFrA/Sr4YuzDLApcH7TZ39uTuk6iBLYbfkRYQCwBW/z
	7ufUeZdhY1NJZf079erX/SvBN0TLgIMdd3GNvv+zv25f1iSP88zlMOAZTWayZRxq
	urM/VxgtkoOk=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3N4nlup5pilgzMg--.30498S6;
	Wed, 25 Feb 2026 17:03:39 +0800 (CST)
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
Subject: [PATCH v6 4/8] hwmon: (ina3221) Support alert configuration
Date: Wed, 25 Feb 2026 04:03:20 -0500
Message-Id: <20260225090324.112145-5-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260225090324.112145-1-wenliang202407@163.com>
References: <20260225090324.112145-1-wenliang202407@163.com>
X-CM-TRANSID:_____wD3N4nlup5pilgzMg--.30498S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxCF48KrWUGrWkCF4furW3KFg_yoW5Ar1kpF
	4akw1rt3WIqF1Sgws7tan5KFyrt34xGFW2yrnrG34vqFsrJryjqw1kGa4DtFyYyrn5ZFyI
	qa9rtr4UCanrA3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0Jj3Ef5UUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/xtbCwAvqvmmeuusnEAAA3O
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
index e99ac5ef4d8a..74dd937cc568 100644
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
+	bool has_alerts_add;	/* chip has addtional alert functions */
 	bool has_current_reg;	/* chip has internal current reg */
 	bool has_power_reg;		/* chip has internal power reg */
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
+		.has_alerts_add = false,
 		.has_current_reg = false,
 		.has_power_reg = false,
 	},
 	[sq52210] = {
+		.has_alerts_add = true,
 		.has_current_reg = true,
 		.has_power_reg = true,
 		/*
@@ -948,6 +955,10 @@ static int ina3221_probe(struct i2c_client *client)
 			ina->reg_config &= ~INA3221_CONFIG_CHx_EN(i);
 	}
 
+	/* Initialize alert_type_select */
+	if (ina->config->has_alerts_add)
+		ina->alert_type_select = 0;
+
 	/* Initialize summation_shunt_resistor for summation channel control */
 	ina->summation_shunt_resistor = ina3221_summation_shunt_resistor(ina);
 	for (i = 0; i < INA3221_NUM_CHANNELS; i++) {
@@ -1096,6 +1107,17 @@ static int ina3221_resume(struct device *dev)
 		}
 	}
 
+	/* Restore alert config register value to hardware */
+	if (ina->config->has_alerts_add) {
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

