From: Lee Jones <lee.jones@linaro.org>
To: linux-hwmon@vger.kernel.org
Date: Wed, 30 Mar 2016 04:51:45 -0700
Subject: Re: [RFC 3/8] mfd: altr_a10sr: Add Altera Arria10 DevKit System Resource Chip
In-Reply-To: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
Message-ID: <20160330115106.GJ3323@x1>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

On Tue, 29 Mar 2016, ttha...@opensource.altera.com wrote:

> From: Thor Thayer <ttha...@opensource.altera.com>
> 
> Add support for the Altera Arria10 Development Kit System Resource
> chip which is implemented using a MAX5 as a external gpio extender,
> and hardware monitor with the regmap framework over a SPI bus.
> 
> Signed-off-by: Thor Thayer <ttha...@opensource.altera.com>
> ---
>  drivers/mfd/Kconfig              |   11 +++
>  drivers/mfd/Makefile             |    2 +
>  drivers/mfd/altera-a10sr.c       |  177 
> ++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/altera-a10sr.h |  146 +++++++++++++++++++++++++++++++
>  4 files changed, 336 insertions(+)
>  create mode 100644 drivers/mfd/altera-a10sr.c
>  create mode 100644 include/linux/mfd/altera-a10sr.h
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index eea61e3..d1edf81 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -18,6 +18,17 @@ config MFD_CS5535
>         This is the core driver for CS5535/CS5536 MFD functions.  This is
>            necessary for using the board's GPIO and MFGPT functionality.
>  
> +config MFD_ALTERA_A10SR
> +       bool "Altera Arria10 DevKit System Resource chip"
> +       depends on ARCH_SOCFPGA && SPI_MASTER=y

Depends on OF ?

> +       select REGMAP_SPI
> +       select MFD_CORE
> +       help
> +         Support for the Altera Arria10 DevKit MAX5 System Resource chip
> +         using the SPI interface. This driver provides common support for
> +         accessing the external gpio extender (LEDs & buttons) and
> +         hw monitor.
> +
>  config MFD_ACT8945A
>       tristate "Active-semi ACT8945A"
>       select MFD_CORE
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 5eaa6465d..4f1ff91 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -203,3 +203,5 @@ intel-soc-pmic-objs               := 
> intel_soc_pmic_core.o intel_soc_pmic_crc.o
>  intel-soc-pmic-$(CONFIG_INTEL_PMC_IPC)       += intel_soc_pmic_bxtwc.o
>  obj-$(CONFIG_INTEL_SOC_PMIC) += intel-soc-pmic.o
>  obj-$(CONFIG_MFD_MT6397)     += mt6397-core.o
> +
> +obj-$(CONFIG_MFD_ALTERA_A10SR)       += altera-a10sr.o
> diff --git a/drivers/mfd/altera-a10sr.c b/drivers/mfd/altera-a10sr.c
> new file mode 100644
> index 0000000..13665d4
> --- /dev/null
> +++ b/drivers/mfd/altera-a10sr.c
> @@ -0,0 +1,177 @@
> +/*
> + * Copyright Altera Corporation (C) 2014-2016. All Rights Reserved
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along 
> with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.

Any chance you can use the shorter copyright header?

> + * SPI access for Altera Arria10 MAX5 System Resource Chip
> + *
> + * Adapted from DA9052
> + * Copyright(c) 2011 Dialog Semiconductor Ltd.
> + * Author: David Dajun Chen <dc...@diasemi.com>
> + */
> +
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/input.h>
> +#include <linux/mfd/altera-a10sr.h>
> +#include <linux/mfd/core.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/spi/spi.h>
> +
> +static const struct mfd_cell altr_a10sr_subdev_info[] = {
> +};

Eh?  What's the point of this?

