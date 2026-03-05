Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4643C2775;
	Thu,  5 Mar 2026 15:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772724503; cv=none; b=g8KO3QNnQsgOkkHIXMBjedM+R/21t4FEAOQswQ8/FwLyDAd5h5klpZvSHKn+TnoT3lvX1o2aovewz6tLcT5epPFhZ3N9JnMeQAGmSPC+AjUC1yz2BPcED2Ovz7OASZCm9kigM9OhtrZ7H88xpfsbdnf0gxVrwEwfz0mo80BwOAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772724503; c=relaxed/simple;
	bh=SCOTYCMYWUXN7SJv9JeIYSBVtmyY/39NlKA5Ocq5vIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=k4hsrh0H6IeN/wjMkadewJok0qZoUWAkmKdyYiD9yfkuqBo4G0gAP/U7/F60nZG1Gs6ugP8tHZwU4t3j9PAXzJvymdBaML8svfPCCdVcd4ODKU+a2NKBtt85XKpZtHULqK1Z7IXavhFBRkom0d78SzAuBO+Qe6mNmiVtELqYVWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=jE5f+LzF; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="jE5f+LzF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772724501; x=1804260501;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=SCOTYCMYWUXN7SJv9JeIYSBVtmyY/39NlKA5Ocq5vIc=;
  b=jE5f+LzFRNFwMthm3MkHZBjQ5dG4/gMzHxY+WW4w88rWsNEArPjfMaam
   zXheXsRUYmzJLV4KY/QCcfjY/Qna8V7HnLM3X+1O6x87PVmHIAFiOkfBe
   moNeFtEfrxeVpuBjq+PcrX5n+/KmjU2WBUAx0FTMh09qURVdmPpbmwqVY
   TVVs7/7LjhbEe/w0c1mWBNO4xZpKpafewIcdzFlihXUj/8mX9J8VLcyIT
   HFPIIcOztNcDmtlEdsuaFuqvxndxVDVKeTqS+i1Gd4A4eY/I55MBjbvs7
   X+qc3SHZFgy7bcUHdbvwVnuI7xXhVkOKVJXjf2i4mFvs6yV9p7PGVOWK/
   w==;
X-CSE-ConnectionGUID: UU6qnNTFSTuJp6NsMH2zZQ==
X-CSE-MsgGUID: a4zWRQWhR1O+0XwKsmDslg==
X-IronPort-AV: E=Sophos;i="6.23,103,1770620400"; 
   d="scan'208";a="221541620"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 08:28:21 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Thu, 5 Mar 2026 08:27:49 -0700
