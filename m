Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4152A3A8FE8;
	Fri, 22 May 2026 09:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779443136; cv=none; b=Lim1RoG1I8/VugIVHnEZ6tGOgatuYNIJt3+7pEelGCF7srTyt/D9UPLHjl+LHXW1UUSzOGlbeOG23bc0FnBBUirQKv/RoDLbjJXBKqjPvLuDxF7p+DLwc6pB6B5+iRQfMJ4oDC/+uo8NyqEuWV0RwBXDl5bxShyOB9lkUH7O2Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779443136; c=relaxed/simple;
	bh=kaT0PBKgHWCZbZx4l4jLgMJMftxDFP3tmb30jUPIxPk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Kzt/h/SmkgbGxBxtozuUwI2FHuwJAP5OW1QrG8uAonxuG7dJlhFOzK9Ixel5AD/tYn9iurd0gpSqKpp29fHFCzDw+V0b5HprDqv1TUH86wE4czuLX32FI68PEKdHt3mZ0QYxEURD6bIb0bVTuZDv0vDYXK9CzJRf/VeUtffMaw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G3hA0WfK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G3hA0WfK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C50041F000E9;
	Fri, 22 May 2026 09:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779443135;
	bh=2cyYZA05dDFX7H2bDFWfvPduCqi6KVG7lvIfaHuiwPY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G3hA0WfK/bOLC7IOFZ8lEXoevujS5d6+syE8u+L/RitFl+qsXyCdjTnsdApTo3Q6f
	 nIty0yqRForSVPfw8iw7azl9gZLFG0xXZSiMCVeLhhaCbMO5FhoIKuo9O4bQ9dNog4
	 tOciEv8UC5UaVQN+Q9ESxPEeQv94iHSZEPZjr0HmuHnyt5hF38sJuES8Svck8sOi24
	 5g4AM2spMPQTORcxU2H6+DMiEMBz2uioUpxtIiGtn7XtFfv3idj4SWdC3mQ/GqWtQ3
	 wb2YqBEtPIibFHCIqyQ2b0KBG0pPT25IGKEv/bfqskhZ3TSaWHWNqOzrpi/0v/5hRd
	 cIaRqxuZXCycg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] hwmon: (pmbus/tps25990): Add TPS1689 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stoyan Bogdanov" <sbogdanov@baylibre.com>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260522082349.2749970-5-sbogdanov@baylibre.com>
References: <20260522082349.2749970-5-sbogdanov@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 09:45:34 +0000
Message-Id: <20260522094534.C50041F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] The output current (`PSC_CURRENT_OUT`) parameters for TPS1689 ar=
e configured, but the feature is rendered inactive due to a missing capabil=
ity flag, and its mantissa is not dynamically scaled by the sense resistor.

Pre-existing issues:
- [Critical] The driver incorrectly uses `i2c_get_clientdata()` to retrieve=
 the `pmbus_driver_info` pointer in `tps25990_reg2data_direct` and `tps2599=
0_data2reg_direct`, resulting in a type confusion and out-of-bounds read.
- [High] The mantissa for the local `TPS25990_IIN_OCF` parameter is not dyn=
amically scaled by the `rimon` resistor value, leading to incorrect over-cu=
rrent fault limits.
--

commit 7807fad0cb3cb2d485b85493ccab6a9ca7c6bdde
Author: Stoyan Bogdanov <sbogdanov@baylibre.com>

hwmon: (pmbus/tps25990): Add TPS1689 support
   =20
Extend the existing TPS25990 driver to support the TPS1689 eFuse,
as both devices share the same command interface and functionality.

