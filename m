Return-Path: <stwiss.opensource@diasemi.com>
Return-path: <stwiss.opensource@diasemi.com>
From: Steve Twiss <stwiss.opensource@diasemi.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Hardware Monitoring <linux-hwmon@vger.kernel.org>, LKML
	<linux-kernel@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>, "Support
 Opensource" <Support.Opensource@diasemi.com>
Subject: RE: [PATCH 21/30] hwmon: (da9052-hwmon) Use permission specific
 SENSOR[_DEVICE]_ATTR variants
Date: Tue, 11 Dec 2018 11:47:18 +0000
Message-ID: <6ED8E3B22081A4459DAC7699F3695FB7021C50E52E@SW-EX-MBX02.diasemi.com>
References: <1544479728-30077-1-git-send-email-linux@roeck-us.net>
 <1544479728-30077-22-git-send-email-linux@roeck-us.net>
In-Reply-To: <1544479728-30077-22-git-send-email-linux@roeck-us.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>

Hi Guenter,=20

On 10 December 2018 22:09, Guenter Roeck wrote:

> Subject: [PATCH 21/30] hwmon: (da9052-hwmon) Use permission specific
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
>  drivers/hwmon/da9052-hwmon.c | 105 ++++++++++++++++---------------------=
---

Thanks,

