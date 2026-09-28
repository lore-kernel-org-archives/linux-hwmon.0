Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D195F547046;
	Mon, 28 Sep 2026 04:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790569735; cv=none; b=aLgdYr090hKiAsXaTKZk7bNXXSmUNyuku3pLtSQ1MQ5UILMNVdxYkixpc+tCIjXrjL6LfOI5txoqbZH9FJaceyRmeas7pUE+pd6pNDQaWbMItNF33UWJV29d8QDYYeEzizk0pcBxq5HG57n8+kKQ3YH5i5/CTsbi1Ph1wpmVTr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790569735; c=relaxed/simple;
	bh=bFUDqbHgP5tW4uYKllzkQHtceObCCGfda+eEUEEvTwY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=kMPM8YCIaJ9L/FbUDhp20KcecgoGqyoxpUmANov1yp/lAHeMtMF2ApdgsK1Mmlb+d6LbU2vl6v/0bBTjXnkCLFzgzanLvSRfQO3p8ETRgGydGGxgtPHYsWdq/wvtcixiLi4aBR1ke2SqYMNJ9uGpNP/fwHrdzUGaZo6+6ci5vuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=gZ/3H7PF; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="gZ/3H7PF"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S2wCjX3196052;
	Mon, 28 Sep 2026 00:28:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=wC54wJTyq8V1np/yMtp60xllVTO
	aCMPAaqK+jeRA5qA=; b=gZ/3H7PF5+r/LPAfczZ7cC2lM2YhqoIlsFESefwe/sb
	ZL4sMAdDr349e3+fKhlkKpFhD9sKHGhmnRugrwU75kXNWQXZBCmuMtau3pddV92L
	y6GQ7VcldF19kPqMOuU9UniMLUY8cumniT3K1FCbPvfsjFRKeCWt+fheX6z6SKFf
	xizs4Nz+5cwWNuthphtNlDkDLhBZhh02QrwNfEOZInCy+qB5CrOHAybzk5pqcf2Z
	dA+0rT3QXwL+3h7W7lVhBl17Y9mtJJktNj9lJJ4Ofw5/TgKyc2Q9uxiVSotVU3u4
	UPDTSubu9StlMWDunnjrLE8OneJqbn6ZJiitfU88a9A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gxvcdv7kb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 00:28:22 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 68S4SLIS042433
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Sep 2026 00:28:21 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Mon, 28 Sep
 2026 00:28:21 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 28 Sep 2026 00:28:20 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.191])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 68S4S51n025704;
	Mon, 28 Sep 2026 00:28:11 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Mon, 28 Sep 2026 12:27:55 +0800
Subject: [PATCH] hwmon: (pmbus/max34440): add support for adpm12886
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260928-hwmon-next-v1-1-55b6c5cd8e2e@analog.com>
X-B4-Tracking: v=1; b=H4sIAMrsuWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyML3Yzy3Pw83bzUihJdoxRzMzMjY4s0A2NDJaCGgqLUtMwKsGHRsbW
 1AI5GdPpcAAAA
