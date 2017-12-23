Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:35385 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756874AbdLWNGF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 23 Dec 2017 08:06:05 -0500
From: Joel Stanley <joel@jms.id.au>
To: Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc: Philipp Zabel <philipp.zabel@gmail.com>,
        Mykola Kostenok <c_mykolak@mellanox.com>,
        Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
        Patrick Venture <venture@google.com>,
        Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] hwmon: (aspeed-pwm-tacho) Deassert reset in probe
Date: Sat, 23 Dec 2017 23:35:28 +1030
Message-Id: <20171223130528.5346-3-joel@jms.id.au>
In-Reply-To: <20171223130528.5346-1-joel@jms.id.au>
References: <20171223130528.5346-1-joel@jms.id.au>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The ASPEED SoC must deassert a reset in order to use the PWM/tach
peripheral.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/hwmon/aspeed-pwm-tacho.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
index 63a95e23ca81..693a3d53cab5 100644
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
@@ -905,6 +907,13 @@ static int aspeed_create_fan(struct device *dev,
 	return 0;
 }
 
+static void aspeed_pwm_tacho_remove(void *data)
+{
+	struct aspeed_pwm_tacho_data *priv = data;
+
+	reset_control_assert(priv->rst);
+}
+
 static int aspeed_pwm_tacho_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -931,6 +940,19 @@ static int aspeed_pwm_tacho_probe(struct platform_device *pdev)
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
+	ret = devm_add_action_or_reset(dev, aspeed_pwm_tacho_remove, priv);
+	if (ret)
+		return ret;
+
 	regmap_write(priv->regmap, ASPEED_PTCR_TACH_SOURCE, 0);
 	regmap_write(priv->regmap, ASPEED_PTCR_TACH_SOURCE_EXT, 0);
 
-- 
2.15.1

