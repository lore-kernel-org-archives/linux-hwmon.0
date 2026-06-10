Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AB023817E
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 02:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781056976; cv=none; b=XXW6wXsSGFc3LpXZM2rL3BO4ry5xX8RfvGbwSumt+2fBOKuIUnebuzH43v94KKrwFDPdb9CcYPmYIHNh42W8gA2aJ3/2cgkYKZyHBZJBnioITPArxsE/RSGqf2NwvV6bVsyTPbmNenRFqJKHbuCeeeU85iLE76SnmwFof3HADMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781056976; c=relaxed/simple;
	bh=AETep0fzuAsyvUDvfjslI00oGc+HpCl4uzp0dc+x36s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QEKraGcdrBuJSYjxIima1JRnZ65cNaCtN+FEZFGjOkfjeXjK2+5c3mza1HOYrFKUzvzN5n/F8I6sqwIuSi9XsSK6fhg+mqAB+5Gpl5PbWJGtD/pDeyRqDQ79vOrZKOj3SY7o31owy24BUxE01Kso2VJ4yHP1AUzbGtuE8QsBWTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D8lZECh2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D8lZECh2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC891F00893;
	Wed, 10 Jun 2026 02:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781056975;
	bh=AMgXR6gGpJ2uWWy7cFf4USCSD92uEyzw5U4UcIWcwF0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D8lZECh2A6gTNzAATtt7RMLrKkvzBtAXKR4ixVB0mI+9KUDyqHkFHV61loXlkyHxo
	 FD9O9y3ryjVMdsgs2ejxFgKduGsZ3/Tr9myhTKjdnH5SKbmUcqSEaK8IFqFpJVR5Kr
	 dKwsANgX6j3f5xjdF+nPvmRsCHBNBzoA3wF6yGxUZ6KnKbPYBQSCm6XUXxweX0fnHb
	 V3QoRdCFuPiNdgB5za8FOyBVEUsEyTUkEqUzX/qaVovd8T4FYkrR6kH407Ohs5Cb0+
	 je2RlfgD7f/kCmKziSIhsXO8hfXKUPNdDG0dmyILMiRt1VBMdnOIO3i7JLr+oAUdtk
	 eOeHvAXUEf3gg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/4] hwmon: (gpd-fan): drop global driver data and
 use per-device allocation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pei Xiao" <xiaopei01@kylinos.cn>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <1cd3e13033fdd3d0f9b59322f7c86e350d113b92.1781055639.git.xiaopei01@kylinos.cn>
References: <1cd3e13033fdd3d0f9b59322f7c86e350d113b92.1781055639.git.xiaopei01@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 02:02:54 +0000
Message-Id: <20260610020255.3EC891F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Software state initialization in `probe()` is not synchronized wit=
h actual hardware state.
--

commit 072171983894d237c762c5fb521a8b93d2504d1f
Author: Pei Xiao <xiaopei01@kylinos.cn>

hwmon: (gpd-fan): drop global driver data and use per-device allocation

This patch replaces the global state gpd_driver_priv with per-device private
data (struct gpd_fan_data) allocated during probe. This allows the driver to
support multiple instances in the future and aligns with kernel best practi=
ces.

> diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
> index 80de5f20781eb..7284babd4f5c9 100644
> --- a/drivers/hwmon/gpd-fan.c
> +++ b/drivers/hwmon/gpd-fan.c

[ ... ]

> @@ -624,24 +629,42 @@ static int gpd_fan_probe(struct platform_device *pd=
ev)
>  		return dev_err_probe(dev, -EBUSY,
>  				     "Failed to request region\n");
> =20
> +	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	match =3D dev_get_platdata(dev);
> +	if (!match)
> +		return -EINVAL;
> +
> +	data->drvdata =3D match;
> +	data->pwm_enable =3D AUTOMATIC;
> +	data->pwm_value =3D 255;
> +
> +	dev_set_drvdata(dev, data);
> +

[Severity: High]
This is a pre-existing issue, but I noticed that while the software state
for pwm_enable is initialized to AUTOMATIC here in gpd_fan_probe(), there
doesn't appear to be a corresponding write to the hardware EC to actually
set this mode.

If the fan was left in manual mode by a previous driver instance, a crash,
or the BIOS, won't it remain stuck at a fixed speed while the sysfs interfa=
ce
reports automatic to userspace?

Could this mismatch cause OS thermal management daemons to falsely assume
the hardware is dynamically managing the fan, potentially leading to silent
thermal throttling or shutdowns under heavy load?

>  	hwdev =3D devm_hwmon_device_register_with_info(dev,
>  						     DRIVER_NAME,
> -						     NULL,
> +						     data,
>  						     &gpd_fan_chip_info,
>  						     NULL);
>  	if (IS_ERR(hwdev))
>  		return dev_err_probe(dev, PTR_ERR(hwdev),
>  				     "Failed to register hwmon device\n");
> =20
> -	gpd_init_ec();
> +	gpd_init_ec(data);
> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1781055639.gi=
t.xiaopei01@kylinos.cn?part=3D1
