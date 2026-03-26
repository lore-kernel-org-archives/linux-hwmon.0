Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9372332A3FD
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Mar 2026 09:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517412; cv=none; b=Zfc4a0yTpRl0JCFp+uTLznH0JPzxZPSGkm3zFnkWSnW+CkEraAeQMgoeGi4Wr6kZ4/SbGznogsTSH+0WZRArd0qXp4q8MO273OBXwu7POcMmWDQ/EvqOX88QU26z3IZOaF5aSdq5o0eZIcK2HWBMFdUGgoOn/jU5Ys02kbZhAlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517412; c=relaxed/simple;
	bh=W2C1x++8XBe30WtRd6vJrJyhhKrIKxhyMgSBLww+uw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DUmfPL2vR0mNIrttWhMROb95cClQaiQEsFSofdubWfngCL2VQEJaoyeIF9sU8KcZ8WbEpTkmJ5dWmB6bIJs5LBWORKHSKaJMBxflexPbIZn7XZCAbv7CMCJqlNWR/HsD9e6HjikcFuM2sP6flWZOY8HfPRQ7LMf7/8NPLk0SXRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ahE75IST; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q1fOHqwk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ahE75IST";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q1fOHqwk"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q3a07Q4015126
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Mar 2026 09:30:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vvx5blX5bqLSk3PHmE+r7s
	sYlFA8s69Dv8FLw4lsIBg=; b=ahE75ISTE+qITyXyXpnbVZxtgltVxoNIfhV6gj
	E8Um7RVDncckvmP9/Uk82pge0JzpPV/PttwNU5lffTqy/n9o+jG+lPDagiQbmwC6
	SmMENz0854Kf/vsP52HPE9fsYxE9leFQ7LDq9x3hYUllmrI/2gWxDXu/kN9gYeHM
	KQUyVhAFAL+eAbfxyBCNu7E7RulwM1nTuQu2GuC+omCFGsIHbE+nmIRxgwI4LYGY
	Hfmr3Dr9jdFbSJ9uVbfBVVgFWAsCNDa0v3VMxuB8UaZzoQ9Bkf/wd5gwfn8rSlOC
	6PQ9zeHQjjH0Ti1FdYZPO1nIxBJyuR2W05rzo1DMAPnZK5qw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4w1q94f8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Mar 2026 09:30:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509070bda13so52586831cf.1
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Mar 2026 02:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774517410; x=1775122210; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vvx5blX5bqLSk3PHmE+r7ssYlFA8s69Dv8FLw4lsIBg=;
        b=Q1fOHqwkmsagXSdYjw5gg4+M32IlOa3JZjR27ssT02cq/CpC7wjW6R0pfPRDRjv7Pr
         jLxwoRm71512y3sDOjeRKXa/Ct0pvUK96FxLeQiUUwXnbPD/ths5A2u4JdMUHQnmv73K
         NcvA7AkTCFYZtGZQm+KhCmoCErw27xv9zHn7A4mgRoFK0WTP9KZXLfw0etKBPzgHW7PA
         kdMkyBHasiYdjS7Yt/UqSm/LiWtPJuoGL9SFmzp0bkWQ6gUV4xd2T91byEGD8pXi3lZM
         GyZMyq+LegAyiwApB1M2l++0eLXp8r/r2fwUnkY+8N8JGqc52xIRYq80BKUeReLm7rCe
         RcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774517410; x=1775122210;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vvx5blX5bqLSk3PHmE+r7ssYlFA8s69Dv8FLw4lsIBg=;
        b=o4MhPUpHZGcOxSxfbrUfeTnsmR6cls/y1kcfXESI5VuQQqwgcgAPfvZ3wJWlU5l55I
         lInsRGet9mH3wejyakD744IteMOnMQ+hUDsqG1ZwN5R5IjA/8IafNv/2G2evY8f2U10d
         z8h/FS9nHGTbgDXJHzWMs3uzvgBhxf5vF9LfDQDC7w3XCcFI3rWDwJrbCJovKZixU7fw
         QLOajbN3FbfNxhaWTA0FaV6W3mBQBl5Q1LW5eivVQyPX9gItA9pimuaCGh13+beJaaAJ
         R6PrGwMk2L+x98RNssmx7qGHPWPeHSlsIveZ9qI+Syd87Df0WRftmxxeFUKTnjhcaS6Q
         OShQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPQwPu5A021Smb+3KqgNzCDjj5Rl3HSMPGG6pLKi8Gs3P9gLG3QkzuPA/+XT+4cR7o5Yc9j2LO1tJdPw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+k+aizOOFUfYhOX0xYpOcnkS7oWM5iKmDZ6SNgJAxSf3kErMV
	ChHqSLk84P80Dhk6WlDfRzj9XnhMxTg87v5FQRASdFyuMfdhrOUnLrkI25Mv4hG1RC1DUhvS0Oy
	oV4Ch0L6bHLAYT5g9xRBD9mmD4727EUsOA6FtVOtUsIKJj1j7KyC0dMVlHIC9b2HlSQ==
