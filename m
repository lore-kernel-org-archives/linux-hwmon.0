Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4FC413628;
	Wed, 10 Jun 2026 15:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781104806; cv=none; b=sboGPvhoJug0C28xWc0QLemJ+Hs4CC+CzVmWdnCeVCBccUo238GOds47gtnq0hdLn3egMpsl74zThhcDZJFSTDqvwSBznzqaMNtdRtw71lbXrph6Hz/l8/i7DeWP0fZNJ6udzHv3+zyrEfxLLfbC5zeFnuMb3s8zN5iAiE4tEak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781104806; c=relaxed/simple;
	bh=vvPAC89EOtnV5+zTdsoWO5UnyVnu/n7Cx8Pb0qRjRzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=BrLRwc2md7mcVXGACScWacnGjdq5smLAOdjjauo58v9xcSxKoMR7CQu91DLv4Wb5dmkRI+INoQJhWIS4S0hu+ww8kdIx6HnMVxxCUC2FM5Np50kVK9laTRIG+s3PG3dzgXN/NFHjDFp/zgOZVtvxL83fiUhbAIQfm1IzhJ1sC4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=ssO1S04r; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="ssO1S04r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1781104805; x=1812640805;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=vvPAC89EOtnV5+zTdsoWO5UnyVnu/n7Cx8Pb0qRjRzY=;
  b=ssO1S04ra3rsykTp/FHR4XczKUTOB9SwQBSNgMUoH8KilDWkyOOmjGtL
   NxCh+dF0EKSJs1J3oIGnctozOwSv18Rp4haCvVfD+se7qUeuRsNHd3w3J
   R4bNIKI7UAIdilahYjRHcSQlGENmuO/IAKRFeLH71/m4Ab5Td4x0VY/DG
   LjJPSBUlvz1gwz30ZIZxd1ev6OSVgZK23aM0NhAwYRy1cvVvPKnszxsgu
   mA+X5EI9gpePnM0/2oTiwFNv3uS6lTWs8jrXK8HstM96KxuTpTUiwmwvN
   bQocUt/0Y5kXJ0fk2H2inM/gm9Ne/l/iS47zRiOjyRa/v/m8l9AS8erRQ
   A==;
X-CSE-ConnectionGUID: 84QqmaMgQBWtqM5aK/fGcw==
X-CSE-MsgGUID: w5jKBHOzQduuZtNs5NRlMQ==
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="290276623"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jun 2026 08:19:58 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 10 Jun 2026 08:19:57 -0700
Received: from marius-VM.mshome.net (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 10 Jun 2026 08:19:54 -0700
From: Marius Cristea <marius.cristea@microchip.com>
Date: Wed, 10 Jun 2026 18:19:46 +0300
Subject: [PATCH v11 1/2] dt-bindings: hwmon: temperature: add support for
 EMC1812
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260610-hw_mon-emc1812-v11-1-cef809af5c19@microchip.com>
References: <20260610-hw_mon-emc1812-v11-0-cef809af5c19@microchip.com>
In-Reply-To: <20260610-hw_mon-emc1812-v11-0-cef809af5c19@microchip.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, Marius Cristea
	<marius.cristea@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7808;
 i=marius.cristea@microchip.com; h=from:subject:message-id;
 bh=vvPAC89EOtnV5+zTdsoWO5UnyVnu/n7Cx8Pb0qRjRzY=;
 b=owGbwMvMwCW2tbSTZa7u0x2Mp9WSGLI0G6aFRK3nUWBM+3s9gz3GyUr6evmc0qpSroRNb3Xmf
 XzVrTizo5SFQYyLQVZMkWXFWz+1qrUfLiuJZerAzGFlAhnCwMUpABNZJ8Hwv9xto57waf4JleUK
 Ugn/AsoF6+P0U5nFQ5y9V5zzUD5ZzfBPJ3+9m2RG+Ln2b8FsP/OXaL/w/d9Z2JffLjHvqIX+Zg5
 +AA==
X-Developer-Key: i=marius.cristea@microchip.com; a=openpgp;
 fpr=E32F8D4396E72E463E8CCD91446DE0ABD9140C3E

This is the devicetree schema for Microchip EMC1812/13/14/15/33
Multichannel Low-Voltage Remote Diode Sensor Family. It also
updates the MAINTAINERS file to include the new driver.

EMC1812 has one external remote temperature monitoring channel.
EMC1813 has two external remote temperature monitoring channels.
EMC1814 has three external remote temperature monitoring channels and
channels 2 and 3 support anti parallel diode.
EMC1815 has four external remote temperature monitoring channels and
channels 1/2  and 3/4 support anti parallel diode.
EMC1833 has two external remote temperature monitoring channels and
channels 1 and 2 support anti parallel diode.
Resistance Error Correction is supported on channels 1/2 and 3/4.

Signed-off-by: Marius Cristea <marius.cristea@microchip.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/hwmon/microchip,emc1812.yaml          | 193 +++++++++++++++++++++
 MAINTAINERS                                        |   6 +
 2 files changed, 199 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc1812.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc1812.yaml
new file mode 100644
index 000000000000..1a273621db82
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/microchip,emc1812.yaml
@@ -0,0 +1,193 @@
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
+      - const: alert-therm2
+      - const: therm-addr
+    minItems: 1
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
+      affect the measurements. Due to the availability of only a single
+      configuration bit in hardware, channels 1 and 2 are affected together.
+      If channel 2 is not available in hardware, this setting affects only
+      channel 1.
+    type: boolean
+
+  microchip,parasitic-res-on-channel3-4:
+    description:
+      Indicates that the chip and the diodes/transistors are sufficiently
+      far apart that a parasitic resistance is added to the wires, which can
+      affect the measurements. Due to the availability of only a single
+      configuration bit in hardware, channels 3 and 4 are affected together.
+      If channel 4 is not available in hardware, this setting affects only
+      channel 3.
+    type: boolean
+
+  vdd-supply: true
+
+patternProperties:
+  "^channel@[0-4]$":
+    description: |
+      Represents the temperature channels.
+      0: Internal sensor
+      1-4: External remote diodes
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
+  # EMC1812: 1 Internal, 1 External Channels, No APD,
+  # parasitic-res-on-channel1-2: for channel 1
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
+  # EMC1813: 1 Internal, 2 External Channels, No APD,
+  # parasitic-res-on-channel1-2: on both channel 1 & 2
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
+  # EMC1833: 1 Internal, 2 External Channels, Supports APD,
+  # parasitic-res-on-channel1-2: on both channel 1 & 2
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
+  # EMC1814: 1 Internal, 3 External Channels, Supports APD,
+  # parasitic-res-on-channel1-2: on both channel 1 & 2
+  # parasitic-res-on-channel3-4: for channel 3
+  - if:
+      properties:
+        compatible:
+          const: microchip,emc1814
+    then:
+      properties:
+        channel@4: false
+
+unevaluatedProperties: false
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
index 6d7b697bfdba..85c236df781e 100644
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
2.53.0

