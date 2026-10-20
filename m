Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792496793;
	b=JbHi+zZR1Sm89b0OxiNWRnmp5wJW/CIQ49DX/iIUZD0cc14PR63pVfou2tlH0mCP5h/U
	 Q2umJ2crNwyfHthh+8RjZebVnaMvx7oO6Q2bgaSwRM2Y+dGuk88Y8AWqUMAvoU9GxzLxx
	 /Em89Al9/iaq9TnXhhvgeRgynVqivMQ/cVlOhOhuGU10LXuXDUiMhXn7E83ou2bsZJapE
	 2UCArynwunuy+XRb3aMjY2aNF8bHQuW4QKAiO0tYh+t1AcHVV2fT8J0FGGYajZsJbarqV
	 foXRcmYMABGkS5zKfHnMJ5+NU+j8q9z0jHaCh1Houf4Ivi6u5EncNsypZBmekH+q40Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792496793;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-ID:References:
	 In-Reply-To:To:CC:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ADIRuleOP-NewSCL:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=V7cOr8DJZt6f7JrBdiae6aqaP3RJJGcUCW8jFhPrCdU=;
	b=D9O+NeLtte0moIa7N7KKAHf6PdLtCSWWXmtEvta2GCMfXKLSDu8qi+YVXDqP8dwIUs3T
	 WoFlQzuml431rKK/39yEg0CJKMkhHyFs/hNSbpfl0CJ7PZ57bLBOXwYv4UaNRjlvt6bmJ
	 +fi86CDO7oIp5LZyWJsy57bczj0LTVHdjqVbd26K+rssjdqAf5YPKa6dcmmKblhOOfWas
	 RLHwQfDip9V0IxL85S5O0vwoRJh2eoWs2AGQqLQ1eDbp+uSfvZVnAmOk6IRJV9Sxqgv75
	 L+7bthkDo/zgtXuExVcIgs/53i7Lov26nUzzxQoHrKr2zvlMPQHGoujRRf+775x/pFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b="P4/kfA4p";
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=fpJ37qTn;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E72606A31E;
	Tue, 20 Oct 2026 11:46:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46E72606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=P4/kfA4p;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=fpJ37qTn
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAMc4a3783717;
	Tue, 20 Oct 2026 07:46:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=V7cOr8DJZt6f7JrBdiae6aqaP3RJJGcUCW8jFhPrCdU=; b=P4/kfA4
	pnFjOux7BpCFmX+EKI2BmngEdTlde7wDYGPD3OeuPMbYzXRDnViRq0JKF7crD0GZ
	qs3/fWeRwk5n7KIWl327Hwv3FJUZx8H/1sTNzONKkp/RNAhEEvUL0WNrYaPXrITs
	UHouvqFoe+jez+Efwba9AKTXah4im9uNMF//RbwOydbIew3otFHk3ZBXCajwIBfI
	mbUZwN5CtB2REMTjxo8jVbT2f5s4y0WaG8gS+uXnigJ8yveH9CV1xhXTSj8HSNPW
	v3nwzolay89wiq8kFras9/Kz2d9hG1+gqEQi6stm1Hu64gz3Xg1AUW08gCL94fYJ
	fz/jtTx73GfufKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=V7cOr
	8DJZt6f7JrBdiae6aqaP3RJJGcUCW8jFhPrCdU=; b=fpJ37qTnwcxRcNryMIjW/
	WbRk02ZJVLacnDsIGn53Syw3TswZxJifKhdUWmevIouO5F3DqZLH82Lgbaxj3F/P
	3D2Uu5685osau6WeQEEVYiE7Ne1XHVd9U0v5mbBwaEgjbwrT8IzSpaTORrSHtYS7
	jUktMoCTCKgWF6ogMyJd3bKE5/VrYst7y4VExz4pboQA0QGnGF21E6UfJkRdmHZm
	G8IAPIU0+kmz99Bf21VAUh+ZC8C7U/DYrRHoG96Fno+BPgwNn6Vd1pB0YcmL/Xfc
	AU8+TVXT886rfgUpKbA5vfOHtw1d+oyHGtXOi25RIhTTpSEfux7cxa5WHBHe79aL
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4hdw6aubf3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Oct 2026 07:46:06 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 69KBk5hS027452
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Oct 2026 07:46:05 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Tue, 20 Oct
 2026 07:46:04 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Tue, 20 Oct 2026 07:46:04 -0400
