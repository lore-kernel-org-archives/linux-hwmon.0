Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AAB27A462;
	Tue, 28 Jul 2026 02:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785204557; cv=none; b=RrxzyTzlIfScA2mT4HbzTv9ZQrUlQv3ICP9eB/EseiAtCRUeKGfm+J44Uxx9orgj99uZn9fomCidDBVm5XpceiDiQJaL4lAklpuLWe35e1feQ8Dc0yXg2tML0odlOlSF9wd69rVMr3Q1gWxJzZGVctby51MNhOnBMuich9klz0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785204557; c=relaxed/simple;
	bh=Po3u26tiy9fzKS4s3ibDoD5Sv3IGtwqNG1ehd74heSg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nyIElxSn7/BxFoYWMm1V0expTYlv1azTm0rAzSl3QFylB6rZRbPaCt7TDVFEiHBdJOdkLS4XJDECKXp9RxfR/jZeP24YyvhlvHrb+64t0wPgQl5M0D4xRBIFVi7UFmSpIoOcBbHm1TaY9Nfqx86wylX8pqu2s1rToocQ4y2glrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lB5Hmw2C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lB5Hmw2C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C37C11F00A3D;
	Tue, 28 Jul 2026 02:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785204556;
	bh=YE9d1hPc3QvOYyY3eTPQmeCNlJ71ZgWMCr0cx8b21fw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lB5Hmw2CnXjZw+tKFeunEbNmM9+iwJMdzi2PbDb+QazqPt8hjkvC6A2r2QKSAywRp
	 SvVekranoXhrxH8Kc6tVjyCwop1bvDW/LmqGO//rnd4hbgtwM9vWp7hdVvDMBizpJj
	 bDz8X0Ac7W+rSLayXUymTVwPNHHa+B4sphV7BesnGJGvEcU5UAmKPjsf9HxBYjTvMM
	 onAtPbMm7ikLm45sfV5G3/4XJPdnKbi3YEGeKSkn0YVlS9UN4nX7bUrhMNCX5/bBz4
	 +3xbS5Syh/AwJgX9Zh7x4wjmAz1G1KaZeqGJ9McATXt6rHHCEg6XMI2DEIi0DaennU
	 pODA0UwFc9y+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] hwmon: (pmbus/tps25990): Add TPS1689 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stoyan Bogdanov" <sbogdanov@baylibre.com>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728015857.193890-4-sbogdanov@baylibre.com>
References: <20260728015857.193890-1-sbogdanov@baylibre.com>
 <20260728015857.193890-4-sbogdanov@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 02:09:15 +0000
Message-Id: <20260728020915.C37C11F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] When writing the `PMBUS_IIN_OC_FAULT_LIMIT` for `tps1689`, the 16-=
bit `value` is passed directly to `pmbus_write_byte_data()` without clampin=
g, causing silent integer truncation and incorrect hardware limits.
- [Medium] The `tps1689` configuration defines format and coefficients for =
`PSC_CURRENT_OUT`, but misses the required capability flag and scaling logi=
c, leaving it completely unused and broken.

Pre-existing issues:
- [High] When a user requests a voltage or current limit lower than the bas=
e hardware offset, the unsigned 16-bit limit underflows, silently configuri=
ng the hardware to its absolute maximum limit.
--

--- Patch [3]: [PATCH v5 3/3] hwmon: (pmbus/tps25990): Add TPS1689 support =
---
commit 3362ebf6e63c82cf07dc00cc00e78fd1761514ef
Author: Stoyan Bogdanov <sbogdanov@baylibre.com>

hwmon: (pmbus/tps25990): Add TPS1689 support
   =20
Extend the existing TPS25990 driver to support the TPS1689 eFuse,
as both devices share the same command interface and functionality.
Update the documentation to include TPS1689 support.

> diff --git a/drivers/hwmon/pmbus/tps25990.c b/drivers/hwmon/pmbus/tps2599=
0.c
> index 490dcd2a5fa51..7e2991a85da13 100644
> --- a/drivers/hwmon/pmbus/tps25990.c
> +++ b/drivers/hwmon/pmbus/tps25990.c

[ ... ]

