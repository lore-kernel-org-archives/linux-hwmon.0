Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6909B17DE36
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 18:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776623923; cv=none; b=cwxwrDU9c35h30558zN01fDm5wzIAXdizcpzDjuSn/vq8L7W3vnU+MDt67FejSOiu4k4wZFBQxCImQtlxQAVxvd5i+4ZDkaV35f+5GnjIsCsjVsj9UjX4HaqJRRD5FKyLfAAzTSSjz67XvrMfBUF9VI8tqNZF1bS7cuzQUnliyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776623923; c=relaxed/simple;
	bh=AuA3B3iayGaPbE1/AmABzUDQuuUcb4OCp1KpxvV35XE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p/66JihX4qrJ8nF4aM+kdF5HV1XAG4wcwQ8RymDhhC4mwEyHqfdtuVPsd1XUu2g8xMwKmCOWT/OoQKyM2HlIGhS9n6DVFWAlZ40RLWWAsUhs3P22ktOHLbZ2ZvsZmy5HXYBx7kZwmpxHg3hTcSYEKkMft4CpdXJHfexcJid2zcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KpVbH8BV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KpVbH8BV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D10FFC2BCAF;
	Sun, 19 Apr 2026 18:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776623923;
	bh=AuA3B3iayGaPbE1/AmABzUDQuuUcb4OCp1KpxvV35XE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=KpVbH8BVkzh4+Kb5FDfXmAHSWJn9O28yIpXobHnGcbqvEAHWMSjYXm0cM8dQ3P6so
	 MIsLSxvmrjCVBmaGMfd4svG4rnQh8o4upFxrJxmMfkhSvIolBwdAzxx2HvzRcADQAn
	 a9C/rgXG5V4/fIgwtS5mayFyu1RpbYqO7l942bqmwIbLx3kYCVNLGqN04B1e8efrt8
	 fiKkTXejG5bIT3To1eU/6hfXWjEBZ1YbxnqFqt18LBv/yfv94tfcNi43K6ltGzb5Uj
	 L0rRyiJKV2rvlRsqn+bws3IyXVMtgJ1lGJaN6dgfakf6lbtEk8gyow1Sbo2u6d+nFw
	 KGMKqVWK+oJeA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 02/14] thermal/driver/tegra/soctherm: Use devm_
 variant when registering a cooling device
Reply-To: sashiko@lists.linux.dev
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260419182203.4083985-3-daniel.lezcano@oss.qualcomm.com>
References: <20260419182203.4083985-3-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Apr 2026 18:38:42 +0000
Message-Id: <20260419183842.D10FFC2BCAF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 1 potential issue(s):
- [High] Teardown asymmetry / use-after-disable causing kernel panic on pro=
be failure or driver unbind.
--

commit 7cd0558154b37412cd530ca6d0e191a67317cc1e
Author: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

thermal/driver/tegra/soctherm: Use devm_ variant when registering a cooling=
 device

This commit modifies the driver to use the devm_ variant for cooling
device registration, aiming to fix a resource leak at removal time.

> diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soc=
therm.c
> --- a/drivers/thermal/tegra/soctherm.c
> +++ b/drivers/thermal/tegra/soctherm.c
[ ... ]
> @@ -1700,9 +1700,9 @@ static void soctherm_init_hw_throt_cdev(struct plat=
form_device *pdev)
>  			stc->init =3D true;
>  		} else {
> =20
> -			tcd =3D thermal_of_cooling_device_register(np_stcc,
> -							 (char *)name, ts,
> -							 &throt_cooling_ops);
> +			tcd =3D devm_thermal_of_cooling_device_register(dev, np_stcc,
> +								      (char *)name, ts,
> +								      &throt_cooling_ops);

Could this devm transition create a teardown asymmetry that leads to a kern=
el
panic?

While this prevents the cooling device from leaking, the unregistration is =
now
deferred until devres_release_all() runs (after probe() returns an error or
remove() completes).

The driver still manually disables the hardware clocks during the probe err=
or
path and in tegra_soctherm_remove(). This creates a window where the cooling
device remains registered and exposed to the thermal core and sysfs while t=
he
underlying hardware is powered down.

If there is a concurrent sysfs read of the cooling device state during this
window, it will invoke throt_get_cdev_cur_state(), which executes:

readl(ts->regs + THROT_STATUS)

Accessing IP block registers with the clocks disabled causes a synchronous
external abort on Tegra.

Should the clock disable operations also be managed via devres (e.g., using
devm_add_action_or_reset()) to guarantee LIFO teardown ordering?

>  			if (IS_ERR_OR_NULL(tcd)) {
>  				dev_err(dev,
>  					"throttle-cfg: %s: failed to register cooling device\n",

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260419182203.4083=
985-1-daniel.lezcano@oss.qualcomm.com?part=3D2
