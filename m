Return-Path: <fe@dev.tdt.de>
Return-path: <fe@dev.tdt.de>
From: Florian Eckert <fe@dev.tdt.de>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org
Subject: [PATCH 1/2] hwmon: (adcxx) add devictree bindings documentation
Date: Thu, 17 Aug 2017 13:17:04 +0200
Message-Id: <20170817111705.24419-1-fe@dev.tdt.de>
List-ID: <linux-hwmon@vger.kernel.org>

Document the devicetree bindings for the adcxx.

Signed-off-by: Florian Eckert <fe@dev.tdt.de>
---
 Documentation/devicetree/bindings/hwmon/adcxx.txt | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/adcxx.txt

diff --git a/Documentation/devicetree/bindings/hwmon/adcxx.txt b/Documentation/devicetree/bindings/hwmon/adcxx.txt
new file mode 100644
index 000000000000..7b2a31b95723
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adcxx.txt
@@ -0,0 +1,23 @@
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
+- reference-voltage-millivolt
+	Reference voltage in millivolt (mV)
+
+Example:
+
+adc@6 {
+	compatible = "national,adcxx2s";
+	reg = <6 0>;
+	spi-max-frequency = <1000000>;
+	reference-voltage-millivolt = <3247>; /* 3.247 V */
+};
-- 
2.11.0
