Return-path: <mail@alexanderkoch.net>
From: Alexander Koch <mail@alexanderkoch.net>
To: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jiri Kosina <trivial@kernel.org>,
	Alexander Koch <mail@alexanderkoch.net>
Subject: [RFC PATCH v2 1/4] devicetree: hwmon: Add bindings for ADC128D818
Date: Fri, 23 Dec 2016 23:12:02 +0100
Message-Id: <20161223221205.8825-2-mail@alexanderkoch.net>
In-Reply-To: <20161223221205.8825-1-mail@alexanderkoch.net>
References: <20161223221205.8825-1-mail@alexanderkoch.net>
List-ID: <linux-hwmon@vger.kernel.org>

Add bindings documentation for the ADC128D818 driver, featuring default I2C
properties along with the optional 'mode' property for chip operation mode
selection (see datasheet, sec. 8.4.1).

Signed-off-by: Alexander Koch <mail@alexanderkoch.net>
---
 .../devicetree/bindings/hwmon/adc128d818.txt       | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/adc128d818.txt

diff --git a/Documentation/devicetree/bindings/hwmon/adc128d818.txt b/Documentation/devicetree/bindings/hwmon/adc128d818.txt
new file mode 100644
index 000000000000..5e14aa36a696
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
+If no operation mode is configured via device tree, the driver defaults
+to Mode 0.
+
+
+Required node properties:
+
+ - compatible:  must be set to "ti,adc128d818"
+ - reg:         I2C address of the device
+
+Optional node properties:
+
+ - mode:        Operation mode (see above).
+
+
+Example (operation mode 2):
+
+	adc128d818@1d {
+		compatible = "ti,adc128d818";
+		reg = <0x1d>;
+		mode = /bits/ 8 <2>;
+	};
+
-- 
2.11.0
