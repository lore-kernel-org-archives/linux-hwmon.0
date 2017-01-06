Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from argos.tuxed.org ([176.9.87.227]:33480 "EHLO argos.tuxed.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1161380AbdAFKpo (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 6 Jan 2017 05:45:44 -0500
From: Alexander Koch <mail@alexanderkoch.net>
To: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Michael Hornung <mhornung.linux@gmail.com>,
        devicetree@vger.kernel.org, Alexander Koch <mail@alexanderkoch.net>
Subject: [PATCH v3 1/4] devicetree: hwmon: Add bindings for ADC128D818
Date: Fri,  6 Jan 2017 11:38:14 +0100
Message-Id: <20170106103817.11588-2-mail@alexanderkoch.net>
In-Reply-To: <20170106103817.11588-1-mail@alexanderkoch.net>
References: <20170106103817.11588-1-mail@alexanderkoch.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Add bindings documentation for the ADC128D818 driver, featuring default I2C
properties along with the optional 'mode' property for chip operation mode
selection (see datasheet, sec. 8.4.1).

Signed-off-by: Alexander Koch <mail@alexanderkoch.net>
Acked-by: Michael Hornung <mhornung.linux@gmail.com>
---
 .../devicetree/bindings/hwmon/adc128d818.txt       | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/adc128d818.txt

diff --git a/Documentation/devicetree/bindings/hwmon/adc128d818.txt b/Documentation/devicetree/bindings/hwmon/adc128d818.txt
new file mode 100644
index 000000000000..db213dcc1391
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adc128d818.txt
@@ -0,0 +1,39 @@
+TI ADC128D818 ADC System Monitor With Temperature Sensor
+--------------------------------------------------------
+
+Operation modes:
+
+ - Mode 0:  7 single-ended voltage readings (IN0-IN6),
+            1 temperature reading (internal)
+ - Mode 1:  8 single-ended voltage readings (IN0-IN7),
+            no temperature
+ - Mode 2:  4 pseudo-differential voltage readings
+              (IN0-IN1, IN3-IN2, IN4-IN5, IN7-IN6),
+            1 temperature reading (internal)
+ - Mode 3:  4 single-ended voltage readings (IN0-IN3),
+            2 pseudo-differential voltage readings
+              (IN4-IN5, IN7-IN6),
+            1 temperature reading (internal)
+
+If no operation mode is configured via device tree, the driver keeps the
+currently active chip operation mode (default is mode 0).
+
+
+Required node properties:
+
+ - compatible:  must be set to "ti,adc128d818"
+ - reg:         I2C address of the device
+
+Optional node properties:
+
+ - ti,mode:     Operation mode (see above).
+
+
+Example (operation mode 2):
+
+	adc128d818@1d {
+		compatible = "ti,adc128d818";
+		reg = <0x1d>;
+		ti,mode = <2>;
+	};
+
-- 
2.11.0

