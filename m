Return-Path: <nicoleotsuka@gmail.com>
Return-path: <nicoleotsuka@gmail.com>
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	mark.rutland@arm.com,
	corbet@lwn.net
Cc: afd@ti.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v6 1/2] dt-bindings: hwmon: Add ina3221 documentation
Date: Thu, 27 Sep 2018 12:49:09 -0700
Message-Id: <20180927194910.18464-2-nicoleotsuka@gmail.com>
In-Reply-To: <20180927194910.18464-1-nicoleotsuka@gmail.com>
References: <20180927194910.18464-1-nicoleotsuka@gmail.com>
List-ID: <linux-hwmon@vger.kernel.org>

Texas Instruments INA3221 is a triple-channel shunt and bus
voltage monitor. This patch adds a DT binding doc for it.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
Changelog
v5->v6:
 * Removed status property as no need to explicitly list it.
 * Combined all examples into a complete one.
v4->v5:
 * Replaced "input-id" with "reg" and added address-cells and size-cells
 * Replaced "input-label" with "label"
 * Replaced "shunt-resistor" with "shunt-resistor-micro-ohms"
v3->v4:
 * Removed the attempt of putting labels in the node names
 * Added a new optional label property in the child node
 * Updated examples accordingly
v2->v3:
 * Added a simple subject in the line 1
 * Fixed the shunt resistor value in the example
v1->v2:
 * Dropped channel name properties
 * Added child node definitions.
 * * Added shunt resistor property in the child node
 * * Added status property to indicate connection status
 * * Changed to use child node name as the label of input source

 .../devicetree/bindings/hwmon/ina3221.txt     | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ina3221.txt

diff --git a/Documentation/devicetree/bindings/hwmon/ina3221.txt b/Documentation/devicetree/bindings/hwmon/ina3221.txt
new file mode 100644
index 000000000000..f2dd3137bf1d
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ina3221.txt
@@ -0,0 +1,40 @@
+Texas Instruments INA3221 Device Tree Bindings
+
+1) ina3221 node
+  Required properties:
+  - compatible: Must be "ti,ina3221"
+  - reg: I2C address
+
+  Optional properties:
+  = The node contains optional child nodes for three channels =
+  = Each child node describes the information of input source =
+
+  - #address-cells: Required only if a child node is present. Must be 1.
+  - #size-cells: Required only if a child node is present. Must be 0.
+
+  Example:
+
+  ina3221@40 {
+          compatible = "ti,ina3221";
+          reg = <0x40>;
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          [ child node definitions... ]
+  };
+
+2) child nodes
+  Required properties:
+  - reg: Must be 0, 1 or 2, corresponding to IN1, IN2 or IN3 port of INA3221
+
+  Optional properties:
+  - label: Name of the input source
+  - shunt-resistor-micro-ohms: Shunt resistor value in micro-Ohm
+
+  Example:
+
+  input@0 {
+          reg = <0x0>;
+          label = "VDD_5V";
+          shunt-resistor-micro-ohms = <5000>;
+  };
-- 
2.17.1
