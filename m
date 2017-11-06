Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:43033 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750739AbdKFGGi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 6 Nov 2017 01:06:38 -0500
MIME-Version: 1.0
In-Reply-To: <99527fe0-7101-dfa2-e8d8-c01598b82c13@roeck-us.net>
References: <1509604438-19959-1-git-send-email-mine260309@gmail.com>
 <1509604438-19959-2-git-send-email-mine260309@gmail.com> <99527fe0-7101-dfa2-e8d8-c01598b82c13@roeck-us.net>
From: Lei YU <mine260309@gmail.com>
Date: Mon, 6 Nov 2017 14:06:37 +0800
Message-ID: <CAARXrtmKHKa3jMcKfwTWNpmQs1u3BRqYEAEie2bZppvw-gx1xA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drivers: hwmon: Add W83773G driver
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Nickolaus Gruendler <ngruend@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Guenter,

Thanks a lot for the detailed review.

I will try to fix all the comments and send v2 patch.

On Sun, Nov 5, 2017 at 3:30 AM, Guenter Roeck <linux@roeck-us.net> wrote:
> On 11/01/2017 11:33 PM, Lei YU wrote:
>>
>> Nuvoton W83773G is a hardware monitor IC providing one local
>> temperature and two remote temperature sensors.
>>
>
> I agree that a separate driver for this chip make sense.
> Some work to do, though. This is only an initial review; later versions
> will probably trigger additional feedback.
>
> Please provide a register dump for the chip so I can write a unit test.

