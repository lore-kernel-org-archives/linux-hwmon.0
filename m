Return-path: <tthayer@opensource.altera.com>
From: <tthayer@opensource.altera.com>
To: <lee.jones@linaro.org>, <linus.walleij@linaro.org>, <gnurou@gmail.com>,
	<jdelvare@suse.com>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
	<pawel.moll@arm.com>, <mark.rutland@arm.com>,
	<ijc+devicetree@hellion.org.uk>, <dinguyen@opensource.altera.com>
CC: <linux-gpio@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Thor Thayer <tthayer@opensource.altera.com>
Subject: [PATCH 04/11] gpio: altera-a10sr: Add A10 System Resource Chip GPIO support.
Date: Fri, 22 Apr 2016 10:33:32 -0500
Message-ID: <1461339219-15255-5-git-send-email-tthayer@opensource.altera.com>
In-Reply-To: <1461339219-15255-1-git-send-email-tthayer@opensource.altera.com>
References: <1461339219-15255-1-git-send-email-tthayer@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

From: Thor Thayer <tthayer@opensource.altera.com>

Add the GPIO functionality for the Altera Arria10 MAX5 System Resource
Chip. The A10 MAX5 has 12 bits of GPIO assigned to switches, buttons,
and LEDs as a GPIO extender on the SPI bus.

Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
---
 drivers/gpio/Kconfig             |    8 +++
 drivers/gpio/Makefile            |    1 +
 drivers/gpio/gpio-altera-a10sr.c |  140 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 149 insertions(+)
 create mode 100644 drivers/gpio/gpio-altera-a10sr.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 37f0378..66c8789 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -775,6 +775,14 @@ config GPIO_ADP5520
 	  This option enables support for on-chip GPIO found
 	  on Analog Devices ADP5520 PMICs.
 
+config GPIO_ALTERA_A10SR
+	tristate "Altera Arria10 System Resource GPIO"
+	depends on MFD_ALTERA_A10SR
+	help
+	  Driver for Arria10 Development Kit GPIO expansion which
+	  includes reads of pushbuttons and DIP switches as well
+	  as writes to LEDs.
+
 config GPIO_ARIZONA
 	tristate "Wolfson Microelectronics Arizona class devices"
 	depends on MFD_ARIZONA
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 40ab913..410e981 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_GPIO_ADNP)		+= gpio-adnp.o
 obj-$(CONFIG_GPIO_ADP5520)	+= gpio-adp5520.o
 obj-$(CONFIG_GPIO_ADP5588)	+= gpio-adp5588.o
 obj-$(CONFIG_GPIO_ALTERA)  	+= gpio-altera.o
+obj-$(CONFIG_GPIO_ALTERA_A10SR)	+= gpio-altera-a10sr.o
 obj-$(CONFIG_GPIO_AMD8111)	+= gpio-amd8111.o
 obj-$(CONFIG_GPIO_AMDPT)	+= gpio-amdpt.o
 obj-$(CONFIG_GPIO_ARIZONA)	+= gpio-arizona.o
