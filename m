Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904083;
	b=EryJB7ffy6/6idoJr0EjWtds5Wq9OJsTkiR4RQbAoke/RbN9r6kWI3WM95bUru08KTOd
	 Ohwi9OA+Kx6nxfCg9jX3P5dm+NFUvZdbLxc2hkR3owrm+rWRJIpoxtDtrSKrHCEP4bFWN
	 IoaEAZ0DE0Eq60rwgi6gPbyn3rfudb7S7qgigPMg/exdwTJ274OTvmaTg17IyYqOuRvk1
	 qDdPYq2DKrXJRXlmMNqf3/AU3ISqogc3BLAuY/WI3nZhWf7pXF3c8sBwOov3u+TuDSZDk
	 U3ojTW8pBNYQiFVjTrltHc862Tkvayk8LdYjpflS3I/SvSo2vVT0ZvQNuV2qko0fguQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904083;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:
	 References:In-Reply-To:To:CC:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-ADIRuleOP-NewSCL:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uivMuJZoe2S/0CQvYgZGebbq60EIzw0/WQEXTk9GKmI=;
	b=Qv5v3jXeyKoSU3H1BcUJJY3Q6fJww6I1GpV0WV837M4tidzF+6e9ytcDz/QKgZqrBaVb
	 pvWTN3vNMqV6fmS8Qcx5CwIvZkY2Y6VeOBlF7MA4DrnoCZtGny3c/q7LalIC6kNSQ/Ngf
	 XMa/gyoaKlx2kiyOMk0coX3Cda7Y/bwczI0DI/jUGE8PpgAYYe3IuNxHCWZ75sJiYcTZd
	 IJOGyPASe+ZqVrFvpRpDoLShTp9rtvVziiZpOJujnINVJmnRn31s5J+LAUb5QzeB8hkuX
	 3eBN/q4/wBQIRsGYUVwMKm84DWUbxdOJQtdR/3yjwAKDI2oc72+tlgxSia+lX1nRJuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=MRIs0DGW;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=jX79ENAr;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CA2606A332;
	Tue, 17 Nov 2026 08:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37CA2606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=MRIs0DGW;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=jX79ENAr
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8B2RD1698774;
	Tue, 17 Nov 2026 03:27:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=uivMuJZoe2S/0CQvYgZGebbq60EIzw0/WQEXTk9GKmI=; b=MRIs0DG
	WUCxIQCVHqMxgP9dLXmx0lI0ysoVFhjyLoaGzVhyZIvdL+4A2XTN87t8hMjCOPeb
	iZxj9EwuSAGblTRu/hAbETReLUCD46TU1y9dPczBaT1+RAsJnRqNDSyJe3EU6KtJ
	yh+Y81MAOS84W7fBiXZTcveQzr0RV6QSDuWxY/S4rvxPqRQTBWaXUjlKJKOlaWcS
	4G8VQ3OrKxn8WNpnGVl8wlHNC8vsgRubKvtrRw/q8Cr96zjSoHGfvTIeU6cuNI+i
	zWr1NgbMAupa0DiUHhXmE0thh0IVpBuUUJsKRELkNFwas+oH5CdlW+lMcAk+TehF
	wpab/RP7FyPNFLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=uivMu
	JZoe2S/0CQvYgZGebbq60EIzw0/WQEXTk9GKmI=; b=jX79ENAr0jo8icPQZnTGS
	+mP9qFBlHUUD4lWlpzUSmM1HuDpUKmZZbdkSCMhLSxawqbye1xPVhCXWj0/3fYDv
	PqiqZoEwZhWmKLFIeGY3wlgPsXjjQC9pdWKjA5lHW5Mp5LyYhIjON5QNdl9lPj4E
	cjNaKeuszsFvuT9exCDDNB7kbb5rhH6yGKsp409M+DBZW6/AlP6rJ4GbildXFK6A
	wvQUB3qzmk9aa577YfV4sGYh7xv2An9Bage8+vLSTuz84dxa2+QX8UT+/7yyQrZv
	nQRCl4/8ysIFPEY748DbO5M8QgiMaFOV1sZ7JZJAko+oiCciSUvq+/gCRodojq/S
	Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4j0k6mr388-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 03:27:41 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6AH8Rdsx046873
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 03:27:39 -0500
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 03:27:39 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 03:27:39 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Tue, 17 Nov 2026 03:27:39 -0500
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.192])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6AH8RFcl007690;
	Tue, 17 Nov 2026 03:27:29 -0500
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Tue, 17 Nov 2026 16:26:48 +0800
Subject: [PATCH v3 1/3] dt-bindings: hwmon: ltc4283: add ltc4284
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
Message-ID: <20261117-staging-ltc4284-v3-1-326bb844e08c@analog.com>
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
        "Bartosz
 Golaszewski" <brgl@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>,
        Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794904036; l=3512;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=hNTQVnQ97p9HrzNo4KRtFvaC8bGXblkMbJn2E7CYo24=;
 b=aAxNmb9xF4fPlUwazVQD/KGyuhkPxzWG78BCFMPXA1L/5wj9RjcWsxOdAhzKfQ+pVe7kk80u2
 BQcZZ98Hdc6B+vpnZGS4sDhk4vVhojVhi6dQtqOupR3NL9Fi7Ui1KJi
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzMyBTYWx0ZWRfX805T4OQbhl7r
 23vBA8XiGZCdlMGDCubgAwle679JW3HPEsjwkbegdL4O6xUfnUBFrfntr0ynGk0AkY66zGIcOTA
 bn6//Omw3Uom3u7dNGv9IT5sItjJ040Q85X5i+UTyhKHtvkxJgB0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzMyBTYWx0ZWRfX30aCrMDQ/hN5
 GA8hT2dJnVwGw2LqZyy8JkdeT8XduFzzdyTgZuXbsbF9JqLvXvuotn1YCF2hwjiFxqpJh002A2e
 COPfOU99+HncLaRwRp+q1RutRNm7TuLcQYeg3+rBelvuVnHc92s233wSA771zpROlK0Ly2mI1mD
 JCnmy4BRt3Iu5UQ82sK6QMrvwc2fB+pzP2D4BgDuFWK3+lR/DqN5QSQKAVlgb7E2KJLy52DU7cn
 mXiWNDZhvVrOTGlBG4+gis7SelEHf/7yVwsGW22fPIysmCIMo+9ua0ebvOab/eqVAMLHf+10p8t
 mowv33HQbvDyaP5vovOnNeH/ME+VCWleZpMtnoztbsYRE/UwUoJA2WFPVJ7JrdX4VTlV9+rY3ze
 FxHy8TWTHMSl09IIUerrxFjfcmqGYWxx6Yjc78Y6MHE5Ie6C/Ot9q8uyyAhz+PJRtuNymQ2b6fH
 dlVNg3lmF9XirKJ5PkA==