X-Change-ID: 20260928-hwmon-next-2d766238f031
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
CC: <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790569686; l=9367;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=bFUDqbHgP5tW4uYKllzkQHtceObCCGfda+eEUEEvTwY=;
 b=d7C1SwedEAL54xeRQnf54AbNzwHHMq8sYOmBEaAK2NyFraPKtMDFKrEU4X5xCDXtVvots+uXW
 KogmvLzklCUBASmrOygIfckMn2KoBfpgKFv58XMrqpmP0NJnUJVTuDr
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: K_3wq2_Yfd6gruXV__wvM05u3xCgtgYp
X-Proofpoint-GUID: K_3wq2_Yfd6gruXV__wvM05u3xCgtgYp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxNyBTYWx0ZWRfX90rzyyxhkGav
 kmwve0V5O6rfAm6XaIa6pyPZL8cxOBahSz9ueYEdQUEg+4msLFnMlSi8Xm/40PjZCGOVq7QRRKo
 dF0fDpU32P/DaHroRZ+0RdKwOjDXX20389ffJmMHcqgHpYPfPlOSJo6kZ0I74SMnkve1d5G0OJH
 7goJ7+t/xDIA5orgphwHAq5HgI5DKxKoiFiuKtkyRQd1xCPydCyQnxPFSs4OtguLy6x+hW142if
 pOO2yX87ZHb7clt+P1HVL//QrpaPl4hwhNTBO3UYfOju61pVPh0s7LS4FGDBr86I7QvwXFbRh2Y
 w4h8k5vjgQ1rm1ewaa3Q7g4ReJdRTWhsVQKckR3Ewg+ALzZxUTe1EfZh9qdEpnU4Y15yx05nBLq
 guVfVHMbhvGd/NLnlVRYANy3iZ42ZEm5IunLAFP2mgVq0pJgJ3uNHeH6ceyWQMFjoChNsZf+2M8
 gsnKvV5MhL5x1Si/Dow==
X-Authority-Analysis: v=2.4 cv=S7FMU4sP c=1 sm=1 tr=0 ts=6ab9ece6 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22 a=gAnH3GRIAAAA:8
 a=FmHyTUunZNk7QUr-hdkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxNyBTYWx0ZWRfX05RFbn/B6sBW
 mNU1jSkMxzMGvomiyB/SFwBX4OwfrZItxuvK8UzCkG0jZh3qMopxHukKgEnFPSRGmFf1IaTKVpa
 +QR0h9OD+C8n5Nyd97wCnk+m7gDzi1jUTEO92Vb0564PsfJ4ciZ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280017

ADPM12886 is a 1/8 brick DC/DC converter that provides up to 98%
efficiency at half load. Can sustain output power of 1200W. Uses PMBUS.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
Adds ADPM device identification and support for ADPM12886 which is a 1/8 brick
DC/DC Power Module. It is a high power non-isolated converter capable of delivering
regulated 12V with continuous power level of 1600W.
---
 Documentation/hwmon/max34440.rst | 26 +++++++++++++-------
 drivers/hwmon/pmbus/Kconfig      |  2 +-
 drivers/hwmon/pmbus/max34440.c   | 51 +++++++++++++++++++++++++++++++++++-----
 3 files changed, 64 insertions(+), 15 deletions(-)

diff --git a/Documentation/hwmon/max34440.rst b/Documentation/hwmon/max34440.rst
index 8ce10aa425d5db30d13f3868c3466ef32efefdee..a4848da495e6d890ec628c3686001fc7872c551b 100644
--- a/Documentation/hwmon/max34440.rst
+++ b/Documentation/hwmon/max34440.rst
@@ -35,6 +35,14 @@ Supported chips:
 
     Datasheet: -
 
+  * ADI ADPM12886
+
+    Prefixes: 'adpm12886'
+
+    Addresses scanned: -
+
+    Datasheet: -
+
   * Maxim MAX34440
 
     Prefixes: 'max34440'
@@ -113,11 +121,12 @@ This driver supports multiple devices: hardware monitoring for Maxim MAX34440
 PMBus 6-Channel Power-Supply Manager, MAX34441 PMBus 5-Channel Power-Supply
 Manager and Intelligent Fan Controller, and MAX34446 PMBus Power-Supply Data
 Logger; PMBus Voltage Monitor and Sequencers for MAX34451, MAX34452, MAX34460,
