Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647103DD87B;
	Thu, 16 Jul 2026 08:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784190511; cv=none; b=aZcM6E0FlcB/VtwRlpsDNYEk58OUy1Sil+DTu6y1Kt9ozTN3HzoXyl0QSfunJFkT1xI3XrfQBFAVXNzzMz1IXjqxATO9C94viQMXfVKmWhGRxT78J2ozvlPnFv8Oe8sjwmCENbvjH9ClYLtVmovzfRZyCGLr76oSAe5XdJFOtRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784190511; c=relaxed/simple;
	bh=YYroPmPhigropaIcXlJ9oT8zHGTRVhe8f1Q2bhgTFG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ZQardeRFMuWepp5VUXcWiM9kPHm8lfadu9oBCDcLM2QIZdFoG1ilWBcpOT5Yqxolt6vgpgr4sNsKMryxxQbyQCm0ky/M1jcVz6i1qqbY+LHuiYVD4mZPPJQoImoJMvOvYVIi1rVg6RYEf/Chd/JWflnGZgAy9l084cJwDlHKeVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=ncf0hJ5R; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="ncf0hJ5R"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7IOrr3064270;
	Thu, 16 Jul 2026 04:28:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=bsNcA
	ABQ0ceVlVZOnCRk1auIaes7JtXS3ZCxrACcozA=; b=ncf0hJ5RvDVJiT2XrcHYQ
	pCStEn/LevOIwLrtG03xpERxHWmsjz6+H4TEUbf1Xo/m/u5rnU+83/OCvi0iE1ag
	yjZimiJq0ca91xCcos8H+DxOC/+3k3SA9nUy9FtorAnd3o095r4kjHB8r90+jYH6
	EcWVIqg1MwlzgYQypL8teFndwfxmQ0tg1ud0Edx/Hxyg3eZ9FXS6oveuDJgS8Om/
	GxTfMAi5RL11M73LsVYyJz2KilIRizsC7Ewfyt61r+gOe4PHgylFjQrmvE2fgFCL
	WCiZFrxu+VdljWA+8l2bZKG3Xr4J8bqbUp2RBDIa4YkYmvRoGiTs1X9jbHdmr7Qc
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4fe85wva6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 04:28:16 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 66G8SFeI061558
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Jul 2026 04:28:15 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 16 Jul 2026 04:28:15 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 16 Jul 2026 04:28:14 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Thu, 16 Jul 2026 04:28:14 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.190])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 66G8PdUU014492;
	Thu, 16 Jul 2026 04:25:58 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Thu, 16 Jul 2026 16:25:13 +0800
Subject: [PATCH 3/3] hwmon: (pmbus/max34440): Add support for MAX34452
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260716-max34451_fixes-v1-3-a941b27eaecb@analog.com>
References: <20260716-max34451_fixes-v1-0-a941b27eaecb@analog.com>
In-Reply-To: <20260716-max34451_fixes-v1-0-a941b27eaecb@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784190339; l=10442;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=08dvX5FKLJ3kgN2YX5NlsQT3Xj9RzW5ILyJG1YTV+0k=;
 b=1iFnTkpXy4Qn8tb7oFYus+Cc0SxrGAMSpyhmz/CUgvzFQSmE4LK8Vmy4nnWMRBbcXRJ5vZLDR
 mctZCTnWsDoCm+oyhfmiWC+/4w08He2arSNNvgT/VesRK9TJ5wyOu1P
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=aLnAb79m c=1 sm=1 tr=0 ts=6a589620 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=gAnH3GRIAAAA:8
 a=3tLlcj6tGBIsK1U58g0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA4NiBTYWx0ZWRfX9iEg6DjWk0nx
 bPB5pgU/66yXvt4YubRWmaTA45Y1yGdxzwzeuLx7wxdXLqzOg66RiD01B9/TgxuuDEK4flkC4+u
 Nvy8alvV0SEK3GI0SVOLFmjSG/Cq/fDqVT29R7G/H9r2nVBJMxby+xJ3PgE49OH3S+t2g34UIoB
 4YBuCLWWR0pofaCmb4rwkR9qimQi46LYUrKLqF/fw9JHCD+NVAAa0Y8FF0uuMXXrARbpryJxNHS
 yRBDsSwg60IrOJqMvkUzTENqiFPTOVLI4akTo0mqTbw8Mvvqbe0vh4hcHNFtTwNJgho6i+PnrzJ
 a18fR5bZG8hKl5mzju03qnaidO5HLygTZ+CtJYddedlyLzJJ2EIfCRWrd7WomP3SDglepAUsEpY
 5lrxTZ4l/nhG2raNZALkOnX76sWUs5u2wzsR9LCXK33ft5u1tDzqmdijKFKuHomz6HWU25Rz3NK
 U7PgFWG9H4pLIuoTdaQ==
