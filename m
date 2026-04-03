Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A463F362157;
	Fri,  3 Apr 2026 12:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775220009; cv=none; b=k3+LLKS5Pt6bB55FUU3stvyR4sVWzDLevjQ3svU0Kr5bOdyrPwGW0tTeIHuz6enc0PP0+bjn+diVw9V1Q5WvSVDAFSnrls71gll6JGh7B4ochv66YZL+/z1kUBRVjTjaBNxDqzkEKJonuMI1rdLb+/S6Nt4z6v/jaeW5lnkqADE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775220009; c=relaxed/simple;
	bh=5hnXVk1/Ug9djFJ9/2YKeSEXMedBGO3Wos0yAnBHOYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=sRx1xVm9EO1cKuFI1sAl2AK26ShxtYDBiXdoMS+p6EhCCUXOL2tq5c89bUQ7bmJY9ZsgYlhP/sY8EvcrU1w7AvBNSFFg0b8XPRC2W5tLIJdomg9jglZFX0MS1KMOm69qmdQaSD6lIDc+egWtVLK4uBWuPADl3hl7E56RzqK8/2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=euKMpEyg; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="euKMpEyg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1775220007; x=1806756007;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=5hnXVk1/Ug9djFJ9/2YKeSEXMedBGO3Wos0yAnBHOYs=;
  b=euKMpEygXPszG+ULjDk2+oJ6Qao4w6ex8LRWGAbbI0HPgG72xU9HMTKg
   wPohpOomxCvUsKZ0ay6Kflt/vFmB+I1NkullLA5AQfW6NxdLs2MD+NqN8
   mB+i/zltFbyrRkl0b7zj0wwUoDwZ1PlSS+m+BVtiO04VXJVe6QiUUxdr4
   KGwvwbuj6UsRSsQKbqJceQBtsBy+qTQiFvmVVF7U1DWGAFyMj5xcOghpP
   KirfUkXqRjfRlKG9peLITfMiK5SeT0OJJ4cdi3/FjMUAWeN6VIOX79pZD
   QUGqJWCs2wxzBpFXT2l+ML4YZq3lOJIJwsyHbmaOByioO5uqAcLCPuFuq
   A==;
X-CSE-ConnectionGUID: PcdsGl/1S6WJOtT9miKKBg==
X-CSE-MsgGUID: 982WdKPVSTaxfe3FtG2gJA==
X-IronPort-AV: E=Sophos;i="6.23,157,1770620400"; 
   d="scan'208";a="222894440"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 05:40:06 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Fri, 3 Apr 2026 05:39:52 -0700
Received: from marius-VM.mshome.net (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 3 Apr 2026 05:39:49 -0700
From: Marius Cristea <marius.cristea@microchip.com>
Date: Fri, 3 Apr 2026 15:39:37 +0300
Subject: [PATCH v9 1/2] dt-bindings: hwmon: temperature: add support for
 EMC1812
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260403-hw_mon-emc1812-v9-1-1a798f31cf2e@microchip.com>
References: <20260403-hw_mon-emc1812-v9-0-1a798f31cf2e@microchip.com>
In-Reply-To: <20260403-hw_mon-emc1812-v9-0-1a798f31cf2e@microchip.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, Marius Cristea
	<marius.cristea@microchip.com>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7296;
 i=marius.cristea@microchip.com; h=from:subject:message-id;
 bh=5hnXVk1/Ug9djFJ9/2YKeSEXMedBGO3Wos0yAnBHOYs=;
 b=owGbwMvMwCW2tbSTZa7u0x2Mp9WSGDLPbxX4837GzONLAwL+zQ189sriCovYfK9dzglvWPlud
 wXOY27c0VHKwiDGxSArpsiy4q2fWtXaD5eVxDJ1YOawMoEMYeDiFICJTFFl+J+x+fU19rv7H0+w
 lfNZ/r3m3NtSrT6tbbMfVm39cv2Emmwgwz919/OrwrW3ZJVcNJ3AIBzSdc/oziaeGf5K5boW89+
 cnswKAA==
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/hwmon/microchip,emc1812.yaml          | 184 +++++++++++++++++++++
 MAINTAINERS                                        |   6 +
 2 files changed, 190 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc1812.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc1812.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..5f766a3b6a297cdc9bdfff2215fce6fa41434f0a
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/microchip,emc1812.yaml
@@ -0,0 +1,184 @@
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

