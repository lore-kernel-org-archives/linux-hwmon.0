Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792991016;
	b=0BMGHaxGpzrG802GUTgl2SfSd0Oqy17/DPjXvStojHB9mNhBRhK1YXX/dZH9mX0ybXlc
	 XODTwNO1NN6ABwzwV9MQMzOb4mELlKj3LrB9RvV0ZfvHjuyckL9K0TofC1GIa/7vb9ggY
	 P+79A4Izr9iyjUSt+QALPAyyRaFiuuDnCXJ7om13txP3Ou6+vLyczExX6E3LKLPGUA5Si
	 FwCkb9un0tOKBDRABRjHxrB6uMEcULEd+Ay8Ampgn2aPXTw+JGBtvotxP9eBeIUI60BbA
	 jphzggTJehn/xORKoNXlgGCxZnc0ju0G4/XVtLOdQWdZFKGi6QjU56NDAWPSw8QZ6Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792991016;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-ADIRuleOP-NewSCL:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zCSg4guyIcuhI3vEneIZm2Prmg1IECmLJ2FjMG8Uyr4=;
	b=fTsP520T22cN/4jDY6uD+stPOH/t+p81MtTmBYMrWA+IABpQPf3bomiJ91MVQHrAyuOu
	 UuZvihOiMTYC0VBPocyqd/8VQfWBUjINCqRCEoDduUeGgWONSDcZyWXm8Q9rsBnvpI9N6
	 nm/mghpB1bjKR5jXGUT8TvMRVYJyXWyBSPdRP3rVFPekkorFWA/a26Bb2HzG+hUWkH9bb
	 KmZai7pXAnZpxCfprq6l0rfMpwMT4LsFI1LBa0DygceBl4eBCIt49dFs0gU8aIypeuyqd
	 i/7eJhewSiOEx441rlkWBbGLI8WHG1mtyH+X+sA9LNdC5rb66kn4z8vLoiHHiJu5XrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=kpKMimou;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=Z1rX599a;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2786C606A324;
	Mon, 26 Oct 2026 05:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2786C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=kpKMimou;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=Z1rX599a
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4ootx781099;
	Mon, 26 Oct 2026 01:03:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=zCSg4guyIcuhI3vEneIZm2Prmg1IECmLJ2FjMG8Uyr4=; b=kpKMimo
	uVryDC9kSQOK+CFTwpp8LunmjzJ+vS4cx/YnbgZ12TeygA5BDnASrsi8z+b1cpVc
	Lwa8h0eW7WdSG7havJ/KjmIqWh/TpsFZ0ojDhz2MD4aVgpH4kWkIwapSMf9cK1WO
	OjpC23yXOpJN7SNIxzfP32gqZ0bzQE2KneELlY70/Wq8OBoH4U01xMNejEtpT0ap
	EIHwYZtXJAGJESed0YmgXJda8LEv1njqyZHJ/gqW1NH4RQqS/8nCmWzRREFczccn
	zJFgWdE0oPKv2/05+hFhQ+x01k/nv51RxWXP4stz6L8e0lxpt0zxwuWvI8son007
	IVLucq6JYNx3YoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=zCSg4
	guyIcuhI3vEneIZm2Prmg1IECmLJ2FjMG8Uyr4=; b=Z1rX599atl4A98+nkFVRg
	XwcW+EV5rVkhcjCUGN4uRI+3QzPO8skowj9xAgH65YDudS+vsRXI5pnhVCkzCB0o
	ePvwjj5CDexxKgMSeHl0Elo8VA1yUMsakPx6anhObNKrapB03vv7PsdV2B6d661s
	YUkPmtoquSNtziu+uGdg/xtYmswqCDF7XQTOBKuvt7Uh1L0mrDD9Q8ZoujeqPgC4
	D2GwSu3bAP7Z31EYxG/QkLxVsLDcG3qu8NAbVqweumEF5OxAFsi7Vr96ZvB6+4K/
	jGB/bttFSjivWLHjn/avPOMvliEr6TPLf2B4c4ylPtegaR0MoWV/835DKJVER0Ui
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4hj06h02xm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Oct 2026 01:03:14 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 69Q53CPZ001000
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 26 Oct 2026 01:03:12 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 26 Oct 2026 01:03:12 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 26 Oct 2026 01:03:12 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 26 Oct 2026 01:03:12 -0400
Received: from CJONES7-T01.ad.analog.com (CJONES7-T01.ad.analog.com [10.117.222.42])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 69Q52g3p018821;
	Mon, 26 Oct 2026 01:03:03 -0400
