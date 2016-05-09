From: Thor Thayer <tthayer@opensource.altera.com>
To: linux-hwmon@vger.kernel.org
Date: Mon, 09 May 2016 09:44:28 -0700
Subject: Re: [PATCH 03/11] mfd: altr_a10sr: Add Altera Arria10 DevKit System Resource Chip
In-Reply-To: <1461339219-15255-1-git-send-email-tthayer@opensource.altera.com>
Message-ID: <5730BF59.4070905@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>




On 05/09/2016 11:02 AM, Lee Jones wrote:

On Fri, 22 Apr 2016, ttha...@opensource.altera.com wrote:


From: Thor Thayer <ttha...@opensource.altera.com>
To: linux-hwmon@vger.kernel.org

Add support for the Altera Arria10 Development Kit System Resource
chip which is implemented using a MAX5 as a external gpio extender,
and power supply alarm (hwmon) with the regmap framework over a SPI bus.

Signed-off-by: Thor Thayer <ttha...@opensource.altera.com>
---
  drivers/mfd/Kconfig              |   11 +++
  drivers/mfd/Makefile             |    2 +
  drivers/mfd/altera-a10sr.c       |  179 ++++++++++++++++++++++++++++++++++++++
  include/linux/mfd/altera-a10sr.h |   87 ++++++++++++++++++
  4 files changed, 279 insertions(+)
  create mode 100644 drivers/mfd/altera-a10sr.c
  create mode 100644 include/linux/mfd/altera-a10sr.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index eea61e3..4fc27c6 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -18,6 +18,17 @@ config MFD_CS5535
          This is the core driver for CS5535/CS5536 MFD functions.  This is
            necessary for using the board's GPIO and MFGPT functionality.

+config MFD_ALTERA_A10SR
+       bool "Altera Arria10 DevKit System Resource chip"
+       depends on ARCH_SOCFPGA && SPI_MASTER=y && OF
+       select REGMAP_SPI
+       select MFD_CORE
+       help
+         Support for the Altera Arria10 DevKit MAX5 System Resource chip
+         using the SPI interface. This driver provides common support for
+         accessing the external gpio extender (LEDs & buttons) and
+         power supply alarms (hwmon).
+
  config MFD_ACT8945A
        tristate "Active-semi ACT8945A"
        select MFD_CORE
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 5eaa6465d..4f1ff91 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -203,3 +203,5 @@ intel-soc-pmic-objs         := intel_soc_pmic_core.o 
intel_soc_pmic_crc.o
  intel-soc-pmic-$(CONFIG_INTEL_PMC_IPC)        += intel_soc_pmic_bxtwc.o
  obj-$(CONFIG_INTEL_SOC_PMIC)  += intel-soc-pmic.o
  obj-$(CONFIG_MFD_MT6397)      += mt6397-core.o
