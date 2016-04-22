Return-path: <tthayer@opensource.altera.com>
From: <tthayer@opensource.altera.com>
To: <lee.jones@linaro.org>, <linus.walleij@linaro.org>, <gnurou@gmail.com>,
	<jdelvare@suse.com>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
	<pawel.moll@arm.com>, <mark.rutland@arm.com>,
	<ijc+devicetree@hellion.org.uk>, <dinguyen@opensource.altera.com>
CC: <linux-gpio@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Thor Thayer <tthayer@opensource.altera.com>
Subject: [PATCH 06/11] ARM: socfpga: dts: Add Devkit A10-SR fields for Arria10
Date: Fri, 22 Apr 2016 10:33:34 -0500
Message-ID: <1461339219-15255-7-git-send-email-tthayer@opensource.altera.com>
In-Reply-To: <1461339219-15255-1-git-send-email-tthayer@opensource.altera.com>
References: <1461339219-15255-1-git-send-email-tthayer@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

From: Thor Thayer <tthayer@opensource.altera.com>

Add the Altera Arria10 System Resource node. This is a Multi-Function
device with GPIO expander support.

Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
---
 arch/arm/boot/dts/socfpga_arria10_socdk.dtsi |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi b/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
index 567df98..9eb1e3e 100644
--- a/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
@@ -70,6 +70,22 @@
 	status = "okay";
 };
 
+&spi1 {
+	status = "okay";
+
+	resource-manager@0 {
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
+};
+
 &i2c1 {
 	speed-mode = <0>;
 	status = "okay";
-- 
1.7.9.5