> @@ -253,20 +262,23 @@ static int tps25990_write_word_data(struct i2c_clie=
nt *client,
>  		value =3D clamp_val(value, 0, 0xff);
>  		ret =3D pmbus_write_word_data(client, page, reg, value);
>  		break;
>  	case PMBUS_VIN_OV_FAULT_LIMIT:
> -		value -=3D TPS25990_VIN_OVF_OFF;
> -		value =3D DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_VIN_OVF_D=
IV,
> -					  TPS25990_VIN_OVF_NUM);
> -		value =3D clamp_val(value, 0, 0xf);
> +		if (data->chip_id =3D=3D tps25990) {
> +			value -=3D TPS25990_VIN_OVF_OFF;
> +			value =3D DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_VIN_OVF_=
DIV,
> +						  TPS25990_VIN_OVF_NUM);
> +			value =3D clamp_val(value, 0, 0xf);
> +		}

[Severity: High]
This is a pre-existing issue, but could this calculation underflow if the u=
ser
requests a limit lower than the base hardware offset?

If a limit is requested where the value is less than TPS25990_VIN_OVF_OFF (=
155),
wouldn't the u16 value silently underflow to a very large positive number w=
hen
subtracted?

Since this huge value is then scaled and passed to clamp_val() against 0xf,
would this result in setting the absolute maximum possible limit in the har=
dware
instead of the requested low limit, inadvertently bypassing the protections?

>  		ret =3D pmbus_write_word_data(client, page, reg, value);
>  		break;
> =20
>  	case PMBUS_IIN_OC_FAULT_LIMIT:
> -		value -=3D TPS25990_IIN_OCF_OFF;
> -		value =3D DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_IIN_OCF_D=
IV,
> -					  TPS25990_IIN_OCF_NUM);
> -		value =3D clamp_val(value, 0, 0x3f);
> +		if (data->chip_id =3D=3D tps25990) {
> +			value -=3D TPS25990_IIN_OCF_OFF;
> +			value =3D DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_IIN_OCF_=
DIV,
> +						  TPS25990_IIN_OCF_NUM);
> +			value =3D clamp_val(value, 0, 0x3f);
> +		}

[Severity: High]
This is also a pre-existing issue, but does this face the same underflow ri=
sk
if the requested limit is less than TPS25990_IIN_OCF_OFF?

>  		ret =3D pmbus_write_byte_data(client, page, TPS25990_VIREF, value);

[Severity: High]
When data->chip_id =3D=3D tps1689, this code skips the scaling block and pa=
sses
the u16 value directly into pmbus_write_byte_data().

Does this silently truncate the 16-bit value into an 8-bit register write?

If a large limit is requested, could this truncation cause it to wrap around
to a very small limit, potentially causing the eFuse to prematurely cut pow=
er?

>  		break;

[ ... ]

> @@ -347,6 +359,59 @@ static const struct regulator_desc tps25990_reg_desc=
[] =3D {
>  #endif
> =20
>  static struct pmbus_driver_info tps25990_base_info[] =3D {
> +	[tps1689] =3D {
> +		.pages =3D 1,

[ ... ]

> +		.format[PSC_CURRENT_OUT] =3D direct,
> +		.m[PSC_CURRENT_OUT] =3D 24347,
> +		.b[PSC_CURRENT_OUT] =3D 0,
> +		.R[PSC_CURRENT_OUT] =3D -3,

[ ... ]

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
The configuration defines format and coefficients for PSC_CURRENT_OUT, howe=
ver
the func[0] capability flags do not include PMBUS_HAVE_IOUT.

Does this mean the PMBus core will completely ignore the output current sen=
sor?

Additionally, looking at tps25990_probe(), it appears dynamic scaling for t=
he
rimon resistor is applied for PSC_CURRENT_IN and PSC_POWER, but not
PSC_CURRENT_OUT:

drivers/hwmon/pmbus/tps25990.c:tps25990_probe() {
    ...
	/* Adapt the current and power scale for each instance */
	tps25990_set_m(&data->info.m[PSC_CURRENT_IN], rimon);
	tps25990_set_m(&data->info.m[PSC_POWER], rimon);
    ...
}

Would this reading be incorrect even if the sensor capability were enabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728015857.1938=
90-1-sbogdanov@baylibre.com?part=3D3
