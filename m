Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C873237CD41;
	Mon,  6 Jul 2026 02:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783303784; cv=none; b=YaxQHenpl02eyGFTpyl8STiDw/oMO03Wy4anyxZG5eBp4wWQzQ6XS+Nhu5hpjEdT1sXSrgF0SMMB3ZjH2wTp9LGZH94cC5sqgltjvP+yvadg5WxclP5n6WLXS6lAciRB29lONy5yArKQIn5JVZVU+Z36aDUOGjjSeaklMIBTRyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783303784; c=relaxed/simple;
	bh=YOn7xBdJaw3q+rB/ZnUuIE2Xs8UPSaYz5aIkgMJ6eAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=jUu0zPrVb4fJsJycs5BJV3F7DlO6Dwh0kTBu5BVetMzN6WYmwnFAMDxdRaQaLKON2VA2s4Jul3gYJsn5C9XKDHKYDnbWOsa0ZpphGKeY/1E+qrVyWAvzE/WH4487bSpa4+8RHf04tmysvloefJrqIVqxGbZYB4cop8anFVeCiEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=UQaX50x0; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="UQaX50x0"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665M4bYN3211879;
	Sun, 5 Jul 2026 22:09:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=No11s
	MspCrXH+jr00l4B99oqhHnx32jtgA8rD5yTA9E=; b=UQaX50x0MFPd2BHStwVfu
	8y1C3YyCqm7icF6/FCWrkjLax8ikeftwVOB6xz3FEuAL/vMHiHDaUGNUw9LIt7Ei
	3pTiTBi3ju2ggGBTtrrv7XAYdC7CC4fFurQrtwnXMvfQXWTgXz8Zjw/tojuCaxf5
	m+6vq+Th6Ng6VGYGlbYqAymDzp7XRYdBD6C0bVbp4Ux4GgrVUmykXFHgXADkG6P5
	MrOPIiZiOeM+rIRGAnxZ3mh3GJtONd8HIcniIrlSsO831+t6e53lgKnzrldsv+nT
	DyEgj4aeg45a9l4bgNEMWxrxcM8POZxCrUS781UMYPHbXa4uK7FVKD8W4k9Ppc9A
	Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4f7kgf9uvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 05 Jul 2026 22:09:14 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 66629DWW045184
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 5 Jul 2026 22:09:13 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Sun, 5 Jul 2026 22:09:13 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Sun, 5 Jul 2026 22:09:13 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Sun, 5 Jul 2026 22:09:12 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.191])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 66628o7R015791;
	Sun, 5 Jul 2026 22:09:07 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Mon, 6 Jul 2026 10:08:42 +0800
Subject: [PATCH v2 2/5] dt-bindings: hwmon: (pmbus/max20830): add VOUT
 feedback resistor properties
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260706-dev-max20830c-v2-2-37761e89bb5f@analog.com>
References: <20260706-dev-max20830c-v2-0-37761e89bb5f@analog.com>
In-Reply-To: <20260706-dev-max20830c-v2-0-37761e89bb5f@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        "Alexis Czezar
 Torreno" <alexisczezar.torreno@analog.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783303730; l=2185;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=YOn7xBdJaw3q+rB/ZnUuIE2Xs8UPSaYz5aIkgMJ6eAg=;
 b=3omDAIzfY3PeQYuzRlPk69rFIkNBpvQBT5dbbo49/1A1jJWG4PALKyGHKJka+qYFKHnwjGoWw
 w9wKURQsecTCUdQjtzJsA9jY7LBhIuPL2iAmy/NBkTneVLginWyjRbJ
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: imbGsHDmdTzV-EpwmuyjBOFYo0YaZVXb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDAxOSBTYWx0ZWRfX8LjIY9xHMnM6
 NjMz5zQtuptBMuB1UOq2bcqHEtI2Nafvh/UBTxm95/elqkwlJPWl3zfYSGlFi62dnfgoplONxo2
 4gvKZbZ+W/NMT+T65YOv5m2Mppj5+t+ioJXoUHTvguzU9G2/e1aRlFAo9Pg0CljG/TnfQa0sk6S
 Cx/emnldefvPKOZuKgrVM6nfkL7/CF6V+ZbfKrFnIugkFcK7e1/n4z5XFr6V2robxyRT009Inea
 K2um1AcpvtruuErrH+Vs8aOJs7knVtF5wV9MSYtNunfktOV4KtjuXla3gF95+S08EQJaH4a19mm
 PxP3R5LX2Hu4oSyl06QSfpb9eXe/myqDKlaPZ61hx0k8YTeRQqQCfABbQ5cSa6y9K+634fJtaYy
 n3Enywt0+kCz52pRpsAaST709D6vGzrOlowD1eqX8Nglq4PXxtvvo8AvYwtNaETGJIXHGIcTetk
 2iMnBuzFHOcj3Jy8tJw==
X-Authority-Analysis: v=2.4 cv=SebHsPRu c=1 sm=1 tr=0 ts=6a4b0e4a cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=EUspDBNiAAAA:8
 a=gAnH3GRIAAAA:8 a=rAWaG2PsGduRtDMPHBwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDAxOSBTYWx0ZWRfXwtCwqPz8FMaO
 2qzpl2Zn/UwVp0PdrOgsudoXyAyuAfMj01jmEzo1zTcRouuPfJj9qgrLabcNtGN8jWJn5Tq+jIL
 +8cX9of864gaddB1W54pGnqdGk1Mg8NVqCC1GFKZ0IbeUvKrL5kO
X-Proofpoint-ORIG-GUID: imbGsHDmdTzV-EpwmuyjBOFYo0YaZVXb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060019

Add adi,vout-rfb1-ohms and adi,vout-rfb2-ohms properties to support
external voltage divider configuration for VOUT sensing. When the
desired output voltage is higher than VREF, a resistor divider (RFB1
and RFB2) is required to reach the intended value.

The properties use a dependency constraint to ensure both resistors
are specified together, or neither. This prevents misconfiguration
where only one resistor value is provided.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
 .../devicetree/bindings/hwmon/pmbus/adi,max20830.yaml   | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
index f3ba6351aa5d657590d92a538910fd6b787e7a3a..3d62c03abdc30c8aada303bad263e972219b33a4 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
@@ -49,11 +49,26 @@ properties:
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
@@ -72,6 +87,8 @@ examples:
             ldoin-supply = <&ldoin>;
             enable-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
             pwr-good-gpios = <&gpio 2 GPIO_ACTIVE_HIGH>;
+            adi,vout-rfb1-ohms = <10000>;
+            adi,vout-rfb2-ohms = <2000>;
         };
     };
 ...

-- 
2.34.1

