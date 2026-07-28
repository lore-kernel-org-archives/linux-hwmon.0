Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1434B3C4542;
	Tue, 28 Jul 2026 07:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223254; cv=none; b=XmO08Yj2DQzcYgL4o1Zlkv+72Xn8kYoihzkHHpXBX6fMhuT4BYv/KZ348pXRkzTBzDtqhqV62fSoaO1S0DTJAvrQN/wZWAvWqeC+YONTg9GKqNkbMhLnyMCyDZoKkiY75/v27bZYrv7dnG6nZZbgmKGNmtQAbAPwFkaGFSlOvbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223254; c=relaxed/simple;
	bh=HddlPoGC7QhBxWvp2LxfEsh71nYJZr96rtYJ54VTDoI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XYdMh1Z9EI8YOvYTgJn9T7Z2oVsE7Qd3PF9EuTLi1l0R7ceYKE0T+MgF6N3y51wm6unL4EJHMBCynGyD6VqYuI4kDqlfYNiQdTHTRGaucUcaexbfLQnV1JsOths6t+rhcpl/5A0FxP6t7m+NDdNFb5uYwkn6tH+TvAp2o7q8MHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N/4WCBK4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N/4WCBK4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 528E41F000E9;
	Tue, 28 Jul 2026 07:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785223252;
	bh=R/9h3j4EtZ4mjjNRNqiECDyhfTkG1qrXnhp5Vg6PVHw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N/4WCBK4v2qVgapt4eQTmpibGKUTLGkzKNT9aSOka/ezw1MB/286J4Xyrj9Lmf4/W
	 /BuVDG4BoOqALHbjw9FvqAGDPv0dLrKNtwaFujjTvha8Sp5CcOaEBmeRW5IKx1IdY6
	 B0fd/wRGKNzXCh3Ll+LHU/sXigtdw74mqzQSpvBNwibYV2OJRoe4abVgh95OOepFwY
	 g5ZYEebwX3+Faf3BmoWVv/0JzQJbTWamJJs4K+seNfG9JnQpQYsprzQoQb0b+da0KT
	 5ySiWzv4eU8qpxOLC/D0XAUWKurURCXTD8EPBWGbWLHPzbqIGqgUI6JBajWCC0DqFW
	 jLSOVtPGEuEvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 06/12] i3c: master: match I3C device through DT and
 ACPI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org
In-Reply-To: <20260728065955.809445-7-akhilrajeev@nvidia.com>
References: <20260728065955.809445-1-akhilrajeev@nvidia.com>
 <20260728065955.809445-7-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 07:20:51 +0000
Message-Id: <20260728072052.528E41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Uninitialized stack memory read and kernel stack information leak =
during device unregistration when `i3cdev->desc` is NULL.
- [High] NULL pointer dereference in sysfs attribute show functions when ac=
cessed concurrently with device removal.
--

--- Patch [6]: [PATCH v7 06/12] i3c: master: match I3C device through DT an=
d ACPI ---
commit d545f133fafb1ddd78e75d979b76dc143ac8e0b0
Author: Akhil R <akhilrajeev@nvidia.com>

i3c: master: match I3C device through DT and ACPI

This commit updates i3c_device_match() to allow SETAASA-based I3C devices
to be matched through Device Tree or ACPI. It checks if the device has a
SETAASA static address method and uses of_driver_match_device() or
acpi_driver_match_device() as fallbacks when standard ID matching is not
applicable.

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 488177d95e484..f94e2410d37ba 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c

[ ... ]

> @@ -345,15 +346,32 @@ static int i3c_device_match(struct device *dev, con=
st struct device_driver *drv)
>  {
>  	struct i3c_device *i3cdev;
>  	const struct i3c_driver *i3cdrv;
> +	u8 static_addr_method =3D 0;
> =20
>  	if (dev->type !=3D &i3c_device_type)
>  		return 0;
> =20
>  	i3cdev =3D dev_to_i3cdev(dev);
>  	i3cdrv =3D drv_to_i3cdrv(drv);
> -	if (i3c_device_match_id(i3cdev, i3cdrv->id_table))
> +
> +	if (i3cdev->desc && i3cdev->desc->boardinfo)
> +		static_addr_method =3D i3cdev->desc->boardinfo->static_addr_method;
> +
> +	/*
> +	 * SETAASA-based devices need not always have a matching ID since
> +	 * it is not mandatory for such devices to implement deviceinfo
> +	 * CCC commands. Allow them to register through DT or ACPI.
> +	 */
> +	if (i3cdrv->id_table && i3c_device_match_id(i3cdev, i3cdrv->id_table))

[Severity: High]
This is a pre-existing issue, but can i3c_device_match_id() read
uninitialized stack memory here?

During device unregistration, i3c_master_unregister_i3c_devs() explicitly
sets i3cdev->dev->desc =3D NULL before calling device_unregister().

If driver matching occurs concurrently, i3c_device_match_id() might be call=
ed
while desc is NULL:

drivers/i3c/device.c:i3c_device_match_id() {
    struct i3c_device_info devinfo;
    ...
    i3c_device_get_info(i3cdev, &devinfo);
    manuf =3D I3C_PID_MANUF_ID(devinfo.pid);
    ...
}

Because i3c_device_get_info() does not initialize devinfo when desc is NULL,
this leaves stack memory to be read unconditionally and used in the matching
logic. This same uninitialized memory can also leak to userspace through the
uevent MODALIAS string in i3c_device_uevent() when desc is NULL.

Should i3c_device_match_id() be guarded by checking i3cdev->desc, similar
to how static_addr_method is guarded above?

>  		return 1;
> =20
> +	if (static_addr_method & I3C_ADDR_METHOD_SETAASA) {
> +		if (of_driver_match_device(dev, drv))
> +			return 1;
> +		if (acpi_driver_match_device(dev, drv))
> +			return 1;
> +	}
> +
>  	return 0;
>  }

Also, while reviewing this, I noticed another pre-existing issue during dev=
ice
unregistration:

[Severity: High]
This isn't a bug introduced by this patch, but can bcr_show() and dcr_show()
dereference a NULL pointer?

When i3c_master_unregister_i3c_devs() clears i3cdev->dev->desc =3D NULL, th=
ere
is a race window before the sysfs files are removed in device_del(). If a
user reads the bcr or dcr sysfs attributes during this window,
dev_to_i3cdesc() will return NULL:

drivers/i3c/master.c:bcr_show() {
    ...
    desc =3D dev_to_i3cdesc(dev);
    ret =3D sysfs_emit(buf, "0x%02x\n", desc->info.bcr);
    ...
}

Could this lead to a NULL pointer dereference?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728065955.8094=
45-1-akhilrajeev@nvidia.com?part=3D6
