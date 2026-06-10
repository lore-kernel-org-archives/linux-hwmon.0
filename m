Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59817228CB0;
	Wed, 10 Jun 2026 01:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781053973; cv=none; b=S73mbmmGh/C3ODRo5worUr3LQ7OfgexFa9OxPwwXQrbY74BLSK5WQN7LBhBClVqCGVeI+McFq0jd93a7ClJ57sjRgY/hzLMGtu4CoyVYRbc0HhztZv10F6zUiLbTU3a5mextEYPG64PkJoJ1tC70XPpkeHEw1Dg1r4OBxek8BYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781053973; c=relaxed/simple;
	bh=Asra0aRUb0zkCUbqooVGRMOPldhALPzPOSRDZWlvaDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=kLl3IRESzyZuXOgzV0If7E4vj9OXj1WimEZ2uw5eXSrCMVYUbT3EjYwSh8potLQsyBCgG76p4u6JX3trm49OC4CB62twIM7bwW620cwnw4YtWBKGWk0gcr3gOzP9eL24XWI4PZBj4IOnOrLzAHJQpCKYGK3qv0r88hMkpjnXyCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=l4isXqaT; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="l4isXqaT"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659L5wCR1479997;
	Tue, 9 Jun 2026 21:12:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=i3idTXsdjjYm0HwICSAv4iTjBi9
	FOgXyw76fQE3S/eU=; b=l4isXqaTye4RcYXR2EoHtjpUcxCdqkELhVIUWJUld+A
	bJBGJ4e06ErYNSnszm4YGsC9KfQbpaAFgNMKEBnkWf3FHolJYNcyqrJ62hXkboRk
	l10DDSTzbq6s+y+Qe1g7Wj6YyvMcC223jZSfLfLVx3eGVUlQDL6G9hAXG0TSF8iH
	unEC5ZaKghWWrT9N0EDVMSyTSiQEuLMF2UDjKvqcrP8ytj+XwnqkWSeSH4LMGeY9
	5Ba33NGh1ioEJ7Zv7rpQJpBaD+Y8hvaeD7+wHNP/SQAofz7eDSHuUDR9ub3G+W5a
	pA1pxrakj0bXu3FVgtAEjfUPLmJccKF5Z9o6DrHTaRA==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4enstm8wx5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jun 2026 21:12:34 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 65A1CXJT004560
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 9 Jun 2026 21:12:33 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Tue, 9 Jun
 2026 21:12:32 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Tue, 9 Jun 2026 21:12:32 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.192])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 65A1CJIM028095;
	Tue, 9 Jun 2026 21:12:22 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Wed, 10 Jun 2026 09:12:10 +0800
Subject: [PATCH] hwmon: (pmbus/max34440): add support adpm12250
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260610-dev-adpm12250-v1-1-422760bb80da@analog.com>
X-B4-Tracking: v=1; b=H4sIAOm5KGoC/x3MQQqAIBBA0avIrBN0KImuEi1kHGsWmShIEN09a
 fkW/z9QuQhXWNQDhZtUuVKHHRTQ4dPOWkI3oEFnnDU6cNM+5NMiTkaPxC7STDN6gt7kwlHu/7d
 u7/sBwwxxYl8AAAA=
X-Change-ID: 20260610-dev-adpm12250-4ce6fc8c82ac
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781053939; l=7279;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=Asra0aRUb0zkCUbqooVGRMOPldhALPzPOSRDZWlvaDY=;
 b=jJc/y/lUgQWjOIfVVwNXMKzHCeYB2qO1j3WtJKU4WXSIyfKzt9kUnUVLuFwR9EgslRsOr/9Eq
 oF1iI6NmXLfBnZsxBGg2FkTqfcntUbwNON1E8moSEf0h75DIulBaSoU
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDAwOSBTYWx0ZWRfX94cMLnKH6jqG
 JRDPiQzdGZk22zDs9uD+5pTXsISwHXHlHsmJkZ0onDGTYKw/fokiFdOkY3gRQzlSq+LWtY6MPgC
 Fps8AbkGMN8nJSSyD4i6Eo3t+DRgY63y2GFbz3fLSzGDyg7rxXHNNItVkxqXhfmcUPZkfdI4NQb
 Vlld6oSG7l2EiGhd2u5FBJMeFVs6fIVY5zpXV6mw+MMps8h67amsCxJDksgInc/3x6tgDL5YHSg
 HnXEBFftimjuDErpJf65crAhG2ttUU9vF/EqVK9tO1bfRRK+frfGD6VSwwxpOTp8FIEu0RWonyK
 KIsajswk+SE4B2z1/wsamOfW4MchDcoZkwlCPGpYK9vpP7j0oM6ZPY+qqWlLScECzi/KQaNW0nP
 1rHPzsbJTI5BsQ73S8O4CisUs4rdww89s5v9heVI+y5dG68XeB8YXjqpSUB3cSaD4QTzcxWTKZu
 eB/92X+p5fWm0uc2g7w==
