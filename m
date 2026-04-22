Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BE1378D71
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 21:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776893903; cv=none; b=hGamOiINVARGT+2EcwstsJ0MHz24Iv5YDU3ElUnt2KsEG4iC7QESSEfHklGOo73Mwu2Wh5A5bRwDuQ8+/zaBp+b1kKEeZD08RHsv22y3q4G/D2+KJJEjst+5qWwfuSovZvH3Yo0RHLm+b/XMjmV/wTz0OSaU7PG+K0C2hAkkWLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776893903; c=relaxed/simple;
	bh=PIMIpVvVlAuyWm10NzB91Nr65egCIsiyN5AZF4b7uhY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r1fbk35Q4UZNg9d+0+JvR7yfL8aIPMdFYGOPMsJOItKpv4pkP65ISR1ONGu2Pg0gj6x+LsY02/Qlgj2CEjyLiYqlDjHUo0uS+7qesJsRYWI9ClRiAFGpyITX/X9xvLTuAjpT/SFUU8wTtBtHd+grxRp7qEshGzj74NcAPeqg99Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U/Bs9YiZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U/Bs9YiZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D729FC19425;
	Wed, 22 Apr 2026 21:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776893903;
	bh=PIMIpVvVlAuyWm10NzB91Nr65egCIsiyN5AZF4b7uhY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=U/Bs9YiZ5cmj6EkcmGVtwaKbwQvlbpL2U/VgTo1IZ4n57LMR6CYykulzPbpuSO4sw
	 ON0gScHhr88htVQbQz5QvoPSPmh1dafmQthfpvgc6cl1weNsHP7KWo852c8x0nGE/R
	 QHnwzDkRFmUPCTNRkwIFgdNEMEQL/Pc39lX8E+4mvpmzI0PdtMUsbn2XsYZ9L6kbx9
	 Z1J2IW+pee0aK0pABeDzFWgGKrAprls3K0viAVo9SHSOPFgE9t34+adThC17aQMsJF
	 OM0scjiWZZysPPlORLn/0u6xGCD8ahxGY3Nz9c4QWkcrEsdyoS0xtxpUKudTKBcB6B
	 FEQdgnm9vv8pg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 01/12] thermal/driver/tegra/soctherm: Use devm_
 variant when registering a cooling device
Reply-To: sashiko@lists.linux.dev
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260422174305.2899095-2-daniel.lezcano@oss.qualcomm.com>
References: <20260422174305.2899095-2-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Apr 2026 21:38:22 +0000
Message-Id: <20260422213822.D729FC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 3 potential issue(s):
- [High] Hardware reset sequence completely bypassed during probe.
- [High] Double clock disable during driver removal and failure to fix the =
described race window.
- [Medium] Clock enablement and disablement order is reversed.
--

commit c2cefc8b595baea6413baca093c73c6b01f2bfd1
Author: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

thermal/driver/tegra/soctherm: Use devm_ variant when registering a cooling=
 device

The driver is updated to use devm_thermal_of_cooling_device_register()
to automatically unregister the cooling device. To avoid a window where
the cooling device remains registered while the hardware is powered down,
it also switches to using devm_clk_get_enabled().

> diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soc=
therm.c
> index 5d26b52beaba7..790c4c96a9b5f 100644
> --- a/drivers/thermal/tegra/soctherm.c
> +++ b/drivers/thermal/tegra/soctherm.c

[ ... ]

> @@ -2133,13 +2133,13 @@ static int tegra_soctherm_probe(struct platform_d=
evice *pdev)
>  		return PTR_ERR(tegra->reset);
>  	}
> =20
> -	tegra->clock_tsensor =3D devm_clk_get(&pdev->dev, "tsensor");
> +	tegra->clock_tsensor =3D devm_clk_get_enabled(&pdev->dev, "tsensor");
>  	if (IS_ERR(tegra->clock_tsensor)) {
>  		dev_err(&pdev->dev, "can't get tsensor clock\n");
>  		return PTR_ERR(tegra->clock_tsensor);
>  	}
> =20
> -	tegra->clock_soctherm =3D devm_clk_get(&pdev->dev, "soctherm");
> +	tegra->clock_soctherm =3D devm_clk_get_enabled(&pdev->dev, "soctherm");

Does this invert the clock enablement order?

The original soctherm_clk_enable() enabled the soctherm clock before the
tsensor clock:

drivers/thermal/tegra/soctherm.c:soctherm_clk_enable() {
	...
	if (enable) {
		err =3D clk_prepare_enable(tegra->clock_soctherm);
		if (err) {
			...
		}

		err =3D clk_prepare_enable(tegra->clock_tsensor);
	...
}

By retrieving and enabling tsensor first with devm_clk_get_enabled(), the
tsensor clock is now enabled before soctherm, and the devres LIFO cleanup w=
ill
disable soctherm before tsensor.

Will this cause undefined behavior if the tsensor block relies on the main
soctherm clock?

[ ... ]

> @@ -2171,10 +2171,6 @@ static int tegra_soctherm_probe(struct platform_de=
vice *pdev)
>  	if (!tegra->thermctl_tzs)
>  		return -ENOMEM;
> =20
> -	err =3D soctherm_clk_enable(pdev, true);
> -	if (err)
> -		return err;
> -

By completely removing this call, doesn't it also bypass the hardware reset
sequence?

Looking at soctherm_clk_enable(), it performs a hardware reset along with c=
lock
management:

drivers/thermal/tegra/soctherm.c:soctherm_clk_enable() {
	...
	reset_control_assert(tegra->reset);

	if (enable) {
		err =3D clk_prepare_enable(tegra->clock_soctherm);
		...
		err =3D clk_prepare_enable(tegra->clock_tsensor);
		...
	} else {
		...
	}

	reset_control_deassert(tegra->reset);
	...
}

Without this sequence, will the thermal controller hardware remain in an
uninitialized state?

[ ... ]

> @@ -2218,11 +2212,6 @@ static int tegra_soctherm_probe(struct platform_de=
vice *pdev)
>  	soctherm_debug_init(pdev);
> =20
>  	return 0;
> -
> -disable_clocks:
> -	soctherm_clk_enable(pdev, false);
> -
> -	return err;
>  }
> =20
>  static void tegra_soctherm_remove(struct platform_device *pdev)

The commit message states:

> A bug can be subtly introduced by this change because the driver still
> manually disables the hardware clocks during the probe error path and
> in tegra_soctherm_remove(). This creates a window where the cooling
> device remains registered and exposed to the thermal core and sysfs
> while the underlying hardware is powered down.
>
> In order to prevent this potential issue, use the devm_ variant for the
> clk.

Does the race window described here remain open? The manual call to
soctherm_clk_enable(pdev, false) is still present in tegra_soctherm_remove(=
):

drivers/thermal/tegra/soctherm.c:tegra_soctherm_remove() {
	...
	soctherm_clk_enable(pdev, false);
}

Since this executes before devres automatically unregisters the cooling dev=
ice,
the clocks are powered down while the cooling device is still registered.

Additionally, when devres later cleans up the clocks, will it cause a
double-disable and clock reference count underflow since the clocks were
already manually disabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260422174305.2899=
095-1-daniel.lezcano@oss.qualcomm.com?part=3D1
