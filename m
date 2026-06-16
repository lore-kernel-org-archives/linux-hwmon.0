Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9D93AB281;
	Tue, 16 Jun 2026 10:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781605161; cv=none; b=HQ4ZTJq/IRrkzRelphPdYDn/6KxBUsrOAhAxHCL6HGJaeWdZLaU+CidHD/2Lld10sQYRJtM2oHLgNzT22XjErB7756xFXwPyIHjJrG5sra5laJLXgWe7n5VW8NF1ZXsauPiAu+ih9DJbwA6aHZqFPcuBJk01yh+F6kaJaliUm5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781605161; c=relaxed/simple;
	bh=bnvCIXlxzX4LCQPXtowtX2FMuqhe81+3Wq9mbErYvyQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jFxy4+o1Zjat6W331ar4hjXspx6diiDT7safhwwpJiRxyw/0g2Odu8aD+PT5IAUbjs0IJfzyXgNQjwThkvto80Wv6S8GGPKKdya2HKJZhvKw2GvXOOkAzTJ3zv0UNN2hLEDA+YVM4VSBmMEr2hmExAmVx4bBrC4gh952agwdrb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HUC7EEAN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HUC7EEAN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 299491F000E9;
	Tue, 16 Jun 2026 10:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781605159;
	bh=MRjcUhnUfvUWbJsv/W5JzZ1v4mTvAbSMKvMjIuGQqkk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HUC7EEAN8RWZp3GHz3Tj8OKiY8adG7sEUbFZVAgiUF1Ktq73Lcsm7JW/8DuTT52cu
	 Veu2M2WY5XOhKE/Mp2xv5FfQQsph39aU4yXLuu1ai4yhhf4DhC+qZw1kzp3H+0YvWJ
	 5AHJ4P2S4lM1fa4s8eib8/syEJHWNCA2DmluSwKF1QeETJ1v4VicyZQ6pLhxBdnyQ2
	 LXZj/tXH6Fl7HKBocjp12uNCJ5Z/3J7ggMISKlzCgOL4oQ+RhSqtZLmmpDk3c55zoR
	 w3ntIyIfSiDg/mGCgWMprvmZRADq6tWyZ5UTaS0ZWQxZ6SCXMDLP2Kp3f9B4QzfLpI
	 Ds1PaflYoXA/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 04/12] i3c: master: Add support for devices using
 SETAASA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: robh@kernel.org, Frank.Li@kernel.org, linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260616095429.3947205-5-akhilrajeev@nvidia.com>
References: <20260616095429.3947205-5-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 10:19:18 +0000
Message-Id: <20260616101919.299491F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Missing CCC command whitelisting in I3C master drivers causes enti=
re bus initialization to fail.
- [High] Premature SETAASA broadcast preempts and breaks SETDASA initializa=
tion.
- [High] Missing physical device address reset (RSTDAA) on SETAASA attach f=
ailure allows address collisions.

Pre-existing issues:
- [High] Bypassing PID validation allows duplicate PIDs, triggering a pre-e=
xisting Use-After-Free during teardown.
--

commit ef82dd52670ca8654bff7067823722f8e77933d1
Author: Akhil R <akhilrajeev@nvidia.com>

i3c: master: Add support for devices using SETAASA

Add support for devices using SETAASA, such as SPD5118 and SPD5108
attached to DDR5 memory modules that do not support ENTDAA. Follow the
guidelines proposed by the MIPI Discovery and Configuration
Specification [1] for discovering such devices.

SETAASA (Set All Addresses to Static Address) differs from standard I3C
address assignment that uses ENTDAA or SETDASA to assign dynamic
addresses. Devices using SETAASA assign their pre-defined static addresses
as their dynamic addresses during DAA, and it is not mandatory for these
devices to implement standard CCC commands like GETPID, GETDCR, or GETBCR.
For such devices, it is generally recommended to issue SETHID (specified
by JEDEC JESD300) as a prerequisite for SETAASA to stop HID bit flipping.

