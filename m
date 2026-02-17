Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6BF36165D;
	Tue, 17 Feb 2026 14:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771337264; cv=none; b=UkNfcS0UTMyh4iETps0j3I56vFTyQDnQODkLsVizWV0npYB5DIVlcVVP8f2wRNA/ISrbpVTmxszlhjie2ntQHPrxkNXiMEOTB3ImwiKtttEty0VTDWibtBaqdQXHZzV54TTtWwtr8455Y1ZxzWl7zGvnuiNMpZTJLx9dTBb9OHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771337264; c=relaxed/simple;
	bh=S9OUibKHbi69i0rxDsGt3stdu3AkJ8WpagkUyVkNc1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=cJgUpLyypUe4n07s8VMF1zyf5IX046qmIvgSLhxZWkI5X1Xv9qBydu6MBcJdD2Hd7+tS186WasOAb9nNdXs9P9uaIsBargHsglLYVAaHWXZ9GX6eFr4J5RuQbu7LzfhIeukMLOros1RkbFVI/YldczYBcgtUcz5qEK3NSd+GhJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=LeMAF7AH; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="LeMAF7AH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1771337262; x=1802873262;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=S9OUibKHbi69i0rxDsGt3stdu3AkJ8WpagkUyVkNc1s=;
  b=LeMAF7AHFRh0qi7WVn4l0ALXnGqj2GqWkztHfI3q6xSmrpHYBrIVYtAl
   BadmpF5g8ntxHwtCoggNk0a0feME7QF8YdtsX8/spq3ueC99FakpOQdiU
   J81E/1JD3MxJ+vjKZxCj9Cvh0ZV5WG2sRqOCys6wWkw3w9A1j/GHW3ebe
   e+y+LEv+hvZ9aeEuX+vv4lae+/b7Knj/3nuA+sQdqhGh8VxcKGIYRjg1C
   UekuKmptRyUs19KvuShH5n3qk/BzHOr/K5FqxjpdhzqyYQ+9tFZSAYNe+
   TE06/EkoZKEMpJHOqYIb/o4KnuVQ9J20sOEIRVqCEjYWmnnmWhfuGnEng
   Q==;
X-CSE-ConnectionGUID: NsNq/mm8SHKghX7/+9wqEA==
X-CSE-MsgGUID: c7/PFTOSRGe9Meo9MH2Stw==
X-IronPort-AV: E=Sophos;i="6.21,296,1763449200"; 
   d="scan'208";a="53912587"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Feb 2026 07:07:34 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 17 Feb 2026 07:07:24 -0700
Received: from [127.0.1.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 17 Feb 2026 07:07:22 -0700
From: Victor Duicu <victor.duicu@microchip.com>
Date: Tue, 17 Feb 2026 16:06:13 +0200
Subject: [PATCH v10 1/2] dt-bindings: hwmon: add support for MCP998X
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260217-add-mcp9982-hwmon-v10-1-5e0aaae6f289@microchip.com>
References: <20260217-add-mcp9982-hwmon-v10-0-5e0aaae6f289@microchip.com>
In-Reply-To: <20260217-add-mcp9982-hwmon-v10-0-5e0aaae6f289@microchip.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<victor.duicu@microchip.com>, <marius.cristea@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771337236; l=7280;
 i=victor.duicu@microchip.com; s=20260213; h=from:subject:message-id;
 bh=S9OUibKHbi69i0rxDsGt3stdu3AkJ8WpagkUyVkNc1s=;
 b=pzkwLtbuG8xgwLuNu7KX4mnVRyE5tuCCfwP10t6N+yH8pJb5Xl3ZvVpx/DHXmDYqVXD1rdJp3
 nRoBC8LKGM+BoNyGbEgnIDIUSy+RURg2fJntaYFIfe+ec/Oc8pwqFwc
X-Developer-Key: i=victor.duicu@microchip.com; a=ed25519;
 pk=/o+aE26HN3Piv9T5t+efqb0aeJw9ErwMPeSC8lYXQsA=

This is the devicetree schema for Microchip MCP998X/33 and MCP998XD/33D
Multichannel Automotive Temperature Monitor Family.

Signed-off-by: Victor Duicu <victor.duicu@microchip.com>
---
 .../bindings/hwmon/microchip,mcp9982.yaml          | 223 +++++++++++++++++++++
 MAINTAINERS                                        |   6 +
 2 files changed, 229 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/microchip,mcp9982.yaml b/Documentation/devicetree/bindings/hwmon/microchip,mcp9982.yaml
new file mode 100644
index 000000000000..b59c64e9886d
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/microchip,mcp9982.yaml
@@ -0,0 +1,223 @@
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
+    maxItems: 2
+
+  interrupt-names:
+    description:
+      The chip family has three different interrupt pins divided among them.
+      The chips without "D" have alert-therm and therm-addr.
+      The chips with "D" have alert-therm and sys-shtdwn.
+    minItems: 1
+    maxItems: 2
+    items:
+      enum: [alert-therm, therm-addr, sys-shtdwn]
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
+          not:
+            contains:
+              const: therm-addr
+      required:
+        - microchip,power-state
+        - microchip,parasitic-res-on-channel1-2
+        - microchip,parasitic-res-on-channel3-4
+    else:
+      properties:
+        microchip,power-state: true
+        interrupt-names:
+          not:
+            contains:
+              const: sys-shtdwn
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

