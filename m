Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AD42F6171;
	Fri, 21 Nov 2025 08:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763714967; cv=none; b=IXV1TjzZ5bn77dyt/xKYmiALcg5E6M5CTwmE2kI+C/7qWdudxw0n50tPDRLLrzlR7PaPCs8lepk6EZxV6kxJy+eEKV6cSGQobTU8EKEIe36xnR3NJ2EuQwesPI4VwTlYGLvO0I6fGwWCjvzposXO+fk51TSm197pvPe2iRRE37A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763714967; c=relaxed/simple;
	bh=REp6u+ITn4HsWBs8fBDlbj8XTPvgIJcRbnYF8hUKuLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=qVI1Cla95jYd9td7zY4/jux6fIf+GYBaigQj39/ylJM68PhDLarAQKnzGBz/zWFbbYTz7uPQ5Pt5p8AZuO9n7b6UewP71sXq6ijsmLu2Eyhq08QW6n/gjCIUPUEwSNYjrIISkKY3fKI7pCqKUJcFG2l4/o6Lp8IjHURGM+5at3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=v5QqW/hv; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="v5QqW/hv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1763714964; x=1795250964;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=REp6u+ITn4HsWBs8fBDlbj8XTPvgIJcRbnYF8hUKuLY=;
  b=v5QqW/hv+VD64BHS87e9ldBgOI5exJ82M4/2ZON4+HyYC/187AoJC1Cx
   P1rFu1JM+u3w28w6qX4gg8SYULAuhCwRizCVz5Azma1lLUHfcKAr1BOqp
   M5n8QsA7afD/WpEMEUGJkKU/+R//UoVP07+dehEsnEWmssVehMGsP/QeI
   9Lkk6t31NeScgbqW1iULJcTwmY0Yci4QTlG3PCX/ODsXj+XQ+79o2WbvP
   vCT8u+Q0XCuKl00IW+sOgJ6zVUKEoMA20MQpe3efhzTY/kpOei47WRcko
   HjUretlm26nifnltn17sfgJJA9GOFhB5SDzVk2axR7ynlFkFUveTpKmM3
   A==;
