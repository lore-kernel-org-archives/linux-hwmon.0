Return-path: <tthayer@opensource.altera.com>
From: <tthayer@opensource.altera.com>
To: <lee.jones@linaro.org>, <linus.walleij@linaro.org>, <gnurou@gmail.com>,
	<jdelvare@suse.com>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
	<pawel.moll@arm.com>, <mark.rutland@arm.com>,
	<ijc+devicetree@hellion.org.uk>, <dinguyen@opensource.altera.com>
CC: <linux-gpio@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Thor Thayer <tthayer@opensource.altera.com>
Subject: [PATCH 01/11] dt-bindings: mfd: Add Altera Arria10 System Resource Chip bindings
Date: Fri, 22 Apr 2016 10:33:29 -0500
Message-ID: <1461339219-15255-2-git-send-email-tthayer@opensource.altera.com>
In-Reply-To: <1461339219-15255-1-git-send-email-tthayer@opensource.altera.com>
References: <1461339219-15255-1-git-send-email-tthayer@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

From: Thor Thayer <tthayer@opensource.altera.com>

The Altera Arria10 Devkit System Resource chip is a Multi-Function
Device with a GPIO expander and power supply alarm.

This patch adds documentation for the Altera A10-SR DT bindings.

Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
---
 .../devicetree/bindings/mfd/altera-a10sr.txt       |   35 ++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/altera-a10sr.txt

diff --git a/Documentation/devicetree/bindings/mfd/altera-a10sr.txt b/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
new file mode 100644
index 0000000..8e17d05
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
@@ -0,0 +1,35 @@
+* Altera Arria10 Development Kit System Resource Chip
+
+Required parent device properties:
+- compatible	    : "altr,a10sr"
+- spi-max-frequency : Maximum SPI frequency.
+- reg		    : The SPI Chip Select address for the Arria10
+		      System Resource chip
+
+The A10SR consists of this varied group of sub-devices:
+
+Device                   Description
+------                   ----------
+a10sr_gpio               GPIO Controller
+
+Arria10 GPIO
+Required Properties:
+- compatible        : Should be "altr,a10sr-gpio"
+- gpio-controller   : Marks the device node as a GPIO Controller.
+- #gpio-cells       : Should be two.  The first cell is the pin number and
+                      the second cell is used to specify flags.
+                      See ../gpio/gpio.txt for more information.
+
+Example:
+
+        resource-manager@0 {
+		compatible = "altr,a10sr";
+		reg = <0>;
+		spi-max-frequency = <100000>;
+
+		a10sr_gpio: gpio-controller {
+			compatible = "altr,a10sr-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+	};
-- 
1.7.9.5
