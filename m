Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560A838AC7D;
	Mon, 20 Jul 2026 03:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784517332; cv=none; b=MygZ7YezumH9n46FnDRSsF78fs6bfw9CrF2JyO8ovHO7oBcLAYsBuzettSKV2Dp59fGOry4fhU4U2ouVsyCAh0jtB4N97tRUU/cH5dYlJswOGVL6/F3g/gTqr37ugmhXoMZAOinadris8HhK01PRsDpdLhq68woEZGUkXZK8a0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784517332; c=relaxed/simple;
	bh=whGwy8iUdQ+uED3tZKui/NXJQJHb5yViykND/HeI5zo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=EGpFKYV7wjHDcx7rz5UKaFNFL3dlfjq2ngrFhRt1JH6/WAfy1ekCW2R2EKb/7JxY1LBz5KBUB1XzgHMSPQ2vraJbDYtlWlcMvhZluoV1jdVAb0BOlr2jtTcHM0NDyxhK6ROvbzOLEr31J6S1F8OVbbEN9ZjoFZ/geLZ4Z84lO0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=jgp7AX0k; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="jgp7AX0k"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNuA0D170741;
	Sun, 19 Jul 2026 23:15:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=jU2O3
	flkt7aA7BZV/fk5ltrP01HBFw01b7Y15gm1ZAs=; b=jgp7AX0ksPxIoQ5T++wDu
	X7D+54cxGFdCCJ40S/ubZ3ZXRn4asl0GHiPzm4nRqrzRL8TBdqvtCYAagJIpXFnw
	bCFswYq8npzWy7zfFZSD5a+6XwmTSNk37v4oXahA+nneujzttJXBY+MKSzDu2foh
	GXks78igNeHHTuk75s5A6dGkC5ClXc/EkQwcWDHlgTVPyFGaEXqazMm2LK1xeiy3
	LrYalAFvQ92k2uJb6qlGmFkxzcbaJ0h77s34IdFdcCg4awAKnm8PCE5l/7UQWfdQ
	gI6mW1o2FV6fqmy2gswmYb0U5LfkV9ddMWfaTySzxMjiTnyXFMPnoVfeFfk5kRTV
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4fgqte2fuj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jul 2026 23:15:16 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 66K3FFJ5054369
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 19 Jul 2026 23:15:15 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Sun, 19 Jul 2026 23:15:15 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Sun, 19 Jul 2026 23:15:15 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Sun, 19 Jul 2026 23:15:15 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.192])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 66K3EoFU021622;
	Sun, 19 Jul 2026 23:15:07 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Mon, 20 Jul 2026 11:14:43 +0800
Subject: [PATCH v3 2/4] hwmon: (pmbus/max20830): add VOUT feedback resistor
 scaling support
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260720-dev-max20830c-v3-2-9d06d27d6da3@analog.com>
References: <20260720-dev-max20830c-v3-0-9d06d27d6da3@analog.com>
In-Reply-To: <20260720-dev-max20830c-v3-0-9d06d27d6da3@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        "Alexis Czezar
 Torreno" <alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784517290; l=4032;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=whGwy8iUdQ+uED3tZKui/NXJQJHb5yViykND/HeI5zo=;
 b=a0+7Uo7M7Zaqsb+rf5pz6wWrMKXpBzyCrLCCxMxP8V8ZDDccKr0+EhgeeZoDV9uCH4KCi3Agy
 Zpz8XfhsZOjAfoVbnHRiZMA8PvZJ81ZzZh667JUQm6aLnlrcD0V5LnY
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDAzMyBTYWx0ZWRfX86LUIPrH55uP
 m+bb3HcnXAc9tpWbL6F5N5HWD5bq65XLZbffYkcgX8H5qfC/0Up5qimfko58b8WmEh1VQGDEy3i
 pZc1BekHgCmX04rJLUoOK5xw+DTgiQxNpOMVOENUaSXnvuDJ4mxCRCXN0dlh5sNrqI/dkwdowaJ
 vHtTsc5TlwoXX+Sq82yKQIs/1aARWPTz0bhIpgFsEbgu+/UL0F5kOkijLEHcN4TLe9dOVT5AX2n
 GyFObexywyvv5RQXncVHPMcRIixO9zar7QoQrclLNW1QeAkI2r1R9+qH/M7hSIS6bcBxGbQc9fq
 nGB+Z+/6170glPf9huhJulOpDzZS7CphtLZRsJOvTQBLqNFmBhC8B+UVG+1YKN0WQoeIR6qEI/G
 3WvpsMI+LA9LZ00pv4ZbR5Xu7e9GMxAh4GRhmVlaYaWPjXrAUfpLCB+7o9722zRjjASrnKkzdY6
 mQ8ISsZZ+uNTVlo2oAA==
X-Proofpoint-GUID: 2LxV8JYLUi3s-_dgRoUBcwbnEDAo8bkA
X-Authority-Analysis: v=2.4 cv=Ed/4hvmC c=1 sm=1 tr=0 ts=6a5d92c4 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22 a=gAnH3GRIAAAA:8
 a=_8IsL081WaPWLXqRiQAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 2LxV8JYLUi3s-_dgRoUBcwbnEDAo8bkA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDAzMyBTYWx0ZWRfX2N20fKmyB9Xa
 AQY1W9Ynx2NdOC3uCLVkuhJAQlFR8jtj7K3CD7R5pYlTB0BDbZ2niytqpI36jmJANZh13FiZrKX
 zR3I02fkXPu5NLPoecEavACpkV/kE+SJ3iWNS4jyT4F7wjnr17pw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200033

Implement support for external voltage divider scaling using the
adi,vout-rfb1-ohms and adi,vout-rfb2-ohms device tree properties.

When the desired output voltage exceeds VREF, a resistor divider
(RFB1 and RFB2) is used to scale down the feedback voltage. The
driver reads these resistor values from device tree and applies
the scaling formula: VOUT_actual = VOUT_measured × (1 + RFB1/RFB2)

The properties are optional. If not specified, the driver assumes
no voltage divider is present and reports the raw VOUT reading.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
 drivers/hwmon/pmbus/max20830.c | 59 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max20830.c
index cb2c23672166d641852199ca07eb716924f4f286..7a5e67bd33c0a8b84511d138ac5f5f48334a0a45 100644
--- a/drivers/hwmon/pmbus/max20830.c
+++ b/drivers/hwmon/pmbus/max20830.c
@@ -7,6 +7,7 @@
 
 #include <linux/errno.h>
 #include <linux/i2c.h>
+#include <linux/math64.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/string.h>
@@ -14,6 +15,50 @@
 
 #define MAX20830_IC_DEVICE_ID_LENGTH	9
 
+struct max20830_data {
+	struct pmbus_driver_info info;
+	u32 vout_rfb1;
+	u32 vout_rfb2;
+};
+
+/*
+ * MAX20830 only supports READ_VOUT for VOUT monitoring.
+ *
+ * MAX20830 uses an external resistor divider for voltage sensing:
+ * - VOUT_COMMAND and VOUT_MAX set the reference voltage at the feedback pin
+ * - READ_VOUT reports the feedback voltage, which needs to be scaled for actual
+ *   output voltage
+ *
+ * Scaling formula: vout_actual = vout_fb × (1 + RFB1 / RFB2)
+ *
+ * If regulator support is added in the future, some adjustments are needed to
+ * ensure correct feedback voltages are set.
+ */
+static int max20830_read_word_data(struct i2c_client *client, int page,
+				   int phase, int reg)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	const struct max20830_data *data = container_of(info, struct max20830_data, info);
+	int ret;
+
+	switch (reg) {
+	case PMBUS_READ_VOUT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		/* Apply voltage divider scaling if resistors are non-zero */
+		if (data->vout_rfb1 && data->vout_rfb2) {
+			ret = DIV_ROUND_CLOSEST_ULL((u64)ret * (data->vout_rfb1 +
+						    data->vout_rfb2), data->vout_rfb2);
+			ret = clamp_val(ret, 0, 0xFFFF);
+		}
+		return ret;
+	default:
+		return -ENODATA;
+	}
+}
+
 static struct pmbus_driver_info max20830_info = {
 	.pages = 1,
 	.format[PSC_VOLTAGE_IN] = linear,
@@ -24,13 +69,25 @@ static struct pmbus_driver_info max20830_info = {
 		PMBUS_HAVE_TEMP |
 		PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT |
 		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
+	.read_word_data = max20830_read_word_data,
 };
 
 static int max20830_probe(struct i2c_client *client)
 {
 	u8 buf[I2C_SMBUS_BLOCK_MAX + 1] = {};
+	struct max20830_data *data;
 	int ret;
 
+	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->info = max20830_info;
+
+	/* Read optional voltage divider resistor values */
+	device_property_read_u32(&client->dev, "adi,vout-rfb1-ohms", &data->vout_rfb1);
+	device_property_read_u32(&client->dev, "adi,vout-rfb2-ohms", &data->vout_rfb2);
+
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_READ_BLOCK_DATA) &&
 	    !i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_READ_I2C_BLOCK))
 		return -ENODEV;
@@ -78,7 +135,7 @@ static int max20830_probe(struct i2c_client *client)
 		return dev_err_probe(&client->dev, -ENODEV,
 				     "Unsupported device: '%s'\n", buf);
 
-	return pmbus_do_probe(client, &max20830_info);
+	return pmbus_do_probe(client, &data->info);
 }
 
 static const struct i2c_device_id max20830_id[] = {

-- 
2.34.1

