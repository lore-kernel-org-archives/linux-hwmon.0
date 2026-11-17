Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904094;
	b=sOVQHzL0aVnd6K6TKVXR3npsGhpidLvfUAUe5lMPwj9Ej9auM+GeIsQ3iT+BGrfHwpFg
	 MwSs3kNPK3R1YroDxcCyWwS3wNR0vUWvIscRXohz2XaBjAh4NdHlTiGbpYx9MT/OxHMg3
	 bGOFcoZ6kd/4Z0Jz2FQJs0UTKQ5TYu5CpAkGZ7Q3DFpLtLudk7aV6nSAHt/0KRCfckwEw
	 azFzuf9RELaatqIAz439D4q6a3nMH9B6GfyHUzYco+cGuPVbXW6B2JIcrIom27eaOw4g5
	 od2oEY2SvLuTfqwlFmKk3kMCP8AHx3+4mODf7y2jwoPq2hh2VxnYLCaUT/MlJTpexNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904094;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-ID:References:
	 In-Reply-To:To:CC:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ADIRuleOP-NewSCL:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5I7cdY4MD8krWD0pMtaN6iy4DroLKW6cXxADkcLxD18=;
	b=NLH+ZSoE+8kAq4rc8ghLSlPswIHNVoQaXqSZ6l+T0AqQXpN7/iu7WAgxcu/0Iv8DJrRG
	 W9kgfzb6sPYw7JM4KJunjXdctnOtRxFOK9bOse8NxgXvn60eLiUeUC1lrZX+jEAXPRnY0
	 DZ/yIrqxLkMqqeIO983kyRsfyC0ZfeJQ7DI1eNfQ/XTImsDX6h7Qk+z52fLiWo8BiY529
	 43wRplZIWxWObyEh0ohYdwUNDxDY6pyq8mFjeG2s6xo/RCYX5xah52bSXAwvRg6eoKiZr
	 v/EZOA67NoSBqwYtCyYrh3JW7rWOGofuw4Ug/VhgZjyIhesT9SbOCaI2ybUznehcvXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=foiYl38h;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=zynFIIbx;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F25D606A8A4;
	Tue, 17 Nov 2026 08:28:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F25D606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=foiYl38h;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=zynFIIbx
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH7JXn83553771;
	Tue, 17 Nov 2026 03:27:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=5I7cdY4MD8krWD0pMtaN6iy4DroLKW6cXxADkcLxD18=; b=foiYl38
	haojsnEqNbcfYuR9GQGIjONQXH30QrANrPzPbv7riqGoPD1FsOC0nv0xtlIJ51Ye
	txM+KDT0qgll1i8Hv9xoPeUk7b1Ipbx6uygzcwOpCk7IqMdhRym89Wr4QlsyUsV9
	j4NHdlagfadp7FHaEQ1CGo9dpgXNxxZMuS6QV7+O+frZQoyjmqHHUihDflk4Culm
	5L3K57AeV0P+6VwmJ+Jn+ykJiciOXtde1ydQztwKzMH6PQcOD1f32N0pNV49pnWj
	BY+QuPcWqNmsdRR2Eq66+VJpuwY6B58mU0JMTldgp+iAu7CWqdsBSzmgoTbIJQRE
	XOuVsJao/TabhNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=5I7cd
	Y4MD8krWD0pMtaN6iy4DroLKW6cXxADkcLxD18=; b=zynFIIbxlrWuIM+qx/rSk
	uPrFMHy5DKGhYjyu3U2nedMQFTJkBqIycc4koA9Lv+Qfrxd2lr3G2Fl8SV6UualT
	Jc+O9dtqJu08KXQCMgg76Xn5BBXrSMNoaR9l9yJkcQp88Ft9qby7Xrgdu9mdsra6
	p721fODFSWjhtHMxhyiQModmpvbxEEXDmh0kJFI/noOlz+KCDAdSplpabpGVLy/u
	zunquDT3n8/WjzTy7uATL9O2gWMHtFPjTt+oRO980OzgPvrS7jHxoWmxLlQyPtTF
	PEIsr7tp1QGPldQiI2YmyPxEHVMFrL+0WaUEtukD5wCPsjmAZH/txfIP5qFK7wKS
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4j0jegrchh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 03:27:45 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6AH8RiiL046879
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 03:27:44 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 17 Nov
 2026 03:27:44 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Tue, 17 Nov 2026 03:27:44 -0500
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.192])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6AH8RFcm007690;
	Tue, 17 Nov 2026 03:27:35 -0500
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Tue, 17 Nov 2026 16:26:49 +0800
Subject: [PATCH v3 2/3] hwmon: ltc4283: Add support for the LTC4284 swap
 controller
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
Content-Transfer-Encoding: 8bit
Message-ID: <20261117-staging-ltc4284-v3-2-326bb844e08c@analog.com>
References: <20261117-staging-ltc4284-v3-0-326bb844e08c@analog.com>
In-Reply-To: <20261117-staging-ltc4284-v3-0-326bb844e08c@analog.com>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Guenter Roeck
	<linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
	<rdunlap@infradead.org>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz
 Golaszewski <brgl@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>,
        Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794904036; l=26711;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=mH6KVTxaTnRhtCcJPSP4bQ72O2KyExUDfRllWfnCW+U=;
 b=fPY21Hax/t1KpNP2TVxqmjCaXiewGZ7d1mY7/mFJWPbdlHIRagwsV0iS4mPB4jnTMde1o4Koi
 Rvl+1eq3YZcA1uoAdNF4aAljSTOVcFaRDQaCc+kGCHl22wRCLSNNz9A
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: j3-Zp5JK_v3-Z8UulJnJjKQcPURdF71C
X-Proofpoint-GUID: j3-Zp5JK_v3-Z8UulJnJjKQcPURdF71C
X-Authority-Analysis: v=2.4 cv=TL/Q2Fla c=1 sm=1 tr=0 ts=6afc1002 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=gAnH3GRIAAAA:8
 a=njBImJOptV2SYcK6kHoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzMyBTYWx0ZWRfX21HXQTcT+Wgj
 tGHPAPzaymfd0dz8V08XOtrdtBb/RGHYsYunww4hS3AZH0cSI4QZ4B8xGlKUL7xNR7253zYpcvE
 lIwAAc5sQAkEvBnVJzag1kLOCztFs6W2Y1FOMCmYCYvRls/yxHpf6QDlK/79gAbmRkKrmKgYc2e
 UqzG1Vr7u/r3w99NgDByd2jVoxXEqoUbqOTUVVV5BE3N88VabO4QeoD9FtkXtZD4TCY3wFuggfr
 TDy8dplt6ChtRMjV91ZOKvTjFloQl4rrVM+kXSIkw2r/me5wE7acUpcfwqAw2WT1g0MYJzgIfGg
 0TB88jlX/e45yfvDfU6XVoqPZC+jB/R7YS9djL1Vna4AeV09RwBuntouDcjAZ+3N6S3YGbpd0Z2
 ylHxamVQv5Li7qIjt/cfSUFJF46Z5M5xNgk15YwpF9RM1CrX6HyPU8xcDT4e3Ca/1+cBjflOIWA
 YV+0TlFvlsjUXOVOpww==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzMyBTYWx0ZWRfX7YR88219jNE+
 DgC6zM7UM7o5FJZeKDNfrAIkHpdxUfoLkH8UTzd+LctG55MgBJ+q4TKVpW0lFZuf8V0BBhx0o7H
 1cIKgGoO6b6uyjBu4ECC4QeRHxZHp8RTg1EJxL3GqqkJ/HO0dsxB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170033

