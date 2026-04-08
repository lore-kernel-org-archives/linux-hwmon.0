Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043EA10F2
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Apr 2026 05:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775627322; cv=none; b=o3OmqFbJAli91NP9Q4gb3EQ6zmLuSlx7SeV7k329ERfZuJlb0emRKCa59En+XlQYjehOR7cPjDdDnwjFArDimcmjzOgmlnDQOelTD4SzXhynY/RA+2podmaGEzYeCr3Q6iZWiex51I0hfuWmyeleLIV8J04IVcStY4c6zGoCapQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775627322; c=relaxed/simple;
	bh=6vlEoc1aFWdTvmZ8JX8SlU3wfCnauEfMAKGBYq3RHgA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SZqOsc0uAIJbURlzxHSlhI2U0mLl/QXh8hLxXb7rfZ6k7L1cxfHKFA3AMggPYA7Qhjh6dlTjL+m2NNIxJimC6zHKfo12yqiJ4eOMbv8pR4pWNlWCWZ0mpIll6NBRBFNOmzgCuPUUYBBLUw/Ueb44yumkf0imSuPL7nI5ADBhQf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ELr5xe5J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ELr5xe5J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F3F1C19425;
	Wed,  8 Apr 2026 05:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775627321;
	bh=6vlEoc1aFWdTvmZ8JX8SlU3wfCnauEfMAKGBYq3RHgA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ELr5xe5J27bce/2ruthfob7KKMNz9iqDEKTgfcR1aDK8+Vv/PpkEDicWCRJpYDR7t
	 qxiZUnnaRiaBMWQEruahkS1vHrJrjDX1SrB3sjKE1lyVgKkw9SEpZ8oQkIz5Gw4UQa
	 Go3C0ne6LsoY6icVCMU49U98uzb7O880lo9B8RhGCvqPqKXyc7ZNVf0s94lBBFyl3x
	 howSXjKy2wvSUe9tjFLJW4fYByYK+SGy2gJoRUKrgbX/KOn2iOmfY3ZZ62+5vPYnGt
	 RElRCHvzW4pFFgiLdCOV32tvvECUsIXWqXQX77gslUZGJnd7pDRgCSWPIVpXjyWe5n
	 jIdhn/yCjBTSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] mfd: nct6694: Switch to devm_mfd_add_devices()
 and drop IDA
Reply-To: sashiko@lists.linux.dev
To: Unknown <a0282524688@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260408053037.1867092-2-a0282524688@gmail.com>
References: <20260408053037.1867092-2-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Apr 2026 05:48:41 +0000
Message-Id: <20260408054841.8F3F1C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 2 potential issue(s):
- [High] Use-After-Free and WARN_ON due to Teardown Inversion on USB discon=
nect and probe failure
- [High] Sysfs Namespace Collision breaking support for multiple USB devices
--

commit 35c3701128ee68ba67a073bb4beea066282a9dba
Author: Ming Yu <a0282524688@gmail.com>

mfd: nct6694: Switch to devm_mfd_add_devices() and drop IDA
   =20
This commit switches the nct6694 core driver to use devm_mfd_add_devices()
for simplified device lifecycle management. It also drops the custom IDA
implementation and transitions to using pdev->id.

> diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
> index 308b2fda3055c..8ce2c4985aaba 100644
> --- a/drivers/mfd/nct6694.c
> +++ b/drivers/mfd/nct6694.c

[ ... ]

> @@ -332,11 +326,11 @@ static int nct6694_usb_probe(struct usb_interface *=
iface,
> =20
>  	usb_set_intfdata(iface, nct6694);
> =20
> -	ret =3D mfd_add_hotplug_devices(dev, nct6694_devs, ARRAY_SIZE(nct6694_d=
evs));
> +	ret =3D devm_mfd_add_devices(dev, 0, nct6694_devs, ARRAY_SIZE(nct6694_d=
evs), NULL, 0, NULL);

The previous mfd_add_hotplug_devices() call automatically used
PLATFORM_DEVID_AUTO, which assigns globally unique IDs to prevent sysfs
name collisions.

By switching to devm_mfd_add_devices() with an ID argument of 0, does this
bind pdev->id to the static cell->id (0, 1, 2...)?

If a user connects a second identical NCT6694 USB device, it seems the MFD
core might attempt to register devices with the exact same names (e.g.,
nct6694-gpio.0) on the global platform bus. Will this cause the platform bus
to reject the second device with a -EEXIST error, breaking hotplug support
for multiple devices?

[ ... ]

> @@ -344,11 +338,7 @@ static int nct6694_usb_probe(struct usb_interface *i=
face,
> =20
>  err_mfd:
>  	usb_kill_urb(nct6694->int_in_urb);
> -err_ida:
> -	ida_destroy(&nct6694->wdt_ida);
> -	ida_destroy(&nct6694->canfd_ida);
> -	ida_destroy(&nct6694->i2c_ida);
> -	ida_destroy(&nct6694->gpio_ida);
> +err_irq_domain:
>  	irq_domain_remove(nct6694->domain);
>  err_urb:
>  	usb_free_urb(nct6694->int_in_urb);
> @@ -359,12 +349,7 @@ static void nct6694_usb_disconnect(struct usb_interf=
ace *iface)
>  {
>  	struct nct6694 *nct6694 =3D usb_get_intfdata(iface);
> =20
> -	mfd_remove_devices(nct6694->dev);
>  	usb_kill_urb(nct6694->int_in_urb);
> -	ida_destroy(&nct6694->wdt_ida);
> -	ida_destroy(&nct6694->canfd_ida);
> -	ida_destroy(&nct6694->i2c_ida);
> -	ida_destroy(&nct6694->gpio_ida);
>  	irq_domain_remove(nct6694->domain);

By relying on devres for MFD device removal, the child devices will now be
unregistered during the devres cleanup phase, which happens after
nct6694_usb_disconnect() returns.

However, irq_domain_remove() is still explicitly called here. Will this
destroy and free the domain memory while the child devices are still
registered and holding active IRQ mappings?

If the domain is removed early, it looks like it would trigger a WARN_ON in
irq_domain_remove() due to active mappings. Furthermore, when devres later
unregisters the child devices, their teardown paths (such as
nct6694_irq_dispose_mapping() and nct6694_canfd_remove()) call
irq_dispose_mapping() and access the already-freed IRQ domain. Can this
lead to a use-after-free?

A similar ordering issue might also happen in the probe error path if
devm_mfd_add_devices() partially fails, as the error path frees the IRQ
domain before devres cleans up any successfully added child devices.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260408053037.1867=
092-1-a0282524688@gmail.com?part=3D1
