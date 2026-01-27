Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2AC30E0FB;
	Tue, 27 Jan 2026 15:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769527186; cv=none; b=k+wS2MgUSfc6FWxPi6y+YZ29gVO5wvaiBvrsabyX0HuiP21nN77U0I0fS1xrr3ESqj41NkOrV4pmZI8tv/4JlELW5Slv+QK8lO2DaGFpVnRInDOftVH9gt2X6L4IFO5zHEVSXbs4JC48NyWPw5/MvEyhUJZxlxBYmWNv78+qjEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769527186; c=relaxed/simple;
	bh=ifguvlCbiozaFrhSZAG+itqGkLwO2LIChoh21nPPUj8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rx5O0WLI/r/Xe5095YnKZNG2ODy684ViJPpSIH362mIgEqiMRIQqKRFJXjGq/C+OizDzjLjqGacPo2mbJRZLQbQZIWeV+lhnG9+bSr1K2XdUQJ478MDotdbN5j6DDZ8C6noUOdbZnIL78RBCHt+xFfhU0BVjFiYegAgw+/uwSlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=R0WSRDEH; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="R0WSRDEH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1769527184; x=1801063184;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ifguvlCbiozaFrhSZAG+itqGkLwO2LIChoh21nPPUj8=;
  b=R0WSRDEHJZHaEyQzTh51YnK+uUfpfDVDXLoqg4M2bKb1HLKs4O1oa+5v
   xoAHXova1uRSFFZCkoGcZkP5JbfI6B5bhqNl1nO7r4MKtwuwRPxY0LYOU
   KsY6Ka5M56GKL/ITrbhYs1nPuETXPbZ61yYrp0MTYn/xrhkPKoSWefkqk
   h11wHsHdgTIlFdSS0+lzCp1CgCwKekqdlcFUN0JvRkr67uJrDZFrv4nak
   KyyfGs29nS28lJHCjQskYNtZCMMoCVYKMttdeLF1ErKizaU8tp1vWcI9c
   d9r78Q/RiXEwclXJAq++tE5lrApyVrCXqYVbtMzomndxlDrs4lgIgFK3d
   g==;
X-CSE-ConnectionGUID: /F0Io9C+RMaa+h53jG3m1w==
X-CSE-MsgGUID: aBujkyQaQ7aqg+5bPNuhxA==
X-IronPort-AV: E=Sophos;i="6.21,257,1763449200"; 
   d="scan'208";a="52936926"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 08:19:43 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Tue, 27 Jan 2026 08:19:06 -0700
Received: from vduicu-Virtual-Machine.mshome.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 27 Jan 2026 08:19:04 -0700
From: <victor.duicu@microchip.com>
To: <linux@roeck-us.net>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <corbet@lwn.net>
CC: <marius.cristea@microchip.com>, <victor.duicu@microchip.com>,
	<linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: [PATCH v3 1/2] dt-bindings: hwmon: add support for MCP998X
Date: Tue, 27 Jan 2026 17:18:21 +0200
Message-ID: <20260127151823.9728-2-victor.duicu@microchip.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260127151823.9728-1-victor.duicu@microchip.com>
References: <20260127151823.9728-1-victor.duicu@microchip.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Victor Duicu <victor.duicu@microchip.com>

This is the devicetree schema for Microchip MCP998X/33 and
MCP998XD/33D Multichannel Automotive Temperature Monitor Family.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Victor Duicu <victor.duicu@microchip.com>
---
 .../bindings/hwmon/microchip,mcp9982.yaml     | 205 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 211 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,mcp9982.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/microchip,mcp9982.yaml b/Documentation/devicetree/bindings/hwmon/microchip,mcp9982.yaml
new file mode 100644
index 000000000000..05ea3c6a5618
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/microchip,mcp9982.yaml
@@ -0,0 +1,205 @@
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
+    items:
+      - description: Signal coming from ALERT/THERM pin.
+      - description: Signal coming from THERM/ADDR pin.
+      - description: Signal coming from SYS_SHDN pin.
+
+  interrupt-names:
+    items:
+      - const: alert-therm
+      - const: therm-addr
+      - const: sys-shutdown
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
+          minItems: 1
+          maxItems: 4
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
+        interrupts-names:
+          items:
+            - const: alert-therm
+            - const: sys-shutdown
+      required:
+        - microchip,power-state
+    else:
+      properties:
+        interrupts-names:
+          items:
+            - const: alert-therm
+            - const: therm-addr
+        microchip,power-state: true
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            pattern: '^microchip,mcp998(2|3)$'
+    then:
+      properties:
+        microchip,enable-anti-parallel: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            pattern: '^microchip,mcp998(2|3)d$'
+    then:
+      properties:
+        microchip,enable-anti-parallel: false
+      required:
+        - microchip,parasitic-res-on-channel1-2
+        - microchip,parasitic-res-on-channel3-4
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            pattern: '^microchip,mcp99(33|8[4-5])d$'
+    then:
+      required:
+        - microchip,parasitic-res-on-channel1-2
+        - microchip,parasitic-res-on-channel3-4
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
+
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
index 0d044a58cbfe..f88d837cb586 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17149,6 +17149,12 @@ S:	Maintained
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