diff --git a/drivers/gpio/gpio-altera-a10sr.c b/drivers/gpio/gpio-altera-a10sr.c
new file mode 100644
index 0000000..a65fbe6
--- /dev/null
+++ b/drivers/gpio/gpio-altera-a10sr.c
@@ -0,0 +1,140 @@
+/*
+ *  Copyright Altera Corporation (C) 2014-2016. All Rights Reserved
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ *
+ * GPIO driver for  Altera Arria10 MAX5 System Resource Chip
+ *
+ * Adapted from gpio-tps65910.c
+ */
+
+#include <linux/gpio/driver.h>
+#include <linux/mfd/altera-a10sr.h>
+#include <linux/module.h>
+
+/**
+ * struct altr_a10sr_gpio - Altera Max5 GPIO device private data structure
+ * @gp:   : instance of the gpio_chip
+ * @regmap: the regmap from the parent device.
+ */
+struct altr_a10sr_gpio {
+	struct gpio_chip gp;
+	struct regmap *regmap;
+};
+
+static int altr_a10sr_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct altr_a10sr_gpio *gpio = gpiochip_get_data(chip);
+	int ret, val;
+
+	ret = regmap_read(gpio->regmap, ALTR_A10SR_PBDSW_REG, &val);
+	if (ret < 0)
+		return ret;
+
+	return !!(val & BIT(offset - ALTR_A10SR_LED_VALID_SHIFT));
+}
+
+static void altr_a10sr_gpio_set(struct gpio_chip *chip, unsigned int offset,
+				int value)
+{
+	struct altr_a10sr_gpio *gpio = gpiochip_get_data(chip);
+
+	regmap_update_bits(gpio->regmap, ALTR_A10SR_LED_REG,
+			   BIT(ALTR_A10SR_LED_VALID_SHIFT + offset),
+			   value ? BIT(ALTR_A10SR_LED_VALID_SHIFT + offset)
+			   : 0);
+}
+
+static int altr_a10sr_gpio_direction_input(struct gpio_chip *gc,
+					   unsigned int nr)
+{
+	if (nr >= (ALTR_A10SR_IN_VALID_RANGE_LO - ALTR_A10SR_LED_VALID_SHIFT))
+		return 0;
+	return -EINVAL;
+}
+
+static int altr_a10sr_gpio_direction_output(struct gpio_chip *gc,
+					    unsigned int nr, int value)
+{
+	if (nr <= (ALTR_A10SR_OUT_VALID_RANGE_HI - ALTR_A10SR_LED_VALID_SHIFT))
+		return 0;
+	return -EINVAL;
+}
+
+static struct gpio_chip altr_a10sr_gc = {
+	.label = "altr_a10sr_gpio",
+	.owner = THIS_MODULE,
+	.get = altr_a10sr_gpio_get,
+	.set = altr_a10sr_gpio_set,
+	.direction_input = altr_a10sr_gpio_direction_input,
+	.direction_output = altr_a10sr_gpio_direction_output,
+	.can_sleep = true,
+	.ngpio = 12,
+	.base = -1,
+};
+
+static int altr_a10sr_gpio_probe(struct platform_device *pdev)
+{
+	struct altr_a10sr_gpio *gpio;
+	int ret;
+	struct altr_a10sr *a10sr = dev_get_drvdata(pdev->dev.parent);
+
+	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
+	if (!gpio)
+		return -ENOMEM;
+
+	gpio->regmap = a10sr->regmap;
+
+	gpio->gp = altr_a10sr_gc;
+
+	gpio->gp.of_node = pdev->dev.of_node;
+
+	ret = devm_gpiochip_add_data(&pdev->dev, &gpio->gp, gpio);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, gpio);
+
+	return 0;
+}
+
+static int altr_a10sr_gpio_remove(struct platform_device *pdev)
+{
+	struct altr_a10sr_gpio *gpio = platform_get_drvdata(pdev);
+
+	gpiochip_remove(&gpio->gp);
+
+	return 0;
+}
+
+static const struct of_device_id altr_a10sr_gpio_of_match[] = {
+	{ .compatible = "altr,a10sr-gpio" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, altr_a10sr_gpio_of_match);
+
+static struct platform_driver altr_a10sr_gpio_driver = {
+	.probe = altr_a10sr_gpio_probe,
+	.remove = altr_a10sr_gpio_remove,
+	.driver = {
+		.name	= "altr_a10sr_gpio",
+		.of_match_table = of_match_ptr(altr_a10sr_gpio_of_match),
+	},
+};
+module_platform_driver(altr_a10sr_gpio_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Thor Thayer <tthayer@opensource.altera.com>");
+MODULE_DESCRIPTION("Altera Arria10 System Resource Chip GPIO");
-- 
1.7.9.5
