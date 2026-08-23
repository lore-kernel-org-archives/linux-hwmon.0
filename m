Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4360029B78F;
	Sun, 23 Aug 2026 20:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787515265; cv=pass; b=LCEt4CWCcH+ecMhuYzHxVJIR2ghH3Vg+qHbhFfS+SSagMAT4bUjeAzcXybXhbhIXBDkXSBImn6jcCBZUkge8YQrnBKC5lSWo5AJH2b2Z56qudgl5E/efjfab3gJmR3MYbUXSyz5oDBH3igBrMa1MrDjvxbZAAj1I835YEDxHws4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787515265; c=relaxed/simple;
	bh=K+hFzfF5SWgkOH/HPfFu+nmZbywKgcJ2y1eyBdkg4nU=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=dKazGX5SG3qE1iSygkc/IK49QsXtT4dMH8zI1M4pnHm1ZBDzV+3aRwZYN0vHPb45ZDabH/57OqABpt1/kPNfe+BaU45uBem9fprq4XsIzTLPArksjrnDZv4id4ENMGHXkXmtu71rZDEnmZZl1oZkDVf5x9inPXSDjFlISkfwJvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=pv6ZKfs1; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="pv6ZKfs1"
ARC-Seal: i=1; a=rsa-sha256; t=1787515240; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UTkRK/aYOLd2ZTMHsTEcYeTBpCtjy2nXW8AYXTv8cXJ9GFsmRWh/YMuUSL5RXtDorQpkyNXdJBKRvaDh7ho+QsyeTKWsaVb9eheh/rQ77fZCwMsZYFTmmKUgw+oqaJT0RRkpxzvv/qCXO+t69ZvVcFnY+HkVwZ2+mrpd0VnG+js=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787515240; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GYN4zjDutamQ2jUfaIu8Wd7f42RXjHXkLrom9kO2CgI=; 
	b=DC1VDfGi1bEfDOlJaa4N0GPExcE295DB1xWrZAF9uKXk6sPYPhAgJjJElL3i+k56idCcgwEngQqH8pW1c5E5ZhLKneuBCcIMbn2vUt4mlh0TawJn1AN76QV03vGApZtcHwA0L5Lq0xf6irE6JIPWc1CL/dUfgaY56rKhSi3eHZE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787515240;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=GYN4zjDutamQ2jUfaIu8Wd7f42RXjHXkLrom9kO2CgI=;
	b=pv6ZKfs1H4VEBSgRLVWqVz7mIa1UtdxxtznULywAkL1HVEtKSXejXr+tmyodahCs
	UUxGtWRJ+C2ic3tkXqBZZhML/uF5R1DG1hOWPz6sCWg+qti5G3CVU0Gs1aht++Dtt5Y
	WZKb38Kqdg9dwysI9PcMBtGx+qWNHd+1eXxebxNRFuhZZcTDU/m88P1SeaCYB22zgaO
	T1TCGawe74Cu3VljfaIdqcRCr+di5TpgRmBPXjl36n1i/z17dafSJWwqh4rAj1sB4gU
	rDmaIaBmjvfwFZ/M/+ZUr5Q8BBOZuQbNMxstp6z4wDqbqpWnsC1bj6PiFF6Dqdw9APm
	6DB8x0XWXQ==
Received: by mx.zohomail.com with SMTPS id 1787515237579177.3263383448467;
	Sun, 23 Aug 2026 13:00:37 -0700 (PDT)
Message-ID: <2725686893200880e4d91d793522bbf7b4b103a4.camel@rong.moe>
Subject: Re: [RFC PATCH 1/3] platform/x86: lenovo-wmi-other: Add Legion Go
 Full Speed control
From: Rong Zhang <i@rong.moe>
To: Aditya Dash <mradityadash@gmail.com>, "Derek J. Clark"	
 <derekjohn.clark@gmail.com>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, Armin Wolf <W_Armin@gmx.de>, Hans de Goede
	 <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-hwmon@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
In-Reply-To: <20260821214728.87773-2-mradityadash@gmail.com>
References: <20260821214728.87773-1-mradityadash@gmail.com>
	 <20260821214728.87773-2-mradityadash@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 03:55:27 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Aditya

