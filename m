Return-Path: <Tony.OBrien@alliedtelesis.co.nz>
Return-path: <Tony.OBrien@alliedtelesis.co.nz>
From: Tony O'Brien <Tony.OBrien@alliedtelesis.co.nz>
To: Guenter Roeck <linux@roeck-us.net>, "jdelvare@suse.com"
	<jdelvare@suse.com>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (lm75) Add a basic interrupt handler
Date: Sun, 16 Jul 2017 21:51:24 +0000
Message-ID: <1500241884428.47941@alliedtelesis.co.nz>
References: <20170712025237.24163-1-tony.obrien@alliedtelesis.co.nz>,<fa3c3cb3-c71d-7118-9d48-7002e1788f99@roeck-us.net>
In-Reply-To: <fa3c3cb3-c71d-7118-9d48-7002e1788f99@roeck-us.net>
Content-Language: en-NZ
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>

Hi Guenter -=0A=
=0A=
The interrupt line the LM75 sits on is shared by other devices and therefor=
e cannot be disabled.  It was added in hardware as a possible feature can c=
annot be disconnected.=0A=
=0A=
Cheers,=0A=
=0A=
Tony O'Brien=0A=
Senior Software/Hardware Engineer=0A=
Allied Telesis Labs=0A=
27 Nazareth Avenue=0A=
Christchurch 8024=0A=
New Zealand=0A=
Ph: +64-3-339 3000=0A=
DDI: +64-3-339 9210=0A=
Web: http://AlliedTelesis.com=0A=
=0A=
=0A=
=0A=
________________________________________=0A=
From: Guenter Roeck <linux@roeck-us.net>=0A=
Sent: Sunday, 16 July 2017 12:42 p.m.=0A=
To: Tony O'Brien; jdelvare@suse.com; linux-hwmon@vger.kernel.org; linux-ker=
nel@vger.kernel.org=0A=
Subject: Re: [PATCH] hwmon: (lm75) Add a basic interrupt handler=0A=
=0A=
On 07/11/2017 07:52 PM, Tony O'Brien wrote:=0A=
> The LM75 interrupt cannot be masked in the device so an over-temperature=
=0A=
> event can cause an interrupt that cannot be cleared.=0A=
> Add an interrupt handler if an interrupt node exists in the DTS for an=0A=
> LM75.  The handler simply reads a device register to clear the interrupt=
=0A=
> and returns.=0A=
>=0A=
=0A=
Is this an actual problem ? If no interrupt handler is registered, the inte=
rrupt=0A=
should be disabled by the interrupt controller, and it should not matter if=
=0A=
the interrupt line from the chip is active or not.=0A=
=0A=
Thanks,=0A=
Guenter=0A=
=0A=
> Signed-off-by: Tony O'Brien <tony.obrien@alliedtelesis.co.nz>=0A=
> Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
> ---=0A=
>   drivers/hwmon/lm75.c | 28 ++++++++++++++++++++++++++++=0A=
>   drivers/hwmon/lm75.h |  1 +=0A=
>   2 files changed, 29 insertions(+)=0A=
>=0A=
> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c=0A=
> index 005ffb5ffa92..08a833e960aa 100644=0A=
> --- a/drivers/hwmon/lm75.c=0A=
> +++ b/drivers/hwmon/lm75.c=0A=
> @@ -22,6 +22,7 @@=0A=
>   #include <linux/init.h>=0A=
>   #include <linux/slab.h>=0A=
>   #include <linux/jiffies.h>=0A=
> +#include <linux/interrupt.h>=0A=
>   #include <linux/i2c.h>=0A=
>   #include <linux/hwmon.h>=0A=
>   #include <linux/hwmon-sysfs.h>=0A=
> @@ -265,6 +266,17 @@ static void lm75_remove(void *data)=0A=
>       i2c_smbus_write_byte_data(client, LM75_REG_CONF, lm75->orig_conf);=
=0A=
>   }=0A=
>=0A=
> +static irqreturn_t lm75_process_interrupt(int irq, void *data)=0A=
> +{=0A=
> +     struct i2c_client *client =3D (struct i2c_client *)data;=0A=
> +     int val;=0A=
> +=0A=
> +     /* Do a read to clear the interrupt */=0A=
> +     val =3D i2c_smbus_read_byte_data(client, LM75_REG_CONF);=0A=
> +=0A=
> +     return IRQ_HANDLED;=0A=
> +}=0A=
> +=0A=
>   static int=0A=
>   lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)=
=0A=
>   {=0A=
> @@ -275,6 +287,7 @@ lm75_probe(struct i2c_client *client, const struct i2=
c_device_id *id)=0A=
>       u8 set_mask, clr_mask;=0A=
>       int new;=0A=
>       enum lm75_type kind;=0A=
> +     int ret;=0A=
>=0A=
>       if (client->dev.of_node)=0A=
>               kind =3D (enum lm75_type)of_device_get_match_data(&client->=
dev);=0A=
> @@ -375,6 +388,21 @@ lm75_probe(struct i2c_client *client, const struct i=
2c_device_id *id)=0A=
>               break;=0A=
>       }=0A=
>=0A=
> +     if (client->irq) {=0A=
> +             /* If requesting an interrupt then set to interrupt mode */=
=0A=
> +             set_mask |=3D LM75_MODE_INTERRUPT;=0A=
> +             ret =3D devm_request_threaded_irq(dev, client->irq, NULL,=
=0A=
> +                                             lm75_process_interrupt,=0A=
> +                                             IRQF_TRIGGER_LOW | IRQF_ONE=
SHOT |=0A=
> +                                                     IRQF_SHARED,=0A=
> +                                             dev_name(dev),=0A=
> +                                             client);=0A=
> +             if (ret) {=0A=
> +                     dev_err(dev, "Error requesting irq\n");=0A=
> +                     return ret;=0A=
> +             }=0A=
> +     }=0A=
> +=0A=
>       /* configure as specified */=0A=
>       status =3D i2c_smbus_read_byte_data(client, LM75_REG_CONF);=0A=
>       if (status < 0) {=0A=
> diff --git a/drivers/hwmon/lm75.h b/drivers/hwmon/lm75.h=0A=
> index 5cde94e56f17..82a71d870331 100644=0A=
> --- a/drivers/hwmon/lm75.h=0A=
> +++ b/drivers/hwmon/lm75.h=0A=
> @@ -31,6 +31,7 @@=0A=
>   #define LM75_TEMP_MIN (-55000)=0A=
>   #define LM75_TEMP_MAX 125000=0A=
>   #define LM75_SHUTDOWN 0x01=0A=
> +#define LM75_MODE_INTERRUPT 0x02=0A=
>=0A=
>   /* TEMP: 0.001C/bit (-55C to +125C)=0A=
>      REG: (0.5C/bit, two's complement) << 7 */=0A=
>=0A=
=0A=
