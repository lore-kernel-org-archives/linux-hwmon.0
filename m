Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C773793CB;
	Wed, 22 Jul 2026 01:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784683825; cv=none; b=CI11KGoqhbZKPDKbX+tFwuX7J7fXKpnJ5picryURlozjh+4bIFwzQxXfDvQwgbUQGF2DUND0sEt+kkWOfGP0Xk6o1M9n8tQMWSTpW7HVOKLv3D2NwGu8LJLDqhY2W9AA10eE+rXhecxG4dHXbs3keBw3iy2fZbemhXbVt1Tbq5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784683825; c=relaxed/simple;
	bh=l3wzBLQmr1c0ZvaLGN2jwhw2KDkY/9eaRlh2BRMzyL0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=GMSMOcXERterG7avF3lH3nMAO2RszesVyOqYFGzOyGEWVbJELpROU4mYPvCfaPZ+2yW4vwqJYww9HxFACZXwYE2dMFXTdgN33hzHCaOn1bdHQME/xcmqbdFBm05X2qCYQSNVL6t3ZxeX5JGAGMzp0LcPJbBLiDk00Vyrx7zjTe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=XwiAN8xC; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="XwiAN8xC"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M1DK9L1779237;
	Tue, 21 Jul 2026 21:30:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=tlIig
	ReUX00vRy6HVs5t/wQ5x6w45ncsVBdW64h18Uk=; b=XwiAN8xC69PNY2cJqvl2j
	tykaGrt40qa6CPFg0/AYv1cQ24dTMw3oKjf9FAq7wO4u2Q4Ox4uPj7A13Y2lMLY1
	Oc1Iw2CrFWCvhBzTnGBtmhaPqDaHtqDAc9TCVrNpUG6oZljdcZXtS8F1Bfs2phni
	yKaLH5hfeTBzLWWCWwA2S5b3z2W2L1QNiBo8o3GtuObW/4bDOD613+rJ3z1DdiNf
	taPDQL++vfd9C5EOfFIbZK+67usu8o4X9HOkhINX66wX7ivJTbgJ1+J+yBJS0TGZ
	5J8VZ1sJuOlXQvnmUVFgUS3suOwqIv1R4Kt/cxw9ll0EMdLtPNsh14Cvfq5sBcfk
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4fj6vquasr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 21:30:11 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 66M1UAut003358
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Jul 2026 21:30:10 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Tue, 21 Jul
 2026 21:30:08 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Tue, 21 Jul 2026 21:30:08 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.191])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 66M1Tc8E017211;
	Tue, 21 Jul 2026 21:29:59 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Wed, 22 Jul 2026 09:29:31 +0800
Subject: [PATCH v2 3/3] hwmon: (pmbus/max34440): Add support for MAX34452
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260722-max34451_fixes-v2-3-bbddb18ec1d6@analog.com>
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
	<alexisczezar.torreno@analog.com>,
        Carlos Jones Jr
	<carlosjr.jones@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784683778; l=11280;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=Crr8oABN9q4TqBHEzjcaLPvAMErh7wa0wfr1pEW1GDg=;
 b=Q4FkA4s5xGSFMAkL7p4CD05uI7FgSOpvHCNpLcdKATztTEjktQ+teEkJzXHwS7PRI5SscNLvr
 kOT5cmGfNpPAsLwDbzgEsOY+gtdCXzK+TYTaDFWl5kDS4iK9hvXklNy
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: 4EZsEuD0D4VYyOZYtI0pbdcaAV6jozna
X-Proofpoint-ORIG-GUID: 4EZsEuD0D4VYyOZYtI0pbdcaAV6jozna
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAxMSBTYWx0ZWRfX9ozQ00cPhWst
 zN33T/Z8N9mKFgwFSWcyudyLeu+eSRr+pfAujaDXO969q6fAifCgESq7HHtUQ9iXaO9pvT4MymC
 Om8AWbtD3h1Z4vAHrvDJ0ZPWVI3smQ0lfMbpW/DMkf81v1S//it6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAxMSBTYWx0ZWRfXxVA5iZibmxQd
 wyXReq7xTdvPZZnF+RsaipQIVp9Yr8B676EEPIyMTC+PTzeIekJKrKi2eEtsoxYm0hEiGQhGVxR
 Qy1UZZCYarkwhkv6S0crHJQkj/MmB6pKzfgRn+KpwoI8hSCk/BRx7pkUbq99Oz1+kE8VSTa8Vuq
 cXlQMUbYID1rYQ984ul05q6S8DVm042KfCTXdTFRRifgNLQDWh9sVKOFVZs3KtfVyoMPrZEh3xx
 hqxODM4F4gut6mebjcDNMrqngSl+CMst2kY2EUK2kkwMNWvjG+FhjHAcIIOAYX6CUi9xSCpdTkz
 d05+LmFo58v6LXxC5HVgeljb/BQ7/ZR3ZIJVbMTToY4Nl47GItiO0zTcfkX+Ht+Wu2UzpiSFLCL
 BotNk4esG+q03DfRqZDAjBEUb5T236IoL7ypjw4PhAXMdbKjA1uPhrhvTWWYOBRUKgVpEyKMBM7
 iweUTYolZ6y72cXREzQ==
