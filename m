Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFC03769F5;
	Tue, 21 Jul 2026 04:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784607960; cv=none; b=TBuTOEjEynubqNwhpxC/ywRZTXHXq0Q1DFLKUbQfbMkPKBKuFL4ZnyOBEp8cgyZN4pnL9NZUaaPWvn+f4PTiFs1RNc74pjfb62h4fhBVCzl63P5SRELRB+IRJMzPoX2Yp2fZ216WlDoTt/i/RVDM1kVB3G1Mwl6Umfn1JZ/U2CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784607960; c=relaxed/simple;
	bh=+SeSEsZg5NKiY3ax+9AtAeelcKhUbLZAGnelA+S859k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LPOm5F5dyT5tfLWULAg+Pzb8ltHx6fS3Zfsp9qjOLY2CB8XaJzuHvPe2+fzNeBp3BjfQ0VTm3LRfn1dvYWgXnxJ1jAK5SlW7eAMK3kZdiYbL+Mhw90PRiNYo/jD8JygXxunUQDfo/v2wdJTWJdqIxxtM3Vetr057cLXFXIeLHWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JCyZ/pHN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JCyZ/pHN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925AA1F000E9;
	Tue, 21 Jul 2026 04:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784607959;
	bh=mBcwC4C2rgKAGtprYqvIFdIc0x5h9R20Hqjlaosio3M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JCyZ/pHNirL40J5x9hACpSoROPVy0gQ3Pf6LFwEi9ZX34cPypEr4jgrRFGADO0jdW
	 DXQ0xqLP6ZjhUx04prGpv079/RLTfrDQotjF30aMLPHi5AuIT6u8UWHxhKRx7JzEXF
	 /oXK0og/splWVzw0sNDUvuqjW0GqzhUVjGSEePLvV22EKNZNNrT5P0Asakk4n9iPWG
	 7/LCF/3Cpy2CAl7hG2befu3FblUv5LDwPoT832qBzvVwNkgfFM3AnzlzEydYdDwL/L
	 WqfQFlAGUsQTbcTMqjb+J0tJHPx8SyJGfzaD2dfVoV7RJgYNoCIqjnZeIMr8iUO+tb
	 uzk8yVQl2yoMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 06/12] i3c: master: match I3C device through DT and
 ACPI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-i3c@lists.infradead.org, linux-hwmon@vger.kernel.org, Frank.Li@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260721040805.1696503-7-akhilrajeev@nvidia.com>
References: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
 <20260721040805.1696503-7-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 04:25:58 +0000
Message-Id: <20260721042558.925AA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Time-of-Check to Time-of-Use (TOCTOU) race condition leading to a =
NULL pointer dereference during device matching.
- [High] Missing OF and ACPI MODALIAS generation in the bus uevent callback=
, preventing module autoloading for newly supported devices.
- [Medium] Latent API trap: DT/ACPI matching bypasses the I3C ID table matc=
h, causing a NULL pointer dereference in driver probe functions.

Pre-existing issues:
- [High] Uninitialized kernel stack memory is deterministically leaked to u=
ser-space via the `KOBJ_REMOVE` uevent.
--

--- Patch [6]: [PATCH v6 06/12] i3c: master: match I3C device through DT an=
d ACPI ---
commit 7db2eb24719ceb614bd3ec6e5efb369d3b92fe6e
Author: Akhil R <akhilrajeev@nvidia.com>

i3c: master: match I3C device through DT and ACPI

SETAASA-based devices cannot always be identified by PID or DCR; the
standard I3C id_table matching may not be applicable. Allow such devices to
match through Device Tree or ACPI.

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 7b2f819bf4437..43bf530bc6619 100644
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

[Severity: High]
Can i3cdev->desc be modified concurrently here?

Looking at i3c_master_unregister_i3c_devs(), it locklessly sets
i3cdev->dev->desc =3D NULL during device unregistration.

Since the check in i3c_device_match() is done without locks or READ_ONCE(),
could the compiler emit multiple loads for i3cdev->desc, leading to a NULL
pointer dereference when subsequently accessing boardinfo?

> +
> +	/*
> +	 * SETAASA-based devices need not always have a matching ID since
> +	 * it is not mandatory for such devices to implement deviceinfo
> +	 * CCC commands. Allow them to register through DT or ACPI.
> +	 */
> +	if (i3cdrv->id_table && i3c_device_match_id(i3cdev, i3cdrv->id_table))
>  		return 1;
> =20
> +	if (static_addr_method & I3C_ADDR_METHOD_SETAASA) {
> +		if (of_driver_match_device(dev, drv))
> +			return 1;
> +		if (acpi_driver_match_device(dev, drv))
> +			return 1;
> +	}

[Severity: Medium]
Will this fallback matching break the assumptions in existing driver probe
functions?

Currently, drivers typically call i3c_device_match_id() in their probe
routine and unconditionally dereference the returned pointer.

When an I3C device binds via DT or ACPI through this new path,
i3c_device_match_id() will return NULL. If developers add an of_match_table
to existing drivers to support SETAASA devices, won't this cause an immedia=
te
NULL pointer dereference during probe?

[Severity: High]
How does this change affect module autoloading for newly supported devices?

While the patch allows devices to match via DT or ACPI, it appears the bus
uevent callback, i3c_device_uevent(), was not updated and only emits the
generic I3C modalias.

Since of_device_uevent_modalias() or acpi_device_uevent_modalias() are not
called, won't the uevent lack the required of:N... string, preventing udev
from matching the device against the driver's MODULE_DEVICE_TABLE(of, ...)?

[Severity: High]
This is a pre-existing issue, but can the removal of an I3C device leak
uninitialized kernel stack memory to user-space?

When an I3C device is removed, i3c_master_unregister_i3c_devs() sets
i3cdev->dev->desc =3D NULL before calling device_unregister(), which
triggers a KOBJ_REMOVE uevent.

In i3c_device_uevent():

	struct i3c_device_info devinfo;

	if (i3cdev->desc)
		devinfo =3D i3cdev->desc->info;

Since i3cdev->desc is unconditionally NULL during removal, devinfo is left
uninitialized. The function then proceeds to construct the MODALIAS string
using devinfo:

	return add_uevent_var(env,
			      "MODALIAS=3Di3c:dcr%02Xmanuf%04Xpart%04Xext%04X",
			      devinfo.dcr, manuf, part, ext);

Doesn't this deterministically embed uninitialized kernel stack data into t=
he
uevent environment variables, exposing it to user-space programs like udev?

> +
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721040805.1696=
503-1-akhilrajeev@nvidia.com?part=3D6
