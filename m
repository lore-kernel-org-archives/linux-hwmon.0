Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C52E1A6834;
	Wed, 24 Jun 2026 10:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782297808; cv=none; b=UQuiqLSiIAbwgyf6eEx7V2dmZ0DNE9fuvJmyW1OG3TY9PzVGvUKGAZ9TQTqR9FJnktjBX3rvgvdRrB/4vRkp6/4arnLYY5CA0oL/CFEm87Mc6DQE6g6lF29JLexW7k3JNvMoIjYIQUtG7A09ZqkJ32fDpLqsHFD6M1JwZx60+fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782297808; c=relaxed/simple;
	bh=R4GWgXSDfZRFOYFLWL2qY2Qv4yLi4ug5cWD7kvfqY0c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WXHf3S3Jazw0MgSAWrx+kRCKBM8BkyhzOGrwUT9l5AHeZwsXPz5zMKLX0gcntkFCPjjIbO9s4CQ/I8PsPIYYilQyfVbu1aP5f4zBM3Huui/1DQRSflsiVAamhP0j2VGJd3M0kSdqrM7nPhAbF6Wra3ExbzSKqNMNuldK6BpTNbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PkNePZG4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PkNePZG4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE6C81F000E9;
	Wed, 24 Jun 2026 10:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782297807;
	bh=vlkyL9YUBjkcdSXrl9jywchJVIm+LGiHnaO2QYGM5+0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PkNePZG405hIu/GcJ4qnKaeiADZ1Q0s0KWUg60rkx6mILhpihDl5l9Sz6t1ADmZuY
	 Sh08KfvsMG85Y9PuK+NuOdq1Yul6IVyhojD1fslEdGJaVYH9LguhZLzNo6sM0ScTbP
	 kXZ3hdyqGp4o73J2VsJnh8tr4utcf19RsZs/Pqv3s2dZUblwb0eMQs1eawCiyiWDOP
	 AKTQvhEpR1mezTuNkiBvDQxs/pqhflunUa1wo8NMKNK9l9kjk5XV7fppPQR6+uOint
	 DGJ6sTm1ak5qHDnTFZCv2WiTtpP8ZZVOmDBiEHs/1t5ZN/Lt/s1Y7jPgVrBo8qwllw
	 lLa/kJFE8LkyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 04/12] i3c: master: Add support for devices using
 SETAASA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-i3c@lists.infradead.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260624102153.1770072-5-akhilrajeev@nvidia.com>
References: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
 <20260624102153.1770072-5-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 10:43:26 +0000
Message-Id: <20260624104326.AE6C81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] SETAASA broadcast is sent before SETDASA direct assignments, which=
 breaks initialization for devices that natively support SETAASA but are co=
nfigured for SETDASA.

Pre-existing issues:
- [High] Missing RSTDAA on error path due to premature address slot clearin=
g leads to bus address collision.
- [High] Double free and Use-After-Free of `desc->dev` when `device_registe=
r()` fails.
--

commit 08b7cd00b36fcaa4fe6292af27e273df6dc64b5a
Author: Akhil R <akhilrajeev@nvidia.com>

i3c: master: Add support for devices using SETAASA

Add support for devices using SETAASA attached to DDR5 memory modules that
do not support ENTDAA. Devices using SETAASA assign their pre-defined static
addresses as dynamic addresses during DAA.

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 4bba2bad897a7..3deae8cdae525 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c

[ ... ]

