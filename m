Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F4830E0C0;
	Wed, 22 Jul 2026 01:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784683817; cv=none; b=RLYX6GgZXSHUPy45ixfp4jtPA4rQGeuK4ep2naIb7R5narN3Nlehho4ZdKU9Cih0ZX3bRVoUHzKIjGZeisl0o6sfi6W4warODRIDy6NmKUS6EVyEsgMU0T6XoojemwnHFS0rwPv8nMwl0q+q2FWLR7Xxb0KaaacraaVd1SYVQTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784683817; c=relaxed/simple;
	bh=i4mbqfV+NJt448HuBWWBwjaNfdZgWgi3l9W2qOiI5Tc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=CkMay7anRkljYub0PtptqOQWRHgvg+vLszH3w9k3l4ytwmGrroY+ozgqXT5R71aCUEswP8rsIf8s2TeSRy0NNEWhckYL+gb8bL88/kmZ0RuUfcgEjoiRMa7/HfIk3g8s8ydHwCYC0kaMstZZbuM0/yWN9pe64B5okHEZioYS4tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=KliB5u0s; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="KliB5u0s"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M1Dmjq2093891;
	Tue, 21 Jul 2026 21:30:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=dyVAr
	/n90YUTwkG+bAthr1qSIZXBTso3kMKm6TocO2s=; b=KliB5u0srxOB823TD/eyj
	/+DjqMLzXlTNKGx9hCSdd4PZG52fXYMIttLwos0cGyvoGfyVK0CE5f42EYcoXP76
	J6HGRQ7fKIxCuZa3SMaB/iBe7A4vyGSRhkjDslruSuZwcCwhfuysKcBEZEYtbsjH
	8idfqwwK2Wh+XaIlhd6KNuaDyF1tCB6l6FYenbuf9O9Hob0yJvQlNcbMX6N4AP2N
	Mmz4wuxcZfaXt8DLB+H2iR3vjRGInZAA7mKOPNftZDck92nxgeDnqzI3md/510Bl
	IylXnufAWvS5x/qMMvGuTXjYFYkT09Oefaw3aHH/0NuRX29EW01cavS+pSr/Hjal
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4fgttgktyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 21:30:02 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 66M1U0RY003279
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Jul 2026 21:30:00 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Tue, 21 Jul
 2026 21:30:00 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Tue, 21 Jul 2026 21:30:00 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.191])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 66M1Tc8C017211;
	Tue, 21 Jul 2026 21:29:50 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Wed, 22 Jul 2026 09:29:29 +0800
Subject: [PATCH v2 1/3] hwmon: (pmbus/max34440): block unsupported VIN and
 IIN limit registers
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260722-max34451_fixes-v2-1-bbddb18ec1d6@analog.com>
References: <20260722-max34451_fixes-v2-0-bbddb18ec1d6@analog.com>
In-Reply-To: <20260722-max34451_fixes-v2-0-bbddb18ec1d6@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Kun Yi <kunyi@google.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Jonathan Corbet
	<corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>,
        Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784683778; l=5914;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=i4mbqfV+NJt448HuBWWBwjaNfdZgWgi3l9W2qOiI5Tc=;
 b=036/3tpjvRbWDP08BQ4l8oIvYmKK3TV4aWIKG3XB0VFLTDRvEd6y3tcSScoKh612pjKxuBn6U
 ejflWlbPFrlCAlAmNGkdaMot0cp8UxfCiS/tvZmHd3S8DAXoprSgJe/
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: Z4UlHUf7mB9LLe33CSrlzukbGjBhl4p4
X-Authority-Analysis: v=2.4 cv=DagnbPtW c=1 sm=1 tr=0 ts=6a601d1a cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=_jlGtV7tAAAA:8 a=nfSHROyFBnurkggdnvMA:9 a=QEXdDO2ut3YA:10
 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAxMSBTYWx0ZWRfX/Qkn81xFQVd6
 DXl7BQm9q2RQCPywZ237EuC0o47U2cCIwGOmmtwjawmbB16IAY3gBHSI6vG9+WLFAw2RXnSJwA0
 iLmTWExCrn+thzfowWSW299ZbWlGBs8WXA+0cInw9GxB5mTplwMr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAxMSBTYWx0ZWRfX9ySVyStapCmE
 HKO0YRoWkfHkDEChuLD49Pzu1gi0ynvkcKK2WHfFPoeI8mcxXtqnWOuKkxn2ia3+drv7Ls7eRBe
 GFy3I8+SXm2m/AYItV5b1/IxR4ERHX15rjG3FD69Lc9IO6BFW1Fu5SKdYTzjo8g1Yml+3bGN9mK
 Qd9SihT2pXiLnvwyFDk43YQuiwGPxcYFTDD/fGla16Gr8wRgunU7psDiSyB6fOYWP7RAC+XLRm9
 U1EzivjusdvFfeifshPIdNft/Y9W2bAWf0Pxa8zms/w/8RNMtgEhJv82limQOd3ViiuxfdNFHEP
 TKmf+AQ1GevI+Bbx+2y+wLy5j5x9v+p0gCkv6oplrpM2fPYwgQzuclfDqnwRRpHu3Cv/MqKQhhG
 MG47d7s57L0QwPoBte2LLfC1AJpE7HCcz1521ktJ9xjdpgSGxK+V0gBIrY9BrS7wnuDslP6kHFw
 t4sMimxUvxjL1RmDbaA==