X-CSE-ConnectionGUID: wKnKnyE+RMO2awr1IOEsIA==
X-CSE-MsgGUID: p2noJoaqQNKrDI1u2FgA0g==
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="56041598"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 Nov 2025 01:49:15 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 21 Nov 2025 01:49:04 -0700
Received: from marius-VM.mshome.net (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 21 Nov 2025 01:49:02 -0700
From: Marius Cristea <marius.cristea@microchip.com>
Date: Fri, 21 Nov 2025 10:48:54 +0200
Subject: [PATCH v2 1/2] dt-bindings: hwmon: temperature: add support for
 EMC1812
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251121-hw_mon-emc1812-v2-1-5b2070f8b778@microchip.com>
References: <20251121-hw_mon-emc1812-v2-0-5b2070f8b778@microchip.com>
In-Reply-To: <20251121-hw_mon-emc1812-v2-0-5b2070f8b778@microchip.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, Marius Cristea
	<marius.cristea@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6821;
 i=marius.cristea@microchip.com; h=from:subject:message-id;
 bh=REp6u+ITn4HsWBs8fBDlbj8XTPvgIJcRbnYF8hUKuLY=;
 b=owGbwMvMwCW2tbSTZa7u0x2Mp9WSGDIV1KufrV8XOP32h9UpN66u5nuVIvIzuXm5xtOuYIfsZ
 4UBZbOyOkpZGMS4GGTFFFlWvPVTq1r74bKSWKYOzBxWJpAhDFycAjCRR9MZ/jsx16ku4v4hUbOG
 Id+03Hln8l5BpSns4vtWtlivDzoY7sbwPz42eJZudPnVC7VXXDLy9n7s5fgs/nbnTD6V+n/L25d
 b8gEA
X-Developer-Key: i=marius.cristea@microchip.com; a=openpgp;
 fpr=E32F8D4396E72E463E8CCD91446DE0ABD9140C3E

This is the devicetree schema for Microchip EMC1812/13/14/15/33
Multichannel Low-Voltage Remote Diode Sensor Family.

EMC1812 has one external remote temperature monitoring channel.
EMC1813 has two external remote temperature monitoring channels.
EMC1814 has three external remote temperature monitoring channels and
channels 2 and 3 supports anti parallel diode.
EMC1815 has four external remote temperature monitoring channels and
channels 1/2  and 3/4 supports anti parallel diode.
EMC1833 has two external remote temperature monitoring channels and
channels 1 and 2 supports anti parallel diode.

Signed-off-by: Marius Cristea <marius.cristea@microchip.com>
---
 .../bindings/hwmon/microchip,emc1812.yaml          | 182 +++++++++++++++++++++
 MAINTAINERS                                        |   6 +
 2 files changed, 188 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc1812.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc1812.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..759e004eafdfc0772e110fe484767eb66a623294
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/microchip,emc1812.yaml
@@ -0,0 +1,182 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/microchip,emc1812.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip EMC1812/13/14/15/33 multichannel temperature sensor
+
+maintainers:
+  - Marius Cristea <marius.cristea@microchip.com>
+
+description: |
+  The Microchip EMC1812/13/14/15/33 is a high-accuracy 2-wire multichannel
+  low-voltage remote diode temperature monitor.
+
+  The datasheet can be found here:
+    https://ww1.microchip.com/downloads/aemDocuments/documents/MSLD/ProductDocuments/DataSheets/EMC1812-3-4-5-33-Data-Sheet-DS20005751.pdf
+
+  EMC1812 has one external remote temperature monitoring channel
+  EMC1813 has two external remote temperature monitoring channels
+  EMC1814 has three external remote temperature monitoring channels and
+    channels 2 and 3 supports anti parallel diode
+  EMC1815 has four external remote temperature monitoring channels and
+    channels 1/2  and 3/4 supports anti parallel diode
+  EMC1833 has two external remote temperature monitoring channels and
+    channels 1 and 2 supports anti parallel diode
+
+properties:
+  compatible:
+    enum:
+      - microchip,emc1812
+      - microchip,emc1813
+      - microchip,emc1814
+      - microchip,emc1815
+      - microchip,emc1833
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: alert-therm2 asserts when the ALERT limit is exceeded.
+      - description: therm-addr asserts when the THERM limit is exceeded.
+    minItems: 1
+
+  interrupt-names:
+    items:
+      - enum: [alert-therm2, therm-addr]
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  microchip,parasitic-res-on-channel1-2:
+    description:
+      Indicates that the chip and the diodes/transistors are sufficiently
+      far apart that a parasitic resistance is added to the wires, which can
+      affect the measurements. Due to the anti-parallel diode connections,
+      channels 1 and 2 are affected together.
+    type: boolean
+
+  microchip,parasitic-res-on-channel3-4:
+    description:
+      Indicates that the chip and the diodes/transistors are sufficiently far
+      apart that a parasitic resistance is added to the wires, which can affect
+      the measurements. Due to the anti-parallel diode connections, channels
+      3 and 4 are affected together.
+    type: boolean
+
+  vdd-supply: true
+
+patternProperties:
+  "^channel@[1-4]$":
+    description:
+      Represents the external temperature channels to which
+      a remote diode is connected.
+    type: object
+
+    properties:
+      reg:
+        items:
+          minimum: 1
+          maximum: 4
+
+      label:
+        description: Unique name to identify which channel this is.
+
+    required:
+      - reg
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - microchip,emc1812
+              - microchip,emc1813
+              - microchip,emc1833
+    then:
+      properties:
+        microchip,parasitic-res-on-channel3-4: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - microchip,emc1812
+    then:
+      properties:
+        channel@1:
+          properties:
+            reg:
+              items:
+                const: 1
+      patternProperties:
+        "^channel@[2-4]$": false
+  - if:
+      properties:
+        compatible:
+          pattern: "^microchip,emc18[13]3"
+    then:
+      patternProperties:
+        "^channel@[12]$":
+          properties:
+            reg:
+              items:
+                maximum: 2
+        "^channel@[34]$": false
+  - if:
+      properties:
+        compatible:
+          pattern: "^microchip,emc1814"
+    then:
+      patternProperties:
+        "^channel@[1-3]$":
+          properties:
+            reg:
+              items:
+                maximum: 3
+      properties:
+        channel@4: false
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        temperature-sensor@4c {
+            compatible = "microchip,emc1813";
+            reg = <0x4c>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            microchip,parasitic-res-on-channel1-2;
+
+            vdd-supply = <&vdd>;
+
+            channel@1 {
+                reg = <1>;
+                label = "External CH1 Temperature";
+            };
+
+            channel@2 {
+                reg = <2>;
+                label = "External CH2 Temperature";
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 6d7b697bfdba16e4f0ee5f4f0195b9d7da06dae5..85c236df781e47c78deeb7ef4d80bc94bba604c4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16646,6 +16646,12 @@ S:	Supported
 F:	Documentation/devicetree/bindings/interrupt-controller/microchip,sama7g5-eic.yaml
 F:	drivers/irqchip/irq-mchp-eic.c
 
+MICROCHIP EMC1812 DRIVER
+M:	Marius Cristea <marius.cristea@microchip.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/hwmon/microchip,emc1812.yaml
+
 MICROCHIP I2C DRIVER
 M:	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
 L:	linux-i2c@vger.kernel.org

-- 
2.51.0

