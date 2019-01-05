From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Date: Sat, 05 Jan 2019 09:09:22 -0800
Subject: Re: [PATCH 4/4] pmbus (dps650ab): add power supply driver
In-Reply-To: <cover.1546591275.git.xiaoting.liu@hxt-semitech.com>
Message-ID: <20190105170847.GA14962@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

On Fri, Jan 04, 2019 at 05:05:27PM +0800, Xiaoting Liu wrote:
> The Delta dps650ab provides main power and standby power to server.
> dps650ab can be detected by MFR_ID and MFR_MODEL referring to
> manufacturer's feedback. This patch adds driver to moniter power
> supply status.
> 

Another comment: The subject should be something like
        hwmon: (pmbus) Add driver for DPS650AB power supply

Additional comments inline below.

Thanks,
Guenter

> Signed-off-by: Xiaoting Liu <xiaoting....@hxt-semitech.com>
> ---
>  drivers/hwmon/pmbus/Kconfig    |  10 +++++
>  drivers/hwmon/pmbus/Makefile   |   1 +
>  drivers/hwmon/pmbus/dps650ab.c | 100 
> +++++++++++++++++++++++++++++++++++++++++
>  drivers/hwmon/pmbus/pmbus.c    |   3 ++
>  4 files changed, 114 insertions(+)
> 
> --
> 1.8.3.1
> 
> 
> 
> 
> This email is intended only for the named addressee. It may contain 
> information that is confidential/private, legally privileged, or 
> copyright-protected, and you should handle it accordingly. If you are not the 
> intended recipient, you do not have legal rights to retain, copy, or 
> distribute this email or its contents, and should promptly delete the email 
> and all electronic copies in your system; do not retain copies in any media. 
> If you have received this email in error, please notify the sender promptly. 
> Thank you.
> 
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 629cb45f8557..de4638396592 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -184,4 +184,14 @@ config SENSORS_ZL6100
>           This driver can also be built as a module. If so, the module will
>           be called zl6100.
> 
> +config SENSORS_DPS650AB
> +       tristate "Delta DPS650AB"
> +       default n
> +       help
> +         If you say yes here you get hardware monitoring support for the
> +         Delta DPS650AB controller.
> +
> +         This driver can also be built as a module. If so, the module will
> +         be called dps650ab.
> +
Ahplabetic order, please.

>  endif # PMBUS
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index ea0e39518c21..414818230a26 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -21,3 +21,4 @@ obj-$(CONFIG_SENSORS_TPS53679)        += tps53679.o
>  obj-$(CONFIG_SENSORS_UCD9000)  += ucd9000.o
>  obj-$(CONFIG_SENSORS_UCD9200)  += ucd9200.o
>  obj-$(CONFIG_SENSORS_ZL6100)   += zl6100.o
> +obj-$(CONFIG_SENSORS_DPS650AB) += dps650ab.o

Alphabetic order, please.