> @@ -1878,6 +1924,22 @@ static int i3c_master_early_i3c_dev_add(struct i3c=
_master_controller *master,
>  	if (ret)
>  		goto err_free_dev;
> =20
> +	/*
> +	 * For devices using SETAASA instead of ENTDAA, the address is statical=
ly
> +	 * assigned. Update the dynamic address to the provided static address.
> +	 * Reattach the I3C device after updating the dynamic address with the =
same
> +	 * static address. It is not mandatory for such devices to implement CCC
> +	 * commands like GETPID, GETDCR etc. Hence, we can return after reattac=
hing.
> +	 */
> +	if (i3cdev->boardinfo->static_addr_method & I3C_ADDR_METHOD_SETAASA) {
> +		i3cdev->info.dyn_addr =3D i3cdev->boardinfo->static_addr;
> +		ret =3D i3c_master_reattach_i3c_dev_locked(i3cdev, 0);
> +		if (ret)
> +			goto err_rstdaa;
> +
> +		return 0;
> +	}
> +

[Severity: High]
This is a pre-existing issue, but missing RSTDAA on the error path due to
premature address slot clearing can lead to bus address collisions.

In i3c_master_early_i3c_dev_add(), the driver assigns the dynamic address
with SETDASA and reattaches the device. If reattaching fails, the error
path internally calls i3c_master_put_i3c_addrs(), which clears the
init_dyn_addr slot status back to I3C_ADDR_SLOT_FREE.

When the code jumps to err_rstdaa:

err_rstdaa:
	i3c_master_rstdaa_locked(master, i3cdev->boardinfo->init_dyn_addr);

It calls i3c_master_rstdaa_locked() to reset the device's dynamic address.
However, i3c_master_rstdaa_locked() verifies the slot status:

drivers/i3c/master.c:i3c_master_rstdaa_locked() {
    ...
	if (addr !=3D I3C_BROADCAST_ADDR && addrstat !=3D I3C_ADDR_SLOT_I3C_DEV)
		return -EINVAL;
    ...
}

Because the slot was just freed, the function silently returns without
sending the RSTDAA CCC command.

Will this allow the hardware device to continue squatting on the dynamic
address while the master considers the slot free, causing collisions later?

>  	ret =3D i3c_master_setdasa_locked(master, i3cdev->info.static_addr,
>  					i3cdev->boardinfo->init_dyn_addr);

[ ... ]

> @@ -2232,6 +2294,12 @@ static int i3c_master_bus_init(struct i3c_master_c=
ontroller *master)
>  	if (ret)
>  		goto err_bus_cleanup;
> =20
> +	if (master->addr_method & I3C_ADDR_METHOD_SETAASA) {
> +		ret =3D i3c_master_setaasa_locked(master);
> +		if (ret)
> +			goto err_bus_cleanup;
> +	}
> +

[Severity: High]
Is it possible that sending the SETAASA broadcast before direct SETDASA
assignments breaks initialization for devices that natively support SETAASA
but are configured for SETDASA?

According to the I3C specification, any device on the bus natively supporti=
ng
SETAASA will respond to this broadcast by adopting its static address as its
dynamic address.=20

After this broadcast, the driver iterates through devices and attempts to
assign custom dynamic addresses via direct SETDASA commands:

drivers/i3c/master.c:i3c_master_early_i3c_dev_add() {
    ...
	ret =3D i3c_master_setdasa_locked(master, i3cdev->info.static_addr,
					i3cdev->boardinfo->init_dyn_addr);
    ...
}

Since the target device already adopted its dynamic address during the
SETAASA broadcast, it is no longer in the unassigned state and will NACK
the subsequent SETDASA command.

Could this cause device initialization to abort entirely?

Should SETDASA direct assignments be executed before broadcasting SETAASA?

>  	/*
>  	 * Reserve init_dyn_addr first, and then try to pre-assign dynamic
>  	 * address and retrieve device information if needed.

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but there is a potential double
free and use-after-free of desc->dev when device_register() fails.

In i3c_master_register_new_i3c_devs(), if device_register() fails,
put_device() is called:

drivers/i3c/master.c:i3c_master_register_new_i3c_devs() {
    ...
	ret =3D device_register(&desc->dev->dev);
	if (ret) {
		dev_err(&master->dev, "Failed to add I3C device (err =3D %d)\n", ret);
		put_device(&desc->dev->dev);
	}
    ...
}

This drops the reference count to 0 and triggers i3c_device_release(), which
frees desc->dev via kfree(i3cdev). However, the pointer desc->dev is not set
to NULL and remains dangling in the master->bus.devs.i3c list.

Later, when the master module is unloaded or unregistered, the cleanup
iterates over the list:

drivers/i3c/master.c:i3c_master_unregister_i3c_devs() {
    ...
		if (!i3cdev->dev)
			continue;

		i3cdev->dev->desc =3D NULL;
		if (device_is_registered(&i3cdev->dev->dev))
			device_unregister(&i3cdev->dev->dev);
		else
			put_device(&i3cdev->dev->dev);
		i3cdev->dev =3D NULL;
    ...
}

Because i3cdev->dev is a dangling pointer, the check passes. This leads to
writing to i3cdev->dev->desc (use-after-free) and calling put_device() again
(double free).

Could we set desc->dev to NULL after put_device() in the registration error
path?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624102153.1770=
072-1-akhilrajeev@nvidia.com?part=3D4
