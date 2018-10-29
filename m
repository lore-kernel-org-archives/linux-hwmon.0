Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:55667 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbeJ2XY1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 29 Oct 2018 19:24:27 -0400
From: Marco Felsch <m.felsch@pengutronix.de>
To: jdelvare@suse.com, linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, tpiepho@impinj.com,
        dmitry.torokhov@gmail.com, kernel@pengutronix.de
Subject: [PATCH v2 2/2] hwmon: add generic GPIO brownout support
Date: Mon, 29 Oct 2018 15:35:21 +0100
Message-Id: <20181029143521.22122-3-m.felsch@pengutronix.de>
In-Reply-To: <20181029143521.22122-1-m.felsch@pengutronix.de>
References: <20181029143521.22122-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Most the time low voltage detection happens on a external device
e.g. a pmic or any other hw-logic. Some of such devices can pass the
power state (good/bad) to the host via i2c or by toggling a gpio.

This patch adds the support to evaluate a gpio line to determine
the power good/bad state. The state is represented by the
in0_lcrit_alarm. Furthermore the driver supports to release device from
their driver upon a low voltage detection. This feature is supported by
OF-based firmware only.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 Documentation/hwmon/gpio-brownout |  14 +++
 drivers/hwmon/Kconfig             |  23 ++++
 drivers/hwmon/Makefile            |   1 +
 drivers/hwmon/gpio-brownout.c     | 195 ++++++++++++++++++++++++++++++
 4 files changed, 233 insertions(+)
 create mode 100644 Documentation/hwmon/gpio-brownout
 create mode 100644 drivers/hwmon/gpio-brownout.c

diff --git a/Documentation/hwmon/gpio-brownout b/Documentation/hwmon/gpio-brownout
new file mode 100644
index 000000000000..61d6a781af47
--- /dev/null
+++ b/Documentation/hwmon/gpio-brownout
@@ -0,0 +1,14 @@
+Kernel driver gpio-brownout
+===========================
+
+Author: Marco Felsch <kernel@pengutronix.de>
+
+Description
+-----------
+
+This driver checks a GPIO line to detect a undervoltage condition.
+
+Sysfs entries
+-------------
+
+in0_lcrit_alarm		Undervoltage alarm
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 81da17a42dc9..a2712452ba8b 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -558,6 +558,29 @@ config SENSORS_G762
 	  This driver can also be built as a module.  If so, the module
 	  will be called g762.
 
+config SENSORS_GPIO_BROWNOUT
+	tristate "Generic GPIO Brownout detection support"
+	depends on GPIOLIB
+	help
+	  If you say yes here you get support for GPIO based brownout detection.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called gpio-brownout.
+
+if SENSORS_GPIO_BROWNOUT
+
+config SENSORS_GPIO_BROWNOUT_UNBIND
+	bool "OF I2C/SPI device unbinding support"
+	depends on OF && I2C && SPI
+	help
+	  Enable support to unbind devices upon a brownout detection.
+
+	  If unsure, say N.
+
+endif
+
 config SENSORS_GPIO_FAN
 	tristate "GPIO fan"
 	depends on OF_GPIO
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 93f7f41ea4ad..6b217b39e0e0 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -71,6 +71,7 @@ obj-$(CONFIG_SENSORS_G760A)	+= g760a.o
 obj-$(CONFIG_SENSORS_G762)	+= g762.o
 obj-$(CONFIG_SENSORS_GL518SM)	+= gl518sm.o
 obj-$(CONFIG_SENSORS_GL520SM)	+= gl520sm.o
+obj-$(CONFIG_SENSORS_GPIO_BROWNOUT) += gpio-brownout.o
 obj-$(CONFIG_SENSORS_GPIO_FAN)	+= gpio-fan.o
 obj-$(CONFIG_SENSORS_HIH6130)	+= hih6130.o
 obj-$(CONFIG_SENSORS_ULTRA45)	+= ultra45_env.o
