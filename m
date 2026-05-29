Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E859E3B3883
	for <linux-hwmon@vger.kernel.org>; Fri, 29 May 2026 21:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780089963; cv=none; b=FMRWBclCrqep1/oKJUzQC8cyrBycmmQGJX+Tv6ejsoSV1LlVtFauFnCPfQg8iUCvf7sXokqd/assau6/bh2lUfoX5gFc62bt3E3daPegen3FFWWSGtmLlqhn43MhPfjvhOnpB9wgBVq/PLOHPBeM563o+w1xK098qXEWnZwPx+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780089963; c=relaxed/simple;
	bh=hmz70jbwA4eTYpVJ7YTTBO1pYM2C3BqK4rAhGqv9wLw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HaeIqv3r/XCrKhOWoTcHtPu3zSEKXDLpCARQXq7/OqjqS4A/aE4UuA6N3LBH3I5UvkaUa5igm5xwd39GDd59+b4iUyxu79/7wNTXws9pWpcRW0YEqwC+xV/Ufl9mz1ua3owu1BMdYDzHKSrzjbZGOuo5BRwgVc6ZipjLnN3d2iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mSiCrMrl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mSiCrMrl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AD3B1F00893;
	Fri, 29 May 2026 21:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780089962;
	bh=kKQaafutvffCuahB9d2WtpdieVNDFf0bAMf5cjUu/p8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mSiCrMrl15ydxbBp6K7WtEm6a4RzEytDuvQwwzQVW+3/jE0f0Mp7t9OHw6crNuaMS
	 6j7kCAvcyWP0DLMOseLJX1gXCLCgVmGiULpDKLwbtq9jl0QCQEvGDaehUQNiYEN0AG
	 KDQzUTgCRt3K1Zl7sVugs9agOcLUOXRSjkJiSuvD7FhVKAcyg+k8rCJ8G2uO8PHh+A
	 bTBBiJOHaEDDq1iFAreV3K1ZQ4IGyyxW1gy0EreVmih+5vRBjNws7nIfoqU+/56V2M
	 m/h3232rUPW093+No6l05iLoU/cje+N+5O6yDuSvErP1tNzrYXlMz/qJEFhQ0CyhwV
	 GqJjXUFb8ydbw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] hwmon: (cros_ec) Add support for displaying fan
 curves
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFdlacOfc2NodWg=?= <linux@weissschuh.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260529-cros_ec-hwmon-fan-curve-v1-4-da6792b3830f@weissschuh.net>
References: <20260529-cros_ec-hwmon-fan-curve-v1-4-da6792b3830f@weissschuh.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 21:26:01 +0000
Message-Id: <20260529212602.6AD3B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing endianness conversion for EC thermal config data and sen=
sor_num.
--

commit be72df851dc1a1ab2ed2868ddf58166c69fe3c4c
Author: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

hwmon: (cros_ec) Add support for displaying fan curves

The automatic fan control mode of the embedded controller uses fan curves
with two trigger points to calculate the target fan speed. All temperature
sensors affect all fans. Expose these fan curves through the standard
hwmon sysfs ABI.

> diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> index a6cc909e56b7e..731143f8c6b2a 100644
> --- a/drivers/hwmon/cros_ec_hwmon.c
> +++ b/drivers/hwmon/cros_ec_hwmon.c
> @@ -372,6 +375,141 @@ static umode_t cros_ec_hwmon_is_visible(const void =
*data, enum hwmon_sensor_type
>  	return 0;
>  }

[ ... ]

> +static ssize_t temp_auto_point_temp_show(struct device *dev, struct devi=
ce_attribute *attr,
> +					 char *buf)
> +{
> +	struct sensor_device_attribute_2 *sattr =3D to_sensor_dev_attr_2(attr);
> +	struct cros_ec_hwmon_priv *priv =3D dev_get_drvdata(dev);
> +	struct ec_thermal_config config;
> +	u32 temp;
> +	int ret;
> +
> +	scoped_guard(hwmon_lock, dev) {
> +		ret =3D cros_ec_hwmon_get_thermal_config(priv->cros_ec, sattr->index, =
&config);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (cros_ec_hwmon_attr_is_temp_fan_off(sattr))
> +		temp =3D config.temp_fan_off;
> +	else /* temp_fan_max */
> +		temp =3D config.temp_fan_max;

[Severity: Medium]
Since the Chrome OS EC wire protocol is little-endian, do these raw u32
fields need to be converted using le32_to_cpu() to prevent corrupted values
on big-endian hosts?

It looks like the pre-existing cros_ec_hwmon_get_thermal_config() helper
similarly fails to use cpu_to_le32() when assigning req.sensor_num, which
could cause the EC to receive a byte-swapped sensor number.

> +
> +	if (temp =3D=3D 0)
> +		return -ENODATA;
> +
> +	return sysfs_emit(buf, "%ld\n", cros_ec_hwmon_kelvin_to_millicelsius(te=
mp));
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-cros_ec-hw=
mon-fan-curve-v1-0-da6792b3830f@weissschuh.net?part=3D4
