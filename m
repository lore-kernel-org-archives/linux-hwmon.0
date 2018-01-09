Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:36192 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751646AbeAIWb2 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 9 Jan 2018 17:31:28 -0500
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de,
        gregkh@linuxfoundation.org, jdelvare@suse.com, linux@roeck-us.net
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH linux dev-4.10 2/6] ARM: dts: aspeed: peci: Add Aspeed PECI
Date: Tue,  9 Jan 2018 14:31:22 -0800
Message-Id: <20180109223126.13093-3-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
References: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This commit adds Aspeed PECI node into aspeed-g4 and aspeed-g5.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 14 ++++++++++++++
 arch/arm/boot/dts/aspeed-g5.dtsi | 14 ++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index b82ebef..7ecc7b2 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -238,6 +238,20 @@
 				clocks = <&clk_hpll>;
 			};
 
+			peci: peci@1e78b000 {
+				compatible = "aspeed,ast2400-peci";
+				reg = <0x1e78b000 0x60>;
+				interrupt-controller;
+				interrupts = <15>;
+				clocks = <&clk_clkin>;
+				clock-frequency = <24000000>;
+				msg-timing-nego = <1>;
+				addr-timing-nego = <1>;
+				rd-sampling-point = <8>;
+				cmd-timeout-ms = <1000>;
+				status = "disabled";
+			};
+
 			sgpio: gpio@0x1e780200 {
 				#gpio-cells = <2>;
 				gpio-controller;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index ba3607c..b4e8d51 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -289,6 +289,20 @@
 				clocks = <&clk_hpll>;
 			};
 
+			peci: peci@1e78b000 {
+				compatible = "aspeed,ast2500-peci";
+				reg = <0x1e78b000 0x60>;
+				interrupt-controller;
+				interrupts = <15>;
+				clocks = <&clk_clkin>;
+				clock-frequency = <24000000>;
+				msg-timing-nego = <1>;
+				addr-timing-nego = <1>;
+				rd-sampling-point = <8>;
+				cmd-timeout-ms = <1000>;
+				status = "disabled";
+			};
+
 			timer: timer@1e782000 {
 				compatible = "aspeed,ast2400-timer";
 				reg = <0x1e782000 0x90>;
-- 
2.7.4

