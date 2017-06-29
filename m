Return-Path: <prvs=0353794c29=mike.looijmans@topicproducts.com>
Return-path: <prvs=0353794c29=mike.looijmans@topicproducts.com>
Subject: Re: [PATCH] hwmon: Add LTC2471/LTC2473 driver
To: Frans Klaver <fransklaver@gmail.com>
CC: <linux-hwmon@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	<jdelvare@suse.com>
References: <1498733135-4729-1-git-send-email-mike.looijmans@topic.nl>
 <CAH6sp9PPO1W3Km7-YbayrP=rbHtVDr4NCu-o4ZvC0UsCEXgyxQ@mail.gmail.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Message-ID: <c404694e-fd81-e4e4-569d-9438118f8be8@topic.nl>
Date: Thu, 29 Jun 2017 13:30:46 +0200
MIME-Version: 1.0
In-Reply-To: <CAH6sp9PPO1W3Km7-YbayrP=rbHtVDr4NCu-o4ZvC0UsCEXgyxQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: nl
Content-Transfer-Encoding: quoted-printable
List-ID: <linux-hwmon@vger.kernel.org>

=EF=BB=BFOn 29-06-17 13:18, Frans Klaver wrote:
> On Thu, Jun 29, 2017 at 12:45 PM, Mike Looijmans
> <mike.looijmans@topic.nl> wrote:
>> The LTC2741 and LTC2473 are single voltage monitoring chips. The LTC2473
>> is similar to the LTC2471 but outputs a signed differential value.
>>
>> Datasheet:
>>    http://cds.linear.com/docs/en/datasheet/24713fb.pdf
>>
>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>> ---
>>   drivers/hwmon/Kconfig   |  10 ++++
>>   drivers/hwmon/Makefile  |   1 +
>>   drivers/hwmon/ltc2471.c | 127 ++++++++++++++++++++++++++++++++++++++++=
++++++++
>>   3 files changed, 138 insertions(+)
>>   create mode 100644 drivers/hwmon/ltc2471.c
>>
>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>> index fbde226..c9a2a87 100644
>> --- a/drivers/hwmon/Kconfig
>> +++ b/drivers/hwmon/Kconfig
>> @@ -673,6 +673,16 @@ config SENSORS_LINEAGE
>>            This driver can also be built as a module.  If so, the module
>>            will be called lineage-pem.
>>
>> +config SENSORS_LTC2471
>> +       tristate "Linear Technology LTC2471 and LTC2473"
>> +       depends on I2C
>> +       help
>> +         If you say yes here you get support for Linear Technology LTC2=
471
>> +         and LTC2473 voltage monitors.
>> +
>> +         This driver can also be built as a module. If so, the module w=
ill
>> +         be called ltc2471.
>> +
>>   config SENSORS_LTC2945
>>          tristate "Linear Technology LTC2945"
>>          depends on I2C
>> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
>> index 58cc3ac..6f60fe7 100644
>> --- a/drivers/hwmon/Makefile
>> +++ b/drivers/hwmon/Makefile
>> @@ -99,6 +99,7 @@ obj-$(CONFIG_SENSORS_LM93)    +=3D lm93.o
>>   obj-$(CONFIG_SENSORS_LM95234)  +=3D lm95234.o
>>   obj-$(CONFIG_SENSORS_LM95241)  +=3D lm95241.o
>>   obj-$(CONFIG_SENSORS_LM95245)  +=3D lm95245.o
>> +obj-$(CONFIG_SENSORS_LTC2471)  +=3D ltc2471.o
>>   obj-$(CONFIG_SENSORS_LTC2945)  +=3D ltc2945.o
>>   obj-$(CONFIG_SENSORS_LTC2990)  +=3D ltc2990.o
>>   obj-$(CONFIG_SENSORS_LTC4151)  +=3D ltc4151.o
>> diff --git a/drivers/hwmon/ltc2471.c b/drivers/hwmon/ltc2471.c
>> new file mode 100644
>> index 0000000..17eaad8
>> --- /dev/null
>> +++ b/drivers/hwmon/ltc2471.c
>> @@ -0,0 +1,127 @@
>> +/*
>> + * Driver for Linear Technology LTC2471 and LTC2473 voltage monitors
>> + * The LTC2473 is identical to the 2471, but reports a differential sig=
nal.
>> + *
>> + * Copyright (C) 2017 Topic Embedded Products
>> + * Author: Mike Looijmans <mike.looijmans@topic.nl>
>> + *
>> + * License: GPLv2
>> + */
>> +
>> +#include <linux/err.h>
>> +#include <linux/hwmon.h>
>> +#include <linux/hwmon-sysfs.h>
>> +#include <linux/i2c.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +
>> +enum chips {
>> +       ltc2471,
>> +       ltc2473
>> +};
>> +
>> +struct ltc2471_data {
>> +       struct i2c_client *i2c;
>> +       bool differential;
>> +};
>=20
> I haven't checked if there are similar drivers, but how about
> ltc247x_data? It's a bit odd to tie all naming in this driver to one
> chip and then support another one as well.

