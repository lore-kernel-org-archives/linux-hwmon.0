Return-path: <joel.stan@gmail.com>
MIME-Version: 1.0
Sender: joel.stan@gmail.com
In-Reply-To: <1486509056-25838-2-git-send-email-eajames@linux.vnet.ibm.com>
References: <1486509056-25838-1-git-send-email-eajames@linux.vnet.ibm.com> <1486509056-25838-2-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 10 Feb 2017 16:01:43 +1030
Message-ID: <CACPK8XcPwKN2oEeryXh3909OZs9eF=rjnZVJV3NRo_OAK-Zhcg@mail.gmail.com>
Subject: Re: [PATCH linux v7 1/6] hwmon: Add core On-Chip Controller support
 for POWER CPUs
To: eajames <eajames@linux.vnet.ibm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, jdelvare@suse.com, corbet@lwn.net,
	Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
	Wolfram Sang <wsa@the-dreams.de>, Andrew Jeffery <andrew@aj.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, "Edward A. James" <eajames@us.ibm.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-hwmon@vger.kernel.org>

On Wed, Feb 8, 2017 at 9:40 AM,  <eajames@linux.vnet.ibm.com> wrote:

> diff --git a/Documentation/hwmon/occ b/Documentation/hwmon/occ
> new file mode 100644
> index 0000000..79d1642
> --- /dev/null
> +++ b/Documentation/hwmon/occ

The kernel is using  reStructuredText these days. You should consider
following suit:

 https://www.kernel.org/doc/html/latest/doc-guide/sphinx.html#writing-documentation


> @@ -0,0 +1,40 @@
> +Kernel driver occ
> +=================
> +
> +Supported chips:
> + * ASPEED AST2400
> + * ASPEED AST2500

Not really - this will run on any chip that's connected to a P8 or P9.


> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5f10c28..193a13b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9128,6 +9128,13 @@ T:       git git://linuxtv.org/media_tree.git
>  S:     Maintained
>  F:     drivers/media/i2c/ov7670.c
>
> +ON-CHIP CONTROLLER HWMON DRIVER

Mention P8 and P9?

> +M:     Eddie James <eajames@us.ibm.com>
> +L:     linux-hwmon@vger.kernel.org

Have you subscribed to this list? Would you prefer the mail to come to
the openbmc list?

> +S:     Maintained
> +F:     Documentation/hwmon/occ
> +F:     drivers/hwmon/occ/
> +
>  ONENAND FLASH DRIVER
>  M:     Kyungmin Park <kyungmin.park@samsung.com>
>  L:     linux-mtd@lists.infradead.org
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 190d270..e80ca81 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1240,6 +1240,8 @@ config SENSORS_NSA320
>           This driver can also be built as a module. If so, the module
>           will be called nsa320-hwmon.
>
> +source drivers/hwmon/occ/Kconfig
> +
>  config SENSORS_PCF8591
>         tristate "Philips PCF8591 ADC/DAC"
>         depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index d2cb7e8..c7ec5d4 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -169,6 +169,7 @@ obj-$(CONFIG_SENSORS_WM831X)        += wm831x-hwmon.o
>  obj-$(CONFIG_SENSORS_WM8350)   += wm8350-hwmon.o
>  obj-$(CONFIG_SENSORS_XGENE)    += xgene-hwmon.o
>
> +obj-$(CONFIG_SENSORS_PPC_OCC)  += occ/
>  obj-$(CONFIG_PMBUS)            += pmbus/
>
>  ccflags-$(CONFIG_HWMON_DEBUG_CHIP) := -DDEBUG


> diff --git a/drivers/hwmon/occ/occ.c b/drivers/hwmon/occ/occ.c
> new file mode 100644
> index 0000000..af077f2
> --- /dev/null
> +++ b/drivers/hwmon/occ/occ.c

