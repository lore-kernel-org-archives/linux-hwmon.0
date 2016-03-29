Return-path: <tthayer@opensource.altera.com>
From: <tthayer@opensource.altera.com>
To: <lee.jones@linaro.org>, <linus.walleij@linaro.org>, <gnurou@gmail.com>,
	<jdelvare@suse.com>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
	<pawell.moll@arm.com>, <mark.rutland@arm.com>,
	<ijc+devicetree@hellion.org.uk>, <dinguyen@opensource.altera.com>
CC: <linux-gpio@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Thor Thayer <tthayer@opensource.altera.com>
Subject: [RFC 1/8] dt-bindings: mfd: Add Altera Arria10 System Resource Chip bindings
Date: Tue, 29 Mar 2016 14:13:04 -0500
Message-ID: <1459278791-3646-2-git-send-email-tthayer@opensource.altera.com>
In-Reply-To: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
References: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

From: Thor Thayer <tthayer@opensource.altera.com>

The Altera Arria10 Devkit System Resource chip is a Multi-Function
Device, it has two subdevices:
     - GPIO
     - HWMON

This patch adds documentation for the Altera A10-SR DT bindings.

Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
---
 .../devicetree/bindings/mfd/altera-a10sr.txt       |   35 ++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/altera-a10sr.txt

diff --git a/Documentation/devicetree/bindings/mfd/altera-a10sr.txt b/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
new file mode 100644
index 0000000..564c761
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
@@ -0,0 +1,35 @@
+* Altera Arria10 Development Kit System Resource Chip
+
+Required parent device properties:
+- compatible : "altr,altr_a10sr"
+- spi-max-frequency : Maximum SPI frequency.
+- reg : the SPI Chip Select address for the Arria10 System Resource chip
+
+The A10SR consists of this varied group of sub-devices:
+
+Device                   Description
+------                   ----------
+altr_a10sr_gpio          GPIO Controller
+altr_a10sr_hwmon         Hardware Monitor
+
+The LEDs are implemented entirely in the device tree using
+the gpio-led framework.
+
+Example:
+
+        a10-sr: a10-sr@0 {
+		compatible = "altr,altr-a10sr";
+		reg = <0>;
+		spi-max-frequency = <100000>;
+
+		a10sr_gpio: a10sr_gpio {
+			compatible = "altr,a10sr-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			ngpios = <16>;
+		};
+
+		a10sr_hwmon: a10sr_hwmon {
+			compatible = "altr,a10sr-hwmon";
+		};
+	};
-- 
1.7.9.5
