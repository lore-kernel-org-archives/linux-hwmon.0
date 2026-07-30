Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B1335C688;
	Thu, 30 Jul 2026 01:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785373474; cv=none; b=U8qQ/8yYexKVdL4+osIw6ONMe296b52FJZgo98B9PCVWdcIHKlJuuUGM74RUhW4c1YSYcjm6tHES3HQapVNgatrRsTkyURGx2kSXHyU08Mzkqs7h/jqHXD6E3nbd6SWjQSWwV9yWL0Uq0DI/L7IFhqR68KfQDuZtsmk9HkSyvak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785373474; c=relaxed/simple;
	bh=WT3RvIjqQI1w+z5luPmAqO587QkCztzHavDjhEJCPGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Bn+xvfrUBXuPoG4+pSolekThSftub2er7f95Uxg2aZGB5jMro+V+Of+3el0u1Q5ELfRckOlNYzyt4X/2Yxs08dU+83TniRZMJZpGAq9E/ETrdrVJUEYdNtx8b92dEf+DLJ2VgxLyGwTzCmDBEmgOidW6tsldvvOnStZ1gYNEUh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=QtMCY5xQ; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="QtMCY5xQ"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U0m1GD3115256;
	Wed, 29 Jul 2026 21:04:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=XkU6i
	QO91jFgjBiaqYCe7FFVg0WJadiMH7ogOVOBNh8=; b=QtMCY5xQHbzUqs7FYuuhQ
	41Gvw5aNXetZCSNxE1gOvwlE4lWxElIkhGE/QIASHnzC5opKKYNNwh3U2VfbEE33
	oARojwatn0EYnR43CMepNi1pQqXwz84LGcKphSvWK3T4oJkBMzmcfdCvvJDAnPSH
	MHB+golommXqmWT8Y2ySkvMVbW57C/C6P72tbrE370NIEkLiFWHE+uPrOfLfdiRs
	rkcN+uy/xqHNaXt+Uf7/BeT7kENa+Gjen2YXSEIyNIu9BD98yDMG17kyIF0MvQxW
	bg3jPXGpuTpitCr3GmkB0+MNdpmhabzl8OjEELQvjfs/GwB6qBJhCi1xSpkn2os4
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4fq18dxm06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 21:04:06 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 66U145pw036850
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 29 Jul 2026 21:04:05 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Wed, 29 Jul
 2026 21:04:04 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Wed, 29 Jul 2026 21:04:04 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.193])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 66U13i44020304;
	Wed, 29 Jul 2026 21:03:58 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Thu, 30 Jul 2026 09:03:33 +0800
Subject: [PATCH v5 1/4] dt-bindings: hwmon: (pmbus/max20830): add VOUT
 feedback resistor properties and complete examples
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260730-dev-max20830c-v5-1-a7553f84ee74@analog.com>
References: <20260730-dev-max20830c-v5-0-a7553f84ee74@analog.com>
In-Reply-To: <20260730-dev-max20830c-v5-0-a7553f84ee74@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Alexis Czezar
 Torreno <alexisczezar.torreno@analog.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785373424; l=2456;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=WT3RvIjqQI1w+z5luPmAqO587QkCztzHavDjhEJCPGs=;
 b=PTZXFF0lDEdE6RurirrOZyaRGJbroKjYgMtiU3UNfpQGabL2e+rPQ8QAIk8Q9Y/7hU9zWx4Co
 07sqxaNjHUCC+cWU/Lb1qu3zFPYTFLDQtSU9qG2pk3Al1LOQowrmnsq
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: f1CAHUZlG3Xa7NOCa1HA2-fDND6BNvVz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDAwNCBTYWx0ZWRfX3CAJSjb/q+YZ
 ThNP2T/zFLyE7yBd8Uz261umGgS25q0puCubcusg+AWv+uM/crm/JiMeHrv7hYKh2po6ym4tLiy
 Pa9UFq+BZ/Dt4Lm2LsY78ivoov2ZTJMtGUClmewn91Z16+dfYL01ZHx4B/iIuW5CxSuV43M2mw6
 n0ElbVydKfWFFsfGhlttmSof+zV0Ul1TRghvHEm1eobYJxms5lPywukDpT/XicAjLATVpx2hpk7
 /F/0ESWJ2kdaQ39sg4R2T2G/LkHeIuaoFOqjveLijqrUT+Gr/Ps6opyDgkcWa5sK/xOWUZG8V+e
 XgTBK8YG02Ct3n/1FtQC8PslWni/3PEZyo4vqYnyP9PmHB+mPWSrhZDAQR8vs6DqtwC2TXI0WfS
 q+pARI4IZnoiMS08cMMSo0qUk5E7eZhYKVPKfAa3UPBctYu0+tY5w56j6W7C93Eqv9f/aFU1N6C
 2pLSoW0pCtnru26ZT5A==
X-Proofpoint-GUID: f1CAHUZlG3Xa7NOCa1HA2-fDND6BNvVz
X-Authority-Analysis: v=2.4 cv=OtN/DS/t c=1 sm=1 tr=0 ts=6a6aa306 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22 a=EUspDBNiAAAA:8
 a=gAnH3GRIAAAA:8 a=rWBwxEM6VC-iK73SjNoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDAwNCBTYWx0ZWRfX2oNlGMPEcX45
 JcALe1GsUkRuQ+rSFfRnNBe9nzwJ0t0TICC/Fmwmgl4CbI37hNuIzYLpiqNupJcP6n3U3Qy/u56
 DEhgvBr19fRkR4btqSCzRtHM21XJ3nR4TReIQm2Tulv+vg0HizHV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_09,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300004

Add adi,vout-rfb1-ohms and adi,vout-rfb2-ohms properties to support
external voltage divider configuration for VOUT sensing. When the
desired output voltage is higher than VREF, a resistor divider (RFB1
and RFB2) is required to reach the intended value.

The properties use a dependency constraint to ensure both resistors
are specified together, or neither. This prevents misconfiguration
where only one resistor value is provided.

This patch also adds missing entries in the examples.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

