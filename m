Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2080E3EE1F8;
	Mon, 14 Sep 2026 07:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372001; cv=none; b=R16qKteYiMJGhqwKQoJ8OdyScQiat+daXFF2PfDNOYIBkl5LRoOBm0zSYxeInH5S6OFfBRN5pQGizeX5LXWQIYrMYNm6lveLP89ZmWNSNQ4Vuq7KFPxpb8PXWpPKlVXYLRxupGdxJG2Eh0IC9yRBz+3eZ4ySAZOR28vkhHXHYRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372001; c=relaxed/simple;
	bh=QIWfivjx2GOW8s4orZRtQu6ys0g6jRn4SzCAEClhEY4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=g5+qJIIE9VeovUB4rfMaqQusvg2DJRVOrXNQCBpBGPie5FY9tVcyzdE9boJhAseRlacqrSaLThK4LM7yz+WzorXU9Td2XcCQJVqNl7x3enppgvtm3sebp8oC2ZtumuDtFW/LU4H90YKFXeV5Zs3+dP+v2gUFyCR2As8wD/NcJUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=1DeEcovY; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="1DeEcovY"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5gaVs490418;
	Mon, 14 Sep 2026 03:46:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=WPCsp3n8DXeeLf7tNTMYsUERDfb
	n++9ND/Bwb+vOmI8=; b=1DeEcovYKQDZhyC9mTQLZno61GTPsW510UTPzUrLpCv
	UQoB+yeHIszptkmi4o1v0FEZTvuW0pARtDK3oIrhXvBSF41AS67Wz55n/uVSlN1f
	KJk4Jqs80mtjM2Q/tg9nV1/FsTG5I3DjswZkElzBYjC0EZQ0EHO/panciMnFs6Np
	kgtplrOnilGXEaJFaRA/Vjzi2k7nygzsASn7LFiKsHKhIUotV5n7xih/al6nWLNL
	N81nNjv62qu/beTUT0fBgEtzcZyeqGmDhokY4oqWxjO4TWABX+Kx8O+38cQ32EDT
	grsUi4ayoUlcHv4QBvLUsrQ2I8ZZw4pRooevhakTHVw==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gnn2ccmtt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 03:46:11 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 68E7kAUS009379
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 14 Sep 2026 03:46:10 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Mon, 14 Sep
 2026 03:46:10 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 14 Sep 2026 03:46:09 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.192])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 68E7juAU031751;
	Mon, 14 Sep 2026 03:45:59 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Mon, 14 Sep 2026 15:45:17 +0800
Subject: [PATCH] hwmon: (pmbus/max34440): Add support for ADPM12300
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260914-dev_adpm12300-v1-1-15fc8143d457@analog.com>
X-B4-Tracking: v=1; b=H4sIAAymp2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0MT3ZTUsvjElIJcQyNjAwNdY0MT07TEpNQ0MzMDJaCegqLUtMwKsHn
 RsbW1ACHROXRfAAAA
