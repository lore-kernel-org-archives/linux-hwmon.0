Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDE5301472
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 23:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776900829; cv=none; b=F+fcnqLKU0UnLK0MlkqucX5Ws7wX96Qi8sQFRBSMIaM2lxLCvnso7QXsKvz3/PT+hGCwuL1m1J1Rk41ArWScPtSNf30HW5qRx8LT9/VAwzAFBBuJiKOU0mh2Ab8QR5B1uIkVQcvbQwdz1qINDQySmS4HNCcXi6NH/IBP1tOZ1fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776900829; c=relaxed/simple;
	bh=mD/fKN+jeUquy4f0M8O7/XsmSXFoTXfBc7i8Orx3fLQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FUmHOSJGYMmy0lIzt96xq06TIY1ya3nAbHP9MrR7QIAp31suEqKxse7detAe7+IzIko53tfOuKVkvzeL907ZQJUyF+LFonUaISSb5h3aU9YdAt+qPCFrVaaFHmULSLAh44jAHj3TUFzXjms+zXGcbkmY9rP9lb0BkE+yIj8ajQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q53Kh2+o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q53Kh2+o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EF3FC19425;
	Wed, 22 Apr 2026 23:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776900828;
	bh=mD/fKN+jeUquy4f0M8O7/XsmSXFoTXfBc7i8Orx3fLQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=q53Kh2+of4SGA26Nd0sQtR0O5XRtlMD/cFpUeCb0Ojp7ONfK71QVG5KI0U1Rwowzo
	 H3X0lHM6+6VYv6UNVGkq81upuQEKgHlUtW8sRkWCXN/cT+SxZsAWHN4Vr1mgnP830M
	 LbzN/boU1zEuIMzUxpWjDMWNiIDuEsSVaHn+yHdUeTAipRV09PCPMRZtfQXE5T8MD9
	 BQKC7AF1G48JgItGmy4e+A2cGe3kCit+iQt1LbAYCPLpYJaSM8QFI9p9ZYBfSdjfJB
	 8rPHWRhVvO648lLXdFavQ5VeGriaL5lD/ilaWvhBmrhPl+de8PmcQ1IcNu3MtBblF5
	 ZiCAmkESkVtTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/12] thermal/of: Rename the
 devm_thermal_of_cooling_device_register() function
Reply-To: sashiko@lists.linux.dev
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260422174305.2899095-9-daniel.lezcano@oss.qualcomm.com>
References: <20260422174305.2899095-9-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Apr 2026 23:33:48 +0000
Message-Id: <20260422233348.9EF3FC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 4 potential issue(s):
- [Critical] Double call to thermal_cooling_device_init_complete() corrupts=
 thermal_cdev_list.
- [High] cdev->np is stored without acquiring a reference, leading to a dan=
gling pointer after the OF iterator loops finish.
- [Low] The mass-rename forces standalone cooling devices to use an API exp=
licitly named and documented for child nodes.
- [Low] The non-devres equivalent of the API was not renamed, resulting in =
an inconsistent subsystem interface.
--

commit f1de025111783e26ec2bab8fd8078236f785c8b4
Author: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

thermal/of: Rename the devm_thermal_of_cooling_device_register() function

This commit renames devm_thermal_of_cooling_device_register() to
devm_thermal_of_child_cooling_device_register() to differentiate between
cooling devices bound via child nodes and a proposed new binding. The
rename was applied globally across drivers using a sed script.

> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> index 37269db2de84f..e6a567d58579d 100644
> --- a/drivers/hwmon/pwm-fan.c
> +++ b/drivers/hwmon/pwm-fan.c
> @@ -685,8 +685,9 @@ static int pwm_fan_probe(struct platform_device *pdev)
> =20
>  	ctx->pwm_fan_state =3D ctx->pwm_fan_max_state;
>  	if (IS_ENABLED(CONFIG_THERMAL)) {
> -		cdev =3D devm_thermal_of_cooling_device_register(dev,
> -			dev->of_node, "pwm-fan", ctx, &pwm_fan_cooling_ops);
> +		cdev =3D devm_thermal_of_child_cooling_device_register(dev, dev->of_no=
de,
> +								     "pwm-fan", ctx,
> +								     &pwm_fan_cooling_ops);

This isn't a bug, but does it make sense to use an API explicitly named and
documented for child nodes here?

Many standalone drivers like pwm-fan, gpio-fan, and max6650 simply pass the=
ir
main device node (dev->of_node) rather than a child node, which creates a
semantic contradiction with the new name.

[ ... ]

> diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
> index ee9776d0e5be7..d06487bb5e675 100644
> --- a/drivers/thermal/thermal_of.c
> +++ b/drivers/thermal/thermal_of.c
[ ... ]
> @@ -563,14 +563,17 @@ static void thermal_cooling_device_release(struct d=
evice *dev, void *res)
>   * to /sys/class/thermal/ folder as cooling_device[0-*]. It tries to bin=
d itself
>   * to all the thermal zone devices registered at the same time.
>   *
> + * This function should be used when a cooling controller has child
> + * nodes which are referenced in the thermal zone cooling map.
> + *
>   * Return: a pointer to the created struct thermal_cooling_device or an
>   * ERR_PTR. Caller must check return value with IS_ERR*() helpers.
>   */
>  struct thermal_cooling_device *
> -devm_thermal_of_cooling_device_register(struct device *dev,
> -					struct device_node *np,
> -					const char *type, void *devdata,
> -					const struct thermal_cooling_device_ops *ops)
> +devm_thermal_of_child_cooling_device_register(struct device *dev,
> +					      struct device_node *np,
> +					      const char *type, void *devdata,
> +					      const struct thermal_cooling_device_ops *ops)
>  {

This isn't a bug, but could this mass-rename cause confusion since the
non-devres counterpart (thermal_of_cooling_device_register) was not renamed?
Leaving one unchanged while renaming the other creates an inconsistent
subsystem API.

Also, since this API is now explicitly targeted at child nodes, which are
often iterated over using macros like for_each_child_of_node() or
for_each_child_of_node_scoped(), could this promote a use-after-free issue?

These iterators automatically drop the node reference when advancing or goi=
ng
out of scope. If thermal_of_cooling_device_register() stores cdev->np =3D np
without acquiring a reference via of_node_get(), cdev->np will become a
dangling pointer once the loop finishes.

>  	struct thermal_cooling_device **ptr, *tcd;
> =20
> @@ -592,4 +595,4 @@ devm_thermal_of_cooling_device_register(struct device=
 *dev,
> =20
>  	return tcd;
>  }
> -EXPORT_SYMBOL_GPL(devm_thermal_of_cooling_device_register);
> +EXPORT_SYMBOL_GPL(devm_thermal_of_child_cooling_device_register);

Can the double call to thermal_cooling_device_init_complete() cause an
infinite loop during list traversal?

Looking at the code just above the return in this function (affected by
earlier commits):

	tcd =3D thermal_of_cooling_device_register(np, type, devdata, ops);
	if (IS_ERR(tcd)) {
		devres_free(ptr);
		return tcd;
	}

	*ptr =3D tcd;
	devres_add(dev, ptr);

	thermal_cooling_device_init_complete(tcd);

thermal_of_cooling_device_register() already calls
thermal_cooling_device_init_complete(), which adds the cooling device to
thermal_cdev_list via list_add(). Calling it a second time here overwrites
the list pointers, establishing a cyclic reference.

I noticed this regression was introduced by an earlier commit
("thermal/core: Make thermal_cooling_device_init_complete() non static")
and a fix was provided later in the series in commit
("thermal/of: Pass the of_index and add a function to register with an
index").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260422174305.2899=
095-1-daniel.lezcano@oss.qualcomm.com?part=3D8
