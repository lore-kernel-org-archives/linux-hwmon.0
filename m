Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB0338F626;
	Thu, 16 Apr 2026 08:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776326426; cv=none; b=FdnotLTB/naGOsTiRqopo6gGXEnmlvvD65H39pnXCmoDq1K+q5fJPqsnyG2pCkHknwG28MKIaaS5SDKAxfAGPqQw0OdmQLMexJulc5EcqAhRYaPmK3rh1yhNl93DeIwVK9XpybGWjnGwpRc9n4Vb6YjJff1RXAiUGUYMOeEykGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776326426; c=relaxed/simple;
	bh=2pUhuwKxHDudcfii6bz0GwftmzcYBFr8C5FCUFM3ank=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=NKeuLQaQXlJivGaeO/+29+Cz3QvQHWyejqA5SISSv2vHNYTcbPEfBJSJopP+23z+S2I+byEzP0RHrhBaZrcWNu9gFKX97vpOKM4sHEGXEA/ITD8MZIQd3d25e4mLipSVT6cjiOsz0XYM/UlZqMHSHcm+h9QT96tUPrdZz0wAC9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Ebku3qvx; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Ebku3qvx"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G71ZJY679908;
	Thu, 16 Apr 2026 04:00:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=ygO5E
	hJ4tVVCUzBEKLOt48pj8TO2Ii+LN7i1ctn8ZXg=; b=Ebku3qvxelO+QjMzWL82A
	Iy6S8KaxN5Uc7agnP6xYvpHZSdDyc/elKfDMna+WLKieUcVxxleozDM74tHvlx1U
	agtrgqgzLl7P0lU8Oj8+1pQ7lTbZ5hz3rj6kqyOeKjkAcoTcrUBGEFUGBaqPYZiw
	bB5jJGj/f6X7D0XDc9syi2/HmCN0b31jYPE8ItghWtVKqL1/CtK7OkjvjVNU6OIZ
	6KezwqFZz0a1GYrXGAtdxelBKI7HDjbkA65CT8tM6VI6iht4RyfpKS90IB1Wl0l/
	TATCbv/hqvIc5Sc/2aszbnUtul2dP1EyHf9zZC/Z5JP+TvK4a8+OoNooRbGPuEYy
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4dh84rns83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Apr 2026 04:00:05 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 63G803Ia042660
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Apr 2026 04:00:03 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Thu, 16 Apr
 2026 04:00:03 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Thu, 16 Apr 2026 04:00:03 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.193])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 63G7xbe0025993;
	Thu, 16 Apr 2026 03:59:54 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Thu, 16 Apr 2026 15:59:10 +0800
Subject: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: add max20830
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260416-dev_max20830-v2-1-2c7d676dc0bd@analog.com>
References: <20260416-dev_max20830-v2-0-2c7d676dc0bd@analog.com>
In-Reply-To: <20260416-dev_max20830-v2-0-2c7d676dc0bd@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Alexis Czezar
 Torreno <alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776326383; l=3032;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=2pUhuwKxHDudcfii6bz0GwftmzcYBFr8C5FCUFM3ank=;
 b=5Z5UX0+Z5w8PkQPAKPPTUwlBJNt4hrmi12swJgATJv27APrZ9Kr16WS6xcFoWwZ0f6gkUihCN
 8SRGLI1mTuKCLcfjI6vDGwXvZBx9zXLq0GKk8S/4LJnpa6yKJeaKYGd
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: yOjIh8mVxY3H4aSB2EJcyvl41FUHK8GV
X-Authority-Analysis: v=2.4 cv=GIM41ONK c=1 sm=1 tr=0 ts=69e09705 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=gEfo2CItAAAA:8
 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=rWBwxEM6VC-iK73SjNoA:9
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA3NCBTYWx0ZWRfX2vFB+izzJ/6t
 z9WJdBn4vsTg26krfGfJSWkeC8DI2nLr+nLXVSCa0iARV1AMzFm6uf1Exd4WRZg+8dt1LlQ06OT
 DOcorXRVIRStM8KBSAeKVaVaKCYrkX/Wc8PT2gGXb+NgjLDzS0ICzoJlelC6mTfelOquwqB5z6i
 ZvRdBfsXQZJZFXFiZXDKMTnFFrziknILd3dFC0X4Yr/qVW1Ft5pduoYXd0MwFV3vfhqJogPfeKn
 wwz2ZJWMHHyCdweE0ATl7lqcLVGBGje87pgkvlKgcTAXmsJIlJZ92DiKN04jI1AATZIeB5cDKQv
 PDlsK9icRvIygwzmZyZBitIMTKuurDaWVtVr6MQMvjL3UKwvaMIrNS9yaUCGGllY8eHMlkZLj0o
 WFGBXqvGkpcoLdMPEF/DA5bS6RwGcv4rXMPAIkWkqUb55gRJziPZP4Jfeg/80XsTfdifG/TCuoZ
 giXNyGyjK3nW5ZGS7mw==
X-Proofpoint-ORIG-GUID: yOjIh8mVxY3H4aSB2EJcyvl41FUHK8GV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160074

Add device tree documentation for MAX20830 step-down DC-DC switching
regulator with PMBus interface.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
 .../bindings/hwmon/pmbus/adi,max20830.yaml         | 61 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 +++
 2 files changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..8b3ec1ffa0c9460de2122f6606ce3dcbcdfbbcc7
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/pmbus/adi,max20830.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices MAX20830 Step-Down Switching Regulator with PMBus
+
+maintainers:
+  - Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
+
+description: |
+  The MAX20830 is a fully integrated step-down DC-DC switching regulator with
+  PMBus interface. It provides 2.7V to 16V input, 0.4V to 5.8V adjustable
+  output, and up to 30A output current. It allows monitoring of input/output
+  voltage, output current and temperature through the PMBus serial interface.
+  Datasheet:
+    https://www.analog.com/en/products/max20830.html
+
+allOf:
+  - $ref: /schemas/regulator/regulator.yaml#
+
+properties:
+  compatible:
+    const: adi,max20830
+
+  reg:
+    maxItems: 1
+
+  vddh-supply:
+    description:
+      Phandle to the regulator that provides the VDDH power supply.
+
+  avdd-supply:
+    description:
+      Phandle to the regulator that provides the AVDD power supply.
+
+  ldoin-supply:
+    description:
+      Optional 2.5V to 5.5V LDO input supply.
+
+required:
+  - compatible
+  - reg
+  - vddh-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        regulator@30 {
+            compatible = "adi,max20830";
+            reg = <0x30>;
+            vddh-supply = <&vddh>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 0a3991c10ade20dd79cc7d1bf2a1d307ba6bd19d..031c743e979521a92ed9ac67915c178ce31727bd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15579,6 +15579,13 @@ F:	Documentation/devicetree/bindings/hwmon/pmbus/adi,max17616.yaml
 F:	Documentation/hwmon/max17616.rst
 F:	drivers/hwmon/pmbus/max17616.c
 
+MAX20830 HARDWARE MONITOR DRIVER
+M:	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Supported
+W:	https://ez.analog.com/linux-software-drivers
+F:	Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
+
 MAX2175 SDR TUNER DRIVER
 M:	Ramesh Shanmugasundaram <rashanmu@gmail.com>
 L:	linux-media@vger.kernel.org

-- 
2.34.1

