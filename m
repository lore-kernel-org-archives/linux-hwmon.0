Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:35382 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753240AbdLWNFz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 23 Dec 2017 08:05:55 -0500
From: Joel Stanley <joel@jms.id.au>
To: Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc: Philipp Zabel <philipp.zabel@gmail.com>,
        Mykola Kostenok <c_mykolak@mellanox.com>,
        Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
        Patrick Venture <venture@google.com>,
        Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: hwmon: aspeed-pwm-tacho: Add reset node
Date: Sat, 23 Dec 2017 23:35:27 +1030
Message-Id: <20171223130528.5346-2-joel@jms.id.au>
In-Reply-To: <20171223130528.5346-1-joel@jms.id.au>
References: <20171223130528.5346-1-joel@jms.id.au>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The device tree bindings are updated to document the resets phandle, and
the example is updated to match what is expected for both the reset and
clock phandle.

Note that the bindings should have always had the reset controller, as
the hardware is unusable without it.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt         | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
index 367c8203213b..3ac02988a1a5 100644
--- a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
+++ b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
@@ -22,8 +22,9 @@ Required properties for pwm-tacho node:
 - compatible : should be "aspeed,ast2400-pwm-tacho" for AST2400 and
 	       "aspeed,ast2500-pwm-tacho" for AST2500.
 
-- clocks : a fixed clock providing input clock frequency(PWM
-	   and Fan Tach clock)
+- clocks : phandle to clock provider with the clock number in the second cell
+
+- resets : phandle to reset controller with the reset number in the second cell
 
 fan subnode format:
 ===================
@@ -48,19 +49,14 @@ Required properties for each child node:
 
 Examples:
 
-pwm_tacho_fixed_clk: fixedclk {
-	compatible = "fixed-clock";
-	#clock-cells = <0>;
-	clock-frequency = <24000000>;
-};
-
 pwm_tacho: pwmtachocontroller@1e786000 {
 	#address-cells = <1>;
 	#size-cells = <1>;
 	#cooling-cells = <2>;
 	reg = <0x1E786000 0x1000>;
 	compatible = "aspeed,ast2500-pwm-tacho";
-	clocks = <&pwm_tacho_fixed_clk>;
+	clocks = <&syscon ASPEED_CLK_APB>;
+	resets = <&syscon ASPEED_RESET_PWM>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
 
-- 
2.15.1

