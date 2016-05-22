Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:35998 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752015AbcEVPRc (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sun, 22 May 2016 11:17:32 -0400
From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [Experimental PATCH] dell-smm-hwmon: Add support for disabling automatic BIOS fan control
Date: Sun, 22 May 2016 17:17:26 +0200
Cc: Jean Delvare <jdelvare@suse.com>,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>,
	=?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>,
	Andy Lutomirski <luto@kernel.org>, Jethro <xtompok@gmail.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1463917836-12985-1-git-send-email-pali.rohar@gmail.com> <5741CA70.9070100@roeck-us.net>
In-Reply-To: <5741CA70.9070100@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart6753931.3uNXsO4JhZ";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201605221717.26604@pali>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

--nextPart6753931.3uNXsO4JhZ
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sunday 22 May 2016 17:04:16 Guenter Roeck wrote:
> On 05/22/2016 04:50 AM, Pali Roh=C3=A1r wrote:
> > This patch exports standard hwmon pwmX_enable sysfs attribute for
> > enabling or disabling automatic fan control by BIOS. Standard
> > value "1" is for disabling automatic BIOS fan control and value
> > "2" for enabling.
> >=20
> > Currently there is no way to check if BIOS auto mode is enabled (at
> > least it is not know how to do it), so hwmon sysfs attribute is
> > write-only.
>=20
> You could cache the mode and report it after it was set, and define
> '0' as read value for 'unknown'.

I was thinking about it, but there is problem, that userspace can also=20
update/change BIOS auto mode. Process with CAP_SYS_RAWIO can use=20
sys_iopl(3) or sys_ioperm() which allows it access to I/O ports. There=20
are already different i8k* userspace tools which do that. And once=20
userspace change BIOS auto mode, then cached value in kernel does not=20
have to be correct and can confuse other applications which use standard=20
hwmon interface (not direct I/O ports).

And value '0' is already defined in hwmon API as:
"no fan speed control (i.e. fan at full speed)"

> > By default BIOS auto mode is enabled by laptop firmware.
> >=20
> > When BIOS auto mode is enabled, custom fan speed value (set via
> > hwmon pwmX sysfs attribute) is overwritten by SMM in few seconds
> > and therefore any custom settings are without effect. So this is
> > reason why implementing option for disabling BIOS auto mode is
> > needed.
> >=20
> > So finally this patch allows kernel to set and control fan speed on
> > laptops, but it can be dangerous (like setting speed of other
> > fans).
> >=20
> > This new feature is highly experimental, uses Dell SMM calls, so
> > does not have to be supported by all laptops BIOSes. It was tested
> > on Dell Latitude E6440 with BIOS A5.
> >=20
> > Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> > ---
> >=20
> >   drivers/hwmon/dell-smm-hwmon.c |   64
> >   ++++++++++++++++++++++++++++++++++------ 1 file changed, 55
> >   insertions(+), 9 deletions(-)
> >=20
> > diff --git a/drivers/hwmon/dell-smm-hwmon.c
> > b/drivers/hwmon/dell-smm-hwmon.c index 8a66a42..7b5144a 100644
> > --- a/drivers/hwmon/dell-smm-hwmon.c
> > +++ b/drivers/hwmon/dell-smm-hwmon.c
> > @@ -45,6 +45,8 @@
> >=20
> >   #define I8K_SMM_GET_SPEED	0x02a3
> >   #define I8K_SMM_GET_FAN_TYPE	0x03a3
> >   #define I8K_SMM_GET_NOM_SPEED	0x04a3
> >=20
> > +#define I8K_SMM_MANUAL_FAN	0x34a3
> > +#define I8K_SMM_AUTO_FAN	0x35a3
> >=20
> >   #define I8K_SMM_GET_TEMP	0x10a3
> >   #define I8K_SMM_GET_TEMP_TYPE	0x11a3
> >   #define I8K_SMM_GET_DELL_SIG1	0xfea3
> >=20
> > @@ -284,6 +286,17 @@ static int i8k_get_fan_nominal_speed(int fan,
> > int speed)
> >=20
> >   }
> >  =20
> >   /*
> >=20
> > + * Enable or disable automatic BIOS fan control support
> > + */
> > +static int i8k_enable_fan_auto_mode(bool enable)
> > +{
> > +	struct smm_regs regs =3D { };
> > +
> > +	regs.eax =3D enable ? I8K_SMM_AUTO_FAN : I8K_SMM_MANUAL_FAN;
> > +	return i8k_smm(&regs);
> > +}
> > +
> > +/*
> >=20
> >    * Set the fan speed (off, low, high). Returns the new fan
> >    status. */
> >  =20
> >   static int i8k_set_fan(int fan, int speed)
> >=20
> > @@ -702,6 +715,30 @@ static ssize_t i8k_hwmon_set_pwm(struct device
> > *dev,
> >=20
> >   	return err < 0 ? -EIO : count;
> >  =20
> >   }
> >=20
> > +static ssize_t i8k_hwmon_set_pwm_enable(struct device *dev,
> > +					struct device_attribute *attr,
> > +					const char *buf, size_t count)
> > +{
> > +	int err;
> > +	bool enable;
> > +	unsigned long val;
> > +
> > +	err =3D kstrtoul(buf, 10, &val);
> > +	if (err)
> > +		return err;
> > +
> > +	if (val =3D=3D 0)
> > +		return -EINVAL;
> > +
> > +	enable =3D (val !=3D 1);
> > +
>=20
> Please accepted only explicit values (1 and 2).

In Documentation/hwmon/sysfs-interface is written:

pwm[1-*]_enable
		2+: automatic fan speed control enabled

And this reason why my patch accept also other numeric values.

If other values does not make sense, maybe update documentation file?

> Thanks,
> Guenter
>=20
> > +	mutex_lock(&i8k_mutex);
> > +	err =3D i8k_enable_fan_auto_mode(enable);
> > +	mutex_unlock(&i8k_mutex);
> > +
> > +	return err ? -EIO : count;
> > +}
> > +
> >=20
> >   static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO,
> >   i8k_hwmon_show_temp, NULL, 0); static
> >   SENSOR_DEVICE_ATTR(temp1_label, S_IRUGO,
> >   i8k_hwmon_show_temp_label, NULL,
> >  =20
> >   			  0);
> >=20
> > @@ -719,18 +756,24 @@ static SENSOR_DEVICE_ATTR(fan1_label,
> > S_IRUGO, i8k_hwmon_show_fan_label, NULL,
> >=20
> >   			  0);
> >  =20
> >   static SENSOR_DEVICE_ATTR(pwm1, S_IRUGO | S_IWUSR,
> >   i8k_hwmon_show_pwm,
> >  =20
> >   			  i8k_hwmon_set_pwm, 0);
> >=20
> > +static SENSOR_DEVICE_ATTR(pwm1_enable, S_IWUSR, NULL,
> > i8k_hwmon_set_pwm_enable, +			  0);
> >=20
> >   static SENSOR_DEVICE_ATTR(fan2_input, S_IRUGO,
> >   i8k_hwmon_show_fan, NULL,
> >  =20
> >   			  1);
> >  =20
> >   static SENSOR_DEVICE_ATTR(fan2_label, S_IRUGO,
> >   i8k_hwmon_show_fan_label, NULL,
> >  =20
> >   			  1);
> >  =20
> >   static SENSOR_DEVICE_ATTR(pwm2, S_IRUGO | S_IWUSR,
> >   i8k_hwmon_show_pwm,
> >  =20
> >   			  i8k_hwmon_set_pwm, 1);
> >=20
> > +static SENSOR_DEVICE_ATTR(pwm2_enable, S_IWUSR, NULL,
> > i8k_hwmon_set_pwm_enable, +			  1);
> >=20
> >   static SENSOR_DEVICE_ATTR(fan3_input, S_IRUGO,
> >   i8k_hwmon_show_fan, NULL,
> >  =20
> >   			  2);
> >  =20
> >   static SENSOR_DEVICE_ATTR(fan3_label, S_IRUGO,
> >   i8k_hwmon_show_fan_label, NULL,
> >  =20
> >   			  2);
> >  =20
> >   static SENSOR_DEVICE_ATTR(pwm3, S_IRUGO | S_IWUSR,
> >   i8k_hwmon_show_pwm,
> >  =20
> >   			  i8k_hwmon_set_pwm, 2);
> >=20
> > +static SENSOR_DEVICE_ATTR(pwm3_enable, S_IWUSR, NULL,
> > i8k_hwmon_set_pwm_enable, +			  2);
> >=20
> >   static struct attribute *i8k_attrs[] =3D {
> >  =20
> >   	&sensor_dev_attr_temp1_input.dev_attr.attr,	/* 0 */
> >=20
> > @@ -744,12 +787,15 @@ static struct attribute *i8k_attrs[] =3D {
> >=20
> >   	&sensor_dev_attr_fan1_input.dev_attr.attr,	/* 8 */
> >   	&sensor_dev_attr_fan1_label.dev_attr.attr,	/* 9 */
> >   	&sensor_dev_attr_pwm1.dev_attr.attr,		/* 10 */
> >=20
> > -	&sensor_dev_attr_fan2_input.dev_attr.attr,	/* 11 */
> > -	&sensor_dev_attr_fan2_label.dev_attr.attr,	/* 12 */
> > -	&sensor_dev_attr_pwm2.dev_attr.attr,		/* 13 */
> > -	&sensor_dev_attr_fan3_input.dev_attr.attr,	/* 14 */
> > -	&sensor_dev_attr_fan3_label.dev_attr.attr,	/* 15 */
> > -	&sensor_dev_attr_pwm3.dev_attr.attr,		/* 16 */
> > +	&sensor_dev_attr_pwm1_enable.dev_attr.attr,	/* 11 */
> > +	&sensor_dev_attr_fan2_input.dev_attr.attr,	/* 12 */
> > +	&sensor_dev_attr_fan2_label.dev_attr.attr,	/* 13 */
> > +	&sensor_dev_attr_pwm2.dev_attr.attr,		/* 14 */
> > +	&sensor_dev_attr_pwm2_enable.dev_attr.attr,	/* 15 */
> > +	&sensor_dev_attr_fan3_input.dev_attr.attr,	/* 16 */
> > +	&sensor_dev_attr_fan3_label.dev_attr.attr,	/* 17 */
> > +	&sensor_dev_attr_pwm3.dev_attr.attr,		/* 18 */
> > +	&sensor_dev_attr_pwm3_enable.dev_attr.attr,	/* 19 */
> >=20
> >   	NULL
> >  =20
> >   };
> >=20
> > @@ -768,13 +814,13 @@ static umode_t i8k_is_visible(struct kobject
> > *kobj, struct attribute *attr,
> >=20
> >   	if (index >=3D 6 && index <=3D 7 &&
> >   =09
> >   	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP4))
> >   	=09
> >   		return 0;
> >=20
> > -	if (index >=3D 8 && index <=3D 10 &&
> > +	if (index >=3D 8 && index <=3D 11 &&
> >=20
> >   	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN1))
> >   	=09
> >   		return 0;
> >=20
> > -	if (index >=3D 11 && index <=3D 13 &&
> > +	if (index >=3D 12 && index <=3D 15 &&
> >=20
> >   	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN2))
> >   	=09
> >   		return 0;
> >=20
> > -	if (index >=3D 14 && index <=3D 16 &&
> > +	if (index >=3D 16 && index <=3D 19 &&
> >=20
> >   	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN3))
> >   	=09
> >   		return 0;

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart6753931.3uNXsO4JhZ
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAldBzYYACgkQi/DJPQPkQ1J78QCfaoqLVvvcGkHkkLmlefm2Dlgf
z1QAn30TcLGW0bFH4XEBQp7oViVRzx9b
=w0xO
-----END PGP SIGNATURE-----

--nextPart6753931.3uNXsO4JhZ--