Received: from HYB-GHaNx595DZ2.ad.analog.com (HYB-GHaNx595DZ2.ad.analog.com [10.117.116.216])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 69KBjZVk012172;
	Tue, 20 Oct 2026 07:45:58 -0400
From: Christopher de Guzman <christopher.deguzman@analog.com>
Date: Tue, 20 Oct 2026 19:45:33 +0800
Subject: [PATCH 2/3] hwmon: (pmbus/ltc2978) Add support for LT7175 and
 LT7176P
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261020-upstream-lt7175-lt7176p-v1-2-86b9b728b95d@analog.com>
References: <20261020-upstream-lt7175-lt7176p-v1-0-86b9b728b95d@analog.com>
In-Reply-To: <20261020-upstream-lt7175-lt7176p-v1-0-86b9b728b95d@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan
	<skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Christopher de
 Guzman <christopher.deguzman@analog.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792496735; l=4252;
 i=christopher.deguzman@analog.com; s=20261020; h=from:subject:message-id;
 bh=DUa45SfCefgKdtIakuHkONeSfeipztXjYMpeuKa9MAc=;
 b=hOYkT40gXd1nu0Lhan8GblH2Nlzxwmv11FRYX5LMVIRyN1XmbbgiX3xFwltSD0YLEwC4yGZFY
 9Sp5yEXGs6YAxPtSsqpQmpYb396hD52it92b+wp7pqrwv5pk+MiJVgf
X-Developer-Key: i=christopher.deguzman@analog.com; a=ed25519;
 pk=nSwfp91RWULY/zCnrDkBvXulgnpfKy+5C6/Gh3ecLwo=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=D57SufRj c=1 sm=1 tr=0 ts=6ad7547e cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=gAnH3GRIAAAA:8
 a=mCLcJBGFyXiWd4D62foA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ng5yrFvMbkHS9HkXio2loQ6w-grkC7hr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0NiBTYWx0ZWRfX7WKmgtrZ2q8V
 dN2mD4oVa+yqT0aezUzO0ez7SDg+HTtWFiYGFaF++KF5a1+3teux9cxLcEq4+seGQ1VzMB8xOdV
 FT9S5TopCKSv7h717XZGgdXt1nASkYdm4Qnl08uyat9TMnm7/SR2F+EAn1bjfq7rycyq/zXqPuF
 rIxYx2uYinqcnrPIUkUW+N+SjfGwNwfgQClmRG8cc/eqelikeTwL/7fyS1/VRuT8BnAhctD++/W
 Nl7xMiyHTWTUOYiOQQ9Dm1FQRawsY3AS98vC2lO5HWWV7voKbi5hr6n3pGDZtrvmfGWXNXOLpTo
 duk7TZ4oLJYg2Y4gGWA7+V8RtJW/0GSvVP/Av1w+xEMt8gz9V1rKf/9tLymIBmtpAlLPKq/7E9W
 c3r8Vy8/dkYBVKMddZGvsoIGx/qrNhdMjF4RBCU07hfmlSKjfDMNWk3xOj+fb5jAaQ7sskjSw4J
 IDdiIRL0IpY3NmbxNZA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0NiBTYWx0ZWRfX//BnloTTVIRk
 hbHJ1OH1CG8PEAuM4UYPu9pD0op3977ych/UmZLMMN4U5i0UcnEoTGP0p5efqiqYVGFIV8MoCOq
 TlOD5oDEYLGXzymWPt2+9kOqpUYa+/Y3u3usW2Dcb9L3yI7HbCfN
X-Proofpoint-ORIG-GUID: ng5yrFvMbkHS9HkXio2loQ6w-grkC7hr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200046

Add support for LT7175/LT7175-1 and LT7176P/LT7176P-1 PMBus buck
regulators. These parts share the LT7170 family MFR_SPECIAL_ID
(0x1C1D masked to 0x1C10) and use the same PMBus register layout,
so they reuse the existing lt7170/lt7171 probe path. Variants are
distinguished by reading the PMBUS_IC_DEVICE_ID ASCII string.

Signed-off-by: Christopher de Guzman <christopher.deguzman@analog.com>
---
 drivers/hwmon/pmbus/Kconfig   |  6 +++---
 drivers/hwmon/pmbus/ltc2978.c | 28 +++++++++++++++++++++++++++-
 2 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index fd6641316454..63fb4d5dd87d 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -306,9 +306,9 @@ config SENSORS_LTC2978_REGULATOR
 	depends on SENSORS_LTC2978 && REGULATOR
 	help
 	  If you say yes here you get regulator support for Linear Technology
