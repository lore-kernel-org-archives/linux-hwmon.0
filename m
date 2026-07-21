Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BBF3EDAA2;
	Tue, 21 Jul 2026 04:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784607966; cv=none; b=hY3YCzjil4UIFgwDkBvA3FmV9n87hWBJttkVCDBvb3cHICRFziHC6ITo9MfgSUVXqUD+1reS/gYrVuLXQwT5v6Fc7WL4+SHrCBPi9xIh8xKtLeWxLhog39X3n7plciSMsa8vL0M2wIXlZMpNrlcrnnQhk9gv1EUOoaRwUmLifmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784607966; c=relaxed/simple;
	bh=WaciNlMmRDh7Si+nV3k6wSn77k9JJZ932HQtSDAj8Sg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TuBpwHOw2yt2J2aHjrLaLlJCimQSabxSTLmPjG92blq40JJ89b36aYa/YfgQxR3HI1kGR+rVSzNBvkju2ya6OjewXDZt0uCTDC4LyoVYd39mIpYpo6ly7k/2FpqdjQqjCBkQDhy6605PxQ1vkECF8lT/w6PnxgjLYlr788GDtrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SxxexnG6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SxxexnG6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87E791F00A3A;
	Tue, 21 Jul 2026 04:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784607965;
	bh=LAE26sMh6ZrJ8Lvg6zGD83jtaqtfFfO3Z4H0CXF5NvA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SxxexnG6ImrXdafB/AEmKq2CeRelaaJvkwIj10W/hMUl7rGNWem3TPgN+p1miIc9g
	 x7jFwnJXJXOEX2wGy4MXTKR+pd6ywz4ILsVsKn9uMetGt+EyS6xWkyDAtzQuR92Hsl
	 nzqIlOBuZkWPd39ypaTz8dj+h2WkY8EaEO9z3U0w+53KyLNuihCZS56Qy3kHJT6k3Q
	 jZKQhIF/6pu5/QS0G0z1XrjKUoNhqlMkBoyzhNsxk8PD6SJPICHNoXoQWiCuzJRT2F
	 nP2XDg7qyRrHUgzGdLdNOVW/+7o5a/+jMP4+kxND1enZs3Obh0dT34EG+HV4V7R+fT
	 v20cChD2O94EQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 05/12] i3c: master: Add support for devices without
 PID
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <20260721040805.1696503-6-akhilrajeev@nvidia.com>
References: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
 <20260721040805.1696503-6-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 04:26:04 +0000
Message-Id: <20260721042604.87E791F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The static address matching logic for devices without a PID in `=
i3c_master_attach_boardinfo` is unreachable and contains a structurally imp=
ossible condition.
- [Medium] Devices requiring a PID can now be registered with an invalid Ma=
nufacturer ID of 0.
--

--- Patch [5]: [PATCH v6 05/12] i3c: master: Add support for devices withou=
t PID ---
commit 671c3fae66002e874a13051a9c956e9987d76674
Author: Akhil R <akhilrajeev@nvidia.com>

i3c: master: Add support for devices without PID
   =20
Devices using SETAASA for address assignment are not required to have
a 48-bit PID according to the I3C specification. Allow such devices to
register and use the static address where PID was required.

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index b18dda89c4737..7b2f819bf4437 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c

[ ... ]

> @@ -2389,8 +2398,18 @@ static void i3c_master_attach_boardinfo(struct i3c=
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

[Severity: Medium]
Will this static address matching logic ever evaluate to false?

Since i3c_master_attach_boardinfo() is only called during the dynamic
address assignment (ENTDAA) phase, i3cdev->info.static_addr is inherently 0
in this context.

Because i3cboardinfo->static_addr is validated to be non-zero at creation,
the condition i3cdev->info.static_addr !=3D i3cboardinfo->static_addr will
evaluate to 0 !=3D non-zero, which is always true.

This means the loop will always continue, making this branch effectively
dead code that fails to perform the intended matching.

> =20
>  		i3cdev->boardinfo =3D i3cboardinfo;
>  		i3cdev->info.static_addr =3D i3cboardinfo->static_addr;

[ ... ]

> @@ -2848,9 +2871,16 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_con=
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
> +		if (!boardinfo->pid ||
> +		    (boardinfo->pid & GENMASK_ULL(63, 48)) ||
> +		    I3C_PID_RND_LOWER_32BITS(boardinfo->pid))
> +			return -EINVAL;
> +	}
> =20
>  	boardinfo->init_dyn_addr =3D init_dyn_addr;
>  	boardinfo->fwnode =3D fwnode_handle_get(fwnode);
> @@ -2873,10 +2903,10 @@ static int i3c_master_add_of_dev(struct i3c_maste=
r_controller *master,
>  		return ret;
> =20
>  	/*
> -	 * The manufacturer ID can't be 0. If reg[1] =3D=3D 0 that means we're
> -	 * dealing with an I2C device.
> +	 * I3C device should have either the manufacturer ID specified or the
> +	 * address discovery method specified. Else treat it as an I2C device.
>  	 */
> -	if (!reg[1])
> +	if (!reg[1] && !fwnode_property_present(fwnode, "mipi-i3c-static-method=
"))
>  		ret =3D i3c_master_add_i2c_boardinfo(master, fwnode, reg);
>  	else
>  		ret =3D i3c_master_add_i3c_boardinfo(master, fwnode, reg);

[Severity: Medium]
Could this change allow devices requiring a PID to be registered with an
invalid Manufacturer ID of 0?

By permitting reg[1] =3D=3D 0 when mipi-i3c-static-method is present in
i3c_master_add_of_dev(), it appears we can bypass the strict Manufacturer ID
validation in i3c_master_add_i3c_boardinfo().

If the method is SETDASA, which still requires a PID, boardinfo->pid is set
to ((u64)0 << 32) | reg[2].  If reg[2] is non-zero, !boardinfo->pid is fals=
e.

Would this result in successfully registering the device despite the zero
Manufacturer ID, violating the MIPI I3C specification?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721040805.1696=
503-1-akhilrajeev@nvidia.com?part=3D5