> diff --git a/drivers/hwmon/pmbus/tps25990.c b/drivers/hwmon/pmbus/tps2599=
0.c
> index 1e252844217b8..720e134f18925 100644
> --- a/drivers/hwmon/pmbus/tps25990.c
> +++ b/drivers/hwmon/pmbus/tps25990.c
[ ... ]
> @@ -286,7 +287,6 @@ static int tps25990_write_word_data(struct i2c_client=
 *client,
>  		value =3D clamp_val(value, 0, 0xff);
>  		ret =3D pmbus_write_word_data(client, page, reg, value);
>  		break;
> -
>  	case PMBUS_VIN_OV_FAULT_LIMIT:
>  		value =3D tps25990_data2reg_direct(client, TPS25990_VIN_OVF, value);

[Severity: Critical]
This is a pre-existing issue, but does tps25990_data2reg_direct() retrieve
the correct pointer type here?

Looking at tps25990_data2reg_direct(), it uses i2c_get_clientdata() to
get struct pmbus_driver_info *:

static u16 tps25990_data2reg_direct(struct i2c_client *client, int param, s=
64 val)
{
	struct pmbus_driver_info *info =3D i2c_get_clientdata(client);
	struct tps25990_data *data =3D container_of(info, struct tps25990_data, in=
fo);

Since pmbus_do_probe() sets the client data to its internal
struct pmbus_data *, wouldn't this cast read past the end of
struct pmbus_data into arbitrary heap memory when accessing data->info_loca=
l?

Should this use pmbus_get_driver_info(client) to retrieve the correct
pointer instead?

>  		value =3D clamp_val(value, 0, 0xf);
>  		ret =3D pmbus_write_word_data(client, page, reg, value);
[ ... ]
> @@ -376,6 +376,14 @@ static const struct regulator_desc tps25990_reg_desc=
[] =3D {
>  #endif
> =20
>  static struct tps25990_local_direct_value tps25990_local_info[] =3D {
> +	[tps1689] =3D {
> +		.m[TPS25990_VIN_OVF] =3D 3984,
> +		.b[TPS25990_VIN_OVF] =3D -63750,
> +		.R[TPS25990_VIN_OVF] =3D -3,
> +		.m[TPS25990_IIN_OCF] =3D 7111,

[Severity: High]
This is a pre-existing issue, but is the mantissa for TPS25990_IIN_OCF
scaled correctly for custom sense resistors?

Because PMBUS_IIN_OC_FAULT_LIMIT corresponds to a physical current passing
through the sense resistor, shouldn't the mantissa be dynamically scaled by
the hardware rimon resistor value in tps25990_probe(), similar to
PSC_CURRENT_IN?

Without scaling, will writing to PMBUS_IIN_OC_FAULT_LIMIT configure the
over-current protection based on the unscaled default resistor value?

> +		.b[TPS25990_IIN_OCF] =3D -2133,
> +		.R[TPS25990_IIN_OCF] =3D -2,
> +	},
>  	[tps25990] =3D {
[ ... ]
> @@ -387,6 +395,59 @@ static struct pmbus_driver_info tps25990_base_info[]=
 =3D {
> +	[tps1689] =3D {
> +		.pages =3D 1,
[ ... ]
> +		.format[PSC_CURRENT_OUT] =3D direct,
> +		.m[PSC_CURRENT_OUT] =3D 24347,
> +		.b[PSC_CURRENT_OUT] =3D 0,
> +		.R[PSC_CURRENT_OUT] =3D -3,
> +		.format[PSC_POWER] =3D direct,
> +		.m[PSC_POWER] =3D 2775,
> +		.b[PSC_POWER] =3D 0,
> +		.R[PSC_POWER] =3D -4,
> +		.func[0] =3D (PMBUS_HAVE_VIN |
> +			    PMBUS_HAVE_VOUT |
> +			    PMBUS_HAVE_VMON |
> +			    PMBUS_HAVE_IIN |
> +			    PMBUS_HAVE_PIN |
> +			    PMBUS_HAVE_TEMP |
> +			    PMBUS_HAVE_STATUS_VOUT |
> +			    PMBUS_HAVE_STATUS_IOUT |
> +			    PMBUS_HAVE_STATUS_INPUT |
> +			    PMBUS_HAVE_STATUS_TEMP |
> +			    PMBUS_HAVE_SAMPLES),

[Severity: Medium]
Are we missing the PMBUS_HAVE_IOUT capability flag here?

The format parameters for PSC_CURRENT_OUT are configured above, but
without the capability flag, isn't the feature inaccessible?

Additionally, does tps25990_probe() need to be updated to dynamically scale
the PSC_CURRENT_OUT mantissa with the rimon sense resistor, just like it
does for PSC_CURRENT_IN and PSC_POWER?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522082349.2749=
970-1-sbogdanov@baylibre.com?part=3D4
