Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0503BB13B;
	Tue, 28 Jul 2026 07:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223323; cv=none; b=igWuzd88rcHBHm8Rtw3IH5oPMW0xJOAqdYhTWPILSSojzfpBdkIhDqB68gR17mWbl8Jn3wHtJYMQfr/VP/E6J0+ngHZ7W/r73tbpyIGlBuwn3vou6P/8WLGyxznjd0OiX1ZRmw2qHhRoeIHgQrBKsa7hVb0wQE8a+rAOcy/Gsuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223323; c=relaxed/simple;
	bh=rooBfzUYpH4RSCdMhJ8jIso2o+pYjEX2Bgr4DeVwW4U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l8gwU47jY+yqQbTn3uo6/MLy6DsQT126pMPXhR9VTDUHxBIR9En9WTyvpgI/iHKk/G9EK078gy+qw0r6Es3c6XIBRBvwfUVlrJahJYW4BBa/Ef4iUpKp9EdpxQoWU53pkdP/CEzji0vjN4uIqAsrNmY/m3TFApdaPo/UdhccMJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JLBjBXVS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JLBjBXVS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD0D31F000E9;
	Tue, 28 Jul 2026 07:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785223322;
	bh=/jVcYYTljAvc90ZSueN+FPie1/9jzyht1lL9A3WdQ4U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JLBjBXVSAsoPSVsjIYrIZgj+3WjcQbSdiH38/j/XLTNjsl9B2fXMcv2HaRFA4AROf
	 h+cByIPRfXHA7ZsBdPhc9pGLMNocjk1mETqlltr87FWAcJcFZlsUbBlgcQXWyI7Owp
	 m5tN37SbmNTyyxLGaAjMnD2y5eYkkqfXyK6EB9SjM6PiM+pXYjQzvA6DFebK90VFtO
	 5QX3AgLvQucwOEBXU3BU2MlmeWpSmFUOXHkC3vxYKQG8irNfuzpGNEtezT98rIDOb3
	 k5Ll+W3Kp9Fy6MlvD4d4m9ojtdjh5p0hDF7WK5nHsmMLqn9N2SG8ax5X+vfbq/yfEa
	 qqhjlmNWwmQZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 04/12] i3c: master: Add support for devices using
 SETAASA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728065955.809445-5-akhilrajeev@nvidia.com>
References: <20260728065955.809445-1-akhilrajeev@nvidia.com>
 <20260728065955.809445-5-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 07:22:01 +0000
Message-Id: <20260728072201.AD0D31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Bypassing PID validation for SETAASA devices permits identical dum=
my PIDs, causing sysfs name collisions during registration and triggering a=
 Use-After-Free.
- [High] Sending SETAASA and SETHID CCCs will unconditionally fail bus init=
ialization on most hardware master controllers.
- [High] SETAASA devices become permanently unreachable after system hibern=
ation/restore because the SETAASA broadcast is not re-sent.
--

--- Patch [4]: [PATCH v7 04/12] i3c: master: Add support for devices using =
SETAASA ---
commit 61911732853b10649effe5164454ca8a4a87e970
Author: Akhil R <akhilrajeev@nvidia.com>
Subject: i3c: master: Add support for devices using SETAASA

This patch adds support for discovering and configuring devices using the
SETAASA method, which statically assigns addresses without using ENTDAA.
It adheres to the MIPI Discovery and Configuration Specification.

Link: https://www.mipi.org/mipi-disco-for-i3c-download

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 623c6b2247d9f..87749a739e62d 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
[ ... ]
> @@ -1878,6 +1926,22 @@ static int i3c_master_early_i3c_dev_add(struct i3c=
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
> +			goto err_detach_dev;
> +
> +		return 0;
> +	}

[Severity: High]
Does this early return prevent the device from acquiring a unique PID?

Since PID validation is bypassed for SETAASA devices in
i3c_master_add_i3c_boardinfo(), multiple devices can share the same default
PID (like 0). Because this skips i3c_master_retrieve_dev_info(), the dummy
PID is never replaced by a real one.

When i3c_master_register_new_i3c_devs() attempts to register these devices,
the sysfs registration fails due to duplicate names. The error handling cal=
ls
put_device() but leaves a dangling pointer in desc->dev.

Could this dangling pointer lead to a use-after-free when
i3c_master_unregister_i3c_devs() later accesses and frees it again?

[ ... ]
> @@ -2272,6 +2346,19 @@ static int i3c_master_bus_init(struct i3c_master_c=
ontroller *master)
>  			i3c_master_early_i3c_dev_add(master, i3cboardinfo);
>  	}
> =20
> +	/*
> +	 * SETAASA is a broadcast CCC. Issue it after SETDASA so that devices
> +	 * configured for SETDASA (or supporting both methods) are assigned
> +	 * first, matching MIPI DISCO guidance to prefer SETDASA when both are
> +	 * available. Targets that already have a dynamic address ignore the
> +	 * later SETAASA broadcast.
> +	 */
> +	if (master->addr_method & I3C_ADDR_METHOD_SETAASA) {
> +		ret =3D i3c_master_setaasa_locked(master);
> +		if (ret)
> +			goto err_rstdaa;
> +	}

[Severity: High]
What happens here if the underlying master controller driver rejects the
SETAASA and SETHID CCC commands?

Most mainline I3C master drivers, like Cadence and DesignWare, implement a
strict allowlist in their supports_ccc_cmd callback. If they reject these
new commands, i3c_master_send_ccc_cmd_locked() returns -EOPNOTSUPP.

Will this cause the entire I3C bus initialization to abort and detach all
devices, effectively breaking all I3C communications for that controller?

[Severity: High]
How are SETAASA devices handled during system resume?

During resume, i3c_master_do_daa_ext() issues an RSTDAA broadcast to reset
dynamic addresses and then calls ENTDAA. Since SETAASA devices do not
participate in ENTDAA, and SETAASA is not re-broadcasted there, will these
devices lose their dynamic address on the physical bus?

If the kernel still retains the i3c_dev_desc with the dynamic address
uncleared, won't all subsequent I/O to these targets fail?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728065955.8094=
45-1-akhilrajeev@nvidia.com?part=3D4