X-Proofpoint-GUID: Z4UlHUf7mB9LLe33CSrlzukbGjBhl4p4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_01,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220011

MAX34451 and ADPM chips do not support standard PMBus VIN/IIN limit
registers, manufacturer specific min/max registers, or undercurrent
or undertemperature fault limits. STATUS_BYTE and STATUS_OTHER are also
not available. Accessing these non-existent registers during driver
initialization triggers a CML error and asserts ALERT. Handled by
blocking these functions during read/write.

Fixes: 7a001dbab4ad ("hwmon: (pmbus/max34440) Add support for MAX34451.")
Fixes: 629cf8f6c23a ("hwmon: (pmbus/max34440) Add support for ADPM12160")
Fixes: 2e0b52f1ae88 ("hwmon: (pmbus/max34440): add support adpm12200")
Fixes: 479bfeba2eb6 ("hwmon: (pmbus/max34440): add support adpm12250")
Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Link: https://lore.kernel.org/r/20260716-max34451_fixes-v1-1-a941b27eaecb@analog.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/max34440.c | 80 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
index 74876d2207fbe4014b8b54a9fd9682370fc3bbed..e56057e9273c1639bddbaf4e665ea159f1d7c3ed 100644
--- a/drivers/hwmon/pmbus/max34440.c
+++ b/drivers/hwmon/pmbus/max34440.c
@@ -88,6 +88,33 @@ static int max34440_read_word_data(struct i2c_client *client, int page,
 		ret = pmbus_read_word_data(client, page, phase,
 					   data->iout_oc_warn_limit);
 		break;
+	case PMBUS_VIN_OV_FAULT_LIMIT:
+	case PMBUS_VIN_OV_WARN_LIMIT:
+	case PMBUS_VIN_UV_WARN_LIMIT:
+	case PMBUS_VIN_UV_FAULT_LIMIT:
+	case PMBUS_MFR_VIN_MIN:
+	case PMBUS_MFR_VIN_MAX:
+	case PMBUS_IIN_OC_WARN_LIMIT:
+	case PMBUS_IIN_OC_FAULT_LIMIT:
+	case PMBUS_MFR_IIN_MAX:
+	case PMBUS_MFR_VOUT_MIN:
+	case PMBUS_MFR_VOUT_MAX:
+	case PMBUS_IOUT_UC_FAULT_LIMIT:
+	case PMBUS_MFR_IOUT_MAX:
+	case PMBUS_UT_WARN_LIMIT:
+	case PMBUS_UT_FAULT_LIMIT:
+	case PMBUS_MFR_MAX_TEMP_1:
+		/*
+		 * MAX34451/ADPM family do not support VIN/IIN limit registers,
+		 * manufacturer-specific min/max registers, or undercurrent/
+		 * undertemperature fault limits. Accessing these triggers CML
+		 * error and asserts ALERT.
+		 */
+		if (data->id == max34451 || data->id == adpm12160 ||
+		    data->id == adpm12200 || data->id == adpm12250)
+			return -ENXIO;
+		ret = -ENODATA;
+		break;
 	case PMBUS_VIRT_READ_VOUT_MIN:
 		ret = pmbus_read_word_data(client, page, phase,
 					   MAX34440_MFR_VOUT_MIN);
@@ -244,6 +271,51 @@ static int max34440_read_byte_data(struct i2c_client *client, int page, int reg)
 	return ret;
 }
 
