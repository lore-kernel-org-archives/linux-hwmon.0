Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:48160 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751478AbdKABeh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 31 Oct 2017 21:34:37 -0400
From: Joel Stanley <joel@jms.id.au>
To: Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc: Philipp Zabel <philipp.zabel@gmail.com>,
        Mykola Kostenok <c_mykolak@mellanox.com>,
        Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (aspeed-pwm-tacho) Deassert reset in probe
Date: Wed,  1 Nov 2017 12:04:21 +1030
Message-Id: <20171101013421.8488-1-joel@jms.id.au>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The ASPEED SoC must deassert a reset in order to use the PWM/tach
peripheral.

The device tree bindings are updated to document the resets phandle, and
the example is updated to match what is expected for both the reset and
clock phandle. Note that the bindings should have always had the reset
controller, as the hardware is unusable without it.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt | 14 ++++-------
 drivers/hwmon/aspeed-pwm-tacho.c                   | 27 +++++++++++++++++++---
 2 files changed, 29 insertions(+), 12 deletions(-)

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
 
diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
index f914e5f41048..346a4c5952a3 100644
--- a/drivers/hwmon/aspeed-pwm-tacho.c
+++ b/drivers/hwmon/aspeed-pwm-tacho.c
@@ -7,19 +7,20 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/errno.h>
 #include <linux/gpio/consumer.h>
-#include <linux/delay.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of_platform.h>
 #include <linux/of_device.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
-#include <linux/sysfs.h>
 #include <linux/regmap.h>
+#include <linux/reset.h>
+#include <linux/sysfs.h>
 #include <linux/thermal.h>
 
 /* ASPEED PWM & FAN Tach Register Definition */
@@ -181,6 +182,7 @@ struct aspeed_cooling_device {
 
 struct aspeed_pwm_tacho_data {
 	struct regmap *regmap;
+	struct reset_control *rst;
 	unsigned long clk_freq;
 	bool pwm_present[8];
 	bool fan_tach_present[16];
@@ -931,6 +933,15 @@ static int aspeed_pwm_tacho_probe(struct platform_device *pdev)
 			&aspeed_pwm_tacho_regmap_config);
 	if (IS_ERR(priv->regmap))
 		return PTR_ERR(priv->regmap);
+
+	priv->rst = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(priv->rst)) {
+		dev_err(dev,
+			"missing or invalid reset controller device tree entry");
+		return PTR_ERR(priv->rst);
+	}
+	reset_control_deassert(priv->rst);
+
 	regmap_write(priv->regmap, ASPEED_PTCR_TACH_SOURCE, 0);
 	regmap_write(priv->regmap, ASPEED_PTCR_TACH_SOURCE_EXT, 0);
 
@@ -960,6 +971,15 @@ static int aspeed_pwm_tacho_probe(struct platform_device *pdev)
 	return PTR_ERR_OR_ZERO(hwmon);
 }
 
+static int aspeed_pwm_tacho_remove(struct platform_device *pdev)
+{
+	struct aspeed_pwm_tacho_data *priv = platform_get_drvdata(pdev);
+
+	reset_control_deassert(priv->rst);
+
+	return 0;
+}
+
 static const struct of_device_id of_pwm_tacho_match_table[] = {
 	{ .compatible = "aspeed,ast2400-pwm-tacho", },
 	{ .compatible = "aspeed,ast2500-pwm-tacho", },
@@ -969,6 +989,7 @@ MODULE_DEVICE_TABLE(of, of_pwm_tacho_match_table);
 
 static struct platform_driver aspeed_pwm_tacho_driver = {
 	.probe		= aspeed_pwm_tacho_probe,
+	.probe		= aspeed_pwm_tacho_remove,
 	.driver		= {
 		.name	= "aspeed_pwm_tacho",
 		.of_match_table = of_pwm_tacho_match_table,
-- 
2.14.1

