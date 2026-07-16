Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0DC39D3DA
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Jul 2026 08:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784190946; cv=none; b=frzK5nce0LEsmvcyOSkKphXwoD1Q//KyGimzz8+Y6FkZLZhys5pkE0EBxXHEV2lZTfcQBcPaXDqAYpnOPrqNdcIXW5Sf9AI8c2xf93vRTXacLwhaA4yJuZMoFeaXMfvkkIBHhjDBrZzEjq3eiO2/QBnk6uZBSyh7/DdTSgZCotE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784190946; c=relaxed/simple;
	bh=W+DoLCDWqVKR7smRcTP0pYqQRbdiAzYe7zZOd1gQ93Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OSf0l0aKjK/T/QhETjVRXy8PcARn7/XpADHOj2JUvC0Fp9IDa6riVA8FdTFWAjfUhjA6AQCjtR193SisBQYIIGNH64zHAaY16kSs7Qqsvm/S1ul4MCFVKU6gZAEm9pA2Zbe2K7xJottiICyJotRYStmzvd+e+Skd9M0qDotnb5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=foLdBBZB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="foLdBBZB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B5B91F000E9;
	Thu, 16 Jul 2026 08:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784190944;
	bh=LFWeAfxh7KOLXFM9JIjoE4Rco8mk7ICRqg4aTsrsUHo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=foLdBBZBfvgcf9fUeTg25ttGNt8SqwnqBlJmS5h0Yq3uYroi7N+4ifCn1QO/Et8hV
	 FffezHBnoKQeRJza++M0QLQozkjc45DNfQdWMG59F3zdoYO4mbYYHYFNHDFCJ1d3zU
	 Tb2Vy+N8i9F+CmvbYqU4eXZ2HHnrBEFrk+1AHJDhDoC6FcKoJwMmYYpRWep2Kat8IS
	 /UEmCPuIVtHh0CXYNmPuBxC4Qa8DAK+PNxvs66c/hBHIr/8bHw7r5ma76iDXLJOcav
	 TvaqiQ9ZG7DfBgHCo2/mry4QS8NRvKY4yS4r/rEgErqgFpSP1zKcdLWAqZM2mPk9Tq
	 dkVjCnSFWGm7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] hwmon: (pmbus/max34440): add support for newer
 version of max34451
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260716-max34451_fixes-v1-2-a941b27eaecb@analog.com>
References: <20260716-max34451_fixes-v1-0-a941b27eaecb@analog.com>
 <20260716-max34451_fixes-v1-2-a941b27eaecb@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 08:35:43 +0000
Message-Id: <20260716083544.1B5B91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Forward compatibility issue in ETNA8+ revision check due to stri=
ct equality
--

--- Patch [2]: [PATCH 2/3] hwmon: (pmbus/max34440): add support for newer v=
ersion of max34451 ---
commit 02e46b67255562393d163820572cc52a0cabe3e7
Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

hwmon: (pmbus/max34440): add support for newer version of max34451

This commit adds support for the max34451etna8+ hardware revision.
It updates the direct format coefficients specifically for this newer
revision.

> diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max3444=
0.c
> index e56057e9273c1..024109df26db5 100644
> --- a/drivers/hwmon/pmbus/max34440.c
> +++ b/drivers/hwmon/pmbus/max34440.c

[ ... ]

> @@ -343,12 +344,24 @@ static int max34451_set_supported_funcs(struct i2c_=
client *client,
>  		max34451_na6 =3D true;
>  		data->info.format[PSC_VOLTAGE_IN] =3D direct;
>  		data->info.format[PSC_CURRENT_IN] =3D direct;
> -		data->info.m[PSC_VOLTAGE_IN] =3D 1;
> +
>  		data->info.b[PSC_VOLTAGE_IN] =3D 0;
> -		data->info.R[PSC_VOLTAGE_IN] =3D 3;
> -		data->info.m[PSC_CURRENT_IN] =3D 1;
>  		data->info.b[PSC_CURRENT_IN] =3D 0;
> -		data->info.R[PSC_CURRENT_IN] =3D 2;
> +		if (rv =3D=3D MAX34451ETNA8_MFR_REV) {

[Severity: Medium]
Will this strict equality check cause issues with future hardware revisions?

The commit message mentions adding support for the ETNA8+ version, but if a
subsequent hardware revision probes with a manufacturer revision greater th=
an
MAX34451ETNA8_MFR_REV (e.g., 0x0015), the outer check
rv >=3D MAX34451ETNA6_MFR_REV will evaluate to true, but this inner check w=
ill
fail.

This causes the code to silently fall through to the else block, regressing=
 to
the older ETNA6 coefficients rather than retaining the newer ETNA8 ones.

Could this use >=3D instead of =3D=3D to maintain forward compatibility, si=
milar
to how ETNA6 is checked on line 328?

> +			data->info.m[PSC_VOLTAGE_IN] =3D 125;
> +			data->info.R[PSC_VOLTAGE_IN] =3D 0;
> +			data->info.m[PSC_VOLTAGE_OUT] =3D 125;
> +			data->info.R[PSC_VOLTAGE_OUT] =3D 0;
> +			data->info.m[PSC_CURRENT_IN] =3D 250;
> +			data->info.R[PSC_CURRENT_IN] =3D -1;
> +			data->info.m[PSC_CURRENT_OUT] =3D 250;
> +			data->info.R[PSC_CURRENT_OUT] =3D -1;
> +		} else {
> +			data->info.m[PSC_VOLTAGE_IN] =3D 1;
> +			data->info.R[PSC_VOLTAGE_IN] =3D 3;
> +			data->info.m[PSC_CURRENT_IN] =3D 1;
> +			data->info.R[PSC_CURRENT_IN] =3D 2;
> +		}
>  		data->iout_oc_fault_limit =3D PMBUS_IOUT_OC_FAULT_LIMIT;
>  		data->iout_oc_warn_limit =3D PMBUS_IOUT_OC_WARN_LIMIT;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716-max34451_f=
ixes-v1-0-a941b27eaecb@analog.com?part=3D2