The LTC4284 is similar to the LTC4283 but adds dual current sense
channels (SENSE1 and SENSE2) with independent sense resistors (rsense
and rsense2). It also introduces a dedicated ADC sense resistor (radc)
connected to the ADC+/ADC- pins, which is used for power and energy
calculations instead of the primary sense resistor.

The driver supports both chips through a shared channel table, hiding
the second current channel for LTC4283 via the is_visible() callback.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
 Documentation/hwmon/ltc4283.rst |  54 ++++++--
 drivers/hwmon/Kconfig           |   6 +-
 drivers/hwmon/ltc4283.c         | 285 +++++++++++++++++++++++++++++++---------
 3 files changed, 269 insertions(+), 76 deletions(-)

diff --git a/Documentation/hwmon/ltc4283.rst b/Documentation/hwmon/ltc4283.rst
index 99b1ee05f62993a794a7b2b3455f2b61b55cd68c..9fc615d4e729a83b3f305f7ace7b4064e88931ba 100644
--- a/Documentation/hwmon/ltc4283.rst
+++ b/Documentation/hwmon/ltc4283.rst
@@ -15,23 +15,37 @@ Supported chips:
 
         https://www.analog.com/media/en/technical-documentation/data-sheets/ltc4283.pdf
 
+  * Analog Devices LTC4284
+
+    Prefix: 'ltc4284'
+
+    Addresses scanned: -
+
+    Datasheet:
+
+        https://www.analog.com/media/en/technical-documentation/data-sheets/ltc4284.pdf
+
 Author: Nuno Sá <nuno.sa@analog.com>
 
 Description
 ___________
 
-The LTC4283 negative voltage hot swap controller drives an external N-channel
-MOSFET to allow a board to be safely inserted and removed from a live backplane.
-The device features programmable current limit with foldback and independently
-adjustable inrush current to optimize the MOSFET safe operating area (SOA). The
-SOA timer limits MOSFET temperature rise for reliable protection against
-overstresses. An I2C interface and onboard gear-shift ADC allow monitoring of
-board current, voltage, power, energy, and fault status.  Additional features
-respond to input UV/OV, interrupt the host when a fault has occurred, notify
-when output power is good, detect insertion of a board, turn off the MOSFET
-if an external supply monitor fails to indicate power good within a timeout
-period, and auto-reboot after a programmable delay following a host commanded
-turn-off.
+The LTC4283 and LTC4284 are negative voltage hot swap controllers that drive
+external N-channel MOSFETs to allow a board to be safely inserted and removed
+from a live backplane. The devices feature programmable current limit with
+foldback and independently adjustable inrush current to optimize the MOSFET
+safe operating area (SOA). The SOA timer limits MOSFET temperature rise for
+reliable protection against overstresses. An I2C interface and onboard
+gear-shift ADC allow monitoring of board current, voltage, power, energy, and
+fault status. Additional features respond to input UV/OV, interrupt the host
+when a fault has occurred, notify when output power is good, detect insertion
+of a board, turn off the MOSFET if an external supply monitor fails to indicate
+power good within a timeout period, and auto-reboot after a programmable delay
+following a host commanded turn-off.
+
+The LTC4284 extends the LTC4283 with dual-gate drivers for parallel or staged
+start operation modes, configured via the MODE pin. It also provides additional
+current sense channels (SENSE1 and SENSE2) for monitoring multiple load paths.
 
 Sysfs entries
 _____________
