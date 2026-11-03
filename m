Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695458;
	b=npNq7tjjIOXvEFioqLjBXfAeQUj2LqURoHtbJ15hBCjy6w25Ax6OmXire7U4TlG8vwNZ
	 x79UWwkcQHVFE9Z4LrDA4NLrYeVwpSoTLGHeNDMNgozMtyKXNxG8weOkB2w1xUw+UytS2
	 5UHtSi7JGvUq/Cb5c+p41rw0i1t5teqXMF1PxmOgneW4eyu1IhADm15NRUWmj5yu/hV1s
	 ieLkkeo/gsr0AJaajDT4alpqByFkQlDnzmfS2zfX++b7tvA/RRQRYNIZkc1vMbFFp7eNX
	 l5qWnqW5kVzPvp5trAoZciGLFZP+9YSCB9UHXGAB61MXcuPjmlrYEGUu79n2hhS+aWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695458;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-ADIRuleOP-NewSCL:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Eb3l4qzRlOjzRMTE+H4+ozBjRaLIknHQkwhEPxQaNvU=;
	b=3fnIB5l0UIxOfnyanJtsyJ6PYBy1HA1aO/2UFqE5ED+eBZDwqwLIkRntWLEIeFZesx/k
	 ig12Zslsi9pZ/zfIsaZnHcNcCFXeZQHXuPWO5Qeq9N7One1AZnq3Lf4UWE8fGFtYMY33w
	 fC9MyV9/kUWWdbYD054CngsoVKPMAbpgmQViOzBmIZWQQbaUcL/soWoQxWCvG2fTGJSJT
	 +G0EyRsoCxcH75x9j2rMF0CPn6df+IwwHJtQLW/T+XqZCp0oRMz+6Z6LaxyOLRzy8RvnW
	 xDC0d4w170UEh26r/KaemcoWgxIQN/3q7QtXal9c6vfBPnAZsSzTNNsYA3RNRMM4Q3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=FGWGuBOD;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=BoHhlXp1;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73923606A32D;
	Tue,  3 Nov 2026 08:44:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73923606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=FGWGuBOD;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=BoHhlXp1
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A37MZI93328568;
	Tue, 3 Nov 2026 03:44:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=Eb3l4qzRlOjzRMTE+H4+ozBjRaLIknHQkwhEPxQaNvU=; b=FGWGuBO
	DOt9y1iHwNzsMwnCfQrxYPsVpiqZFUjePsKPxhTBUelrsifbmAE0eMFmRcW2eBpi
	UYPpGYarqvHwdYFKg2VRt5y3s7HrM67Zzd9Os8paegnBq1Ip4IGiiN3XffqlrvwQ
	LEp6AfQEELelhNQDEAJ/yEjDFpsat3Ddv5jhji38Kams1Y4bCGR7vf+lDWBtAwmi
	/qI4CfRQ2UOTrlSlaM5AyDtV+/ASUgdK2n+7NXUXQ50boWSNVUhNOPTj/LeSQbpN
	JO4Teg1SSXbuRElp7O74aUMNipr7U9+09krjllDiXOvo4bhnzimDHQGw5eDbAwoE
	ff1VvDh6NRRFt+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=Eb3l4
	qzRlOjzRMTE+H4+ozBjRaLIknHQkwhEPxQaNvU=; b=BoHhlXp1JBo0mqa5e/5SD
	gmCO4vOxAJjIA8nu5KzzSdxB6zopBb4MZ566q3/F0Y/luNDaCxnnjd9RB1DqdT/K
	D8u+IXlOaiZGC1IjJz8s9pliG8NkRbgGBV5sL71yE94bhe65Lg9H11IvfgEr0ndq
	tvnixTjVmBxBrNgr8bwsrgkuwnH1Lqh7Bd7i7JVyBwwdY5gXPJo8wRGnxTixsfur
	twP1t9LJPjlBIsBN6fohRvSSRzpLBpkIbFtEuz5WH4e7+T52ITC8cWxjQECh0K9X
	cY8WreSig9sD9a8bkrEALiGvo4qHibCdFA5W2U3ZYexPC1P7iQdnxvVK9YeVHdpI
	A==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4hq0nektuc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Nov 2026 03:43:59 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 6A38hwib005064
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 Nov 2026 03:43:58 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Tue, 3 Nov
 2026 03:43:58 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Tue, 3 Nov 2026 03:43:58 -0500