> +               sensors = &resp->data.blocks[b].sensors;
> +               if (!sensors) {
> +                       /* first poll response */
> +                       sensors = driver->ops.alloc_sensor(dev, sensor_type,
> +                                                          block->num_sensors);
> +                       if (!sensors)
> +                               return -ENOMEM;
> +
> +                       resp->data.blocks[b].sensors = sensors;
> +                       resp->data.sensor_block_id[sensor_type] = b;
> +                       resp->data.blocks[b].header = *block;
> +               } else if (block->sensor_length !=
> +                        resp->data.blocks[b].header.sensor_length) {
> +                       dev_warn(dev,
> +                                "different sensor length than first poll\n");

The driver has changed behaviour from your previous version; now it
discards data if the sensors change.

Under what circumstances does the sensor data change?

> +                       continue;
> +               }
> +
> +               for (s = 0; s < block->num_sensors &&
> +                    s < resp->data.blocks[b].header.num_sensors; s++) {
> +                       if (offset + block->sensor_length > num_bytes) {
> +                               dev_warn(dev, "exceeded data length\n");
> +                               return 0;
> +                       }
> +
> +                       driver->ops.parse_sensor(data, sensors, sensor_type,
> +                                                offset, s);
> +                       offset += block->sensor_length;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static u8 occ_send_cmd(struct occ *driver, u8 seq, u8 type, u16 length,
> +                      const u8 *data, u8 *resp)
> +{
> +       u32 cmd1, cmd2 = 0;
> +       u16 checksum = 0;
> +       bool retry = false;
> +       int i, rc, tries = 0;
> +
> +       cmd1 = (seq << 24) | (type << 16) | length;
> +       memcpy(&cmd2, data, length);
> +       cmd2 <<= ((4 - length) * 8);
> +
> +       /* checksum: sum of every bytes of cmd1, cmd2 */
> +       for (i = 0; i < 4; i++) {
> +               checksum += (cmd1 >> (i * 8)) & 0xFF;
> +               checksum += (cmd2 >> (i * 8)) & 0xFF;
> +       }
> +
> +       cmd2 |= checksum << ((2 - length) * 8);
> +
> +       /* Init OCB */

You should mention what OCB means in your documentation.

> +       rc = driver->bus_ops.putscom(driver->bus, OCB_STATUS_CONTROL_OR,
> +                                    OCB_OR_INIT0, OCB_OR_INIT1);
> +       if (rc)
> +               goto err;
> +

> +int occ_set_user_powercap(struct occ *occ, u16 cap)
> +{
> +       u8 resp[8];
> +
> +       cap = cpu_to_be16(cap);
> +
> +       return occ_send_cmd(occ, 0, OCC_SET_USER_POWR_CAP, 2, (const u8 *)&cap,
> +                           resp);
> +}
> +EXPORT_SYMBOL(occ_set_user_powercap);
> +
> +struct occ *occ_start(struct device *dev, void *bus,

>From what I can tell this doesn't start anything. Call it occ_init()
or something.

> +                     struct occ_bus_ops *bus_ops, const struct occ_ops *ops,
> +                     const struct occ_config *config)

Create a structure with all of these details in it. Some of them don't
need to be broken out into their own, for instance:

struct occ *occ_start(struct device *dev, const struct occ_init_context *init)
{

   driver->dev = dev;
   driver->bus = init->bus;
   driver->bus_read = init->bus_read;
   driver->bus_write = init->bus_write;
   driver->config = init->config;
   driver->cmd_addr = init->cmd_addr;

etc.



> +{
> +       struct occ *driver = devm_kzalloc(dev, sizeof(struct occ), GFP_KERNEL);
> +
> +       if (!driver)
> +               return ERR_PTR(-ENOMEM);
> +
> +       driver->dev = dev;
> +       driver->bus = bus;
> +       driver->bus_ops = *bus_ops;
> +       driver->ops = *ops;
> +       driver->config = *config;
> +       driver->raw_data = devm_kzalloc(dev, OCC_DATA_MAX, GFP_KERNEL);
> +       if (!driver->raw_data)
> +               return ERR_PTR(-ENOMEM);
> +
> +       mutex_init(&driver->update_lock);
> +
> +       return driver;
> +}
> +EXPORT_SYMBOL(occ_start);
> +
> +MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
> +MODULE_DESCRIPTION("OCC hwmon core driver");
> +MODULE_LICENSE("GPL");

> diff --git a/drivers/hwmon/occ/scom.h b/drivers/hwmon/occ/scom.h
> new file mode 100644
> index 0000000..b0691f3
> --- /dev/null
> +++ b/drivers/hwmon/occ/scom.h
> @@ -0,0 +1,47 @@
> +/*
> + * scom.h - hwmon OCC driver
> + *
> + * This file contains data structures for scom operations to the OCC

Are these really SCOM operations?

I think they're better described read and write callbacks, as the
operation is may be talking i2c or FSI or in the future some other
kind of access.

They do take scom addresses as parameters, so I can see the argument
for calling them getscom/putscom.


> + *
> + * Copyright 2016 IBM Corp.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef __SCOM_H__
> +#define __SCOM_H__
> +
> +/*
> + * occ_bus_ops - represent the low-level transfer methods to communicate with
> + * the OCC.
> + *
> + * getscom - OCC scom read
> + * @bus: handle to slave device
> + * @address: address
> + * @data: where to store data read from slave; buffer size must be at least
> + * eight bytes.

Are there situations where it's more than 8 bytes?

Would it be safer to add a length argument so the read call so we
don't put more data in the buffer than the caller expects?


> + *
> + * Returns 0 on success or a negative errno on error
> + *
> + * putscom - OCC scom write
> + * @bus: handle to slave device
> + * @address: address
> + * @data0: first data word to write
> + * @data1: second data word to write
> + *
> + * Returns 0 on success or a negative errno on error
> + */
> +struct occ_bus_ops {
> +       int (*getscom)(void *bus, u32 address, u64 *data);
> +       int (*putscom)(void *bus, u32 address, u32 data0, u32 data1);
> +};
> +
> +#endif /* __SCOM_H__ */