X-Authority-Analysis: v=2.4 cv=WIpPmHsR c=1 sm=1 tr=0 ts=6a601d23 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22 a=gAnH3GRIAAAA:8
 a=ArxT_WwmEDJpJ2np-awA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_01,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220011

From: Carlos Jones Jr <carlosjr.jones@analog.com>

Add support for Maxim MAX34452 PMBus 16-Channel V/I Monitor and
12-Channel Sequencer/Marginer. The device is similar to MAX34451
and shares the same configuration function.

The MAX34452 supports:
- 16 configurable voltage/current monitoring channels
- 5 temperature sensors (pages 16-20)
- Dynamic channel configuration via MFR_CHANNEL_CONFIG
- IOUT average monitoring

Signed-off-by: Carlos Jones Jr <carlosjr.jones@analog.com>
Co-Developed by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
 Documentation/hwmon/max34440.rst | 26 +++++++++-----
 drivers/hwmon/pmbus/Kconfig      |  5 +--
 drivers/hwmon/pmbus/max34440.c   | 75 ++++++++++++++++++++++++++++++----------
 3 files changed, 78 insertions(+), 28 deletions(-)

diff --git a/Documentation/hwmon/max34440.rst b/Documentation/hwmon/max34440.rst
index e7421f4dbf38fc1436bbaeba71d4461a00f8cefb..866f22b88e9b360ff54aa52807484bb3e859e56e 100644
--- a/Documentation/hwmon/max34440.rst
+++ b/Documentation/hwmon/max34440.rst
@@ -65,6 +65,16 @@ Supported chips:
 
     Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max34451.pdf
 
+  * Maxim MAX34452
+
+    PMBus 16-Channel V/I Monitor and 12-Channel Sequencer/Marginer
+
+    Prefixes: 'max34452'
+
+    Addresses scanned: -
+
+    Datasheet: -
+
   * Maxim MAX34460
 
     PMBus 12-Channel Voltage Monitor & Sequencer
@@ -94,11 +104,11 @@ Description
 This driver supports multiple devices: hardware monitoring for Maxim MAX34440
 PMBus 6-Channel Power-Supply Manager, MAX34441 PMBus 5-Channel Power-Supply
 Manager and Intelligent Fan Controller, and MAX34446 PMBus Power-Supply Data
-Logger; PMBus Voltage Monitor and Sequencers for MAX34451, MAX34460, and
-MAX34461; PMBus DC/DC Power Module ADPM12160, ADPM12200, and ADPM12250. The
-MAX34451 supports monitoring voltage or current of 12 channels based on GIN
-pins. The MAX34460 supports 12 voltage channels, and the MAX34461 supports 16
-voltage channels. The ADPM12160, ADPM12200, and ADPM12250 also monitors both
+Logger; PMBus Voltage Monitor and Sequencers for MAX34451, MAX34452, MAX34460,
+and MAX34461; PMBus DC/DC Power Module ADPM12160, ADPM12200, and ADPM12250. The
+MAX34451 and MAX34452 support monitoring voltage or current of 16 channels based
+on GIN pins. The MAX34460 supports 12 voltage channels, and the MAX34461 supports
+16 voltage channels. The ADPM12160, ADPM12200, and ADPM12250 also monitor both
 input and output of voltage and current.
 
 The driver is a client driver to the core PMBus driver. Please see
@@ -171,7 +181,7 @@ curr[1-6]_crit		Critical maximum current. From IOUT_OC_FAULT_LIMIT
 			register.
 curr[1-6]_max_alarm	Current high alarm. From IOUT_OC_WARNING status.
 curr[1-6]_crit_alarm	Current critical high alarm. From IOUT_OC_FAULT status.
-curr[1-4]_average	Historical average current (MAX34446/34451 only).
+curr[1-4]_average	Historical average current (MAX34446/34451/34452 only).
 curr[1-6]_highest	Historical maximum current.
 curr[1-6]_reset_history	Write any value to reset history.
 ======================= ========================================================
@@ -223,7 +233,7 @@ temp[1-8]_reset_history	Write any value to reset history.
 
 .. note::
 
