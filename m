Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584CF35B125;
	Thu,  5 Feb 2026 07:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770275425; cv=none; b=KmiTINZkRn88cQL8E3XjiavvM3DiLbrkK4xCvldjKWaUXye+vg6Aq+Yl0WxCICfqJLyH34ne/7E6A7AC96GSHjKRVO0Amxa1kquatiDgBVTNaXcxXArAZGurLH+UfQtR9OkIYS5jpMO7J7oqZLgi74LNzrC9NEdYQ/8Z+nBH3Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770275425; c=relaxed/simple;
	bh=OrchZcNzVkiRDk/IccOTw5EqSHvJfTxEqYaQxnqjGaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=BI1Uu3M7pFA7iPe6i0YKvsQ/Kg+Fso0+rxlytpe7cQU1zB4Mivx3mz8nOR2WwrPRr+FvrhCs6P5+W7X4mDDyMQFxmmOm9ni9AFyZUJSqA5ByaSJmFYVKe6ukp+kBgfg9EiAhNR+eylIPHk7/c45TbXoIQMuy4kY6i7h1rzfnf/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=0j3AshHg; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="0j3AshHg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1770275425; x=1801811425;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=OrchZcNzVkiRDk/IccOTw5EqSHvJfTxEqYaQxnqjGaw=;
  b=0j3AshHgYjwaukRnMvDiIJH/3eeQ6iToHq3jsz+LiQ7eMk0jS3rsLIAw
   gh1FOLk/4O+WyUUaZF5mFGwSSghmD5Oq79iEzjDNkVl4cZhd2kAa1BeUZ
   AjWiAOaLizc521xKcGkUnht3EpbncnFWWlH3ywsqIzwxBZwbbFrZO6JyP
   focb8upl0eY/1QA1irjhRFP6uAVWeJ7IZokJodDDbmJqp33dXtrLEILpS
   ox4Yz+6Y7GDYxYs5MMVJ0O5C40EtDRm8ijtPUvd6HjgHR52JRrRaln72e
   hp2z8xYNkKQNo4b7716VfgvE4Av1OeDpq+lOdX8/7L1eHdgpTmT+kCWcG
   g==;
X-CSE-ConnectionGUID: Bl4E8zWqS9W8eddL7f52hA==
X-CSE-MsgGUID: Wpd2OD/DS4KZA+55gEGIrQ==
X-IronPort-AV: E=Sophos;i="6.21,274,1763449200"; 
   d="scan'208";a="220258874"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Feb 2026 00:10:24 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 5 Feb 2026 00:09:11 -0700
Received: from marius-VM.mshome.net (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 5 Feb 2026 00:09:06 -0700
From: Marius Cristea <marius.cristea@microchip.com>
Date: Thu, 5 Feb 2026 09:09:03 +0200
Subject: [PATCH v5 1/2] dt-bindings: hwmon: temperature: add support for
 EMC1812
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260205-hw_mon-emc1812-v5-1-232835aefe8f@microchip.com>
References: <20260205-hw_mon-emc1812-v5-0-232835aefe8f@microchip.com>
In-Reply-To: <20260205-hw_mon-emc1812-v5-0-232835aefe8f@microchip.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, Marius Cristea
	<marius.cristea@microchip.com>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6877;
 i=marius.cristea@microchip.com; h=from:subject:message-id;
 bh=OrchZcNzVkiRDk/IccOTw5EqSHvJfTxEqYaQxnqjGaw=;
 b=owGbwMvMwCW2tbSTZa7u0x2Mp9WSGDJbnAQZfk5+HC5u+iPK7MKryoCiTFf2D5zui19fnf3XU
 FR6k65LRykLgxgXg6yYIsuKt35qVWs/XFYSy9SBmcPKBDaEi1MAJhKqy8iwdvuHXbqvdy8+U9yd
 yCsY2r1/fuj6L3ZW1380SdvYWoRbMjKcTzLtWHc868Cp6zk2F3zzl3voets1tXZnqIWc3bbKSYM
 RAA==
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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

