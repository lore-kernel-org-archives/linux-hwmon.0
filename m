Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525CE3BD63B
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Apr 2026 12:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775736482; cv=none; b=fhrPjnpxBPGPICnqUPqhWhAzb14Z8SdNPh1TU0pa7b4baLRDW2p054PYty9NNMy7ZgfzPRzAK0EGRtaRQHfSefFKxAZoaLagh2LDVErcmxjTK3PYXRJtSlUjJjTgbip0jGgNInRA1gwhWWGWqlkBh3bay9zeVa4gTUaisqDS1CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775736482; c=relaxed/simple;
	bh=D3eUyonz3T5LNBIwsD2fs+Kg06iA/8ytYy+eOixN5ug=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m0JFrT8DBhUsfW83eY7wAP8uL3GjbT8XYRL6BZ7LAGjFhAQtT+NmMKb667r8uBXmhGn/wb7tEfPdrCC8CrCrauY6a3wO2GfpB6w3zOsJWGqh3oEKSEKgTiHbS9kcKaAYkURcVLx9rI7c8BYtBehf/KTlTfje3LYnRz/lkHRsAFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qCjv1rTU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qCjv1rTU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5371C19424;
	Thu,  9 Apr 2026 12:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775736482;
	bh=D3eUyonz3T5LNBIwsD2fs+Kg06iA/8ytYy+eOixN5ug=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=qCjv1rTUYl0elmhg+55kfAN+OacLHFaKSpkdz0QSwqXYI7rtJoDF+FFOZEh/RRU4i
	 mdC1HhnwnyzHLMt+ClC2N/Q957QCIcOLV8AN6T2yGdtnVWqF00ayTsweVjkcj/WwUM
	 xvu0FW8epf8SS6ctawei3ZRaZhcuZ4EcEKzcl/RQH0cjOuexmUqQJ0MC+rifKR6hYr
	 XnkV1fI3C07e/tgRw9EkoNhlxMixcGZZ/LThnX6j/DCXBjoDFcIB7ChRh5HDnMD/eh
	 D3ref2I7HgQgJHDI0ahmY9uHuOnNvmStL93k8oNrSfkDcTfJ59aH3H2v7doXio29Ws
	 WGqhwXgTrpigQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/13] i3c: master: Add support for devices without
 PID
Reply-To: sashiko@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260409105747.48158-7-akhilrajeev@nvidia.com>
References: <20260409105747.48158-7-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Apr 2026 12:08:01 +0000
Message-Id: <20260409120801.C5371C19424@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 3 potential issue(s):
- [Medium] Dead code in `i3c_master_attach_boardinfo()` and broken duplicat=
e detection for PID-less devices.
- [Medium] Validation bypass allows non-compliant SETDASA devices with `pid=
 =3D=3D 0` and malformed PIDs for SETAASA devices.
- [Medium] PID-less devices will break module autoloading due to missing OF=
/ACPI modalias in `uevent`.
--

commit 3602fe937b2780b8c359e0f18a06557c23b9b124
Author: Akhil R <akhilrajeev@nvidia.com>

i3c: master: Add support for devices without PID

This commit introduces support for I3C devices without a 48-bit PID, such as
those using SETAASA for address assignment. It uses the static address for
naming and matching when the PID is not present.

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index a0f7a0d35f3f1..324a0440724e2 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1835,8 +1835,17 @@ i3c_master_register_new_i3c_devs(struct i3c_master=
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

For devices with pid =3D=3D 0, i3c_device_uevent() and modalias_show() will
generate an identical, generic string (e.g.,
MODALIAS=3Di3c:dcr00manuf0000part0000ext0000).

Will userspace tools like udev fail to automatically load the correct kernel
modules for these devices since the uevent callback does not emit the
OF_COMPATIBLE or ACPI modalias environment variables?

> =20
>  		if (desc->boardinfo)
>  			device_set_node(&desc->dev->dev, desc->boardinfo->fwnode);
[ ... ]
> @@ -2285,8 +2294,18 @@ static void i3c_master_attach_boardinfo(struct i3c=
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

Is it possible for this matching logic to fail during dynamic device discov=
ery?

Since this function is called from i3c_master_add_i3c_dev_locked() during
DAA, the core initializes info.dyn_addr, but info.static_addr is likely sti=
ll
0 because there is no CCC command to retrieve the static address during DAA.

This means i3cdev->info.static_addr !=3D i3cboardinfo->static_addr will alw=
ays
evaluate to true, causing the loop to continue and fail to attach the
boardinfo.

> +				continue;
> +		}
> =20
>  		i3cdev->boardinfo =3D i3cboardinfo;
>  		i3cdev->info.static_addr =3D i3cboardinfo->static_addr;
> @@ -2300,8 +2319,12 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev=
_desc *refdev)
>  	struct i3c_master_controller *master =3D i3c_dev_get_master(refdev);
>  	struct i3c_dev_desc *i3cdev;
> =20
> +	if (!refdev->info.pid)
> +		return NULL;

By unconditionally returning NULL here for PID-less devices, does this bypa=
ss
duplicate detection?

Should the static address be used as a fallback identifier to prevent dupli=
cate
device registration?

> +
>  	i3c_bus_for_each_i3cdev(&master->bus, i3cdev) {
> -		if (i3cdev !=3D refdev && i3cdev->info.pid =3D=3D refdev->info.pid)
> +		if (i3cdev !=3D refdev && i3cdev->info.pid &&
> +		    i3cdev->info.pid =3D=3D refdev->info.pid)
>  			return i3cdev;
>  	}
> =20
[ ... ]
> @@ -2601,9 +2624,15 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_con=
troller *master,
> =20
>  	boardinfo->pid =3D ((u64)reg[1] << 32) | reg[2];
> =20
> -	if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||
> -	    I3C_PID_RND_LOWER_32BITS(boardinfo->pid))
> -		return -EINVAL;
> +	/* For SETAASA devices, validate the static address instead of PID */
> +	if (boardinfo->static_addr_method & I3C_ADDR_METHOD_SETAASA) {
> +		if (!boardinfo->static_addr)
> +			return -EINVAL;
> +	} else {
> +		if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||
> +		    I3C_PID_RND_LOWER_32BITS(boardinfo->pid))
> +			return -EINVAL;
> +	}

Does this validation block inadvertently allow non-compliant SETDASA devices
without a PID?

If a device is processed here with static_addr_method =3D=3D I3C_ADDR_METHO=
D_SETDASA
and pid =3D=3D 0, the bitwise checks (0 & GENMASK) and I3C_PID_RND_LOWER_32=
BITS(0)
will both evaluate to 0, allowing the device to be registered without a val=
id
48-bit PID.

Additionally, for SETAASA devices, this entirely skips the else block where=
 PID
validation occurs. If a Device Tree explicitly provides a malformed PID (e.=
g.,
non-zero reserved bits) for a SETAASA device, it seems it would be accepted
without validation and exposed in sysfs.

Should malformed PIDs still be rejected even if SETAASA is used?

> =20
>  	boardinfo->init_dyn_addr =3D init_dyn_addr;
>  	boardinfo->fwnode =3D fwnode_handle_get(fwnode);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260409105747.4815=
8-1-akhilrajeev@nvidia.com?part=3D6