@@ -41,6 +55,11 @@ attributes are read-only. Note that the VADIOx channels might not be available
 if the ADIO pins are used as GPIOs (naturally also affects the respective
 differential channels).
 
+.. note::
+   LTC4284 provides two current sense channels (curr1, curr2) for
+   monitoring SENSE1+/SENSE1- and SENSE2+/SENSE2- respectively. LTC4283 only
+   provides curr1 for monitoring the main sense input (SENSE+/SENSE-).
+
 ======================= ==========================================
 in0_lcrit_alarm         Critical Undervoltage alarm
 in0_crit_alarm          Critical Overvoltage alarm
@@ -225,6 +244,17 @@ curr1_max_alarm		Overcurrent alarm
 curr1_crit_alarm        Critical Overcurrent alarm
 curr1_label		Channel label (ISENSE)
 
+curr2_input		Sense current (mA)
+curr2_min		Undercurrent threshold
+curr2_max		Overcurrent threshold
+curr2_lowest		Lowest measured current
+curr2_highest		Highest measured current
+curr2_reset_history	Write 1 to reset curr2 history.
+curr2_min_alarm		Undercurrent alarm
+curr2_max_alarm		Overcurrent alarm
+curr2_crit_alarm        Critical Overcurrent alarm
+curr2_label		Channel label (ISENSE2)
+
 power1_input		Power (in uW)
 power1_min		Low power threshold
 power1_max		High power threshold
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 3ae676a56d95ca2664c27f9cd82d6c75fd15b7a7..0e5f2fd12d08b609391d520853eeef4203479fac 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1256,13 +1256,13 @@ config SENSORS_LTC4282
 	  be called ltc4282.
 
 config SENSORS_LTC4283
-	tristate "Analog Devices LTC4283"
+	tristate "Analog Devices LTC4283 and similar devices"
 	depends on I2C
 	select REGMAP_I2C
 	select AUXILIARY_BUS
 	help
-	  If you say yes here you get support for Analog Devices LTC4283
-	  Negative Voltage Hot Swap Controller I2C interface.
+	  If you say yes here you get support for Analog Devices LTC4283 and
+	  similar devices Negative Voltage Hot Swap Controller I2C interface.
 
 	  This driver can also be built as a module. If so, the module will
 	  be called ltc4283.
diff --git a/drivers/hwmon/ltc4283.c b/drivers/hwmon/ltc4283.c
index 9ec409bc26482260e696bf7a6c40b0dc9e1f55b8..9c57b52a84b6a3ef61f4d7b4b073b25e56b87ae2 100644
--- a/drivers/hwmon/ltc4283.c
+++ b/drivers/hwmon/ltc4283.c
@@ -48,6 +48,10 @@
 #define LTC4283_ADC_ALM_LOG_2		0x06
 #define LTC4283_ADC_ALM_LOG_3		0x07
 #define LTC4283_ADC_ALM_LOG_4		0x08
+#define   LTC4284_SENSE2_LOW_ALM	BIT(0)
+#define   LTC4284_SENSE2_HIGH_ALM	BIT(1)
+#define   LTC4284_SENSE1_LOW_ALM	BIT(2)
+#define   LTC4284_SENSE1_HIGH_ALM	BIT(3)
 #define LTC4283_ADC_ALM_LOG_5		0x09
 #define LTC4283_CONTROL_1		0x0a
 #define   LTC4283_RW_PAGE_MASK		BIT(0)
@@ -81,8 +85,16 @@
 #define   LTC4283_ADC_MASK		GENMASK(2, 0)
 #define LTC4283_ADC_SELECT(c)		(0x13 + (c) / 8)
 #define   LTC4283_ADC_SELECT_MASK(c)	BIT((c) % 8)
+#define LTC4283_ADC_SELECT_2		0x14
+#define   LTC4284_SENSE1_SELECT_MASK	BIT(2)
+#define   LTC4284_SENSE2_SELECT_MASK	BIT(3)
 #define LTC4283_SENSE_MIN_TH		0x1b
 #define LTC4283_SENSE_MAX_TH		0x1c
+/* LTC4284 only - dual sense channel thresholds */
+#define LTC4284_SENSE1_MIN_TH		0x35
+#define LTC4284_SENSE1_MAX_TH		0x36
+#define LTC4284_SENSE2_MIN_TH		0x37
+#define LTC4284_SENSE2_MAX_TH		0x38
 #define LTC4283_VPWR_MIN_TH		0x1d
 #define LTC4283_VPWR_MAX_TH		0x1e
 #define LTC4283_POWER_MIN_TH		0x1f
@@ -102,6 +114,13 @@
 #define LTC4283_POWER_MAX		0x49
 #define LTC4283_RESERVED_68		0x68
 #define LTC4283_RESERVED_6D		0x6D
+/* LTC4284 only - dual sense channels */
+#define LTC4284_SENSE1			0x68
+#define LTC4284_SENSE1_MIN		0x69
+#define LTC4284_SENSE1_MAX		0x6A
+#define LTC4284_SENSE2			0x6B
+#define LTC4284_SENSE2_MIN		0x6C
+#define LTC4284_SENSE2_MAX		0x6D
 /* get channels from ADC 2 */
 #define LTC4283_ADC_2(c)		(0x4a + (c) * 3)
 #define LTC4283_ADC_2_MIN(c)		(0x4b + (c) * 3)
