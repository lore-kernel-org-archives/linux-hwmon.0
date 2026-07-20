Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D26299923;
	Mon, 20 Jul 2026 03:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784517330; cv=none; b=GQkhsu2d3BWeazte35+AWEurWBpeTolcerywJAo+IwtCWnhmVzk7j3wztFOAn9td0MUe25vPTn9NgmFFRBAOOjqUuPaueJAx4z+cBw8RXJhduGutEJEhINFSVvKEK/1SXtsAmGRyfqfmkNcxR0weVMCuf6nGea0Q6opXnClPDoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784517330; c=relaxed/simple;
	bh=9lmRbWMhwDV39UeYBnp3CF5EU4MF+aBpFA9+KLtpUkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=McJcfNa93UXzXWlOKv5lN4GXaRZh6qd4GcWQB3+riwRwMrS3ks24EOAY6uZnYFim1CJOwR0PvJbVTq+NEjjuqyKLDL6oGhW5xxquTw0jXWm9nt+AOBuXvd5q9nRWiKe66ru/5e/xq6QLYMTSdcARWNu+qMLslABbFc3/rMQKG+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=UmH/BY2k; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="UmH/BY2k"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNt2GE452843;
	Sun, 19 Jul 2026 23:15:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=RALi2
	yKmlNj/tKZec+lFPKu0Vba894q0zZCPSQPKgdk=; b=UmH/BY2khMcXG90vvG1+3
	vELLd9Do0f1eq5wKoLLa5e+CmJ9bMkyEEKPOYFRDdVxGdLp+Nm0PipSctFbWSssW
	94x6I2hHsuWGHz3t9nFwK1dRgtQxxD7P+jEMIyNPv8t47NB0kmVX6Ncj7x94yJBp
	JTCW9jFge7Cdl4JhOfmzwYyF0qndG5U2S/GlOQLi1mg8tfi7z/3sZRXCyRaSq6Zi
	5h05S3WjRalLyAsxEB8G+NkO9nmqkkYRQfrye74UX3MJkOa+HihWlhRco/Da6x1/
	TtRbpFWlreBp1Egpm9sGwIeNUkSHOYey7kUjeoq+IB71LRCUFGORstrjrGqTodpK
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4fgttga5aj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jul 2026 23:15:13 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 66K3FCJP054360
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 19 Jul 2026 23:15:12 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Sun, 19 Jul
 2026 23:15:11 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Sun, 19 Jul 2026 23:15:11 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.192])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 66K3EoFT021622;
	Sun, 19 Jul 2026 23:15:03 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Mon, 20 Jul 2026 11:14:42 +0800
Subject: [PATCH v3 1/4] dt-bindings: hwmon: (pmbus/max20830): add VOUT
 feedback resistor properties and complete examples
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260720-dev-max20830c-v3-1-9d06d27d6da3@analog.com>
References: <20260720-dev-max20830c-v3-0-9d06d27d6da3@analog.com>
In-Reply-To: <20260720-dev-max20830c-v3-0-9d06d27d6da3@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784517290; l=2332;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=9lmRbWMhwDV39UeYBnp3CF5EU4MF+aBpFA9+KLtpUkU=;
 b=5UAqgIQmo95KbEw+r2kJtAPk7ZiwUSOzdGXkXbiIPfwtv8AIYhutCRIs53nkEZDIJsJz4MoWs
 MoC/66VuN/iB5GkKVy51D6MEX+3Ej0U6pXIY+LJYwYIG6b3yEsXjGZ6
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: 0A8hFulF3mUWBr8k_AOOFpa9NT4XK1uC
X-Authority-Analysis: v=2.4 cv=DagnbPtW c=1 sm=1 tr=0 ts=6a5d92c1 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=EUspDBNiAAAA:8
 a=gAnH3GRIAAAA:8 a=rWBwxEM6VC-iK73SjNoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDAzMyBTYWx0ZWRfX+TxUnZZaKAys
 /W/K27kc7F8XeZzv3qxqIEnJH4HXZOE9YZvs4lAx7TTHkfASZaWAx7fki77KrUyt4OOEggzixD9
 xSKQCZ3V4nGUW60iSG/Cqp82XZijkQYTDUYA0oaqYmUclQ14rbeZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDAzMyBTYWx0ZWRfX3iIfDSPhhqam
 65W470yWCmwWyPp4A7wFpi8d4EoNg/EAMJnqMWTQ9RL2AcuR0Q7i0J3r8onFdRDIYko4qMlXH0q
 4DJXKw5W1eRDO0054KtarjJo0uQZXgeCQMkmlabl/7qYEXvKS4CFTf7xxH5xsXXG5ykbFhmdbax
 mjshDYJOSkKpaUISxJnyL4uIcnbfCz8YpPv5jKoUVoPCO+OCh0LicZS8pQK+ETlNHFJ7zKaSzbH
 XFsr31DLBMc45Z5FRHFdpXl6gtYACfg+1RfQUAtyvkaLfYu3LGqeJd8TmAMNyaLG/YBgeT0uk9p
 K5eUwovoCD+aXGFSNOQrrAFRsSY75rY1/f63lgivAeKSP0uwsGGWpZJ7KauEVXZWwgjML7xu+6m
 uuWruObMuaiTJWgOsJMxnOzSsjxB2sxm40alWXIFBMa0E9FVBxRDGCLoHldGnA5Oix5/rS09uP/
 n/fLVTYcXujfiWWe7dA==
X-Proofpoint-GUID: 0A8hFulF3mUWBr8k_AOOFpa9NT4XK1uC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200033

Add adi,vout-rfb1-ohms and adi,vout-rfb2-ohms properties to support
external voltage divider configuration for VOUT sensing. When the
desired output voltage is higher than VREF, a resistor divider (RFB1
and RFB2) is required to reach the intended value.

The properties use a dependency constraint to ensure both resistors
are specified together, or neither. This prevents misconfiguration
where only one resistor value is provided.

This patch also added missing entries in the examples.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
 .../bindings/hwmon/pmbus/adi,max20830.yaml           | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
index 1625dd59417f1b3ca689a9c86ca266da913d1217..214adf1a3b9e9efdeca7db3bd7679c70656e9a7e 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
@@ -44,11 +44,26 @@ properties:
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
@@ -61,6 +76,11 @@ examples:
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