Did a query on the linear site, found the LTC2470 and LTC2472 which appear =
to=20
be the SPI versions of the same chip. So yes, using "ltc247x" may cause=20
confusion when other drivers arrive. Linear solves this by naming the=20
datasheet "ltc24712" but I think that'd be even more confusing.

>=20
>> +
>> +/* Reference voltage is 1.25V */
>> +#define LTC2471_VREF 1250
>> +
>> +/* Read two bytes from the I2C bus to obtain the ADC result */
>> +static int ltc2471_get_value(struct i2c_client *i2c)
>> +{
>> +       int ret;
>> +       __be16 buf;
>> +
>> +       ret =3D i2c_master_recv(i2c, (char *)&buf, 2);
>> +       if (ret < 0)
>> +               return ret;
>> +       if (ret !=3D 2)
>> +               return -EIO;
>> +
>> +       /* MSB first */
>> +       return be16_to_cpu(buf);
>> +}
>> +
>> +static ssize_t ltc2471_show_value(struct device *dev,
>> +                                 struct device_attribute *da, char *buf=
)
>> +{
>> +       struct ltc2471_data *data =3D dev_get_drvdata(dev);
>> +       int value;
>> +
>> +       value =3D ltc2471_get_value(data->i2c);
>> +       if (unlikely(value < 0))
>> +               return value;
>> +
>> +       if (data->differential)
>> +               /* Ranges from -VREF to +VREF with "0" at 0x8000 */
>> +               value =3D ((s32)LTC2471_VREF * (s32)(value - 0x8000)) >>=
 15;
>> +       else
>> +               /* Ranges from 0 to +VREF */
>> +               value =3D ((u32)LTC2471_VREF * (u32)value) >> 16;
>> +
>> +       return snprintf(buf, PAGE_SIZE, "%d\n", value);
>> +}
>> +
>> +static SENSOR_DEVICE_ATTR(in0_input, S_IRUGO, ltc2471_show_value, NULL,=
 0);
>=20
> Octal permissions are preferred over S_IRUGO and such.

Uh, can elaborate on that, or give an example on what you mean by that rema=
rk?

A quick grep reveils that most (if not all) hwmon devices are currently usi=
ng=20
"S_IRUGO" and such.

>> +
>> +static struct attribute *ltc2471_attrs[] =3D {
>> +       &sensor_dev_attr_in0_input.dev_attr.attr,
>> +       NULL
>> +};
>> +
>> +ATTRIBUTE_GROUPS(ltc2471);
>> +
>> +static int ltc2471_i2c_probe(struct i2c_client *i2c,
>> +                            const struct i2c_device_id *id)
>> +{
>> +       int ret;
>> +       struct device *hwmon_dev;
>> +       struct ltc2471_data *data;
>> +
>> +       if (!i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C))
>> +               return -ENODEV;
>> +
>> +       data =3D devm_kzalloc(&i2c->dev, sizeof(struct ltc2471_data), GF=
P_KERNEL);
>=20
> sizeof(*data)

OK.

>=20
>> +       if (unlikely(!data))
>> +               return -ENOMEM;
>> +
>> +       data->i2c =3D i2c;
>> +       data->differential =3D (id->driver_data =3D=3D ltc2473);
>> +
>> +       /* Trigger once to start conversion and check if chip is there *=
/
>> +       ret =3D ltc2471_get_value(i2c);
>> +       if (ret < 0) {
>> +               dev_err(&i2c->dev, "Cannot read from device.\n");
>> +               return ret;
>> +       }
>> +
>> +       hwmon_dev =3D devm_hwmon_device_register_with_groups(&i2c->dev,
>> +                                                          i2c->name,
>> +                                                          data,
>> +                                                          ltc2471_group=
s);
>> +
>> +       return PTR_ERR_OR_ZERO(hwmon_dev);
>> +}
>> +
>> +static const struct i2c_device_id ltc2471_i2c_id[] =3D {
>> +       { "ltc2471", ltc2471 },
>> +       { "ltc2473", ltc2473 },
>> +       {}
>> +};
>> +MODULE_DEVICE_TABLE(i2c, ltc2471_i2c_id);
>> +
>> +static struct i2c_driver ltc2471_i2c_driver =3D {
>> +       .driver =3D {
>> +               .name =3D "ltc2471",
>> +       },
>> +       .probe    =3D ltc2471_i2c_probe,
>> +       .id_table =3D ltc2471_i2c_id,
>> +};
>> +
>> +module_i2c_driver(ltc2471_i2c_driver);
>> +
>> +MODULE_DESCRIPTION("LTC2471/LTC2473 Sensor Driver");
>> +MODULE_AUTHOR("Topic Embedded Products");
>> +MODULE_LICENSE("GPL v2");
>> --
>> 1.9.1
>>
>=20
> Frans
>=20



Kind regards,

Mike Looijmans
System Expert

TOPIC Products
Materiaalweg 4, NL-5681 RJ Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail
