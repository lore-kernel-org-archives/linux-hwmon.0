Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE5A34CFC2;
	Thu, 30 Jul 2026 01:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785373472; cv=none; b=ScJSnN239SVuf9AsYJY+96lkmsSO5O1shZZgXOPfaCz9FbIR4Gqsm5yO/7IZvPS2sjBNV9zrcMBsWkv+rhZygdsle7j1Ez//89HbgUGLhaId0vBZKpieQWyJth8Bl2AkGJLqWdvEMPUbomNrAAnG4/O4F8O/yznBHcyjARkHUcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785373472; c=relaxed/simple;
	bh=ta+gqkJOzk2z5y8MPlrhsU2CswcciVfxQMzcsris8Y4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=qOj5bzpxc6RA61yeIh7jb6Hm0PG4vB2OhjWaYqG0r8unIil6g9I20b1Bkvf6MEa73Ddu//feC1vFskr4tglsb3ac85PD5Z7p9zkrB5XlkkOd29WHIsaZZLXqn0Ta8BgORuOE/PNp67YOc6VkJvP3efBgNrgkUf4upaojZvz5EnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=DNA2R8yr; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="DNA2R8yr"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U0m4KY3116059;
	Wed, 29 Jul 2026 21:04:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=LVuDw
	//yauhiP3d5hW+PHjvxST7j+YC3Wp5A/OIpIQY=; b=DNA2R8yrNHf7pHoKzfUSm
	l5f+E3FJa5r8BQ0X78C+GkyPZlLqBnH2Gq9/4EguSK1l92OKI5pvl7guIBvdlXWv
	Ahq6SlK4KzDnewBSISwStzFfDNl1kqTT6B8U1RzvFJobuCkP4Hcau90hd4RO4ppx
	rk3kB4WROBp5dK7xGImOVMXP9XmOYWqhdE4jHHeMTadz+UzOGWxjiWCUcEL0elPh
	/HnA/gkz7aBu30PMOooUcWTSYH5Ushl2fMhiYb9KWj2OIy4+sHjV5tqTTlKHg/AK
	xiTAIaQPo3SYCoaFqBDZsNb8qFl31jLgTeTKoEB79slIICnmzsykZGmLZDgF4uCd
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4fq18dxm0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 21:04:10 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 66U148gT036862
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 29 Jul 2026 21:04:08 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Wed, 29 Jul
 2026 21:04:08 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Wed, 29 Jul 2026 21:04:08 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.193])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 66U13i45020304;
	Wed, 29 Jul 2026 21:04:02 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Thu, 30 Jul 2026 09:03:34 +0800
Subject: [PATCH v5 2/4] hwmon: (pmbus/max20830): add VOUT feedback resistor
 scaling support
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260730-dev-max20830c-v5-2-a7553f84ee74@analog.com>
References: <20260730-dev-max20830c-v5-0-a7553f84ee74@analog.com>
In-Reply-To: <20260730-dev-max20830c-v5-0-a7553f84ee74@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Alexis Czezar
 Torreno <alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785373424; l=4341;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=ta+gqkJOzk2z5y8MPlrhsU2CswcciVfxQMzcsris8Y4=;
 b=39nuxaxaxS32+AjGr7vX886Iw+lUsRYfh6HbQ+C9kfzXB+FSD+T0q/7dpqhKs1xOPpivuDZGR
 mYfbNIw6KAFBdWJ5sjHoJjGjyyjc0B2HCYdyd3fkCSB8brdlDoGD9PP
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: NU8jRuq2O4UjJIqHuuL2diAELjoFe_Bm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDAwNCBTYWx0ZWRfXxe0945rpgG3Z
 vQ4DV+58aFq9M9YXFwDV4tSFBbHDchjXFtDrb9tkB/nSZWYit4BxxjRXZqkf43X3ubwlp2QDyFD
 olR+Llo9jqXQdcsfG2X3Dezc0N3cloqEOpwp6LsQtHc7C2J1lGlhNQO3zPaFZJRVa9VLdYOsVjS
 tjen+dhFoePv9qfJvmyTzuxUCgXiBZkKFCcmOo3AuwZ8xriOjbt4/QzKXj0Wl4P2+NV5ZrDICzN
 kUetsAsJW+UxxXkc1nkIut6IOLWIT3SHUY+oqxjcNwc2GjhH8M0pIwWXCUV7uNVxmId5d4yesgC
 mgiYhD+cP5G9n+Lw3qK6b9WbtFyIXedD9WiEzEqkWijuWPlMkPm6EKZU61oIVeS4hTnmYrsDi3v
 Bk6olG1GDoHMHAVhzyZfhT/HQBICp9jJP90PkifVxLMK/94TgE98vyqEDoQece5J/s5rev95uM5
 Vrah7BuknDVh2HGzeZA==
X-Proofpoint-GUID: NU8jRuq2O4UjJIqHuuL2diAELjoFe_Bm
X-Authority-Analysis: v=2.4 cv=OtN/DS/t c=1 sm=1 tr=0 ts=6a6aa30a cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22 a=gAnH3GRIAAAA:8
 a=c585p9qd8l5BjXVnlE8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDAwNCBTYWx0ZWRfX1iCBZFYvDsUI
 5q8zcGp/ib7UHE5UYwP6WbTs3inZa7FXJcBpL1Tp5LJfL9T2nJKRiJepi8Blqh+G4FNCEETty9R
 VhZilhlRNLl9DaFEL7IgblngGov2EAiYR/ebqSmI1HpJl5E3MhRm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_09,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300004

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
 drivers/hwmon/pmbus/max20830.c | 65 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 64 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max20830.c
index cb2c23672166d641852199ca07eb716924f4f286..ddead72a8db5d6f8491cbfbf356db0f8de64da03 100644
--- a/drivers/hwmon/pmbus/max20830.c
+++ b/drivers/hwmon/pmbus/max20830.c
@@ -7,6 +7,7 @@
 
 #include <linux/errno.h>
 #include <linux/i2c.h>
+#include <linux/math64.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/string.h>
@@ -14,6 +15,56 @@
 
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
+ * Limit registers (VOUT_OV_WARN_LIMIT, VOUT_OV_FAULT_LIMIT, etc.) are not
+ * supported by this driver and return -ENODATA. This means sysfs attributes
+ * like in1_max, in1_crit, etc. will not be available. Only in1_input (the
+ * scaled output voltage) is supported.
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
+	u64 temp;
+
+	switch (reg) {
+	case PMBUS_READ_VOUT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		/* Apply voltage divider scaling if resistors are non-zero */
+		if (data->vout_rfb1 && data->vout_rfb2) {
+			temp = (u64)data->vout_rfb1 + (u64)data->vout_rfb2;
+			temp = DIV_ROUND_CLOSEST_ULL((u64)ret * temp, data->vout_rfb2);
+			ret = clamp_val(temp, 0, 0xFFFF);
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
@@ -24,13 +75,25 @@ static struct pmbus_driver_info max20830_info = {
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
@@ -78,7 +141,7 @@ static int max20830_probe(struct i2c_client *client)
 		return dev_err_probe(&client->dev, -ENODEV,
 				     "Unsupported device: '%s'\n", buf);
 
-	return pmbus_do_probe(client, &max20830_info);
+	return pmbus_do_probe(client, &data->info);
 }
 
 static const struct i2c_device_id max20830_id[] = {

-- 
2.34.1