+
+obj-$(CONFIG_MFD_ALTERA_A10SR) += altera-a10sr.o
diff --git a/drivers/mfd/altera-a10sr.c b/drivers/mfd/altera-a10sr.c
new file mode 100644
index 0000000..2ff08e3
--- /dev/null
+++ b/drivers/mfd/altera-a10sr.c
@@ -0,0 +1,179 @@
+/*
+ * Copyright Altera Corporation (C) 2014-2016. All Rights Reserved
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
+ * SPI access for Altera Arria10 MAX5 System Resource Chip
+ *
+ * Adapted from DA9052
+ * Copyright(c) 2011 Dialog Semiconductor Ltd.
+ * Author: David Dajun Chen <dc...@diasemi.com>


You don't need to carry the copyright or authorship tags over.


OK. Thanks,


+ */
+
+#include <linux/mfd/altera-a10sr.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/spi/spi.h>
+
+static const struct mfd_cell altr_a10sr_subdev_info[] = {
+       {
+               .name = "altr_a10sr_gpio",
+               .of_compatible = "altr,a10sr-gpio",
+       },
+};
+
+static bool altr_a10sr_reg_readable(struct device *dev, unsigned int reg)
+{
+       switch (reg) {
+       case ALTR_A10SR_VERSION_READ:
+       case ALTR_A10SR_LED_REG:
+       case ALTR_A10SR_PBDSW_REG:
+       case ALTR_A10SR_PBDSW_IRQ_REG:
+       case ALTR_A10SR_PWR_GOOD1_REG:
+       case ALTR_A10SR_PWR_GOOD2_REG:
+       case ALTR_A10SR_PWR_GOOD3_REG:
+       case ALTR_A10SR_FMCAB_REG:
+       case ALTR_A10SR_HPS_RST_REG:
+       case ALTR_A10SR_USB_QSPI_REG:
+       case ALTR_A10SR_SFPA_REG:
+       case ALTR_A10SR_SFPB_REG:
+       case ALTR_A10SR_I2C_M_REG:
+       case ALTR_A10SR_WARM_RST_REG:
+       case ALTR_A10SR_WR_KEY_REG:
+       case ALTR_A10SR_PMBUS_REG:
+               return true;
+       default:
+               return false;
+       }
+}
+
+static bool altr_a10sr_reg_writeable(struct device *dev, unsigned int reg)
+{
+       switch (reg) {
+       case ALTR_A10SR_LED_REG:
+       case ALTR_A10SR_PBDSW_IRQ_REG:
+       case ALTR_A10SR_FMCAB_REG:
+       case ALTR_A10SR_HPS_RST_REG:
+       case ALTR_A10SR_USB_QSPI_REG:
+       case ALTR_A10SR_SFPA_REG:
+       case ALTR_A10SR_SFPB_REG:
+       case ALTR_A10SR_WARM_RST_REG:
+       case ALTR_A10SR_WR_KEY_REG:
+       case ALTR_A10SR_PMBUS_REG:
+               return true;
+       default:
+               return false;
+       }
+}
+
+static bool altr_a10sr_reg_volatile(struct device *dev, unsigned int reg)
+{
+       switch (reg) {
+       case ALTR_A10SR_PBDSW_REG:
+       case ALTR_A10SR_PBDSW_IRQ_REG:
+       case ALTR_A10SR_PWR_GOOD1_REG:
+       case ALTR_A10SR_PWR_GOOD2_REG:
+       case ALTR_A10SR_PWR_GOOD3_REG:
+       case ALTR_A10SR_HPS_RST_REG:
+       case ALTR_A10SR_I2C_M_REG:
+       case ALTR_A10SR_WARM_RST_REG:
+       case ALTR_A10SR_WR_KEY_REG:
+       case ALTR_A10SR_PMBUS_REG:
+               return true;
+       default:
+               return false;
+       }
+}
+
+const struct regmap_config altr_a10sr_regmap_config = {
+       .reg_bits = 8,
+       .val_bits = 8,
+
+       .cache_type = REGCACHE_NONE,
+
+       .use_single_rw = true,
+       .read_flag_mask = 1,
+       .write_flag_mask = 0,
+
+       .max_register = ALTR_A10SR_WR_KEY_REG,
+       .readable_reg = altr_a10sr_reg_readable,
+       .writeable_reg = altr_a10sr_reg_writeable,
+       .volatile_reg = altr_a10sr_reg_volatile,
+
+};
+
+static int altr_a10sr_spi_probe(struct spi_device *spi)
+{
+       int ret;
+       struct altr_a10sr *a10sr;
+
+       a10sr = devm_kzalloc(&spi->dev, sizeof(*a10sr),
+                            GFP_KERNEL);
+       if (!a10sr)
+               return -ENOMEM;
+
+       spi->mode = SPI_MODE_3;
+       spi->bits_per_word = 8;
+       spi_setup(spi);
+
+       a10sr->dev = &spi->dev;
+
+       spi_set_drvdata(spi, a10sr);
+
+       a10sr->regmap = devm_regmap_init_spi(spi, &altr_a10sr_regmap_config);
+       if (IS_ERR(a10sr->regmap)) {
+               ret = PTR_ERR(a10sr->regmap);
+               dev_err(&spi->dev, "Failed to allocate register map: %d\n",
+                       ret);
+               return ret;
+       }


Is this regmap used it more than one driver?

Yes, Currently, both the subdevices (GPIO & HWMON) use this regmap to 
communicate to the SPI registers.



+       ret = mfd_add_devices(a10sr->dev, PLATFORM_DEVID_AUTO,
+                             altr_a10sr_subdev_info,
+                             ARRAY_SIZE(altr_a10sr_subdev_info),
+                             NULL, 0, NULL);
+       if (ret)
+               dev_err(a10sr->dev, "Failed to register sub-devices: %d\n",
+                       ret);
+
+       return ret;
+}
+
+static int altr_a10sr_spi_remove(struct spi_device *spi)
+{
+       mfd_remove_devices(&spi->dev);
+
+       return 0;
+}


Use devm_mfd_add_devices() and remove this function.


OK.


