Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EEB2E738F
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Jul 2026 08:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784191116; cv=none; b=TNYZifsOIrEa4HkppioPfHNYrpVrwLFtkVqfPwAM4OtAGcPd3cZE8+Mt9Nr0gDBnLfd8OhpfFXgssgFG87zDnZ/XRsjx/Th/94cQpFyYSCgGJsuH74WTAiq05BS+O+5fDTWSUGv3pSQTwuRCGqEosjRMtSx1nX2ZILfx/Suaz34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784191116; c=relaxed/simple;
	bh=erStrpEq9KQiY5qJpQgZAfkcjQ5gZ036QXy/TA8CxcA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gDBwWAyb3x7VR4nXJZkXNJT+OUIZKsXn+jFfhZoXVQz7fscbj1VgAxCq7IkKoZtWkbz0AWGukxhXCxEedU3+yP+Ne3R3EeGAJmhZWaLDNN+5CI2R22/h+Gy90popCvEVu6JCy2+2w3VaGpq/JJwJotwOsnxHOG7XrTKDYPAfTL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rg80HITr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rg80HITr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DFA01F000E9;
	Thu, 16 Jul 2026 08:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784191114;
	bh=d7v3ObLFSRq4e3qUMr4uP9BNDP0xQwM0XG41X979dJA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rg80HITrHtL+hxegp8q+WYYNOHrWS8RBJlyWvSooVyn9PrhVRg2StdvKub5hgA1ae
	 Cmy+FVcaCa9bzfXMwz90gIUm8ab6D/k6O6RyPi9JFQUG+tyW6Xha5GzCJVBhwPRTpP
	 Sqdrd33lYAcAnUXawpUCQqAbIZ2bMOA2iU1j93ITY8yqfNvgahrNsZciwXLT63e5/D
	 6m7jPQUGtuw/DLYdpybgGGgIyekAOSYFjgX6GOmQkJDsskCvJ4czWkUQmNUOVhRxem
	 pJ/WWGxcVr2Gfyvdw7lVuNaKYlUixiMCkGk3omqnbz69acTPqcbsYwscl4yd4J65QE
	 cq/XgfNm8Rf1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] hwmon: (pmbus/max34440): Add support for MAX34452
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260716-max34451_fixes-v1-3-a941b27eaecb@analog.com>
References: <20260716-max34451_fixes-v1-0-a941b27eaecb@analog.com>
 <20260716-max34451_fixes-v1-3-a941b27eaecb@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 08:38:34 +0000
Message-Id: <20260716083834.9DFA01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing unsupported register masking causes CML errors and ALERT p=
in assertions during probe for max34452.
- [Medium] Brittle hardware revision check assumes max34452 will never reac=
h MAX34451's NA6 revision threshold, risking future hardware misconfigurati=
on.
--

--- Patch [3]: [PATCH 3/3] hwmon: (pmbus/max34440): Add support for MAX3445=
2 ---
commit 35474250b6c0fdacb08c3d70de3d117a0f87d0c2
Author: Carlos Jones Jr <carlosjr.jones@analog.com>

hwmon: (pmbus/max34440): Add support for MAX34452

This commit adds support for the Maxim MAX34452 PMBus 16-Channel V/I Monitor
and 12-Channel Sequencer/Marginer. The device is similar to the MAX34451 and
shares the same configuration functions.

> diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max3444=
0.c
> index 024109df26db5..2e57af09f4780 100644
> --- a/drivers/hwmon/pmbus/max34440.c
> +++ b/drivers/hwmon/pmbus/max34440.c

[ ... ]

> @@ -116,6 +117,10 @@ static int max34440_read_word_data(struct i2c_client=
 *client, int page,
>  			return -ENXIO;
>  		ret =3D -ENODATA;
>  		break;

[Severity: High]
Does the preceding switch case block (for PMBUS_VIN_OV_FAULT_LIMIT,
PMBUS_MFR_MAX_TEMP_1, etc.) also need to exclude max34452, similar to how it
currently excludes max34451?

Because max34452 enables PMBUS_HAVE_TEMP and PMBUS_HAVE_IOUT, the PMBus core
will dynamically query limit registers during probe. Since max34452 isn't
excluded in that preceding check, it returns -ENODATA instead of -ENXIO. Th=
is
causes the core to perform physical I2C reads on unsupported registers, whi=
ch
can trigger CML errors and assert the hardware ALERT pin on the max34452.

> +	case PMBUS_VOUT_OV_WARN_LIMIT:
> +		if (data->id =3D=3D max34452)
> +			return -ENXIO;
> +		return -ENODATA;
>  	case PMBUS_VIRT_READ_VOUT_MIN:

[ ... ]

> @@ -340,6 +351,7 @@ static int max34451_set_supported_funcs(struct i2c_cl=
ient *client,
>  	if (rv < 0)
>  		return rv;
> =20
> +	/* MAX34452's latest MFR_REV is only at 0x0004, will skip this part */
>  	if (rv >=3D MAX34451ETNA6_MFR_REV) {
>  		max34451_na6 =3D true;
>  		data->info.format[PSC_VOLTAGE_IN] =3D direct;

[Severity: Medium]
Will this cause issues if a future max34452 silicon revision increments its
MFR_REVISION to 0x0012 (MAX34451ETNA6_MFR_REV) or higher?

Since the check relies solely on the revision number without explicitly
verifying if the device ID is max34451, a future max34452 revision could
mistakenly trigger this MAX34451-specific silicon workaround. This would
unintentionally enable VIN/IIN channels and alter IOUT scale factors.

Could we check the device ID explicitly here to prevent this?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716-max34451_f=
ixes-v1-0-a941b27eaecb@analog.com?part=3D3