+static int max34451_read_byte_data(struct i2c_client *client, int page, int reg)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	const struct max34440_data *data = to_max34440_data(info);
+
+	switch (reg) {
+	case PMBUS_STATUS_BYTE:
+	case PMBUS_STATUS_OTHER:
+		/*
+		 * MAX34451/ADPM family do not support STATUS_BYTE or
+		 * STATUS_OTHER registers. Accessing them triggers CML
+		 * error and asserts ALERT.
+		 */
+		if (data->id == max34451 || data->id == adpm12160 ||
+		    data->id == adpm12200 || data->id == adpm12250)
+			return -ENXIO;
+		return -ENODATA;
+	default:
+		return -ENODATA;
+	}
+}
+
+static int max34451_write_byte_data(struct i2c_client *client, int page,
+				    int reg, u8 byte)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	const struct max34440_data *data = to_max34440_data(info);
+
+	switch (reg) {
+	case PMBUS_STATUS_BYTE:
+	case PMBUS_STATUS_OTHER:
+		/*
+		 * MAX34451/ADPM family do not support STATUS_BYTE or
+		 * STATUS_OTHER registers. Writing to them triggers CML
+		 * error and asserts ALERT.
+		 */
+		if (data->id == max34451 || data->id == adpm12160 ||
+		    data->id == adpm12200 || data->id == adpm12250)
+			return -ENXIO;
+		return -ENODATA;
+	default:
+		return -ENODATA;
+	}
+}
+
 static int max34451_set_supported_funcs(struct i2c_client *client,
 					 struct max34440_data *data)
 {
@@ -363,7 +435,9 @@ static struct pmbus_driver_info max34440_info[] = {
 		.func[9] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT,
 		.func[10] = PMBUS_HAVE_IIN | PMBUS_HAVE_STATUS_INPUT,
 		.func[18] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
+		.read_byte_data = max34451_read_byte_data,
 		.read_word_data = max34440_read_word_data,
+		.write_byte_data = max34451_write_byte_data,
 		.write_word_data = max34440_write_word_data,
 	},
 	[adpm12200] = {
@@ -399,7 +473,9 @@ static struct pmbus_driver_info max34440_info[] = {
 		.func[10] = PMBUS_HAVE_IIN | PMBUS_HAVE_STATUS_INPUT,
 		.func[14] = PMBUS_HAVE_IOUT,
 		.func[18] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
+		.read_byte_data = max34451_read_byte_data,
 		.read_word_data = max34440_read_word_data,
+		.write_byte_data = max34451_write_byte_data,
 		.write_word_data = max34440_write_word_data,
 	},
 	[adpm12250] = {
@@ -433,7 +509,9 @@ static struct pmbus_driver_info max34440_info[] = {
 		.func[10] = PMBUS_HAVE_IIN | PMBUS_HAVE_STATUS_INPUT,
 		.func[14] = PMBUS_HAVE_IOUT,
 		.func[18] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
+		.read_byte_data = max34451_read_byte_data,
 		.read_word_data = max34440_read_word_data,
+		.write_byte_data = max34451_write_byte_data,
 		.write_word_data = max34440_write_word_data,
 	},
 	[max34440] = {
@@ -581,7 +659,9 @@ static struct pmbus_driver_info max34440_info[] = {
 		.func[18] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
 		.func[19] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
 		.func[20] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
+		.read_byte_data = max34451_read_byte_data,
 		.read_word_data = max34440_read_word_data,
+		.write_byte_data = max34451_write_byte_data,
 		.write_word_data = max34440_write_word_data,
 		.page_change_delay = MAX34440_PAGE_CHANGE_DELAY,
 	},

-- 
2.34.1