diff --git a/drivers/hwmon/gpio-brownout.c b/drivers/hwmon/gpio-brownout.c
new file mode 100644
index 000000000000..00d6ff8b1490
--- /dev/null
+++ b/drivers/hwmon/gpio-brownout.c
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * gpio-brownout.c - gpio based low voltage detection
+ *
+ * Copyright (C) 2018 Pengutronix, Marco Felsch <kernel@pengutronix.de>
+ */
+
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/spi/spi.h>
+#include <linux/stat.h>
+
+#define GPIO_BROWNOUT_MOD_NAME "gpio-brownout"
+
+struct gpio_brownout_device {
+	struct list_head  list;
+	struct device *dev;
+};
+
+struct gpio_brownout {
+	struct device *hwmon_dev;
+	struct gpio_desc *gpio;
+	struct list_head devices;
+};
+
+static irqreturn_t gpio_brownout_isr(int irq, void *dev_id)
+{
+	struct gpio_brownout *gb = dev_id;
+	struct gpio_brownout_device *bout_dev, *tmp;
+
+	list_for_each_entry_safe(bout_dev, tmp, &gb->devices, list) {
+		device_release_driver(bout_dev->dev);
+		list_del(&bout_dev->list);
+	}
+
+	sysfs_notify(&gb->hwmon_dev->kobj, NULL, "in0_lcrit_alarm");
+
+	return IRQ_HANDLED;
+}
+
+static int gpio_brownout_probe_fw(struct gpio_brownout *gb)
+{
+	struct device *pdev = gb->hwmon_dev->parent;
+
+	gb->gpio = devm_gpiod_get(pdev, "gpio-brownout,sense", GPIOD_IN);
+	if (IS_ERR(gb->gpio))
+		return PTR_ERR(gb->gpio);
+
+	/*
+	 * Register all devices which should be unbinded upon a brownout
+	 * detection. At the moment only i2c and spi devices are supported
+	 */
+
+	if (IS_ENABLED(SENSORS_GPIO_BROWNOUT_UNBIND)) {
+		struct device_node *np = gb->hwmon_dev->of_node;
+		struct of_phandle_iterator it;
+		struct gpio_brownout_device *elem;
+		struct i2c_client *i2c_c;
+		struct spi_device *spi_c;
+		int ret;
+
+		of_for_each_phandle(&it, ret, np,
+				    "gpio-brownout,dev-list", NULL, 0) {
+			i2c_c = of_find_i2c_device_by_node(it.node);
+			spi_c = of_find_spi_device_by_node(it.node);
+
+			if (!i2c_c && !spi_c)
+				return -EPROBE_DEFER;
+			else if (i2c_c && spi_c)
+				return -EINVAL;
+
+			elem = devm_kzalloc(pdev, sizeof(*elem), GFP_KERNEL);
+			if (!elem)
+				return -ENOMEM;
+
+			elem->dev = i2c_c ? &i2c_c->dev : &spi_c->dev;
+
+			INIT_LIST_HEAD(&elem->list);
+			list_add_tail(&elem->list, &gb->devices);
+		}
+	}
+
+	return 0;
+}
+
+const u32 gpio_brownout_in_config[] = {
+	HWMON_I_LCRIT_ALARM,
+	0
+};
+
+const struct hwmon_channel_info gpio_brownout_in = {
+	.type = hwmon_in,
+	.config = gpio_brownout_in_config,
+};
+
+const struct hwmon_channel_info *gpio_brownout_ch_info[] = {
+	&gpio_brownout_in,
+	NULL
+};
+
+static int gpio_brownout_read(struct device *dev, enum hwmon_sensor_types type,
+			      u32 attr, int channel, long *val)
+{
+	struct gpio_brownout *gb = dev_get_drvdata(dev);
+
+	*val = gpiod_get_value(gb->gpio);
+	return 0;
+}
+
+static umode_t gpio_brownout_is_visible(const void *drvdata,
+					enum hwmon_sensor_types type, u32 attr,
+					int channel)
+{
+	return 0444;
+}
+
+const struct hwmon_ops gpio_brownout_ops = {
+	.is_visible = gpio_brownout_is_visible,
+	.read = gpio_brownout_read,
+
+};
+
+const struct hwmon_chip_info gpio_brownout_info = {
+	.ops = &gpio_brownout_ops,
+	.info = gpio_brownout_ch_info,
+};
+
+static int gpio_brownout_probe(struct platform_device *pdev)
+{
+	struct gpio_brownout *gb;
+	struct device *hwmon;
+	unsigned long irq_flags;
+	int ret;
+
+	gb = devm_kzalloc(&pdev->dev, sizeof(*gb), GFP_KERNEL);
+	if (!gb)
+		return -ENOMEM;
+
+	hwmon = devm_hwmon_device_register_with_info(&pdev->dev, pdev->name, gb,
+						     &gpio_brownout_info, NULL);
+	if (IS_ERR(hwmon))
+		return PTR_ERR(hwmon);
+
+	gb->hwmon_dev = hwmon;
+
+	INIT_LIST_HEAD(&gb->devices);
+
+	ret = gpio_brownout_probe_fw(gb);
+	if (ret)
+		return ret;
+
+	irq_flags = IRQF_ONESHOT;
+	if (gpiod_is_active_low(gb->gpio))
+		irq_flags |= IRQF_TRIGGER_FALLING;
+	else
+		irq_flags |= IRQF_TRIGGER_RISING;
+	ret = devm_request_threaded_irq(&pdev->dev, gpiod_to_irq(gb->gpio),
+					NULL, gpio_brownout_isr, irq_flags,
+					GPIO_BROWNOUT_MOD_NAME, gb);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "IRQ request failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id __maybe_unused gpio_brownout_of_match[] = {
+	{ .compatible = GPIO_BROWNOUT_MOD_NAME, },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, arm_gpio_brownout_of_match);
+
+static struct platform_driver gpio_brownout_driver = {
+	.driver = {
+		.name = GPIO_BROWNOUT_MOD_NAME,
+		.of_match_table = of_match_ptr(gpio_brownout_of_match)
+	},
+	.probe = gpio_brownout_probe,
+};
+
+module_platform_driver(gpio_brownout_driver);
+
+MODULE_AUTHOR("Marco Felsch <kernel@pengutronix.de>");
+MODULE_DESCRIPTION("GPIO Brownout Detection");
+MODULE_LICENSE("GPL v2");
-- 
2.19.1