X-Gm-Gg: ATEYQzyvH2n3fhVD+mGwQ66xuLhIWVz+zqgwSQZDN0OCJA4gaS/PG2EvroeSQPJRZ0q
	8Lf+62iA/QU6UuCPOCoBCn0Fk34KA3XwopJjTnOxoHC1HsGJGwj6evXnn9mZiBezq+ePS8vmrGd
	GEZ7s2L06CUcRggl02+gY2YGevC2YwH6CxqXSLoRkP9jgb46/U8X9d8nqEWn45d6b5XrS1N4Cag
	fIk/t4JgvPXBPEjFCaSLqX2w6Nyw45S4rh6PlMvUXYhnGBCREzu8WBJYsxKAGEFFL8qucoTU/+p
	7kI6BXxagcGhmr5qn0h+dEBG641M+FllIAWzpbwdTlL02q/74SvWrfxL0c431ZPAc0jDnhNGTsM
	3Igl9+igHPj0jzwxNkD44s90hDpAyCyz697YHccGqXZxbopU1K/pY
X-Received: by 2002:a05:622a:1444:b0:509:2231:977a with SMTP id d75a77b69052e-50b994fa036mr6991251cf.30.1774517409682;
        Thu, 26 Mar 2026 02:30:09 -0700 (PDT)
X-Received: by 2002:a05:622a:1444:b0:509:2231:977a with SMTP id d75a77b69052e-50b994fa036mr6990901cf.30.1774517409196;
        Thu, 26 Mar 2026 02:30:09 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:92a5:ac13:cd81:9625])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c95041sm17521895e9.6.2026.03.26.02.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:30:08 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:30:00 +0100
Subject: [PATCH] hwmon: (ina2xx) drop unused platform data
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-drop-ina2xx-pdata-v1-1-c159437bb2df@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJf8xGkC/x3MMQqAMAxA0atIZgM2QoteRRyCjZqlLa1IQby7x
 fEN/z9QJKsUmLsHstxaNIYG03ewnRwOQfXNQAPZYSSLPseEGphqxeT5YjTWbd7R5BwztC5l2bX
 +z2V93w+G/Ls3YwAAAA==
X-Change-ID: 20260326-drop-ina2xx-pdata-167cd72977aa
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>
Cc: brgl@kernel.org, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-iio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3617;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=W2C1x++8XBe30WtRd6vJrJyhhKrIKxhyMgSBLww+uw0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpxPyasN1ep6CO5ixvVDwZhErKffNWeBaLoHjwQ
 r+Pvw83vB+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacT8mgAKCRAFnS7L/zaE
 ww2QD/9P5p15ZuWOfmngxTgszdXdsGjAHX3Dhp9IUQSyTwZauFlJ1n8kvwEK1pdyrAdEuBlg0oW
 +DI9efeHq0+7Td2AVkKwRj6ezgyiPL0hT+cd3M9uxjDg5JNdDSQYq1mOWLM7ZGlJq1WxRa+04wP
 1EoT093xCegpalWR57o3+ooB/arMr9k1CvrUpwi62m4R5qR7trc3Yp8q/PL+sp4Oov2Aosn3p+s
 YflqLigrkKY6If/Z/e/iHuN802Uii6vR/O52NPrRY9crpHvGQNt2yG6CP7/v9CXpefGac5evIrU
 /rH12iwojwODikUYMc3Lo98+J45p1IlHZ5WZwClibACdvT2NLZTrzl0m4VtEuBqXRDrWateiBuX
 H+0rAV+fiVFdXe47A3IgmiwFACvxVQEd9XLXZMyW7nI3crisjT/ANWWiTlwSXCtyCsfKSj1CZiT
 72XBiQERgIwH60azJ2iAjXCI/l7g/Jwh/D9Xg8N+Kn4Z5LzZeGdvq9lK2J01RlBFN1Pep89KiaR
 NrEzsjwgBIRTFYRDlsVYkNrs4KK0a+u8pDpbEot/vevXwmuQb0ba7tf7CVF2vbY2aPabJVFpHlv
 BsnZtmoXyZ8D2kwAmqFvX+/7ObPT1Ts2jT9F5yEW4J8abQHt2DHuMe0ppIOLvl3sV5aQlicJEvX
 ykDt3QfKK79k1qQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: OwdWCHdWFdPzUU-ocE16SCYvFq0ve9Yn
X-Authority-Analysis: v=2.4 cv=HvV72kTS c=1 sm=1 tr=0 ts=69c4fca2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=iPG-_ETWnEHzmfTtMD8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2OCBTYWx0ZWRfX3abqrny2o5DM
 k9ll19hXyNFybMs7/3wY16YdreG0d84RzMtflqxOX24wwjccR/R7e/AciiwdHCfo9JoLXcbHb6o
 kC/DZO/gjKIgEiSEhJdHfH5fTlnLe/KdQX2WNFGSM2A0O+Iq++f2f1glJRKKzrK2QpfIhvKIg9/
 cn1XLOrn25gl+VgRQg59GxcAqzUqLyqoCo89q+8XkPazHOLYQH9khbvblKSVOFVpskpT+X+9smY
 pGmxB60GMjBZu3xbEfPkVG/vXW+4HuhwtG7U8vzNu90R/UK/wZs39HQK1UIB8D6jqExmIgwUvin
 4tfjeKu1CHKYQGw4mhiKn6z3sxxXZH2YvYKS+2QzOUS5rQWLduLEdBp+hAfpbomgOYleeXJWBQw
 F1Jx/xoT+hUx2efAl+oV7UJNDcsA/MxjTAuCFdviFH8B/SJwrzMR6YYJ3z+kCjYu0HoTFXImYGW
 AuFtarwGZNmQ4q9Viwg==
