Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147A451597E;
	Wed, 14 Oct 2026 13:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984593; cv=none; b=ha6WvOeBdSbWOjaMgSRd+EFWNVRRUHq4caEZjBgEgy+cT3G3HnfGBqndiBieGHrkm5bd2PTT6diSITbsjEyjsYCQmzQ1jfip2Z8lZcbOyaNjANOsOfeAp2FvtN9aJ+jDIl6o9DOlppRhNfmLoSTWUxgDwb2Jd4gw2KzIGBWfpKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984593; c=relaxed/simple;
	bh=PdbxQWzL9SkDId6I2TNNKLeeeS8txlSupFdzqRqFUJA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=jIIp+JB2KVIMdCyFXyMrWq9DtwG4hjtN3Zq8GX7Qin6wcW+GhCsqUbOcKWdaYzO9pJr696u58E8aJqv5bcvo9JZzVS6MkpIGVTSHStYShHKYqV9OQruMUzUh+l6VujuvK8ewu4/ztx3VxZmlLGKG20mU/i1Qo6ndOX3Jj3wOdKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YhxkP0QQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YhxkP0QQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 089851F00898;
	Wed, 14 Oct 2026 13:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791984586;
	bh=DVu/8aE7IpZ6/4ov7UXOi8cfzdZUQxw5e6MKVEfIrKs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YhxkP0QQM/cBf8lKypTZcFYgMtXuYtZopQ2nAC7R69wx6mi+8f4NmwfumgaF+FrQg
	 7ndiP9OKCPbu7cBaOnbapLUQE7MypQYyBG43FHSLIYBTquSWxbLajazfbBG/qnzrBB
	 FJE+H4GbozgLRq2xWs4megTAynsrQuvqkYMgFQ9K9mzmR0/+TGR2APBYWolXjRvdDZ
	 n0x7AE53lF9V2RwPglcV4rGBS49X2hvpz/8ZcZu2RDnSP6FhCs9EMsCUt4vt02p7FA
	 Y6XsSknZUzGTmAR7PA+vrbzswJLzPprNczPPLJgBwi9wBNZR2twWmaWcD3I87XNaQG
	 JWDFV8/iouywg==
Message-ID: <sashiko-outbox-171356@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/3] platform/arm64: add Lenovo Yoga Slim 7x Gen 11
 EC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleg Keri" <okerixx@gmail.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014132315.4659-3-okerixx@gmail.com>
References: <20261014132315.4659-1-okerixx@gmail.com>
 <20261014132315.4659-3-okerixx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 13:29:45 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] hwmon: registering hardware monitoring device outside drivers/hwmon=
/ violates layering
- [Low] i2c: struct i2c_device_id array uses positional initialization inst=
ead of named initializers
--

commit ebc39e385bee7e339220d234fab99f84ba72d285
Author: Oleg Keri <okerixx@gmail.com>

platform/arm64: add Lenovo Yoga Slim 7x Gen 11 EC driver

This commit adds the Lenovo Yoga Slim 7x Gen 11 embedded controller driver.
It exposes thermistors, CPU fan speed, keyboard backlight LED, hotkeys, and
an fn-lock sysfs attribute.

> diff --git a/drivers/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c b/drive=
rs/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c
> new file mode 100644
> index 0000000000000..53b0e7b325d35
> --- /dev/null
> +++ b/drivers/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c

[ ... ]

> +static int slim7x11_ec_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct device *hwmon;
> +	struct slim7x11_ec *ec;
> +	unsigned int i;
> +	int ret;

[ ... ]

> +	dev_dbg(dev, "thermistors present: %#lx\n", ec->temp_present);
> +
> +	hwmon =3D devm_hwmon_device_register_with_info(dev, "yoga_slim7x_ec", e=
c,
> +						     &slim7x11_ec_chip_info, NULL);

[Severity: Low]
Does this code register a hardware monitoring device directly from outside =
the
drivers/hwmon/ directory?=20

According to the hwmon subsystem guidelines, if the main functionality of a
chip is not hardware monitoring, its hardware monitoring functionality shou=
ld
be implemented as an auxiliary device driver, and the hardware monitoring
driver itself should reside in drivers/hwmon/.

> +	if (IS_ERR(hwmon))
> +		return PTR_ERR(hwmon);
> +

[ ... ]

> +static const struct of_device_id slim7x11_ec_of_match[] =3D {
> +	{ .compatible =3D "lenovo,yoga-slim7x-gen11-ec" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, slim7x11_ec_of_match);
> +
> +static const struct i2c_device_id slim7x11_ec_i2c_id[] =3D {
> +	{ "slim7x-gen11-ec" },

[Severity: Low]
Is this using a positional initializer?

The I2C subsystem guidelines state that initialized arrays of type
struct i2c_device_id must be declared const and use named initializers
(such as .name =3D "slim7x-gen11-ec").

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, slim7x11_ec_i2c_id);
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014132315.4659=
-1-okerixx@gmail.com?part=3D2