From: Carlos Jones Jr <carlosjr.jones@analog.com>
To: Guenter Roeck <linux@roeck-us.net>,
        Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, <linux-hwmon@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] hwmon: (pmbus/max20830) Add support for MAX20810, MAX20815, LTM4739, LTM4740
Date: Mon, 26 Oct 2026 13:02:41 +0800
Message-ID: <20261026050241.100428-3-carlosjr.jones@analog.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026050241.100428-1-carlosjr.jones@analog.com>
References: <20261026050241.100428-1-carlosjr.jones@analog.com>
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
X-Proofpoint-ORIG-GUID: S8aZIFcL9M4hvnGVkQ6UiJIuKarW49z6
X-Proofpoint-GUID: S8aZIFcL9M4hvnGVkQ6UiJIuKarW49z6
X-Authority-Analysis: v=2.4 cv=GIWdgeNK c=1 sm=1 tr=0 ts=6adedf12 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=OmVn7CZJonkx5R5zMQLL:22 a=gAnH3GRIAAAA:8 a=7_VA5xPD82YY1_Xs3LwA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAxOCBTYWx0ZWRfX9Zb1GH9LwHJM
 pklLD69RfOWNvMWLwqSW1xMSpfDh8lM1dvJ1dXjy3zG+IoMGVQeTiJ1hxh0mt7haCQ8VQJRtrn7
 g9rm+J3gGfOz2ddOh2YatOp3hwBpCUbcA2HY53FstttOr/PrllEO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAxOCBTYWx0ZWRfX8nmo6A9WE7TS
 UwMosbyRb4iyYWK4onsqsKAMKhi0/GHH0KliPT64UQzAVkduZk2AWGyk9yT17/HEFCsBDs4FP44
 qhbXp+6x88txoDRqVEG+Rem/muGLZ+AsON4Sz1tPB6CfZcXBeL6V7wFOrtdIsY6aMGxFHbKZTK2
 q4UmWoAOD+xJFm/QjbC0owt6diHsmmGv3KtZdmhtcUkGdwUP8LnVZ/hvhtq5BWjD9iZQAiAJRP5
 ysBE1LK+7OU/RVmE2qZn0x3C9VfnmMFMsXykp1TnShdKJHZGEqlWnJ1JvNrMJQ0pyGN3NXQ8fwL
 TMHXZjv6oUsJQZ7Rub2WvyGXC6mse3+uDcmmvuDnBFlj7Pwnp5JV4igM50EnHRcdAUWVI5G6VDx
 WknJOLur2Ig7n3Sadnw5ffGz1kj3so2/3asuv0fHgKjbCyj3xIh/Gsea564gcO4z7L0w3gmbUUU
 knTlBPDHy05Y7dIjAyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260018

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
dies and therefore report the die's IC_DEVICE_ID by design: "MAX20810B"
and "MAX20815B" respectively. Match on those identifiers rather than on
the module part names.

Matching is via the existing adi,max20830 fallback compatible; no new
of_match entries are needed.

Signed-off-by: Carlos Jones Jr <carlosjr.jones@analog.com>
---
 Documentation/hwmon/max20830.rst | 51 ++++++++++++++++++++++++++++----
 drivers/hwmon/pmbus/max20830.c   |  4 ++-
 2 files changed, 48 insertions(+), 7 deletions(-)

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
index 4d25a084af09..7cfcf1fe01e1 100644
--- a/drivers/hwmon/pmbus/max20830.c
+++ b/drivers/hwmon/pmbus/max20830.c
@@ -21,6 +21,8 @@ struct max20830_data {
 };
 
 static const char * const supported_chip_ids[] = {
+	"MAX20810B",	/* also reported by the LTM4739 module */
+	"MAX20815B",	/* also reported by the LTM4740 module */
 	"MAX20830",
 	"MAX20830C",
 	"MAX20840C",
@@ -34,7 +36,7 @@ static const char * const supported_chip_ids[] = {
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

