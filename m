Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD73DF6C;
	Tue, 21 Jul 2026 04:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784608260; cv=none; b=lQW8jdm9PxXW2K+uSE58WK6rD5tsFWANudr9MmOxRYmZMg75ufr5hfX3DhLe1kuqfdrshm1dUg463hiH8kOufPW0wHZ8kGy8IkHRxPItX26EABzM/RwUihxgNva30Q9WF/iZLpMxNbmzkeDwd6f+rSAP7zcRqFaEOzPwryonFdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784608260; c=relaxed/simple;
	bh=hIi3miAZPOeJPN3RBTLw2GYm2gcHxs8PeQI0kLvI+zI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YW2FXqY9DIhBZUG2vma5e69tcfTqlSMBG5AgxY7eiW+ZoclbSwLyJ6HzFMnHmPGDerpEs7zR6+6sLks2TnahKoVi6wwuCuLkx9O24wKYBECkYuyGWhx3vFxr29l3v8ZE8qwe50X505cMNX5GyXuOMVlmcfDlIKMuS3yuvUyE+hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QfNJfbkC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QfNJfbkC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C02B31F000E9;
	Tue, 21 Jul 2026 04:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784608259;
	bh=kKu168ryXHB8z85GQdd/fahJPbMe/kfeBgo7Pl6WDNc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QfNJfbkC/azEzN8JUVO4bVy2qPL1et/LQJiCbpvyWT101z+TxxYqLkJ4uMzip/Pvx
	 2PTMvJ5fTz7UYCHYLDg/t8g9wLAzHd1OVOUMMuCKnIJJIk+xQQgk2qRu6+FlU2nYVq
	 o69it+D95NtX7O4W95dSI9XLxc0WwYSqOfcvpL7GjOfyGGEz042+vOICoTM5QD1Vji
	 S8cMLShJjSw/pO+JlKCPwnZ9mkbBRkW51HHD8+oIIQLCTTJFX53gndWTe7+jnxw7W2
	 ODfdvpwXYwGwn+TGtxxyZJx3dHVLju947RAEA8vkhqVdbQgCBwAI/TQoePJcIIY1P1
	 YPylh5vDE2CAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 04/12] i3c: master: Add support for devices using
 SETAASA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org, Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, conor+dt@kernel.org, linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260721040805.1696503-5-akhilrajeev@nvidia.com>
References: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
 <20260721040805.1696503-5-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 04:30:58 +0000
Message-Id: <20260721043058.C02B31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] State inconsistency on error path: a SETAASA device failing softwa=
re attachment will still claim its static address when the SETAASA broadcas=
t is sent, leading to an address collision.
- [High] Multiple SETAASA devices without specified PIDs will cause a kobje=
ct name collision during `device_register()`, preventing registration of su=
bsequent devices.
- [High] The newly introduced SETAASA and SETHID (vendor) CCC commands are =
not whitelisted in the majority of I3C master controller drivers, causing t=
he entire bus initialization to fail.

Pre-existing issues:
- [High] Preexisting SETDASA Hardware/Software state mismatch on failure du=
e to premature slot freeing before hardware reset.
--

--- Patch [4]: [PATCH v6 04/12] i3c: master: Add support for devices using =
SETAASA ---
commit e158b576a9f733695d868ee16f34bacdb43285b3
Author: Akhil R <akhilrajeev@nvidia.com>

i3c: master: Add support for devices using SETAASA

This commit adds support for discovering I3C devices using the SETAASA
procedure, such as SPD5118 and SPD5108 attached to DDR5 memory modules. It
adds the SETAASA and SETHID CCC commands and updates the discovery logic.

Link: https://www.mipi.org/mipi-disco-for-i3c-download

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 623c6b2247d9f..b18dda89c4737 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c

[ ... ]

