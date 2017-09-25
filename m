Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f171.google.com ([209.85.192.171]:55935 "EHLO
        mail-pf0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934773AbdIYXJu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Sep 2017 19:09:50 -0400
Received: by mail-pf0-f171.google.com with SMTP id r71so4576306pfe.12
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Sep 2017 16:09:50 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Nishanth Menon <nm@ti.com>,
        Simon Guinot <simon.guinot@sequanux.org>,
        Jamie Lentin <jm@lentin.co.uk>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 8/9] hwmon: gpio-fan: Rename GPIO line state variables
Date: Tue, 26 Sep 2017 01:09:10 +0200
Message-Id: <20170925230911.20824-9-linus.walleij@linaro.org>
In-Reply-To: <20170925230911.20824-1-linus.walleij@linaro.org>
References: <20170925230911.20824-1-linus.walleij@linaro.org>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The "ctrl" and "num_ctrl" entries in the state container struct is
ambiguously named "ctrl" and "num_ctrl" overlapping with some hwmon
lingo and making it hard to understand. Since this array actually
contains the GPIO line numbers, from the Linux global GPIO numberspace,
used to control the different fan speeds. Rename these fields to
"gpios" (pluralis) and "num_gpios" so as to make it unambiguous.

Convert some instances of "unsigned" to "unsigned int" to keep
checkpatch happy.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/hwmon/gpio-fan.c | 51 ++++++++++++++++++++++++------------------------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index 568ce4b25a9e..18b3c7c27d36 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -46,8 +46,8 @@ struct gpio_fan_data {
 	/* Cooling device if any */
 	struct thermal_cooling_device *cdev;
 	struct mutex		lock; /* lock GPIOs operations. */
-	int			num_ctrl;
-	unsigned		*ctrl;
+	int			num_gpios;
+	unsigned int		*gpios;
 	int			num_speed;
 	struct gpio_fan_speed	*speed;
 	int			speed_index;
@@ -134,8 +134,9 @@ static void __set_fan_ctrl(struct gpio_fan_data *fan_data, int ctrl_val)
 {
 	int i;
 
-	for (i = 0; i < fan_data->num_ctrl; i++)
-		gpio_set_value_cansleep(fan_data->ctrl[i], (ctrl_val >> i) & 1);
+	for (i = 0; i < fan_data->num_gpios; i++)
+		gpio_set_value_cansleep(fan_data->gpios[i],
+					(ctrl_val >> i) & 1);
 }
 
 static int __get_fan_ctrl(struct gpio_fan_data *fan_data)
@@ -143,10 +144,10 @@ static int __get_fan_ctrl(struct gpio_fan_data *fan_data)
 	int i;
 	int ctrl_val = 0;
 
-	for (i = 0; i < fan_data->num_ctrl; i++) {
+	for (i = 0; i < fan_data->num_gpios; i++) {
 		int value;
 
-		value = gpio_get_value_cansleep(fan_data->ctrl[i]);
+		value = gpio_get_value_cansleep(fan_data->gpios[i]);
 		ctrl_val |= (value << i);
 	}
 	return ctrl_val;
@@ -331,7 +332,7 @@ static umode_t gpio_fan_is_visible(struct kobject *kobj,
 
 	if (index == 0 && !data->alarm_gpio)
 		return 0;
-	if (index > 0 && !data->ctrl)
+	if (index > 0 && !data->gpios)
 		return 0;
 
 	return attr->mode;
@@ -362,18 +363,18 @@ static const struct attribute_group *gpio_fan_groups[] = {
 static int fan_ctrl_init(struct gpio_fan_data *fan_data)
 {
 	struct device *dev = fan_data->dev;
-	int num_ctrl = fan_data->num_ctrl;
-	unsigned int *ctrl = fan_data->ctrl;
+	int num_gpios = fan_data->num_gpios;
+	unsigned int *gpios = fan_data->gpios;
 	int i, err;
 
-	for (i = 0; i < num_ctrl; i++) {
-		err = devm_gpio_request(dev, ctrl[i],
+	for (i = 0; i < num_gpios; i++) {
+		err = devm_gpio_request(dev, gpios[i],
 					"GPIO fan control");
 		if (err)
 			return err;
 
-		err = gpio_direction_output(ctrl[i],
-					    gpio_get_value_cansleep(ctrl[i]));
+		err = gpio_direction_output(gpios[i],
+					    gpio_get_value_cansleep(gpios[i]));
 		if (err)
 			return err;
 	}
@@ -436,7 +437,7 @@ static int gpio_fan_get_of_data(struct gpio_fan_data *fan_data)
 	struct gpio_fan_speed *speed;
 	struct device *dev = fan_data->dev;
 	struct device_node *np = dev->of_node;
-	unsigned *ctrl;
+	unsigned int *gpios;
 	unsigned i;
 	u32 u;
 	struct property *prop;
@@ -455,26 +456,26 @@ static int gpio_fan_get_of_data(struct gpio_fan_data *fan_data)
 	}
 
 	/* Fill GPIO pin array */
-	fan_data->num_ctrl = of_gpio_count(np);
-	if (fan_data->num_ctrl <= 0) {
+	fan_data->num_gpios = of_gpio_count(np);
+	if (fan_data->num_gpios <= 0) {
 		if (fan_data->alarm_gpio)
 			return 0;
 		dev_err(dev, "DT properties empty / missing");
 		return -ENODEV;
 	}
-	ctrl = devm_kzalloc(dev, fan_data->num_ctrl * sizeof(unsigned int),
+	gpios = devm_kzalloc(dev, fan_data->num_gpios * sizeof(unsigned int),
 			    GFP_KERNEL);
-	if (!ctrl)
+	if (!gpios)
 		return -ENOMEM;
-	for (i = 0; i < fan_data->num_ctrl; i++) {
+	for (i = 0; i < fan_data->num_gpios; i++) {
 		int val;
 
 		val = of_get_gpio(np, i);
 		if (val < 0)
 			return val;
-		ctrl[i] = val;
+		gpios[i] = val;
 	}
-	fan_data->ctrl = ctrl;
+	fan_data->gpios = gpios;
 
 	/* Get number of RPM/ctrl_val pairs in speed map */
 	prop = of_find_property(np, "gpio-fan,speed-map", &i);
@@ -549,7 +550,7 @@ static int gpio_fan_probe(struct platform_device *pdev)
 	}
 
 	/* Configure control GPIOs if available. */
-	if (fan_data->ctrl && fan_data->num_ctrl > 0) {
+	if (fan_data->gpios && fan_data->num_gpios > 0) {
 		if (!fan_data->speed || fan_data->num_speed <= 1)
 			return -EINVAL;
 		err = fan_ctrl_init(fan_data);
@@ -583,7 +584,7 @@ static int gpio_fan_remove(struct platform_device *pdev)
 	if (!IS_ERR(fan_data->cdev))
 		thermal_cooling_device_unregister(fan_data->cdev);
 
-	if (fan_data->ctrl)
+	if (fan_data->gpios)
 		set_fan_speed(fan_data, 0);
 
 	return 0;
@@ -599,7 +600,7 @@ static int gpio_fan_suspend(struct device *dev)
 {
 	struct gpio_fan_data *fan_data = dev_get_drvdata(dev);
 
-	if (fan_data->ctrl) {
+	if (fan_data->gpios) {
 		fan_data->resume_speed = fan_data->speed_index;
 		set_fan_speed(fan_data, 0);
 	}
@@ -611,7 +612,7 @@ static int gpio_fan_resume(struct device *dev)
 {
 	struct gpio_fan_data *fan_data = dev_get_drvdata(dev);
 
-	if (fan_data->ctrl)
+	if (fan_data->gpios)
 		set_fan_speed(fan_data, fan_data->resume_speed);
 
 	return 0;
-- 
2.13.5

