Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88A73C5836;
	Tue, 30 Jun 2026 02:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782787657; cv=none; b=U8uWc9VVw8iRljMmkFqWW7iaFHOU/qUTEzQYugR3TqKMjju5BYOEvJz7xzTzvOQbgYUVbVk6WaUpL3lWOeKTeanZTpk7qtB6kA6Ck3rNK65ukNu9S1xA2ZdToghae7UST+rNPRHbYZbhW2RMiPQhFmHdULyhWCcNSP096I7cdfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782787657; c=relaxed/simple;
	bh=8U7kmAKRICYYoNm5SriIZ6oz7hryPo3DBJtF+YUcgTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ZNFkos8ORK3udAKj4tiOyq96vB9YuwhbIV2rtgSnQ6GxkvNfBxASAZI9U+XKqgLYRP8W40ZhJpppbuPMM3lEQwZX5G0igqypNQCnJniisFB/g3B5TfKbWcNvwJUKSwuMBx7FL3biRXlFM0eeUa9KIkoilyjqy52XtxwhgvHc4oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=FZ1m/0FA; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="FZ1m/0FA"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U1GTAx3610921;
	Mon, 29 Jun 2026 22:47:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=jz8a9
	JZYznej+UfPY0pXYDOtQBN+9HJi+zqztoGGkIQ=; b=FZ1m/0FAniaZG7ZAxM/ch
	JyRmaOhilHiuXvF0LDO53ip+5EJqbHiWbMMNdpFNAvEE5U+hN2mk3oGIY/c1094Y
	4FcwKIYnQQvM9cElQBeVVF2k1UNshuUyeOIDipxjRcJAnsK1U+QYzPcNDHM4nRBQ
	NYIphp9DXjBwh0gNU6jGZx7r4JJa4vCsFDfoExThHMnmUO5YANAlRQoSPyP79wAy
	8tfcjYfdGqIu8BUrqmoQjP9wRPbNaL+jD971jOAHrcWorzpaL4JhCTypDtAAW7fn
	OmhP+G4kQPtaguJeBsHyHa40iqsDLj0Jclz+Uax3HDnwmzObcGBLCsshlNo7XS0a
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4f3u1mte50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 22:47:22 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 65U2lLOb032999
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 29 Jun 2026 22:47:21 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 29 Jun 2026 22:47:21 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 29 Jun 2026 22:47:20 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 29 Jun 2026 22:47:20 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.193])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 65U2kqhg019448;
	Mon, 29 Jun 2026 22:47:10 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Tue, 30 Jun 2026 10:46:45 +0800
Subject: [PATCH 3/6] dt-bindings: hwmon: (pmbus/max20830): add VOUT
 feedback resistor properties
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260630-dev-max20830c-v1-3-a02786bde470@analog.com>
References: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
In-Reply-To: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        "Alexis Czezar
 Torreno" <alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782787612; l=2065;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=8U7kmAKRICYYoNm5SriIZ6oz7hryPo3DBJtF+YUcgTw=;
 b=LTS6Puh6h0E/iQpwDFo6sxC9mpqMacuA0GLLcpolW6aHerMpluBY38XBsDISCiTuOuls5da2P
 UjzUE8kjLjFCCCJEknKrwXqO2hN54MShi5t33NcJIEz7pQ7TC7gFX3V
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: HiCiyo_mAbmlEbry2HGSXb4rSa8u0cdB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDAyNCBTYWx0ZWRfXzpfXhu2VEaNK
 /n2jpwfZopgreM6mvHlp0tG56uLVJn3Ugg9ANDP1PMMcodIipIAS0zNO18ZP4zpTAkjTc28GB4d
 CJcWNB4qnwjiB9IepQRFu8EVPggSaHHomhy5FYgyWdgIS+0Mp9MG/oi/HQEGW/xcLxLBO0Z49ma
 ktjd7t18XY4nIIPVJSDaS3QCIwdbjVqEmLGc0jNldbSI1UhSGd9Utv0JgDjzKuUDCUqtEkU4nDR
 X3dPKc98+Km43yQqYSGEAAofvyzvNUGSRDbyMr9CfSoChKBjs7iiaSLUkmZLIYlqEfM8JDJLNmF
 PNfG41HDaBvVIjPG2yS3sJKt11w3hN3P+5wIp7t034whMCASVUM+GzwkL4HM3ysMaz00JkgexF3
 L2iZql5S/bf2m88Siy698tzvqYuKozvSUHNaEFJyXxQZu7TSvcmYVo76sFG+wEpNzWireWHgTec
 VO4F6fXmwX6RFg2fQJA==
X-Proofpoint-GUID: HiCiyo_mAbmlEbry2HGSXb4rSa8u0cdB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDAyNCBTYWx0ZWRfX5gUHwle+d5px
 KWUrh8vGe7fj0NhRQBU52hg1JhHjF9ZVNOgkq72787s+brw/2hF20H0bD87cfLkRqaUkgBh3s5+
 ms/H8sq1axZAvoGuvbRfZ+bqeir6UYuKvyF8l8qJaQPNczx7ebkX
X-Authority-Analysis: v=2.4 cv=R8cz39RX c=1 sm=1 tr=0 ts=6a432e3a cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=gAnH3GRIAAAA:8
 a=rAWaG2PsGduRtDMPHBwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015
 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300024

Add adi,vout-rfb1-ohms and adi,vout-rfb2-ohms properties to support
external voltage divider configuration for VOUT sensing. When the
desired output voltage is higher than VREF, a resistor divider (RFB1
and RFB2) is required to reach the intended value.

The properties use a dependency constraint to ensure both resistors
are specified together, or neither. This prevents misconfiguration
where only one resistor value is provided.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
 .../devicetree/bindings/hwmon/pmbus/adi,max20830.yaml   | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
index ab8f6324866f29de8c66c3c63300845b2e02207e..caedad40bc592c8489df235f02c6ff051070cb1e 100644
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
@@ -66,6 +81,8 @@ examples:
             compatible = "adi,max20830";
             reg = <0x30>;
             vddh-supply = <&vddh>;
+            adi,vout-rfb1-ohms = <10000>;
+            adi,vout-rfb2-ohms = <2000>;
         };
     };
 ...

-- 
2.34.1

