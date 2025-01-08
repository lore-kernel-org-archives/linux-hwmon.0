Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15A21E9B2E;
	Wed,  8 Jan 2025 08:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736324775; cv=none; b=cfaiW9QCdSv72ACszJcOUUhLKR07l8akzj8R/TLPSKgtZeDxJl1u/AGKO94FRRjf+QO1lSmtmUAXMhdhqfC3x039RDTFGmG9runJ5q03X3H+ShUCNdiVfpL0ZO3XIfjmkqL1SkTuBvHmqF/Q1L9b3P1+SI7qSjQqAXAtqN23oaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736324775; c=relaxed/simple;
	bh=iDABl9+NhqWTOWEAfUCqcJjC1oejM2UBhPR5FN14MoY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NFvmTvPVheJkYPp8lE+lwis/nSe/NOxDolm1IEdyXKEdyaPzSPW9ukS8MJ6tP1Juil95tarMd/ZC4+tiY+Qq63He2CVmYzzMXlkC13dWQz/BqOPep9aozVXYJsSUe0+0tvVsj6Jnx3WV9o6LjLiYAfLh5r6jKe3zFQX/JkgIH1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=am4vldzR; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="am4vldzR"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5083aVZY007711;
	Wed, 8 Jan 2025 03:25:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=zjK8G
	Re2VWdfcq/PmwVvtZOo4TQxRk/G/oEYmsWccfQ=; b=am4vldzRuskhJfCdygPMG
	5ngRMVpsyvKuFejeCFX5v84h7PlYg9ojtdyO1t56nuaL7UfjzkjfON32BNmXJe0/
	BfBD1Le4JqKljDWw/ULBaNc1qQoYxuNDUS+AcnLFaAusEywX473Lapj0HMjdPNIi
	h3pHP9hCy8fiooH1jOG21hZKYOYty7+zkz45WQ/GMiM8SSV1lpWSEK9OhYaz3O4o
	hq0vAHcUw3JmCxnfQy/3FqWu3cSHbkfZ2Pb1jkdyfsFdu/Ucyd9P3cmoQzrT1Rvl
	csYpUhwO2g+kd8KAlbhxqO1IgQHhFJ5Qunv2D63mh8vam0cD3H46q97uSJK3Bt2O
	g==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 441dh3a578-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 03:25:58 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 5088PuKE037181
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jan 2025 03:25:57 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Wed, 8 Jan 2025
 03:25:56 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Wed, 8 Jan 2025 03:25:56 -0500
Received: from JGERONI2-L01.ad.analog.com (JGERONI2-L01.ad.analog.com [10.117.223.6])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 5088PfdO026945;
	Wed, 8 Jan 2025 03:25:51 -0500
From: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
To: <devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
CC: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 1/3] hwmon: (max31827) refactor enum chips to chip info
Date: Wed, 8 Jan 2025 16:25:29 +0800
Message-ID: <20250108082531.15467-2-johnerasmusmari.geronimo@analog.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250108082531.15467-1-johnerasmusmari.geronimo@analog.com>
References: <20250108082531.15467-1-johnerasmusmari.geronimo@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: umVG1VVLsp6ZEC4gBHIZZIje1wyE3Hzi
X-Proofpoint-ORIG-GUID: umVG1VVLsp6ZEC4gBHIZZIje1wyE3Hzi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501080067

Utilized chip info to replace enum chips to cater similar devices with
different configurations.

Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
---
 drivers/hwmon/max31827.c | 86 ++++++++++++++++++++--------------------
 1 file changed, 43 insertions(+), 43 deletions(-)

diff --git a/drivers/hwmon/max31827.c b/drivers/hwmon/max31827.c
index 48e8f8ba4..5d319d401 100644
--- a/drivers/hwmon/max31827.c
+++ b/drivers/hwmon/max31827.c
@@ -47,12 +47,6 @@
 #define MAX31827_M_DGR_TO_16_BIT(x)	(((x) << 4) / 1000)
 #define MAX31827_DEVICE_ENABLE(x)	((x) ? 0xA : 0x0)
 
