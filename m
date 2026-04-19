Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D092E06E6
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 18:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776623360; cv=none; b=ONrAkl/2D+oLliUTZDHMGD4Nq1zLRNeefXJWA15vbMLHhTmOtK8+bitGTJ8qh7XxM2CGNtbD3DbmGLU4OlUFuaKxxtdas0ymSpz/Cs4vLpleoGsNT6UiDxA7LLksGJu5WkOKvWRl+/T82Gsh37DCeefyT7LDswNCm7rJv0tm/TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776623360; c=relaxed/simple;
	bh=6g+n+dR0djtJX7AfGJGddJN3OBqb/xp7CoI58EdVyyI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b8g/xs3tO5fIYAZbJ/MP0ltpBmp5eq68aT64U6EMZwrAv6GuGeyqvSEfnWyfUlla68WWYLJVhzfK13yfX2q8VsRu8GaNsxXG/RqgpMTCXj0I0vm0vLfnnIpxdujXRXeofdspyqfC+067s0lnfaaCKU7S5Vp7fSj9eROJvcGcJGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ikMjk9Pd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ikMjk9Pd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E11C2BCAF;
	Sun, 19 Apr 2026 18:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776623360;
	bh=6g+n+dR0djtJX7AfGJGddJN3OBqb/xp7CoI58EdVyyI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ikMjk9Pd/8Z9+IpK7hxKi7dzNCPUq1vSjGv2lcbEeWGzV2ORkNrAKLSuRfHJP9B+v
	 X2xeqc6KyQa4dqcp5P7HRjnr9vGPuG+c08jiMsHnZ4ak2u9oZ0Gu5q1GzEGLQ7ZsL9
	 ZPtS/mvChyL+njpYTxIjfo6F7g670VjYqzyRyb+vnQ5Bt6lqnKpop0/ASmIMvudeFK
	 ppgz9m/EsOMc3Il5R73KIKtWI7rdnlXYunXgSsgQTbGgf+zZ0cmzTDeK0e5PMXrqed
	 rkjZ3OifS/yiXR12joYNuEeEodJNI2EscHYNAo1NCcxWvLfa1OamSrMhKfFQyW4Vmd
	 XLSnZViuvo/1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 06/14] thermal/core: Register cooling device non-OF
 drivers
Reply-To: sashiko@lists.linux.dev
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260419182203.4083985-7-daniel.lezcano@oss.qualcomm.com>
References: <20260419182203.4083985-7-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Apr 2026 18:29:19 +0000
Message-Id: <20260419182920.29E11C2BCAF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 2 potential issue(s):
- [Low] Missing `static inline` in the fallback dummy implementation of `de=
vm_thermal_cooling_device_register`.
- [Low] Incorrect kerneldoc comment for `devm_thermal_cooling_device_regist=
er`.
--

commit 18601ab408a18465a11642434a184fda33807cbc
Author: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

thermal/core: Register cooling device non-OF drivers

This commit provides a non-OF function to register a cooling device, allowi=
ng
a clear separation between OF and non-OF code. Drivers not using a devicetr=
ee
can then migrate to this new function.

> diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_cor=
e.c
> index 2f5d214d51a10..356a49e541fd5 100644
> --- a/drivers/thermal/thermal_core.c
> +++ b/drivers/thermal/thermal_core.c
[ ... ]
> @@ -1164,6 +1164,50 @@ thermal_cooling_device_register(const char *type, =
void *devdata,
>  }
>  EXPORT_SYMBOL_GPL(thermal_cooling_device_register);
> =20
> +static void thermal_cooling_device_release(struct device *dev, void *res)
> +{
> +	thermal_cooling_device_unregister(*(struct thermal_cooling_device **)re=
s);
> +}
> +
> +/**
> + * devm_thermal_cooling_device_register() - register a thermal cooling d=
evice
> + * @dev:	a valid struct device pointer of a sensor device.
> + * @type:	the thermal cooling device type.
> + * @devdata:	device private data.
> + * @ops:	standard thermal cooling devices callbacks.
> + *
> + * This function will register a cooling device with device tree node re=
ference.

This isn't a bug, but the comment states this registers a cooling device
with a device tree node reference. Since this is the non-OF version,
should this part of the comment be updated to reflect that it does not use a
devicetree?

> + * This interface function adds a new thermal cooling device (fan/proces=
sor/...)
> + * to /sys/class/thermal/ folder as cooling_device[0-*]. It tries to bin=
d itself
> + * to all the thermal zone devices registered at the same time.
> + *
> + * Return: a pointer to the created struct thermal_cooling_device or an
> + * ERR_PTR. Caller must check return value with IS_ERR*() helpers.
> + */
> +struct thermal_cooling_device *
> +devm_thermal_cooling_device_register(struct device *dev, const char *typ=
e,
[ ... ]
> diff --git a/include/linux/thermal.h b/include/linux/thermal.h
> index 0ddc77aeeca26..d9332b0371884 100644
> --- a/include/linux/thermal.h
> +++ b/include/linux/thermal.h
[ ... ]
> @@ -317,6 +322,14 @@ devm_thermal_of_cooling_device_register(struct devic=
e *dev,
>  {
>  	return ERR_PTR(-ENODEV);
>  }
> +
> +struct thermal_cooling_device *
> +devm_thermal_cooling_device_register(struct device *dev, const char *typ=
e,
> +				     void *devdata, const struct thermal_cooling_device_ops *ops)
> +{
> +	return ERR_PTR(-ENODEV);
> +}

Does this fallback implementation need the static inline keywords?=20
Without them, it looks like this will be defined as a strong global symbol =
in
every translation unit that includes the thermal header when CONFIG_THERMAL=
 is
disabled, which could cause multiple definition linker errors.

> +
>  static inline void thermal_cooling_device_unregister(
>  	struct thermal_cooling_device *cdev)
>  { }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260419182203.4083=
985-1-daniel.lezcano@oss.qualcomm.com?part=3D6