On Sat, 2026-08-22 at 03:17 +0530, Aditya Dash wrote:
> Selected Legion Go firmware exposes Full Speed as Other Mode feature
> 0x04020000. Capability Data does not describe this feature, so
> lenovo-wmi-other currently ignores it.
>=20
> Probe the feature during HWMON setup on those products. If the read
> succeeds and returns a Boolean value, expose it as pwm1_enable. Value 0
> selects Full Speed, and value 2 returns fan control to firmware automatic
> mode. Reject all other values.
>=20
> Assisted-by: Pi:gpt-5.6-sol
> Signed-off-by: Aditya Dash <mradityadash@gmail.com>
> ---
>  .../wmi/devices/lenovo-wmi-other.rst          |   7 ++
>  drivers/platform/x86/lenovo/wmi-other.c       | 108 +++++++++++++++++-
>  2 files changed, 114 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentati=
on/wmi/devices/lenovo-wmi-other.rst
> index 011054d64eac..75f2deaaef16 100644
> --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> @@ -49,6 +49,13 @@ The following HWMON attributes are implemented:
>  Due to the internal RPM divisor, the current/target RPMs are rounded dow=
n to
>  its nearest multiple. The divisor itself is not necessary to be a power =
of two.
> =20
> +Legion Go fan controls
> +----------------------
> +
> +On supported Legion Go models, Other Mode feature ``0x04020000`` control=
s

No need to mention the hex id here. Please tell your LLM not to ramble.

> +Full Speed mode in firmware. The driver exposes it as ``pwm1_enable``. V=
alue 0
> +enables Full Speed, and value 2 returns fan control to firmware.

Please follow the format of other sections in the documentation.

> +
>  LENOVO_CAPABILITY_DATA_01
>  -------------------------
> =20
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x=
86/lenovo/wmi-other.c
> index fbb32bf404f2..c180933e1d18 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -32,6 +32,7 @@
>  #include <linux/component.h>
>  #include <linux/container_of.h>
>  #include <linux/device.h>
> +#include <linux/dmi.h>
>  #include <linux/export.h>
>  #include <linux/gfp_types.h>
>  #include <linux/hwmon.h>
> @@ -83,6 +84,7 @@ enum lwmi_feature_id_psu {
>  	LWMI_FEATURE_ID_PSU_CHARGE_BEHAVIOUR =3D	0x02,
>  };
> =20
> +#define LWMI_FEATURE_ID_FAN_FULLSPEED 0x02
>  #define LWMI_FEATURE_ID_FAN_RPM 0x03
> =20
>  #define LWMI_TYPE_ID_CROSSLOAD	0x01
> @@ -102,6 +104,10 @@ enum lwmi_feature_id_psu {
>  #define LWMI_CHARGE_TYPE_STANDARD	0x00
>  #define LWMI_CHARGE_TYPE_LONGLIFE	0x01
> =20
> +#define LWMI_ATTR_ID_FAN_FULLSPEED					\
> +	lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_FULLSPEED, \
> +		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_TYPE_ID_NONE)
> +
>  #define LWMI_ATTR_ID_FAN_RPM(x)                                   \
>  	lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
>  		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
> @@ -115,6 +121,50 @@ enum lwmi_feature_id_psu {
> =20
>  static DEFINE_IDA(lwmi_om_ida);
> =20
> +static const struct dmi_system_id lwmi_fan_dmi_table[] =3D {
> +	{
> +		.ident =3D "Lenovo Legion Go 8APU1",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8APU1"),
> +		},
> +	},
> +	{
> +		.ident =3D "Lenovo Legion Go S 8APU1",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go S 8APU1"),
> +		},
> +	},
> +	{
> +		.ident =3D "Lenovo Legion Go S 8ARP1",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go S 8ARP1"),
> +		},
> +	},
> +	{
> +		.ident =3D "Lenovo Legion Go 8ASP2",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8ASP2"),
> +		},
> +	},
> +	{
> +		.ident =3D "Lenovo Legion Go 8AHP2",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8AHP2"),
> +		},
> +	},
> +	{}
> +};
> +
> +static bool lwmi_fan_supported(void)
> +{
> +	return dmi_check_system(lwmi_fan_dmi_table);
> +}
> +

Is their capdata really doesn't have an entry for 0x04020000?

