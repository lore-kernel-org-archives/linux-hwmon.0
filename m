Return-Path: <stwiss.opensource@diasemi.com>
Return-path: <stwiss.opensource@diasemi.com>
From: Steve Twiss <stwiss.opensource@diasemi.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Hardware Monitoring <linux-hwmon@vger.kernel.org>, LKML
	<linux-kernel@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>, "Support
 Opensource" <Support.Opensource@diasemi.com>
Subject: RE: [PATCH 22/30] hwmon: (da9055-hwmon) Use permission specific
 SENSOR[_DEVICE]_ATTR variants
Date: Tue, 11 Dec 2018 11:47:26 +0000
Message-ID: <6ED8E3B22081A4459DAC7699F3695FB7021C50E53C@SW-EX-MBX02.diasemi.com>
References: <1544479728-30077-1-git-send-email-linux@roeck-us.net>
 <1544479728-30077-23-git-send-email-linux@roeck-us.net>
In-Reply-To: <1544479728-30077-23-git-send-email-linux@roeck-us.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>

Hi Guenter,=20

On 10 December 2018 22:09, Guenter Roeck wrote:

> Subject: [PATCH 22/30] hwmon: (da9055-hwmon) Use permission specific
> SENSOR[_DEVICE]_ATTR variants
>=20
> Use SENSOR[_DEVICE]_ATTR[_2]_{RO,RW,WO} to simplify the source code,
> to improve readbility, and to reduce the chance of inconsistencies.
>=20
> Also replace any remaining S_<PERMS> in the driver with octal values.
>=20
> The conversion was done automatically with coccinelle. The semantic patch=
es
> and the scripts used to generate this commit log are available at
> https://github.com/groeck/coccinelle-patches/hwmon/.
>=20
> This patch does not introduce functional changes. It was verified by
> compiling the old and new files and comparing text and data sizes.
>=20
> Cc: Support Opensource <support.opensource@diasemi.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---

Thanks,=20
Same again.

Acked-by: Steve Twiss <stwiss.opensource@diasemi.com>

... with the patch [01/10] hwmon: Introduce SENSOR_DEVICE_ATTR_{RO,RW,WO} a=
nd variants
https://patchwork.kernel.org/patch/9489915/=20

Regards,
Steve


>  drivers/hwmon/da9055-hwmon.c | 41 ++++++++++++++++----------------------=
---
>  1 file changed, 16 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/hwmon/da9055-hwmon.c b/drivers/hwmon/da9055-hwmon.c
> index f6e159cabe23..4de6de683908 100644
> --- a/drivers/hwmon/da9055-hwmon.c
> +++ b/drivers/hwmon/da9055-hwmon.c
> @@ -140,8 +140,9 @@ static int da9055_disable_auto_mode(struct da9055
> *da9055, int channel)
>  	return da9055_reg_update(da9055, DA9055_REG_ADC_CONT, 1 <<
> channel, 0);
>  }
>=20
> -static ssize_t da9055_read_auto_ch(struct device *dev,
> -				struct device_attribute *devattr, char *buf)
> +static ssize_t da9055_auto_ch_show(struct device *dev,
> +				   struct device_attribute *devattr,
> +				   char *buf)
>  {
>  	struct da9055_hwmon *hwmon =3D dev_get_drvdata(dev);
>  	int ret, adc;
> @@ -176,7 +177,7 @@ static ssize_t da9055_read_auto_ch(struct device *dev=
,
>  	return ret;
>  }
>=20
> -static ssize_t da9055_read_tjunc(struct device *dev,
> +static ssize_t da9055_tjunc_show(struct device *dev,
>  				 struct device_attribute *devattr, char *buf)
>  {
>  	struct da9055_hwmon *hwmon =3D dev_get_drvdata(dev);
> @@ -199,34 +200,24 @@ static ssize_t da9055_read_tjunc(struct device *dev=
,
>  							+ 3076332, 10000));
>  }
>=20
> -static ssize_t show_label(struct device *dev,
> +static ssize_t label_show(struct device *dev,
>  			  struct device_attribute *devattr, char *buf)
>  {
>  	return sprintf(buf, "%s\n",
>  		       input_names[to_sensor_dev_attr(devattr)->index]);
>  }
>=20
> -static SENSOR_DEVICE_ATTR(in0_input, S_IRUGO, da9055_read_auto_ch, NULL,
> -			  DA9055_ADC_VSYS);
> -static SENSOR_DEVICE_ATTR(in0_label, S_IRUGO, show_label, NULL,
> -			  DA9055_ADC_VSYS);
> -static SENSOR_DEVICE_ATTR(in1_input, S_IRUGO, da9055_read_auto_ch, NULL,
> -			  DA9055_ADC_ADCIN1);
> -static SENSOR_DEVICE_ATTR(in1_label, S_IRUGO, show_label, NULL,
> -			  DA9055_ADC_ADCIN1);
> -static SENSOR_DEVICE_ATTR(in2_input, S_IRUGO, da9055_read_auto_ch, NULL,
> -			  DA9055_ADC_ADCIN2);
> -static SENSOR_DEVICE_ATTR(in2_label, S_IRUGO, show_label, NULL,
> -			  DA9055_ADC_ADCIN2);
> -static SENSOR_DEVICE_ATTR(in3_input, S_IRUGO, da9055_read_auto_ch, NULL,
> -			  DA9055_ADC_ADCIN3);
> -static SENSOR_DEVICE_ATTR(in3_label, S_IRUGO, show_label, NULL,
> -			  DA9055_ADC_ADCIN3);
> -
> -static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, da9055_read_tjunc,
> NULL,
> -			  DA9055_ADC_TJUNC);
> -static SENSOR_DEVICE_ATTR(temp1_label, S_IRUGO, show_label, NULL,
> -			  DA9055_ADC_TJUNC);
> +static SENSOR_DEVICE_ATTR_RO(in0_input, da9055_auto_ch,
> DA9055_ADC_VSYS);
> +static SENSOR_DEVICE_ATTR_RO(in0_label, label, DA9055_ADC_VSYS);
> +static SENSOR_DEVICE_ATTR_RO(in1_input, da9055_auto_ch,
> DA9055_ADC_ADCIN1);
> +static SENSOR_DEVICE_ATTR_RO(in1_label, label, DA9055_ADC_ADCIN1);
> +static SENSOR_DEVICE_ATTR_RO(in2_input, da9055_auto_ch,
> DA9055_ADC_ADCIN2);
> +static SENSOR_DEVICE_ATTR_RO(in2_label, label, DA9055_ADC_ADCIN2);
> +static SENSOR_DEVICE_ATTR_RO(in3_input, da9055_auto_ch,
> DA9055_ADC_ADCIN3);
> +static SENSOR_DEVICE_ATTR_RO(in3_label, label, DA9055_ADC_ADCIN3);
> +
> +static SENSOR_DEVICE_ATTR_RO(temp1_input, da9055_tjunc,
> DA9055_ADC_TJUNC);
> +static SENSOR_DEVICE_ATTR_RO(temp1_label, label, DA9055_ADC_TJUNC);
>=20
>  static struct attribute *da9055_attrs[] =3D {
>  	&sensor_dev_attr_in0_input.dev_attr.attr,
> --
> 2.7.4
