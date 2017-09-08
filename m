Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:33928 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756914AbdIHWhT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 8 Sep 2017 18:37:19 -0400
Received: by mail-lf0-f52.google.com with SMTP id l196so8388194lfl.1
        for <linux-hwmon@vger.kernel.org>; Fri, 08 Sep 2017 15:37:18 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Cameron <jic23@cam.ac.uk>
Cc: linux-hwmon@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>, arm@kernel.org,
        Davide Hug <d@videhug.ch>
Subject: [PATCH] hwmon/sht15: Root out platform data
Date: Sat,  9 Sep 2017 00:37:06 +0200
Message-Id: <20170908223706.18412-1-linus.walleij@linaro.org>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

After finding out there are active users of this sensor I noticed:

- It has a single PXA27x board file using the platform data
- The platform data is only used to carry two GPIO pins, all other
  fields are unused
- The driver does not use GPIO descriptors but the legacy GPIO
  API

I saw we can swiftly fix this by:

- Killing off the platform data entirely
- Define a GPIO descriptor lookup table in the board file
- Use the standard devm_gpiod_get() to grab the GPIO descriptors
  from either the device tree or the board file table.

This compiles, but needs testing.

Cc: arm@kernel.org
Cc: Davide Hug <d@videhug.ch>
Cc: Jonathan Cameron <jic23@cam.ac.uk>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ARM SoC folks: please ACK this so the HWMON maintainer can merge
it when it is in reasonable shape.

Davide: can you test this patch with your setup?

Jonathan: I gues you may feel this sensor needs migrating to IIO or
so, like the Imote and Stargate2 needs migrating to device tree,
but this helps a bit with that.
---
 Documentation/hwmon/sht15           |   3 +-
 arch/arm/mach-pxa/stargate2.c       |  17 ++--
 drivers/hwmon/sht15.c               | 165 ++++++++++++------------------------
 include/linux/platform_data/sht15.h |  38 ---------
 4 files changed, 63 insertions(+), 160 deletions(-)
 delete mode 100644 include/linux/platform_data/sht15.h

diff --git a/Documentation/hwmon/sht15 b/Documentation/hwmon/sht15
index 778987d1856f..5e3207c3b177 100644
--- a/Documentation/hwmon/sht15
+++ b/Documentation/hwmon/sht15
@@ -42,8 +42,7 @@ chip. These coefficients are used to internally calibrate the signals from the
 sensors. Disabling the reload of those coefficients allows saving 10ms for each
 measurement and decrease power consumption, while losing on precision.
 
-Some options may be set directly in the sht15_platform_data structure
-or via sysfs attributes.
+Some options may be set via sysfs attributes.
 
 Notes:
   * The regulator supply name is set to "vcc".
diff --git a/arch/arm/mach-pxa/stargate2.c b/arch/arm/mach-pxa/stargate2.c
index 2d45d18b1a5e..6b7df6fd2448 100644
--- a/arch/arm/mach-pxa/stargate2.c
+++ b/arch/arm/mach-pxa/stargate2.c
@@ -29,6 +29,7 @@
 #include <linux/platform_data/pcf857x.h>
 #include <linux/platform_data/at24.h>
 #include <linux/smc91x.h>
+#include <linux/gpio/machine.h>
 #include <linux/gpio.h>
 #include <linux/leds.h>
 
@@ -52,7 +53,6 @@
 #include <linux/spi/spi.h>
 #include <linux/spi/pxa2xx_spi.h>
 #include <linux/mfd/da903x.h>
-#include <linux/platform_data/sht15.h>
 
 #include "devices.h"
 #include "generic.h"
@@ -137,17 +137,18 @@ static unsigned long sg2_im2_unified_pin_config[] __initdata = {
 	GPIO10_GPIO, /* large basic connector pin 23 */
 };
 
