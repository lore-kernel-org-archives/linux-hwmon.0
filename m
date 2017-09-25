Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f42.google.com ([74.125.83.42]:50832 "EHLO
        mail-pg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753950AbdIYXJg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Sep 2017 19:09:36 -0400
Received: by mail-pg0-f42.google.com with SMTP id p5so4867935pgn.7
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Sep 2017 16:09:36 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Nishanth Menon <nm@ti.com>,
        Simon Guinot <simon.guinot@sequanux.org>,
        Jamie Lentin <jm@lentin.co.uk>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/9] hwmon: gpio-fan: Use local variable pointers
Date: Tue, 26 Sep 2017 01:09:04 +0200
Message-Id: <20170925230911.20824-3-linus.walleij@linaro.org>
In-Reply-To: <20170925230911.20824-1-linus.walleij@linaro.org>
References: <20170925230911.20824-1-linus.walleij@linaro.org>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Create local struct device *dev and device_node *np pointers to
make the code easier to read.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/hwmon/gpio-fan.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index 9c355b9d31c5..f29cee9398ef 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -541,22 +541,24 @@ static int gpio_fan_probe(struct platform_device *pdev)
 {
 	int err;
 	struct gpio_fan_data *fan_data;
-	struct gpio_fan_platform_data *pdata = dev_get_platdata(&pdev->dev);
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct gpio_fan_platform_data *pdata = dev_get_platdata(dev);
 
-	fan_data = devm_kzalloc(&pdev->dev, sizeof(struct gpio_fan_data),
+	fan_data = devm_kzalloc(dev, sizeof(struct gpio_fan_data),
 				GFP_KERNEL);
 	if (!fan_data)
 		return -ENOMEM;
 
 #ifdef CONFIG_OF_GPIO
 	if (!pdata) {
-		pdata = devm_kzalloc(&pdev->dev,
+		pdata = devm_kzalloc(dev,
 					sizeof(struct gpio_fan_platform_data),
 					GFP_KERNEL);
 		if (!pdata)
 			return -ENOMEM;
 
-		err = gpio_fan_get_of_pdata(&pdev->dev, pdata);
+		err = gpio_fan_get_of_pdata(dev, pdata);
 		if (err)
 			return err;
 	}
@@ -587,14 +589,14 @@ static int gpio_fan_probe(struct platform_device *pdev)
 
 	/* Make this driver part of hwmon class. */
 	fan_data->hwmon_dev =
-		devm_hwmon_device_register_with_groups(&pdev->dev,
+		devm_hwmon_device_register_with_groups(dev,
 						       "gpio_fan", fan_data,
 						       gpio_fan_groups);
 	if (IS_ERR(fan_data->hwmon_dev))
 		return PTR_ERR(fan_data->hwmon_dev);
 #ifdef CONFIG_OF_GPIO
 	/* Optional cooling device register for Device tree platforms */
-	fan_data->cdev = thermal_of_cooling_device_register(pdev->dev.of_node,
+	fan_data->cdev = thermal_of_cooling_device_register(np,
 							    "gpio-fan",
 							    fan_data,
 							    &gpio_fan_cool_ops);
@@ -604,7 +606,7 @@ static int gpio_fan_probe(struct platform_device *pdev)
 							 &gpio_fan_cool_ops);
 #endif /* CONFIG_OF_GPIO */
 
-	dev_info(&pdev->dev, "GPIO fan initialized\n");
+	dev_info(dev, "GPIO fan initialized\n");
 
 	return 0;
 }
-- 
2.13.5