> diff --git a/drivers/hwmon/pmbus/dps650ab.c b/drivers/hwmon/pmbus/dps650ab.c
> new file mode 100644
> index 000000000000..3c300e621f5a
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/dps650ab.c
> @@ -0,0 +1,100 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Hardware monitoring driver for DELTA DPS650AB
> + *
> + * Copyright (c) 2018 Huaxintong Semiconductor Technology Co., Ltd.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include "pmbus.h"
> +
> +#define DPS650AB_MFR_ID                        "DELTA"
> +#define DPS650AB_MFR_MODEL             "DPS-650AB-16 A"
> +
> +static int dps650ab_probe(struct i2c_client *client,
> +                        const struct i2c_device_id *id)
> +{
> +       struct pmbus_driver_info *info;
> +       u8 buf[I2C_SMBUS_BLOCK_MAX];
> +       int ret;
> +
> +       memset(buf, 0, I2C_SMBUS_BLOCK_MAX);
> +
> +       if (!i2c_check_functionality(client->adapter,
> +                                    I2C_FUNC_SMBUS_READ_BYTE_DATA
> +                               | I2C_FUNC_SMBUS_READ_WORD_DATA
> +                               | I2C_FUNC_SMBUS_READ_BLOCK_DATA))
> +               return -ENODEV;
> +
> +       ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
> +       if (ret < 0) {
> +               dev_err(&client->dev, "Failed to read PMBUS_MFR_ID\n");
> +               return ret;
> +       }
> +
> +       if (strncmp(buf, DPS650AB_MFR_ID, strlen(DPS650AB_MFR_ID))) {
> +               dev_err(&client->dev, "DPS650AB_MFR_ID unrecognised\n");
> +               return -ENODEV;
> +       }
> +
> +       ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
> +       if (ret < 0) {
> +               dev_err(&client->dev, "Failed to read PMBUS_MFR_MODEL\n");
> +               return ret;
> +       }
> +
> +       if (strncmp(buf, DPS650AB_MFR_MODEL, strlen(DPS650AB_MFR_MODEL))) {
> +               dev_err(&client->dev, "DPS650AB_MFR_MODEL unrecognised\n");
> +               return -ENODEV;
> +       }
> +
> +       info = devm_kzalloc(&client->dev, sizeof(*info), GFP_KERNEL);
> +       if (!info)
> +               return -ENOMEM;
> +
> +       info->pages = 1;
> +       info->format[PSC_VOLTAGE_IN] = linear;
> +       info->format[PSC_VOLTAGE_OUT] = linear;
> +       info->format[PSC_CURRENT_IN] = linear;
> +       info->format[PSC_CURRENT_OUT] = linear;
> +       info->format[PSC_POWER] = linear;
> +       info->format[PSC_TEMPERATURE] = linear;
> +
> +       info->func[0] = PMBUS_HAVE_VIN
> +               | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN
> +               | PMBUS_HAVE_STATUS_INPUT
> +               | PMBUS_HAVE_POUT | PMBUS_HAVE_FAN12
> +               | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
> +               | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
> +               | PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2
> +               | PMBUS_HAVE_STATUS_TEMP;
> +       info->func[1] = info->func[0];
> +
> +       return pmbus_do_probe(client, id, info);
> +}
> +
> +static const struct i2c_device_id dps650ab_id[] = {
> +       {"dps650ab", 1},
> +       {}
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, dps650ab_id);
> +
> +static struct i2c_driver dps650ab_driver = {
> +       .driver = {
> +               .name   = "dps650ab",
> +       },
> +       .probe          = dps650ab_probe,
> +       .remove         = pmbus_do_remove,
> +       .id_table       = dps650ab_id,
> +};
> +
> +module_i2c_driver(dps650ab_driver);
> +
> +MODULE_AUTHOR("Liuxiaoting <xiaoting....@hxt-semitech.com");
> +MODULE_DESCRIPTION("PMBus driver for DPS650AB");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
> index aa4cf9636e99..930e8a3e2366 100644
> --- a/drivers/hwmon/pmbus/pmbus.c
> +++ b/drivers/hwmon/pmbus/pmbus.c
> @@ -204,6 +204,8 @@ static int pmbus_probe(struct i2c_client *client,
>  static const struct pmbus_device_info sgd009_pmbus_info = {
>                                 1, PMBUS_SKIP_STATUS_CHECK};
>  static const struct pmbus_device_info pmbus_info = {0, 0};
> +static const struct pmbus_device_info dps650ab_pmbus_info = {
> +                               1, PMBUS_SKIP_STATUS_CHECK};
>  /*
>   * Use driver_data to set the number of pages supported by the chip.
>   */
> @@ -227,6 +229,7 @@ static int pmbus_probe(struct i2c_client *client,
>         {"tps544c20", (kernel_ulong_t)&default_pmbus_info},
>         {"tps544c25", (kernel_ulong_t)&default_pmbus_info},
>         {"udt020", (kernel_ulong_t)&default_pmbus_info},
> +       {"dps650ab", (kernel_ulong_t)&dps650ab_pmbus_info},
>         {}
>  };
