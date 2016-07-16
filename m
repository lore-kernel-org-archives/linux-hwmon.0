Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:36395 "EHLO
	mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752110AbcGPASn (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Fri, 15 Jul 2016 20:18:43 -0400
From: Joshua Clayton <stillcompiling@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <kernel@pengutronix.de>,
	Fabio Estevam <fabio.estevam@nxp.com>,
	Russell King <linux@armlinux.org.uk>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org
Cc: Joshua Clayton <stillcompiling@gmail.com>
Subject: [RCF 3/3] ARM: imx6q-evi: ads ads1118 support
Date: Fri, 15 Jul 2016 17:18:23 -0700
Message-Id: <582a9226dab419d27ea90e21c723856e4669a81c.1468626668.git.stillcompiling@gmail.com>
In-Reply-To: <cover.1468626668.git.stillcompiling@gmail.com>
References: <cover.1468626668.git.stillcompiling@gmail.com>
In-Reply-To: <cover.1468626668.git.stillcompiling@gmail.com>
References: <cover.1468626668.git.stillcompiling@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

add support to imx6q-evi for the 3 ADS1118 temperature/adc units,
 now that is has has a kernel driver

Signed-off-by: Joshua Clayton <stillcompiling@gmail.com>
---
 arch/arm/boot/dts/imx6q-evi.dts | 90 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm/boot/dts/imx6q-evi.dts b/arch/arm/boot/dts/imx6q-evi.dts
index 4fa5601..7e175bf 100644
--- a/arch/arm/boot/dts/imx6q-evi.dts
+++ b/arch/arm/boot/dts/imx6q-evi.dts
@@ -105,6 +105,66 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_ecspi3 &pinctrl_ecspi3cs>;
 	status = "okay";
+
+	temp1: adc@0 {
+		compatible = "ti,ads1118";
+		spi-max-frequency = <500000>;
+		spi-cpha;
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		ti,tempsensor;
+		cpu-v@0 {
+			reg = <0>;
+			ti,fullscale = <6144000>;
+			ti,datarate = <860>;
+		};
+		cpld@1 {
+			reg = <1>;
+			ti,fullscale = <6144000>;
+			ti,datarate = <860>;
+		};
+		vocm@2 {
+			reg = <2>;
+			ti,fullscale = <6144000>;
+			ti,datarate = <860>;
+		};
+		fpga@3 {
+			reg = <3>;
+			ti,fullscale = <6144000>;
+			ti,datarate = <860>;
+		};
+	};
+
+	adc2: adc@1 {
+		compatible = "ti,ads1118";
+		spi-max-frequency = <500000>;
+		spi-cpha;
+		reg = <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		ti,tempsensor;
+		signal@0 {
+			reg = <0>;
+			ti,fullscale = <6144000>;
+			ti,datarate = <860>;
+		};
+		signal@1 {
+			reg = <1>;
+			ti,fullscale = <6144000>;
+			ti,datarate = <860>;
+		};
+		probedrive@2 {
+			reg = <2>;
+			ti,fullscale = <6144000>;
+			ti,datarate = <860>;
+		};
+		probedrive@3 {
+			reg = <3>;
+			ti,fullscale = <6144000>;
+			ti,datarate = <860>;
+		};
+	};
 };
 
 &ecspi5 {
@@ -126,6 +186,36 @@
 		reg = <1>;
 	};
 
+	temp0: temp@2 {
+		compatible = "ti,ads1118";
+		spi-max-frequency = <500000>;
+		spi-cpha;
+		reg = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		ti,tempsensor;
+		analog-x@0 {
+			reg = <0>;
+			ti,fullscale = <6144000>;
+			ti,datarate = <860>;
+		};
+		analog-y@1 {
+			reg = <1>;
+			ti,fullscale = <6144000>;
+			ti,datarate = <860>;
+		};
+		main-12v@2 {
+			reg = <2>;
+			ti,fullscale = <6144000>;
+			ti,datarate = <860>;
+		};
+		battbox@3 {
+			reg = <3>;
+			ti,fullscale = <6144000>;
+			ti,datarate = <860>;
+		};
+	};
+
 	pb_rtc: rtc@3 {
 		compatible = "nxp,rtc-pcf2123";
 		spi-max-frequency = <2450000>;
-- 
2.7.4