The dump of registers:
```
# i2cdump -y 12 0x4c
No size specified (using byte-data access)
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
00: 1b 17 00 01 05 46 d8 46 d8 ff ff ff ff ff ff ff    ??.??F?F?.......
10: 40 00 00 00 00 00 00 00 00 6e 6e 46 d8 00 00 ff    @........nnF?...
20: 55 0a ff ff 18 00 ff ff ff ff ff ff ff ff ff ff    U?..?...........
30: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
40: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
50: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
60: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
70: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
90: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff 00    ................
c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
e0: 00 00 00 84 84 84 00 00 55 00 00 ff ff ff ff ff    ...???..U.......
f0: 08 00 00 00 84 00 00 17 80 fc 17 83 18 ff 5c 11    ?...?..??????.\?
```
>
>> Signed-off-by: Lei YU <mine260309@gmail.com>
>> ---
>>   drivers/hwmon/Kconfig   |  11 ++
>>   drivers/hwmon/Makefile  |   1 +
>>   drivers/hwmon/w83773g.c | 276
>> ++++++++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 288 insertions(+)
>>   create mode 100644 drivers/hwmon/w83773g.c
>>
>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>> index d654314..d148b70 100644
>> --- a/drivers/hwmon/Kconfig
>> +++ b/drivers/hwmon/Kconfig
>> @@ -1710,6 +1710,17 @@ config SENSORS_VT8231
>>           This driver can also be built as a module.  If so, the module
>>           will be called vt8231.
>>   +config SENSORS_W83773G
>> +       tristate "Nuvoton W83773G"
>> +       depends on I2C
>> +       select HWMON_VID
>
>
> Why ?
>
>
>> +       help
>> +         If you say yes here you get support for the Nuvoton W83773G
>> hardware
>> +         monitoring chip.
>> +
>> +         This driver can also be built as a module.  If so, the module
>> +         will be called w83773g.
>> +
>>   config SENSORS_W83781D
>>         tristate "Winbond W83781D, W83782D, W83783S, Asus AS99127F"
>>         depends on I2C
>> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
>> index c84d978..0649ad8 100644
>> --- a/drivers/hwmon/Makefile
>> +++ b/drivers/hwmon/Makefile
>> @@ -13,6 +13,7 @@ obj-$(CONFIG_SENSORS_ATK0110) += asus_atk0110.o
>>   # asb100, then w83781d go first, as they can override other drivers'
>> addresses.
>>   obj-$(CONFIG_SENSORS_ASB100)  += asb100.o
>>   obj-$(CONFIG_SENSORS_W83627HF)        += w83627hf.o
>> +obj-$(CONFIG_SENSORS_W83773G)  += w83773g.o
>>   obj-$(CONFIG_SENSORS_W83792D) += w83792d.o
>>   obj-$(CONFIG_SENSORS_W83793)  += w83793.o
>>   obj-$(CONFIG_SENSORS_W83795)  += w83795.o
>> diff --git a/drivers/hwmon/w83773g.c b/drivers/hwmon/w83773g.c
>> new file mode 100644
>> index 0000000..16d5fa0
>> --- /dev/null
>> +++ b/drivers/hwmon/w83773g.c
>> @@ -0,0 +1,276 @@
>> +/*
>> + * Copyright (C) 2017 IBM Corp.
>> + *
>
>
> This and the module author note below suggests that the driver was written
> by someone else, yet there is no credit. Do you have permission from IBM
> and from the author to publish this driver ?

Yes. I work for IBM. And this driver is originally written by
Nickolaus Gruendler
based on tmp421.c. He primary works on HW part and has not too much
knowledge about SW.
And I helped tweak the code to make it work. So I think the author
should be him.

Please be noted that I am also new comer for kernel development and really
appreciate your careful review and comments.

>
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>
> extra comment line
>
>> + */
>> +
>> +/*
>> + * Driver for the Nuvoton W83773G SMBus temperature sensor IC.
>> + * Supported models: W83773G
>
>
> Double comment.
>
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/init.h>
>> +#include <linux/slab.h>
>> +#include <linux/jiffies.h>
>> +#include <linux/i2c.h>
>> +#include <linux/hwmon.h>
>> +#include <linux/hwmon-sysfs.h>
>> +#include <linux/err.h>
>> +#include <linux/mutex.h>
>> +#include <linux/of_device.h>
>> +#include <linux/sysfs.h>
>
>
> sysfs includes are unnecessary.
>
>> +
>> +/* Addresses to scan */
>> +static const unsigned short normal_i2c[] = { 0x4c, 0x4d, I2C_CLIENT_END
>> };
>> +
>> +enum chips { w83773g };
>> +
>
> The driver only supports one chip. This is unnecessary.
>
>> +/* The W83773 registers */
>> +#define W83773_CONVERSION_RATE_REG_READ 0x04
>> +#define W83773_CONVERSION_RATE_REG_WRITE 0x0A
>> +#define W83773_MANUFACTURER_ID_REG 0xFE
>> +#define W83773_LOCAL_TEMP 0x00
>
>
> Please use tabs.
>
>> +
>> +static const u8 W83773_STATUS[2] = { 0x02, 0x17 };
>> +
>> +static const u8 W83773_TEMP_LSB[2] = { 0x10, 0x25 };
>> +static const u8 W83773_TEMP_MSB[2] = { 0x01, 0x24 };
>> +
>> +static const u8 W83773_OFFSET_LSB[2] = { 0x12, 0x16 };
>> +static const u8 W83773_OFFSET_MSB[2] = { 0x11, 0x15 };
>> +
>> +/* Manufacturer / Device ID's */
>> +#define W83773_MANUFACTURER_ID                 0x5c
>> +
>> +
>
> extra empty line
>
>> +/* this is the number of sensors in the device */
>> +static const struct i2c_device_id w83773_id[] = {
>> +       { "w83773g", 3 },
>
>
> The 3 is pointless. There are always three channels.
>
>> +       { }
>> +};
>> +
>> +MODULE_DEVICE_TABLE(i2c, w83773_id);
>> +
>> +static const struct of_device_id w83773_of_match[] = {
>> +       {
>> +               .compatible = "nuvoton,w83773g",
>> +               .data = (void *)3
>
>
> Same here.
>
>> +       },
>> +
>> +       { },
>> +};
>> +MODULE_DEVICE_TABLE(of, w83773_of_match);
>> +
>> +/*
>> + * W83773G has 3 temp sensors:
>> + *   Channel 0 is the local sensor
>> + *   Channel 1-2 are two remote sensors
>> + */
>> +struct w83773_data {
>> +       struct i2c_client *client;
>> +       struct mutex update_lock;
>> +       u32 temp_config[4];
>> +       struct hwmon_channel_info temp_info;
>> +       const struct hwmon_channel_info *info[2];
>> +       struct hwmon_chip_info chip;
>
>
> AFAICS the channel and chip information is all static.
> I don't see a reason for keeping it as variables.
>
>> +       bool valid;
>> +       unsigned long last_updated;
>> +       int channels;
>> +       s8 temp_local;
>> +       s8 status[2];
>> +       s8 temp_hb[2];
>> +       s8 temp_lb[2];
>> +       s8 offset_hb[2];
>> +       s8 offset_lb[2];
>
>
> Please drop register caching in the driver. Use regmap to cache non-volatile
> registers.
>
>> +};
>> +
>> +static long temp_of_local(s8 reg)
>> +{
>> +       return reg * 1000;
>> +}
>> +
>> +static long temp_of_remote(s8 hb, s8 lb, s8 offset_hb, s8 offset_lb)
>> +{
>> +       return (hb + offset_hb) * 1000 + ((u8)(lb + offset_lb) >> 5) *
>> 125;
>
>
> This is wrong. The chip applies offsets internally, and reports adjusted
> temperatures
> in its temperature registers.
>
>> +}
>> +
>> +
>> +static struct w83773_data *w83773_update_device(struct device *dev)
>> +{
>> +       struct w83773_data *data = dev_get_drvdata(dev);
>> +       struct i2c_client *client = data->client;
>> +       int i;
>> +
>
>
> As mentioned above, please drop the local cache and use regmap to cache
> non-volatile registers.
>
>
>> +       mutex_lock(&data->update_lock);
>> +
>> +       if (time_after(jiffies, data->last_updated + 2 * HZ) ||
>> !data->valid) {
>> +               data->temp_local = i2c_smbus_read_byte_data(client,
>> W83773_LOCAL_TEMP);
>> +               for (i = 0; i < data->channels - 1; i++) {
>> +                       data->status[i] = i2c_smbus_read_byte_data(client,
>> W83773_STATUS[i]);
>> +                       data->temp_hb[i] =
>> i2c_smbus_read_byte_data(client, W83773_TEMP_MSB[i]);
>> +                       data->temp_lb[i] =
>> i2c_smbus_read_byte_data(client, W83773_TEMP_LSB[i]);
>> +                       data->offset_hb[i] =
>> i2c_smbus_read_byte_data(client, W83773_OFFSET_MSB[i]);
>> +                       data->offset_lb[i] =
>> i2c_smbus_read_byte_data(client, W83773_OFFSET_LSB[i]);
>> +               }
>> +               data->last_updated = jiffies;
>> +               data->valid = true;
>> +       }
>> +
>> +       mutex_unlock(&data->update_lock);
>> +
>> +       return data;
>> +}
>> +
>> +static int w83773_read(struct device *dev, enum hwmon_sensor_types type,
>> +                       u32 attr, int channel, long *val)
>> +{
>> +       struct w83773_data *w83773 = w83773_update_device(dev);
>> +
>> +       switch (attr) {
>> +       case hwmon_temp_input:
>> +               if (channel == 0) {
>> +                       /* channel 0 is the local temp */
>> +                       *val = temp_of_local(w83773->temp_local);
>> +               }
>> +               else {
>
>
> Please run checkpatch --strict on your patch and follow kernel coding
> style.
>
>> +                       /* channel 1-2 are the remote temps */
>> +                       channel--;
>> +                       *val = temp_of_remote(
>> +                               w83773->temp_hb[channel],
>> +                               w83773->temp_lb[channel],
>> +                               w83773->offset_hb[channel],
>> +                               w83773->offset_lb[channel]);
>> +               }
>> +               return 0;
>
>
> Missing:
>         hwmon_temp_offset
>         hwmon_chip_update_interval (for conversion rate)
>
> Both attributes should be writable.
>
>> +       case hwmon_temp_fault:
>> +               if (channel == 0)
>> +                       *val = 0;
>
>
> Should never get here. Channel 0 does not report faults, and there should be
> no fault attribute for that channel.
>
>> +               else
>> +                       /* Check the status register bit 2 for faults */
>> +                       *val = (w83773->status[channel - 1] & 0x04) >> 2;
>> +               return 0;
>> +       default:
>> +               return -EOPNOTSUPP;
>> +       }
>> +
>> +}
>> +
>> +static umode_t w83773_is_visible(const void *data, enum
>> hwmon_sensor_types type,
>> +                                u32 attr, int channel)
>> +{
>> +       switch (attr) {
>> +       case hwmon_temp_fault:
>> +               if (channel == 0)
>> +                       return 0;
>> +               return S_IRUGO;
>> +       case hwmon_temp_input:
>> +               return S_IRUGO;
>
>
> Symbolic permissions ran out of favor. checkpatch will tell you.
>
>> +       default:
>> +               return 0;
>> +       }
>> +}
>> +
>> +static int w83773_init_client(struct i2c_client *client)
>> +{
>> +       /* Set the conversion rate to 2 Hz */
>> +       i2c_smbus_write_byte_data(client,
>> W83773_CONVERSION_RATE_REG_WRITE, 0x05);
>> +
>> +       return 0;
>> +}
>> +
>> +static int w83773_detect(struct i2c_client *client,
>> +                        struct i2c_board_info *info)
>> +{
>> +       enum chips kind;
>> +       struct i2c_adapter *adapter = client->adapter;
>> +       const char * const names[] = { "W83773G" };
>> +       u8 reg;
>> +
>> +       if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA))
>> +               return -ENODEV;
>> +
>> +       reg = i2c_smbus_read_byte_data(client,
>> W83773_MANUFACTURER_ID_REG);
>> +       if (reg != W83773_MANUFACTURER_ID)
>> +               return -ENODEV;
>> This is insufficient for automatic detection. Also check RDR and at least
>
> the configuration register.
>
> There does not seem to be a reliable means to distinguish the chip from
> W83775G. Given that, I wonder if a detect function even makes sense;
> I seriously doubt it. Does your application require it ? If not I would
> suggest to drop the detect function.
>
>> +       reg = i2c_smbus_read_byte_data(client,
>> W83773_CONVERSION_RATE_REG_READ);
>> +       if (reg & 0xf8)
>> +               return -ENODEV;
>> +
>
> Bit 3 (8) is valid.
>
>> +       kind = w83773g;
>> +
>> +       strlcpy(info->type, w83773_id[kind].name, I2C_NAME_SIZE);
>> +       dev_info(&adapter->dev, "Detected Nuvoton %s chip at 0x%02x\n",
>> +                names[kind], client->addr);
>
>
> All this kind stuff is unnecessary.
>
>
>> +
>> +       return 0;
>> +}
>> +
>> +static const struct hwmon_ops w83773_ops = {
>> +       .is_visible = w83773_is_visible,
>> +       .read = w83773_read,
>> +};
>> +
>> +static int w83773_probe(struct i2c_client *client,
>> +                       const struct i2c_device_id *id)
>> +{
>> +       struct device *dev = &client->dev;
>> +       struct device *hwmon_dev;
>> +       struct w83773_data *data;
>> +       int i, err;
>> +
>> +       data = devm_kzalloc(dev, sizeof(struct w83773_data), GFP_KERNEL);
>> +       if (!data)
>> +               return -ENOMEM;
>> +
>> +       mutex_init(&data->update_lock);
>> +       if (client->dev.of_node)
>> +               data->channels =
>> (int)of_device_get_match_data(&client->dev);
>> +       else
>> +               data->channels = id->driver_data;
>
>
> channels is fixed. No need to keep it as variable; a define is just as good.
>
>
>> +       data->client = client;
>> +
>> +       err = w83773_init_client(client);
>> +       if (err)
>> +               return err;
>> +
>> +       for (i = 0; i < data->channels; i++)
>> +               data->temp_config[i] = HWMON_T_INPUT | HWMON_T_FAULT;
>> +
>> +       data->chip.ops = &w83773_ops;
>> +       data->chip.info = data->info;
>> +
>> +       data->info[0] = &data->temp_info;
>> +
>> +       data->temp_info.type = hwmon_temp;
>> +       data->temp_info.config = data->temp_config;
>> +
>> +       hwmon_dev = devm_hwmon_device_register_with_info(dev,
>> client->name,
>> +                                                        data,
>> +                                                        &data->chip,
>> +                                                        NULL);
>> +       return PTR_ERR_OR_ZERO(hwmon_dev);
>> +}
>> +
>> +static struct i2c_driver w83773_driver = {
>> +       .class = I2C_CLASS_HWMON,
>> +       .driver = {
>> +               .name   = "w83773g",
>> +               .of_match_table = of_match_ptr(w83773_of_match),
>> +       },
>> +       .probe = w83773_probe,
>> +       .id_table = w83773_id,
>> +       .detect = w83773_detect,
>> +       .address_list = normal_i2c,
>> +};
>> +
>> +module_i2c_driver(w83773_driver);
>> +
>> +MODULE_AUTHOR("Nickolaus Gruendler <ngruend@us.ibm.com>");
>
>
> Does Nickolaus know about the use of his name and e-mail address
> and give permission ?
>
>
>> +MODULE_DESCRIPTION("W83773G temperature sensor driver");
>> +MODULE_LICENSE("GPL");
>>
>
