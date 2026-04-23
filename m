Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DD61ACEDF
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Apr 2026 22:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776983794; cv=none; b=TYMvoVZHIERiwxA4vuP5gL2/uaQbq24ctQCiiHWK63cA8xs/oX1+UeA8aKUPn9kNZkZqOUHCZFWICBpTR2N4cWbCE0cMskiMHYIdzLV0fwyji797nas38nyXrOO/JiniqKUx6GBF5GELNJLdixR7o7XGBI4vHvawTJHhsLqgmCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776983794; c=relaxed/simple;
	bh=O2nx30K00GEYBd3edMdjhlYOjmrhDes5guhVL46aYYQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Rz2k2/+Hwuq9smuQYygUeYyi6g/78DEANDYyoHy/ghOkFjI2qng7myJnj+CbIHh2+B17XVFZebRyuGVStLZjpHb5CHFdXHe65yQlCcET8IoonSZ+vTfVXUDG20fDOn7FlRnYD1JiaWlshd9hog6EBDa3hqxJe1PULsb5XMyp2NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d5Uai2Tu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d5Uai2Tu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEBB1C2BCAF;
	Thu, 23 Apr 2026 22:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776983794;
	bh=O2nx30K00GEYBd3edMdjhlYOjmrhDes5guhVL46aYYQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=d5Uai2TuPTS1S5mAS53jPLo++RB/XzgSiwu2zynB4WLps+X1k5uLRzf7oX70E/1LE
	 gnQdjt8MkmJDGKGs19hq7rwARxYHW7Mb0yP7vL+aPULEj1AzU/js33p3UoHFI+lc9J
	 y7CNdZkrydztKKahf5yR7rStttiOsQuuWr25fP9bbq9pyvA/PS18e7ti38CfiIVRSP
	 JG3hlwbcR6ZvRmn1Zk/x7aHm0sbNxwrVUhcJK+UFdw8zirlMi4QncM0ky6LqWQ55fX
	 O8U8iAj5IyOSE+YGNnKP4kxj6pC1BQ8MQzJKdTBf8PJvDOpEGNaZZO/bX0AbfA4Cbf
	 1Fu2FIJJ/jtvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 05/13] i3c: master: Add support for devices using
 SETAASA
Reply-To: sashiko@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260423085718.70762-6-akhilrajeev@nvidia.com>
References: <20260423085718.70762-6-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Apr 2026 22:36:33 +0000
Message-Id: <20260423223633.DEBB1C2BCAF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 7 potential issue(s):
- [High] Missing `i3c_master_reattach_i3c_dev` call for SETAASA devices cau=
ses hardware state desynchronization and address collisions.
- [High] Unhandled `I3C_ERROR_M2` in `i3c_master_setaasa_locked` aborts ent=
ire I3C bus initialization if no devices acknowledge the broadcast.
- [High] SETAASA devices without an explicit `assigned-address` property ar=
e silently ignored and never initialized.
- [Medium] Broadcasting SETAASA before issuing targeted SETDASA commands br=
eaks devices intended for SETDASA.
- [Medium] Bypassing `i3c_master_retrieve_dev_info` for SETAASA devices lea=
ves critical device capabilities zeroed.
- [Medium] Broadcasting Vendor Extension CCC (SETHID) without a defining by=
te violates the MIPI I3C specification.
- [Medium] Mismatch between `assigned-address` and `static_addr` for SETAAS=
A devices permanently leaks address slots.
--

commit 198585b433bb26dea4a874b95e4dc205539e927a
Author: Akhil R <akhilrajeev@nvidia.com>

i3c: master: Add support for devices using SETAASA

This commit adds support for devices using the SETAASA (Set All Addresses to
Static Address) method. It enables the discovery and dynamic address
assignment of these devices without relying on ENTDAA or SETDASA.

Link: https://www.mipi.org/mipi-disco-for-i3c-download

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index ffec97157d4883..de72317c9a5c73 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c

[ ... ]

> @@ -1051,6 +1052,47 @@ static int i3c_master_rstdaa_locked(struct i3c_mas=
ter_controller *master,
>  	return ret;
>  }
> =20
> +/**
> + * i3c_master_setaasa_locked() - start a SETAASA procedure (Set All Addr=
esses to Static Address)
> + * @master: I3C master object
> + *
> + * Send a SETAASA CCC command to set all attached I3C devices' dynamic a=
ddresses to
> + * their static address.
> + *
> + * This function must be called with the bus lock held in write mode.
> + *
> + * First, the SETHID CCC command is sent, followed by the SETAASA CCC.
> + *
> + * Return: 0 in case of success, a positive I3C error code if the error =
is
> + * one of the official Mx error codes, and a negative error code otherwi=
se.
> + */
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