> +static bool altr_a10sr_reg_readable(struct device *dev, unsigned int reg)
> +{
> +     switch (reg) {
> +     case ALTR_A10SR_VERSION_READ:
> +     case ALTR_A10SR_LED_RD_REG:
> +     case ALTR_A10SR_PBDSW_RD_REG:
> +     case ALTR_A10SR_PBDSW_IRQ_CLR_REG:
> +     case ALTR_A10SR_PBDSW_IRQ_RD_REG:
> +     case ALTR_A10SR_PWR_GOOD1_RD_REG:
> +     case ALTR_A10SR_PWR_GOOD2_RD_REG:
> +     case ALTR_A10SR_PWR_GOOD3_RD_REG:
> +     case ALTR_A10SR_FMCAB_RD_REG:
> +     case ALTR_A10SR_HPS_RST_RD_REG:
> +     case ALTR_A10SR_USB_QSPI_RD_REG:
> +     case ALTR_A10SR_SFPA_RD_REG:
> +     case ALTR_A10SR_SFPB_RD_REG:
> +     case ALTR_A10SR_I2C_M_RD_REG:
> +     case ALTR_A10SR_WARM_RST_RD_REG:
> +     case ALTR_A10SR_WR_KEY_RD_REG:
> +     case ALTR_A10SR_PMBUS_RD_REG:
> +             return true;
> +     default:
> +             return false;
> +     }
> +}
> +
> +static bool altr_a10sr_reg_writeable(struct device *dev, unsigned int reg)
> +{
> +     switch (reg) {
> +     case ALTR_A10SR_LED_WR_REG:
> +     case ALTR_A10SR_PBDSW_IRQ_CLR_REG:
> +     case ALTR_A10SR_FMCAB_WR_REG:
> +     case ALTR_A10SR_HPS_RST_WR_REG:
> +     case ALTR_A10SR_USB_QSPI_WR_REG:
> +     case ALTR_A10SR_SFPA_WR_REG:
> +     case ALTR_A10SR_SFPB_WR_REG:
> +     case ALTR_A10SR_WARM_RST_WR_REG:
> +     case ALTR_A10SR_WR_KEY_WR_REG:
> +     case ALTR_A10SR_PMBUS_WR_REG:
> +             return true;
> +     default:
> +             return false;
> +     }
> +}
> +
> +static bool altr_a10sr_reg_volatile(struct device *dev, unsigned int reg)
> +{
> +     switch (reg) {
> +     case ALTR_A10SR_PBDSW_RD_REG:
> +     case ALTR_A10SR_PBDSW_IRQ_RD_REG:
> +     case ALTR_A10SR_PWR_GOOD1_RD_REG:
> +     case ALTR_A10SR_PWR_GOOD2_RD_REG:
> +     case ALTR_A10SR_PWR_GOOD3_RD_REG:
> +     case ALTR_A10SR_HPS_RST_RD_REG:
> +     case ALTR_A10SR_I2C_M_RD_REG:
> +     case ALTR_A10SR_WARM_RST_RD_REG:
> +     case ALTR_A10SR_WR_KEY_RD_REG:
> +     case ALTR_A10SR_PMBUS_RD_REG:
> +             return true;
> +     default:
> +             return false;
> +     }
> +}
> +
> +const struct regmap_config altr_a10sr_regmap_config = {
> +     .reg_bits = 8,
> +     .val_bits = 8,
> +
> +     .cache_type = REGCACHE_NONE,
> +
> +     .use_single_rw = true,
> +     .read_flag_mask = 1,
> +     .write_flag_mask = 0,
> +
> +     .max_register = ALTR_A10SR_WR_KEY_RD_REG,
> +     .readable_reg = altr_a10sr_reg_readable,
> +     .writeable_reg = altr_a10sr_reg_writeable,
> +     .volatile_reg = altr_a10sr_reg_volatile,
> +
> +};
> +
> +static int altr_a10sr_spi_probe(struct spi_device *spi)
> +{
> +     int ret;
> +     struct altr_a10sr *a10sr;
> +
> +     a10sr = devm_kzalloc(&spi->dev, sizeof(*a10sr),
> +                          GFP_KERNEL);
> +     if (!a10sr)
> +             return -ENOMEM;
> +
> +     spi->mode = SPI_MODE_3;
> +     spi->bits_per_word = 8;
> +     spi_setup(spi);
> +
> +     a10sr->dev = &spi->dev;
> +
> +     spi_set_drvdata(spi, a10sr);
> +
> +     a10sr->regmap = devm_regmap_init_spi(spi, &altr_a10sr_regmap_config);
> +     if (IS_ERR(a10sr->regmap)) {
> +             ret = PTR_ERR(a10sr->regmap);
> +             dev_err(&spi->dev, "Allocate register map Failed: %d\n", ret);

Proper English would be better.

"Failed to allocate register map"

> +             return ret;
> +     }
> +
> +     ret = mfd_add_devices(a10sr->dev, PLATFORM_DEVID_AUTO,
> +                           altr_a10sr_subdev_info,
> +                           ARRAY_SIZE(altr_a10sr_subdev_info),
> +                           NULL, 0, NULL);

This call does, precisely, nothing.

> +     if (ret)
> +             dev_err(a10sr->dev, "mfd_add_devices failed: %d\n", ret);

Users don't care about function names.

"Failed to register sub-devices" would be better.

> +     return ret;
> +}
> +
> +static int altr_a10sr_spi_remove(struct spi_device *spi)
> +{
> +     mfd_remove_devices(&spi->dev);
> +
> +     return 0;
> +}
> +
> +static const struct of_device_id altr_a10sr_spi_of_match[] = {
> +     { .compatible = "altr,altr-a10sr" },

I'm thinking that putting "altr" twice is unnecessary.

> +     { },
> +};
> +MODULE_DEVICE_TABLE(of, altr_a10sr_spi_of_match);
> +
> +static struct spi_driver altr_a10sr_spi_driver = {
> +     .probe = altr_a10sr_spi_probe,
> +     .remove = altr_a10sr_spi_remove,
> +     .driver = {
> +             .name = "altr_a10sr",
> +             .of_match_table = altr_a10sr_spi_of_match,

of_match_ptr()?

> +     },
> +};
> +
> +module_spi_driver(altr_a10sr_spi_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_AUTHOR("Thor Thayer");

Email.

> +MODULE_DESCRIPTION("Altera Arria10 DevKit System Resource MFD Driver");
> diff --git a/include/linux/mfd/altera-a10sr.h 
> b/include/linux/mfd/altera-a10sr.h
> new file mode 100644
> index 0000000..7087afc
> --- /dev/null
> +++ b/include/linux/mfd/altera-a10sr.h
> @@ -0,0 +1,146 @@
> +/*
> + * Copyright Altera Corporation (C) 2014-2016. All Rights Reserved
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along 
> with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.

Shorter Copyright?

> + * Declarations for Altera Arria10 MAX5 System Resource Chip
> + *
> + * Adapted from DA9052
> + * Copyright(c) 2011 Dialog Semiconductor Ltd.
> + * Author: David Dajun Chen <dc...@diasemi.com>
> + */
> +
> +#ifndef __MFD_ALTERA_A10SR_H
> +#define __MFD_ALTERA_A10SR_H
> +
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/completion.h>
> +#include <linux/list.h>
> +#include <linux/mfd/core.h>

Alphabetical please.

> +/* Write registers are always on even addresses */
> +#define  WRITE_REG_MASK              0xFE
> +/* Odd registers are always on odd addresses */
> +#define  READ_REG_MASK               0x01
> +
> +#define ALTR_A10SR_BITS_PER_REGISTER  8
> +/*
> + * To find the correct register, we divide the input GPIO by
> + * the number of GPIO in each register. We then need to multiply
> + * by 2 because the reads are at odd addresses.
> + */
> +#define ALTR_A10SR_REG_OFFSET(X)     (((X) / ALTR_A10SR_BITS_PER_REGISTER) 
> << 1)
> +#define ALTR_A10SR_REG_BIT(X)        ((X) % ALTR_A10SR_BITS_PER_REGISTER)
> +#define ALTR_A10SR_REG_BIT_CHG(X, Y) ((X) << ALTR_A10SR_REG_BIT(Y))
> +#define ALTR_A10SR_REG_BIT_MASK(X)   (1 << ALTR_A10SR_REG_BIT(X))
> +
> +/* Arria10 System Controller Register Defines */
> +#define ALTR_A10SR_NOP                0x00    /* No Change */
> +#define ALTR_A10SR_VERSION_READ       0x01    /* MAX5 Version Read */
> +#define ALTR_A10SR_LED_WR_REG         0x02    /* LED - Upper 4 bits */
> +#define ALTR_A10SR_LED_RD_REG         0x03    /* LED - Upper 4 bits */
> +#define ALTR_A10SR_PBDSW_RD_REG       0x05    /* PB & DIP SW - Input only */
> +#define ALTR_A10SR_PBDSW_IRQ_CLR_REG  0x06    /* PB & DIP SW Flag Clear */
> +#define ALTR_A10SR_PBDSW_IRQ_RD_REG   0x07    /* PB & DIP SW Flag Read */
> +#define ALTR_A10SR_PWR_GOOD1_RD_REG   0x09    /* Power Good1 Read */
> +#define ALTR_A10SR_PWR_GOOD2_RD_REG   0x0B    /* Power Good2 Read */
> +#define ALTR_A10SR_PWR_GOOD3_RD_REG   0x0D    /* Power Good3 Read */
> +#define ALTR_A10SR_FMCAB_WR_REG       0x0E    /* FMCA/B & PCIe Pwr Enable */
> +#define ALTR_A10SR_FMCAB_RD_REG       0x0F    /* FMCA/B & PCIe Pwr Enable */
> +#define ALTR_A10SR_HPS_RST_WR_REG     0x10    /* HPS Reset */
> +#define ALTR_A10SR_HPS_RST_RD_REG     0x11    /* HPS Reset */
> +#define ALTR_A10SR_USB_QSPI_WR_REG    0x12    /* USB, BQSPI, FILE Reset */
> +#define ALTR_A10SR_USB_QSPI_RD_REG    0x13    /* USB, BQSPI, FILE Reset */
> +#define ALTR_A10SR_SFPA_WR_REG        0x14    /* SFPA Control Reg */
> +#define ALTR_A10SR_SFPA_RD_REG        0x15    /* SFPA Control Reg */
> +#define ALTR_A10SR_SFPB_WR_REG        0x16    /* SFPB Control Reg */
> +#define ALTR_A10SR_SFPB_RD_REG        0x17    /* SFPB Control Reg */
> +#define ALTR_A10SR_I2C_M_RD_REG       0x19    /* I2C Master Select */
> +#define ALTR_A10SR_WARM_RST_WR_REG    0x1A    /* HPS Warm Reset */
> +#define ALTR_A10SR_WARM_RST_RD_REG    0x1B    /* HPS Warm Reset */
> +#define ALTR_A10SR_WR_KEY_WR_REG      0x1C    /* HPS Warm Reset Key */
> +#define ALTR_A10SR_WR_KEY_RD_REG      0x1D    /* HPS Warm Reset Key */
> +#define ALTR_A10SR_PMBUS_WR_REG       0x1E    /* HPS PM Bus */
> +#define ALTR_A10SR_PMBUS_RD_REG       0x1F    /* HPS PM Bus */
> +
> +struct altr_a10sr {
> +     struct device *dev;
> +     struct regmap *regmap;
> +};
> +
> +/* Device I/O API */
> +static inline int altr_a10sr_reg_read(struct altr_a10sr *a10sr,
> +                                   unsigned char reg)
> +{
> +     int val, ret;
> +
> +     ret = regmap_read(a10sr->regmap, (reg | READ_REG_MASK), &val);
> +     if (ret < 0)
> +             return ret;
> +
> +     return val;
> +}
> +
> +static inline int altr_a10sr_reg_write(struct altr_a10sr *a10sr,
> +                                    unsigned char reg, unsigned char val)
> +{
> +     int ret;
> +
> +     ret = regmap_write(a10sr->regmap, (reg & WRITE_REG_MASK), val);
> +     if (ret < 0)
> +             return ret;
> +
> +     return ret;
> +}
> +
> +static inline int altr_a10sr_group_read(struct altr_a10sr *a10sr,
> +                                     unsigned char reg,
> +                                     unsigned int reg_cnt,
> +                                     unsigned char *val)
> +{
> +     return regmap_bulk_read(a10sr->regmap, reg, val, reg_cnt);
> +}
> +
> +static inline int altr_a10sr_group_write(struct altr_a10sr *a10sr,
> +                                      unsigned char reg,
> +                                      unsigned int reg_cnt,
> +                                      unsigned char *val)
> +{
> +     return regmap_bulk_write(a10sr->regmap, reg, val, reg_cnt);
> +}

All of the above are completely superfluous.  Just use the regmap_*
API directly.

> +static inline int altr_a10sr_reg_update(struct altr_a10sr *a10sr,
> +                                     unsigned char reg,
> +                                     unsigned char bit_mask,
> +                                     unsigned char reg_val)
> +{
> +     int rval, ret;
> +
> +     /*
> +      * We can't use the standard regmap_update_bits function because
> +      * the read register has a different address than the write register.
> +      * Therefore, just do a read, modify, write operation here.
> +      */
> +     ret = regmap_read(a10sr->regmap, (reg | READ_REG_MASK), &rval);
> +     if (ret < 0)
> +             return ret;
> +
> +     rval = ((rval & ~bit_mask) | (reg_val & bit_mask));
> +
> +     ret = regmap_write(a10sr->regmap, (reg & WRITE_REG_MASK), rval);
> +
> +     return ret;
> +}

Why can't you use the Regmap update function(s)?

> +#endif /* __MFD_ALTERA_A10SR_H */

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
the body of a message to majord...@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