@@ -173,7 +192,26 @@ enum {
 #define LTC4283_ADIO34_MAX \
 	LTC4283_ADC_2_MAX_DIFF(LTC4283_CHAN_ADIO34 - LTC4283_CHAN_ADIN12)
 
+enum ltc4283_chip_id {
+	ID_LTC4283,
+	ID_LTC4284,
+};
+
+struct ltc4283_chip_info {
+	enum ltc4283_chip_id id;
+	const char *name;
+	u8 sense_reg[2];
+	u8 sense_min_reg[2];
+	u8 sense_max_reg[2];
+	u8 sense_min_th_reg[2];
+	u8 sense_max_th_reg[2];
+	u8 curr_alarm_reg;
+	u8 curr_alarm_high_mask[2];
+	u8 curr_alarm_low_mask[2];
+};
+
 struct ltc4283_hwmon {
+	const struct ltc4283_chip_info *info;
 	struct regmap *map;
 	struct i2c_client *client;
 	unsigned long gpio_mask;
@@ -182,12 +220,33 @@ struct ltc4283_hwmon {
 	unsigned long power_max;
 	/* in millivolt */
 	u32 vsense_max;
-	/* in tenths of microohm*/
+	/* in tenths of microohm - For LTC4283 SENSE or LTC4284 SENSE1 */
 	u32 rsense;
+	/* in tenths of microohm - For LTC4284 SENSE2 only */
+	u32 rsense2;
+	/* in tenths of microohm - For LTC4284 ADC power measurement */
+	u32 radc;
 	bool energy_en;
 	bool ext_fault;
 };
 
+static u32 ltc4283_get_rsense(const struct ltc4283_hwmon *st, u32 channel)
+{
+	if (channel)
+		return st->rsense2;
+
+	return st->rsense;
+}
+
+static u32 ltc4283_get_rpower(const struct ltc4283_hwmon *st)
+{
+	/* For LTC4284, ADC uses radc. For LTC4283, ADC uses rsense. */
+	if (st->info->id == ID_LTC4284)
+		return st->radc;
+
+	return st->rsense;
+}
+
 static int ltc4283_read_voltage_word(const struct ltc4283_hwmon *st,
 				     u32 reg, u32 fs, long *val)
 {
@@ -380,56 +439,63 @@ static int ltc4283_read_in(struct ltc4283_hwmon *st, u32 attr, u32 channel,
 }
 
 static int ltc4283_read_current_word(const struct ltc4283_hwmon *st, u32 reg,
-				     long *val)
+				     u32 channel, long *val)
 {
 	u64 temp = (u64)LTC4283_ADC1_FS_uV * DECA * MILLI;
 	unsigned int __raw;
+	u32 rsense;
 	int ret;
 
 	ret = regmap_read(st->map, reg, &__raw);
 	if (ret)
 		return ret;
 
-	*val = DIV64_U64_ROUND_CLOSEST(__raw * temp,
-				       BIT_ULL(16) * st->rsense);
+	rsense = ltc4283_get_rsense(st, channel);
+	*val = DIV64_U64_ROUND_CLOSEST(__raw * temp, BIT_ULL(16) * rsense);
 
 	return 0;
 }
 
 static int ltc4283_read_current_byte(const struct ltc4283_hwmon *st, u32 reg,
-				     long *val)
+				     u32 channel, long *val)
 {
 	u64 temp = (u64)LTC4283_ADC1_FS_uV * DECA * MILLI;
-	u32 curr;
+	u32 curr, rsense;
 	int ret;
 
 	ret = regmap_read(st->map, reg, &curr);
 	if (ret)
 		return ret;
 
-	*val = DIV_ROUND_CLOSEST_ULL(curr * temp, BIT(8) * st->rsense);
+	rsense = ltc4283_get_rsense(st, channel);
+	*val = DIV_ROUND_CLOSEST_ULL(curr * temp, BIT(8) * rsense);
 	return 0;
 }
 
-static int ltc4283_read_curr(struct ltc4283_hwmon *st, u32 attr, long *val)
+static int ltc4283_read_curr(struct ltc4283_hwmon *st, u32 attr, u32 channel, long *val)
 {
 	switch (attr) {
 	case hwmon_curr_input:
-		return ltc4283_read_current_word(st, LTC4283_SENSE, val);
+		return ltc4283_read_current_word(st, st->info->sense_reg[channel],
+						 channel, val);
 	case hwmon_curr_highest:
-		return ltc4283_read_current_word(st, LTC4283_SENSE_MAX, val);
+		return ltc4283_read_current_word(st, st->info->sense_max_reg[channel],
+						 channel, val);
 	case hwmon_curr_lowest:
-		return ltc4283_read_current_word(st, LTC4283_SENSE_MIN, val);
+		return ltc4283_read_current_word(st, st->info->sense_min_reg[channel],
+						 channel, val);
 	case hwmon_curr_max:
-		return ltc4283_read_current_byte(st, LTC4283_SENSE_MAX_TH, val);
+		return ltc4283_read_current_byte(st, st->info->sense_max_th_reg[channel],
+						 channel, val);
 	case hwmon_curr_min:
-		return ltc4283_read_current_byte(st, LTC4283_SENSE_MIN_TH, val);
+		return ltc4283_read_current_byte(st, st->info->sense_min_th_reg[channel],
+						 channel, val);
 	case hwmon_curr_max_alarm:
-		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_1,
-					  LTC4283_SENSE_HIGH_ALM, val);
+		return ltc4283_read_alarm(st, st->info->curr_alarm_reg,
+					  st->info->curr_alarm_high_mask[channel], val);
 	case hwmon_curr_min_alarm:
-		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_1,
-					  LTC4283_SENSE_LOW_ALM, val);
+		return ltc4283_read_alarm(st, st->info->curr_alarm_reg,
+					  st->info->curr_alarm_low_mask[channel], val);
 	case hwmon_curr_crit_alarm:
 		return ltc4283_read_alarm(st, LTC4283_FAULT_STATUS,
 					  LTC4283_OC_MASK, val);
@@ -443,6 +509,7 @@ static int ltc4283_read_power_word(const struct ltc4283_hwmon *st,
 {
 	u64 temp = (u64)LTC4283_ADC1_FS_uV * LTC4283_ADC2_FS_mV * DECA * MILLI;
 	unsigned int __raw;
+	u32 resistor = ltc4283_get_rpower(st);
 	int ret;
 
 	ret = regmap_read(st->map, reg, &__raw);
@@ -453,7 +520,7 @@ static int ltc4283_read_power_word(const struct ltc4283_hwmon *st,
 	 * Power is given by:
 	 *     P = CODE(16b) * 32.768mV * 2.048V / (2^16 * Rsense)
 	 */
-	*val = DIV64_U64_ROUND_CLOSEST(temp * __raw, BIT_ULL(16) * st->rsense);
+	*val = DIV64_U64_ROUND_CLOSEST(temp * __raw, BIT_ULL(16) * resistor);
 
 	return 0;
 }
@@ -462,6 +529,7 @@ static int ltc4283_read_power_byte(const struct ltc4283_hwmon *st,
 				   u32 reg, long *val)
 {
 	u64 temp = (u64)LTC4283_ADC1_FS_uV * LTC4283_ADC2_FS_mV * DECA * MILLI;
+	u32 resistor = ltc4283_get_rpower(st);
 	u32 power;
 	int ret;
 
@@ -469,7 +537,7 @@ static int ltc4283_read_power_byte(const struct ltc4283_hwmon *st,
 	if (ret)
 		return ret;
 
-	*val = DIV_ROUND_CLOSEST_ULL(power * temp, BIT(8) * st->rsense);
+	*val = DIV_ROUND_CLOSEST_ULL(power * temp, BIT(8) * resistor);
 
 	return 0;
 }
@@ -501,6 +569,7 @@ static int ltc4283_read_power(struct ltc4283_hwmon *st, u32 attr, long *val)
 static int ltc4283_read_energy(struct ltc4283_hwmon *st, u32 attr, s64 *val)
 {
 	u64 temp = LTC4283_ADC1_FS_uV * LTC4283_ADC2_FS_mV, energy;
+	u32 resistor = ltc4283_get_rpower(st);
 	u8 raw[8] = {};
 	int ret;
 
@@ -517,20 +586,22 @@ static int ltc4283_read_energy(struct ltc4283_hwmon *st, u32 attr, s64 *val)
 
 	/*
 	 * The formula for energy is given by:
-	 *	E = CODE(48b) * 32.768mV * 2.048V * Tconv / 2^24 * Rsense
+	 *	E = CODE(48b) * 32.768mV * 2.048V * Tconv / 2^24 * R
 	 *
-	 * As Rsense can have tenths of micro-ohm resolution, we need to
-	 * multiply by DECA to get microjoule.
+	 * Energy is accumulated power, so we use the same resistor as power
+	 * measurements (rsense for LTC4283, radc for LTC4284). As the resistor
+	 * can have tenths of micro-ohm resolution, we need to multiply by DECA
+	 * to get microjoule.
 	 */
 
 	/*
 	 * Use mul_u64_u64_div_u64() to handle the 128-bit intermediate
 	 * product of energy (up to 48 bits) * temp * Tconv without overflow.
-	 * Multiply rsense by CENTI to convert from tenths-of-microohm back
+	 * Multiply resistor by CENTI to convert from tenths-of-microohm back
 	 * to nanoohm so the result comes out in microjoule.
 	 */
 	energy = mul_u64_u64_div_u64(energy, temp * LTC4283_TCONV_uS,
-				     BIT_ULL(24) * st->rsense * CENTI);
+				     BIT_ULL(24) * resistor * CENTI);
 
 	*val = energy;
 	return 0;
@@ -545,7 +616,7 @@ static int ltc4283_read(struct device *dev, enum hwmon_sensor_types type,
 	case hwmon_in:
 		return ltc4283_read_in(st, attr, channel, val);
 	case hwmon_curr:
-		return ltc4283_read_curr(st, attr, val);
+		return ltc4283_read_curr(st, attr, channel, val);
 	case hwmon_power:
 		return ltc4283_read_power(st, attr, val);
 	case hwmon_energy:
@@ -562,10 +633,11 @@ static int ltc4283_write_power_byte(const struct ltc4283_hwmon *st, u32 reg,
 				    long val)
 {
 	u64 temp = (u64)LTC4283_ADC1_FS_uV * LTC4283_ADC2_FS_mV * DECA * MILLI;
+	u32 resistor = ltc4283_get_rpower(st);
 	u32 __raw;
 
 	val = clamp_val(val, 0, st->power_max);
-	__raw = DIV64_U64_ROUND_CLOSEST(val * BIT_ULL(8) * st->rsense, temp);
+	__raw = DIV64_U64_ROUND_CLOSEST(val * BIT_ULL(8) * resistor, temp);
 
 	return regmap_write(st->map, reg, __raw);
 }
@@ -574,9 +646,10 @@ static int ltc4283_write_power_word(const struct ltc4283_hwmon *st,
 				    u32 reg, unsigned long val)
 {
 	u64 divisor = (u64)LTC4283_ADC1_FS_uV * LTC4283_ADC2_FS_mV * DECA * MILLI;
+	u32 resistor = ltc4283_get_rpower(st);
 	u16 __raw;
 
-	__raw = mul_u64_u64_div_u64(val, st->rsense * BIT_ULL(16), divisor);
+	__raw = mul_u64_u64_div_u64(val, resistor * BIT_ULL(16), divisor);
 
 	return regmap_write(st->map, reg, __raw);
 }
@@ -757,23 +830,24 @@ static int ltc4283_write_in(struct ltc4283_hwmon *st, u32 attr, long val,
 }
 
 static int ltc4283_write_curr_byte(const struct ltc4283_hwmon *st,
-				   u32 reg, long val)
+				   u32 reg, u32 channel, long val)
 {
 	u32 temp = LTC4283_ADC1_FS_uV * DECA * MILLI;
-	u32 reg_val, isense_max;
+	u32 reg_val, isense_max, rsense;
 
-	isense_max = DIV_ROUND_CLOSEST(st->vsense_max * MICRO * DECA, st->rsense);
+	rsense = ltc4283_get_rsense(st, channel);
+	isense_max = DIV_ROUND_CLOSEST(st->vsense_max * MICRO * DECA, rsense);
 	val = clamp_val(val, 0, isense_max);
-	reg_val = DIV_ROUND_CLOSEST_ULL(val * BIT_ULL(8) * st->rsense, temp);
+	reg_val = DIV_ROUND_CLOSEST_ULL(val * BIT_ULL(8) * rsense, temp);
 
 	return regmap_write(st->map, reg, reg_val);
 }
 
-static int ltc4283_write_curr_history(struct ltc4283_hwmon *st)
+static int ltc4283_write_curr_history(struct ltc4283_hwmon *st, u32 channel)
 {
 	int ret;
 
-	ret = ltc4283_write_in_history(st, LTC4283_SENSE_MIN,
+	ret = ltc4283_write_in_history(st, st->info->sense_min_reg[channel],
 				       st->vsense_max * MILLI,
 				       LTC4283_ADC1_FS_uV);
 	if (ret)
@@ -784,15 +858,17 @@ static int ltc4283_write_curr_history(struct ltc4283_hwmon *st)
 				 LTC4283_OC_FAULT_MASK);
 }
 
-static int ltc4283_write_curr(struct ltc4283_hwmon *st, u32 attr, long val)
+static int ltc4283_write_curr(struct ltc4283_hwmon *st, u32 attr, u32 channel, long val)
 {
 	switch (attr) {
 	case hwmon_curr_max:
-		return ltc4283_write_curr_byte(st, LTC4283_SENSE_MAX_TH, val);
+		return ltc4283_write_curr_byte(st, st->info->sense_max_th_reg[channel],
+					       channel, val);
 	case hwmon_curr_min:
-		return ltc4283_write_curr_byte(st, LTC4283_SENSE_MIN_TH, val);
+		return ltc4283_write_curr_byte(st, st->info->sense_min_th_reg[channel],
+					       channel, val);
 	case hwmon_curr_reset_history:
-		return ltc4283_write_curr_history(st);
+		return ltc4283_write_curr_history(st, channel);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -826,7 +902,7 @@ static int ltc4283_write(struct device *dev, enum hwmon_sensor_types type,
 	case hwmon_in:
 		return ltc4283_write_in(st, attr, val, channel);
 	case hwmon_curr:
-		return ltc4283_write_curr(st, attr, val);
+		return ltc4283_write_curr(st, attr, channel, val);
 	case hwmon_energy:
 		return ltc4283_energy_enable_set(st, val);
 	default:
@@ -924,8 +1000,13 @@ static umode_t ltc4283_is_visible(const void *data,
 	switch (type) {
 	case hwmon_in:
 		return ltc4283_in_is_visible(data, attr, channel);
-	case hwmon_curr:
+	case hwmon_curr: {
+		const struct ltc4283_hwmon *st = data;
+
+		if (channel == 1 && !st->rsense2)
+			return 0;
 		return ltc4283_curr_is_visible(attr);
+	}
 	case hwmon_power:
 		return ltc4283_power_is_visible(attr);
 	case hwmon_energy:
@@ -945,6 +1026,11 @@ static const char * const ltc4283_in_strs[] = {
 	"ADIO2-ADIO1", "ADIO4-ADIO3"
 };
 
+/* LTC4283 has 1 channel (SENSE), LTC4284 has 2 channels (SENSE1, SENSE2) */
+static const char * const ltc4284_curr_strs[] = {
+	"ISENSE", "ISENSE2"
+};
+
 static int ltc4283_read_labels(struct device *dev,
 			       enum hwmon_sensor_types type,
 			       u32 attr, int channel, const char **str)
@@ -954,7 +1040,7 @@ static int ltc4283_read_labels(struct device *dev,
 		*str = ltc4283_in_strs[channel];
 		return 0;
 	case hwmon_curr:
-		*str = "ISENSE";
+		*str = ltc4284_curr_strs[channel];
 		return 0;
 	case hwmon_power:
 		*str = "Power";
@@ -974,15 +1060,24 @@ static int ltc4283_read_labels(struct device *dev,
 static int ltc4283_set_max_limits(struct ltc4283_hwmon *st, struct device *dev)
 {
 	u32 temp = st->vsense_max * DECA * MICRO;
+	u32 resistor = ltc4283_get_rpower(st);
 	int ret;
 
-	ret = ltc4283_write_in_byte(st, LTC4283_SENSE_MAX_TH, LTC4283_ADC1_FS_uV,
-				    st->vsense_max * MILLI);
+	ret = ltc4283_write_in_byte(st, st->info->sense_max_th_reg[0],
+				    LTC4283_ADC1_FS_uV, st->vsense_max * MILLI);
 	if (ret)
 		return ret;
 
+	if (st->rsense2) {
+		ret = ltc4283_write_in_byte(st, st->info->sense_max_th_reg[1],
+					    LTC4283_ADC1_FS_uV, st->vsense_max * MILLI);
+		if (ret)
+			return ret;
+	}
+
 	/* Power is given by ISENSE * Vout. */
-	st->power_max = DIV_ROUND_CLOSEST(temp, st->rsense) * LTC4283_ADC2_FS_mV;
+	st->power_max = DIV_ROUND_CLOSEST(temp, resistor) * LTC4283_ADC2_FS_mV;
+
 	return ltc4283_write_power_byte(st, LTC4283_POWER_MAX_TH, st->power_max);
 }
 
@@ -1240,6 +1335,23 @@ static const u32 ltc4283_fet_bad_delay[] = {
 	256, 512, 1002, 2005
 };
 
+static int ltc4283_read_resistor(struct device *dev, const char *prop, u32 *val)
+{
+	int ret;
+
+	ret = device_property_read_u32(dev, prop, val);
+	if (ret)
+		return 0;
+
+	if (*val < LTC4283_MIN_RSENSE || *val > LTC4283_MAX_RSENSE)
+		return dev_err_probe(dev, -EINVAL,
+				     "%s(%u) too small or too large [%u %u]\n",
+				     prop, *val, LTC4283_MIN_RSENSE,
+				     LTC4283_MAX_RSENSE);
+	*val /= CENTI;
+	return 0;
+}
+
 static int ltc4283_setup(struct ltc4283_hwmon *st, struct device *dev)
 {
 	u32 val;
@@ -1252,24 +1364,39 @@ static int ltc4283_setup(struct ltc4283_hwmon *st, struct device *dev)
 
 	/*
 	 * Default to LTC4283_MIN_RSENSE so we can probe without FW properties.
-	 */
-	st->rsense = LTC4283_MIN_RSENSE;
-	ret = device_property_read_u32(dev, "adi,rsense-nano-ohms",
-				       &st->rsense);
-	if (!ret) {
-		if (st->rsense < LTC4283_MIN_RSENSE || st->rsense > LTC4283_MAX_RSENSE)
-			return dev_err_probe(dev, -EINVAL,
-					     "adi,rsense-nano-ohms(%u) too small or too large [%u %u]\n",
-					     st->rsense, LTC4283_MIN_RSENSE, LTC4283_MAX_RSENSE);
-	}
-
-	/*
 	 * The resolution for rsense is tenths of micro (eg: 62.5 uOhm) which
 	 * means we need nano in the bindings. However, to make things easier to
 	 * handle (with respect to overflows) we divide it by 100 as we don't
 	 * really need the last two digits.
 	 */
-	st->rsense /= CENTI;
+	st->rsense = LTC4283_MIN_RSENSE / CENTI;
+	ret = ltc4283_read_resistor(dev, "adi,rsense-nano-ohms", &st->rsense);
+	if (ret)
+		return ret;
+
+	/*
+	 * For LTC4284, rsense is for SENSE1, rsense2 for SENSE2, and radc is
+	 * the effective sense resistance for ADC+- pin.
+	 */
+	if (st->info->id == ID_LTC4284) {
+		ret = ltc4283_read_resistor(dev, "adi,rsense2-nano-ohms",
+					    &st->rsense2);
+		if (ret)
+			return ret;
+
+		st->radc = LTC4283_MIN_RSENSE / CENTI;
+		ret = ltc4283_read_resistor(dev, "adi,radc-nano-ohms",
+					    &st->radc);
+		if (ret)
+			return ret;
+
+		/* Enable SENSE1 and SENSE2 */
+		ret = regmap_set_bits(st->map, LTC4283_ADC_SELECT_2,
+				      LTC4284_SENSE1_SELECT_MASK |
+				      LTC4284_SENSE2_SELECT_MASK);
+		if (ret)
+			return ret;
+	}
 
 	ret = device_property_read_u32(dev, "adi,current-limit-sense-microvolt",
 				       &st->vsense_max);
@@ -1542,6 +1669,10 @@ static const struct hwmon_channel_info * const ltc4283_info[] = {
 			   HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
 			   HWMON_I_ENABLE | HWMON_I_LABEL),
 	HWMON_CHANNEL_INFO(curr,
+			   HWMON_C_INPUT | HWMON_C_LOWEST | HWMON_C_HIGHEST |
+			   HWMON_C_MAX | HWMON_C_MIN | HWMON_C_MIN_ALARM |
+			   HWMON_C_MAX_ALARM | HWMON_C_CRIT_ALARM |
+			   HWMON_C_RESET_HISTORY | HWMON_C_LABEL,
 			   HWMON_C_INPUT | HWMON_C_LOWEST | HWMON_C_HIGHEST |
 			   HWMON_C_MAX | HWMON_C_MIN | HWMON_C_MIN_ALARM |
 			   HWMON_C_MAX_ALARM | HWMON_C_CRIT_ALARM |
@@ -1565,7 +1696,7 @@ static const struct hwmon_ops ltc4283_ops = {
 	.read_string = ltc4283_read_labels,
 };
 
-static const struct hwmon_chip_info ltc4283_chip_info = {
+static const struct hwmon_chip_info ltc4283_hwmon_chip_info = {
 	.ops = &ltc4283_ops,
 	.info = ltc4283_info,
 };
@@ -1720,6 +1851,32 @@ static const struct regmap_config ltc4283_regmap_config = {
 	.writeable_reg = ltc4283_writable_reg,
 };
 
+static const struct ltc4283_chip_info chip_info_ltc4283 = {
+	.id = ID_LTC4283,
+	.name = "ltc4283",
+	.sense_reg = { LTC4283_SENSE, LTC4283_SENSE },
+	.sense_min_reg = { LTC4283_SENSE_MIN, LTC4283_SENSE_MIN },
+	.sense_max_reg = { LTC4283_SENSE_MAX, LTC4283_SENSE_MAX },
+	.sense_min_th_reg = { LTC4283_SENSE_MIN_TH, LTC4283_SENSE_MIN_TH },
+	.sense_max_th_reg = { LTC4283_SENSE_MAX_TH, LTC4283_SENSE_MAX_TH },
+	.curr_alarm_reg = LTC4283_ADC_ALM_LOG_1,
+	.curr_alarm_high_mask = { LTC4283_SENSE_HIGH_ALM, LTC4283_SENSE_HIGH_ALM },
+	.curr_alarm_low_mask = { LTC4283_SENSE_LOW_ALM, LTC4283_SENSE_LOW_ALM },
+};
+
+static const struct ltc4283_chip_info chip_info_ltc4284 = {
+	.id = ID_LTC4284,
+	.name = "ltc4284",
+	.sense_reg = { LTC4284_SENSE1, LTC4284_SENSE2 },
+	.sense_min_reg = { LTC4284_SENSE1_MIN, LTC4284_SENSE2_MIN },
+	.sense_max_reg = { LTC4284_SENSE1_MAX, LTC4284_SENSE2_MAX },
+	.sense_min_th_reg = { LTC4284_SENSE1_MIN_TH, LTC4284_SENSE2_MIN_TH },
+	.sense_max_th_reg = { LTC4284_SENSE1_MAX_TH, LTC4284_SENSE2_MAX_TH },
+	.curr_alarm_reg = LTC4283_ADC_ALM_LOG_4,
+	.curr_alarm_high_mask = { LTC4284_SENSE1_HIGH_ALM, LTC4284_SENSE2_HIGH_ALM },
+	.curr_alarm_low_mask = { LTC4284_SENSE1_LOW_ALM, LTC4284_SENSE2_LOW_ALM },
+};
+
 static int ltc4283_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev, *hwmon;
@@ -1731,6 +1888,10 @@ static int ltc4283_probe(struct i2c_client *client)
 	if (!st)
 		return -ENOMEM;
 
+	st->info = i2c_get_match_data(client);
+	if (!st->info)
+		return -ENODEV;
+
 	if (!i2c_check_functionality(client->adapter,
 				     I2C_FUNC_SMBUS_BYTE_DATA |
 				     I2C_FUNC_SMBUS_WORD_DATA |
@@ -1748,8 +1909,8 @@ static int ltc4283_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	hwmon = devm_hwmon_device_register_with_info(dev, "ltc4283", st,
-						     &ltc4283_chip_info, NULL);
+	hwmon = devm_hwmon_device_register_with_info(dev, st->info->name, st,
+						     &ltc4283_hwmon_chip_info, NULL);
 
 	if (IS_ERR(hwmon))
 		return PTR_ERR(hwmon);
@@ -1769,13 +1930,15 @@ static int ltc4283_probe(struct i2c_client *client)
 }
 
 static const struct of_device_id ltc4283_of_match[] = {
-	{ .compatible = "adi,ltc4283" },
+	{ .compatible = "adi,ltc4283", .data = &chip_info_ltc4283 },
+	{ .compatible = "adi,ltc4284", .data = &chip_info_ltc4284 },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ltc4283_of_match);
 
 static const struct i2c_device_id ltc4283_i2c_id[] = {
-	{ "ltc4283" },
+	{ .name = "ltc4283", .driver_data = (kernel_ulong_t)&chip_info_ltc4283 },
+	{ .name = "ltc4284", .driver_data = (kernel_ulong_t)&chip_info_ltc4284 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ltc4283_i2c_id);

-- 
2.34.1

