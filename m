Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBAD325491;
	Mon, 18 May 2026 11:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104778; cv=none; b=Uj07+SUfIF2VaAGlgpEDYJ1tpEwRc/kZ8oNnuadhMR6KW4L9DtNGsLRpIHw09oPXgNvR2d5WgCYqcXjZeBtAe5s4dSLOdwcl+5/E8PImL/A1VEQRGQap8DiL4f9cuGwWTeOiVwkHQWUJdsbfqYlRiEcoL7sa0J9fueHgHbkqZiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104778; c=relaxed/simple;
	bh=O/pwzqRu2WmJr9zRBK96Yj3d47SMwBWRGkBwHkoayuQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lwxgGv7mLHpGjH31yzkzCVQhaG++VLhNCgTX0NzcMVmno6kjXAgXqhvuWIh+mflGjtWVcXKYVT9Wqx2FdBUbx5NwP29GojIJNCdUkTTsmCgVuXOqg7H0UaU1186UimF22w+Pg+5Vs1+cEobPiEm7HCTJ/unWooapPjFxnji7LAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ajIiep4u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ajIiep4u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 995E2C2BCC6;
	Mon, 18 May 2026 11:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779104778;
	bh=O/pwzqRu2WmJr9zRBK96Yj3d47SMwBWRGkBwHkoayuQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ajIiep4umMEeQYb2a6AbIHbcROhdZNR3+xoXW7mdlngdc9nBL3cBzzEA9c3O0LHzc
	 A2UzmjdVSFVXf341CV9Vg7dASV7d4l0kXyCbSfzgOlNen/SRu9uyOqJI1OrBq4xUIL
	 Osbj5KGggP+tC0pnzxaDXibW+BqwG7BO+QqY5h5tfR8dD1YujgDTRmD+P0m0lnDQmc
	 4ut87dbY/dDtEbpn5ib0CKdsZ2VSD9+WZzBLzJ71fFfS8l6lDRzFQBZvhIOVivaB6i
	 dkIvQWycRjkaZZ4oZnX79ZxEMgahuxgOC8GIZnOn+IcYTjEl6d56PowLm5VdgOqg/n
	 7ETDEAQHUAmaw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 4/6] pinctrl: add NXP MC33978/MC34978 pinctrl driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleksij Rempel" <o.rempel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260518100054.3552143-5-o.rempel@pengutronix.de>
References: <20260518100054.3552143-5-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 11:46:16 +0000
Message-Id: <20260518114617.995E2C2BCC6@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The GPIO chip is exposed to consumers before its pin ranges are =
established, creating a race condition.
--

commit 3bc65f1451eade57ad8e2b23e1cd7f59d63eb878
Author: David Jander <david@protonic.nl>

pinctrl: add NXP MC33978/MC34978 pinctrl driver

Add pin control and GPIO driver for the NXP MC33978/MC34978 Multiple Switch
Detection Interface (MSDI) devices. This driver exposes the 22 mechanical
switch detection inputs as standard GPIOs and supports emulated outputs
and hierarchical interrupt routing.

> diff --git a/drivers/pinctrl/pinctrl-mc33978.c b/drivers/pinctrl/pinctrl-=
mc33978.c
> new file mode 100644
> index 0000000000000..5ac4ebb115b66
> --- /dev/null
> +++ b/drivers/pinctrl/pinctrl-mc33978.c

[ ... ]

> +	mpc->pctldev =3D devm_pinctrl_register(dev, &mpc->pinctrl_desc, mpc);
> +	if (IS_ERR(mpc->pctldev))
> +		return dev_err_probe(dev, PTR_ERR(mpc->pctldev),
> +				     "can't register pinctrl\n");
> +
> +	ret =3D devm_gpiochip_add_data(dev, &mpc->chip, mpc);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "can't add GPIO chip\n");
> +
> +	/*
> +	 * Distinguish GPIO IRQ domain from parent MFD domain sharing the same
> +	 * fwnode. Matches the pattern used by other GPIO drivers (e.g.,
> +	 * crystalcove). DOMAIN_BUS_WIRED indicates this domain represents
> +	 * actual GPIO pin interrupts (wired lines).
> +	 */
> +	irq_domain_update_bus_token(mpc->chip.irq.domain, DOMAIN_BUS_WIRED);
> +
> +	ret =3D gpiochip_add_pin_range(&mpc->chip, dev_name(dev), 0, 0,
> +				     MC33978_NGPIO);

Could this create a race condition where the GPIO chip is exposed to
consumers before its pin ranges are established?

If a consumer requests a GPIO in the narrow window after
devm_gpiochip_add_data() completes but before gpiochip_add_pin_range()
is called, gpiolib's pinctrl_gpio_request() might not find the pinctrl
mapping and could bypass the pinctrl back-end synchronization.

Additionally, if gpiochip_add_pin_range() fails, returning an error here
would unregister the already-exposed gpiochip, potentially leaving
consumers with dangling handles.

Would it be better to implement the .add_pin_ranges callback in
struct gpio_chip so that gpiolib can safely and atomically establish the
pin ranges under its own internal locks during registration?

> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to add pin range\n");
> +
> +	platform_set_drvdata(pdev, mpc);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518100054.3552=
143-1-o.rempel@pengutronix.de?part=3D4