X-Proofpoint-GUID: -S0RkQ6Q908dWhS1aD0CQQXFZzH3CtKo
X-Proofpoint-ORIG-GUID: -S0RkQ6Q908dWhS1aD0CQQXFZzH3CtKo
X-Authority-Analysis: v=2.4 cv=T/C8ifKQ c=1 sm=1 tr=0 ts=6a28ba02 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=gAnH3GRIAAAA:8
 a=h-PLWaSRLStcMz6TLBMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100009

ADPM12250 is a quarter brick DC/DC Power Module. It is a high power
non-isolated converter capable of delivering regulated 12V with
continuous power level of 2500W. Uses PMBus.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
ADPM12250 is a quarter brick DC/DC Power Module. It is a high power
non-isolated converter capable of delivering regulated 12V with continuous
power level of 2500W. Uses PMBus.
---
 Documentation/hwmon/max34440.rst | 27 ++++++++++++++++--------
 drivers/hwmon/pmbus/max34440.c   | 45 +++++++++++++++++++++++++++++++++++++---
 2 files changed, 60 insertions(+), 12 deletions(-)

diff --git a/Documentation/hwmon/max34440.rst b/Documentation/hwmon/max34440.rst
index d6d4fbc863d96c1008a1971d3e3245d9ce1ef688..e7421f4dbf38fc1436bbaeba71d4461a00f8cefb 100644
--- a/Documentation/hwmon/max34440.rst
+++ b/Documentation/hwmon/max34440.rst
@@ -19,6 +19,14 @@ Supported chips:
 
     Datasheet: -
 
+  * ADI ADPM12250
+
+    Prefixes: 'adpm12250'
+
+    Addresses scanned: -
+
+    Datasheet: -
+
   * Maxim MAX34440
 
     Prefixes: 'max34440'
@@ -87,11 +95,11 @@ This driver supports multiple devices: hardware monitoring for Maxim MAX34440
 PMBus 6-Channel Power-Supply Manager, MAX34441 PMBus 5-Channel Power-Supply
 Manager and Intelligent Fan Controller, and MAX34446 PMBus Power-Supply Data
 Logger; PMBus Voltage Monitor and Sequencers for MAX34451, MAX34460, and
-MAX34461; PMBus DC/DC Power Module ADPM12160, and ADPM12200. The MAX34451
-supports monitoring voltage or current of 12 channels based on GIN pins. The
-MAX34460 supports 12 voltage channels, and the MAX34461 supports 16 voltage
-channels. The ADPM12160, and ADPM12200 also monitors both input and output
-of voltage and current.
+MAX34461; PMBus DC/DC Power Module ADPM12160, ADPM12200, and ADPM12250. The
+MAX34451 supports monitoring voltage or current of 12 channels based on GIN
+pins. The MAX34460 supports 12 voltage channels, and the MAX34461 supports 16
+voltage channels. The ADPM12160, ADPM12200, and ADPM12250 also monitors both
+input and output of voltage and current.
 
 The driver is a client driver to the core PMBus driver. Please see
 Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
@@ -149,7 +157,7 @@ in[1-6]_reset_history	Write any value to reset history.
 .. note::
 
     - MAX34446 only supports in[1-4].
-    - ADPM12160, and ADPM12200 only supports in[1-2]. Label is "vin1"
+    - ADPM12160, ADPM12200, and ADPM12250 only supports in[1-2]. Label is "vin1"
       and "vout1" respectively.
 
 Curr
@@ -172,8 +180,9 @@ curr[1-6]_reset_history	Write any value to reset history.
 
     - in6 and curr6 attributes only exist for MAX34440.
     - MAX34446 only supports curr[1-4].
-    - For ADPM12160, and ADPM12200, curr[1] is "iin1" and curr[2-6]
-      are "iout[1-5]".
+    - For ADPM12160, ADPM12200, and ADPM12250, curr[1] is "iin1"
+    - For ADPM12160, and ADPM12200 curr[2-6] are "iout[1-5]".
+    - For ADPM12250, curr[2-4] are "iout[1-3]".
 
 Power
 ~~~~~
@@ -209,7 +218,7 @@ temp[1-8]_reset_history	Write any value to reset history.
 .. note::
    - temp7 and temp8 attributes only exist for MAX34440.
    - MAX34446 only supports temp[1-3].
-   - ADPM12160, and ADPM12200 only supports temp[1].
+   - ADPM12160, ADPM12200, and ADPM12250 only supports temp[1].
 
 
 .. note::
diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
index 4525b9fc56267479534251a1444aa09181615ac6..74876d2207fbe4014b8b54a9fd9682370fc3bbed 100644
--- a/drivers/hwmon/pmbus/max34440.c
+++ b/drivers/hwmon/pmbus/max34440.c
@@ -18,6 +18,7 @@
 enum chips {
 	adpm12160,
 	adpm12200,
+	adpm12250,
 	max34440,
 	max34441,
 	max34446,
@@ -97,7 +98,8 @@ static int max34440_read_word_data(struct i2c_client *client, int page,
 		break;
 	case PMBUS_VIRT_READ_IOUT_AVG:
 		if (data->id != max34446 && data->id != max34451 &&
-		    data->id != adpm12160 && data->id != adpm12200)
+		    data->id != adpm12160 && data->id != adpm12200 &&
+		    data->id != adpm12250)
 			return -ENXIO;
 		ret = pmbus_read_word_data(client, page, phase,
 					   MAX34446_MFR_IOUT_AVG);
@@ -182,7 +184,8 @@ static int max34440_write_word_data(struct i2c_client *client, int page,
 		ret = pmbus_write_word_data(client, page,
 					    MAX34440_MFR_IOUT_PEAK, 0);
 		if (!ret && (data->id == max34446 || data->id == max34451 ||
-			     data->id == adpm12160 || data->id == adpm12200))
+			     data->id == adpm12160 || data->id == adpm12200 ||
+			     data->id == adpm12250))
 			ret = pmbus_write_word_data(client, page,
 					MAX34446_MFR_IOUT_AVG, 0);
 
@@ -399,6 +402,40 @@ static struct pmbus_driver_info max34440_info[] = {
 		.read_word_data = max34440_read_word_data,
 		.write_word_data = max34440_write_word_data,
 	},
+	[adpm12250] = {
+		.pages = 19,
+		.format[PSC_VOLTAGE_IN] = direct,
+		.format[PSC_VOLTAGE_OUT] = direct,
+		.format[PSC_CURRENT_IN] = direct,
+		.format[PSC_CURRENT_OUT] = direct,
+		.format[PSC_TEMPERATURE] = direct,
+		.m[PSC_VOLTAGE_IN] = 125,
+		.b[PSC_VOLTAGE_IN] = 0,
+		.R[PSC_VOLTAGE_IN] = 0,
+		.m[PSC_VOLTAGE_OUT] = 125,
+		.b[PSC_VOLTAGE_OUT] = 0,
+		.R[PSC_VOLTAGE_OUT] = 0,
+		.m[PSC_CURRENT_IN] = 250,
+		.b[PSC_CURRENT_IN] = 0,
+		.R[PSC_CURRENT_IN] = -1,
+		.m[PSC_CURRENT_OUT] = 250,
+		.b[PSC_CURRENT_OUT] = 0,
+		.R[PSC_CURRENT_OUT] = -1,
+		.m[PSC_TEMPERATURE] = 1,
+		.b[PSC_TEMPERATURE] = 0,
+		.R[PSC_TEMPERATURE] = 2,
+		/* absent func below [18] are not for monitoring */
+		.func[2] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT,
+		.func[4] = PMBUS_HAVE_STATUS_IOUT,
+		.func[5] = PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
+		.func[6] = PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
+		.func[9] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT,
+		.func[10] = PMBUS_HAVE_IIN | PMBUS_HAVE_STATUS_INPUT,
+		.func[14] = PMBUS_HAVE_IOUT,
+		.func[18] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
+		.read_word_data = max34440_read_word_data,
+		.write_word_data = max34440_write_word_data,
+	},
 	[max34440] = {
 		.pages = 14,
 		.format[PSC_VOLTAGE_IN] = direct,
@@ -635,7 +672,8 @@ static int max34440_probe(struct i2c_client *client)
 		rv = max34451_set_supported_funcs(client, data);
 		if (rv)
 			return rv;
-	} else if (data->id == adpm12160 || data->id == adpm12200) {
+	} else if (data->id == adpm12160 || data->id == adpm12200 ||
+		   data->id == adpm12250) {
 		data->iout_oc_fault_limit = PMBUS_IOUT_OC_FAULT_LIMIT;
 		data->iout_oc_warn_limit = PMBUS_IOUT_OC_WARN_LIMIT;
 	}
@@ -646,6 +684,7 @@ static int max34440_probe(struct i2c_client *client)
 static const struct i2c_device_id max34440_id[] = {
 	{ .name = "adpm12160", .driver_data = adpm12160 },
 	{ .name = "adpm12200", .driver_data = adpm12200 },
+	{ .name = "adpm12250", .driver_data = adpm12250 },
 	{ .name = "max34440", .driver_data = max34440 },
 	{ .name = "max34441", .driver_data = max34441 },
 	{ .name = "max34446", .driver_data = max34446 },

---
base-commit: 1723bc01ecc7ca2f30272685121314379ba5eb18
change-id: 20260610-dev-adpm12250-4ce6fc8c82ac

Best regards,
-- 
Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