Received: from CJONES7-T01.ad.analog.com ([10.66.6.192])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6A38hdTa027828;
	Tue, 3 Nov 2026 03:43:53 -0500
From: Carlos Jones <carlosjr.jones@analog.com>
To: <linux@roeck-us.net>
CC: <alexisczezar.torreno@analog.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-hwmon@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Carlos Jones Jr
	<carlosjr.jones@analog.com>
Subject: [PATCH v2 2/2] hwmon: (pmbus/max20830) Add support for MAX20810, MAX20815, LTM4739, LTM4740
Date: Tue, 3 Nov 2026 16:43:31 +0800
Message-ID: <20261103084331.449-3-carlosjr.jones@analog.com>
X-Mailer: git-send-email 2.51.0.windows.2
In-Reply-To: <20261103084331.449-1-carlosjr.jones@analog.com>
References: <20261103084331.449-1-carlosjr.jones@analog.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=C+d8WgP+ c=1 sm=1 tr=0 ts=6ae99ecf cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=uXIjobp8t2wMuQ0fPvqm:22 a=gAnH3GRIAAAA:8 a=mQ2e7beuRUobgMt-2_0A:9
X-Proofpoint-GUID: wI0R7Z8_c5ovuuumJdmVfbQ5_sF0xDhK
X-Proofpoint-ORIG-GUID: wI0R7Z8_c5ovuuumJdmVfbQ5_sF0xDhK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzNCBTYWx0ZWRfX7r5yxoqyhj0O
 qXfWZNm+ofQeipPcuJI1z5ZhBdgy/W8PsyCNZHEytk7smvzYwMRuDY/SiwF35hpDOTsmJ+S3cSS
 bH1tSC/U+bk81ZvtR+OczhJe/L0WaVtRjOOk+kD5ITfAI6ZQB7vn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzNCBTYWx0ZWRfXwvacAEpTJB+U
 GoNnmBZhZMLGGelx55JlK4217Td5NwnO4b8E6WeCVZF6XaPv26vWpPNdHwf7B7xH5CLeeAoKwLe
 6BjJ0CdftFDvMnA9hodKU2CEYbuS1zSqEiv+5Gf43vdvOJIR4SdaayhxKt3wE7Qhb1VjcC/npgm
 R0P5w+YInocvYkB14A4DQIvQ1cbfNui6LYLd3yvgegqL7xy2t5i+DQrFmpjkqew+obyKmh0b5d6
 aWba2lruAXl2X5LUKuQZbcBTys3pyB+9RhpZIlT21D8zK620i2GkUHIshTfZOa0kOfQD+oW0d2E
 NQ1+0ZrFjByZSzukmu9XPpr8lSEnmS7uX7lC/Ma4iuf/5BJfzEWu8qTwzejHYfm6To5Tc2gUPVE
 joT5ZPaL2uBayZYv6upqaslaGdiKUCEvKAio049fPZ8zQrcizVy337zbnvdmTLyTv8ZYM9zr7Z7
 sw7LW1ZCUUsgpvxUh7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 phishscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030034

From: Carlos Jones Jr <carlosjr.jones@analog.com>

Add support for additional members of the MAX20830 family:
- MAX20810: 2.7V-16V input, up to 10A output
- MAX20815: 2.7V-16V input, up to 15A output
- LTM4739:  3V-15V input, up to 10A output
- LTM4740:  3V-15V input, up to 15A output

The LTM4739 and LTM4740 are the LTM-series equivalents of the MAX20810
and MAX20815 respectively. All share the MAX20830 PMBus command set and
telemetry, so no new register handling is required; they are accepted by
matching their IC_DEVICE_ID.

The LTM4739 and LTM4740 are uModules built around the MAX20810/MAX20815
dies and report the die's IC_DEVICE_ID with a "B" suffix ("MAX20810B" /
"MAX20815B"), not the "LTM4739"/"LTM4740" names printed in their
datasheets (which are being corrected to match). Only the IDs observed on
hardware are matched; the plain datasheet IDs ("MAX20810", "MAX20815",
"LTM4739", "LTM4740") are not matched, as no part reporting them has been
observed.

Matching is via the existing adi,max20830 fallback compatible; no new
of_match entries are needed.

