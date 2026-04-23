Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE392253EC
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Apr 2026 23:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776985289; cv=none; b=uy0e1EMqtlE+pelKpbxj1xTY/jBweVs9FoOTk3nUcwcVQs2Rpu7cKX8tQv1HgpqQBkzA8vHip1WxhKaoFcvSjXlmlm673lqJG6PfGijALh8FrtfNwLbXhV2ylHCcQ13M8dQB/10sE5QBg9PJizjRUNvZPts/Egsv9yheGJCYp0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776985289; c=relaxed/simple;
	bh=45gb8JWLO3GvVpcdEdnoH/vuijFcUvGujwR0Euq2ZAc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fIgufSU5+cIllsprUaQZ2rQfY2ATT6QpoOYrV+pldmDXnWS9kylRl4bQQb+qh/LjdwGUJxJdzSQb+Hxo0V3m/nfB5zUv/Wl1HPV7uOeHEw9Tx6b5ni13TZrDHVq9cdUoMBtqiwdICUas3Q72bW578D8wT18nrab/l/W+vZOpGZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ol/Z1oHf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ol/Z1oHf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9D2AC2BCAF;
	Thu, 23 Apr 2026 23:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776985289;
	bh=45gb8JWLO3GvVpcdEdnoH/vuijFcUvGujwR0Euq2ZAc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Ol/Z1oHf+XzONMiEc4maoU9MOGvAxyuGCnz30sDkIx6gdLfeteEEvMha4SHXHp6u3
	 yYqYND8FWalecSRTS6LPc03YtuO6z9IIgUVq9GAm2ndxU6X2q1ywBbTxOGzXBFB0Pe
	 A/UhsNOB7Cjuh4pk9IH027KzBgFHzA8wN12+8fcM4dJyWV3d5PHNRLS4wBGJdlH1tX
	 Ig+xinksWRtiabYADL1dMQryj2vyXyXw/ZPmsVr3cZlrL0vBZ50e8lHnrYcpj472vM
	 LFyuugEcin94WQ+TijzXCrwIhi19JYvXXhL5hhK4jE0lKaULe6BE9yfKhXmrrMUFiG
	 5xVWcsOUNthdg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 06/13] i3c: master: Add support for devices without
 PID
Reply-To: sashiko@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260423085718.70762-7-akhilrajeev@nvidia.com>
References: <20260423085718.70762-7-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Apr 2026 23:01:28 +0000
Message-Id: <20260423230128.E9D2AC2BCAF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 4 potential issue(s):
- [Critical] Pre-existing use-after-free and double-free on device registra=
tion failure.
- [High] Validation bypass allows SETDASA devices with a missing or zero PI=
D to be incorrectly registered.
- [Medium] PID validation is completely bypassed for SETAASA devices, allow=
ing malformed PIDs to be accepted and exposed.
- [Medium] Dead code and logic flaws in device matching and duplicate detec=
tion for dynamically discovered devices.
--

commit dbd7e3bde8caae211d2b1844852f3a001da04d22
Author: Akhil R <akhilrajeev@nvidia.com>

i3c: master: Add support for devices without PID

This commit allows devices without a 48-bit PID to register using their
static address. It primarily supports SETAASA address assignment as per the
I3C specification where a PID is not strictly required.

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index de72317c9a5c73..fbe8710c4c56f8 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1842,8 +1842,17 @@ i3c_master_register_new_i3c_devs(struct i3c_master=
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

This problem wasn't introduced by this patch, but does the error path furth=
er
down in this function leave a dangling pointer?

When device_register() fails, put_device() is called, which triggers
i3c_device_release() and frees desc->dev. However, desc->dev is not set to
NULL.

Later, during master teardown or driver unbind,
i3c_master_unregister_i3c_devs() iterates over the bus devices and checks
if (!i3cdev->dev) which will incorrectly pass. Could this lead to a
use-after-free and a subsequent double-free?

[ ... ]

> @@ -2288,8 +2297,18 @@ static void i3c_master_attach_boardinfo(struct i3c=
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

Is it possible for the static address match to succeed here?

This function appears to be called by i3c_master_add_i3c_dev_locked() for
devices dynamically discovered via the ENTDAA procedure. During ENTDAA, the
static address is not retrieved, meaning i3cdev->info.static_addr would be
zero.

Could this cause the match against non-zero SETAASA static addresses
to always fail?

[ ... ]

> @@ -2303,8 +2322,12 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev=
_desc *refdev)
>  	struct i3c_master_controller *master =3D i3c_dev_get_master(refdev);
>  	struct i3c_dev_desc *i3cdev;
> =20
> +	if (!refdev->info.pid)
> +		return NULL;
> +

Can refdev->info.pid ever be zero here?

Similar to attach_boardinfo, this duplicate search seems to be used during
ENTDAA discovery. During ENTDAA, the hardware PID is always retrieved, so
refdev->info.pid is never zero. Devices statically configured with SETAASA
bypass these functions entirely.

[ ... ]

> @@ -2604,9 +2627,15 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_con=
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

Does this bypass PID validation entirely for SETAASA devices, even if a
PID is provided?

If a device tree node explicitly provides a PID in its reg property for a
SETAASA device, it skips the reserved upper bits check. The unvalidated PID
is then stored in boardinfo->pid, and later used to name the device via
dev_set_name(). Could this expose malformed data to userspace in sysfs?

Also, if the mipi-i3c-static-method is SETDASA (or any method other than
SETAASA) and the device has a missing or zero PID, the execution reaches
this else block. Because boardinfo->pid is zero, the bitwise validation
mathematically evaluates to zero and passes.

Does this allow SETDASA devices to bypass validation and be registered
without a valid PID, violating the I3C specification?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260423085718.7076=
2-1-akhilrajeev@nvidia.com?part=3D6