X-Proofpoint-GUID: l2XHmBPhrthwCsNgs5AR8XMM6cePxO--
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA4NiBTYWx0ZWRfX626rpcLMrpJQ
 VjpwfTckYVQUyCGYUKcOYKLU+IXJ0WZxCXjJ4kUdJEv3pSoO/URW8zCsp3Y1L905wuwkRDCIo0y
 YYkcwcaTgZ8WWfYaA+f53tgO8ygWf7S1yWVNEDB5+EH2VFrIWfTQ
X-Proofpoint-ORIG-GUID: l2XHmBPhrthwCsNgs5AR8XMM6cePxO--
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160086

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
 Documentation/hwmon/max34440.rst | 26 +++++++++++------
 drivers/hwmon/pmbus/Kconfig      |  5 ++--
 drivers/hwmon/pmbus/max34440.c   | 61 ++++++++++++++++++++++++++++++++--------
 3 files changed, 71 insertions(+), 21 deletions(-)

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
index ae003a6eac30a7b0a022c5f7f467d8f81736c3f7..91fa1c19e87c9f2de789f2908e59ac00c228eb76 100644
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
index 024109df26db568a4c230c9dbc45d69ba531dd8d..2e57af09f47809b0a0bddab27fc47cadfe35e0ef 100644
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
@@ -116,6 +117,10 @@ static int max34440_read_word_data(struct i2c_client *client, int page,
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
@@ -126,8 +131,8 @@ static int max34440_read_word_data(struct i2c_client *client, int page,
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
@@ -192,6 +197,10 @@ static int max34440_write_word_data(struct i2c_client *client, int page,
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
@@ -212,8 +221,8 @@ static int max34440_write_word_data(struct i2c_client *client, int page,
 		ret = pmbus_write_word_data(client, page,
 					    MAX34440_MFR_IOUT_PEAK, 0);
 		if (!ret && (data->id == max34446 || data->id == max34451 ||
-			     data->id == adpm12160 || data->id == adpm12200 ||
-			     data->id == adpm12250))
+			     data->id == max34452 || data->id == adpm12160 ||
+			     data->id == adpm12200 || data->id == adpm12250))
 			ret = pmbus_write_word_data(client, page,
 					MAX34446_MFR_IOUT_AVG, 0);
 
@@ -281,12 +290,13 @@ static int max34451_read_byte_data(struct i2c_client *client, int page, int reg)
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
@@ -304,12 +314,13 @@ static int max34451_write_byte_data(struct i2c_client *client, int page,
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
@@ -340,6 +351,7 @@ static int max34451_set_supported_funcs(struct i2c_client *client,
 	if (rv < 0)
 		return rv;
 
+	/* MAX34452's latest MFR_REV is only at 0x0004, will skip this part */
 	if (rv >= MAX34451ETNA6_MFR_REV) {
 		max34451_na6 = true;
 		data->info.format[PSC_VOLTAGE_IN] = direct;
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

