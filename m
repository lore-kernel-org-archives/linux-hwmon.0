Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0E03A1DB
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 18:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776624467; cv=none; b=hl8t88qq3C+DPorQ5OZkIRasNRkFHWDRTqT3O4o5qC+73VHHarZ1E6xtPmHKUAncOTx19lydBoMpGhHuuM21E2OKT6GVSUIywdAaD1wKCPUoeeeL5y+6Era4Lbwb6WYPUOBKtX+LeJ4ssb9R6BqC5i1+hsQb/y371DMndXAl9HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776624467; c=relaxed/simple;
	bh=tjz4swuufATKwaIYgR7aSJ3alWfgvcmA68y4m5aD/0E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ffhEKDPGgekuoJQTjamTyQgs/tZHtnp7s8dH2fKR78nRhoY1NrvZLdRUV9/2UsbP91zmQLwK108oZ7jsmvBfK0rjylq+TgNLxfXNHQJYiNqaqz0e8oHl83r5tOpMIH9uVfwzyE4liJHmkLpZjV+HccHeFbaZ8Q6/WVg4NThU29Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LabqkluL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LabqkluL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E84DC2BCAF;
	Sun, 19 Apr 2026 18:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776624467;
	bh=tjz4swuufATKwaIYgR7aSJ3alWfgvcmA68y4m5aD/0E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=LabqkluLmlDVRI3pwbENk08b/JbmqgNzh6xMVPggvqnHmVIdw23IErcyysPO1Ccme
	 FwM/pdwbryUxpHIJxyAPbKxa1QHn4FF/RcP3I06XUqM9DIBQdoLBg29NBKdxwLLACU
	 3HYPVx28dj1vPZxM381eWkn68xnyMJDR60miItv5uPP2SHiLYhpk/oYM7y4MNP9rV6
	 5jPoD0v3i6En81wbZwE1KgszKepxb+IjDx9uFaOyyttUWEWwhxuODGD3B1O53pnqQT
	 ht1vtupL9dgTp28P60nz4cQb9OpizE5SnYYuoLieaCB/ykVWVNgsX+kx8tEKgxjFRi
	 tcBdYFogre+sw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 07/14] hwmon:: Use non-OF thermal cooling device
 register function
Reply-To: sashiko@lists.linux.dev
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260419182203.4083985-8-daniel.lezcano@oss.qualcomm.com>
References: <20260419182203.4083985-8-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Apr 2026 18:47:46 +0000
Message-Id: <20260419184747.2E84DC2BCAF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 2 potential issue(s):
- [High] This problem wasn't introduced by this patch, but in mlxreg-fan.c,=
 the hwmon sysfs interfaces are exposed before the thermal cooling device p=
ointer (pwm->cdev) is initialized, leading to a possible NULL pointer deref=
erence.
- [High] This problem wasn't introduced by this patch, but in mlxreg-fan.c,=
 the variables pwm->last_hwmon_state and pwm->last_thermal_state are read a=
nd modified concurrently without any locking, leading to inconsistent hardw=
are state.
--

commit c24a43d962cbf165d7c767a5a51aa1a15586bd28
Author: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

hwmon:: Use non-OF thermal cooling device register function

Make HWMON drivers which are not based on device tree to use the
corresponding non-OF functions.

[ ... ]

> diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
> index 137a90dd20752..860de6cfd8a4d 100644
> --- a/drivers/hwmon/mlxreg-fan.c
> +++ b/drivers/hwmon/mlxreg-fan.c
> @@ -583,8 +583,8 @@ static int mlxreg_fan_cooling_config(struct device *d=
ev, struct mlxreg_fan *fan)
>  		pwm->fan =3D fan;
>  		/* Set minimal PWM speed. */
>  		pwm->last_hwmon_state =3D MLXREG_FAN_PWM_DUTY2STATE(MLXREG_FAN_MIN_DUT=
Y);

This isn't a bug introduced by this commit, but are pwm->last_hwmon_state a=
nd
pwm->last_thermal_state read and modified concurrently without locking?

The function mlxreg_fan_write() (executed via sysfs) and
mlxreg_fan_set_cur_state() (executed by the thermal subsystem) concurrently
access and mutate these variables.

While the hwmon core serializes sysfs operations via
hwmon_device_register_with_info(), it does not serialize calls from the
thermal subsystem.

Because there is no lock protecting this multi-variable state, can a
Time-Of-Check to Time-Of-Use race occur? One thread may evaluate the maximum
of the two states using stale data and write an incorrectly low value to the
hardware.

Does this violate the hwmon subsystem guidelines requiring drivers to
implement locking for attributes registered by any other means?

> -		pwm->cdev =3D devm_thermal_of_cooling_device_register(dev, NULL, mlxre=
g_fan_name[i],
> -								    pwm, &mlxreg_fan_cooling_ops);
> +		pwm->cdev =3D devm_thermal_cooling_device_register(dev, mlxreg_fan_nam=
e[i],
> +								 pwm, &mlxreg_fan_cooling_ops);

This problem also wasn't introduced by this commit, but are the hwmon sysfs
interfaces exposed before the thermal cooling device pointer (pwm->cdev) is
initialized?

In mlxreg_fan_probe(), the hwmon device is registered via
devm_hwmon_device_register_with_info() before mlxreg_fan_cooling_config() is
called.  This exposes sysfs attributes to user-space immediately.

If a user writes to the PWM attribute in this narrow window, mlxreg_fan_wri=
te()
will be invoked and pass the currently uninitialized pwm->cdev to
_mlxreg_fan_set_cur_state().

Can this lead to a NULL pointer dereference when cdev->devdata is
unconditionally dereferenced?

>  		if (IS_ERR(pwm->cdev)) {
>  			dev_err(dev, "Failed to register cooling device\n");
>  			return PTR_ERR(pwm->cdev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260419182203.4083=
985-1-daniel.lezcano@oss.qualcomm.com?part=3D7
