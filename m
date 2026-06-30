Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486B43C2BA3;
	Tue, 30 Jun 2026 02:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782787658; cv=none; b=caLIUu98+zIcOgNURHfX3iT1q2ViXXqBYvHCQ/JUky4NIEJdz5EkRy26aFE341V8QjD2K7ytlhCHWcjI/i2hvf7XN2rq+ZXwSb54CV05i99QpKv55g0NiuwMimOWsIzeCyM3IboOmRe0W37qO5dMaJour203Zb5opip1wAouRd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782787658; c=relaxed/simple;
	bh=f9oNKMFaLUsKSvsWwcjf/TtW8SwoVUzXhsa4vp5q5PA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=fcDXiGXOeGnU3YiEObtPkxombLQPDY2JmOuyVjg7KiDcWSlyFdMMdHDTqMucMa5LnWeeQM+Sz3ALNiYbgklz8M3xInjylPdQqcLbe5VW1LxA26u34Wg3eVjpj1hKT1g0LOOJh6JFrbkcjMZfFoTHE8WqbYDnlVd9yIBUs4vC15Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=JRr0R3cc; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="JRr0R3cc"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U1GTB03610921;
	Mon, 29 Jun 2026 22:47:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=uwKEJ
	moz2JtivendGL4DWhq1/VMf7SE0kDTiKxxo/ig=; b=JRr0R3cc9csjqDOQ+B4KO
	JDqL3xBI4B921QDIYwrN5iE7sBoCKM73L+Ib0X5/27OLvPc3pcSdKZaVkMfDxseR
	DVosIR6eX+i/g0Rkd1FbPeXQAPr/KvSfR7BSgxeXAjsUts0hJTsyKjuezHBxAXtL
	cergdBbJu/fa7XABzf5+ZB+woGtwKgRmP445eis0h+T/aBRXZLS04si6cnM7DfIa
	e1fRppzUaP92Qupj90JT77kjJ0yGIiOmKE4wbO4i1EjmgecynhiZYnHCgdczTEkQ
	Ya/8ZeseOVN1FtYxbWxwlCWOtk90Oj3pAGpPoPtZPS5I9+FZV8ef/h4qAmyPRHe3
	Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4f3u1mte52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 22:47:23 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 65U2lMqj033004
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 29 Jun 2026 22:47:22 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Mon, 29 Jun
 2026 22:47:22 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 29 Jun 2026 22:47:22 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.193])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 65U2kqhh019448;
	Mon, 29 Jun 2026 22:47:15 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Tue, 30 Jun 2026 10:46:46 +0800
Subject: [PATCH 4/6] hwmon: (pmbus/max20830): add VOUT feedback resistor
 scaling support
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260630-dev-max20830c-v1-4-a02786bde470@analog.com>
References: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
In-Reply-To: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Alexis Czezar
 Torreno <alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782787612; l=3163;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=f9oNKMFaLUsKSvsWwcjf/TtW8SwoVUzXhsa4vp5q5PA=;
 b=QwLwFOhRyxOPwh0gPmZXdCbK0o2M6X32FPyb7cyo9nhy5vQt4TVQID+et4iBALwJG3QjAue4d
 jQZdki2qmQbAQmIZn1Z1NlnDBrOpJWeevmKqSKwl8oTc1u538PBXrZ/
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: 6hX4SFapJbOfZKaAtBNN06TZZYKzEBrW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDAyNCBTYWx0ZWRfX8MFkDursTnRJ
 /UnAlSVNZZtYRLVe/2U/hMY714My0ZG6bjjRoxBupUAlVC1uqzTEiehPF8MaE616LZeP96FNCg6
 D5oTkyaihnV9aIElenvQrWcEXKhVZ3j57LtYg2ioofwVcuOg2jhKt//p1SFwdhoESkmuck1kT3L
 pFkMqmV56p+mxEOD1Sbh69cb+IUjpUl+3yh61R4tl+midMLHf3LjHwwMBOk+zcxtLPRd1bMowBG
 JVVEXwmpNh4q7/CvzosZxmzh7S/VULf+I+Fij19CS/FJWo7dOczu0ohu2DzIYWLsYRY2pJDVIkq
 rApLJtOhfvLguUsyxtwnPOYqh4D+XZ7t1H2Z4UREnaSF9cR+tcH/jsQgMZ5mKxctrQh5+GPVjAa
 X0uQYmQJYW3O1i9L46tWk49zc//9/yI62slusQMg2GVobbkxKbtuGE9rm6GKgd90yd5CvIdRvlA
 LEWEmIBDHOP4MmARQww==
X-Proofpoint-GUID: 6hX4SFapJbOfZKaAtBNN06TZZYKzEBrW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDAyNCBTYWx0ZWRfX+ouBakEiOjbZ
 ZP93TVkIhZhuFD5yIlf16eyteJpZmHw93+uDCAi1E4KobkOEY/YGDmjqL417Lm9yStVm/S6nYrx
 wz4f6eaijKQ37CgK8wHgwRuAWXFCVzRKP/7sky5wqk0MVgrecBCR
X-Authority-Analysis: v=2.4 cv=R8cz39RX c=1 sm=1 tr=0 ts=6a432e3b cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=gAnH3GRIAAAA:8
 a=zpM2bklHJMWzOH9SUnQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015
 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300024

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
 drivers/hwmon/pmbus/max20830.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max20830.c
index cb3a39d747edee3aefb0fb4051ef957436b3c15b..a3abd24437e8e7560264aad55fc4f456d30ae235 100644
--- a/drivers/hwmon/pmbus/max20830.c
+++ b/drivers/hwmon/pmbus/max20830.c
@@ -8,6 +8,7 @@
 #include <linux/errno.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
+#include <linux/math64.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/string.h>
@@ -15,6 +16,35 @@
 
 #define MAX20830_IC_DEVICE_ID_LENGTH	9
 
+struct max20830_data {
+	struct pmbus_driver_info info;
+	u32 vout_rfb1;
+	u32 vout_rfb2;
+};
+
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
@@ -25,14 +55,26 @@ static struct pmbus_driver_info max20830_info = {
 		PMBUS_HAVE_TEMP |
 		PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT |
 		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
+	.read_word_data = max20830_read_word_data,
 };
 
 static int max20830_probe(struct i2c_client *client)
 {
 	u8 buf[I2C_SMBUS_BLOCK_MAX + 1] = {};
+	struct max20830_data *data;
 	struct gpio_desc *enable_gpio;
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
 	enable_gpio = devm_gpiod_get_optional(&client->dev, "enable", GPIOD_OUT_HIGH);
 	if (IS_ERR(enable_gpio))
 		return dev_err_probe(&client->dev, PTR_ERR(enable_gpio),

-- 
2.34.1

