Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615B23C3BFC
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Apr 2026 11:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775735102; cv=none; b=PJwE4xqr2+H6RcQREnZF4tdINY9SJwCxEgjDC8jaZN8S8Yh3slBEUrcpebokp51CGcEwleSqguemCTxfRSfdDZolBsGHf/xAPNT1m3D1cnzM0DGww08dXXHZAT+xB3a1lOYt7QqI0F+7UAzcPxi8ODCZCcdnXBFzdibEZB2Fxeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775735102; c=relaxed/simple;
	bh=9h5m91pFAwbg1bWP0VghzySv2WTsA6xJdo3aRSaxSDk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r94sON/Sk8dAbZYaRIRfnNbCR7YcJ90ePNiI8+ELqFfyz43b39oiXCuajmf4jVzCWYJdwaxjF8eq07gEA/BN+WIYyT27TWD2PtEi1gLZObC2pH3eLF2/Wvba9U/KATKoCvGcfVQmHEZUq+c5WLIOxtyVBs4mpimOCOay+o2WpmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bHEL41n+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bHEL41n+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0D46C2BCB2;
	Thu,  9 Apr 2026 11:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775735101;
	bh=9h5m91pFAwbg1bWP0VghzySv2WTsA6xJdo3aRSaxSDk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=bHEL41n+Wp5tB8mKnIrW9Ykh1O4nMwANKmg44LZXX88wNS1HeD8l0ovTbf9XCHWgc
	 WlxdOMhuU7r7Y4UXLbkwoWq7SLBJVCkzlzhLfhnohuSFoSnfBjFt4CmFiNzZlRG1yQ
	 jMcpVB23h3W2IokDiYKFNnfiJYjzx/Ks43P1Ix57QkoqEJ/v0xrKsWDuGYVjreYURH
	 aZV+sNm7Vlfn5kdl4Z8nhNzIq3dTJaq98nCoXpsq/O123zTkvoy4SRTqfWURgyhqTz
	 r6BlybH1i1IOR1FZJpy/h0ud/cSSmmBp3TxKZvWXnaWes7PRBz525sQjq4wycX20z+
	 JiodQ/YNjk0Xw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/13] i3c: master: Add support for devices using
 SETAASA
Reply-To: sashiko@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260409105747.48158-6-akhilrajeev@nvidia.com>
References: <20260409105747.48158-6-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Apr 2026 11:45:01 +0000
Message-Id: <20260409114501.C0D46C2BCB2@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 6 potential issue(s):
- [High] SETAASA devices are broken after a system suspend/resume or hibern=
ation because the SETAASA command is not re-issued.
- [High] SETAASA devices are silently ignored and never discovered if the `=
assigned-address` property is omitted in the Device Tree.
- [High] Bus initialization aborts entirely if the SETAASA command receives=
 a NACK (returns I3C_ERROR_M2).
- [High] Failure or lack of support for the optional vendor SETHID command =
incorrectly aborts the mandatory SETAASA command.
- [High] The subsystem registers SETAASA devices as fully initialized even =
if the SETAASA broadcast command is unsupported by the master controller.
- [Medium] The `assigned-address` slot is leaked for SETAASA devices if it =
differs from the static address.
--

commit dc4fb47509ec38e7d13a29f0254a84fd3c4d74a0
Author: Akhil R <akhilrajeev@nvidia.com>

i3c: master: Add support for devices using SETAASA

This commit adds support for discovering I3C devices using SETAASA, such as
SPD5118 and SPD5108 attached to DDR5 memory modules. It implements the
SETAASA CCC command, optionally preceded by SETHID, to assign static
addresses as dynamic addresses during dynamic address assignment.

Link: https://www.mipi.org/mipi-disco-for-i3c-download

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
[ ... ]
> @@ -1049,6 +1049,47 @@ static int i3c_master_rstdaa_locked(struct i3c_mas=
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
> +	i3c_ccc_cmd_dest_cleanup(&dest);
> +	if (ret)
> +		return ret;

If the master controller driver rejects unsupported vendor CCCs and returns
-EOPNOTSUPP, or the devices NACK the command, this early return will prevent
the mandatory SETAASA command from being broadcast.

Should the SETHID failure be tolerated so the mandatory SETAASA sequence can
still proceed?

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
> @@ -1733,6 +1774,18 @@ static int i3c_master_early_i3c_dev_add(struct i3c=
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

In i3c_master_bus_init(), if i3c_master_setaasa_locked() returns -EOPNOTSUP=
P,
the failure is caught, a warning is logged, and initialization proceeds.

Later, this block blindly assigns the static address as the dynamic address
and returns success, which causes the framework to allocate and register the
I3C device under the assumption it is addressable.

Does this cause subsequent I/O to the device to silently fail or time out
due to the target hardware never actually receiving the SETAASA command?

Additionally, if a SETAASA device is defined in the Device Tree with an
assigned-address that differs from its static_addr, i3c_master_bus_init()
reserves the init_dyn_addr slot by marking it as I3C_ADDR_SLOT_EXT_DESIRED.

Since this code returns early for SETAASA devices, the slot for init_dyn_ad=
dr
is never cleared or updated.

Could this permanently leak the slot in the bus's address status table?

[ ... ]
> @@ -2132,6 +2185,16 @@ static int i3c_master_bus_init(struct i3c_master_c=
ontroller *master)
>  			goto err_bus_cleanup;
>  	}
> =20
> +	if (master->addr_method & I3C_ADDR_METHOD_SETAASA) {
> +		ret =3D i3c_master_setaasa_locked(master);
> +		if (ret) {
> +			if (ret =3D=3D -EOPNOTSUPP)
> +				dev_warn(&master->dev, "SETAASA is not supported. Some devices may n=
ot be detected.\n");
> +			else
> +				goto err_bus_cleanup;
> +		}
> +	}

Broadcast CCC commands return I3C_ERROR_M2 if no I3C devices on the bus ACK
them, which can happen if the SETAASA device is offline or the bus only
contains I2C devices.

Unlike RSTDAA and DISEC, which explicitly tolerate this normal condition by
checking for I3C_ERROR_M2, this error check does not.

Will a NACK on the SETAASA command cause a complete denial of service for
the I3C controller and all its devices by jumping to err_bus_cleanup?

Looking further down in i3c_master_bus_init(), the pre-defined devices
iteration explicitly skips entries where init_dyn_addr is zero:

list_for_each_entry(i3cboardinfo, &master->boardinfo.i3c, node) {
        if (!i3cboardinfo->init_dyn_addr)
                continue;

If a SETAASA device is defined in the Device Tree without the
assigned-address property, init_dyn_addr defaults to 0, which means the loop
skips the device and i3c_master_early_i3c_dev_add() is never executed.

Since SETAASA devices do not participate in dynamic address assignment,
does this mean the subsystem will never discover or initialize them? Should
the framework automatically infer init_dyn_addr =3D static_addr for SETAASA
devices if assigned-address is not specified?

Finally, during a system hibernation restore, the I3C subsystem issues a
bus-wide dynamic address reset via i3c_master_do_daa_ext(master, true),
which broadcasts RSTDAA to reset all dynamic addresses. Following this, it
calls master->ops->do_daa(master) which broadcasts ENTDAA.

However, the resume path does not appear to re-broadcast the SETAASA comman=
d.

Because SETAASA devices do not participate in ENTDAA and rely exclusively on
SETAASA to adopt their static address, will they remain without a dynamic
address after resume, rendering them permanently inaccessible?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260409105747.4815=
8-1-akhilrajeev@nvidia.com?part=3D5
