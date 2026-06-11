Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD8328C874
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 15:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781190797; cv=none; b=eGH1Bfc25Sre3aU0bzOCTTS68n/+U8CBr+7s2V+3F1/3luxW5JXYSssmVNATErBxluKvPCyJZYsq0AvX6rV4CBp/QbbguEmjm0+7BSFKTQA5T9lui8dmVc/XOJx4pGehbsN8DXt9xqjwKX4Elcm9Z9kDXYLaZQNBqLLM0TghVM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781190797; c=relaxed/simple;
	bh=4wLPheb9dT/oQk5fTBaRGS/Rj8GyndtRoi4lmGcZSXk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cTfuGNeQJ0Bum8oH1oUOkR2O+8d4EuYsU05Oep8dE60tL++sVAPmNwJyEHnfP6+TR30vOEczvA94E3gRY1ntkAjFPphmwb+cZ7x8+2b+W8f2P3luznvh3z3TCS6yFqaivdECQYLjRNrpDwJ84AjadMjWJCujaJbwzaKxFJEm/QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DXcO3VbD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DXcO3VbD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 685561F00893;
	Thu, 11 Jun 2026 15:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781190796;
	bh=B0qpoWqez4ck4FsIMS41rkBnrCR1U6L6SwrF2cyP92o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DXcO3VbDQF9j/zrFK003Oq3zrQOG8KYhZNO3LZiMhHuo4qew+w6rVxTXx4hR4rdiw
	 JiCzczBy9kuEtp3erjMCeA9eYW9u0ygIWYm4GtMhul6nqzsuQd0S5gtuC1FNFhYJib
	 oGLk5nYD9g4lrOYsVi099ttYMHuArNZt3gVAtamGL2RZFUWfFGC/4BHDjLvx8/gvri
	 G3VDXMzHLKDngrtQn7Ydoy921/wcfwOSCTI4xmI3wyTcaWgkyn5TCTci21ak3nNAVY
	 jf6CU3fsgstVkSBVHKk+uyZA6DXX9WnrXQqNSQlOQvsIAiB4wK37nO3WuiRleVNBZk
	 RO6CYdgX41c5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] hwmon: add a driver for the temp/voltage sensor on
 PolarFire SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Conor Dooley" <conor@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260611-blank-footprint-5504b819baec@spud>
References: <20260611-blank-footprint-5504b819baec@spud>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 15:13:16 +0000
Message-Id: <20260611151316.685561F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Negative values written to `update_interval` are incorrectly cla=
mped to the maximum interval instead of returning an error or clamping to 0.
- [Medium] Reading `update_interval` inconsistently under-reports the confi=
gured value due to integer division truncation.
- [Medium] Hardware sensors are enabled in `probe` but are not disabled on =
probe failure or driver unbind.
--

commit 91a403f5c5eef9fbcfcab3857179dc2f03ad3c89
Author: Lars Randers <lranders@mail.dk>

hwmon: add a driver for the temp/voltage sensor on PolarFire SoC

Add a driver for the temperature and voltage sensors on PolarFire SoC.
The temperature reports how hot the die is, and the voltages are the
SoC's 1.05, 1.8 and 2.5 volt rails respectively.

> diff --git a/drivers/hwmon/tvs-mpfs.c b/drivers/hwmon/tvs-mpfs.c
> new file mode 100644
> index 0000000000000..48de8d98b3444
> --- /dev/null
> +++ b/drivers/hwmon/tvs-mpfs.c

[ ... ]

> +static int mpfs_tvs_interval_read(struct mpfs_tvs *data, u32 attr, long =
*val)
> +{
> +	u32 tmp;
> +
> +	if (attr !=3D hwmon_chip_update_interval)
> +		return -EOPNOTSUPP;
> +
> +	regmap_read(data->regmap, MPFS_TVS_CTRL, &tmp);
> +	*val =3D FIELD_GET(MPFS_TVS_INTERVAL_MASK, tmp);
> +	*val *=3D MPFS_TVS_INTERVAL_SCALE;
> +	*val /=3D 1000;

[Severity: Medium]
Will this return an incorrectly truncated value for certain intervals?

Since integer division is used both here and in mpfs_tvs_interval_write(),=
=20
the truncation can cause the readback value to be lower than what was writt=
en.
For example, writing 7 ms calculates `(7 * 1000) / 32 =3D 218`. Reading it =
back
computes `(218 * 32) / 1000 =3D 6` ms.=20

Should DIV_ROUND_CLOSEST be used for these conversions to ensure the value
survives the round trip?

> +
> +	return 0;
> +}
> +
> +static int mpfs_tvs_interval_write(struct mpfs_tvs *data, u32 attr, long=
 val)
> +{
> +	unsigned long temp =3D val;
> +
> +	if (attr !=3D hwmon_chip_update_interval)
> +		return -EOPNOTSUPP;
> +
> +	temp =3D clamp(temp, 0U, MPFS_TVS_INTERVAL_MAX_MS);

[Severity: Medium]
Does this correctly handle negative input values?

The parameter `val` is signed, but it is assigned to `unsigned long temp`. =
If
a negative value is passed (e.g., -1), it undergoes an unsigned conversion =
and
becomes a large positive number like ULONG_MAX.=20

When clamp() evaluates this against 8 ms, it incorrectly clamps to 8 instea=
d of
returning -EINVAL or properly clamping to 0.

> +
> +	temp *=3D 1000;
> +	temp /=3D MPFS_TVS_INTERVAL_SCALE;

[Severity: Medium]
Similar to mpfs_tvs_interval_read(), does this integer truncation prevent
accurately restoring the configured value? Should DIV_ROUND_CLOSEST be
used here as well?

> +
> +	temp <<=3D MPFS_TVS_INTERVAL_OFFSET;
> +	regmap_update_bits(data->regmap, MPFS_TVS_CTRL,
> +			   MPFS_TVS_INTERVAL_MASK, temp);
> +
> +	return 0;
> +}

[ ... ]

> +static int mpfs_tvs_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	/*
> +	 * It's an MMIO regmap with no resources, there's nothing that can fail
> +	 * and return an error
> +	 */
> +	regmap_write(data->regmap, MPFS_TVS_CTRL, MPFS_TVS_CTRL_ENABLE_ALL);
> +
> +	hwmon_dev =3D devm_hwmon_device_register_with_info(&pdev->dev, "mpfs_tv=
s",
> +							 data,
> +							 &mpfs_tvs_chip_info,
> +							 NULL);
> +	if (IS_ERR(hwmon_dev))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(hwmon_dev),
> +				     "hwmon device registration failed.\n");

[Severity: Medium]
Does the hardware remain enabled if hwmon device registration fails, or if =
the
driver is unbound?

The hardware sensors are enabled here by writing MPFS_TVS_CTRL_ENABLE_ALL, =
but
there doesn't seem to be an error path or devm action to disable them if
devm_hwmon_device_register_with_info() fails.=20

Could this lead to unnecessary power consumption when the driver fails to p=
robe
or is not actively loaded?

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611-blank-foot=
print-5504b819baec@spud?part=3D1