-/*
- * The enum passed in the .data pointer of struct of_device_id must
- * start with a value != 0 since that is a requirement for using
- * device_get_match_data().
- */
-enum chips { max31827 = 1, max31828, max31829 };
 
 enum max31827_cnv {
 	MAX31827_CNV_1_DIV_64_HZ = 1,
@@ -95,6 +89,17 @@ static const u16 max31827_conv_times[] = {
 	[MAX31827_RES_12_BIT] = MAX31827_12_BIT_CNV_TIME,
 };
 
+struct max31827_state;
+static const struct max31827_chip_info max31827;
+static const struct max31827_chip_info max31828;
+static const struct max31827_chip_info max31829;
+static const struct max31827_chip_info max31875;
+
+struct max31827_chip_info {
+	u8 alarm_pol_default;
+	u32 fault_q_default;
+};
+
 struct max31827_state {
 	/*
 	 * Prevent simultaneous access to the i2c client.
@@ -104,6 +109,7 @@ struct max31827_state {
 	bool enable;
 	unsigned int resolution;
 	unsigned int update_interval;
+	const struct max31827_chip_info *chip_info;
 };
 
 static const struct regmap_config max31827_regmap = {
@@ -493,9 +499,9 @@ static struct attribute *max31827_attrs[] = {
 ATTRIBUTE_GROUPS(max31827);
 
 static const struct i2c_device_id max31827_i2c_ids[] = {
-	{ "max31827", max31827 },
-	{ "max31828", max31828 },
-	{ "max31829", max31829 },
+	{ "max31827", (kernel_ulong_t)&max31827 },
+	{ "max31828", (kernel_ulong_t)&max31828 },
+	{ "max31829", (kernel_ulong_t)&max31829 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max31827_i2c_ids);
@@ -506,7 +512,6 @@ static int max31827_init_client(struct max31827_state *st,
 	struct fwnode_handle *fwnode;
 	unsigned int res = 0;
 	u32 data, lsb_idx;
-	enum chips type;
 	bool prop;
 	int ret;
 
@@ -523,8 +528,6 @@ static int max31827_init_client(struct max31827_state *st,
 	prop = fwnode_property_read_bool(fwnode, "adi,timeout-enable");
 	res |= FIELD_PREP(MAX31827_CONFIGURATION_TIMEOUT_MASK, !prop);
 
-	type = (enum chips)(uintptr_t)device_get_match_data(dev);
-
 	if (fwnode_property_present(fwnode, "adi,alarm-pol")) {
 		ret = fwnode_property_read_u32(fwnode, "adi,alarm-pol", &data);
 		if (ret)
@@ -535,19 +538,8 @@ static int max31827_init_client(struct max31827_state *st,
 		/*
 		 * Set default value.
 		 */
-		switch (type) {
-		case max31827:
-		case max31828:
-			res |= FIELD_PREP(MAX31827_CONFIGURATION_ALRM_POL_MASK,
-					  MAX31827_ALRM_POL_LOW);
-			break;
-		case max31829:
-			res |= FIELD_PREP(MAX31827_CONFIGURATION_ALRM_POL_MASK,
-					  MAX31827_ALRM_POL_HIGH);
-			break;
-		default:
-			return -EOPNOTSUPP;
-		}
+		res |= FIELD_PREP(MAX31827_CONFIGURATION_ALRM_POL_MASK,
+				  st->chip_info->alarm_pol_default);
 	}
 
 	if (fwnode_property_present(fwnode, "adi,fault-q")) {
@@ -571,19 +563,8 @@ static int max31827_init_client(struct max31827_state *st,
 		/*
 		 * Set default value.
 		 */
-		switch (type) {
-		case max31827:
-			res |= FIELD_PREP(MAX31827_CONFIGURATION_FLT_Q_MASK,
-					  MAX31827_FLT_Q_1);
-			break;
-		case max31828:
-		case max31829:
-			res |= FIELD_PREP(MAX31827_CONFIGURATION_FLT_Q_MASK,
-					  MAX31827_FLT_Q_4);
-			break;
-		default:
-			return -EOPNOTSUPP;
-		}
+		res |= FIELD_PREP(MAX31827_CONFIGURATION_FLT_Q_MASK,
+				  st->chip_info->fault_q_default);
 	}
 
 	return regmap_write(st->regmap, MAX31827_CONFIGURATION_REG, res);
@@ -604,11 +585,25 @@ static const struct hwmon_ops max31827_hwmon_ops = {
 	.write = max31827_write,
 };
 
-static const struct hwmon_chip_info max31827_chip_info = {
+static const struct hwmon_chip_info max31827_hwmon_chip_info = {
 	.ops = &max31827_hwmon_ops,
 	.info = max31827_info,
 };
 
+static const struct max31827_chip_info max31827 = {
+	.alarm_pol_default = MAX31827_ALRM_POL_LOW,
+	.fault_q_default = MAX31827_FLT_Q_1,
+};
+
+static const struct max31827_chip_info max31828 = {
+	.alarm_pol_default = MAX31827_ALRM_POL_LOW,
+	.fault_q_default = MAX31827_FLT_Q_4,
+
+static const struct max31827_chip_info max31829 = {
+	.alarm_pol_default = MAX31827_ALRM_POL_HIGH,
+	.fault_q_default = MAX31827_FLT_Q_4,
+};
+
 static int max31827_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -623,6 +618,10 @@ static int max31827_probe(struct i2c_client *client)
 	if (!st)
 		return -ENOMEM;
 
+	st->chip_info = device_get_match_data(dev);
+	if (!st->chip_info)
+		return -ENODEV;
+
 	mutex_init(&st->lock);
 
 	st->regmap = devm_regmap_init_i2c(client, &max31827_regmap);
@@ -639,7 +638,7 @@ static int max31827_probe(struct i2c_client *client)
 		return err;
 
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, st,
-							 &max31827_chip_info,
+							 &max31827_hwmon_chip_info,
 							 max31827_groups);
 
 	return PTR_ERR_OR_ZERO(hwmon_dev);
@@ -648,15 +647,15 @@ static int max31827_probe(struct i2c_client *client)
 static const struct of_device_id max31827_of_match[] = {
 	{
 		.compatible = "adi,max31827",
-		.data = (void *)max31827
+		.data = &max31827
 	},
 	{
 		.compatible = "adi,max31828",
-		.data = (void *)max31828
+		.data = &max31828
 	},
 	{
 		.compatible = "adi,max31829",
-		.data = (void *)max31829
+		.data = &max31829
 	},
 	{ }
 };
@@ -672,6 +671,7 @@ static struct i2c_driver max31827_driver = {
 };
 module_i2c_driver(max31827_driver);
 
+MODULE_AUTHOR("John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>");
 MODULE_AUTHOR("Daniel Matyas <daniel.matyas@analog.com>");
 MODULE_DESCRIPTION("Maxim MAX31827 low-power temperature switch driver");
 MODULE_LICENSE("GPL");
-- 
2.34.1