Received: from [127.0.1.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 5 Mar 2026 08:27:46 -0700
From: Victor Duicu <victor.duicu@microchip.com>
Date: Thu, 5 Mar 2026 17:26:04 +0200
Subject: [PATCH v11 1/2] dt-bindings: hwmon: add support for MCP998X
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260305-add-mcp9982-hwmon-v11-1-6e914ba63239@microchip.com>
References: <20260305-add-mcp9982-hwmon-v11-0-6e914ba63239@microchip.com>
In-Reply-To: <20260305-add-mcp9982-hwmon-v11-0-6e914ba63239@microchip.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<marius.cristea@microchip.com>, <victor.duicu@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772724465; l=7295;
 i=victor.duicu@microchip.com; s=20260213; h=from:subject:message-id;
 bh=SCOTYCMYWUXN7SJv9JeIYSBVtmyY/39NlKA5Ocq5vIc=;
 b=JaAoMm94pfGePEAawXyDvSQkGg701jjORhPS4gD60gB4XHUa4+X5t904Qf57D0fqnkl+fFf6c
 sZxnnUpvttCAboIeMR84oAeTZOgRVokz5mSvQPtjlR0+RRcNn2ayTWn
X-Developer-Key: i=victor.duicu@microchip.com; a=ed25519;
 pk=/o+aE26HN3Piv9T5t+efqb0aeJw9ErwMPeSC8lYXQsA=

Add devicetree schema for Microchip MCP998X/33 and MCP998XD/33D
Multichannel Automotive Temperature Monitor Family.

Signed-off-by: Victor Duicu <victor.duicu@microchip.com>
---
 .../bindings/hwmon/microchip,mcp9982.yaml          | 222 +++++++++++++++++++++
 MAINTAINERS                                        |   6 +
 2 files changed, 228 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/microchip,mcp9982.yaml b/Documentation/devicetree/bindings/hwmon/microchip,mcp9982.yaml
new file mode 100644
index 000000000000..04ebc06c536b
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/microchip,mcp9982.yaml
@@ -0,0 +1,222 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/microchip,mcp9982.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip MCP998X/33 and MCP998XD/33D Temperature Monitor
+
+maintainers:
+  - Victor Duicu <victor.duicu@microchip.com>
+
+description: |
+  The MCP998X/33 and MCP998XD/33D family is a high-accuracy 2-wire
+  multichannel automotive temperature monitor.
+  The datasheet can be found here:
+    https://ww1.microchip.com/downloads/aemDocuments/documents/MSLD/ProductDocuments/DataSheets/MCP998X-Family-Data-Sheet-DS20006827.pdf
+
+properties:
+  compatible:
+    enum:
+      - microchip,mcp9933
+      - microchip,mcp9933d
+      - microchip,mcp9982
+      - microchip,mcp9982d
+      - microchip,mcp9983
+      - microchip,mcp9983d
+      - microchip,mcp9984
+      - microchip,mcp9984d
+      - microchip,mcp9985
+      - microchip,mcp9985d
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 2
+
+  interrupt-names:
+    description:
+      The chip family has three different interrupt pins divided among them.
+      The chips without "D" have alert-therm and therm-addr.
+      The chips with "D" have alert-therm and sys-shtdwn.
+    minItems: 1
+    items:
+      - enum: [alert-therm, therm-addr, sys-shtdwn]
+      - enum: [therm-addr, sys-shtdwn]
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  microchip,enable-anti-parallel:
+    description:
+      Enable anti-parallel diode mode operation.
+      MCP9984/84D/85/85D and MCP9933/33D support reading two external diodes
+      in anti-parallel connection on the same set of pins.
+    type: boolean
+
+  microchip,parasitic-res-on-channel1-2:
+    description:
+      Indicates that the chip and the diodes/transistors are sufficiently far
+      apart that a parasitic resistance is added to the wires, which can affect
+      the measurements. Due to the anti-parallel diode connections, channels
+      1 and 2 are affected together.
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
+  microchip,power-state:
+    description:
+      The chip can be set in Run state or Standby state. In Run state the ADC
+      is converting on all channels at the programmed conversion rate.
+      In Standby state the host must initiate a conversion cycle by writing
+      to the One-Shot register.
+      True value sets Run state.
+      Chips with "D" in the name can only be set in Run mode.
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
+          maxItems: 1
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
+              - microchip,mcp9982d
+              - microchip,mcp9983d
+              - microchip,mcp9984d
+              - microchip,mcp9985d
+              - microchip,mcp9933d
+    then:
+      properties:
+        interrupt-names:
+          items:
+            enum: [alert-therm, sys-shtdwn]
+      required:
+        - microchip,power-state
+        - microchip,parasitic-res-on-channel1-2
+        - microchip,parasitic-res-on-channel3-4
+    else:
+      properties:
+        microchip,power-state: true
+        interrupt-names:
+          items:
+            enum: [alert-therm, therm-addr]
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - microchip,mcp9982
+              - microchip,mcp9982d
+    then:
+      properties:
+        microchip,enable-anti-parallel: false
+      patternProperties:
+        "^channel@[2-4]$": false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - microchip,mcp9983
+              - microchip,mcp9983d
+    then:
+      properties:
+        microchip,enable-anti-parallel: false
+      patternProperties:
+        "^channel@[3-4]$": false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - microchip,mcp9933
+              - microchip,mcp9933d
+    then:
+      patternProperties:
+        "^channel@[3-4]$": false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - microchip,mcp9984
+              - microchip,mcp9984d
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
+            compatible = "microchip,mcp9985";
+            reg = <0x4c>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            microchip,enable-anti-parallel;
+            microchip,parasitic-res-on-channel1-2;
+            microchip,parasitic-res-on-channel3-4;
+            vdd-supply = <&vdd>;
+
+            channel@1 {
+                reg = <1>;
+                label = "Room Temperature";
+            };
+
+            channel@2 {
+                reg = <2>;
+                label = "GPU Temperature";
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index e08767323763..026510a4129c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17160,6 +17160,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/adc/microchip,mcp3911.yaml
 F:	drivers/iio/adc/mcp3911.c
 
+MICROCHIP MCP9982 TEMPERATURE DRIVER
+M:	Victor Duicu <victor.duicu@microchip.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/hwmon/microchip,mcp9982.yaml
+
 MICROCHIP MMC/SD/SDIO MCI DRIVER
 M:	Aubin Constans <aubin.constans@microchip.com>
 S:	Maintained

-- 
2.51.0