X-Authority-Analysis: v=2.4 cv=O7OsLx9W c=1 sm=1 tr=0 ts=6afc0ffd cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=gAnH3GRIAAAA:8
 a=Mr05Dj8HPuIH2qX4H8UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: rrjoGCD-rZm-BCJurAaUZnckVuNB8Or-
X-Proofpoint-ORIG-GUID: rrjoGCD-rZm-BCJurAaUZnckVuNB8Or-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170033

The LTC4284 is a negative voltage hot swap controller that drives an
external N-channel MOSFET to allow a board to be safely inserted and
removed from a live backplane.

Note that this device has a MODE pin that is determined by differing
voltage levels (VEE, VIN, INTVCC, or left open) and cannot be
controlled via software or GPIO.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
 .../devicetree/bindings/hwmon/adi,ltc4283.yaml     | 56 ++++++++++++++++++++--
 1 file changed, 52 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml b/Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
index 05e2132ad4d8621ab76ee89aa166c131fed08e85..ca62e76f23f1e32df157f138298a4650493b3f08 100644
--- a/Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
+++ b/Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
@@ -10,22 +10,42 @@ maintainers:
   - Nuno Sá <nuno.sa@analog.com>
 
 description: |
-  The LTC4283 negative voltage hot swap controller drives an external N-channel
-  MOSFET to allow a board to be safely inserted and removed from a live
-  backplane.
+  The LTC4283 and LTC4284 are negative voltage hot swap controllers that drive
+  external N-channel MOSFETs to allow a board to be safely inserted and removed
+  from a live backplane.
+
+  The LTC4284 features dual-gate drivers with four operating modes (single
+  driver, parallel, high stress staged start, and low stress staged start)
+  configured via the hardware MODE pin. The MODE pin must be connected to the
+  appropriate voltage level (VEE, VIN, INTVCC, or left open) and cannot be
+  controlled via software or GPIO.
 
   https://www.analog.com/media/en/technical-documentation/data-sheets/ltc4283.pdf
+  https://www.analog.com/media/en/technical-documentation/data-sheets/ltc4284.pdf
 
 properties:
   compatible:
     enum:
       - adi,ltc4283
+      - adi,ltc4284
 
   reg:
     maxItems: 1
 
   adi,rsense-nano-ohms:
-    description: Value of the sense resistor.
+    description:
+      Value of the sense resistor. For LTC4283, this is the resistor connected
+      between SENSE+/SENSE- pins. For LTC4284, this is the resistor connected
+      between SENSE1+/SENSE1- pins.
+
+  adi,rsense2-nano-ohms:
+    description:
+      Value of the SENSE2 current sense resistor. This resistor is connected
+      between SENSE2+ and SENSE2- pins.
+
+  adi,radc-nano-ohms:
+    description:
+      Value of the effective resistance seen by the ADC+/ADC- pins.
 
   adi,current-limit-sense-microvolt:
     description:
@@ -195,6 +215,19 @@ required:
   - adi,rsense-nano-ohms
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: adi,ltc4284
+    then:
+      required:
+        - adi,radc-nano-ohms
+    else:
+      properties:
+        adi,rsense2-nano-ohms: false
+        adi,radc-nano-ohms: false
+
   - if:
       properties:
         adi,pgio1-func:
@@ -269,4 +302,19 @@ examples:
             #gpio-cells = <2>;
         };
     };
+
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        swap-controller@20 {
+            compatible = "adi,ltc4284";
+            reg = <0x20>;
+
+            adi,rsense-nano-ohms = <2000000>;
+            adi,rsense2-nano-ohms = <2000000>;
+            adi,radc-nano-ohms = <1000000>;
+        };
+    };
 ...

-- 
2.34.1

