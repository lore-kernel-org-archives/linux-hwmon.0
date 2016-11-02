Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:52345 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754605AbcKBC6M (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 1 Nov 2016 22:58:12 -0400
From: Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>
Subject: [PATCH v4] Documentation: dtb: lm87: Add hwmon binding documentation.
Date: Wed,  2 Nov 2016 15:58:04 +1300
Message-Id: <20161102025804.9215-1-mahoda.ratnayaka@alliedtelesis.co.nz>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This patch adds lm87 hwmon device tree node documentation.

Signed-off-by: Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>
---

Notes:
    Changes since v1:
     As suggested include all the changes are moved in
     to the same patch and the all the optional properties
     are now defined instead of using a single variable to
     indicate those properties.
    
    Changes since v2:
     Changed has-vcc-5v to use regulator binding and fixed
     a minor copy paste mistake.
    
    Changes since v3:
     Update the vcc-supply description.

 Documentation/devicetree/bindings/hwmon/lm87.txt | 30 ++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/lm87.txt

diff --git a/Documentation/devicetree/bindings/hwmon/lm87.txt b/Documentation/devicetree/bindings/hwmon/lm87.txt
new file mode 100644
index 0000000..e1b7990
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/lm87.txt
@@ -0,0 +1,30 @@
+*LM87 hwmon sensor.
+
+Required properties:
+- compatible: Should be
+	"ti,lm87"
+
+- reg: I2C address
+
+optional properties:
+- has-temp3: This configures pins 18 and 19 to be used as a second
+             remote temperature sensing channel. By default the pins
+             are configured as voltage input pins in0 and in5.
+
+- has-in6: When set, pin 5 is configured to be used as voltage input
+           in6. Otherwise the pin is set as FAN1 input.
+
+- has-in7: When set, pin 6 is configured to be used as voltage input
+           in7. Otherwise the pin is set as FAN2 input.
+
+- vcc-supply: a Phandle for the regulator supplying power, can be
+              cofigured to measure 5.0V power supply. Default is 3.3V.
+
+Example:
+
+lm87@2e {
+	compatible = "ti,lm87";
+	reg = <0x2e>;
+	has-temp3;
+	vcc-supply = <&reg_5v0>;
+};
-- 
2.10.2

