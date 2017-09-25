Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f46.google.com ([74.125.83.46]:46395 "EHLO
        mail-pg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753950AbdIYXJn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Sep 2017 19:09:43 -0400
Received: by mail-pg0-f46.google.com with SMTP id i130so4870990pgc.3
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Sep 2017 16:09:43 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Nishanth Menon <nm@ti.com>,
        Simon Guinot <simon.guinot@sequanux.org>,
        Jamie Lentin <jm@lentin.co.uk>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 5/9] hwmon: gpio-fan: Mandate OF_GPIO and cut pdata path
Date: Tue, 26 Sep 2017 01:09:07 +0200
Message-Id: <20170925230911.20824-6-linus.walleij@linaro.org>
In-Reply-To: <20170925230911.20824-1-linus.walleij@linaro.org>
References: <20170925230911.20824-1-linus.walleij@linaro.org>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

We have no users of platform data, we made platform data driver-local,
so cut all #ifdefs for the platform data case, and depend on the
Kconfig CONFIG_OF_GPIO symbol.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/hwmon/Kconfig    |  1 +
 drivers/hwmon/gpio-fan.c | 36 ++++++++++--------------------------
 2 files changed, 11 insertions(+), 26 deletions(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index d65431417b17..9b0e1db2202d 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -552,6 +552,7 @@ config SENSORS_G762
 
 config SENSORS_GPIO_FAN
 	tristate "GPIO fan"
+	depends on OF_GPIO
 	depends on GPIOLIB || COMPILE_TEST
 	depends on THERMAL || THERMAL=n
 	help
diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index ad7d8fdf4f81..55dbdb223e02 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -453,7 +453,6 @@ static const struct thermal_cooling_device_ops gpio_fan_cool_ops = {
 	.set_cur_state = gpio_fan_set_cur_state,
 };
 
-#ifdef CONFIG_OF_GPIO
 /*
  * Translate OpenFirmware node properties into platform_data
  */
@@ -556,7 +555,6 @@ static const struct of_device_id of_gpio_fan_match[] = {
 	{},
 };
 MODULE_DEVICE_TABLE(of, of_gpio_fan_match);
-#endif /* CONFIG_OF_GPIO */
 
 static int gpio_fan_probe(struct platform_device *pdev)
 {
@@ -564,29 +562,22 @@ static int gpio_fan_probe(struct platform_device *pdev)
 	struct gpio_fan_data *fan_data;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct gpio_fan_platform_data *pdata = dev_get_platdata(dev);
+	struct gpio_fan_platform_data *pdata;
 
 	fan_data = devm_kzalloc(dev, sizeof(struct gpio_fan_data),
 				GFP_KERNEL);
 	if (!fan_data)
 		return -ENOMEM;
 
-#ifdef CONFIG_OF_GPIO
-	if (!pdata) {
-		pdata = devm_kzalloc(dev,
-					sizeof(struct gpio_fan_platform_data),
-					GFP_KERNEL);
-		if (!pdata)
-			return -ENOMEM;
-
-		err = gpio_fan_get_of_pdata(dev, pdata);
-		if (err)
-			return err;
-	}
-#else /* CONFIG_OF_GPIO */
+	pdata = devm_kzalloc(dev,
+			     sizeof(struct gpio_fan_platform_data),
+			     GFP_KERNEL);
 	if (!pdata)
-		return -EINVAL;
-#endif /* CONFIG_OF_GPIO */
+		return -ENOMEM;
+
+	err = gpio_fan_get_of_pdata(dev, pdata);
+	if (err)
+		return err;
 
 	fan_data->dev = dev;
 	platform_set_drvdata(pdev, fan_data);
@@ -615,17 +606,12 @@ static int gpio_fan_probe(struct platform_device *pdev)
 						       gpio_fan_groups);
 	if (IS_ERR(fan_data->hwmon_dev))
 		return PTR_ERR(fan_data->hwmon_dev);
-#ifdef CONFIG_OF_GPIO
+
 	/* Optional cooling device register for Device tree platforms */
 	fan_data->cdev = thermal_of_cooling_device_register(np,
 							    "gpio-fan",
 							    fan_data,
 							    &gpio_fan_cool_ops);
-#else /* CONFIG_OF_GPIO */
-	/* Optional cooling device register for non Device tree platforms */
-	fan_data->cdev = thermal_cooling_device_register("gpio-fan", fan_data,
-							 &gpio_fan_cool_ops);
-#endif /* CONFIG_OF_GPIO */
 
 	dev_info(dev, "GPIO fan initialized\n");
 
@@ -686,9 +672,7 @@ static struct platform_driver gpio_fan_driver = {
 	.driver	= {
 		.name	= "gpio-fan",
 		.pm	= GPIO_FAN_PM,
-#ifdef CONFIG_OF_GPIO
 		.of_match_table = of_match_ptr(of_gpio_fan_match),
-#endif
 	},
 };
 
-- 
2.13.5