I am assuming this previous patch [01/10] hwmon: Introduce SENSOR_DEVICE_AT=
TR_{RO,RW,WO} and variants
from this set, https://patchwork.kernel.org/patch/9489915/ and,=20
+ #define SENSOR_DEVICE_ATTR_RO(_name, _func, _index)            \
+        SENSOR_DEVICE_ATTR(_name, 0444, _func##_show, NULL, _index)

Acked-by: Steve Twiss <stwiss.opensource@diasemi.com>

Regards,
Steve

> ---
>  1 file changed, 39 insertions(+), 66 deletions(-)
>=20
> diff --git a/drivers/hwmon/da9052-hwmon.c b/drivers/hwmon/da9052-hwmon.c
> index a973eb6a2890..8ec5bf4ce392 100644
> --- a/drivers/hwmon/da9052-hwmon.c
> +++ b/drivers/hwmon/da9052-hwmon.c
> @@ -87,7 +87,7 @@ static inline int da9052_disable_vddout_channel(struct
> da9052 *da9052)
>  				 DA9052_ADCCONT_AUTOVDDEN, 0);
>  }
>=20
> -static ssize_t da9052_read_vddout(struct device *dev,
> +static ssize_t da9052_vddout_show(struct device *dev,
>  				  struct device_attribute *devattr, char *buf)
>  {
>  	struct da9052_hwmon *hwmon =3D dev_get_drvdata(dev);
> @@ -119,7 +119,7 @@ static ssize_t da9052_read_vddout(struct device *dev,
>  	return ret;
>  }
>=20
> -static ssize_t da9052_read_ich(struct device *dev,
> +static ssize_t da9052_ich_show(struct device *dev,
>  			       struct device_attribute *devattr, char *buf)
>  {
>  	struct da9052_hwmon *hwmon =3D dev_get_drvdata(dev);
> @@ -133,7 +133,7 @@ static ssize_t da9052_read_ich(struct device *dev,
>  	return sprintf(buf, "%d\n", DIV_ROUND_CLOSEST(ret * 39, 10));
>  }
>=20
> -static ssize_t da9052_read_tbat(struct device *dev,
> +static ssize_t da9052_tbat_show(struct device *dev,
>  				struct device_attribute *devattr, char *buf)
>  {
>  	struct da9052_hwmon *hwmon =3D dev_get_drvdata(dev);
> @@ -141,7 +141,7 @@ static ssize_t da9052_read_tbat(struct device *dev,
>  	return sprintf(buf, "%d\n", da9052_adc_read_temp(hwmon->da9052));
>  }
>=20
> -static ssize_t da9052_read_vbat(struct device *dev,
> +static ssize_t da9052_vbat_show(struct device *dev,
>  				struct device_attribute *devattr, char *buf)
>  {
>  	struct da9052_hwmon *hwmon =3D dev_get_drvdata(dev);
> @@ -154,7 +154,7 @@ static ssize_t da9052_read_vbat(struct device *dev,
>  	return sprintf(buf, "%d\n", volt_reg_to_mv(ret));
>  }
>=20
> -static ssize_t da9052_read_misc_channel(struct device *dev,
> +static ssize_t da9052_misc_channel_show(struct device *dev,
>  					struct device_attribute *devattr,
>  					char *buf)
>  {
> @@ -242,9 +242,8 @@ static ssize_t __da9052_read_tsi(struct device *dev, =
int
> channel)
>  	return da9052_get_tsi_result(hwmon, channel);
>  }
>=20
> -static ssize_t da9052_read_tsi(struct device *dev,
> -			       struct device_attribute *devattr,
> -			       char *buf)
> +static ssize_t da9052_tsi_show(struct device *dev,
> +			       struct device_attribute *devattr, char *buf)
>  {
>  	struct da9052_hwmon *hwmon =3D dev_get_drvdata(dev);
>  	int channel =3D to_sensor_dev_attr(devattr)->index;
> @@ -260,7 +259,7 @@ static ssize_t da9052_read_tsi(struct device *dev,
>  		return sprintf(buf, "%d\n", input_tsireg_to_mv(hwmon, ret));
>  }
>=20
> -static ssize_t da9052_read_tjunc(struct device *dev,
> +static ssize_t da9052_tjunc_show(struct device *dev,
>  				 struct device_attribute *devattr, char *buf)
>  {
>  	struct da9052_hwmon *hwmon =3D dev_get_drvdata(dev);
> @@ -282,7 +281,7 @@ static ssize_t da9052_read_tjunc(struct device *dev,
>  	return sprintf(buf, "%d\n", 1708 * (tjunc - toffset) - 108800);
>  }
>=20
> -static ssize_t da9052_read_vbbat(struct device *dev,
> +static ssize_t da9052_vbbat_show(struct device *dev,
>  				 struct device_attribute *devattr, char *buf)
>  {
>  	struct da9052_hwmon *hwmon =3D dev_get_drvdata(dev);
> @@ -295,7 +294,7 @@ static ssize_t da9052_read_vbbat(struct device *dev,
>  	return sprintf(buf, "%d\n", vbbat_reg_to_mv(ret));
>  }
>=20
> -static ssize_t show_label(struct device *dev,
> +static ssize_t label_show(struct device *dev,
>  			  struct device_attribute *devattr, char *buf)
>  {
>  	return sprintf(buf, "%s\n",
> @@ -324,61 +323,35 @@ static umode_t da9052_channel_is_visible(struct
> kobject *kobj,
>  	return attr->mode;
>  }
>=20
> -static SENSOR_DEVICE_ATTR(in0_input, 0444, da9052_read_vddout, NULL,
> -			  DA9052_ADC_VDDOUT);
> -static SENSOR_DEVICE_ATTR(in0_label, 0444, show_label, NULL,
> -			  DA9052_ADC_VDDOUT);
> -static SENSOR_DEVICE_ATTR(in3_input, 0444, da9052_read_vbat, NULL,
> -			  DA9052_ADC_VBAT);
> -static SENSOR_DEVICE_ATTR(in3_label, 0444, show_label, NULL,
> -			  DA9052_ADC_VBAT);
> -static SENSOR_DEVICE_ATTR(in4_input, 0444, da9052_read_misc_channel,
> NULL,
> -			  DA9052_ADC_IN4);
> -static SENSOR_DEVICE_ATTR(in4_label, 0444, show_label, NULL,
> -			  DA9052_ADC_IN4);
> -static SENSOR_DEVICE_ATTR(in5_input, 0444, da9052_read_misc_channel,
> NULL,
> -			  DA9052_ADC_IN5);
> -static SENSOR_DEVICE_ATTR(in5_label, 0444, show_label, NULL,
> -			  DA9052_ADC_IN5);
> -static SENSOR_DEVICE_ATTR(in6_input, 0444, da9052_read_misc_channel,
> NULL,
> -			  DA9052_ADC_IN6);
> -static SENSOR_DEVICE_ATTR(in6_label, 0444, show_label, NULL,
> -			  DA9052_ADC_IN6);
> -static SENSOR_DEVICE_ATTR(in9_input, 0444, da9052_read_vbbat, NULL,
> -			  DA9052_ADC_VBBAT);
> -static SENSOR_DEVICE_ATTR(in9_label, 0444, show_label, NULL,
> -			  DA9052_ADC_VBBAT);
> -
> -static SENSOR_DEVICE_ATTR(in70_input, 0444, da9052_read_tsi, NULL,
> -			  DA9052_ADC_TSI_XP);
> -static SENSOR_DEVICE_ATTR(in70_label, 0444, show_label, NULL,
> -			  DA9052_ADC_TSI_XP);
> -static SENSOR_DEVICE_ATTR(in71_input, 0444, da9052_read_tsi, NULL,
> -			  DA9052_ADC_TSI_XN);
> -static SENSOR_DEVICE_ATTR(in71_label, 0444, show_label, NULL,
> -			  DA9052_ADC_TSI_XN);
> -static SENSOR_DEVICE_ATTR(in72_input, 0444, da9052_read_tsi, NULL,
> -			  DA9052_ADC_TSI_YP);
> -static SENSOR_DEVICE_ATTR(in72_label, 0444, show_label, NULL,
> -			  DA9052_ADC_TSI_YP);
> -static SENSOR_DEVICE_ATTR(in73_input, 0444, da9052_read_tsi, NULL,
> -			  DA9052_ADC_TSI_YN);
> -static SENSOR_DEVICE_ATTR(in73_label, 0444, show_label, NULL,
> -			  DA9052_ADC_TSI_YN);
> -
> -static SENSOR_DEVICE_ATTR(curr1_input, 0444, da9052_read_ich, NULL,
> -			  DA9052_ADC_ICH);
> -static SENSOR_DEVICE_ATTR(curr1_label, 0444, show_label, NULL,
> -			  DA9052_ADC_ICH);
> -
> -static SENSOR_DEVICE_ATTR(temp2_input, 0444, da9052_read_tbat, NULL,
> -			  DA9052_ADC_TBAT);
> -static SENSOR_DEVICE_ATTR(temp2_label, 0444, show_label, NULL,
> -			  DA9052_ADC_TBAT);
> -static SENSOR_DEVICE_ATTR(temp8_input, 0444, da9052_read_tjunc, NULL,
> -			  DA9052_ADC_TJUNC);
> -static SENSOR_DEVICE_ATTR(temp8_label, 0444, show_label, NULL,
> -			  DA9052_ADC_TJUNC);
> +static SENSOR_DEVICE_ATTR_RO(in0_input, da9052_vddout,
> DA9052_ADC_VDDOUT);
> +static SENSOR_DEVICE_ATTR_RO(in0_label, label, DA9052_ADC_VDDOUT);
> +static SENSOR_DEVICE_ATTR_RO(in3_input, da9052_vbat, DA9052_ADC_VBAT);
> +static SENSOR_DEVICE_ATTR_RO(in3_label, label, DA9052_ADC_VBAT);
> +static SENSOR_DEVICE_ATTR_RO(in4_input, da9052_misc_channel,
> DA9052_ADC_IN4);
> +static SENSOR_DEVICE_ATTR_RO(in4_label, label, DA9052_ADC_IN4);
> +static SENSOR_DEVICE_ATTR_RO(in5_input, da9052_misc_channel,
> DA9052_ADC_IN5);
> +static SENSOR_DEVICE_ATTR_RO(in5_label, label, DA9052_ADC_IN5);
> +static SENSOR_DEVICE_ATTR_RO(in6_input, da9052_misc_channel,
> DA9052_ADC_IN6);
> +static SENSOR_DEVICE_ATTR_RO(in6_label, label, DA9052_ADC_IN6);
> +static SENSOR_DEVICE_ATTR_RO(in9_input, da9052_vbbat,
> DA9052_ADC_VBBAT);
> +static SENSOR_DEVICE_ATTR_RO(in9_label, label, DA9052_ADC_VBBAT);
> +
> +static SENSOR_DEVICE_ATTR_RO(in70_input, da9052_tsi,
> DA9052_ADC_TSI_XP);
> +static SENSOR_DEVICE_ATTR_RO(in70_label, label, DA9052_ADC_TSI_XP);
> +static SENSOR_DEVICE_ATTR_RO(in71_input, da9052_tsi,
> DA9052_ADC_TSI_XN);
> +static SENSOR_DEVICE_ATTR_RO(in71_label, label, DA9052_ADC_TSI_XN);
> +static SENSOR_DEVICE_ATTR_RO(in72_input, da9052_tsi, DA9052_ADC_TSI_YP);
> +static SENSOR_DEVICE_ATTR_RO(in72_label, label, DA9052_ADC_TSI_YP);
> +static SENSOR_DEVICE_ATTR_RO(in73_input, da9052_tsi,
> DA9052_ADC_TSI_YN);
> +static SENSOR_DEVICE_ATTR_RO(in73_label, label, DA9052_ADC_TSI_YN);
> +
> +static SENSOR_DEVICE_ATTR_RO(curr1_input, da9052_ich, DA9052_ADC_ICH);
> +static SENSOR_DEVICE_ATTR_RO(curr1_label, label, DA9052_ADC_ICH);
> +
> +static SENSOR_DEVICE_ATTR_RO(temp2_input, da9052_tbat,
> DA9052_ADC_TBAT);
> +static SENSOR_DEVICE_ATTR_RO(temp2_label, label, DA9052_ADC_TBAT);
> +static SENSOR_DEVICE_ATTR_RO(temp8_input, da9052_tjunc,
> DA9052_ADC_TJUNC);
> +static SENSOR_DEVICE_ATTR_RO(temp8_label, label, DA9052_ADC_TJUNC);
>=20
>  static struct attribute *da9052_attrs[] =3D {
>  	&sensor_dev_attr_in0_input.dev_attr.attr,
> --
> 2.7.4
