Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-yw0-f195.google.com ([209.85.161.195]:35507 "EHLO
        mail-yw0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755178AbdGSPFb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 19 Jul 2017 11:05:31 -0400
MIME-Version: 1.0
In-Reply-To: <20170718033653.10298-4-andrew@aj.id.au>
References: <20170718033653.10298-1-andrew@aj.id.au> <20170718033653.10298-4-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 20 Jul 2017 00:35:09 +0930
Message-ID: <CACPK8XewOXhT4bvUHhhSoPu1t2=DefeutkrLRnVhhu2+B7nLSw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/3] pmbus: Add MAX31785 driver
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        msbarth <msbarth@linux.vnet.ibm.com>,
        Matt Spinler <mspinler@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Jul 18, 2017 at 1:06 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> The driver features fan control and basic dual-tachometer support.

Say something about the hardware?

 max31785 is a fancy fan controller with temp measurement, pwm, tach,
breakfast making from Maxim.


>
> The fan control makes use of the new virtual registers exposed by the
> pmbus core, mixing use of the default implementations with some
> overrides via the read/write handlers. FAN_COMMAND_1 on the MAX31785
> breaks the values into bands that depend on the RPM or PWM control mode.
>
> The dual tachometer feature is implemented in hardware with a TACHSEL
> input to indicate the rotor under measurement, and exposed on the bus by
> extending the READ_FAN_SPEED_1 word with two extra bytes*.
> The need to read the non-standard four-byte response leads to a cut-down
> implementation of i2c_smbus_xfer_emulated() included in the driver.
> Further, to expose the second rotor tachometer value to userspace,
> virtual fans are implemented by re-routing the FAN_CONFIG_1_2 register
> from the undefined (in hardware) pages 23-28 to the same register on
> pages 0-5, and similarly re-routing READ_FAN_SPEED_1 requests on 23-28
> to pages 0-5 but extracting the second word of the four-byte response.
>
> * The documentation recommends the slower rotor be associated with
> TACHSEL=0, which is the input used by the controller's closed-loop fan
> management.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> v1 -> v2:
>
> * Implement in terms of virtual registers
> * Add support for dual-tachometer readings through 'virtual fans' (unused pages)
>
>  drivers/hwmon/pmbus/Kconfig    |  10 ++
>  drivers/hwmon/pmbus/Makefile   |   1 +
>  drivers/hwmon/pmbus/max31785.c | 372 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 383 insertions(+)
>  create mode 100644 drivers/hwmon/pmbus/max31785.c
>
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index cad1229b7e17..5f2f3c6c7499 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -95,6 +95,16 @@ config SENSORS_MAX20751
>           This driver can also be built as a module. If so, the module will
>           be called max20751.
>
> +config SENSORS_MAX31785
> +       tristate "Maxim MAX31785 and compatibles"
> +       default n
> +       help
> +         If you say yes here you get hardware monitoring support for Maxim
> +         MAX31785.
> +
> +         This driver can also be built as a module. If so, the module will
> +         be called max31785.
> +
>  config SENSORS_MAX34440
>         tristate "Maxim MAX34440 and compatibles"
>         default n
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 562132054aaf..4ea548a8af46 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -10,6 +10,7 @@ obj-$(CONFIG_SENSORS_LTC2978) += ltc2978.o
>  obj-$(CONFIG_SENSORS_LTC3815)  += ltc3815.o
>  obj-$(CONFIG_SENSORS_MAX16064) += max16064.o
>  obj-$(CONFIG_SENSORS_MAX20751) += max20751.o
> +obj-$(CONFIG_SENSORS_MAX31785) += max31785.o
>  obj-$(CONFIG_SENSORS_MAX34440) += max34440.o
>  obj-$(CONFIG_SENSORS_MAX8688)  += max8688.o
>  obj-$(CONFIG_SENSORS_TPS40422) += tps40422.o
> diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
> new file mode 100644
> index 000000000000..1baa961f2eb1
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/max31785.c
> @@ -0,0 +1,372 @@
> +/*
> + * Copyright (C) 2017 IBM Corp.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include "pmbus.h"
> +
> +#define MFR_FAN_CONFIG_DUAL_TACH       BIT(12)
> +#define MFR_FAN_CONFIG_TSFO            BIT(9)
> +#define MFR_FAN_CONFIG_TACHO           BIT(8)
> +
> +#define MAX31785_CAP_DUAL_TACH         BIT(0)
> +
> +struct max31785 {
> +       struct pmbus_driver_info info;
> +
> +       u32 capabilities;
> +};
> +
> +enum max31785_regs {
> +       PMBUS_MFR_FAN_CONFIG            = 0xF1,
> +       PMBUS_MFR_READ_FAN_PWM          = 0xF3,
> +       PMBUS_MFR_FAN_FAULT_LIMIT       = 0xF5,
> +       PMBUS_MFR_FAN_WARN_LIMIT        = 0xF6,
> +       PMBUS_MFR_FAN_PWM_AVG           = 0xF8,
> +};
> +
> +#define to_max31785(_c) container_of(pmbus_get_info(_c), struct max31785, info)
> +
> +static int max31785_read_byte_data(struct i2c_client *client, int page,
> +                                  int reg)
> +{
> +       struct max31785 *chip = to_max31785(client);
> +       int rv = -ENODATA;

I'd drop this.

> +
> +       switch (reg) {
> +       case PMBUS_VOUT_MODE:
> +               if (page < 23)
> +                       return -ENODATA;
> +
> +               return -ENOTSUPP;
> +       case PMBUS_FAN_CONFIG_12:
> +               if (page < 23)
> +                       return -ENODATA;
> +
> +               if (WARN_ON(!(chip->capabilities & MAX31785_CAP_DUAL_TACH)))

Not sure about the WARN_ON here - won't users get spammed every time
someone reads a byte of data? When do we expect this case to happen?

> +                       return -ENOTSUPP;
> +
> +               rv = pmbus_read_byte_data(client, page - 23, reg);

return pmbus_read_byte_data(client, page - 23, reg);
> +               break;
> +       }
> +
> +       return rv;

return -ENODATA;

Or something like ESUPP or EINVAL?

Interestingly max34440_read_byte_data (may) return zero in this case.

> +}
> +
> +static long max31785_read_long_data(struct i2c_client *client, int page,
> +                                   int reg)
> +{
> +       unsigned char cmdbuf[1];
> +       unsigned char rspbuf[4];
> +       s64 rc;

This should be the same type as the function returns.

> +
> +       struct i2c_msg msg[2] = {
> +               {
> +                       .addr = client->addr,
> +                       .flags = 0,
> +                       .len = sizeof(cmdbuf),
> +                       .buf = cmdbuf,
> +               },
> +               {
> +                       .addr = client->addr,
> +                       .flags = I2C_M_RD,
> +                       .len = sizeof(rspbuf),
> +                       .buf = rspbuf,
> +               },
> +       };
> +
> +       cmdbuf[0] = reg;
> +
> +       rc = pmbus_set_page(client, page);
> +       if (rc < 0)
> +               return rc;
> +
> +       rc = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
> +       if (rc < 0)
> +               return rc;
> +
> +       rc = (rspbuf[0] << (0 * 8)) | (rspbuf[1] << (1 * 8)) |
> +            (rspbuf[2] << (2 * 8)) | (rspbuf[3] << (3 * 8));

It's getting late, so I might have confused myself. But can you just do:

rc = le32_to_cpup(rspbuf);

> +
> +       return rc;
> +}
> +
> +static int max31785_get_pwm(struct i2c_client *client, int page)
> +{
> +       int config;
> +       int command;
> +
> +       config = pmbus_read_byte_data(client, page, PMBUS_FAN_CONFIG_12);
> +       if (config < 0)
> +               return config;
> +
> +       command = pmbus_read_word_data(client, page, PMBUS_FAN_COMMAND_1);
> +       if (command < 0)
> +               return command;
> +
> +       if (!(config & PB_FAN_1_RPM)) {
> +               if (command >= 0x8000)
> +                       return 0;
> +               else if (command >= 0x2711)
> +                       return 0x2710;

What are the magic numbers?

> +               else
> +                       return command;
> +       }
> +
> +       return 0;
> +}
> +
> +static int max31785_get_pwm_mode(struct i2c_client *client, int page)
> +{
> +       int config;
> +       int command;
> +
> +       config = pmbus_read_byte_data(client, page, PMBUS_FAN_CONFIG_12);
> +       if (config < 0)
> +               return config;
> +
> +       command = pmbus_read_word_data(client, page, PMBUS_FAN_COMMAND_1);
> +       if (command < 0)
> +               return command;
> +
> +       if (!(config & PB_FAN_1_RPM)) {
> +               if (command >= 0x8000)
> +                       return 2;
> +               else if (command >= 0x2711)
> +                       return 0;
> +               else
> +                       return 1;
> +       }
> +
> +       return (command >= 0x8000) ? 2 : 1;
> +}
> +
> +static int max31785_read_word_data(struct i2c_client *client, int page,
> +                                  int reg)
> +{
> +       struct max31785 *chip = to_max31785(client);
> +       long rv = -ENODATA;
> +
> +       switch (reg) {
> +       case PMBUS_READ_FAN_SPEED_1:
> +               if (likely(page < 23))
> +                       return -ENODATA;
> +
> +               if (WARN_ON(!(chip->capabilities & MAX31785_CAP_DUAL_TACH)))
> +                       return -ENOTSUPP;
> +
> +               rv = max31785_read_long_data(client, page - 23, reg);
> +               if (rv < 0)
> +                       return rv;
> +
> +               rv = (rv >> 16) & 0xffff;
> +               break;
> +       case PMBUS_VIRT_PWM_1:
> +               rv = max31785_get_pwm(client, page);
> +               rv *= 255;
> +               rv /= 100;
> +               break;
> +       case PMBUS_VIRT_PWM_ENABLE_1:
> +               rv = max31785_get_pwm_mode(client, page);
> +               break;
> +       }
> +
> +       if (rv == -ENODATA && page >= 23)
> +               return -ENXIO;
> +
> +       return rv;
> +}
> +
> +static const int max31785_pwm_modes[] = { 0x7fff, 0x2710, 0xffff };
> +
> +static int max31785_write_word_data(struct i2c_client *client, int page,
> +                                   int reg, u16 word)
> +{
> +       int rv = -ENODATA;
> +
> +       if (page >= 23)
> +               return -ENXIO;
> +
> +       switch (reg) {
> +       case PMBUS_VIRT_PWM_ENABLE_1:
> +               if (word >= ARRAY_SIZE(max31785_pwm_modes))
> +                       return -ENOTSUPP;
> +
> +               rv = pmbus_update_fan(client, page, 0, 0, PB_FAN_1_RPM,
> +                                        max31785_pwm_modes[word]);
> +               break;
> +       }
> +
> +       return rv;
> +}
> +
> +static int max31785_write_byte(struct i2c_client *client, int page, u8 value)
> +{
> +       if (page < 23)
> +               return -ENODATA;
> +
> +       return -ENOTSUPP;
> +}
> +
> +static struct pmbus_driver_info max31785_info = {
> +       .pages = 23,
> +
> +       .write_word_data = max31785_write_word_data,
> +       .read_byte_data = max31785_read_byte_data,
> +       .read_word_data = max31785_read_word_data,
> +       .write_byte = max31785_write_byte,
> +
> +       /* RPM */
> +       .format[PSC_FAN] = direct,
> +       .m[PSC_FAN] = 1,
> +       .b[PSC_FAN] = 0,
> +       .R[PSC_FAN] = 0,
> +       /* PWM */
> +       .format[PSC_PWM] = direct,
> +       .m[PSC_PWM] = 1,
> +       .b[PSC_PWM] = 0,
> +       .R[PSC_PWM] = 2,
> +       .func[0] = PMBUS_HAVE_FAN12 | PMBUS_HAVE_STATUS_FAN12,
> +       .func[1] = PMBUS_HAVE_FAN12 | PMBUS_HAVE_STATUS_FAN12,
> +       .func[2] = PMBUS_HAVE_FAN12 | PMBUS_HAVE_STATUS_FAN12,
> +       .func[3] = PMBUS_HAVE_FAN12 | PMBUS_HAVE_STATUS_FAN12,
> +       .func[4] = PMBUS_HAVE_FAN12 | PMBUS_HAVE_STATUS_FAN12,
> +       .func[5] = PMBUS_HAVE_FAN12 | PMBUS_HAVE_STATUS_FAN12,
> +
> +       .format[PSC_TEMPERATURE] = direct,
> +       .m[PSC_TEMPERATURE] = 1,
> +       .b[PSC_TEMPERATURE] = 0,
> +       .R[PSC_TEMPERATURE] = 2,
> +       .func[6]  = PMBUS_HAVE_STATUS_TEMP,
> +       .func[7]  = PMBUS_HAVE_STATUS_TEMP,
> +       .func[8]  = PMBUS_HAVE_STATUS_TEMP,
> +       .func[9]  = PMBUS_HAVE_STATUS_TEMP,
> +       .func[10] = PMBUS_HAVE_STATUS_TEMP,
> +       .func[11] = PMBUS_HAVE_STATUS_TEMP,
> +       .func[12] = PMBUS_HAVE_STATUS_TEMP,
> +       .func[13] = PMBUS_HAVE_STATUS_TEMP,
> +       .func[14] = PMBUS_HAVE_STATUS_TEMP,
> +       .func[15] = PMBUS_HAVE_STATUS_TEMP,
> +       .func[16] = PMBUS_HAVE_STATUS_TEMP,
> +
> +       .format[PSC_VOLTAGE_OUT] = direct,
> +       .m[PSC_VOLTAGE_OUT] = 1,
> +       .b[PSC_VOLTAGE_OUT] = 0,
> +       .R[PSC_VOLTAGE_OUT] = 0,
> +       .func[17] = PMBUS_HAVE_STATUS_VOUT,
> +       .func[18] = PMBUS_HAVE_STATUS_VOUT,
> +       .func[19] = PMBUS_HAVE_STATUS_VOUT,
> +       .func[20] = PMBUS_HAVE_STATUS_VOUT,
> +       .func[21] = PMBUS_HAVE_STATUS_VOUT,
> +       .func[22] = PMBUS_HAVE_STATUS_VOUT,
> +};
> +
> +static int max31785_probe(struct i2c_client *client,
> +                         const struct i2c_device_id *id)
> +{
> +       struct max31785 *chip;
> +       int rv;
> +       int i;
> +
> +       chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
> +       if (!chip)
> +               return -ENOMEM;
> +
> +       chip->info = max31785_info;
> +
> +       /*
> +        * Identify the chip firmware and configure capabilities.
> +        *
> +        * Bootstrap with i2c_smbus_*() calls as we need to understand the chip
> +        * capabilities for before invoking pmbus_do_probe(). The pmbus_*()
> +        * calls need access to memory that is only valid after
> +        * pmbus_do_probe().

I think this is common enough in pmbus drivers that the comment is redundant.

> +        */
> +       rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 255);
> +       if (rv < 0)
> +               return rv;
> +
> +       rv = i2c_smbus_read_word_data(client, PMBUS_MFR_REVISION);
> +       if (rv < 0)
> +               return rv;
> +
> +       if ((rv & 0xff) == 0x40) {

DUAL_TACH_REV? Or a better name from the docs we have?

> +               chip->capabilities |= MAX31785_CAP_DUAL_TACH;
> +
> +               /*
> +                * Punt the dual tach virtual fans to non-existent pages. This
> +                * ensures the pwm attributes appear in a contiguous block
> +                */
> +               chip->info.pages = 29;
> +               chip->info.func[23] = PMBUS_HAVE_FAN12;
> +               chip->info.func[24] = PMBUS_HAVE_FAN12;
> +               chip->info.func[25] = PMBUS_HAVE_FAN12;
> +               chip->info.func[26] = PMBUS_HAVE_FAN12;
> +               chip->info.func[27] = PMBUS_HAVE_FAN12;
> +               chip->info.func[28] = PMBUS_HAVE_FAN12;
> +       }
> +
> +       rv = pmbus_do_probe(client, id, &chip->info);
> +       if (rv < 0)
> +               return rv;
> +
> +       for (i = 0; i < max31785_info.pages; i++) {
> +               int reg;
> +
> +               if (!(max31785_info.func[i] & (PMBUS_HAVE_FAN12)))
> +                       continue;
> +
> +               reg = pmbus_read_word_data(client, i, PMBUS_MFR_FAN_CONFIG);
> +               if (reg < 0)
> +                       continue;
> +
> +               /*
> +                * XXX: Purely for RFC/testing purposes, don't ramp fans on fan
> +                * or temperature sensor fault, or a failure to write
> +                * FAN_COMMAND_1 inside a 10s window (watchdog mode).
> +                *
> +                * The TSFO bit controls both ramping on temp sensor failure
> +                * AND whether FAN_COMMAND_1 is in watchdog mode.
> +                */
> +               reg |= MFR_FAN_CONFIG_TSFO | MFR_FAN_CONFIG_TACHO;
> +               if (chip->capabilities & MAX31785_CAP_DUAL_TACH)
> +                       reg |= MFR_FAN_CONFIG_DUAL_TACH;
> +               reg &= 0xffff;
> +
> +               rv = pmbus_write_word_data(client, i, PMBUS_MFR_FAN_CONFIG,
> +                                          reg);
> +       }
> +
> +       return 0;
> +}
> +
> +static const struct i2c_device_id max31785_id[] = {
> +       { "max31785", 0 },
> +       { },
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, max31785_id);
> +
> +static struct i2c_driver max31785_driver = {
> +       .driver = {
> +               .name = "max31785",
> +       },
> +       .probe = max31785_probe,
> +       .remove = pmbus_do_remove,
> +       .id_table = max31785_id,
> +};
> +
> +module_i2c_driver(max31785_driver);
> +
> +MODULE_AUTHOR("Andrew Jeffery <andrew@aj.id.au>");
> +MODULE_DESCRIPTION("PMBus driver for the Maxim MAX31785");
> +MODULE_LICENSE("GPL");
> --
> 2.11.0
>
