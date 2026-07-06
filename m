Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F9237C912;
	Mon,  6 Jul 2026 02:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783303781; cv=none; b=OUZR/75YLbcjQ3bCe9NwhWNyQtV8uIdS5vDTVdr/LpVyLLbNINVvq92fx0dDL8ljwXdhd7J3V26UIa92c7Vt1NfxV4KORrwZJHnEdOoHh/GR4V8/6dxtNvMkpEV+UCEaJ8kjMsQbnb9fONkVtZzuEjDWF14MyG7EM6AUqYWxaSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783303781; c=relaxed/simple;
	bh=hky9C2D6iGGEVKf2veReFUr/Y8MLbhh9YrnYkyhMtl0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=cbSK9gdudHm8AzaXR1Z1N87Si14U8w0CvExin6WhRsovKDAQQDhVEwzw3g8UKFpNB6O5WzCR6VbXSLHiqAqJVZq9ontPMOMB7/4FvfldxvRffWEVBAWYu7qN2dtoA8i43UJg3DXqJb/EKNOVwLaiTL3nCqlueU3SJtE0R1Jd+Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=xT+248JX; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="xT+248JX"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665M4Kul3211626;
	Sun, 5 Jul 2026 22:09:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=ZNJND
	NAEzdg22PNppNhgGEvDLwkQA8n8edWUkZAztTk=; b=xT+248JXT4pADbmjiaSPe
	NPx6fsg7dI7yRLLzzcfMki2a4wDNR+U0OKznJUI+kis/a1m1yvirTgJ2d1hRJ+ER
	LmsfRh2/tlhjOO/xgwzpAmdC/hUObyrx1oPajViaDMfjr8J/I5l7DFccVTUXeUk1
	95z4fba4rn44D+ifcDo58dXBjs3sPprVbjsmWJ9ddNlke+v5MtExqnDrqBYeKSjs
	AtQJGk5f74AijhCnZT9D/eVH5Wc3I/rzuculG5AGvJjUYaVhMePqKqTAUj+QIvzR
	507ChzcwEStH9Zh1iH3nQNsGKJt1ViUAeaLhhOq1xWpo1CrGtdrZHshni0oRp3NM
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4f7kgf9uvk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 05 Jul 2026 22:09:17 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 66629G8D045190
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 5 Jul 2026 22:09:16 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Sun, 5 Jul
 2026 22:09:16 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Sun, 5 Jul 2026 22:09:16 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.191])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 66628o7S015791;
	Sun, 5 Jul 2026 22:09:11 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Mon, 6 Jul 2026 10:08:43 +0800
Subject: [PATCH v2 3/5] hwmon: (pmbus/max20830): add VOUT feedback resistor
 scaling support
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260706-dev-max20830c-v2-3-37761e89bb5f@analog.com>
References: <20260706-dev-max20830c-v2-0-37761e89bb5f@analog.com>
In-Reply-To: <20260706-dev-max20830c-v2-0-37761e89bb5f@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Alexis Czezar
 Torreno <alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783303730; l=3855;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=hky9C2D6iGGEVKf2veReFUr/Y8MLbhh9YrnYkyhMtl0=;
 b=EDs1LzupOUPEICbA8KJWmERSOUczn9wrcadkRcIZj3zU/t1ot8XxzOS8Vx8xMo27IyMjOqxrm
 HiAApQH9fYrBXdZioE00Jw68fK2TD9677ZjDgvfwWVGiGiCqExi574x
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: _YqK6oE8GhAT2meiIhb1mApjW90yMrRp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDAxOSBTYWx0ZWRfX8ODDsQPL9id3
 eYdt18NyP0qq6+FE+D0kPYSoK8DkWAitvDK5bN7rIB8JAGCDiDR3A7eILY/M7Ri8FtovGLdsH/X
 2kkc5PpAqNhxp0W6Uaa0UdYaZDCjiC2ZOn0XcuqJdiZlPGePds4wFXyTz3WayBwDln/xbK3d3oy
 s0YxLLNWK7gPz5n7PTmw+PFxLzu5EV+4R5yXz7MUfvd0wr/DUFarlGopcAbcyhEgk0S9O5DEL2r
 2SNOZ3gIvtH/+Jezg3g2LGSm/zCzRXvyOQwF9TAD1+db3HUYkXjb8YB5Lx/QtZyffEHsb/Lup+P
 uhyGCBtzKBKAvGponCk/3arvbGWoT5/IEs1SL3RaaGXyMIbVwcD4yulcYqv6qjS6UTSOPfNOL4P
 Vn1OIxwi0nV0V66vTqZEiTEyPK+PRoja9tbkWBhTSmQwp2WTa6+mq9CosMAz5D17ky8OQ0S7Wf5
 ICyCFGKBkfWWN8ggY/Q==