X-Change-ID: 20260914-dev_adpm12300-3145fabef660
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
CC: <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789371956; l=5505;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=QIWfivjx2GOW8s4orZRtQu6ys0g6jRn4SzCAEClhEY4=;
 b=M4+H6J796rM3s3lUGEy41M3aTNU4w4j61ZZmjXdDhdwc0WZ/d9pOtKsVYXwbu3fWtrlztcTpa
 rY6j5hk9F0pDXS2H8j/xK7T1qPnMCrdNortlLn7yy9VrB/AlB/hQM1h
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: JeXnKaFR6CB4kWs3kSFpIilAiklGsRjS
X-Proofpoint-ORIG-GUID: JeXnKaFR6CB4kWs3kSFpIilAiklGsRjS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX6aLIMX32YrOv
 G8XWHysNPIpOQb8ed5CleLMrBGGKOduw2T5fWnysP0KpWE13gVBxv1qqZZBUAmZFB08RqGurC1p
 DHJVDULD0Hp87XlhzNJguOlznK1vMOwHNNVABrUNxlPZ9EbAnaXNKiuYiQKFiSQcVSo9+iERghy
 o+QiAmZ2BQ4yRjNQ4YCyM5+wVb7jhDWkWTV9m27cdFTbvxEkjHA5M8v8PyMiG/XRFZzDosRWvBt
 7J5ESXGcru2Rz55GPkb+zgJKSlTP5mCd1+TpaEIe35vJ6GxM5rxXnrv2PINfMuG8THY3PLjs4aQ
 CSSYWGBlD4jv0cERPYqUrKboor9ewL8ut81Sm3zWlLvHSYCpcadV0QD1RjQikwQKBHYCG4mRL2m
 5a83ta+rYuN2zQkviQZAwm0MtQwvLvjZRw45zzE+ye1UogjTG1HRmt/Z2u/sto59MTu4M6X0MMq
 bBTioLu6eYYcYaffoDA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX68Hbm2BWeYEX
 TZQ89IP/g5uyCYXTBNq86SUpxl143k9hZhRiJJBEaMA1ewfBIDDjFkjTwA7WzR9juAN+Mhh+6W8
 ZBus57o2Ryp8Noq6ZyBm5qnZOW/1q+RZJ7bsHI0J2ylmcWANOnlW
X-Authority-Analysis: v=2.4 cv=bcH+w+PB c=1 sm=1 tr=0 ts=6aa7a643 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22 a=gAnH3GRIAAAA:8
 a=Xpb0v-N9-WCVBoyP4joA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 malwarescore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140108

ADPM12300 is a quarter brick DC/DC Power Module. It is a high power
non-isolated converter capable of delivering regulated 12V with
continuous power level of 3000W. Uses PMBus.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
ADPM12300 is a quarter brick DC/DC Power Module. It is a high power
non-isolated converter capable of delivering regulated 12V with
continuous power level of 3000W. Identical to ADPM12250, it simply
has a higher power rating. Uses PMBus.
---
 Documentation/hwmon/max34440.rst | 28 ++++++++++++++++++----------
 drivers/hwmon/pmbus/Kconfig      |  4 ++--
 drivers/hwmon/pmbus/max34440.c   |  2 ++
 3 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/Documentation/hwmon/max34440.rst b/Documentation/hwmon/max34440.rst
index 866f22b88e9b360ff54aa52807484bb3e859e56e..8ce10aa425d5db30d13f3868c3466ef32efefdee 100644
--- a/Documentation/hwmon/max34440.rst
+++ b/Documentation/hwmon/max34440.rst
@@ -27,6 +27,14 @@ Supported chips:
 
     Datasheet: -
 
+  * ADI ADPM12300
+
+    Prefixes: 'adpm12300'
+
+    Addresses scanned: -
+
+    Datasheet: -
+
   * Maxim MAX34440
 
     Prefixes: 'max34440'
@@ -105,11 +113,11 @@ This driver supports multiple devices: hardware monitoring for Maxim MAX34440
 PMBus 6-Channel Power-Supply Manager, MAX34441 PMBus 5-Channel Power-Supply
 Manager and Intelligent Fan Controller, and MAX34446 PMBus Power-Supply Data
 Logger; PMBus Voltage Monitor and Sequencers for MAX34451, MAX34452, MAX34460,
-and MAX34461; PMBus DC/DC Power Module ADPM12160, ADPM12200, and ADPM12250. The
-MAX34451 and MAX34452 support monitoring voltage or current of 16 channels based
-on GIN pins. The MAX34460 supports 12 voltage channels, and the MAX34461 supports
-16 voltage channels. The ADPM12160, ADPM12200, and ADPM12250 also monitor both
-input and output of voltage and current.
+and MAX34461; PMBus DC/DC Power Module ADPM12160, ADPM12200, ADPM12250 and
+ADPM12300. The MAX34451 and MAX34452 support monitoring voltage or current of 16
+channels based on GIN pins. The MAX34460 supports 12 voltage channels, and the
+MAX34461 supports 16 voltage channels. The ADPM12160, ADPM12200, ADPM12250 and
+ADPM12300 also monitor both input and output of voltage and current.
 
 The driver is a client driver to the core PMBus driver. Please see
 Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