X-Proofpoint-GUID: OwdWCHdWFdPzUU-ocE16SCYvFq0ve9Yn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260068

Nobody defines struct ina2xx_platform_data. Remove platform data support
from the drivers which still have it (it's effectively dead code) and
remove the header.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/hwmon/ina209.c               |  9 +--------
 drivers/iio/adc/ina2xx-adc.c         | 14 ++------------
 include/linux/platform_data/ina2xx.h | 16 ----------------
 3 files changed, 3 insertions(+), 36 deletions(-)

diff --git a/drivers/hwmon/ina209.c b/drivers/hwmon/ina209.c
index bd7b3380d847af4439327f0753745fd832e3e22c..eec529e26d6912ad39924420b4c23d2cb91cc81d 100644
--- a/drivers/hwmon/ina209.c
+++ b/drivers/hwmon/ina209.c
@@ -27,8 +27,6 @@
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 
-#include <linux/platform_data/ina2xx.h>
-
 /* register definitions */
 #define INA209_CONFIGURATION		0x00
 #define INA209_STATUS			0x01
@@ -487,7 +485,6 @@ static void ina209_restore_conf(struct i2c_client *client,
 static int ina209_init_client(struct i2c_client *client,
 			      struct ina209_data *data)
 {
-	struct ina2xx_platform_data *pdata = dev_get_platdata(&client->dev);
 	u32 shunt;
 	int reg;
 
@@ -501,11 +498,7 @@ static int ina209_init_client(struct i2c_client *client,
 		return reg;
 	data->config_orig = reg;
 
-	if (pdata) {
-		if (pdata->shunt_uohms <= 0)
-			return -EINVAL;
-		shunt = pdata->shunt_uohms;
-	} else if (!of_property_read_u32(client->dev.of_node, "shunt-resistor",
+	if (!of_property_read_u32(client->dev.of_node, "shunt-resistor",
 					 &shunt)) {
 		if (shunt == 0)
 			return -EINVAL;
diff --git a/drivers/iio/adc/ina2xx-adc.c b/drivers/iio/adc/ina2xx-adc.c
index 857e1b69d6cd4d65d7ebe5de222fe92875eccdcc..c6cded508738f95e5001ebd276edfa07890e217c 100644
--- a/drivers/iio/adc/ina2xx-adc.c
+++ b/drivers/iio/adc/ina2xx-adc.c
@@ -33,8 +33,6 @@
 #include <linux/sched/task.h>
 #include <linux/util_macros.h>
 
-#include <linux/platform_data/ina2xx.h>
-
 /* INA2XX registers definition */
 #define INA2XX_CONFIG                   0x00
 #define INA2XX_SHUNT_VOLTAGE            0x01	/* readonly */
@@ -980,16 +978,8 @@ static int ina2xx_probe(struct i2c_client *client)
 
 	mutex_init(&chip->state_lock);
 
-	if (of_property_read_u32(client->dev.of_node,
-				 "shunt-resistor", &val) < 0) {
-		struct ina2xx_platform_data *pdata =
-		    dev_get_platdata(&client->dev);
-
-		if (pdata)
-			val = pdata->shunt_uohms;
-		else
-			val = INA2XX_RSHUNT_DEFAULT;
-	}
+	if (of_property_read_u32(client->dev.of_node, "shunt-resistor", &val) < 0)
+		val = INA2XX_RSHUNT_DEFAULT;
 
 	ret = set_shunt_resistor(chip, val);
 	if (ret)
diff --git a/include/linux/platform_data/ina2xx.h b/include/linux/platform_data/ina2xx.h
deleted file mode 100644
index 2aa5ee9a90507e8233bde3cb9be257dda23cd52c..0000000000000000000000000000000000000000
--- a/include/linux/platform_data/ina2xx.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Driver for Texas Instruments INA219, INA226 power monitor chips
- *
- * Copyright (C) 2012 Lothar Felten <lothar.felten@gmail.com>
- *
- * For further information, see the Documentation/hwmon/ina2xx.rst file.
- */
-
-/**
- * struct ina2xx_platform_data - ina2xx info
- * @shunt_uohms		shunt resistance in microohms
- */
-struct ina2xx_platform_data {
-	long shunt_uohms;
-};

---
base-commit: 66ba480978ce390e631e870b740a3406e3eb6b01
change-id: 20260326-drop-ina2xx-pdata-167cd72977aa

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