-and MAX34461; PMBus DC/DC Power Module ADPM12160, ADPM12200, ADPM12250 and
-ADPM12300. The MAX34451 and MAX34452 support monitoring voltage or current of 16
-channels based on GIN pins. The MAX34460 supports 12 voltage channels, and the
-MAX34461 supports 16 voltage channels. The ADPM12160, ADPM12200, ADPM12250 and
-ADPM12300 also monitor both input and output of voltage and current.
+and MAX34461; PMBus DC/DC Power Module ADPM12160, ADPM12200, ADPM12250,
+ADPM12300, and ADPM12886. The MAX34451 and MAX34452 support monitoring voltage
+or current of 16 channels based on GIN pins. The MAX34460 supports 12 voltage
+channels, and the MAX34461 supports 16 voltage channels. The ADPM12160, ADPM12200,
+ADPM12250, ADPM12300, and ADPM12886 also monitor both input and output of voltage
+and current.
 
 The driver is a client driver to the core PMBus driver. Please see
 Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
@@ -175,7 +184,7 @@ in[1-6]_reset_history	Write any value to reset history.
 .. note::
 
     - MAX34446 only supports in[1-4].
-    - ADPM12160, ADPM12200, ADPM12250, and ADPM12300 only supports in[1-2].
+    - ADPM12160, ADPM12200, ADPM12250, ADPM12300, and ADPM12886 only supports in[1-2].
       Label is "vin1" and "vout1" respectively.
 
 Curr
@@ -198,9 +207,10 @@ curr[1-6]_reset_history	Write any value to reset history.
 
     - in6 and curr6 attributes only exist for MAX34440.
     - MAX34446 only supports curr[1-4].
-    - For ADPM12160, ADPM12200, ADPM12250, and ADPM12300, curr[1] is "iin1"
+    - For ADPM12160, ADPM12200, ADPM12250, ADPM12300, and ADPM12886, curr[1] is "iin1"
     - For ADPM12160, and ADPM12200 curr[2-6] are "iout[1-5]".
     - For ADPM12250, and ADPM12300 curr[2-4] are "iout[1-3]".
+    - For ADPM12886 curr[2-3] are "iout[1-2]".
 
 Power
 ~~~~~
@@ -236,7 +246,7 @@ temp[1-8]_reset_history	Write any value to reset history.
 .. note::
    - temp7 and temp8 attributes only exist for MAX34440.
    - MAX34446 only supports temp[1-3].
-   - ADPM12160, ADPM12200, ADPM12250, and ADPM12300 only supports temp[1].
+   - ADPM12160, ADPM12200, ADPM12250, ADPM12300, and ADPM12886 only supports temp[1].
 
 
 .. note::
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index fd6641316454f00eef8d7b7502da9d76c7ed2c4e..1a91702ed6e7551772cb1ac4cba4134719bb086a 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -455,7 +455,7 @@ config SENSORS_MAX34440
 	  If you say yes here you get hardware monitoring support for Maxim
 	  MAX34440, MAX34441, MAX34446, MAX34451, MAX34452, MAX34460, and
 	  MAX34461. Other compatible devices are ADPM12160, ADPM12200,
-	  ADPM12250, and ADPM12300.
+	  ADPM12250, ADPM12300, and ADPM12886.
 
 	  This driver can also be built as a module. If so, the module will
 	  be called max34440.
diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
index 7f71dfe486438752fbbded6ed9c4172dd8ab8534..c088a57d227f563cc2978ad9a457d5dd31cad3ab 100644
--- a/drivers/hwmon/pmbus/max34440.c
+++ b/drivers/hwmon/pmbus/max34440.c
@@ -19,6 +19,7 @@ enum chips {
 	adpm12160,
 	adpm12200,
 	adpm12250,
+	adpm12886,
 	max34440,
 	max34441,
 	max34446,
@@ -114,7 +115,7 @@ static int max34440_read_word_data(struct i2c_client *client, int page,
 		 */
 		if (data->id == max34451 || data->id == max34452 ||
 		    data->id == adpm12160 || data->id == adpm12200 ||
-		    data->id == adpm12250)
+		    data->id == adpm12250 || data->id == adpm12886)
 			return -ENXIO;
 		ret = -ENODATA;
 		break;
@@ -133,7 +134,8 @@ static int max34440_read_word_data(struct i2c_client *client, int page,
 	case PMBUS_VIRT_READ_IOUT_AVG:
 		if (data->id != max34446 && data->id != max34451 &&
 		    data->id != max34452 && data->id != adpm12160 &&
-		    data->id != adpm12200 && data->id != adpm12250)
+		    data->id != adpm12200 && data->id != adpm12250 &&
+		    data->id != adpm12886)
 			return -ENXIO;
 		ret = pmbus_read_word_data(client, page, phase,
 					   MAX34446_MFR_IOUT_AVG);
@@ -223,7 +225,8 @@ static int max34440_write_word_data(struct i2c_client *client, int page,
 					    MAX34440_MFR_IOUT_PEAK, 0);
 		if (!ret && (data->id == max34446 || data->id == max34451 ||
 			     data->id == max34452 || data->id == adpm12160 ||
-			     data->id == adpm12200 || data->id == adpm12250))
+			     data->id == adpm12200 || data->id == adpm12250 ||
+			     data->id == adpm12886))
 			ret = pmbus_write_word_data(client, page,
 					MAX34446_MFR_IOUT_AVG, 0);
 