Link: https://www.mipi.org/mipi-disco-for-i3c-download

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index f0e05bcac26da..557332d932576 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c

[ ... ]

> @@ -1852,6 +1898,22 @@ static int i3c_master_early_i3c_dev_add(struct i3c=
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
> +		ret =3D i3c_master_reattach_i3c_dev(i3cdev, 0);
> +		if (ret)
> +			goto err_detach_dev;
               ^^^^^^^^

[Severity: High]
Does skipping the physical device address reset (RSTDAA) here allow address
collisions?

If i3c_master_reattach_i3c_dev() fails for a SETAASA device, the code jumps=
 to
err_detach_dev. Unlike the SETDASA error path which jumps to err_rstdaa to
issue a directed RSTDAA command and clear the dynamic address, this path
leaves the physical device active at that address.

Meanwhile, i3c_master_detach_i3c_dev() frees the address slot in the master=
's
software state. During subsequent Dynamic Address Assignment (DAA), the mas=
ter
may assign this supposedly "free" address to another device, resulting in t=
wo
physical devices responding to the same dynamic address.

[ ... ]

> @@ -2206,6 +2268,12 @@ static int i3c_master_bus_init(struct i3c_master_c=
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
Will this unconditional broadcast of SETAASA cause the entire bus initializ=
ation
to fail on certain controllers?

Several I3C master drivers (e.g., Cadence, SVC, Renesas) implement a strict
whitelist via the supports_ccc_cmd callback. Because these whitelists were
not updated to allow I3C_CCC_SETAASA (0x29) and I3C_CCC_VENDOR(0, true)
(SETHID), the master driver returns -EOPNOTSUPP. This error propagates up
through i3c_master_setaasa_locked(), causing i3c_master_bus_init() to
immediately abort.

[Severity: High]
Does this premature SETAASA broadcast break SETDASA initialization?

By broadcasting SETAASA before processing devices that require SETDASA:

    list_for_each_entry(i3cboardinfo, &master->boardinfo.i3c, node) {
        ...
        if (i3cboardinfo->static_addr)
            i3c_master_early_i3c_dev_add(master, i3cboardinfo);
    }

any device with a static address will accept the broadcast and adopt its
static address as its dynamic address. If a device was configured to use
SETDASA, it will erroneously accept the SETAASA broadcast.

When i3c_master_early_i3c_dev_add() subsequently attempts to issue the
directed SETDASA command, the device already has an assigned dynamic address
and will ignore the command. This causes the software state to desynchronize
from the physical device state. The MIPI I3C spec explicitly mandates that
SETDASA commands must be sent prior to the SETAASA command.

>  	/*
>  	 * Reserve init_dyn_addr first, and then try to pre-assign dynamic

[ ... ]

> @@ -2724,6 +2799,9 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_cont=
roller *master,
>  			return -EINVAL;
>  	}
> =20
> +	/* Update the address methods required for device discovery */
> +	master->addr_method |=3D boardinfo->static_addr_method;
> +
>  	boardinfo->pid =3D ((u64)reg[1] << 32) | reg[2];
> =20
>  	if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||
        ^^^^^^^^

[Severity: High]
This isn't a bug introduced by this patch, but does allowing duplicate PIDs
(such as PID=3D0 for SETAASA devices) trigger a pre-existing Use-After-Free=
 during
teardown?

Since SETAASA devices don't require standard CCC commands like GETPID,
configuring multiple SETAASA devices with an identical dummy PID (like PID=
=3D0)
passes the validation here.

When i3c_master_register_new_i3c_devs() is called, dev_set_name() assigns
identical sysfs names to these duplicate devices. device_register() then fa=
ils
with -EEXIST. In the error path, put_device() is called, freeing desc->dev,
but desc->dev is not set to NULL.

During bus teardown in i3c_master_unregister_i3c_devs(), the core iterates
over all devices, sees the non-NULL dangling pointer, and calls
device_is_registered(&desc->dev->dev), leading to a Use-After-Free.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616095429.3947=
205-1-akhilrajeev@nvidia.com?part=3D4
