Return-path: <tthayer@opensource.altera.com>
From: <tthayer@opensource.altera.com>
To: <lee.jones@linaro.org>, <linus.walleij@linaro.org>, <gnurou@gmail.com>,
	<jdelvare@suse.com>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
	<pawel.moll@arm.com>, <mark.rutland@arm.com>,
	<ijc+devicetree@hellion.org.uk>, <dinguyen@opensource.altera.com>
CC: <linux-gpio@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Thor Thayer <tthayer@opensource.altera.com>
Subject: [PATCH 08/11] dt-bindings: mfd: Add Altera A10-SR power supply alarm
Date: Fri, 22 Apr 2016 10:33:36 -0500
Message-ID: <1461339219-15255-9-git-send-email-tthayer@opensource.altera.com>
In-Reply-To: <1461339219-15255-1-git-send-email-tthayer@opensource.altera.com>
References: <1461339219-15255-1-git-send-email-tthayer@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

From: Thor Thayer <tthayer@opensource.altera.com>

Add power supply alarm from the hwmon framework.

Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
---
 .../devicetree/bindings/mfd/altera-a10sr.txt       |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/altera-a10sr.txt b/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
index 8e17d05..75c51ab 100644
--- a/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
+++ b/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
@@ -11,6 +11,7 @@ The A10SR consists of this varied group of sub-devices:
 Device                   Description
 ------                   ----------
 a10sr_gpio               GPIO Controller
+ps_alarm                 Power Supply Alarms
 
 Arria10 GPIO
 Required Properties:
@@ -20,6 +21,9 @@ Required Properties:
                       the second cell is used to specify flags.
                       See ../gpio/gpio.txt for more information.
 
+Arria10 Power Supply Alarms
+- compatible        : Should be "altr,a10sr-hwmon"
+
 Example:
 
         resource-manager@0 {
@@ -32,4 +36,8 @@ Example:
 			gpio-controller;
 			#gpio-cells = <2>;
 		};
+
+		ps_alarm {
+			compatible = "altr,a10sr-hwmon";
+		};
 	};
-- 
1.7.9.5
