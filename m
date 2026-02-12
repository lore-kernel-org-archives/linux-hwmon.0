Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8A96F2F2;
	Thu, 12 Feb 2026 09:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770890086; cv=none; b=Cr6ZXDih2Q1Qdp97cAI8EXtM+I3CV0bkj8mcBMdpOaHSAC+Q5J69mpcrriqeQyS1sVtYHcGN3f/0rRWTWQUaDil5FwspB8z4XUleNF7NYx7SFrl+6EkWonAvHZei9DtWW3HiHx60U8SmbvdPCOz2lA0I3ACGxwMWS8z3AmV+bGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770890086; c=relaxed/simple;
	bh=m2RrlM3o5MnN/ACfCP3s4GNoF/QM3p7mJauvf6/ROCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=fBSk7xanS86LT8s+20nelpijMFk3d+1JTxO8rpbOSTtRy1Ks6G7S7wX9AX7Wi2M4cIAhb7iOCCU7V8pFtKYNQf2GOMtotXEtIU2YLD7cDBuCb9dQlGorPzDY+zATugaSMa6e771jHpO9VxeDztCeHoe1sVPj5tfEAbB91zLEZeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=CIX0jzzP; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="CIX0jzzP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1770890084; x=1802426084;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=m2RrlM3o5MnN/ACfCP3s4GNoF/QM3p7mJauvf6/ROCc=;
  b=CIX0jzzP7uqS+JEkc2g+VsaAIObvoz3bGs134mqZtzEs0SKX4Ujaw3XL
   5ZHTNAPQ99Zm+Ii1a987RK8Yxcylf49P1e3/Yqh+bPFIpnaWo0akrQDdF
   /r3WSLQkhL1wtNSiYBb1hO7GYjtBIxkzC8ho0kOsbHJYBAbKevx2O503q
   el7Ec4mfgyIjWl96bgZIST2eyLOLueKvlhxqxzemcYaH36iHTiRUcJy1f
   aF4ILLhCXDcF8/HqlvB5BqXL3ISR87dWMCLw9xzzefaA6Bs9RrWP8xEGA
   CjxwBUGSd3zT/FqQ0dExQkAVm8OgFl/3eue3b5LvJDz+ISuw7aoQWgyVO
   g==;
X-CSE-ConnectionGUID: +hNYLrEgQZyt9zv3ViVv4A==
X-CSE-MsgGUID: 0vhPFDC3QhWOGqOCaULlqw==
X-IronPort-AV: E=Sophos;i="6.21,286,1763449200"; 
   d="scan'208";a="52579750"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:54:43 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Thu, 12 Feb 2026 02:54:26 -0700
