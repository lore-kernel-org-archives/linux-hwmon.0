Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985F9EAC7
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 03:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777520894; cv=none; b=ZxIlJ9ZsYb6BW+4WW4diZIou/haeD3dNzGszZ5GDevvZTrAUtfDgbNcgcnIn5tC26TTQ1juyvm4tPBb3IdyMykrN5GYPxeM7n84g3NNvGucVAB4i5os3AFxFC7Mm9ctyCJR2bAcM9AmDlyKeC/3OyELYB+jKCk5PT3nWGg1at48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777520894; c=relaxed/simple;
	bh=/IobffCSgXApPYD3MHtmQG+CBScWnR+GwlvyBGb6mlY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QGYOn05qPBHPZLRo73VxPseGcwBrgtYUD2Urq1C/wkFhcUbO0XlccD2AO3TE8L9EzFzvzfNMVp55xjayxip7WOr15CQiTd+wf8p40OKKMisSl0Mr2sI70r8kL6T5FlXJ2l5dJrilTvm8cYvAzMO11LquORHLN40C/EEvqT+v8eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=He88iVhP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="He88iVhP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24145C2BCB8;
	Thu, 30 Apr 2026 03:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777520894;
	bh=/IobffCSgXApPYD3MHtmQG+CBScWnR+GwlvyBGb6mlY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=He88iVhPLnajGirWSpdakaY6hywdBDGBSqSxuWWyUTWLZcf232g/FySyijZ1ys+4L
	 uOsY5AFK/EgXWV3nz8WtnkQxScJLaaS13OPMwGk7AxOzZJxBUbnuDr10JcBAhxhJh8
	 L49CVwnNUFvVFJFJR1bMUWeu6ikjQJp/+t8xsnz1sZRR0Ie2dTo3HlMoXEzF4ScpBE
	 D6ezAUaWZ9sYUYlVkQ8nHjZ3IZ01upoaXx/WrdRmTjQ/BNLlf8vpeUNsemE+y1BD6x
	 ZPkrcya/ySscszgf+xdRLX4AgiXvpfImqtgJfbJLOX6c2HD8mUY3ckasaNIGJKRkPc
	 9gLLD5zIUbxQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] hwmon: (pmbus) add support for Delta E50SN12051
Reply-To: sashiko@lists.linux.dev
To: "Colin Huang via B4 Relay" <devnull+u8813345.gmail.com@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260430-add-e50sn12051-v2-3-d76fe42482ab@gmail.com>
References: <20260430-add-e50sn12051-v2-3-d76fe42482ab@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Apr 2026 03:48:13 +0000
Message-Id: <20260430034814.24145C2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Unnecessary memory allocation using devm_kmemdup for a static struc=
ture.
--

commit e0fb0b22fc908f166717510eea0ebcb85704a919
Author: Colin Huang <u8813345@gmail.com>

hwmon: (pmbus) add support for Delta E50SN12051

This commit introduces a new PMBus driver for the Delta E50SN12051 600W
Non-isolated 1/8th Brick DCDC Power Modules.

> diff --git a/drivers/hwmon/pmbus/e50sn12051.c b/drivers/hwmon/pmbus/e50sn=
12051.c
> new file mode 100644
> index 000000000000..3d61db949afb
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/e50sn12051.c
[ ... ]
> +static int e50sn12051_probe(struct i2c_client *client)
> +{
> +	struct pmbus_driver_info *info;
> +
> +	info =3D devm_kmemdup(&client->dev, &e50sn12051_info, sizeof(*info),
> +			    GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	return pmbus_do_probe(client, info);
> +}

Is it necessary to duplicate the e50sn12051_info structure using
devm_kmemdup() here?

The e50sn12051_info structure is statically defined and fully populated at
compile time. Looking at the PMBus core, it only modifies the
pmbus_driver_info structure if the PMBUS_USE_COEFFICIENTS_CMD flag is set,
which is not the case for this driver.

Could this be simplified to pass &e50sn12051_info directly to
pmbus_do_probe() to avoid the extra memory allocation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260430-add-e50sn1=
2051-v2-0-d76fe42482ab@gmail.com?part=3D3