X-Authority-Analysis: v=2.4 cv=SebHsPRu c=1 sm=1 tr=0 ts=6a4b0e4d cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=gAnH3GRIAAAA:8
 a=_8IsL081WaPWLXqRiQAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDAxOSBTYWx0ZWRfX4ymVSLOObUv5
 RMrtPRF7qoUjHR4+7nkK8PiH9xGSCnPJsJ/Ramj2ZouEwAsw9JVC5iOa6MmBDurtOcssOsAQ+2G
 BX5CKrNBFJDIqqlopoQUmhQ5RumTt+XVpMwZpTSZaVRuZ+o07v/w
X-Proofpoint-ORIG-GUID: _YqK6oE8GhAT2meiIhb1mApjW90yMrRp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060019

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
 drivers/hwmon/pmbus/max20830.c | 54 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max20830.c
index cb2c23672166d641852199ca07eb716924f4f286..5aad4448054fc55bb0a87920d89f96bc28fda072 100644
--- a/drivers/hwmon/pmbus/max20830.c
+++ b/drivers/hwmon/pmbus/max20830.c
@@ -7,6 +7,7 @@
 
 #include <linux/errno.h>
 #include <linux/i2c.h>
+#include <linux/math64.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/string.h>
@@ -14,6 +15,45 @@
 
 #define MAX20830_IC_DEVICE_ID_LENGTH	9
 
+struct max20830_data {
+	struct pmbus_driver_info info;
+	u32 vout_rfb1;
+	u32 vout_rfb2;
+};
+
+/*
+ * Driver currently only supports READ_VOUT for monitoring that needs scaling to
+ * convert from feedback voltage to actual output voltage.
+ *
+ * vout_actual = vout_fb × (1 + RFB1/RFB2)
+ *
+ * VOUT_COMMAND and VOUT_MAX are currently not in use, but work with feedback
+ * voltage. If regulator support is added, VOUT_COMMAND values would need
+ * to be adjusted accordingly.
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
+		if (data->vout_rfb1 && data->vout_rfb2)
+			ret = DIV_ROUND_CLOSEST_ULL((u64)ret * (data->vout_rfb1 +
+						    data->vout_rfb2), data->vout_rfb2);
+		return ret;
+	default:
+		return -ENODATA;
+	}
+}
+
 static struct pmbus_driver_info max20830_info = {
 	.pages = 1,
 	.format[PSC_VOLTAGE_IN] = linear,
@@ -24,13 +64,25 @@ static struct pmbus_driver_info max20830_info = {
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
@@ -78,7 +130,7 @@ static int max20830_probe(struct i2c_client *client)
 		return dev_err_probe(&client->dev, -ENODEV,
 				     "Unsupported device: '%s'\n", buf);
 
-	return pmbus_do_probe(client, &max20830_info);
+	return pmbus_do_probe(client, &data->info);
 }
 
 static const struct i2c_device_id max20830_id[] = {

-- 
2.34.1

