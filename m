Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22339466B5C;
	Tue, 16 Jun 2026 10:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781604753; cv=none; b=fWTQjc+pYk3/aHFdTcvkLF6NMpssstZ+IYbpe8G89Q/IfBDDpaLlAYha4E4uT0ZgEwbdpL8Juqvt0iTLxqQ90MIPYb7u+extESSkTkzcdw/fDYimz+R0C4yGQJUnHIx8CKLwTEopoOrEyiP4aQ0mAoLFVPk8eHE8Ic9ZRTscmUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781604753; c=relaxed/simple;
	bh=H7BK4jfl+64564s8cTfW9KaOksLfSNfnSy9wSJIVrQA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pZ/+I7MK1V86sy6vpAJ0bir6o3xZOVB8sfNwulF0Cq76VIQc3kPEE9LqS+UiXUfs0wtnYe6hbiiLE1eBFGwgEKnbFsHd35NBMi605c2tU8ZVyi1zF8Kv/q7/7AM4JLUl6fqojqnpFWZseZoT6r3R4ICDm5OSZKqXqXsFEai177U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nHpYlzyO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nHpYlzyO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A93B1F00A3A;
	Tue, 16 Jun 2026 10:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781604751;
	bh=gDyBzQm7pmBkJMLlglN9wxxwMYLONHM9TCoBw5z/hG8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nHpYlzyONSipMoRaI9vYtn0uTyZRMkwVneOILljrI44eHkXhRritXbzj4z71sYvPu
	 PQms7b+5amFPWwtXGNSSdJ4+D6URbl34aWfhvGrN9P95m7yptg2AB+pnSsmTmQpAyL
	 DJcGy3mrqsJvhEC2OLw7itYcvdm7dgc662nzc0Zj6i9OJwn15Ma/0OYtxhXAzU/Jt7
	 nqtvFVrxBSkO1dDc5lrgsWuF60qKia9MnQ/FY8K16zZ2ZB+bSNhh8ACTXG2h28N2Nv
	 83ggrJpw5r4JaGk79zFOm0ajjQKYOgAtk7WqvMsOtRzPbr9GGtN4j97rJrwuDp4W13
	 pnhK1dYxIedzw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 06/12] i3c: master: match I3C device through DT and
 ACPI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: Frank.Li@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-i3c@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20260616095429.3947205-7-akhilrajeev@nvidia.com>
References: <20260616095429.3947205-7-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 10:12:30 +0000
Message-Id: <20260616101231.3A93B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Lockless access to `i3cdev->desc` introduces a Time-of-Check to Ti=
me-of-Use (TOCTOU) race, Use-After-Free (UAF), and NULL pointer dereference=
 when a device is concurrently matched and unregistered.
- [Medium] Missing OF and ACPI modalias generation in `i3c_device_uevent` b=
reaks module autoloading for SETAASA-based I3C devices.

Pre-existing issues:
- [High] Matching logic reads uninitialized stack memory when i3cdev->desc =
is NULL.
--

commit 3dbcf3bf72698f3de90e327e59cfb2913ecd7503
Author: Akhil R <akhilrajeev@nvidia.com>

i3c: master: match I3C device through DT and ACPI

SETAASA-based devices cannot always be identified by PID or DCR; the
standard I3C id_table matching may not be applicable. Allow such devices
to be matched through Device Tree or ACPI.

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index bcc9c2d29c342..1bd545447b817 100644
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
Can this lockless access to i3cdev->desc cause a Use-After-Free or NULL
pointer dereference?

If the I3C master is unbound or unregistered concurrently,
i3c_master_unregister_i3c_devs() sets i3cdev->dev->desc =3D NULL locklessly=
 and
calls device_unregister().

Since i3c_device_match() is called from bus_for_each_dev() without taking t=
he
device lock, if the thread is preempted between checking i3cdev->desc and
reading desc->boardinfo, desc could be freed by i3c_master_bus_cleanup(),
causing a Use-After-Free.

Alternatively, without READ_ONCE(), could the compiler reload i3cdev->desc =
as
NULL, causing a direct NULL pointer dereference?

> +
> +	/*
> +	 * SETAASA-based devices need not always have a matching ID since
> +	 * it is not mandatory for such devices to implement deviceinfo
> +	 * CCC commands. Allow them to register through DT or ACPI.
> +	 */
> +	if (i3cdrv->id_table && i3c_device_match_id(i3cdev, i3cdrv->id_table))

[Severity: High]
This is a pre-existing issue, but can i3c_device_match_id() operate on
uninitialized stack memory here?

If i3cdev->desc is NULL (which can happen concurrently during device teardo=
wn
via i3c_master_unregister_i3c_devs()), i3c_device_get_info() returns early
without modifying the devinfo output buffer:

drivers/i3c/device.c:i3c_device_match_id() {
	struct i3c_device_info devinfo;
	...
	i3c_device_get_info(i3cdev, &devinfo);

	manuf =3D I3C_PID_MANUF_ID(devinfo.pid);
	...
}

This leaves devinfo uninitialized, causing the matching logic to extract
the manufacturer and part IDs from stack garbage.

>  		return 1;
> =20
> +	if (static_addr_method & I3C_ADDR_METHOD_SETAASA) {
> +		if (of_driver_match_device(dev, drv))
> +			return 1;
> +		if (acpi_driver_match_device(dev, drv))
> +			return 1;

[Severity: Medium]
Since this patch enables Device Tree and ACPI matching, does the bus uevent
callback (i3c_device_uevent()) also need to generate OF and ACPI modaliases?

Without of_device_uevent_modalias() or acpi_device_uevent_modalias(), udev
cannot automatically load the driver based on the DT compatible string or A=
CPI
HID, which breaks module autoloading for SETAASA-based devices.

> +	}
> +
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616095429.3947=
205-1-akhilrajeev@nvidia.com?part=3D6