-   - MAX34451 supports attribute groups in[1-16] (or curr[1-16] based on
-     input pins) and temp[1-5].
+   - MAX34451 and MAX34452 support attribute groups in[1-16] (or curr[1-16]
+     based on input pins) and temp[1-5].
    - MAX34460 supports attribute groups in[1-12] and temp[1-5].
    - MAX34461 supports attribute groups in[1-16] and temp[1-5].
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index ca312be58ed5c46da2859db334a1abd69c6d3471..9b4bfdd003108e1846ff35e3f18ab408dd2cc76a 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -434,8 +434,9 @@ config SENSORS_MAX34440
 	tristate "Maxim MAX34440 and compatibles"
 	help
 	  If you say yes here you get hardware monitoring support for Maxim
-	  MAX34440, MAX34441, MAX34446, MAX34451, MAX34460, and MAX34461.
-	  Other compatible are ADPM12160, and ADPM12200.
+	  MAX34440, MAX34441, MAX34446, MAX34451, MAX34452, MAX34460, and
+	  MAX34461. Other compatible devices are ADPM12160, ADPM12200, and
+	  ADPM12250.
 
 	  This driver can also be built as a module. If so, the module will
 	  be called max34440.
diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
index 81514727565f29c7251fe93f049cdd6b0f214f81..866d25ae8971c49d3e296efb69fc486e5dbac668 100644
--- a/drivers/hwmon/pmbus/max34440.c
+++ b/drivers/hwmon/pmbus/max34440.c
@@ -23,6 +23,7 @@ enum chips {
 	max34441,
 	max34446,
 	max34451,
+	max34452,
 	max34460,
 	max34461,
 };
