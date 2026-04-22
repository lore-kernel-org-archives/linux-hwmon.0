Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C811E98EF
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 22:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776896713; cv=none; b=AG/76g5smtCsBfPZFFmEw6dws79/syKG1AIggOb18Nytpjkf+sz196SWai5TCh/Pkbfz8W40dUXtu2Idj/Em9LYzq+mr4EbMS9a/D/v8NRWNLj20JIZUGyTgPiBEU09ZBXFv9HkSA1XY0MbE7bpnMknAdp+GCUge5adNK8IayBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776896713; c=relaxed/simple;
	bh=ETYKI83e+TckWanIbY0bS6JEasn7wp9HaiW6xkxkhK4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CRcvh25GNo5BkVgABX3GildyQP70ZVoks6vKbh2CRE4Rkl8G9+8IKohp00s/HgXR76MSTG07r6UWkeG40B4lEzuq4kfb5YA6DLauvChWlfekMNegJKQHHCIrmbNd2Dy8Hxw4tH6vuXS10MZWRQxJCnfWPz4JKxKUY8FYW9fycdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kqdlKafZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kqdlKafZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27E67C19425;
	Wed, 22 Apr 2026 22:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776896713;
	bh=ETYKI83e+TckWanIbY0bS6JEasn7wp9HaiW6xkxkhK4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=kqdlKafZOebLjOMkPcdF7GZectKgd1nzBqtiY0/FiKupTbbjGumquwopwAHly+u6U
	 jF+dh3MKuILI3Bf2QANjs2szhJYVPMolTMMjG3F31wVvrv1hwmEv+xqEetnjFm87XH
	 2Gt6MtPfcXc4yIvgIjV1SGoaO7LFiaFTYBiSCqDtKhn8cfrsUxOvieBpmFxBHHMww1
	 Kf/WRo8+24STozIo7GMb9HOvkroDkRuGjCVeUKBo9kmb0SMzegHJNXHaU1io0ptAcm
	 dtXcP5NaRg2HDh/thJ1iCUWWX4D5ypCwDoZyoyP0xL7gZUt8LEntlAmpv2qrLmRmgH
	 7LU+fXs271e0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/12] thermal/core: Remove node pointer parameter
 when registering a tz
Reply-To: sashiko@lists.linux.dev
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260422174305.2899095-5-daniel.lezcano@oss.qualcomm.com>
References: <20260422174305.2899095-5-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Apr 2026 22:25:12 +0000
Message-Id: <20260422222513.27E67C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 4 potential issue(s):
- [High] Compilation failure due to undeclared identifier `np` in `__therma=
l_cooling_device_register`.
- [High] Compilation failure due to argument count mismatch in `devm_therma=
l_of_cooling_device_register`.
- [High] Device tree (OF) cooling devices silently fail to bind to thermal =
zones.
- [Low] Misleading kerneldoc for `devm_thermal_cooling_device_register`.
--

commit fb0063667bcf5ae686659ae0c320b2fb8a2e567e
Author: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

thermal/core: Remove node pointer parameter when registering a tz

This patch removes the device_node pointer parameter in the core function
registering a thermal cooling device, which is inconsistent with non-OF cod=
e.

> diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_cor=
e.c
> index 35cf170f3fa1c..113719466dc21 100644
> --- a/drivers/thermal/thermal_core.c
> +++ b/drivers/thermal/thermal_core.c
[ ... ]
> @@ -1050,15 +1049,12 @@ void thermal_cooling_device_init_complete(struct =
thermal_cooling_device *cdev)
>   * This interface function adds a new thermal cooling device (fan/proces=
sor/...)
>   * to /sys/class/thermal/ folder as cooling_device[0-*]. It tries to bin=
d itself
>   * to all the thermal zone devices registered at the same time.
> - * It also gives the opportunity to link the cooling device to a device =
tree
> - * node, so that it can be bound to a thermal zone created out of device=
 tree.
>   *
>   * Return: a pointer to the created struct thermal_cooling_device or an
>   * ERR_PTR. Caller must check return value with IS_ERR*() helpers.
>   */
>  struct thermal_cooling_device *
> -__thermal_cooling_device_register(struct device_node *np,
> -				  const char *type, void *devdata,
> +__thermal_cooling_device_register(const char *type, void *devdata,
>  				  const struct thermal_cooling_device_ops *ops)
>  {
>  	struct thermal_cooling_device *cdev;

Does removing the np parameter here cause a compilation failure?

The assignment cdev->np =3D np; was left untouched further down in the func=
tion
body, which results in an undeclared identifier error.

(Note: This regression is fixed later in the series by commit 1b7fe95232020)

[ ... ]
> @@ -1167,6 +1163,50 @@ thermal_cooling_device_register(const char *type, =
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

This isn't a bug, but is this kerneldoc accurate?

This function is the generic (non-OF) devres variant and does not extract or
assign any device tree node reference. It appears to be a copy-paste error
from the OF-specific variant.

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
> +				     void *devdata, const struct thermal_cooling_device_ops *ops)

[ ... ]
> diff --git a/drivers/thermal/thermal_core.h b/drivers/thermal/thermal_cor=
e.h
> index 6e44bcf37b003..d45455bb9e9e6 100644
> --- a/drivers/thermal/thermal_core.h
> +++ b/drivers/thermal/thermal_core.h
> @@ -272,8 +272,7 @@ void thermal_governor_update_tz(struct thermal_zone_d=
evice *tz,
>  void thermal_cooling_device_init_complete(struct thermal_cooling_device =
*cdev);
> =20
>  struct thermal_cooling_device *
> -__thermal_cooling_device_register(struct device_node *np,
> -				  const char *type, void *devdata,
> +__thermal_cooling_device_register(const char *type, void *devdata,
>  				  const struct thermal_cooling_device_ops *ops);

Does changing this prototype cause a compilation failure due to an argument
count mismatch in devm_thermal_of_cooling_device_register()?

The existing call inside devm_thermal_of_cooling_device_register() in
drivers/thermal/thermal_of.c was not updated and still passes 4 arguments.

(Note: This regression is fixed later in the series by commit 1b7fe95232020)

[ ... ]
> diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
> index c4b67554df447..3ba8c970f11f3 100644
> --- a/drivers/thermal/thermal_of.c
> +++ b/drivers/thermal/thermal_of.c
> @@ -533,7 +533,7 @@ thermal_of_cooling_device_register(struct device_node=
 *np,
>  {
>  	struct thermal_cooling_device *cdev;
> =20
> -	cdev =3D __thermal_cooling_device_register(np, type, devdata, ops);
> +	cdev =3D __thermal_cooling_device_register(type, devdata, ops);
>  	if (IS_ERR(cdev))
>  		return cdev;

Does this silently break device tree thermal zone cooling bindings?

Since the np parameter is removed from the core registration function,
cdev->np is no longer populated there. The np parameter is passed here, but
not manually assigned to cdev->np.

Because cdev is zero-allocated, cdev->np remains NULL. When
thermal_cooling_device_init_complete() runs to bind the cooling device,
the check if (cooling_spec.np !=3D cdev->np) will unconditionally fail.

(Note: This regression is fixed later in the series by commit 1b7fe95232020)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260422174305.2899=
095-1-daniel.lezcano@oss.qualcomm.com?part=3D4