Does this violate the MIPI I3C specification? The command is initialized
with a 0-length payload. The specification mandates that Vendor Extension
CCCs must include a defining byte (Vendor ID) in their payload when
broadcast.

Could broadcasting 0x61 without an identifier cause non-JEDEC devices to
misinterpret the command as their own vendor-specific extension?

> +	ret =3D i3c_master_send_ccc_cmd_locked(master, &cmd);
> +	i3c_ccc_cmd_dest_cleanup(&dest);
> +	if (ret)
> +		return ret;

Should this code handle the I3C_ERROR_M2 case? If no active devices
acknowledge the frame, the hardware controller returns an I3C_ERROR_M2
error.

Unlike RSTDAA and ENTDAA which explicitly suppress this error, propagating
it back to i3c_master_bus_init() causes the initialization to abort and
tears down all I2C and I3C devices on the bus.

> +
> +	/* Send SETAASA CCC command */
> +	i3c_ccc_cmd_dest_init(&dest, I3C_BROADCAST_ADDR, 0);
> +	i3c_ccc_cmd_init(&cmd, false, I3C_CCC_SETAASA, &dest, 1);
> +	ret =3D i3c_master_send_ccc_cmd_locked(master, &cmd);
> +	i3c_ccc_cmd_dest_cleanup(&dest);
> +
> +	return ret;
> +}

[ ... ]

> @@ -1739,6 +1781,18 @@ static int i3c_master_early_i3c_dev_add(struct i3c=
_master_controller *master,
>  	if (ret)
>  		goto err_free_dev;
> =20
> +	/*
> +	 * For devices using SETAASA instead of ENTDAA, the address is statical=
ly
> +	 * assigned. Update the dynamic address to the provided static address.
> +	 * Reattaching the I3C device is not useful. It is also not mandatory
> +	 * for such devices to implement CCC commands like GETPID, GETDCR etc.
> +	 * Hence, we can return here.
> +	 */
> +	if (i3cdev->boardinfo->static_addr_method & I3C_ADDR_METHOD_SETAASA) {
> +		i3cdev->info.dyn_addr =3D i3cdev->boardinfo->static_addr;
> +		return 0;
> +	}

By returning early, this bypasses the i3c_master_reattach_i3c_dev() call.
Does this leave the hardware state desynchronized? The dynamic address slot
is never marked as I3C_ADDR_SLOT_I3C_DEV in master->bus.addrslots, which
could lead to bus collisions during ENTDAA or Hot-Join.

Furthermore, the hardware master driver's .reattach_i3c_dev() callback is
skipped, meaning the physical controller's Device Address Table is never
updated and subsequent private transfers might fail.

Does skipping i3c_master_retrieve_dev_info() leave structural bounds like
max_read_len and max_write_len initialized to zero? Even if standard CCCs
are optional for these devices, downstream drivers might expect these fields
to be populated or have safe default values.

Also, if a user provides an assigned-address (init_dyn_addr) that differs
from the static_addr, this early return seems to leak the reserved address
slot. The init_dyn_addr slot is reserved earlier in i3c_master_bus_init(),
but this path never clears or updates it.

> +
>  	ret =3D i3c_master_setdasa_locked(master, i3cdev->info.static_addr,
>  					i3cdev->boardinfo->init_dyn_addr);
>  	if (ret)

[ ... ]

> @@ -2145,6 +2199,12 @@ static int i3c_master_bus_init(struct i3c_master_c=
ontroller *master)
>  	if (ret)
>  		goto err_bus_cleanup;
> =20
> +	if (master->addr_method & I3C_ADDR_METHOD_SETAASA) {
> +		ret =3D i3c_master_setaasa_locked(master);
> +		if (ret)
> +			goto err_bus_cleanup;
> +	}

Could broadcasting SETAASA before issuing targeted SETDASA commands break
devices intended for SETDASA?

If a device supports both methods, the initial SETAASA broadcast will cause
it to adopt its static address immediately. The subsequent SETDASA command
meant to assign a specific software-configured dynamic address would then
fail or be ignored.

> +
>  	/*
>  	 * Reserve init_dyn_addr first, and then try to pre-assign dynamic
>  	 * address and retrieve device information if needed.

Since SETAASA forces the dynamic address to equal the static address,
devices using this method might omit the optional assigned-address property.

If assigned-address is omitted, init_dyn_addr is 0. Looking at the loop
immediately following this code:

	list_for_each_entry(i3cboardinfo, &master->boardinfo.i3c, node) {
		if (!i3cboardinfo->init_dyn_addr)
			continue;

Does this cause SETAASA devices without an assigned-address to be completely
skipped and never initialized during the static device setup?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260423085718.7076=
2-1-akhilrajeev@nvidia.com?part=3D5
