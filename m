Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f170.google.com ([209.85.192.170]:43035 "EHLO
        mail-pf0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934773AbdIYXJx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Sep 2017 19:09:53 -0400
Received: by mail-pf0-f170.google.com with SMTP id y29so4588208pff.0
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Sep 2017 16:09:53 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Nishanth Menon <nm@ti.com>,
        Simon Guinot <simon.guinot@sequanux.org>,
        Jamie Lentin <jm@lentin.co.uk>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 9/9] hwmon: gpio-fan: Convert to use GPIO descriptors
Date: Tue, 26 Sep 2017 01:09:11 +0200
Message-Id: <20170925230911.20824-10-linus.walleij@linaro.org>
In-Reply-To: <20170925230911.20824-1-linus.walleij@linaro.org>
References: <20170925230911.20824-1-linus.walleij@linaro.org>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This converts the GPIO fan driver to use GPIO descriptors. This way
we avoid indirection since the gpiolib anyway just use descriptors
inside, and we also get rid of explicit polarity handling: the
descriptors internally knows if the line is active high or active
low.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/hwmon/gpio-fan.c | 83 ++++++++++++++++++------------------------------
 1 file changed, 31 insertions(+), 52 deletions(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index 18b3c7c27d36..bd289e2e7359 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -29,10 +29,9 @@
 #include <linux/err.h>
 #include <linux/mutex.h>
 #include <linux/hwmon.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
-#include <linux/of_gpio.h>
 #include <linux/thermal.h>
 
 struct gpio_fan_speed {
@@ -47,7 +46,7 @@ struct gpio_fan_data {
 	struct thermal_cooling_device *cdev;
 	struct mutex		lock; /* lock GPIOs operations. */
 	int			num_gpios;
-	unsigned int		*gpios;
+	struct gpio_desc	**gpios;
 	int			num_speed;
 	struct gpio_fan_speed	*speed;
 	int			speed_index;
@@ -55,8 +54,7 @@ struct gpio_fan_data {
 	int			resume_speed;
 #endif
 	bool			pwm_enable;
-	unsigned int		alarm_gpio;
-	unsigned int		alarm_gpio_active_low;
+	struct gpio_desc	*alarm_gpio;
 	struct work_struct	alarm_work;
 };
 
@@ -86,9 +84,9 @@ static ssize_t fan1_alarm_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
 	struct gpio_fan_data *fan_data = dev_get_drvdata(dev);
-	int value = gpio_get_value_cansleep(fan_data->alarm_gpio);
+	int value = gpiod_get_value_cansleep(fan_data->alarm_gpio);
 
-	if (fan_data->alarm_gpio_active_low)
+	if (gpiod_is_active_low(fan_data->alarm_gpio))
 		value = !value;
 
 	return sprintf(buf, "%d\n", value);
@@ -98,31 +96,21 @@ static DEVICE_ATTR_RO(fan1_alarm);
 
 static int fan_alarm_init(struct gpio_fan_data *fan_data)
 {
-	int err;
 	int alarm_irq;
 	struct device *dev = fan_data->dev;
 
-	err = devm_gpio_request(dev, fan_data->alarm_gpio, "GPIO fan alarm");
-	if (err)
-		return err;
-
-	err = gpio_direction_input(fan_data->alarm_gpio);
-	if (err)
-		return err;
-
 	/*
 	 * If the alarm GPIO don't support interrupts, just leave
 	 * without initializing the fail notification support.
 	 */
-	alarm_irq = gpio_to_irq(fan_data->alarm_gpio);
+	alarm_irq = gpiod_to_irq(fan_data->alarm_gpio);
 	if (alarm_irq < 0)
 		return 0;
 
 	INIT_WORK(&fan_data->alarm_work, fan_alarm_notify);
 	irq_set_irq_type(alarm_irq, IRQ_TYPE_EDGE_BOTH);
-	err = devm_request_irq(dev, alarm_irq, fan_alarm_irq_handler,
-			       IRQF_SHARED, "GPIO fan alarm", fan_data);
-	return err;
+	return devm_request_irq(dev, alarm_irq, fan_alarm_irq_handler,
+				IRQF_SHARED, "GPIO fan alarm", fan_data);
 }
 
 /*
@@ -135,8 +123,8 @@ static void __set_fan_ctrl(struct gpio_fan_data *fan_data, int ctrl_val)
 	int i;
 
 	for (i = 0; i < fan_data->num_gpios; i++)
-		gpio_set_value_cansleep(fan_data->gpios[i],
-					(ctrl_val >> i) & 1);
+		gpiod_set_value_cansleep(fan_data->gpios[i],
+					 (ctrl_val >> i) & 1);
 }
 
 static int __get_fan_ctrl(struct gpio_fan_data *fan_data)
@@ -147,7 +135,7 @@ static int __get_fan_ctrl(struct gpio_fan_data *fan_data)
 	for (i = 0; i < fan_data->num_gpios; i++) {
 		int value;
 
-		value = gpio_get_value_cansleep(fan_data->gpios[i]);
+		value = gpiod_get_value_cansleep(fan_data->gpios[i]);
 		ctrl_val |= (value << i);
 	}
 	return ctrl_val;
@@ -362,19 +350,19 @@ static const struct attribute_group *gpio_fan_groups[] = {
 
 static int fan_ctrl_init(struct gpio_fan_data *fan_data)
 {
-	struct device *dev = fan_data->dev;
 	int num_gpios = fan_data->num_gpios;
-	unsigned int *gpios = fan_data->gpios;
+	struct gpio_desc **gpios = fan_data->gpios;
 	int i, err;
 
 	for (i = 0; i < num_gpios; i++) {
-		err = devm_gpio_request(dev, gpios[i],
-					"GPIO fan control");
-		if (err)
-			return err;
-
-		err = gpio_direction_output(gpios[i],
-					    gpio_get_value_cansleep(gpios[i]));
+		/*
+		 * The GPIO descriptors were retrieved with GPIOD_ASIS so here
+		 * we set the GPIO into output mode, carefully preserving the
+		 * current value by setting it to whatever it is already set
+		 * (no surprise changes in default fan speed).
+		 */
+		err = gpiod_direction_output(gpios[i],
+					gpiod_get_value_cansleep(gpios[i]));
 		if (err)
 			return err;
 	}
@@ -437,43 +425,34 @@ static int gpio_fan_get_of_data(struct gpio_fan_data *fan_data)
 	struct gpio_fan_speed *speed;
 	struct device *dev = fan_data->dev;
 	struct device_node *np = dev->of_node;
-	unsigned int *gpios;
+	struct gpio_desc **gpios;
 	unsigned i;
 	u32 u;
 	struct property *prop;
 	const __be32 *p;
 
 	/* Alarm GPIO if one exists */
-	if (of_gpio_named_count(np, "alarm-gpios") > 0) {
-		int val;
-		enum of_gpio_flags flags;
-
-		val = of_get_named_gpio_flags(np, "alarm-gpios", 0, &flags);
-		if (val < 0)
-			return val;
-		fan_data->alarm_gpio = val;
-		fan_data->alarm_gpio_active_low = flags & OF_GPIO_ACTIVE_LOW;
-	}
+	fan_data->alarm_gpio = devm_gpiod_get_optional(dev, "alarm", GPIOD_IN);
+	if (IS_ERR(fan_data->alarm_gpio))
+		return PTR_ERR(fan_data->alarm_gpio);
 
 	/* Fill GPIO pin array */
-	fan_data->num_gpios = of_gpio_count(np);
+	fan_data->num_gpios = gpiod_count(dev, NULL);
 	if (fan_data->num_gpios <= 0) {
 		if (fan_data->alarm_gpio)
 			return 0;
 		dev_err(dev, "DT properties empty / missing");
 		return -ENODEV;
 	}
-	gpios = devm_kzalloc(dev, fan_data->num_gpios * sizeof(unsigned int),
-			    GFP_KERNEL);
+	gpios = devm_kzalloc(dev,
+			     fan_data->num_gpios * sizeof(struct gpio_desc *),
+			     GFP_KERNEL);
 	if (!gpios)
 		return -ENOMEM;
 	for (i = 0; i < fan_data->num_gpios; i++) {
-		int val;
-
-		val = of_get_gpio(np, i);
-		if (val < 0)
-			return val;
-		gpios[i] = val;
+		gpios[i] = devm_gpiod_get_index(dev, NULL, i, GPIOD_ASIS);
+		if (IS_ERR(gpios[i]))
+			return PTR_ERR(gpios[i]);
 	}
 	fan_data->gpios = gpios;
 
-- 
2.13.5

