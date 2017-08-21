Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from ms.tdt.de ([195.243.126.94]:56078 "EHLO mail.dev.tdt.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752141AbdHUIUJ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 21 Aug 2017 04:20:09 -0400
From: Florian Eckert <fe@dev.tdt.de>
To: linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] hwmon: (adcxx) add devictree bindings documentation
Date: Mon, 21 Aug 2017 10:19:51 +0200
Message-Id: <20170821081952.18508-1-fe@dev.tdt.de>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Document the devicetree bindings for the adcxx.

Signed-off-by: Florian Eckert <fe@dev.tdt.de>
---
v2:
- use regulator voltage binding

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