Received: from marius-VM.mshome.net (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 12 Feb 2026 02:54:23 -0700
From: Marius Cristea <marius.cristea@microchip.com>
Date: Thu, 12 Feb 2026 11:54:07 +0200
Subject: [PATCH v6 1/2] dt-bindings: hwmon: temperature: add support for
 EMC1812
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260212-hw_mon-emc1812-v6-1-e37e9b38d898@microchip.com>
References: <20260212-hw_mon-emc1812-v6-0-e37e9b38d898@microchip.com>
In-Reply-To: <20260212-hw_mon-emc1812-v6-0-e37e9b38d898@microchip.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, Marius Cristea
	<marius.cristea@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7664;
 i=marius.cristea@microchip.com; h=from:subject:message-id;
 bh=m2RrlM3o5MnN/ACfCP3s4GNoF/QM3p7mJauvf6/ROCc=;
 b=owGbwMvMwCW2tbSTZa7u0x2Mp9WSGDJ7FwfsdQ46cCj3ujen9dR1a8VudbyZFCpW9eyfS9rJ8
 wULS2qvdJSyMIhxMciKKbKseOunVrX2w2UlsUwdmDmsTCBDGLg4BWAi+xcwMsxUfG7hYS9SP4fj
 yYxUt2lZM39Jrt1+otdGupCv763MsR0M/zMsP6wPv7+FOX1m5aKdirmrSgyexB2OsRGLODM5d/r
 uZwwA
X-Developer-Key: i=marius.cristea@microchip.com; a=openpgp;
 fpr=E32F8D4396E72E463E8CCD91446DE0ABD9140C3E

This is the devicetree schema for Microchip EMC1812/13/14/15/33
Multichannel Low-Voltage Remote Diode Sensor Family.

EMC1812 has one external remote temperature monitoring channel.
EMC1813 has two external remote temperature monitoring channels.
EMC1814 has three external remote temperature monitoring channels and
channels 2 and 3 support anti parallel diode.
EMC1815 has four external remote temperature monitoring channels and
channels 1/2  and 3/4 support anti parallel diode.
EMC1833 has two external remote temperature monitoring channels and
channels 1 and 2 support anti parallel diode.

Signed-off-by: Marius Cristea <marius.cristea@microchip.com>
---
 .../bindings/hwmon/microchip,emc1812.yaml          | 196 +++++++++++++++++++++
 MAINTAINERS                                        |   6 +
 2 files changed, 202 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc1812.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc1812.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c19fa1fba98bd8b185fa7feb5183059532a0d781
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/microchip,emc1812.yaml
@@ -0,0 +1,196 @@
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
+    channels 2 and 3 support anti parallel diode
+  EMC1815 has four external remote temperature monitoring channels and
+    channels 1/2 and 3/4 support anti parallel diode
+  EMC1833 has two external remote temperature monitoring channels and
+    channels 1 and 2 support anti parallel diode
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
+      enum: [alert-therm2, therm-addr]
+    minItems: 1
+    maxItems: 2
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  microchip,enable-anti-parallel:
+    description:
+      Enable anti-parallel diode mode operation. EMC1814, EMC1815 and EMC1833
+      support reading two external diodes in anti-parallel connection on the
+      same set of pins. Disabling APD functionality to implement substrate
+      diodes on devices that support APD eliminates the benefit of APD
+      (two diodes on one channel).
+    type: boolean
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
+        maxItems: 1
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
+  # EMC1812: 1 Channel, No APD, REC on channel 1
+  - if:
+      properties:
+        compatible:
+          const: microchip,emc1812
+    then:
+      properties:
+        microchip,enable-anti-parallel: false
+        microchip,parasitic-res-on-channel3-4: false
+      patternProperties:
+        "^channel@[2-4]$": false
+
+  # EMC1813: 2 Channels, No APD, REC on both channel 1 & 2
+  - if:
+      properties:
+        compatible:
+          const: microchip,emc1813
+    then:
+      properties:
+        microchip,enable-anti-parallel: false
+        microchip,parasitic-res-on-channel3-4: false
+      patternProperties:
+        "^channel@[3-4]$": false
+
+  # EMC1833: 2 Channels, Supports APD, REC on both channel 1 & 2
+  - if:
+      properties:
+        compatible:
+          const: microchip,emc1833
+    then:
+      properties:
+        microchip,parasitic-res-on-channel3-4: false
+      patternProperties:
+        "^channel@[3-4]$": false
+
+  # EMC1814: 3 Channels, Supports APD,
+  # REC on both channel 1 & 2 and channel 3
+  - if:
+      properties:
+        compatible:
+          const: microchip,emc1814
+    then:
+      properties:
+        channel@4: false
+
+  # EMC1815: 4 Channels, Supports APD, REC on 1-2 and 3-4
+  - if:
+      properties:
+        compatible:
+          const: microchip,emc1815
+    then:
+      # No restrictions needed, but explicitly allowing them is good documentation
+      properties:
+        microchip,enable-anti-parallel: true
+        microchip,parasitic-res-on-channel1-2: true
+        microchip,parasitic-res-on-channel3-4: true
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

