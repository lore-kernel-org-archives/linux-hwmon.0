Return-path: <raltherr@google.com>
From: Rick Altherr <raltherr@google.com>
To: robh+dt@kernel.org,
	mark.rutland@arm.com,
	devicetree@vger.kernel.org,
	jdelvare@suse.com,
	linux@roeck-us.net,
	joel@jms.id.au,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] Documentation: dt-bindings: Document bindings for Aspeed AST2400/AST2500 ADC
Date: Tue, 28 Feb 2017 12:14:03 -0800
Message-Id: <20170228201404.32125-1-raltherr@google.com>
List-ID: <linux-hwmon@vger.kernel.org>

Signed-off-by: Rick Altherr <raltherr@google.com>
---
 .../devicetree/bindings/hwmon/aspeed_adc.txt       | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed_adc.txt

diff --git a/Documentation/devicetree/bindings/hwmon/aspeed_adc.txt b/Documentation/devicetree/bindings/hwmon/aspeed_adc.txt
new file mode 100644
index 000000000000..9e481668c4d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/aspeed_adc.txt
@@ -0,0 +1,48 @@
+Aspeed AST2400/2500 ADC
+
+This device is a 10-bit converter for 16 voltage channels.  All inputs are
+single ended.  Each channel can be individually enabled to allow for use of
+alternate pin functions.
+
+1) adc node
+
+  Required properties:
+  - compatible : Should be one of
+	"aspeed,ast2400-adc"
+	"aspeed,ast2500-adc"
+  - reg : memory window mapping address and length
+  - #address-cells : must be <1> corresponding to the channel child binding
+  - #size-cells : must be <0> corresponding to the channel child binding
+  - clocks : Input clock used to derive the sample clock. Expected to be the
+    SoC's APB clock.
+  - update-interval-ms : initial time between updates on a channel
+
+  The node contains child nodes for each channel that the platform uses.
+
+  Example adc node:
+    adc@1e6e9000 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	compatible = "aspeed,ast2400-adc";
+	reg = <0x1e6e9000 0xB0>;
+	clocks = <&clk_apb>;
+	update-interval-ms = <100>;
+
+	[ child node definitions... ]
+    };
+
+2) channel nodes
+
+  Optional properties:
+  - status: indicates the operational status of the device.
+    Value must be either "disabled" or "okay".
+  - label : string describing the monitored value
+
+  Example channel node:
+  channel@1 {
+	status = "okay";
+	label = "3V3 rail";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc0_default>;
+  };
-- 
2.11.0.483.g087da7b7c-goog