-static struct sht15_platform_data platform_data_sht15 = {
-	.gpio_data =  100,
-	.gpio_sck  =  98,
+static struct gpiod_lookup_table sht15_gpiod_table = {
+	.dev_id = "sht15",
+	.table = {
+		/* FIXME: should this have |GPIO_OPEN_DRAIN set? */
+		GPIO_LOOKUP("gpio-pxa", 100, "data", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("gpio-pxa", 98, "clk", GPIO_ACTIVE_HIGH),
+	},
 };
 
 static struct platform_device sht15 = {
 	.name = "sht15",
 	.id = -1,
-	.dev = {
-		.platform_data = &platform_data_sht15,
-	},
 };
 
 static struct regulator_consumer_supply stargate2_sensor_3_con[] = {
@@ -608,6 +609,7 @@ static void __init imote2_init(void)
 
 	imote2_stargate2_init();
 
+	gpiod_add_lookup_table(&sht15_gpiod_table);
 	platform_add_devices(imote2_devices, ARRAY_SIZE(imote2_devices));
 
 	i2c_register_board_info(0, imote2_i2c_board_info,
@@ -988,6 +990,7 @@ static void __init stargate2_init(void)
 
 	imote2_stargate2_init();
 
+	gpiod_add_lookup_table(&sht15_gpiod_table);
 	platform_add_devices(ARRAY_AND_SIZE(stargate2_devices));
 
 	i2c_register_board_info(0, ARRAY_AND_SIZE(stargate2_i2c_board_info));
diff --git a/drivers/hwmon/sht15.c b/drivers/hwmon/sht15.c
index e4d642b673c6..6d26f6bbbb37 100644
--- a/drivers/hwmon/sht15.c
+++ b/drivers/hwmon/sht15.c
@@ -18,13 +18,11 @@
 
 #include <linux/interrupt.h>
 #include <linux/irq.h>
-#include <linux/gpio.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/mutex.h>
-#include <linux/platform_data/sht15.h>
 #include <linux/platform_device.h>
 #include <linux/sched.h>
 #include <linux/delay.h>
@@ -34,7 +32,8 @@
 #include <linux/slab.h>
 #include <linux/atomic.h>
 #include <linux/bitrev.h>
-#include <linux/of_gpio.h>
+#include <linux/gpio/consumer.h>
+#include <linux/of.h>
 
 /* Commands */
 #define SHT15_MEASURE_TEMP		0x03
@@ -122,7 +121,8 @@ static const u8 sht15_crc8_table[] = {
 
 /**
  * struct sht15_data - device instance specific data
- * @pdata:		platform data (gpio's etc).
+ * @sck:		clock GPIO line
+ * @data:		data GPIO line
  * @read_work:		bh of interrupt handler.
  * @wait_queue:		wait queue for getting values from device.
  * @val_temp:		last temperature value read from device.
@@ -150,7 +150,8 @@ static const u8 sht15_crc8_table[] = {
  * @interrupt_handled:	flag used to indicate a handler has been scheduled.
  */
 struct sht15_data {
-	struct sht15_platform_data	*pdata;
+	struct gpio_desc		*sck;
+	struct gpio_desc		*data;
 	struct work_struct		read_work;
 	wait_queue_head_t		wait_queue;
 	uint16_t			val_temp;
@@ -205,16 +206,16 @@ static int sht15_connection_reset(struct sht15_data *data)
 {
 	int i, err;
 
-	err = gpio_direction_output(data->pdata->gpio_data, 1);
+	err = gpiod_direction_output(data->data, 1);
 	if (err)
 		return err;
 	ndelay(SHT15_TSCKL);
-	gpio_set_value(data->pdata->gpio_sck, 0);
+	gpiod_set_value(data->sck, 0);
 	ndelay(SHT15_TSCKL);
 	for (i = 0; i < 9; ++i) {
-		gpio_set_value(data->pdata->gpio_sck, 1);
+		gpiod_set_value(data->sck, 1);
 		ndelay(SHT15_TSCKH);
-		gpio_set_value(data->pdata->gpio_sck, 0);
+		gpiod_set_value(data->sck, 0);
 		ndelay(SHT15_TSCKL);
 	}
 	return 0;
@@ -227,11 +228,11 @@ static int sht15_connection_reset(struct sht15_data *data)
  */
 static inline void sht15_send_bit(struct sht15_data *data, int val)
 {
-	gpio_set_value(data->pdata->gpio_data, val);
+	gpiod_set_value(data->data, val);
 	ndelay(SHT15_TSU);
-	gpio_set_value(data->pdata->gpio_sck, 1);
+	gpiod_set_value(data->sck, 1);
 	ndelay(SHT15_TSCKH);
-	gpio_set_value(data->pdata->gpio_sck, 0);
+	gpiod_set_value(data->sck, 0);
 	ndelay(SHT15_TSCKL); /* clock low time */
 }
 
@@ -248,23 +249,23 @@ static int sht15_transmission_start(struct sht15_data *data)
 	int err;
 
 	/* ensure data is high and output */
-	err = gpio_direction_output(data->pdata->gpio_data, 1);
+	err = gpiod_direction_output(data->data, 1);
 	if (err)
 		return err;
 	ndelay(SHT15_TSU);
-	gpio_set_value(data->pdata->gpio_sck, 0);
+	gpiod_set_value(data->sck, 0);
 	ndelay(SHT15_TSCKL);
-	gpio_set_value(data->pdata->gpio_sck, 1);
+	gpiod_set_value(data->sck, 1);
 	ndelay(SHT15_TSCKH);
-	gpio_set_value(data->pdata->gpio_data, 0);
+	gpiod_set_value(data->data, 0);
 	ndelay(SHT15_TSU);
-	gpio_set_value(data->pdata->gpio_sck, 0);
+	gpiod_set_value(data->sck, 0);
 	ndelay(SHT15_TSCKL);
-	gpio_set_value(data->pdata->gpio_sck, 1);
+	gpiod_set_value(data->sck, 1);
 	ndelay(SHT15_TSCKH);
-	gpio_set_value(data->pdata->gpio_data, 1);
+	gpiod_set_value(data->data, 1);
 	ndelay(SHT15_TSU);
-	gpio_set_value(data->pdata->gpio_sck, 0);
+	gpiod_set_value(data->sck, 0);
 	ndelay(SHT15_TSCKL);
 	return 0;
 }
@@ -292,20 +293,20 @@ static int sht15_wait_for_response(struct sht15_data *data)
 {
 	int err;
 
-	err = gpio_direction_input(data->pdata->gpio_data);
+	err = gpiod_direction_input(data->data);
 	if (err)
 		return err;
-	gpio_set_value(data->pdata->gpio_sck, 1);
+	gpiod_set_value(data->sck, 1);
 	ndelay(SHT15_TSCKH);
-	if (gpio_get_value(data->pdata->gpio_data)) {
-		gpio_set_value(data->pdata->gpio_sck, 0);
+	if (gpiod_get_value(data->data)) {
+		gpiod_set_value(data->sck, 0);
 		dev_err(data->dev, "Command not acknowledged\n");
 		err = sht15_connection_reset(data);
 		if (err)
 			return err;
 		return -EIO;
 	}
-	gpio_set_value(data->pdata->gpio_sck, 0);
+	gpiod_set_value(data->sck, 0);
 	ndelay(SHT15_TSCKL);
 	return 0;
 }
@@ -360,17 +361,17 @@ static int sht15_ack(struct sht15_data *data)
 {
 	int err;
 
-	err = gpio_direction_output(data->pdata->gpio_data, 0);
+	err = gpiod_direction_output(data->data, 0);
 	if (err)
 		return err;
 	ndelay(SHT15_TSU);
-	gpio_set_value(data->pdata->gpio_sck, 1);
+	gpiod_set_value(data->sck, 1);
 	ndelay(SHT15_TSU);
-	gpio_set_value(data->pdata->gpio_sck, 0);
+	gpiod_set_value(data->sck, 0);
 	ndelay(SHT15_TSU);
-	gpio_set_value(data->pdata->gpio_data, 1);
+	gpiod_set_value(data->data, 1);
 
-	return gpio_direction_input(data->pdata->gpio_data);
+	return gpiod_direction_input(data->data);
 }
 
 /**
@@ -383,13 +384,13 @@ static int sht15_end_transmission(struct sht15_data *data)
 {
 	int err;
 
-	err = gpio_direction_output(data->pdata->gpio_data, 1);
+	err = gpiod_direction_output(data->data, 1);
 	if (err)
 		return err;
 	ndelay(SHT15_TSU);
-	gpio_set_value(data->pdata->gpio_sck, 1);
+	gpiod_set_value(data->sck, 1);
 	ndelay(SHT15_TSCKH);
-	gpio_set_value(data->pdata->gpio_sck, 0);
+	gpiod_set_value(data->sck, 0);
 	ndelay(SHT15_TSCKL);
 	return 0;
 }
@@ -405,10 +406,10 @@ static u8 sht15_read_byte(struct sht15_data *data)
 
 	for (i = 0; i < 8; ++i) {
 		byte <<= 1;
-		gpio_set_value(data->pdata->gpio_sck, 1);
+		gpiod_set_value(data->sck, 1);
 		ndelay(SHT15_TSCKH);
-		byte |= !!gpio_get_value(data->pdata->gpio_data);
-		gpio_set_value(data->pdata->gpio_sck, 0);
+		byte |= !!gpiod_get_value(data->data);
+		gpiod_set_value(data->sck, 0);
 		ndelay(SHT15_TSCKL);
 	}
 	return byte;
@@ -428,7 +429,7 @@ static int sht15_send_status(struct sht15_data *data, u8 status)
 	err = sht15_send_cmd(data, SHT15_WRITE_STATUS);
 	if (err)
 		return err;
-	err = gpio_direction_output(data->pdata->gpio_data, 1);
+	err = gpiod_direction_output(data->data, 1);
 	if (err)
 		return err;
 	ndelay(SHT15_TSU);
@@ -528,14 +529,14 @@ static int sht15_measurement(struct sht15_data *data,
 	if (ret)
 		return ret;
 
-	ret = gpio_direction_input(data->pdata->gpio_data);
+	ret = gpiod_direction_input(data->data);
 	if (ret)
 		return ret;
 	atomic_set(&data->interrupt_handled, 0);
 
-	enable_irq(gpio_to_irq(data->pdata->gpio_data));
-	if (gpio_get_value(data->pdata->gpio_data) == 0) {
-		disable_irq_nosync(gpio_to_irq(data->pdata->gpio_data));
+	enable_irq(gpiod_to_irq(data->data));
+	if (gpiod_get_value(data->data) == 0) {
+		disable_irq_nosync(gpiod_to_irq(data->data));
 		/* Only relevant if the interrupt hasn't occurred. */
 		if (!atomic_read(&data->interrupt_handled))
 			schedule_work(&data->read_work);
@@ -547,7 +548,7 @@ static int sht15_measurement(struct sht15_data *data,
 		data->state = SHT15_READING_NOTHING;
 		return -EIO;
 	} else if (ret == 0) { /* timeout occurred */
-		disable_irq_nosync(gpio_to_irq(data->pdata->gpio_data));
+		disable_irq_nosync(gpiod_to_irq(data->data));
 		ret = sht15_connection_reset(data);
 		if (ret)
 			return ret;
@@ -826,15 +827,15 @@ static void sht15_bh_read_data(struct work_struct *work_s)
 			       read_work);
 
 	/* Firstly, verify the line is low */
-	if (gpio_get_value(data->pdata->gpio_data)) {
+	if (gpiod_get_value(data->data)) {
 		/*
 		 * If not, then start the interrupt again - care here as could
 		 * have gone low in meantime so verify it hasn't!
 		 */
 		atomic_set(&data->interrupt_handled, 0);
-		enable_irq(gpio_to_irq(data->pdata->gpio_data));
+		enable_irq(gpiod_to_irq(data->data));
 		/* If still not occurred or another handler was scheduled */
-		if (gpio_get_value(data->pdata->gpio_data)
+		if (gpiod_get_value(data->data)
 		    || atomic_read(&data->interrupt_handled))
 			return;
 	}
@@ -918,46 +919,6 @@ static const struct of_device_id sht15_dt_match[] = {
 	{ },
 };
 MODULE_DEVICE_TABLE(of, sht15_dt_match);
-
-/*
- * This function returns NULL if pdev isn't a device instatiated by dt,
- * a pointer to pdata if it could successfully get all information
- * from dt or a negative ERR_PTR() on error.
- */
-static struct sht15_platform_data *sht15_probe_dt(struct device *dev)
-{
-	struct device_node *np = dev->of_node;
-	struct sht15_platform_data *pdata;
-
-	/* no device tree device */
-	if (!np)
-		return NULL;
-
-	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata)
-		return ERR_PTR(-ENOMEM);
-
-	pdata->gpio_data = of_get_named_gpio(np, "data-gpios", 0);
-	if (pdata->gpio_data < 0) {
-		if (pdata->gpio_data != -EPROBE_DEFER)
-			dev_err(dev, "data-gpios not found\n");
-		return ERR_PTR(pdata->gpio_data);
-	}
-
-	pdata->gpio_sck = of_get_named_gpio(np, "clk-gpios", 0);
-	if (pdata->gpio_sck < 0) {
-		if (pdata->gpio_sck != -EPROBE_DEFER)
-			dev_err(dev, "clk-gpios not found\n");
-		return ERR_PTR(pdata->gpio_sck);
-	}
-
-	return pdata;
-}
-#else
-static inline struct sht15_platform_data *sht15_probe_dt(struct device *dev)
-{
-	return NULL;
-}
 #endif
 
 static int sht15_probe(struct platform_device *pdev)
@@ -977,25 +938,6 @@ static int sht15_probe(struct platform_device *pdev)
 	data->dev = &pdev->dev;
 	init_waitqueue_head(&data->wait_queue);
 
-	data->pdata = sht15_probe_dt(&pdev->dev);
-	if (IS_ERR(data->pdata))
-		return PTR_ERR(data->pdata);
-	if (data->pdata == NULL) {
-		data->pdata = dev_get_platdata(&pdev->dev);
-		if (data->pdata == NULL) {
-			dev_err(&pdev->dev, "no platform data supplied\n");
-			return -EINVAL;
-		}
-	}
-
-	data->supply_uv = data->pdata->supply_mv * 1000;
-	if (data->pdata->checksum)
-		data->checksumming = true;
-	if (data->pdata->no_otp_reload)
-		status |= SHT15_STATUS_NO_OTP_RELOAD;
-	if (data->pdata->low_resolution)
-		status |= SHT15_STATUS_LOW_RESOLUTION;
-
 	/*
 	 * If a regulator is available,
 	 * query what the supply voltage actually is!
@@ -1030,21 +972,18 @@ static int sht15_probe(struct platform_device *pdev)
 	}
 
 	/* Try requesting the GPIOs */
-	ret = devm_gpio_request_one(&pdev->dev, data->pdata->gpio_sck,
-			GPIOF_OUT_INIT_LOW, "SHT15 sck");
-	if (ret) {
+	data->sck = devm_gpiod_get(&pdev->dev, "clk", GPIOD_OUT_LOW);
+	if (IS_ERR(data->sck)) {
 		dev_err(&pdev->dev, "clock line GPIO request failed\n");
 		goto err_release_reg;
 	}
-
-	ret = devm_gpio_request(&pdev->dev, data->pdata->gpio_data,
-				"SHT15 data");
-	if (ret) {
+	data->data = devm_gpiod_get(&pdev->dev, "data", GPIOD_IN);
+	if (IS_ERR(data->data)) {
 		dev_err(&pdev->dev, "data line GPIO request failed\n");
 		goto err_release_reg;
 	}
 
-	ret = devm_request_irq(&pdev->dev, gpio_to_irq(data->pdata->gpio_data),
+	ret = devm_request_irq(&pdev->dev, gpiod_to_irq(data->data),
 			       sht15_interrupt_fired,
 			       IRQF_TRIGGER_FALLING,
 			       "sht15 data",
@@ -1053,7 +992,7 @@ static int sht15_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "failed to get irq for data line\n");
 		goto err_release_reg;
 	}
-	disable_irq_nosync(gpio_to_irq(data->pdata->gpio_data));
+	disable_irq_nosync(gpiod_to_irq(data->data));
 	ret = sht15_connection_reset(data);
 	if (ret)
 		goto err_release_reg;
diff --git a/include/linux/platform_data/sht15.h b/include/linux/platform_data/sht15.h
deleted file mode 100644
index 12289c1e9413..000000000000
--- a/include/linux/platform_data/sht15.h
+++ /dev/null
@@ -1,38 +0,0 @@
-/*
- * sht15.h - support for the SHT15 Temperature and Humidity Sensor
- *
- * Copyright (c) 2009 Jonathan Cameron
- *
- * Copyright (c) 2007 Wouter Horre
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * For further information, see the Documentation/hwmon/sht15 file.
- */
-
-#ifndef _PDATA_SHT15_H
-#define _PDATA_SHT15_H
-
-/**
- * struct sht15_platform_data - sht15 connectivity info
- * @gpio_data:		no. of gpio to which bidirectional data line is
- *			connected.
- * @gpio_sck:		no. of gpio to which the data clock is connected.
- * @supply_mv:		supply voltage in mv. Overridden by regulator if
- *			available.
- * @checksum:		flag to indicate the checksum should be validated.
- * @no_otp_reload:	flag to indicate no reload from OTP.
- * @low_resolution:	flag to indicate the temp/humidity resolution to use.
- */
-struct sht15_platform_data {
-	int gpio_data;
-	int gpio_sck;
-	int supply_mv;
-	bool checksum;
-	bool no_otp_reload;
-	bool low_resolution;
-};
-
-#endif /* _PDATA_SHT15_H */
-- 
2.13.5

