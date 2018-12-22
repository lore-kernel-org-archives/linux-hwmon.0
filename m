Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35482 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392865AbeLVWlj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 22 Dec 2018 17:41:39 -0500
Received: by mail-wr1-f65.google.com with SMTP id 96so8607556wrb.2
        for <linux-hwmon@vger.kernel.org>; Sat, 22 Dec 2018 14:41:36 -0800 (PST)
Date: Sat, 22 Dec 2018 23:41:33 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH 23/30] hwmon: (dell-smm-hwmon) Use permission specific
 SENSOR[_DEVICE]_ATTR variants
Message-ID: <20181222224133.qpz44b5w7gr4dda3@pali>
References: <1544479728-30077-1-git-send-email-linux@roeck-us.net>
 <1544479728-30077-24-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="hpbox36tgn4vv6yb"
Content-Disposition: inline
In-Reply-To: <1544479728-30077-24-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org


--hpbox36tgn4vv6yb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Monday 10 December 2018 14:08:41 Guenter Roeck wrote:
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
> Cc: "Pali Roh=C3=A1r" <pali.rohar@gmail.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Looks good, add my

Acked-By: Pali Roh=C3=A1r <pali.rohar@gmail.com>

> ---
>  drivers/hwmon/dell-smm-hwmon.c | 68 +++++++++++++++++-------------------=
------
>  1 file changed, 27 insertions(+), 41 deletions(-)
>=20
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmo=
n.c
> index 367a8a61712c..68c9a6664557 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -618,7 +618,7 @@ static inline void __exit i8k_exit_procfs(void)
>   * Hwmon interface
>   */
> =20
> -static ssize_t i8k_hwmon_show_temp_label(struct device *dev,
> +static ssize_t i8k_hwmon_temp_label_show(struct device *dev,
>  					 struct device_attribute *devattr,
>  					 char *buf)
>  {
> @@ -641,7 +641,7 @@ static ssize_t i8k_hwmon_show_temp_label(struct devic=
e *dev,
>  	return sprintf(buf, "%s\n", labels[type]);
>  }
> =20
> -static ssize_t i8k_hwmon_show_temp(struct device *dev,
> +static ssize_t i8k_hwmon_temp_show(struct device *dev,
>  				   struct device_attribute *devattr,
>  				   char *buf)
>  {
> @@ -654,7 +654,7 @@ static ssize_t i8k_hwmon_show_temp(struct device *dev,
>  	return sprintf(buf, "%d\n", temp * 1000);
>  }
> =20
> -static ssize_t i8k_hwmon_show_fan_label(struct device *dev,
> +static ssize_t i8k_hwmon_fan_label_show(struct device *dev,
>  					struct device_attribute *devattr,
>  					char *buf)
>  {
> @@ -685,9 +685,8 @@ static ssize_t i8k_hwmon_show_fan_label(struct device=
 *dev,
>  	return sprintf(buf, "%s%s\n", (dock ? "Docking " : ""), labels[type]);
>  }
> =20
> -static ssize_t i8k_hwmon_show_fan(struct device *dev,
> -				  struct device_attribute *devattr,
> -				  char *buf)
> +static ssize_t i8k_hwmon_fan_show(struct device *dev,
> +				  struct device_attribute *devattr, char *buf)
>  {
>  	int index =3D to_sensor_dev_attr(devattr)->index;
>  	int fan_speed;
> @@ -698,9 +697,8 @@ static ssize_t i8k_hwmon_show_fan(struct device *dev,
>  	return sprintf(buf, "%d\n", fan_speed);
>  }
> =20
> -static ssize_t i8k_hwmon_show_pwm(struct device *dev,
> -				  struct device_attribute *devattr,
> -				  char *buf)
> +static ssize_t i8k_hwmon_pwm_show(struct device *dev,
> +				  struct device_attribute *devattr, char *buf)
>  {
>  	int index =3D to_sensor_dev_attr(devattr)->index;
>  	int status;
> @@ -711,9 +709,9 @@ static ssize_t i8k_hwmon_show_pwm(struct device *dev,
>  	return sprintf(buf, "%d\n", clamp_val(status * i8k_pwm_mult, 0, 255));
>  }
> =20
> -static ssize_t i8k_hwmon_set_pwm(struct device *dev,
> -				 struct device_attribute *attr,
> -				 const char *buf, size_t count)
> +static ssize_t i8k_hwmon_pwm_store(struct device *dev,
> +				   struct device_attribute *attr,
> +				   const char *buf, size_t count)
>  {
>  	int index =3D to_sensor_dev_attr(attr)->index;
>  	unsigned long val;
> @@ -731,35 +729,23 @@ static ssize_t i8k_hwmon_set_pwm(struct device *dev,
>  	return err < 0 ? -EIO : count;
>  }
> =20
> -static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, i8k_hwmon_show_temp, NUL=
L, 0);
> -static SENSOR_DEVICE_ATTR(temp1_label, S_IRUGO, i8k_hwmon_show_temp_labe=
l, NULL,
> -			  0);
> -static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO, i8k_hwmon_show_temp, NUL=
L, 1);
> -static SENSOR_DEVICE_ATTR(temp2_label, S_IRUGO, i8k_hwmon_show_temp_labe=
l, NULL,
> -			  1);
> -static SENSOR_DEVICE_ATTR(temp3_input, S_IRUGO, i8k_hwmon_show_temp, NUL=
L, 2);
> -static SENSOR_DEVICE_ATTR(temp3_label, S_IRUGO, i8k_hwmon_show_temp_labe=
l, NULL,
> -			  2);
> -static SENSOR_DEVICE_ATTR(temp4_input, S_IRUGO, i8k_hwmon_show_temp, NUL=
L, 3);
> -static SENSOR_DEVICE_ATTR(temp4_label, S_IRUGO, i8k_hwmon_show_temp_labe=
l, NULL,
> -			  3);
> -static SENSOR_DEVICE_ATTR(fan1_input, S_IRUGO, i8k_hwmon_show_fan, NULL,=
 0);
> -static SENSOR_DEVICE_ATTR(fan1_label, S_IRUGO, i8k_hwmon_show_fan_label,=
 NULL,
> -			  0);
> -static SENSOR_DEVICE_ATTR(pwm1, S_IRUGO | S_IWUSR, i8k_hwmon_show_pwm,
> -			  i8k_hwmon_set_pwm, 0);
> -static SENSOR_DEVICE_ATTR(fan2_input, S_IRUGO, i8k_hwmon_show_fan, NULL,
> -			  1);
> -static SENSOR_DEVICE_ATTR(fan2_label, S_IRUGO, i8k_hwmon_show_fan_label,=
 NULL,
> -			  1);
> -static SENSOR_DEVICE_ATTR(pwm2, S_IRUGO | S_IWUSR, i8k_hwmon_show_pwm,
> -			  i8k_hwmon_set_pwm, 1);
> -static SENSOR_DEVICE_ATTR(fan3_input, S_IRUGO, i8k_hwmon_show_fan, NULL,
> -			  2);
> -static SENSOR_DEVICE_ATTR(fan3_label, S_IRUGO, i8k_hwmon_show_fan_label,=
 NULL,
> -			  2);
> -static SENSOR_DEVICE_ATTR(pwm3, S_IRUGO | S_IWUSR, i8k_hwmon_show_pwm,
> -			  i8k_hwmon_set_pwm, 2);
> +static SENSOR_DEVICE_ATTR_RO(temp1_input, i8k_hwmon_temp, 0);
> +static SENSOR_DEVICE_ATTR_RO(temp1_label, i8k_hwmon_temp_label, 0);
> +static SENSOR_DEVICE_ATTR_RO(temp2_input, i8k_hwmon_temp, 1);
> +static SENSOR_DEVICE_ATTR_RO(temp2_label, i8k_hwmon_temp_label, 1);
> +static SENSOR_DEVICE_ATTR_RO(temp3_input, i8k_hwmon_temp, 2);
> +static SENSOR_DEVICE_ATTR_RO(temp3_label, i8k_hwmon_temp_label, 2);
> +static SENSOR_DEVICE_ATTR_RO(temp4_input, i8k_hwmon_temp, 3);
> +static SENSOR_DEVICE_ATTR_RO(temp4_label, i8k_hwmon_temp_label, 3);
> +static SENSOR_DEVICE_ATTR_RO(fan1_input, i8k_hwmon_fan, 0);
> +static SENSOR_DEVICE_ATTR_RO(fan1_label, i8k_hwmon_fan_label, 0);
> +static SENSOR_DEVICE_ATTR_RW(pwm1, i8k_hwmon_pwm, 0);
> +static SENSOR_DEVICE_ATTR_RO(fan2_input, i8k_hwmon_fan, 1);
> +static SENSOR_DEVICE_ATTR_RO(fan2_label, i8k_hwmon_fan_label, 1);
> +static SENSOR_DEVICE_ATTR_RW(pwm2, i8k_hwmon_pwm, 1);
> +static SENSOR_DEVICE_ATTR_RO(fan3_input, i8k_hwmon_fan, 2);
> +static SENSOR_DEVICE_ATTR_RO(fan3_label, i8k_hwmon_fan_label, 2);
> +static SENSOR_DEVICE_ATTR_RW(pwm3, i8k_hwmon_pwm, 2);
> =20
>  static struct attribute *i8k_attrs[] =3D {
>  	&sensor_dev_attr_temp1_input.dev_attr.attr,	/* 0 */

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--hpbox36tgn4vv6yb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQS4VrIQdKium2krgIWL8Mk9A+RDUgUCXB69mgAKCRCL8Mk9A+RD
Uo8pAKC2RnpUWi/eiDHYMNXNB0/9gsnPGACePQzPk0b96wTeP6/EBeTLZAAeaZk=
=r5H3
-----END PGP SIGNATURE-----

--hpbox36tgn4vv6yb--
