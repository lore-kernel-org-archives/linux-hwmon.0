Return-path: <Mahoda.Ratnayaka@alliedtelesis.co.nz>
From: Mahoda Ratnayaka <Mahoda.Ratnayaka@alliedtelesis.co.nz>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring
	<robh+dt@kernel.org>
CC: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v2] lm87: Allow channel data to be set from dts file.
Date: Wed, 21 Sep 2016 21:58:36 +0000
Message-ID: <1474495115890.10563@alliedtelesis.co.nz>
References: <20160920052240.10242-1-mahoda.ratnayaka@alliedtelesis.co.nz>,<d3258440-db4e-a4c2-cca1-9683d0da63a8@roeck-us.net>
In-Reply-To: <d3258440-db4e-a4c2-cca1-9683d0da63a8@roeck-us.net>
Content-Language: en-NZ
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>

Thanks Guenter for the reply, I'll update things as you suggested and send =
the patches back again. I'll try to get the documentation approved first an=
d then send back the lm87 driver update patch.=0A=
=0A=
Thanks,=0A=
Mahoda=0A=
________________________________________=0A=
From: linux-hwmon-owner@vger.kernel.org <linux-hwmon-owner@vger.kernel.org>=
 on behalf of Guenter Roeck <linux@roeck-us.net>=0A=
Sent: Tuesday, 20 September 2016 9:55 p.m.=0A=
To: Mahoda Ratnayaka; Jean Delvare; linux-hwmon@vger.kernel.org; devicetree=
@vger.kernel.org; Rob Herring=0A=
Cc: Chris Packham=0A=
Subject: Re: [PATCH v2] lm87: Allow channel data to be set from dts file.=
=0A=
=0A=
On 09/19/2016 10:22 PM, Mahoda Ratnayaka wrote:=0A=
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
> Signed-off-by: Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>=0A=
> ---=0A=
>=0A=
> Notes:=0A=
>      changes since v1:=0A=
>      Removed unncessary variables channel and np.=0A=
>      Update the code as per review comments.=0A=
>=0A=
>  Documentation/devicetree/bindings/hwmon/lm87.txt | 9 +++++++++=0A=
>  drivers/hwmon/lm87.c                             | 7 ++++++-=0A=
>  2 files changed, 15 insertions(+), 1 deletion(-)=0A=
>=0A=
> diff --git a/Documentation/devicetree/bindings/hwmon/lm87.txt b/Documenta=
tion/devicetree/bindings/hwmon/lm87.txt=0A=
> index fefcb48..1906e08 100644=0A=
> --- a/Documentation/devicetree/bindings/hwmon/lm87.txt=0A=
> +++ b/Documentation/devicetree/bindings/hwmon/lm87.txt=0A=
> @@ -6,9 +6,18 @@ Required properties:=0A=
>=0A=
>  - reg: I2C address=0A=
>=0A=
> +optional properties:=0A=
> +- channels: Value for the channel mode register.=0A=
> +            This allows configuration of pins with=0A=
> +            selectable uses on the LM87 device (e.g.=0A=
> +            choosing between voltage and temperature=0A=
> +            inputs).=0A=
> +            See hwmon/lm87 for further information=0A=
=0A=
Rob is the ultimate person to comment here, but I think the property descri=
ption=0A=
by itself should be complete and technically independent of the implementat=
ion.=0A=
Documentation/hwmon/lm87 describes the implementation, so an (incomplete)=
=0A=
reference to it seems inappropriate.=0A=
=0A=
> +=0A=
>  Example:=0A=
>=0A=
>  lm87@2e {=0A=
>       compatible =3D "ti,lm87";=0A=
>       reg =3D <0x2e>;=0A=
> +     channels=3D<0x4>;=0A=
>  };=0A=
=0A=
Please move those property descriptions into the first patch. It is confusi=
ng=0A=
to have two patches touching the properties, and the first patch as it is r=
ight now=0A=
is really useless.=0A=
=0A=
> diff --git a/drivers/hwmon/lm87.c b/drivers/hwmon/lm87.c=0A=
> index a5e2958..358c1d4 100644=0A=
> --- a/drivers/hwmon/lm87.c=0A=
> +++ b/drivers/hwmon/lm87.c=0A=
> @@ -858,8 +858,13 @@ static void lm87_remove_files(struct i2c_client *cli=
ent)=0A=
>  static void lm87_init_client(struct i2c_client *client)=0A=
>  {=0A=
>       struct lm87_data *data =3D i2c_get_clientdata(client);=0A=
> +     u8 val =3D 0;=0A=
>=0A=
> -     if (dev_get_platdata(&client->dev)) {=0A=
> +     if (!of_property_read_u8(client->dev.of_node, "channels", &val)) {=
=0A=
=0A=
This ignores property value errors (-ENODATA, -EOVERFLOW).=0A=
Is this what you want ?=0A=
=0A=
> +             data->channel =3D val;=0A=
> +             lm87_write_value(client,=0A=
> +                              LM87_REG_CHANNEL_MODE, data->channel);=0A=
> +     } else if (dev_get_platdata(&client->dev)) {=0A=
>               data->channel =3D *(u8 *)dev_get_platdata(&client->dev);=0A=
>               lm87_write_value(client,=0A=
>                                LM87_REG_CHANNEL_MODE, data->channel);=0A=
>=0A=
=0A=
--=0A=
To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in=
=0A=
the body of a message to majordomo@vger.kernel.org=0A=
More majordomo info at  http://vger.kernel.org/majordomo-info.html=0A=