@@ -106,16 +107,21 @@ static int max34440_read_word_data(struct i2c_client *client, int page,
 	case PMBUS_UT_FAULT_LIMIT:
 	case PMBUS_MFR_MAX_TEMP_1:
 		/*
-		 * MAX34451/ADPM family do not support VIN/IIN limit registers,
-		 * manufacturer-specific min/max registers, or undercurrent/
-		 * undertemperature fault limits. Accessing these triggers CML
-		 * error and asserts ALERT.
+		 * MAX34451/MAX34452/ADPM family do not support VIN/IIN limit
+		 * registers, manufacturer-specific min/max registers, or
+		 * undercurrent/undertemperature fault limits. Accessing these
+		 * triggers CML error and asserts ALERT.
 		 */
-		if (data->id == max34451 || data->id == adpm12160 ||
-		    data->id == adpm12200 || data->id == adpm12250)
+		if (data->id == max34451 || data->id == max34452 ||
+		    data->id == adpm12160 || data->id == adpm12200 ||
+		    data->id == adpm12250)
 			return -ENXIO;
 		ret = -ENODATA;
 		break;
+	case PMBUS_VOUT_OV_WARN_LIMIT:
+		if (data->id == max34452)
+			return -ENXIO;
+		return -ENODATA;
 	case PMBUS_VIRT_READ_VOUT_MIN:
 		ret = pmbus_read_word_data(client, page, phase,
 					   MAX34440_MFR_VOUT_MIN);
@@ -126,8 +132,8 @@ static int max34440_read_word_data(struct i2c_client *client, int page,
 		break;
 	case PMBUS_VIRT_READ_IOUT_AVG:
 		if (data->id != max34446 && data->id != max34451 &&
-		    data->id != adpm12160 && data->id != adpm12200 &&
-		    data->id != adpm12250)
+		    data->id != max34452 && data->id != adpm12160 &&
+		    data->id != adpm12200 && data->id != adpm12250)
 			return -ENXIO;
 		ret = pmbus_read_word_data(client, page, phase,
 					   MAX34446_MFR_IOUT_AVG);
@@ -192,6 +198,10 @@ static int max34440_write_word_data(struct i2c_client *client, int page,
 		ret = pmbus_write_word_data(client, page, data->iout_oc_warn_limit,
 					    word);
 		break;
+	case PMBUS_VOUT_OV_WARN_LIMIT:
+		if (data->id == max34452)
+			return -ENXIO;
+		return -ENODATA;
 	case PMBUS_VIRT_RESET_POUT_HISTORY:
 		ret = pmbus_write_word_data(client, page,
 					    MAX34446_MFR_POUT_PEAK, 0);
@@ -212,8 +222,8 @@ static int max34440_write_word_data(struct i2c_client *client, int page,
 		ret = pmbus_write_word_data(client, page,
 					    MAX34440_MFR_IOUT_PEAK, 0);
 		if (!ret && (data->id == max34446 || data->id == max34451 ||
-			     data->id == adpm12160 || data->id == adpm12200 ||
-			     data->id == adpm12250))
+			     data->id == max34452 || data->id == adpm12160 ||
+			     data->id == adpm12200 || data->id == adpm12250))
 			ret = pmbus_write_word_data(client, page,
 					MAX34446_MFR_IOUT_AVG, 0);
 
@@ -281,12 +291,13 @@ static int max34451_read_byte_data(struct i2c_client *client, int page, int reg)
 	case PMBUS_STATUS_BYTE:
 	case PMBUS_STATUS_OTHER:
 		/*
-		 * MAX34451/ADPM family do not support STATUS_BYTE or
+		 * MAX34451/MAX34452/ADPM family do not support STATUS_BYTE or
 		 * STATUS_OTHER registers. Accessing them triggers CML
 		 * error and asserts ALERT.
 		 */
-		if (data->id == max34451 || data->id == adpm12160 ||
-		    data->id == adpm12200 || data->id == adpm12250)
+		if (data->id == max34451 || data->id == max34452 ||
+		    data->id == adpm12160 || data->id == adpm12200 ||
+		    data->id == adpm12250)
 			return -ENXIO;
 		return -ENODATA;
 	default:
@@ -304,12 +315,13 @@ static int max34451_write_byte_data(struct i2c_client *client, int page,
 	case PMBUS_STATUS_BYTE:
 	case PMBUS_STATUS_OTHER:
 		/*
-		 * MAX34451/ADPM family do not support STATUS_BYTE or
+		 * MAX34451/MAX34452/ADPM family do not support STATUS_BYTE or
 		 * STATUS_OTHER registers. Writing to them triggers CML
 		 * error and asserts ALERT.
 		 */
-		if (data->id == max34451 || data->id == adpm12160 ||
-		    data->id == adpm12200 || data->id == adpm12250)
+		if (data->id == max34451 || data->id == max34452 ||
+		    data->id == adpm12160 || data->id == adpm12200 ||
+		    data->id == adpm12250)
 			return -ENXIO;
 		return -ENODATA;
 	default:
@@ -340,7 +352,7 @@ static int max34451_set_supported_funcs(struct i2c_client *client,
 	if (rv < 0)
 		return rv;
 
-	if (rv >= MAX34451ETNA6_MFR_REV) {
+	if (data->id == max34451 && rv >= MAX34451ETNA6_MFR_REV) {
 		max34451_na6 = true;
 		data->info.format[PSC_VOLTAGE_IN] = direct;
 		data->info.format[PSC_CURRENT_IN] = direct;
@@ -678,6 +690,32 @@ static struct pmbus_driver_info max34440_info[] = {
 		.write_word_data = max34440_write_word_data,
 		.page_change_delay = MAX34440_PAGE_CHANGE_DELAY,
 	},
+	[max34452] = {
+		.pages = 21,
+		.format[PSC_VOLTAGE_OUT] = direct,
+		.format[PSC_TEMPERATURE] = direct,
+		.format[PSC_CURRENT_OUT] = direct,
+		.m[PSC_VOLTAGE_OUT] = 1,
+		.b[PSC_VOLTAGE_OUT] = 0,
+		.R[PSC_VOLTAGE_OUT] = 3,
+		.m[PSC_CURRENT_OUT] = 1,
+		.b[PSC_CURRENT_OUT] = 0,
+		.R[PSC_CURRENT_OUT] = 2,
+		.m[PSC_TEMPERATURE] = 1,
+		.b[PSC_TEMPERATURE] = 0,
+		.R[PSC_TEMPERATURE] = 2,
+		/* func 0-15 is set dynamically before probing */
+		.func[16] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
+		.func[17] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
+		.func[18] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
+		.func[19] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
+		.func[20] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
+		.read_byte_data = max34451_read_byte_data,
+		.read_word_data = max34440_read_word_data,
+		.write_byte_data = max34451_write_byte_data,
+		.write_word_data = max34440_write_word_data,
+		.page_change_delay = MAX34440_PAGE_CHANGE_DELAY,
+	},
 	[max34460] = {
 		.pages = 18,
 		.format[PSC_VOLTAGE_OUT] = direct,
@@ -761,7 +799,7 @@ static int max34440_probe(struct i2c_client *client)
 	data->iout_oc_fault_limit = MAX34440_IOUT_OC_FAULT_LIMIT;
 	data->iout_oc_warn_limit = MAX34440_IOUT_OC_WARN_LIMIT;
 
-	if (data->id == max34451) {
+	if (data->id == max34451 || data->id == max34452) {
 		rv = max34451_set_supported_funcs(client, data);
 		if (rv)
 			return rv;
@@ -782,6 +820,7 @@ static const struct i2c_device_id max34440_id[] = {
 	{ .name = "max34441", .driver_data = max34441 },
 	{ .name = "max34446", .driver_data = max34446 },
 	{ .name = "max34451", .driver_data = max34451 },
+	{ .name = "max34452", .driver_data = max34452 },
 	{ .name = "max34460", .driver_data = max34460 },
 	{ .name = "max34461", .driver_data = max34461 },
 	{ }

-- 
2.34.1

