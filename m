Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9273D9058;
	Tue, 28 Jul 2026 07:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223243; cv=none; b=LPPi8AFTHd6hT5VCO659ll5qhQqYpA5i14JYf93kBRRD4lwa2T9rmczqhvEOsFCfpijWLOeCaYNJr02MWBU11jhF1KV5O6KFNFBmMLMADIDByf2vGV5gWStqoOb94htsgvdmPoKqRz45tAlTAXU3Ltob/eOtsVp0l2wOUteodBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223243; c=relaxed/simple;
	bh=RQcRYIaoMMyHwhELQmRpMx08wRli9QzO9cuelCLqv1c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=V9FvS/1iQahfNgaDa49YsOwi8e3si+/yoJaS0tkkr9dU0PpMUeVzHio50XR1or2iYEBE+I7zYEvfHpPFar7P4IvS5EVXGTjEtHj/uJijg3u6cpAj3jh/JQF7yd4VgXfLEso892YcY28OCdPMv3J8p4E0sBLnDOqo5AHBkOd1Pac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O/vNw53L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/vNw53L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B1591F000E9;
	Tue, 28 Jul 2026 07:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785223241;
	bh=8WfwwvGg2qLTfrP4eVDki/1M/8rAfrjDZMctghwmJaI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O/vNw53LvxSL676ugotdtxAGSeXDMgseMhyJFSv5tw0R4FcroYl29Wt9c1/OqrJQh
	 y8+gNEarv6pe1O4yOyXo0a2M/TXh8kJ7RSKHQhxsLVvpHsvBrA2iQpD5uqiLdhgoa8
	 tzJqJZobNVCNWaa8+TogduXmZJb/4ZmdTN9lEOd4Ta8FOHm36Mk1GbDa07s0m9TIvI
	 GW76KXZgh2/8YiVDdYIVjDOxCnm0+WDESZSFFh4T4I9Rqrq6UogfxFDGyGE5S7f+qT
	 y1OHtorph6gkY3DTnDBMK/jPnlDcvAdu3T2ysRXl/ws50t5iRnJXor9mhDb77yyDEO
	 dJ9ZEEHNdYRgg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 05/12] i3c: master: Add support for devices without
 PID
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: robh@kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260728065955.809445-6-akhilrajeev@nvidia.com>
References: <20260728065955.809445-1-akhilrajeev@nvidia.com>
 <20260728065955.809445-6-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 07:20:40 +0000
Message-Id: <20260728072040.9B1591F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Dead code in `i3c_master_attach_boardinfo` fallback match logic pr=
events Device Tree node attachment for SETAASA devices discovered via DAA.
- [High] Duplicate I3C device creation for SETAASA devices participating in=
 Dynamic Address Assignment.

Pre-existing issues:
- [High] Use-After-Free and Double-Free on driver teardown due to a danglin=
g pointer left by `device_register()` failure.
--

--- Patch [5]: [PATCH v7 05/12] i3c: master: Add support for devices withou=
t PID ---
commit 978db33da88aedc2a14abd69fdc128b5e3961e92
Author: Akhil R <akhilrajeev@nvidia.com>

i3c: master: Add support for devices without PID

Devices using SETAASA for address assignment are not required to have
a 48-bit PID according to the I3C specification. Allow such devices to
register and use the static address where PID was required.

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 87749a739e62d..488177d95e484 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2001,8 +2001,17 @@ i3c_master_register_new_i3c_devs(struct i3c_master=
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
>  			device_set_node(&desc->dev->dev, desc->boardinfo->fwnode);

[Severity: High]
This is a pre-existing issue, but does device_register() failure in this
function leave a dangling pointer that causes a use-after-free later?

Just below this hunk in i3c_master_register_new_i3c_devs():

    ret =3D device_register(&desc->dev->dev);
    if (ret) {
        dev_err(&master->dev,
            "Failed to add I3C device (err =3D %d)\n", ret);
        put_device(&desc->dev->dev);
    }

When put_device() frees desc->dev->dev, desc->dev is not set to NULL.
Later, if the master is unregistered, i3c_master_unregister_i3c_devs()
iterates through the list and dereferences this dangling pointer:

    if (!i3cdev->dev)
        continue;
    i3cdev->dev->desc =3D NULL;
    // ...
    else
        put_device(&i3cdev->dev->dev);

Could desc->dev be set to NULL after put_device() to prevent this?

[ ... ]

> @@ -2401,8 +2410,18 @@ static void i3c_master_attach_boardinfo(struct i3c=
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

[Severity: High]
Will this fallback matching logic fail for SETAASA devices discovered
dynamically?

If a SETAASA device without a PID in the Device Tree loses its dynamic
address and asserts a Hot-Join, the master will execute Dynamic Address
Assignment (DAA).

During DAA, __i3c_master_add_i3c_dev_locked() allocates a new device
descriptor and initializes newdev's static_addr to 0, because the static
address cannot be retrieved via CCCs.

When i3c_master_attach_boardinfo(newdev) is then called,
i3cdev->info.static_addr will be 0. Would this cause the condition
i3cdev->info.static_addr !=3D i3cboardinfo->static_addr to always evaluate
to true, skipping the boardinfo assignment and preventing the driver from
binding?

> =20
>  		i3cdev->boardinfo =3D i3cboardinfo;
>  		i3cdev->info.static_addr =3D i3cboardinfo->static_addr;
> @@ -2416,8 +2435,12 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev=
_desc *refdev)
>  	struct i3c_master_controller *master =3D i3c_dev_get_master(refdev);
>  	struct i3c_dev_desc *i3cdev;
> =20
> +	if (!refdev->info.pid)
> +		return NULL;
> +
>  	i3c_bus_for_each_i3cdev(&master->bus, i3cdev) {
> -		if (i3cdev !=3D refdev && i3cdev->info.pid =3D=3D refdev->info.pid)
> +		if (i3cdev !=3D refdev && i3cdev->info.pid &&
> +		    i3cdev->info.pid =3D=3D refdev->info.pid)
>  			return i3cdev;
>  	}
> =20

[Severity: High]
Does this logic lead to duplicate device creation for SETAASA devices that
participate in Dynamic Address Assignment?

If a SETAASA device is defined in the DT without a PID, it is initially
added to the master's bus list with pid =3D 0. If the device later asserts a
Hot-Join, the master executes DAA, discovers the device, and retrieves its
true physical PID.

In __i3c_master_add_i3c_dev_locked(), the old device is searched using:
olddev =3D i3c_master_search_i3c_dev_duplicate(newdev);

Since the existing device has pid =3D 0, the check here for i3cdev->info.pid
and i3cdev->info.pid =3D=3D refdev->info.pid will fail to match the newly
discovered PID to the existing device. Will this cause the master to add
the newly discovered device instead of detaching and updating the existing
one, resulting in duplicate devices on the bus?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728065955.8094=
45-1-akhilrajeev@nvidia.com?part=3D5
