Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2906466B0B;
	Thu, 17 Sep 2026 11:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789643024; cv=none; b=a6XveOxds5NopBpmKgZ+t9SxAwJPETq+5nhWdLB6qbMVyle4YW3ZU6zGHaR0zNZdEbMgKnxgrgBuSe1ey0ZYZ8xFv3HvMg6ASPkGi+L55y+/ZX5l4cG3f1z6oQdqZtJPzEpRYtY+r6asxNqKwQrg5WG7A6/ryjPnCPFBtNLHkaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789643024; c=relaxed/simple;
	bh=B3EPNq22paVC95GrvTEhjPzjAzmVfERgKaz6+c8VjFU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r4JWFfdtHW/AlJS25EbM6s+td4Fy6GiJkA08OYMHmsbpCjidv3GOHVLeSfuZx4wnqOJKdXzilMtsFlOiXxJE07tdy5jQd6PA0k4Hgr8KTgi8ZflMbIA4oaDDcLkAApVX0WRA4QGrzIH804IBQjRhe+OOUesPzqWJeddxQ4b9W9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LkvqRZqb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LkvqRZqb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F23201F000FF;
	Thu, 17 Sep 2026 11:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789643011;
	bh=6xubwqBm89bIscoCpTE9eKryxOoykZ6oVcAfHWWFiOg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LkvqRZqbISuKc22SWGZugKvxYnyN60l7njrfD6NnblSZrhDbnxx8AGWzfkNafKOId
	 QABHPVCzyZLKqbk+1qT/lS3iShvDnuDepBIlQvIJHKZvHCXLL2f4Ow/5HBg6pNOjoI
	 DUb/wVJXUVviceW7wpn6vbgEYsGFkv7EWhKZ2P568yFiqLDIqjjkkgrmAV7StJ9cBH
	 noM78uU4lwshlLuLHiYqtScdVt4cDpTXEf/cSnZhnx676c2RFKYhhxcQZQmMu0pxqK
	 tentrXwCVUOeYSaNPqztUHztlRcKbWkEpvXuupqGOn3pEPy5Ne31GmNH99Sxhot9kg
	 BFn1uamErQJww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] platform: arm64: Add a driver for the EC found on
 ASUS Glymur machines
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260917-topic-asus_ec-v1-2-373516d347ae@oss.qualcomm.com>
References: <20260917-topic-asus_ec-v1-0-373516d347ae@oss.qualcomm.com>
 <20260917-topic-asus_ec-v1-2-373516d347ae@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 11:03:30 +0000
Message-Id: <20260917110330.F23201F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] hwmon: registering device outside drivers/hwmon/ violates subsystem=
 layering
- [Low] i2c: i2c_device_id array uses positional initializer instead of nam=
ed
- [Low] kconfig: unnecessary depends on INPUT for EC_ASUS_GLYMUR config
--

commit 48807c08f64129a6603cbfbeafcd0f00c0ee954d
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
platform: arm64: Add a driver for the EC found on ASUS Glymur machines

This commit introduces a driver to communicate with the custom Embedded
Controller found on ASUS Zenbook A14 and A16 laptops based on Qualcomm
Snapdragon X2 Elite processors. It enables capabilities like fan speed
monitoring, keyboard backlight control, and receiving various sideband even=
ts.

> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kcon=
fig
> --- a/drivers/platform/arm64/Kconfig
> +++ b/drivers/platform/arm64/Kconfig
[ ... ]
> +config EC_ASUS_GLYMUR
> +	tristate "ASUS Zenbook A16 (Qualcomm) Embedded Controller driver"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on I2C
> +	depends on HWMON
> +	depends on INPUT

[Severity: Low]
Does this driver actually depend on the input subsystem?

Looking at asus-glymur-ec.c, it does not include linux/input.h, register any
input devices, or call any input APIs. Is it possible to drop this dead
dependency to prevent unnecessarily restricting the build target?

> +	depends on PM
> +	depends on THERMAL || THERMAL=3Dn
> +	select NEW_LEDS

[ ... ]

> diff --git a/drivers/platform/arm64/asus-glymur-ec.c b/drivers/platform/a=
rm64/asus-glymur-ec.c
> --- /dev/null
> +++ b/drivers/platform/arm64/asus-glymur-ec.c
[ ... ]
> +static int asus_glymur_ec_probe(struct i2c_client *client)
> +{
[ ... ]
> +	ec->hwmon_dev =3D devm_hwmon_device_register_with_info(dev,
> +							     "asus_glymur_ec",
> +							     ec,
> +							     &asus_ec_hwmon_chip_info,
> +							     NULL);

[Severity: Low]
Does registering the hardware monitoring device directly from the platform
directory bypass the hwmon subsystem layering rules?

According to the subsystem guidelines, if a chip's main functionality is not
hardware monitoring, its hwmon features should be implemented as an auxilia=
ry
device driver residing inside drivers/hwmon/.

> +	if (IS_ERR(ec->hwmon_dev))
> +		return dev_err_probe(dev, PTR_ERR(ec->hwmon_dev),
> +				     "Failed to register hwmon\n");
> +
> +	return 0;
> +}
[ ... ]
> +static const struct of_device_id asus_glymur_ec_of_match[] =3D {
> +	{ .compatible =3D "asus,zenbook-a14-ux3407na-ec" },
> +	{ .compatible =3D "asus,zenbook-a16-ux3607oa-ec" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, asus_glymur_ec_of_match);
> +
> +static const struct i2c_device_id asus_glymur_ec_id[] =3D {
> +	{ "asus-glymur-ec" },

[Severity: Low]
Is it possible to use named initializers for this i2c_device_id array?

The I2C subsystem guidelines require initialized arrays of this type to use=
 the
named format (e.g. { .name =3D "asus-glymur-ec" }) rather than a positional
initializer.

> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, asus_glymur_ec_id);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-topic-asus=
_ec-v1-0-373516d347ae@oss.qualcomm.com?part=3D2
