Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91AB368D40
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 10:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783764627; cv=none; b=lKTf6RH1Qq0xka/WwZvc5TJ+USMMYPzuc6hdwEA3VL4iM0O5JCxSs8nm8f08hSggpuMxu64Tblo+Qp++PnzPR9d+7Ro1nSCauIW95XbAgpCSScG8JTrFd5QK9h3ltTZh7IDX0MTQ8/Gu4xoqBsvCMgKvc3vGH1cSTrHifLAPWBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783764627; c=relaxed/simple;
	bh=lmXfmJjPiv5sqRKnOlxXccZUVBZ/CqpyQECrpj0vZiI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bGGI855zkFbl72QutPFF2gz1HtzyPAhW9DcnFjv1iJQz3bzGgzrQOFcK6Iq7V0M97b9FAn4r1J0plK5dAjlXGfMAYzQ/HxkZk9HokyxG5nilwX35iecOfe2ZR9nU/VZ7x61uZqPi0jpfAFNyPigQWADCcrXqZ8PVCAt/mPcYJig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A4VV3k9L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A4VV3k9L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 514FA1F000E9;
	Sat, 11 Jul 2026 10:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783764614;
	bh=6TbwCaof1eAFl/P2Jv4Q9krBpl9G8PlTgCwXZvmLBrs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A4VV3k9LspolGBKwnk/5FfWPNET7DKT1xAK4n8Y1LMEOaDlA/VBO4mCaiYsRTqNWH
	 4bMBw72rLR0gKDV/5ed5ur0OL9QzHBIO50MQAW2UgUWm6BckE9lg9uKKbZJWaJ22Re
	 VSOX4Yr/lzv0nRwdmK8ChPqNV97rTw+91d86FU5fsnjzPVqyPdIcKYXiLcOL/Lpkfj
	 GaQvSTS6REjWja+bpZAEUNLHWyoPSyq5K1Tqobxh2xzwCqV5YQEEwmXD3030g4cmox
	 an2hhSJDgpAscbpIV6gC/mZhygR8nL4J+OZJa35CqZOQOIAK4O8krngenQfJwcK86h
	 GLIIzU86l4u1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] hwmon: (cros_ec) Register the thermal devices after
 the hwmon ones
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFdlacOfc2NodWg=?= <linux@weissschuh.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260711-cros_ec-hwmon-locking-v1-1-cb6d0fdbb2d3@weissschuh.net>
References: <20260711-cros_ec-hwmon-locking-v1-0-cb6d0fdbb2d3@weissschuh.net>
 <20260711-cros_ec-hwmon-locking-v1-1-cb6d0fdbb2d3@weissschuh.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 10:10:13 +0000
Message-Id: <20260711101014.514FA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch claims to prepare for hwmon device locking in thermal =
callbacks but fails to save the hwmon device pointer and omits the locks.
--

--- Patch [1]: [PATCH 1/3] hwmon: (cros_ec) Register the thermal devices af=
ter the hwmon ones ---
commit 99d5e8ee386ab9de9bbd8a3d4c1b2a9515fec3a7
Author: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

hwmon: (cros_ec) Register the thermal devices after the hwmon ones

This patch reorders initialization to set up hwmon devices before fan cooli=
ng
devices. It intends to prepare the driver for using standard hwmon device
locks to protect read-modify-write accesses.

> To guarantee consistency for the read-modify-write access in
> cros_ec_hwmon_cooling_set_cur_state(), locking is necessary.
> The locking will use standard hwmon device locks, which requires
> the hwmon device to be ready before the fan devices are set up.

[Severity: Medium]
Are the actual hwmon_lock() and hwmon_unlock() calls missing from this patc=
h?
The commit message indicates locking is being prepared, but
cros_ec_hwmon_cooling_set_cur_state() still seems to perform read-modify-wr=
ite
operations without acquiring the locks.

> Reorder the initialization so this works.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

> diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> index 44291799dd8e4..f9b19da50472d 100644
> --- a/drivers/hwmon/cros_ec_hwmon.c
> +++ b/drivers/hwmon/cros_ec_hwmon.c
> @@ -579,13 +579,17 @@ static int cros_ec_hwmon_probe(struct platform_devi=
ce *pdev)
>  	priv->fan_control_supported =3D cros_ec_hwmon_probe_fan_control_support=
ed(priv->cros_ec);
>  	priv->temp_threshold_supported =3D is_cros_ec_cmd_available(priv->cros_=
ec,
>  								  EC_CMD_THERMAL_GET_THRESHOLD, 1);
> -	cros_ec_hwmon_register_fan_cooling_devices(dev, priv);
> =20
>  	hwmon_dev =3D devm_hwmon_device_register_with_info(dev, "cros_ec", priv,
>  							 &cros_ec_hwmon_chip_info, NULL);
> +	if (IS_ERR(hwmon_dev))
> +		return PTR_ERR(hwmon_dev);
> +
> +	cros_ec_hwmon_register_fan_cooling_devices(dev, priv);
> +

[Severity: Medium]
How will the thermal callbacks access the hwmon device to perform the locki=
ng?

It appears the hwmon_dev pointer is only stored in a local variable here,
rather than being saved to the driver's private data. Without saving it to
something like priv->hwmon_dev, cros_ec_hwmon_cooling_set_cur_state() won't
be able to retrieve the device to call hwmon_lock().

>  	platform_set_drvdata(pdev, priv);
> =20
> -	return PTR_ERR_OR_ZERO(hwmon_dev);
> +	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711-cros_ec-hw=
mon-locking-v1-0-cb6d0fdbb2d3@weissschuh.net?part=3D1
