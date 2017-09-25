Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f54.google.com ([74.125.83.54]:44075 "EHLO
        mail-pg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753950AbdIYXJl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Sep 2017 19:09:41 -0400
Received: by mail-pg0-f54.google.com with SMTP id j16so4871205pga.1
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Sep 2017 16:09:41 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Nishanth Menon <nm@ti.com>,
        Simon Guinot <simon.guinot@sequanux.org>,
        Jamie Lentin <jm@lentin.co.uk>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 4/9] hwmon: gpio-fan: Send around device pointer
Date: Tue, 26 Sep 2017 01:09:06 +0200
Message-Id: <20170925230911.20824-5-linus.walleij@linaro.org>
In-Reply-To: <20170925230911.20824-1-linus.walleij@linaro.org>
References: <20170925230911.20824-1-linus.walleij@linaro.org>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The driver is storing the struct platform_device *pdev pointer
but what it is really using and want to pass around is a
struct device *dev pointer.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/hwmon/gpio-fan.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index cfa8d9b578dd..ad7d8fdf4f81 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -58,7 +58,7 @@ struct gpio_fan_platform_data {
 };
 
 struct gpio_fan_data {
-	struct platform_device	*pdev;
+	struct device		*dev;
 	struct device		*hwmon_dev;
 	/* Cooling device if any */
 	struct thermal_cooling_device *cdev;
@@ -85,8 +85,8 @@ static void fan_alarm_notify(struct work_struct *ws)
 	struct gpio_fan_data *fan_data =
 		container_of(ws, struct gpio_fan_data, alarm_work);
 
-	sysfs_notify(&fan_data->pdev->dev.kobj, NULL, "fan1_alarm");
-	kobject_uevent(&fan_data->pdev->dev.kobj, KOBJ_CHANGE);
+	sysfs_notify(&fan_data->dev->kobj, NULL, "fan1_alarm");
+	kobject_uevent(&fan_data->dev->kobj, KOBJ_CHANGE);
 }
 
 static irqreturn_t fan_alarm_irq_handler(int irq, void *dev_id)
@@ -118,11 +118,11 @@ static int fan_alarm_init(struct gpio_fan_data *fan_data,
 {
 	int err;
 	int alarm_irq;
-	struct platform_device *pdev = fan_data->pdev;
+	struct device *dev = fan_data->dev;
 
 	fan_data->alarm = alarm;
 
-	err = devm_gpio_request(&pdev->dev, alarm->gpio, "GPIO fan alarm");
+	err = devm_gpio_request(dev, alarm->gpio, "GPIO fan alarm");
 	if (err)
 		return err;
 
@@ -140,7 +140,7 @@ static int fan_alarm_init(struct gpio_fan_data *fan_data,
 
 	INIT_WORK(&fan_data->alarm_work, fan_alarm_notify);
 	irq_set_irq_type(alarm_irq, IRQ_TYPE_EDGE_BOTH);
-	err = devm_request_irq(&pdev->dev, alarm_irq, fan_alarm_irq_handler,
+	err = devm_request_irq(dev, alarm_irq, fan_alarm_irq_handler,
 			       IRQF_SHARED, "GPIO fan alarm", fan_data);
 	return err;
 }
@@ -191,7 +191,7 @@ static int get_fan_speed_index(struct gpio_fan_data *fan_data)
 		if (fan_data->speed[i].ctrl_val == ctrl_val)
 			return i;
 
-	dev_warn(&fan_data->pdev->dev,
+	dev_warn(fan_data->dev,
 		 "missing speed array entry for GPIO value 0x%x\n", ctrl_val);
 
 	return -ENODEV;
@@ -382,13 +382,13 @@ static const struct attribute_group *gpio_fan_groups[] = {
 static int fan_ctrl_init(struct gpio_fan_data *fan_data,
 			 struct gpio_fan_platform_data *pdata)
 {
-	struct platform_device *pdev = fan_data->pdev;
+	struct device *dev = fan_data->dev;
 	int num_ctrl = pdata->num_ctrl;
 	unsigned *ctrl = pdata->ctrl;
 	int i, err;
 
 	for (i = 0; i < num_ctrl; i++) {
-		err = devm_gpio_request(&pdev->dev, ctrl[i],
+		err = devm_gpio_request(dev, ctrl[i],
 					"GPIO fan control");
 		if (err)
 			return err;
@@ -588,7 +588,7 @@ static int gpio_fan_probe(struct platform_device *pdev)
 		return -EINVAL;
 #endif /* CONFIG_OF_GPIO */
 
-	fan_data->pdev = pdev;
+	fan_data->dev = dev;
 	platform_set_drvdata(pdev, fan_data);
 	mutex_init(&fan_data->lock);
 
-- 
2.13.5