Signed-off-by: Carlos Jones Jr <carlosjr.jones@analog.com>
---
 Documentation/hwmon/max20830.rst | 51 ++++++++++++++++++++++++++++----
 drivers/hwmon/pmbus/max20830.c   | 10 ++++++-
 2 files changed, 54 insertions(+), 7 deletions(-)

diff --git a/Documentation/hwmon/max20830.rst b/Documentation/hwmon/max20830.rst
index b850f3b6e40d..7c4f27f40d60 100644
--- a/Documentation/hwmon/max20830.rst
+++ b/Documentation/hwmon/max20830.rst
@@ -5,6 +5,38 @@ Kernel driver max20830
 
 Supported chips:
 
+  * Analog Devices LTM4739
+
+    Prefix: 'ltm4739'
+
+    Addresses scanned: -
+
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/ltm4739.pdf
+
+  * Analog Devices LTM4740
+
+    Prefix: 'ltm4740'
+
+    Addresses scanned: -
+
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/ltm4740.pdf
+
+  * Analog Devices MAX20810
+
+    Prefix: 'max20810'
+
+    Addresses scanned: -
+
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max20810.pdf
+
+  * Analog Devices MAX20815
+
+    Prefix: 'max20815'
+
+    Addresses scanned: -
+
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max20815.pdf
+
   * Analog Devices MAX20830
 
     Prefix: 'max20830'
@@ -37,13 +69,20 @@ Author:
 Description
 -----------
 
-This driver supports hardware monitoring for Analog Devices MAX20830, MAX20830C
-and MAX20840C. These are Step-Down Switching Regulator with PMBus Interface.
+This driver supports hardware monitoring for Analog Devices MAX20810, MAX20815,
+MAX20830, MAX20830C, MAX20840C, LTM4739, and LTM4740 Step-Down Switching
+Regulators with PMBus Interface.
+
+The MAX20810 and LTM4739 are 10A fully integrated step-down DC-DC switching
+regulators (2.7V-16V and 3V-15V input respectively). The MAX20815 and LTM4740
+provide up to 15A. The MAX20830 and MAX20830C provide up to 30A. The MAX20840C
+provides up to 40A. Through the PMBus interface, all devices can monitor
+input/output voltages, output current and temperature.
 
-MAX20830, and MAX20830C are 2.7V to 16V, 30A fully integrated step-down DC-DC
-switching regulators. MAX20840C is similar but can reach 40A. Through the PMBus
-interface, these devices can monitor input/output voltages, output current and
-temperature.
+LTM4739 and LTM4740 are the LTM-family equivalents of MAX20810 and MAX20815
+respectively, sharing an identical PMBus command set. These modules report the
+underlying die's IC_DEVICE_ID by design ("MAX20810B" and "MAX20815B"
+respectively), which the driver matches during probe.
 
 The driver is a client driver to the core PMBus driver. Please see
 Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max20830.c
index 4d25a084af09..39cce250beca 100644
--- a/drivers/hwmon/pmbus/max20830.c
+++ b/drivers/hwmon/pmbus/max20830.c
@@ -20,7 +20,15 @@ struct max20830_data {
 	u32 vout_rfb2;
 };
 
+/*
+ * IC_DEVICE_ID strings matched at probe. The LTM4739/LTM4740 uModules
+ * report their MAX die ID with a "B" suffix, not the "LTM47xx" names in
+ * their datasheets (being corrected); the plain datasheet IDs are not
+ * matched, as no such part has been observed.
+ */
 static const char * const supported_chip_ids[] = {
+	"MAX20810B",	/* LTM4739 */
+	"MAX20815B",	/* LTM4740 */
 	"MAX20830",
 	"MAX20830C",
 	"MAX20840C",
@@ -34,7 +42,7 @@ static const char * const supported_chip_ids[] = {
  * like in1_max, in1_crit, etc. will not be available. Only in1_input (the
  * scaled output voltage) is supported.
  *
- * MAX20830 uses an external resistor divider for voltage sensing:
+ * MAX20830 family uses an external resistor divider for voltage sensing:
  * - VOUT_COMMAND and VOUT_MAX set the reference voltage at the feedback pin
  * - READ_VOUT reports the feedback voltage, which needs to be scaled for actual
  *   output voltage
-- 
2.43.0

