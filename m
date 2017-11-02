Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:56114 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934073AbdKBDyT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 1 Nov 2017 23:54:19 -0400
From: Joel Stanley <joel@jms.id.au>
To: Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc: Philipp Zabel <philipp.zabel@gmail.com>,
        Mykola Kostenok <c_mykolak@mellanox.com>,
        Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
        Patrick Venture <venture@google.com>,
        Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] hwmon: (aspeed-pwm-tacho) Deassert reset in probe
Date: Thu,  2 Nov 2017 14:53:48 +1100
Message-Id: <20171102035349.1902-3-joel@jms.id.au>
In-Reply-To: <20171102035349.1902-1-joel@jms.id.au>
References: <20171102035349.1902-1-joel@jms.id.au>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The ASPEED SoC must deassert a reset in order to use the PWM/tach
peripheral.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2:
 - Correct horrible mistakes
 - Boot tested and hwmon sysfs files checked
---
 drivers/hwmon/aspeed-pwm-tacho.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
index 63a95e23ca81..77bb7a4bbed4 100644
--- a/drivers/hwmon/aspeed-pwm-tacho.c
+++ b/drivers/hwmon/aspeed-pwm-tacho.c
@@ -19,6 +19,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/reset.h>
 #include <linux/sysfs.h>
 #include <linux/thermal.h>
 
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
+	reset_control_assert(priv->rst);
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
+	.remove 	= aspeed_pwm_tacho_remove,
 	.driver		= {
 		.name	= "aspeed_pwm_tacho",
 		.of_match_table = of_pwm_tacho_match_table,
-- 
2.14.1