@@ -297,7 +300,7 @@ static int max34451_read_byte_data(struct i2c_client *client, int page, int reg)
 		 */
 		if (data->id == max34451 || data->id == max34452 ||
 		    data->id == adpm12160 || data->id == adpm12200 ||
-		    data->id == adpm12250)
+		    data->id == adpm12250 || data->id == adpm12886)
 			return -ENXIO;
 		return -ENODATA;
 	default:
@@ -321,7 +324,7 @@ static int max34451_write_byte_data(struct i2c_client *client, int page,
 		 */
 		if (data->id == max34451 || data->id == max34452 ||
 		    data->id == adpm12160 || data->id == adpm12200 ||
-		    data->id == adpm12250)
+		    data->id == adpm12250 || data->id == adpm12886)
 			return -ENXIO;
 		return -ENODATA;
 	default:
@@ -539,6 +542,41 @@ static struct pmbus_driver_info max34440_info[] = {
 		.write_byte_data = max34451_write_byte_data,
 		.write_word_data = max34440_write_word_data,
 	},
+	[adpm12886] = {
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
+		.func[9] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT,
+		.func[10] = PMBUS_HAVE_IIN | PMBUS_HAVE_STATUS_INPUT,
+		.func[14] = PMBUS_HAVE_IOUT,
+		.func[18] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
+		.read_byte_data = max34451_read_byte_data,
+		.read_word_data = max34440_read_word_data,
+		.write_byte_data = max34451_write_byte_data,
+		.write_word_data = max34440_write_word_data,
+	},
 	[max34440] = {
 		.pages = 14,
 		.format[PSC_VOLTAGE_IN] = direct,
@@ -804,7 +842,7 @@ static int max34440_probe(struct i2c_client *client)
 		if (rv)
 			return rv;
 	} else if (data->id == adpm12160 || data->id == adpm12200 ||
-		   data->id == adpm12250) {
+		   data->id == adpm12250 || data->id == adpm12886) {
 		data->iout_oc_fault_limit = PMBUS_IOUT_OC_FAULT_LIMIT;
 		data->iout_oc_warn_limit = PMBUS_IOUT_OC_WARN_LIMIT;
 	}
@@ -818,6 +856,7 @@ static const struct i2c_device_id max34440_id[] = {
 	{ .name = "adpm12200", .driver_data = adpm12200 },
 	{ .name = "adpm12250", .driver_data = adpm12250 },
 	{ .name = "adpm12300", .driver_data = adpm12250 },
+	{ .name = "adpm12886", .driver_data = adpm12886 },
 	{ .name = "max34440", .driver_data = max34440 },
 	{ .name = "max34441", .driver_data = max34441 },
 	{ .name = "max34446", .driver_data = max34446 },

---
base-commit: 9edd5ab2656f040d726b5388f49ceac10bb2944f
change-id: 20260928-hwmon-next-2d766238f031

Best regards,
-- 
Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

