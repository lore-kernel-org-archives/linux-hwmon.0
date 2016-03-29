Return-path: <tthayer@opensource.altera.com>
From: <tthayer@opensource.altera.com>
To: <lee.jones@linaro.org>, <linus.walleij@linaro.org>, <gnurou@gmail.com>,
	<jdelvare@suse.com>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
	<pawell.moll@arm.com>, <mark.rutland@arm.com>,
	<ijc+devicetree@hellion.org.uk>, <dinguyen@opensource.altera.com>
CC: <linux-gpio@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Thor Thayer <tthayer@opensource.altera.com>
Subject: [RFC 6/8] ARM: socfpga: dts: Add LED framework to A10-SR GPIO
Date: Tue, 29 Mar 2016 14:13:09 -0500
Message-ID: <1459278791-3646-7-git-send-email-tthayer@opensource.altera.com>
In-Reply-To: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
References: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

From: Thor Thayer <tthayer@opensource.altera.com>

Add the LED framework to the Arria10 System Resource chip GPIO hooks.

Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
---
 arch/arm/boot/dts/socfpga_arria10_socdk.dtsi |   24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi b/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
index 095fd72..fc0b7a0 100644
--- a/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
@@ -31,6 +31,30 @@
 		reg = <0x0 0x40000000>; /* 1GB */
 	};
 
+	a10_leds {
+		compatible = "gpio-leds";
+
+		a10sr_led0 {
+			label = "a10sr_led0";
+			gpios = <&a10sr_gpio 4 1>;
+		};
+
+		a10sr_led1 {
+			label = "a10sr_led1";
+			gpios = <&a10sr_gpio 5 1>;
+		};
+
+		a10sr_led2 {
+			label = "a10sr_led2";
+			gpios = <&a10sr_gpio 6 1>;
+		};
+
+		a10sr_led3 {
+			label = "a10sr_led3";
+			gpios = <&a10sr_gpio 7 1>;
+		};
+	};
+
 	soc {
 		clkmgr@ffd04000 {
 			clocks {
-- 
1.7.9.5
