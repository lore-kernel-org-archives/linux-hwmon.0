Return-Path: <fe@dev.tdt.de>
Return-path: <fe@dev.tdt.de>
From: Florian Eckert <fe@dev.tdt.de>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	mark.rutland@arm.com
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Florian Eckert <fe@dev.tdt.de>
Subject: [PATCH v3 1/2] hwmon: (adcxx) add devictree bindings documentation
Date: Thu, 15 Nov 2018 14:50:12 +0100
Message-Id: <20181115135013.30723-2-fe@dev.tdt.de>
In-Reply-To: <20181115135013.30723-1-fe@dev.tdt.de>
References: <20181115135013.30723-1-fe@dev.tdt.de>
List-ID: <linux-hwmon@vger.kernel.org>

Document the devicetree bindings for the adcxx.

Signed-off-by: Florian Eckert <fe@dev.tdt.de>
---
 Documentation/devicetree/bindings/hwmon/adcxx.txt | 24 +++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/adcxx.txt

diff --git a/Documentation/devicetree/bindings/hwmon/adcxx.txt b/Documentation/devicetree/bindings/hwmon/adcxx.txt
new file mode 100644
index 000000000000..a94a5fe21b6d
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adcxx.txt
@@ -0,0 +1,24 @@
+adcxx properties
+
+Required properties:
+- compatible: Must be one of the following:
+	- "national,adcxx1s" for adcxx1s
+	- "national,adcxx2s" for adcxx2s
+	- "national,adcxx4s" for adcxx4s
+	- "national,adcxx8s" for adcxx8s
+- reg: SPI address for chip
+
+Optional properties:
+
+- vref-supply
+  The external reference in microvolt for this device is set to this value.
+  If it does not exists the reference will be set to 3300000uV (3.3V).
+
+Example:
+
+adc@6 {
+	compatible = "national,adcxx2s";
+	reg = <6 0>;
+	spi-max-frequency = <1000000>;
+	vref-supply = <&vref>;
+};
-- 
2.11.0
