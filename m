Return-path: <Mahoda.Ratnayaka@alliedtelesis.co.nz>
From: Mahoda Ratnayaka <Mahoda.Ratnayaka@alliedtelesis.co.nz>
To: Guenter Roeck <linux@roeck-us.net>
CC: Jean Delvare <jdelvare@suse.com>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, Chris Packham
	<Chris.Packham@alliedtelesis.co.nz>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (lm87) Add channel data from the dts file.
Date: Wed, 7 Sep 2016 00:17:01 +0000
Message-ID: <1473207421452.19824@alliedtelesis.co.nz>
References: <20160905053614.7135-1-mahoda.ratnayaka@alliedtelesis.co.nz>,<20160906172040.GA18235@roeck-us.net>
In-Reply-To: <20160906172040.GA18235@roeck-us.net>
Content-Language: en-NZ
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>

Thanks Guenter for the comments, I'll first update the lm87 Documentation t=
o include the=0A=
device tree information and then I'll update the documentation with my prop=
osed update along =0A=
with the updated patch for reading the property in the driver.=0A=
=0A=
Thanks,=0A=
Mahoda=0A=
________________________________________=0A=
From: linux-hwmon-owner@vger.kernel.org <linux-hwmon-owner@vger.kernel.org>=
 on behalf of Guenter Roeck <linux@roeck-us.net>=0A=
Sent: Wednesday, 7 September 2016 5:20 a.m.=0A=
To: Mahoda Ratnayaka=0A=
Cc: Jean Delvare; linux-hwmon@vger.kernel.org; Chris Packham=0A=
Subject: Re: [PATCH] hwmon: (lm87) Add channel data from the dts file.=0A=
=0A=
On Mon, Sep 05, 2016 at 05:36:14PM +1200, Mahoda Ratnayaka wrote:=0A=
> Currently there is no method for setting the channel=0A=
> value from the DTS file. When, the driver uses a dts=0A=
> file to initialize the driver platform_data is not set.=0A=
> As a the result channel variable may not be set correctly.=0A=
>=0A=
> Without the channel variable set correctly, some of the=0A=
> sensors will not be initialized correctly. For example=0A=
> temp3 sensor sysfs entries.=0A=
>=0A=
> This adds the required functionality to set the channel=0A=
> variable from the DTS file. This is done via reading the=0A=
> reading a property named "channel" from the lm87 driver.=0A=
>=0A=
Devicetree properties need to be documented and approved by devicetree=0A=
maintainers.=0A=
=0A=
> Signed-off-by: Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>=0A=
> ---=0A=
>  drivers/hwmon/lm87.c | 13 ++++++++++++-=0A=
>  1 file changed, 12 insertions(+), 1 deletion(-)=0A=
>=0A=
> diff --git a/drivers/hwmon/lm87.c b/drivers/hwmon/lm87.c=0A=
> index a5e2958..ac0018b 100644=0A=
> --- a/drivers/hwmon/lm87.c=0A=
> +++ b/drivers/hwmon/lm87.c=0A=
> @@ -858,14 +858,25 @@ static void lm87_remove_files(struct i2c_client *cl=
ient)=0A=
>  static void lm87_init_client(struct i2c_client *client)=0A=
>  {=0A=
>       struct lm87_data *data =3D i2c_get_clientdata(client);=0A=
> +     struct device_node *np =3D NULL;=0A=
> +     const char *channel =3D NULL;=0A=
> +     u8 val;=0A=
>=0A=
> -     if (dev_get_platdata(&client->dev)) {=0A=
> +     np =3D client->dev.of_node;=0A=
> +=0A=
> +     /* Use value read from the dts file to setup channel value. */=0A=
=0A=
Isn't that obvious from the code ?=0A=
=0A=
> +     if (np && of_property_read_u8(np, "channels", &val) =3D=3D 0) {=0A=
=0A=
When using a function, you need to include the file declaring it,=0A=
in this case linux/of.h. of_property_read_u8( )already checks for=0A=
np =3D=3D NULL, so there is no need to check it here. Instead of "=3D=3D 0"=
,=0A=
please use "!".=0A=
=0A=
> +             data->channel =3D val;=0A=
> +             lm87_write_value(client,=0A=
> +                              LM87_REG_CHANNEL_MODE, data->channel);=0A=
> +     } else if (dev_get_platdata(&client->dev)) {=0A=
>               data->channel =3D *(u8 *)dev_get_platdata(&client->dev);=0A=
>               lm87_write_value(client,=0A=
>                                LM87_REG_CHANNEL_MODE, data->channel);=0A=
>       } else {=0A=
>               data->channel =3D lm87_read_value(client, LM87_REG_CHANNEL_=
MODE);=0A=
>       }=0A=
> +=0A=
=0A=
Please no unnecessary whitespace changes.=0A=
=0A=
>       data->config =3D lm87_read_value(client, LM87_REG_CONFIG) & 0x6F;=
=0A=
>=0A=
>       if (!(data->config & 0x01)) {=0A=
> --=0A=
> 2.9.3=0A=
>=0A=
> --=0A=
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in=
=0A=
> the body of a message to majordomo@vger.kernel.org=0A=
> More majordomo info at  http://vger.kernel.org/majordomo-info.html=0A=
--=0A=
To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in=
=0A=
the body of a message to majordomo@vger.kernel.org=0A=
More majordomo info at  http://vger.kernel.org/majordomo-info.html=0A=