>  enum attribute_property {
>  	DEFAULT_VAL,
>  	MAX_VAL,
> @@ -144,6 +194,7 @@ struct lwmi_om_priv {
>  	int ida_id;
> =20
>  	struct lwmi_fan_info fan_info[LWMI_FAN_NR];
> +	bool fullspeed_supported;

Move it to fan_flags.

> =20
>  	struct {
>  		bool capdata00_collected : 1;
> @@ -237,6 +288,38 @@ static int lwmi_om_fan_get_set(struct lwmi_om_priv *=
priv, int channel, u32 *val,
>  	return (retval =3D=3D 0 || retval =3D=3D 1) ? 0 : -EIO;
>  }
> =20
> +static int lwmi_om_fullspeed_get(struct lwmi_om_priv *priv, long *enable=
)
> +{
> +	struct wmi_method_args_32 args =3D {
> +		.arg0 =3D LWMI_ATTR_ID_FAN_FULLSPEED,
> +	};
> +	u32 value;
> +	int ret;
> +
> +	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0, LWMI_FEATURE_VALUE_GET,
> +				    (u8 *)&args, sizeof(args), &value);
> +	if (ret)
> +		return ret;
> +
> +	if (value > 1)
> +		return -ERANGE;
> +
> +	*enable =3D value ? 0 : 2;
> +	return 0;
> +}
> +
> +static int lwmi_om_fullspeed_set(struct lwmi_om_priv *priv, bool fullspe=
ed)

The second arguments of _get and _set differ. Either use raw bool in
both, or use hwmon long in both.

> +{
> +	struct wmi_method_args_32 args =3D {
> +		.arg0 =3D LWMI_ATTR_ID_FAN_FULLSPEED,
> +		.arg1 =3D fullspeed,
> +	};
> +
> +	/* The WMI method has no return value. */

The NULL already told the same. Drop the comment.

> +	return lwmi_dev_evaluate_int(priv->wdev, 0, LWMI_FEATURE_VALUE_SET,
> +				     (u8 *)&args, sizeof(args), NULL);
> +}
> +
>  /**
>   * lwmi_om_hwmon_is_visible() - Determine visibility of HWMON attributes
>   * @drvdata: Driver private data
> @@ -255,6 +338,10 @@ static umode_t lwmi_om_hwmon_is_visible(const void *=
drvdata, enum hwmon_sensor_t
>  	struct lwmi_om_priv *priv =3D (struct lwmi_om_priv *)drvdata;
>  	bool visible =3D false;
> =20
> +	if (type =3D=3D hwmon_pwm && priv->fullspeed_supported && channel =3D=
=3D 0 &&
> +	    attr =3D=3D hwmon_pwm_enable)
> +		return 0644;
> +
>  	if (type =3D=3D hwmon_fan) {
>  		if (!(priv->fan_info[channel].supported & LWMI_SUPP_VALID))
>  			return 0;
> @@ -311,6 +398,9 @@ static int lwmi_om_hwmon_read(struct device *dev, enu=
m hwmon_sensor_types type,
>  	u32 retval =3D 0;
>  	int err;
> =20
> +	if (type =3D=3D hwmon_pwm && attr =3D=3D hwmon_pwm_enable && channel =
=3D=3D 0)
> +		return lwmi_om_fullspeed_get(priv, val);
> +
>  	if (type =3D=3D hwmon_fan) {
>  		switch (attr) {
>  		/*
> @@ -366,6 +456,17 @@ static int lwmi_om_hwmon_write(struct device *dev, e=
num hwmon_sensor_types type,
>  	u32 raw, min_rpm, max_rpm;
>  	int err;
> =20
> +	if (type =3D=3D hwmon_pwm && attr =3D=3D hwmon_pwm_enable && channel =
=3D=3D 0) {
> +		switch (val) {
> +		case 0:
> +			return lwmi_om_fullspeed_set(priv, true);
> +		case 2:
> +			return lwmi_om_fullspeed_set(priv, false);
> +		default:
> +			return -EINVAL;
> +		}
> +	}

Ugly. That's exactly why you should unify the arguments of _get and _set
methods.

> +
>  	if (type =3D=3D hwmon_fan) {
>  		switch (attr) {
>  		case hwmon_fan_target:
> @@ -420,6 +521,7 @@ static const struct hwmon_channel_info * const lwmi_o=
m_hwmon_info[] =3D {
>  			   HWMON_F_MIN | HWMON_F_MAX,
>  			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_DIV |
>  			   HWMON_F_MIN | HWMON_F_MAX),
> +	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE),
>  	NULL
>  };
> =20
> @@ -440,6 +542,7 @@ static const struct hwmon_chip_info lwmi_om_hwmon_chi=
p_info =3D {
>   */
>  static void lwmi_om_hwmon_add(struct lwmi_om_priv *priv)
>  {
> +	long enable;
>  	int i, valid;

Reverse xmas tree.

And please don't name it `enable'. Give it a generic name so that we may
reuse it to receive other values in the future.

Thanks,
Rong

> =20
>  	if (WARN_ON(priv->hwmon_dev))
> @@ -458,6 +561,9 @@ static void lwmi_om_hwmon_add(struct lwmi_om_priv *pr=
iv)
>  	if (relax_fan_constraint)
>  		dev_warn(&priv->wdev->dev, "fan RPM constraint relaxed. Use with cauti=
on\n");
> =20
> +	priv->fullspeed_supported =3D
> +		lwmi_fan_supported() && !lwmi_om_fullspeed_get(priv, &enable);
> +
>  	valid =3D 0;
>  	for (i =3D 0; i < LWMI_FAN_NR; i++) {
>  		if (!(priv->fan_info[i].supported & LWMI_SUPP_VALID))
> @@ -474,7 +580,7 @@ static void lwmi_om_hwmon_add(struct lwmi_om_priv *pr=
iv)
>  		}
>  	}
> =20
> -	if (valid =3D=3D 0) {
> +	if (valid =3D=3D 0 && !priv->fullspeed_supported) {
>  		dev_warn(&priv->wdev->dev,
>  			 "fan reporting/tuning is unsupported on this device\n");
>  		return;
