Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845224399C4;
	Sat,  3 Oct 2026 20:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791059366; cv=none; b=Pf9O3EBfGGwI7Mrl+k0YokYVdI6dJqSbw+N4+frU7nkJR68atwyPYjPRtKJx4JaadiTib8HUX7+MSGb28fVCaSAsWQH9JO3dDkCXnpcjoqCgWZ+YV8IpKzLObEE63FWTHQ6lm2WOrBLkJO21wzBISaL9F8NkJjWByQuwgbV7Wl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791059366; c=relaxed/simple;
	bh=347PMTUQfI8gzFrdmAs1Hfg3uIJgXzjc08e75xuHfJM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LQb5ciaEypdZ/SX/o5iyflwecJinbww3jXGE490atzH4wnoCTRSg0RnnBV6Hve+stJdhXvSOZJn1kRJNGyqMO76NyjGnbdEgPuxQB09Bz2RbICyUDCNzOGQHlwhT6NTug5Cu2KfjrCrj09CxeKaaWpo5UfgLDOXPzQMxpCOLUdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lfHmE4PH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lfHmE4PH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DECC1F0089B;
	Sat,  3 Oct 2026 20:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791059365;
	bh=7VZx5OHuI/fq48fGZFDaF2dYkCodU2PpFhlJl2qmUxU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lfHmE4PHtN22YVuycTI1ffcXUQdCWFeCfSdUgTuZA/Z/eoEzUnyVqLAuE7eYVhRTA
	 C+bmIUK1bw/NX2BBFMyLo4qiWQAONThOX8jjzOLphS6OsdkNtHmc+XpBBXl5WPOgwt
	 kl+F7nlJ8rgnLfs5fA+bAqtKNpxvp2k2+I4OjfNW1kIsgdg8qAf0TTRnQ5PI3mIdLv
	 eFkEEjnAbDYS3uPV+65eEpFKqhub7+6Zw+tTvD/v8eKQPMcIEZmfqa49V5wEZ/Krrw
	 gEcD73qLOx77Jl++xwwwerdeAHJ1WYYSOsPoSy852mid/4DPBQ02KwmygwQZJ3yv+g
	 wF2itbc3KJwtg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] platform/arm64: add Lenovo Yoga Slim 7x Gen 11
 EC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleg Keri" <okerixx@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20261003202143.4697-3-okerixx@gmail.com>
References: <20261003202143.4697-1-okerixx@gmail.com>
 <20261003202143.4697-3-okerixx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 03 Oct 2026 20:29:24 +0000
Message-Id: <20261003202925.1DECC1F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] hwmon: hardware monitoring registration outside drivers/hwmon/
--

commit 1e4db7708b954def668e65b4325f61905437ade8
Author: Oleg Keri <okerixx@gmail.com>

platform/arm64: add Lenovo Yoga Slim 7x Gen 11 EC driver

This commit introduces a new embedded controller driver for the Lenovo Yoga=
=20
Slim 7x Gen 11. It exposes board thermistors and CPU fan speed through the=
=20
hardware monitoring subsystem, as well as a keyboard backlight via the LED=
=20
subsystem.

> diff --git a/drivers/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c b/drive=
rs/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c
> new file mode 100644
> index 0000000000000..1ef11b9eeffab
> --- /dev/null
> +++ b/drivers/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c
[ ... ]
> +static int slim7x11_ec_probe(struct i2c_client *client)
> +{
[ ... ]
> +	if (!ec->temp_present) {
> +		return dev_err_probe(dev, -ENODEV,
> +				     "no thermistor reported a usable value\n");
> +	}
> +
> +	dev_dbg(dev, "thermistors present: %#lx\n", ec->temp_present);
> +
> +	hwmon =3D devm_hwmon_device_register_with_info(dev, "yoga_slim7x_ec", e=
c,
> +						     &slim7x11_ec_chip_info, NULL);

[Severity: Low]
Does this hardware monitoring registration bypass the hwmon subsystem=20
architectural layering rules?=20

According to the hwmon subsystem guidelines, hardware monitoring devices=20
should reside in the drivers/hwmon/ directory. If a device has secondary=20
functionality or its main functionality isn't hardware monitoring, the hwmo=
n=20
features should be implemented as an auxiliary device driver, and that driv=
er=20
should reside in drivers/hwmon/.

Registering the hwmon device directly from drivers/platform/arm64/ increase=
s=20
driver complexity and bypasses hwmon maintainer review.

> +	if (IS_ERR(hwmon))
> +		return PTR_ERR(hwmon);
> +
> +	ec->kbd_led.name =3D "platform::kbd_backlight";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261003202143.4697=
-1-okerixx@gmail.com?part=3D2
