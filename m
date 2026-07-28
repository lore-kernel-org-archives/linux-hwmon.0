Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03573348C61;
	Tue, 28 Jul 2026 03:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785209623; cv=none; b=MdJMiLCjruCByEA7qI6ND9GFeOAO+rRs3ss+usojjD1Tl2AyeM2o/ZwYgoh76LVyoHWK8Gf9jsYzph0UxIxF+EgjSNjbgrskuDC1Q0GlRRrRx2A2qPWvt5dbIQSz3AtSPbdHAJ/Bwi+Z+pPo7pcXvqdNNABvtQuzSbmSjJEToh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785209623; c=relaxed/simple;
	bh=J1mh0vkRGq6FLDGpbBrIAj3/DAhH/r1nZIR+SM61CPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=iXWZN3RHu3pTKt9AdPya+M8evGLRJxr+16+VGDLaoXnelvFGf07XKvw7hKMjE0vbSKsS85Yxno5hRoDYUwnMiTyONfLexHV5b/nLnRT38fvosldo3TP/FF7TdynYUjcdRfZwzzBMkp3JvDPKKh1EVe2q1pryL0pWxUb3IysRZwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=tpLpceii; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="tpLpceii"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S0kxlx2077353;
	Mon, 27 Jul 2026 23:33:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=VlPmo
	4BH56QQmwhoJN3NyZ9TlBgA0CzVKFl3PnUK+qA=; b=tpLpceiicLsGRExFJ+O7K
	gWBfGQgws0w0ulfXvMXPotpEZ3PkUZPsIHOdTfifAMNkPIguPGG3UiWNQT2wkzHE
	fbvW2SEkJVz/bE7aiXXaDYAksgg3L/v/XR+QY/pznRaknc1yzgpH99SPyeuv7xsn
	gyu1/hgR6KPyORjP+McfZjJH8hOpXVWJASlAH2L3trXs4Y5we398+0Qm4RoezfnM
	1uU7VdSv7izHVGiabwS7I8bAYD1WxU6u2F65ckvEHyhjI5brmIwhPkDaBgQ1aqQ6
	9W9JYKEHdaBnVEUY16z/2CbZZ/+/PmZ9nSGT9OTMYx3lrPqilIQVA94JPQmaLjuW
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4fmq03kmvw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 23:33:27 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 66S3XQdT057037
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Jul 2026 23:33:26 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 27 Jul 2026 23:33:26 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 27 Jul 2026 23:33:25 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 27 Jul 2026 23:33:25 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.193])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 66S3X41P029413;
	Mon, 27 Jul 2026 23:33:19 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Tue, 28 Jul 2026 11:32:55 +0800
Subject: [PATCH v4 1/4] dt-bindings: hwmon: (pmbus/max20830): add VOUT
 feedback resistor properties and complete examples
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260728-dev-max20830c-v4-1-cec034298535@analog.com>
References: <20260728-dev-max20830c-v4-0-cec034298535@analog.com>
In-Reply-To: <20260728-dev-max20830c-v4-0-cec034298535@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        "Alexis Czezar
 Torreno" <alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785209584; l=2384;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=J1mh0vkRGq6FLDGpbBrIAj3/DAhH/r1nZIR+SM61CPc=;
 b=mPNgiqxk+I4Kf1YLr3zdAb2OP9s7cu8oprFi6FjwKSEfnOqSwx11lke5g2EHTr3hm0JtsKYEk
 7BfJKvGccvxDDJ860ECeuPGEgYkh0AqixJBWKYw/Hyfp0EfHw7o7Tao
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDAzMCBTYWx0ZWRfX5VV9vShQucQS
 wXWrT9amPm+OISeLmL9a3hG18c7UdRGS4+DJeSCLcFp5E/Sho1C9EsVLMLXID/wIt50kQyuzUAP
 fBl5OyukGyQbTxT/KFQJ37f2C6qHZqfxyVFOu9rlLGeEIdjDuBvG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDAzMCBTYWx0ZWRfXxkvJ+vIZZLas
 UbBVo3kHdAdcYYfG1rw9YGGL8zOwtq93TGHB5hhxpNnIWxjTWx8Sk5zOZ7jEOMu3nrpha48eEKU
 oVWbKAgRXsU09KAMvKXYei3nMZahiHTaN20r/QNm959JDoHzpgy4ZuFxTYljMnQ5cNrt3uHGdYN
 yL9z97m4sJ9CKt98QQyYewGNUJ5fpswJ/5NyWLb8bKG718O5q1UjS3cy9+C7NLNeJBz9x0ICWow
 eaf7QXORZUdU6ccm7M0e5bYW6dgtiZfqmO1oG/ZKjnIBOaDFRae4U1aZj2C8T33MPDcRQde4P+9
 x2N9cBhTGZKPN+AjYQ6FwzxA52jU/MKWDVBUG8jOrXAC4aWU+4yYDt66F/ZggZ27z2+LPyXpZT/
 42Pm2wmBEiA0GfRyYHbe0/FimL8lxeLZUgOO2Kv8m+FTXut89y5kUpKuV9YLTyr7X8QVLOS6T83
 ++j71dd7qA9LKj2jRUg==
X-Proofpoint-ORIG-GUID: tgpxANFfvAb_dVHXVoHse9yDW5IawTTL
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a682307 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=gAnH3GRIAAAA:8
 a=rWBwxEM6VC-iK73SjNoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: tgpxANFfvAb_dVHXVoHse9yDW5IawTTL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_07,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280030

Add adi,vout-rfb1-ohms and adi,vout-rfb2-ohms properties to support
external voltage divider configuration for VOUT sensing. When the
desired output voltage is higher than VREF, a resistor divider (RFB1
and RFB2) is required to reach the intended value.

The properties use a dependency constraint to ensure both resistors
are specified together, or neither. This prevents misconfiguration
where only one resistor value is provided.

This patch also added missing entries in the examples.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
 .../bindings/hwmon/pmbus/adi,max20830.yaml         | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
index 1625dd59417f1b3ca689a9c86ca266da913d1217..01b7275f5b3419cf1b791ed8f9b7ae56cd2961b5 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
@@ -44,15 +44,32 @@ properties:
       GPIO connected to the power-good status output pin.
     maxItems: 1
 
+  adi,vout-rfb1-ohms:
+    description:
+      Top feedback resistor (RFB1) value in ohms for VOUT sensing divider.
+      When the desired output voltage is higher than VREF, a resistor divider
+      is required. VOUT = VREF × (1 + RFB1/RFB2)
+
+  adi,vout-rfb2-ohms:
+    description:
+      Bottom feedback resistor (RFB2) value in ohms for VOUT sensing divider.
+      Datasheet recommends that RFB2 does not exceed 2.5kΩ.
+
 required:
   - compatible
   - reg
   - vddh-supply
 
+dependencies:
+  adi,vout-rfb1-ohms: ['adi,vout-rfb2-ohms']
+  adi,vout-rfb2-ohms: ['adi,vout-rfb1-ohms']
+
 unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
+
     i2c {
         #address-cells = <1>;
         #size-cells = <0>;
@@ -61,6 +78,11 @@ examples:
             compatible = "adi,max20830";
             reg = <0x30>;
             vddh-supply = <&vddh>;
+            avdd-supply = <&avdd>;
+            ldoin-supply = <&ldoin>;
+            pwr-good-gpios = <&gpio 2 GPIO_ACTIVE_HIGH>;
+            adi,vout-rfb1-ohms = <10000>;
+            adi,vout-rfb2-ohms = <2000>;
         };
     };
 ...

-- 
2.34.1

