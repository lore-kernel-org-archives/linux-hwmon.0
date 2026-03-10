Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877192D7398;
	Tue, 10 Mar 2026 14:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773154305; cv=none; b=sKm3KAllWGgU2dNU7CdxojYDD8hncBdKDhnuc0WN8FGz6X2hxnQvMKsTENIq9UFql/OsFYuP7YEca3hDKgMNN72CzglKWgMEOid8RQamDoICUpv5u63adcIIx5VDDuIVpexZ+Tv8/gcwWwhdSntCmPPtATvfrF8knWoGygqQK8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773154305; c=relaxed/simple;
	bh=5hnXVk1/Ug9djFJ9/2YKeSEXMedBGO3Wos0yAnBHOYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=D+hRhvNCph2t/kzNhuv3ONcnz/yymVTjJtX7Y4Jc78w0uKSowb0FX/WQs9J+ieZnz6vmvLpDsAkV/0QRO/1YzC4FQIM7LMWfP64Oz28XtWOKhvSKQDwmdcMOL/eo1IYL+Cc5Q0V7MUHj8OSaQqtWbMqJR5ww/NM5aRIZ5/A0lz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=gLNIzZVy; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="gLNIzZVy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1773154303; x=1804690303;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=5hnXVk1/Ug9djFJ9/2YKeSEXMedBGO3Wos0yAnBHOYs=;
  b=gLNIzZVyf6CgXDaWFU6rwiqLAPYUwc3Ey4JEF5uX8D1dOR2v4zM8patO
   19xz+2lal+jyrWZFzv9kIjO4BvS0+abpu0f3o6aH/Bu15diDq14FaVZFm
   TqgboaAYosmRcJpQX9/+m3N8TAGqYmUMyiUq0hWnRt1PLVtwDhpJKrPJS
   C1CduY4G9BbFLRbaFjV39PWhaklS61B+hAWqp+2hVYVcgl0Gkv2ZM6laP
   B3BV7qN0zUExZTo1ibxwbJ30/U9tv6ygiU58RaoDppCPMQUlz99Pk/Vaj
   I3kp/3KP6y+m2J0wK42/9wfjnayzY0eVaP11TeQw9HnqB90lSFU/kSQFd
   g==;
X-CSE-ConnectionGUID: FWHYr/n3Reu+4CnCsaN6IQ==
X-CSE-MsgGUID: JSnZQ3RFS1OCVoNbinACsQ==
X-IronPort-AV: E=Sophos;i="6.23,112,1770620400"; 
   d="scan'208";a="53713924"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Mar 2026 07:51:36 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 10 Mar 2026 07:51:16 -0700
Received: from marius-VM.mshome.net (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 10 Mar 2026 07:51:13 -0700
From: Marius Cristea <marius.cristea@microchip.com>
Date: Tue, 10 Mar 2026 16:50:45 +0200
Subject: [PATCH v8 1/2] dt-bindings: hwmon: temperature: add support for
 EMC1812
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260310-hw_mon-emc1812-v8-1-bc155727e0d2@microchip.com>
References: <20260310-hw_mon-emc1812-v8-0-bc155727e0d2@microchip.com>
In-Reply-To: <20260310-hw_mon-emc1812-v8-0-bc155727e0d2@microchip.com>
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
 b=owGbwMvMwCW2tbSTZa7u0x2Mp9WSGDI36N8LldQT2VTTNfvR1Kc5Mbb/TdR/sAZobVdv3GA9m
 Z2hQKito5SFQYyLQVZMkWXFWz+1qrUfLiuJZerAzGFlAhnCwMUpABOJ+sDwTzl8ldGhn18Of5hq
 f1/P2NPVOfDj/PT2lHV7tqxPlnKZGMjI8PfS0qfGMokHbgfIqZwXUtBSmXjE96r5vasTrp7O3H+
 3lQkA
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

