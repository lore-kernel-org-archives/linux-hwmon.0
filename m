Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A3813D51E
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 05:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783749127; cv=none; b=Lb+c7jGiqC+pYbL3TTKIuDa1YnAVfEN+wHirnhKpvLF7HdKQ8NW1CvfCRc9W5hAk4dl7bu1g33N6rl1QrUHkyLYabppjfZV/Oxntsva/dWyoKC/VQuXNKrIQIEg9/2wrsOmxwgde/KVc8JUJtXb6NiK+AeU1ysyAMbXVwYvrYYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783749127; c=relaxed/simple;
	bh=9nYvTQqbR1jlZkDimmgv8Qqd/En2wouWa8VuMGRj8u8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kqHnRSv4yYk7F3cWG1BlPndNptaVYpVO1zoNX7t6p9OXVMvOk+DyCYUBHCJKnEuXzaTYmWSJS076jZhmNXVEar4YxfoblnmCFijGUbrpe6gRGvIGVLZ4gM0kLfykcDfVcttFREULO2mnwmJAc3f1QhQNACrYE8z4mPrAWcdP/+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eHiRKeHo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eHiRKeHo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 339A01F000E9;
	Sat, 11 Jul 2026 05:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783749126;
	bh=cvOWdyjHBaMNx3Vum1SSVlIWk5U9Y+/bkPM6g8sng9k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eHiRKeHoApNSN0Vih2OBeQDQrxmJLEOvNRYOEwsjLSHLyxwugO8OyME7OEcALiKCH
	 AF4MEGRkTu8H+ge+rIwvXtnYs58QAXjKqK4K4lJ2NyVB+3Hmk5/hchzgTAvJEUyEXp
	 NCDlmgfMEeT6KnNrat3nZdAGAi4SZSoQUPe60FJmfwF5y2urY2/Yp7MnHLecdyFM6+
	 1uCKV3tgfxjTiAsSIqRk/c+wf+qsJeU74NyJM1b5IFGmVjZPj1gjaoSwVOb8RBp/yI
	 Tumi53KH/1gQvFfZ9ytbvnYF4RgJ+2xob4kXxj625rN1+u3v4Y3rVSRWMKDr2DHrPJ
	 ofS1ofM/xz4GA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/1] hwmon: (applesmc) Convert to
 hwmon_device_register_with_info
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shih-Yuan Lee" <fourdollars@debian.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260711053915.4834-2-fourdollars@debian.org>
References: <20260710123236.10508-1-fourdollars@debian.org>
 <20260711053915.4834-1-fourdollars@debian.org>
 <20260711053915.4834-2-fourdollars@debian.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 05:52:05 +0000
Message-Id: <20260711055206.339A01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Mixing devres-managed memory allocations with a non-devres hwmon d=
evice registration creates a lifetime mismatch leading to a Use-After-Free =
when the driver is unbound via sysfs.
--

--- Patch [1]: [PATCH v3 1/1] hwmon: (applesmc) Convert to hwmon_device_reg=
ister_with_info ---
commit cc16bf8a12a2f101dd9a6c6d676340d91b9c4973
Author: Shih-Yuan Lee <fourdollars@debian.org>

hwmon: (applesmc) Convert to hwmon_device_register_with_info

The legacy hwmon_device_register() function is deprecated and triggers a
warning in dmesg during driver initialization. Convert the driver to use
the modern hwmon_device_register_with_info() API, moving standard
attributes to the HWMON core and dynamically allocating extra groups.

> diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
> --- a/drivers/hwmon/applesmc.c
> +++ b/drivers/hwmon/applesmc.c
> @@ -1343,17 +1434,97 @@ static int __init applesmc_init(void)

[ ... ]

> +	/* Create non-standard fanX_safe attributes group */
> +	fan_safe_attrs =3D devm_kcalloc(&pdev->dev, smcreg.fan_count,
> +				      sizeof(*fan_safe_attrs), GFP_KERNEL);
> +	fan_safe_attr_list =3D devm_kcalloc(&pdev->dev, smcreg.fan_count + 1,
> +					  sizeof(*fan_safe_attr_list), GFP_KERNEL);

[ ... ]

> -	hwmon_dev =3D hwmon_device_register(&pdev->dev);
> +	hwmon_dev =3D hwmon_device_register_with_info(&pdev->dev, "applesmc", N=
ULL,
> +						    chip, applesmc_extra_groups);

[Severity: High]
Does mixing devres-managed memory allocations with a non-devres hwmon device
registration create a lifetime mismatch?

If a privileged user unbinds the applesmc driver via sysfs, the device core
detaches the driver and releases all devres-managed allocations tied to
pdev->dev, including the fan_safe_attrs array.

However, the hwmon device remains registered because it was created with the
non-managed hwmon_device_register_with_info() in applesmc_init() and is only
unregistered during module removal.

Since the active hwmon sysfs files still reference the freed fan_safe_attrs,
could a subsequent read of a file like fan1_safe dereference a function
pointer in freed memory and lead to a use-after-free? Should this be using
devm_hwmon_device_register_with_info() instead to tie the hwmon device
lifetime to the device?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711053915.4834=
-2-fourdollars@debian.org?part=3D1
