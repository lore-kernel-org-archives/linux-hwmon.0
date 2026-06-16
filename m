Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3D5324B31;
	Tue, 16 Jun 2026 10:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781605060; cv=none; b=ZWgfcOQHe+RN8Li2ukDaYJGjP8pA3fMzRrM3JUW2FG/1CZ6D8E8S0y3jCUHw5vqc0Xxohn/S8Dw7k5JPOvHfCj/JS8XCfdumbSzHgUEd7y05jEC5MK6Jv+pCXZwk8qSTAOcp62XXix30Xupr3NJgT/YggiExCIywXRl3RjTuplM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781605060; c=relaxed/simple;
	bh=3Df0h30B5pdDIgPwrDp5lOb9fhohdDeWpWmslIihrGo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BBymxTtDLz0cMGoZeIk/Ajp/jJy9YBAaB+glOubmRCw93qC8xz97bERWp4KOuRN03EHF7enxL5cn0LK3xEpRfMjv+OioiGF8xcTGrSwdQfSRO2zF60HBuVEC1nA0lDuCiwmA8ZQNv0sHolpiLwr8Nd5T/onhDN0hfp1hrouiziE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g26xIRdj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g26xIRdj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF6891F00A3E;
	Tue, 16 Jun 2026 10:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781605059;
	bh=m9fvRfvFkE7880z8gjqTj4HICoZgZjnRQdAV/h+A+Oc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g26xIRdjQcF/oS9JPexpO07kEyekl4nXTm2DcEgU7vX6poYAZmj6kMwYMUUGgk2dD
	 lDi7smwhf7a6FRNocUdDiCG3rWVDMUZEd+89FCEbOCKD0ykUMuOPKt2UZmED5y7LHf
	 52UO4ecWMey2fQHUDvWOne3G/dlB/dM3S1czCAothPKV5QOx9sIWGGHF5P1ar6MGCe
	 B4dOIaZxN2ZvdkPQbdYqmoPEZUh+jnFGhygVQoMA1W2p7t9bHAdhGrtkf8lBLaISII
	 8pVYFpjbB8ej4RbxsPuIZMXfAeC73FsIRF+PoxqCP0/q1jLEdwqeAJcPM7pkmqDfq6
	 i/2M4D9ZF9Iwg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 05/12] i3c: master: Add support for devices without
 PID
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-i3c@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260616095429.3947205-6-akhilrajeev@nvidia.com>
References: <20260616095429.3947205-6-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 10:17:38 +0000
Message-Id: <20260616101738.CF6891F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] The fallback logic added to `i3c_master_attach_boardinfo` for match=
ing devices without a PID is completely unreachable dead code.

Pre-existing issues:
- [High] Dangling pointer in `i3c_master_register_new_i3c_devs()` error pat=
h leads to Use-After-Free and Double-Free.
--

commit 02ce08803703bc5626ea5224b66caedd628224e4
Author: Akhil R <akhilrajeev@nvidia.com>

i3c: master: Add support for devices without PID
   =20
Devices using SETAASA for address assignment are not required to have
a 48-bit PID according to the I3C specification. Allow such devices to
register and use the static address where PID was required.

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 557332d932576..bcc9c2d29c342 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1963,8 +1963,17 @@ i3c_master_register_new_i3c_devs(struct i3c_master=
_controller *master)
>  		desc->dev->dev.type =3D &i3c_device_type;
>  		desc->dev->dev.bus =3D &i3c_bus_type;
>  		desc->dev->dev.release =3D i3c_device_release;
> -		dev_set_name(&desc->dev->dev, "%d-%llx", master->bus.id,
> -			     desc->info.pid);
> +
> +		/*
> +		 * For devices without PID (e.g., SETAASA devices), use
> +		 * static address for naming instead.
> +		 */
> +		if (desc->info.pid)
> +			dev_set_name(&desc->dev->dev, "%d-%llx", master->bus.id,
> +				     desc->info.pid);
> +		else
> +			dev_set_name(&desc->dev->dev, "%d-%02x", master->bus.id,
> +				     desc->info.static_addr);
> =20
>  		if (desc->boardinfo)
>  			device_set_node(&desc->dev->dev,
>  					fwnode_handle_get(desc->boardinfo->fwnode));
> =20
>  		ret =3D device_register(&desc->dev->dev);
>  		if (ret) {
>  			dev_err(&master->dev,
>  				"Failed to add I3C device (err =3D %d)\n", ret);
>  			put_device(&desc->dev->dev);
>  		}

[Severity: High]
This is a pre-existing issue, but does this error path leave a dangling
pointer that can cause memory corruption?

If device_register() fails, put_device() drops the reference and frees
desc->dev. However, desc->dev is not set to NULL.

When the I3C master later unregisters, i3c_master_unregister_i3c_devs()
iterates through the bus devices. Since the pointer is left dangling, it
passes the if (!i3cdev->dev) check, leading to write-after-free when
setting i3cdev->dev->desc =3D NULL, followed by a double-free when calling
put_device() again.

Should desc->dev be set to NULL after calling put_device() here?

[ ... ]

> @@ -2357,8 +2366,18 @@ static void i3c_master_attach_boardinfo(struct i3c=
_dev_desc *i3cdev)
>  	struct i3c_dev_boardinfo *i3cboardinfo;
> =20
>  	list_for_each_entry(i3cboardinfo, &master->boardinfo.i3c, node) {
> -		if (i3cdev->info.pid !=3D i3cboardinfo->pid)
> -			continue;
> +		/*
> +		 * For devices without PID (e.g., SETAASA devices), match by
> +		 * static address. For devices with PID, match by PID.
> +		 */
> +		if (i3cboardinfo->pid) {
> +			if (i3cdev->info.pid !=3D i3cboardinfo->pid)
> +				continue;
> +		} else {
> +			if (!i3cboardinfo->static_addr ||
> +			    i3cdev->info.static_addr !=3D i3cboardinfo->static_addr)
> +				continue;
> +		}

[Severity: Low]
Is this else block reachable?

Looking at i3c_master_add_i3c_boardinfo(), it requires a valid PID for all
non-SETAASA devices. Since SETAASA devices bypass
i3c_master_attach_boardinfo() entirely as they are attached early via
i3c_master_early_i3c_dev_add(), wouldn't i3cboardinfo->pid be strictly
non-zero for any device reaching this function?

Additionally, for dynamically discovered devices, wouldn't
i3cdev->info.static_addr be 0 prior to this call, causing
i3cdev->info.static_addr !=3D i3cboardinfo->static_addr to always be true
anyway?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616095429.3947=
205-1-akhilrajeev@nvidia.com?part=3D5