@@ -167,8 +175,8 @@ in[1-6]_reset_history	Write any value to reset history.
 .. note::
 
     - MAX34446 only supports in[1-4].
-    - ADPM12160, ADPM12200, and ADPM12250 only supports in[1-2]. Label is "vin1"
-      and "vout1" respectively.
+    - ADPM12160, ADPM12200, ADPM12250, and ADPM12300 only supports in[1-2].
+      Label is "vin1" and "vout1" respectively.
 
 Curr
 ~~~~
@@ -190,9 +198,9 @@ curr[1-6]_reset_history	Write any value to reset history.
 
     - in6 and curr6 attributes only exist for MAX34440.
     - MAX34446 only supports curr[1-4].
-    - For ADPM12160, ADPM12200, and ADPM12250, curr[1] is "iin1"
+    - For ADPM12160, ADPM12200, ADPM12250, and ADPM12300, curr[1] is "iin1"
     - For ADPM12160, and ADPM12200 curr[2-6] are "iout[1-5]".
-    - For ADPM12250, curr[2-4] are "iout[1-3]".
+    - For ADPM12250, and ADPM12300 curr[2-4] are "iout[1-3]".
 
 Power
 ~~~~~
@@ -228,7 +236,7 @@ temp[1-8]_reset_history	Write any value to reset history.
 .. note::
    - temp7 and temp8 attributes only exist for MAX34440.
    - MAX34446 only supports temp[1-3].
-   - ADPM12160, ADPM12200, and ADPM12250 only supports temp[1].
+   - ADPM12160, ADPM12200, ADPM12250, and ADPM12300 only supports temp[1].
 
 
 .. note::
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 3289ab50a0280d93204ea5fab22e2435c8f01328..90305d5d59e8249b83f33ccef1cb749615bd75e3 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -454,8 +454,8 @@ config SENSORS_MAX34440
 	help
 	  If you say yes here you get hardware monitoring support for Maxim
 	  MAX34440, MAX34441, MAX34446, MAX34451, MAX34452, MAX34460, and
-	  MAX34461. Other compatible devices are ADPM12160, ADPM12200, and
-	  ADPM12250.
+	  MAX34461. Other compatible devices are ADPM12160, ADPM12200,
+	  ADPM12250, and ADPM12300.
 
 	  This driver can also be built as a module. If so, the module will
 	  be called max34440.
diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
index 866d25ae8971c49d3e296efb69fc486e5dbac668..7f71dfe486438752fbbded6ed9c4172dd8ab8534 100644
--- a/drivers/hwmon/pmbus/max34440.c
+++ b/drivers/hwmon/pmbus/max34440.c
@@ -812,10 +812,12 @@ static int max34440_probe(struct i2c_client *client)
 	return pmbus_do_probe(client, &data->info);
 }
 
+/* ADPM12300 is just ADPM12250 with higher power capacity. Reuses driver data */
 static const struct i2c_device_id max34440_id[] = {
 	{ .name = "adpm12160", .driver_data = adpm12160 },
 	{ .name = "adpm12200", .driver_data = adpm12200 },
 	{ .name = "adpm12250", .driver_data = adpm12250 },
+	{ .name = "adpm12300", .driver_data = adpm12250 },
 	{ .name = "max34440", .driver_data = max34440 },
 	{ .name = "max34441", .driver_data = max34441 },
 	{ .name = "max34446", .driver_data = max34446 },

---
base-commit: 1f7154a56e446d4f68542fc04f7376a7d6404609
change-id: 20260914-dev_adpm12300-3145fabef660

Best regards,
-- 
Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

