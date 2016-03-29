Return-path: <tthayer@opensource.altera.com>
From: <tthayer@opensource.altera.com>
To: <lee.jones@linaro.org>, <linus.walleij@linaro.org>, <gnurou@gmail.com>,
	<jdelvare@suse.com>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
	<pawell.moll@arm.com>, <mark.rutland@arm.com>,
	<ijc+devicetree@hellion.org.uk>, <dinguyen@opensource.altera.com>
CC: <linux-gpio@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Thor Thayer <tthayer@opensource.altera.com>
Subject: [RFC 4/8] gpio: altera-a10sr: Add A10 System Resource Chip GPIO support.
Date: Tue, 29 Mar 2016 14:13:07 -0500
Message-ID: <1459278791-3646-5-git-send-email-tthayer@opensource.altera.com>
In-Reply-To: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
References: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

From: Thor Thayer <tthayer@opensource.altera.com>

Add the GPIO functionality for the Altera Arria10 MAX5 System Resource
Chip. The A10 MAX5 has 12 bits of GPIO assigned to switches, buttons,
and LEDs as a GPIO extender on the SPI bus.

Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
---
 drivers/gpio/Kconfig             |    8 ++
 drivers/gpio/Makefile            |    1 +
 drivers/gpio/gpio-altera-a10sr.c |  158 ++++++++++++++++++++++++++++++++++++++
 drivers/mfd/altera-a10sr.c       |    4 +
 include/linux/mfd/altera-a10sr.h |   22 ++++++
 5 files changed, 193 insertions(+)
 create mode 100644 drivers/gpio/gpio-altera-a10sr.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 5f3429f..7ea2d8f 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -767,6 +767,14 @@ config GPIO_ADP5520
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
index 1e0b74f..cc29464 100644
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
index 0000000..be5308b
--- /dev/null
+++ b/drivers/gpio/gpio-altera-a10sr.c
@@ -0,0 +1,158 @@
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
+ * Adapted from gpio-da9052.c
+ * Copyright(c) 2011 Dialog Semiconductor Ltd.
+ * Author: David Dajun Chen <dchen@diasemi.com>
+ */
+
+#include <linux/fs.h>
+#include <linux/gpio.h>
+#include <linux/mfd/altera-a10sr.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/seq_file.h>
+#include <linux/syscalls.h>
+#include <linux/uaccess.h>
+
+struct altr_a10sr_gpio {
+	struct altr_a10sr *a10sc;
+	struct gpio_chip gp;
+};
+
+static inline struct altr_a10sr_gpio *to_altr_a10sr_gpio(struct gpio_chip *chip)
+{
+	return container_of(chip, struct altr_a10sr_gpio, gp);
+}
+
+static int altr_a10sr_gpio_get(struct gpio_chip *gc, unsigned int nr)
+{
+	struct altr_a10sr_gpio *gpio = to_altr_a10sr_gpio(gc);
+	int ret;
+	unsigned char reg = ALTR_A10SR_LED_RD_REG + ALTR_A10SR_REG_OFFSET(nr);
+
+	ret = altr_a10sr_reg_read(gpio->a10sc, reg);
+
+	if (ret < 0)
+		return ret;
+
+	if (ret & (1 << ALTR_A10SR_REG_BIT(nr)))
+		return 1;
+
+	return 0;
+}
+
+static void altr_a10sr_gpio_set(struct gpio_chip *gc, unsigned int nr,
+				int value)
+{
+	struct altr_a10sr_gpio *gpio = to_altr_a10sr_gpio(gc);
+	int ret;
+	unsigned char reg = ALTR_A10SR_LED_WR_REG + ALTR_A10SR_REG_OFFSET(nr);
+
+	ret = altr_a10sr_reg_update(gpio->a10sc, reg,
+				    ALTR_A10SR_REG_BIT_MASK(nr),
+				    ALTR_A10SR_REG_BIT_CHG(value, nr));
+	if (ret != 0)
+		dev_err(gpio->a10sc->dev,
+			"Failed to update gpio reg : %d", ret);
+}
+
+static int altr_a10sr_gpio_direction_input(struct gpio_chip *gc,
+					   unsigned int nr)
+{
+	if ((nr >= ALTR_A10SR_IN_VALID_RANGE_LO) &&
+	    (nr <= ALTR_A10SR_IN_VALID_RANGE_HI))
+		return 0;
+	return -EINVAL;
+}
+
+static int altr_a10sr_gpio_direction_output(struct gpio_chip *gc,
+					    unsigned int nr, int value)
+{
+	if ((nr >= ALTR_A10SR_OUT_VALID_RANGE_LO) &&
+	    (nr <= ALTR_A10SR_OUT_VALID_RANGE_HI))
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
+	.ngpio = 16,
+	.base = -1,
+};
+
+static int altr_a10sr_gpio_probe(struct platform_device *pdev)
+{
+	struct altr_a10sr_gpio *gpio;
+	int ret;
+
+	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
+	if (!gpio)
+		return -ENOMEM;
+
+	gpio->a10sc = dev_get_drvdata(pdev->dev.parent);
+
+	gpio->gp = altr_a10sr_gc;
+
+	gpio->gp.of_node = pdev->dev.of_node;
+
+	ret = gpiochip_add(&gpio->gp);
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
+		.of_match_table = altr_a10sr_gpio_of_match,
+	},
+};
+
+module_platform_driver(altr_a10sr_gpio_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Thor Thayer");
+MODULE_DESCRIPTION("Altera Arria10 System Resource Chip GPIO");
diff --git a/drivers/mfd/altera-a10sr.c b/drivers/mfd/altera-a10sr.c
index 13665d4..517b895 100644
--- a/drivers/mfd/altera-a10sr.c
+++ b/drivers/mfd/altera-a10sr.c
@@ -30,6 +30,10 @@
 #include <linux/spi/spi.h>
 
 static const struct mfd_cell altr_a10sr_subdev_info[] = {
+	{
+		.name = "altr_a10sr_gpio",
+		.of_compatible = "altr,a10sr-gpio",
+	},
 };
 
 static bool altr_a10sr_reg_readable(struct device *dev, unsigned int reg)
diff --git a/include/linux/mfd/altera-a10sr.h b/include/linux/mfd/altera-a10sr.h
index 7087afc..6d254a1 100644
--- a/include/linux/mfd/altera-a10sr.h
+++ b/include/linux/mfd/altera-a10sr.h
@@ -50,9 +50,31 @@
 #define ALTR_A10SR_VERSION_READ       0x01    /* MAX5 Version Read */
 #define ALTR_A10SR_LED_WR_REG         0x02    /* LED - Upper 4 bits */
 #define ALTR_A10SR_LED_RD_REG         0x03    /* LED - Upper 4 bits */
+/* LED register Bit Definitions */
+#define ALTR_A10SR_LED_MASK               0xF0    /* LED - Mask Upper 4 bits */
+#define ALTR_A10SR_LED_VALID_SHIFT        4       /* LED - Upper 4 bits valid */
+#define ALTR_A10SR_LED_VALID_NUM          4       /* LED - # valid LEDs */
+#define ALTR_A10SR_OUT_VALID_RANGE_LO     ALTR_A10SR_LED_VALID_SHIFT
+#define ALTR_A10SR_OUT_VALID_RANGE_HI     7
+
 #define ALTR_A10SR_PBDSW_RD_REG       0x05    /* PB & DIP SW - Input only */
 #define ALTR_A10SR_PBDSW_IRQ_CLR_REG  0x06    /* PB & DIP SW Flag Clear */
 #define ALTR_A10SR_PBDSW_IRQ_RD_REG   0x07    /* PB & DIP SW Flag Read */
+/* Pushbutton & DIP Switch Bit Definitions */
+#define ALTR_A10SR_PB_DWS_PB_MASK         0xF0    /* PB - Upper 4 bits */
+#define ALTR_A10SR_PB_DWS_DWS_MASK        0x0F    /* DWS - Lower 4 bits */
+#define ALTR_A10SR_PB_VALID_NUM           4       /* # valid PB */
+#define ALTR_A10SR_IRQ_PB_3_SHIFT         7       /* Pushbutton 4 */
+#define ALTR_A10SR_IRQ_PB_2_SHIFT         6       /* Pushbutton 3 */
+#define ALTR_A10SR_IRQ_PB_1_SHIFT         5       /* Pushbutton 2 */
+#define ALTR_A10SR_IRQ_PB_0_SHIFT         4       /* Pushbutton 1 */
+#define ALTR_A10SR_IRQ_DSW_3_SHIFT        3       /* DIP SW 3 */
+#define ALTR_A10SR_IRQ_DSW_2_SHIFT        2       /* DIP SW 2 */
+#define ALTR_A10SR_IRQ_DSW_1_SHIFT        1       /* DIP SW 1 */
+#define ALTR_A10SR_IRQ_DSW_O_SHIFT        0       /* DIP SW 0 */
+#define ALTR_A10SR_IN_VALID_RANGE_LO      8
+#define ALTR_A10SR_IN_VALID_RANGE_HI      15
+
 #define ALTR_A10SR_PWR_GOOD1_RD_REG   0x09    /* Power Good1 Read */
 #define ALTR_A10SR_PWR_GOOD2_RD_REG   0x0B    /* Power Good2 Read */
 #define ALTR_A10SR_PWR_GOOD3_RD_REG   0x0D    /* Power Good3 Read */
-- 
1.7.9.5