-	  LT7170, LT7171, LTC3880, LTC3883, LTC3884, LTC3886, LTC3887, LTC3889,
-	  LTC7841, LTC7880, LTM4644, LTM4673, LTM4675, LTM4676, LTM4677,
-	  LTM4678, LTM4680, LTM4686, and LTM4700.
+	  LT7170, LT7171, LT7175, LT7176P, LTC3880, LTC3883, LTC3884, LTC3886,
+	  LTC3887, LTC3889, LTC7841, LTC7880, LTM4644, LTM4673, LTM4675, LTM4676,
+	  LTM4677, LTM4678, LTM4680, LTM4686, and LTM4700.
 
 config SENSORS_LTC3815
 	tristate "Linear Technologies LTC3815"
diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
index aea7b6c93e74..a42cdc1fe124 100644
--- a/drivers/hwmon/pmbus/ltc2978.c
+++ b/drivers/hwmon/pmbus/ltc2978.c
@@ -23,7 +23,7 @@ enum chips {
 	/* Managers */
 	ltc2972, ltc2974, ltc2975, ltc2977, ltc2978, ltc2979, ltc2980,
 	/* Controllers */
-	lt7170, lt7171, ltc3880, ltc3882, ltc3883, ltc3884, ltc3886, ltc3887,
+	lt7170, lt7171, lt7175, lt7176p, ltc3880, ltc3882, ltc3883, ltc3884, ltc3886, ltc3887,
 	ltc3889, ltc7132, ltc7841, ltc7880,
 	/* Modules */
 	ltm2987, ltm4664, ltm4673, ltm4675, ltm4676, ltm4677, ltm4678, ltm4680,
@@ -540,6 +540,10 @@ static int ltc2978_write_word_data(struct i2c_client *client, int page,
 static const struct i2c_device_id ltc2978_id[] = {
 	{ .name = "lt7170", .driver_data = lt7170 },
 	{ .name = "lt7171", .driver_data = lt7171 },
+	{ .name = "lt7175", .driver_data = lt7175 },
+	{ .name = "lt7175-1", .driver_data = lt7175 },
+	{ .name = "lt7176p", .driver_data = lt7176p },
+	{ .name = "lt7176p-1", .driver_data = lt7176p },
 	{ .name = "ltc2972", .driver_data = ltc2972 },
 	{ .name = "ltc2974", .driver_data = ltc2974 },
 	{ .name = "ltc2975", .driver_data = ltc2975 },
@@ -645,6 +649,10 @@ static int ltc2978_get_id(struct i2c_client *client)
 			return lt7170;
 		if (!strncmp(buf, "LT7171", 6))
 			return lt7171;
+		if (!strncmp(buf, "LT7175", 6))
+			return lt7175;
+		if (!strncmp(buf, "LT7176P", 7))
+			return lt7176p;
 
 		return -ENODEV;
 	}
@@ -774,6 +782,20 @@ static int ltc2978_probe(struct i2c_client *client)
 		  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
 		  | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
 		break;
+	case lt7175:
+	case lt7176p:
+		data->features |= FEAT_CLEAR_PEAKS | FEAT_NEEDS_POLLING;
+		info->read_word_data = ltc3883_read_word_data;
+		info->pages = LTC3883_NUM_PAGES;
+		info->format[PSC_VOLTAGE_IN] = ieee754;
+		info->format[PSC_VOLTAGE_OUT] = ieee754;
+		info->format[PSC_CURRENT_OUT] = ieee754;
+		info->format[PSC_TEMPERATURE] = ieee754;
+		info->func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
+		  | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+		  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
+		  | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
+		break;
 	case ltc2972:
 		info->read_word_data = ltc2975_read_word_data;
 		info->pages = LTC2972_NUM_PAGES;
@@ -962,6 +984,10 @@ static int ltc2978_probe(struct i2c_client *client)
 static const struct of_device_id ltc2978_of_match[] = {
 	{ .compatible = "lltc,lt7170" },
 	{ .compatible = "lltc,lt7171" },
+	{ .compatible = "lltc,lt7175" },
+	{ .compatible = "lltc,lt7175-1" },
+	{ .compatible = "lltc,lt7176p" },
+	{ .compatible = "lltc,lt7176p-1" },
 	{ .compatible = "lltc,ltc2972" },
 	{ .compatible = "lltc,ltc2974" },
 	{ .compatible = "lltc,ltc2975" },

-- 
2.43.0

