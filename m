Return-path: <Chris.Packham@alliedtelesis.co.nz>
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux@roeck-us.net" <linux@roeck-us.net>
CC: Tobi Wulff <Tobi.Wulff@alliedtelesis.co.nz>, Jean Delvare
	<jdelvare@suse.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/4] hwmon: (adt7475) add high frequency support
Date: Thu, 11 May 2017 21:31:56 +0000
Message-ID: <f5ac03eee3f54a04a73f08c16e68af52@svr-chch-ex1.atlnz.lc>
References: <20170511034524.22698-1-chris.packham@alliedtelesis.co.nz>
 <20170511034524.22698-5-chris.packham@alliedtelesis.co.nz>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>

On 11/05/17 15:45, Chris Packham wrote:=0A=
> Systems using 4-wire fans usually require high frequency (22.5kHz)=0A=
> output on the pwm. Add 22500 as a valid option in the pwmfreq_table. In=
=0A=
> high frequency mode the low-order bit are ignored so they can safely be=
=0A=
> set to 0.=0A=
>=0A=
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
> ---=0A=
> Changes in v3:=0A=
> - New=0A=
>=0A=
>  drivers/hwmon/adt7475.c | 9 +++++----=0A=
>  1 file changed, 5 insertions(+), 4 deletions(-)=0A=
>=0A=
> diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c=0A=
> index f7322330789c..f5a65d1166cd 100644=0A=
> --- a/drivers/hwmon/adt7475.c=0A=
> +++ b/drivers/hwmon/adt7475.c=0A=
> @@ -936,7 +936,7 @@ static ssize_t set_pwmctrl(struct device *dev, struct=
 device_attribute *attr,=0A=
>=0A=
>  /* List of frequencies for the PWM */=0A=
>  static const int pwmfreq_table[] =3D {=0A=
> -	11, 14, 22, 29, 35, 44, 58, 88=0A=
> +	11, 14, 22, 29, 35, 44, 58, 88, 22500=0A=
>  };=0A=
>=0A=
>  static ssize_t show_pwmfreq(struct device *dev, struct device_attribute =
*attr,=0A=
> @@ -944,9 +944,10 @@ static ssize_t show_pwmfreq(struct device *dev, stru=
ct device_attribute *attr,=0A=
>  {=0A=
>  	struct adt7475_data *data =3D adt7475_update_device(dev);=0A=
>  	struct sensor_device_attribute_2 *sattr =3D to_sensor_dev_attr_2(attr);=
=0A=
> +	int i =3D clamp_val(data->range[sattr->index] & 0xf, 0,=0A=
> +			  sizeof(pwmfreq_table));=0A=
=0A=
Oops that should probably be=0A=
=0A=
+			  ARRAY_SIZE(pwmfreq_table) - 1);=0A=
=0A=
Guenter, do you want me to send a v4 or can you fix it up at your end?=0A=
=0A=
>=0A=
> -	return sprintf(buf, "%d\n",=0A=
> -		       pwmfreq_table[data->range[sattr->index] & 7]);=0A=
> +	return sprintf(buf, "%d\n", pwmfreq_table[i]);=0A=
>  }=0A=
>=0A=
>  static ssize_t set_pwmfreq(struct device *dev, struct device_attribute *=
attr,=0A=
> @@ -967,7 +968,7 @@ static ssize_t set_pwmfreq(struct device *dev, struct=
 device_attribute *attr,=0A=
>=0A=
>  	data->range[sattr->index] =3D=0A=
>  		adt7475_read(TEMP_TRANGE_REG(sattr->index));=0A=
> -	data->range[sattr->index] &=3D ~7;=0A=
> +	data->range[sattr->index] &=3D ~0xf;=0A=
>  	data->range[sattr->index] |=3D out;=0A=
>=0A=
>  	i2c_smbus_write_byte_data(client, TEMP_TRANGE_REG(sattr->index),=0A=
>=0A=
=0A=
