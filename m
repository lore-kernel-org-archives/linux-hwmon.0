Return-path: <tthayer@opensource.altera.com>
From: <tthayer@opensource.altera.com>
To: <lee.jones@linaro.org>, <linus.walleij@linaro.org>, <gnurou@gmail.com>,
	<jdelvare@suse.com>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
	<pawell.moll@arm.com>, <mark.rutland@arm.com>,
	<ijc+devicetree@hellion.org.uk>, <dinguyen@opensource.altera.com>
CC: <linux-gpio@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Thor Thayer <tthayer@opensource.altera.com>
Subject: [RFC 5/8] ARM: socfpga: dts: Add Devkit A10-SR fields for Arria10
Date: Tue, 29 Mar 2016 14:13:08 -0500
Message-ID: <1459278791-3646-6-git-send-email-tthayer@opensource.altera.com>
In-Reply-To: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
References: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

From: Thor Thayer <tthayer@opensource.altera.com>

Add the Altera Arria10 System Resource node. This is a Multi-Function
device with GPIO and HWMON support.

Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
---
 arch/arm/boot/dts/socfpga_arria10.dtsi       |   15 +++++++++++++++
 arch/arm/boot/dts/socfpga_arria10_socdk.dtsi |   17 +++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
index 1c5e139..069b0a0 100644
--- a/arch/arm/boot/dts/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
@@ -563,6 +563,21 @@
 			status = "disabled";
 		};
 
+		spi1: spi@ffda5000 {
+			compatible = "snps,dw-apb-ssi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0xffda5000 0x100>;
+			interrupts = <0 102 4>;
+			num-chipselect = <4>;
+			bus-num = <0>;
+			/*32bit_access;*/
+			tx-dma-channel = <&pdma 16>;
+			rx-dma-channel = <&pdma 17>;
+			clocks = <&spi_m_clk>;
+			status = "disabled";
+		};
+
 		sdr: sdr@ffc25000 {
 			compatible = "syscon";
 			reg = <0xffcfb100 0x80>;
diff --git a/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi b/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
index 567df98..095fd72 100644
--- a/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
@@ -70,6 +70,23 @@
 	status = "okay";
 };
 
+&spi1 {
+	status = "okay";
+
+	a10_sysres: a10_sysres@0 {
+		compatible = "altr,altr-a10sr";
+		reg = <0>;
+		spi-max-frequency = <1000000>;
+
+		a10sr_gpio: a10sr_gpio {
+			compatible = "altr,a10sr-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			ngpios = <16>;
+		};
+	};
+};
+
 &i2c1 {
 	speed-mode = <0>;
 	status = "okay";
-- 
1.7.9.5