+static const struct of_device_id altr_a10sr_spi_of_match[] = {
+       { .compatible = "altr,a10sr" },
+       { },
+};
+MODULE_DEVICE_TABLE(of, altr_a10sr_spi_of_match);
+
+static struct spi_driver altr_a10sr_spi_driver = {
+       .probe = altr_a10sr_spi_probe,
+       .remove = altr_a10sr_spi_remove,


Remove .remove.


+       .driver = {
+               .name = "altr_a10sr",
+               .of_match_table = of_match_ptr(altr_a10sr_spi_of_match),
+       },
+};
+
+module_spi_driver(altr_a10sr_spi_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Thor Thayer <ttha...@opensource.altera.com>");
+MODULE_DESCRIPTION("Altera Arria10 DevKit System Resource MFD Driver");
diff --git a/include/linux/mfd/altera-a10sr.h b/include/linux/mfd/altera-a10sr.h
new file mode 100644
index 0000000..c869fe7
--- /dev/null
+++ b/include/linux/mfd/altera-a10sr.h
@@ -0,0 +1,87 @@
+/*
+ * Copyright Altera Corporation (C) 2014-2016. All Rights Reserved
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
+ * Declarations for Altera Arria10 MAX5 System Resource Chip
+ *
+ * Adapted from DA9052
+ * Copyright(c) 2011 Dialog Semiconductor Ltd.
+ * Author: David Dajun Chen <dc...@diasemi.com>


Remove these two lines.


Will do. Thanks for reviewing!


+ */
+
+#ifndef __MFD_ALTERA_A10SR_H
+#define __MFD_ALTERA_A10SR_H
+
+#include <linux/completion.h>
+#include <linux/list.h>
+#include <linux/mfd/core.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+/* Write registers are always on even addresses */
+#define  WRITE_REG_MASK              0xFE
+/* Odd registers are always on odd addresses */
+#define  READ_REG_MASK               0x01
+
+#define ALTR_A10SR_BITS_PER_REGISTER  8
+/*
+ * To find the correct register, we divide the input GPIO by
+ * the number of GPIO in each register. We then need to multiply
+ * by 2 because the reads are at odd addresses.
+ */
+#define ALTR_A10SR_REG_OFFSET(X)     (((X) / ALTR_A10SR_BITS_PER_REGISTER) << 
1)
+#define ALTR_A10SR_REG_BIT(X)        ((X) % ALTR_A10SR_BITS_PER_REGISTER)
+#define ALTR_A10SR_REG_BIT_CHG(X, Y) ((X) << ALTR_A10SR_REG_BIT(Y))
+#define ALTR_A10SR_REG_BIT_MASK(X)   (1 << ALTR_A10SR_REG_BIT(X))
+
+/* Arria10 System Controller Register Defines */
+#define ALTR_A10SR_NOP                0x00    /* No Change */
+#define ALTR_A10SR_VERSION_READ       0x00    /* MAX5 Version Read */
+
+#define ALTR_A10SR_LED_REG            0x02    /* LED - Upper 4 bits */
+/* LED register Bit Definitions */
+#define ALTR_A10SR_LED_VALID_SHIFT        4       /* LED - Upper 4 bits valid 
*/
+#define ALTR_A10SR_OUT_VALID_RANGE_LO     ALTR_A10SR_LED_VALID_SHIFT
+#define ALTR_A10SR_OUT_VALID_RANGE_HI     7
+
+#define ALTR_A10SR_PBDSW_REG          0x04    /* PB & DIP SW - Input only */
+#define ALTR_A10SR_PBDSW_IRQ_REG      0x06    /* PB & DIP SW Flag Clear */
+/* Pushbutton & DIP Switch Bit Definitions */
+#define ALTR_A10SR_IN_VALID_RANGE_LO      8
+#define ALTR_A10SR_IN_VALID_RANGE_HI      15
+
+#define ALTR_A10SR_PWR_GOOD1_REG      0x08    /* Power Good1 Read */
+#define ALTR_A10SR_PWR_GOOD2_REG      0x0A    /* Power Good2 Read */
+#define ALTR_A10SR_PWR_GOOD3_REG      0x0C    /* Power Good3 Read */
+#define ALTR_A10SR_FMCAB_REG          0x0E    /* FMCA/B & PCIe Pwr Enable */
+#define ALTR_A10SR_HPS_RST_REG        0x10    /* HPS Reset */
+#define ALTR_A10SR_USB_QSPI_REG       0x12    /* USB, BQSPI, FILE Reset */
+#define ALTR_A10SR_SFPA_REG           0x14    /* SFPA Control Reg */
+#define ALTR_A10SR_SFPB_REG           0x16    /* SFPB Control Reg */
+#define ALTR_A10SR_I2C_M_REG          0x18    /* I2C Master Select */
+#define ALTR_A10SR_WARM_RST_REG       0x1A    /* HPS Warm Reset */
+#define ALTR_A10SR_WR_KEY_REG         0x1C    /* HPS Warm Reset Key */
+#define ALTR_A10SR_PMBUS_REG          0x1E    /* HPS PM Bus */
+
+/**
+ * struct altr_a10sr - Altera Max5 MFD device private data structure
+ * @dev:  : this device
+ * @regmap: the regmap assigned to the parent device.
+ */
+struct altr_a10sr {
+       struct device *dev;
+       struct regmap *regmap;
+};
+
+#endif /* __MFD_ALTERA_A10SR_H */



--
To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
the body of a message to majord...@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