> @@ -1102,6 +1103,51 @@ static int i3c_master_rstdaa_locked(struct i3c_mas=
ter_controller *master,
>  	return ret;
>  }
> =20
> +/**
> + * i3c_master_setaasa_locked() - start a SETAASA procedure (Set All Addr=
esses to Static Address)

[ ... ]

> +static int i3c_master_setaasa_locked(struct i3c_master_controller *maste=
r)
> +{
> +	struct i3c_ccc_cmd_dest dest;
> +	struct i3c_ccc_cmd cmd;
> +	int ret;
> +
> +	/*
> +	 * Send SETHID CCC command. Though it is a standard CCC command specifi=
ed
> +	 * in JESD300-5, we are not defining a separate macro to be explicit th=
at
> +	 * the value falls under the vendor specific range.
> +	 */
> +	i3c_ccc_cmd_dest_init(&dest, I3C_BROADCAST_ADDR, 0);
> +	i3c_ccc_cmd_init(&cmd, false, I3C_CCC_VENDOR(0, true), &dest, 1);
> +	ret =3D i3c_master_send_ccc_cmd_locked(master, &cmd);

[Severity: High]
Will this fail on most existing I3C master controllers?

Looking at i3c_master_send_ccc_cmd_locked(), it calls
master->ops->supports_ccc_cmd() before sending. Many core controller drivers
(like dw-i3c-master.c) have strict switch-statement whitelists for supported
CCC IDs that do not include these new SETAASA (0x29) and SETHID (0x61)
commands.

Would this result in returning -EOPNOTSUPP and aborting the entire bus
initialization on systems with these controllers?

> +	i3c_ccc_cmd_dest_cleanup(&dest);
> +	if (ret && cmd.err =3D=3D I3C_ERROR_M2)
> +		ret =3D 0;
> +	if (ret)
> +		return ret;

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

[Severity: High]
If i3c_master_reattach_i3c_dev_locked() fails here, we jump to err_rstdaa
and eventually free the device structure. However, i3c_master_bus_init()
later unconditionally broadcasts SETAASA to the bus.

Won't the physical device claim this static address during the broadcast,
even though the controller software no longer tracks it? This could lead to
a bus collision when the software later tries to dynamically assign this
"free" address slot to a different device.

[Severity: High]
This is a pre-existing issue, but does jumping to err_rstdaa correctly reset
the hardware if reattachment fails during SETDASA or SETAASA?

If i3c_master_reattach_i3c_dev_locked() fails, its internal error path calls
i3c_master_put_i3c_addrs(), which marks the slot as I3C_ADDR_SLOT_FREE.

When we reach the err_rstdaa path:

err_rstdaa:
    i3c_master_rstdaa_locked(master, i3cdev->boardinfo->init_dyn_addr);

i3c_master_rstdaa_locked() checks i3c_bus_get_addr_slot_status(). Because t=
he
slot is already marked FREE, it returns -EINVAL and silently aborts without
sending the RSTDAA command to the hardware.

Does this leave the physical device holding the address while the software
considers it free?

> +
> +		return 0;
> +	}
> +
>  	ret =3D i3c_master_setdasa_locked(master, i3cdev->info.static_addr,
>  					i3cdev->boardinfo->init_dyn_addr);

[ ... ]

> @@ -2741,7 +2816,19 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_con=
troller *master,
> =20
>  	boardinfo->static_addr =3D reg[0];
> =20
> +	if (!fwnode_property_read_u32(fwnode, "mipi-i3c-static-method", &static=
_addr_method))
> +		boardinfo->static_addr_method =3D static_addr_method &
> +					(I3C_ADDR_METHOD_SETDASA | I3C_ADDR_METHOD_SETAASA);
> +

[ ... ]

> +	if (boardinfo->static_addr_method & I3C_ADDR_METHOD_SETAASA) {
> +		/* For SETAASA, static address is taken as the dynamic address. */
> +		init_dyn_addr =3D boardinfo->static_addr;
> +	}
> +
> +	/* Update the address methods required for device discovery */
> +	master->addr_method |=3D boardinfo->static_addr_method;
> +
>  	boardinfo->pid =3D ((u64)reg[1] << 32) | reg[2];
> =20
>  	if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||

[Severity: High]
By relaxing the PID validation for SETAASA devices in this function, pid can
default to 0. If a system configures multiple SETAASA devices (like DDR5
SPDs) without PIDs, will this cause a kobject name collision?

During registration, i3c_master_register_new_i3c_devs() names the device
using its bus ID and PID:

dev_set_name(&desc->dev->dev, "%d-%llx", master->bus.id, desc->info.pid);

If multiple devices have pid=3D0, they would all be named "0-0", causing
device_register() to fail with -EEXIST for subsequent devices and preventing
them from functioning.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721040805.1696=
503-1-akhilrajeev@nvidia.com?part=3D4
