Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794185848;
	b=y9CloeB6ImrPdoBBbR3isW+TwqbrF5wBqSDtLqxoZIhFRhcxyCyJd8NrcGYSmzeBMFHG
	 WUyHA3LtmAs+OxlofzoQw8jtHoPd1e9buWT3IOn9qFtnOLE4coF3bGrjWWoxT879na6X/
	 9QTcLdYi8yQ2OK72U3x9VvO482i6AYhOWOGpZAtSNx3Kj0F0Yu6iyCy3BbGA2+9eCf7m4
	 HBXTfRrxHP+nzfuuN41ooFFkTOrNHsi/XQSq47wjAXkf0LOyw6gDazUZTNujWuvJFSpk9
	 gjY4NlYfQccU0aLC5r+NMuJq/3JpwKrFvVBRxkm8cwcfj1cHzKtso0AvFvPF+fmTATQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794185848;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:
	 References:In-Reply-To:To:CC:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-ADIRuleOP-NewSCL:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uivMuJZoe2S/0CQvYgZGebbq60EIzw0/WQEXTk9GKmI=;
	b=huUqayBNjceJsXiMNW/MNxIewjc/CaAIRDd1/+qmFKgfCfJyhh9htohQgSe7ofd8wrRm
	 HbZjqv/SBTU/DiEBzxD75Pk7RGBopDvAv1f9fr48j0NYcEluXIrShrZ1oaR5P+k3HGalL
	 l6QHoILQbyKu7n77lRcStmwbilu4cFdJy8YNeZqfQc4e2yOLoIvhEex2almjwbqsQC97A
	 f3uEd8r14c2l4STvJ2fXGnwGjK6e8BMSyAfM8X687uVQ8CLUCACYIAnKlQEfvyXB6/X7T
	 8uQ7UBk6UmomB75Jd4Z2y9pJJ1VAzmAsatZqHK/HNjk3XDk/EfIdsdWq36uoVnOrV/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=bejh6Pqq;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=dhBG7T3L;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D28E606A332;
	Mon,  9 Nov 2026 00:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D28E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=bejh6Pqq;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=dhBG7T3L
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A90Gc2O1672255;
	Sun, 8 Nov 2026 19:56:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=uivMuJZoe2S/0CQvYgZGebbq60EIzw0/WQEXTk9GKmI=; b=bejh6Pq
	qLBtToG58kApNgM4JlYldZWDZcQsziO8GrkR3WH/T4RF0eoQ66VxPY8SNO1QEWlB
	Hk1vP7J3ivZDgv6Vb4EqKlUqpmPzfPuXpbp8FWVeLrCtnrkurjRdB+5LbbzooNkz
	zRYBXGx6WYOBkNCoEBX8RCenUyg7+rLSZysLr4lN0ROXqNClbE3BwH7o4B6NSWPC
	52iGYNLFhbSKy6mUIjnNv3irijRl04guaU7rTUyIPY910/OmCLvynWUorWQb6OFA
	QzBiKziFXNWZEQgJVDCPvsdP5QDGJtH7Bmo9pdxzmvnGGNn35j3jJDv+4rh3E7Wq
	L6AcsREdlUFhqjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=uivMu
	JZoe2S/0CQvYgZGebbq60EIzw0/WQEXTk9GKmI=; b=dhBG7T3LhzKmRyNDSpf78
	csQW+K8pHB7BiAMMUiyk3c50ZkkqstQ4KoBHr6gmAUHdl7T0LsoF24U+TxrDgucI
	i1POLLh/I1/tTddegC3Z0oUv0lbTPZtD4ZXP8wKIiBrsx36PNHFBWR/ibDDN/11c
	RONeOlvw6E3g+DKVWe1AHKKBh+DyfFomfeG58dyAPOQ0qw8C6a+2vlNkfIJ5TO+V
	J/rMjDXOaIAwyetEY814Qba+pwDYwX4Lj6dMhwKXPt2u0gt2gRjN7leA2aKlrR2F
	xZWeE/9SnqK8QqcKBID7ZEKbSZKXHpdHfkzDzZDBZFXMuBNEcTz1m4Dx8lFLTI9y
	g==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4htk6jbx5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 08 Nov 2026 19:56:49 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 6A90umkM017380
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 8 Nov 2026 19:56:48 -0500
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Sun, 8 Nov 2026 19:56:48 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Sun, 8 Nov 2026 19:56:48 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Sun, 8 Nov 2026 19:56:48 -0500
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.193])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6A90uNDn028853;
	Sun, 8 Nov 2026 19:56:38 -0500
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Mon, 9 Nov 2026 08:56:17 +0800
Subject: [PATCH v2 1/3] dt-bindings: hwmon: ltc4283: add ltc4284
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
Message-ID: <20261109-staging-ltc4284-v2-1-14a270a38f7b@analog.com>
References: <20261109-staging-ltc4284-v2-0-14a270a38f7b@analog.com>
In-Reply-To: <20261109-staging-ltc4284-v2-0-14a270a38f7b@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794185784; l=3512;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=hNTQVnQ97p9HrzNo4KRtFvaC8bGXblkMbJn2E7CYo24=;
 b=giLT2mcSmaZZQI+MJpROxzmkJDGOvubDlKydFqkNSa7/7qPY+VhzA+MQPpk3c6WkMVtgAWGQe
 BPSD7R7m6u1CqFy5Cl7UWhV7Mx3Q5aK/IRMvvFT0C3RKvEnmLWRSM5p
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: nAm1AXU2iWxGvF1JkyvbuaPTZ9D6T5BE
X-Proofpoint-GUID: nAm1AXU2iWxGvF1JkyvbuaPTZ9D6T5BE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwMyBTYWx0ZWRfX9ToWJxRLm61c
 ftDy48QUBNCUKUQhJ/tsVYK3MbQ2IEQKC1v2p/WxhLPNhjl3d2INIyl7XxtBTaWhQaHbSzIQPMD
 u58zXfnXjwqUKgHMJ5dpU+b1ortWa8F6ftMHNtUbqNZU6R/NWF9E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwMyBTYWx0ZWRfX4X6q/86a33Pd
 TMV/AfzFRfniMMNA4iqYCaoesUiSOutasEwx25BFv+N+1YvyyAlAzim6U3tvbcbzAr2o9i5Jhbx
 jUELyLVXkn2GaKg2AGLlMmPGkr0s20Cw5Jo5w8RTcKYEKXfBVXdghor+531zniEP1bCRDuJaNfE
 ncq+3/KFjjAOgwUoh95e39xPx3N/lYx3PaM0D9jOF1n9J+spmaCDgEcP3Bn6ryUI0Bt1B6Yt1Pu
 4MsT2N+H8uziI1+foeZrx3FMmHc2OVKdSBJ3wbQ0xO11wm3BMS7E/UyDSV0APb0kA+BZbiajL1F
 fSIBRUnSLuqEkgVn3Mzjih4vFXlWM9kHGZPepQB9KMdShSpvvJKfyLa0qdqPbLNwSuBow1wSvgU
 eCUWPoMmfmp4ELWpznCAohfcgX4Oqo4nznWwmS0M4+KaTRkctsEe5313uZTWB5ZpvhiJNofMFrJ
 qTcea22dnyncq4NZopQ==
X-Authority-Analysis: v=2.4 cv=O7+sLx9W c=1 sm=1 tr=0 ts=6af11a52 cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22 a=gAnH3GRIAAAA:8
 a=Mr05Dj8HPuIH2qX4H8UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090003

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

