Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:52927 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752378AbcJJWkX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Oct 2016 18:40:23 -0400
From: Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-hwmon@vger.kernel.org
Cc: Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3] Documentation: dtb: lm87: Add hwmon binding documentation.
Date: Tue, 11 Oct 2016 11:40:17 +1300
Message-Id: <20161010224017.23362-1-mahoda.ratnayaka@alliedtelesis.co.nz>
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

 Documentation/devicetree/bindings/hwmon/lm87.txt | 30 ++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/lm87.txt

diff --git a/Documentation/devicetree/bindings/hwmon/lm87.txt b/Documentation/devicetree/bindings/hwmon/lm87.txt
new file mode 100644
index 0000000..ce93d45
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
+- vcc-supply: sets the nominal voltage for internal VCC measurement to 5V.
+              Default is 3.3V.
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
2.10.1

