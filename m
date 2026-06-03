Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCC32FDC20
	for <linux-hwmon@vger.kernel.org>; Wed,  3 Jun 2026 13:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780493560; cv=none; b=OP93nSfYSXIwR6NjMH/hyrfViE+li9HUNWJlxX1/KITvumwJqSpGx5Q2n3vQuCmU2gAKypGN+GclhcedRbAerushCO+wrOYnCs5nrfOG9S815iBq/L18dFJg4ThvG/RLT5y4RAOcv0z1Ew4ltmeSejRog7LGUxzBPDM6FbqaGvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780493560; c=relaxed/simple;
	bh=fK22uHVuameMGkFepUVhAIXHg/sYgqdSYfM8bGvZwzY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=olgX41y1mdzSqFIskxNsKfYMfBn16l7tZ8CLLgYzvf69gSiTLk9s3TyYU94niN9uzfmTH2yb0z/L5ndEQ8/+dcLTG0P+0QloFHdNRFGxIz92NlnwStNJrS/H+Xk968L3fvj0PVM2MZsCNU6oVp3TNj9WA705AN2kXT8N1HuwP5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lk+bA1wR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lk+bA1wR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B261F00898;
	Wed,  3 Jun 2026 13:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780493559;
	bh=M7/MGQURRgtlQN5Kftp3DEq60UW0ogtWL2OsR3l3r+g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lk+bA1wRztc61pnmOm2tj5ip4uLcgouxBdZ83w3Wsfzx8QWpJc/p1NhuvTd8S7Bxh
	 z/7HwppIkVc1uKs19CWUaw0GzlkgqmtpzREup/RgMhFuH5B2Z7dZdxrwf53Nx0RV+l
	 i8m1uj3T5NqLaaRvzzd79iuWF/XP6IQ5PNpWvQhRtv6VHbbBs6mPKNwtgSHzWU3ooZ
	 Y4I/CVBgXeLVB6OJeush3hqsiXhEd8t2R5XkgPwkrWGUKXEx/YHs2dJJ5WFIz/cvUC
	 Bw8ciz2gUXoG0IGIeua5sEojjYaDzngapQ7KDMkU+oqVhcl+RaQj9ky2zHfACJVcGu
	 eHsek33xggg+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: add a driver for the temp/voltage sensor on
 PolarFire SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Conor Dooley" <conor@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260603-ongoing-brunette-51e35be6d93e@spud>
References: <20260603-ongoing-brunette-51e35be6d93e@spud>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 13:32:38 +0000
Message-Id: <20260603133238.E6B261F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Ignored `regmap_read()` return values lead to the use of uninitial=
ized stack variables, potentially leaking kernel memory.
- [Medium] Arithmetic overflow in `mpfs_tvs_interval_write` bypasses interv=
al bounds checking.
- [Medium] The driver ignores the return values of hardware write operation=
s, masking errors from the hwmon core and userspace.
- [Medium] Destructive `regmap_write()` to the control register overwrites =
existing configuration, such as the update interval.
--

commit 3e2d5f8cc5d07efdc63c9af851354b4ce076c3a4
Author: Lars Randers <lranders@mail.dk>
Subject: hwmon: add a driver for the temp/voltage sensor on PolarFire SoC

Add a driver for the temperature and voltage sensors on PolarFire SoC.
The temperature reports how hot the die is, and the voltages are the
SoC's 1.05, 1.8 and 2.5 volt rails respectively.

> diff --git a/drivers/hwmon/tvs-mpfs.c b/drivers/hwmon/tvs-mpfs.c
> new file mode 100644
> index 0000000000000..f086f178b4bab
> --- /dev/null
> +++ b/drivers/hwmon/tvs-mpfs.c

[ ... ]

> +static int mpfs_tvs_voltage_read(struct mpfs_tvs *data, u32 attr,
> +				 int channel, long *val)
> +{
> +	u32 tmp, control;
> +
> +	if (attr !=3D hwmon_in_input && attr !=3D hwmon_in_enable)
> +		return -EOPNOTSUPP;
> +
> +	regmap_read(data->regmap, MPFS_TVS_CTRL, &control);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
Does this code leak uninitialized stack memory if the hardware read fails?

Because the return value of regmap_read() is ignored, control (and tmp
below) could remain uninitialized on a read failure. This uninitialized
data is then used in bitwise operations and potentially returned to
userspace via *val.

The same pattern appears in mpfs_tvs_temp_read() and mpfs_tvs_interval_read=
().

> +
> +	switch (channel) {
> +	case SENSOR_V2P5:

[ ... ]

> +static int mpfs_tvs_voltage_write(struct mpfs_tvs *data, u32 attr,
> +				  int channel, long val)
> +{
> +	u32 tmp;
> +
> +	if (attr !=3D hwmon_in_enable)
> +		return -EOPNOTSUPP;
> +
> +	switch (channel) {
> +	case SENSOR_V2P5:
> +		if (val > 1 || val < 0)
> +			return -EINVAL;
> +
> +		tmp =3D FIELD_PREP(MPFS_TVS_CTRL_V2P5_ENABLE, val);
> +		regmap_update_bits(data->regmap, MPFS_TVS_CTRL,
> +				   MPFS_TVS_CTRL_V2P5_ENABLE, tmp);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: Medium]
Should this check the return value of regmap_update_bits()?

By unconditionally returning 0 at the end of the function, hardware write=20
failures are masked from the hwmon core and userspace.

The same pattern appears in mpfs_tvs_temp_write() and=20
mpfs_tvs_interval_write().

> +		break;

[ ... ]

> +static int mpfs_tvs_interval_write(struct mpfs_tvs *data, u32 attr, long=
 val)
> +{
> +	unsigned long temp =3D val;
> +
> +	if (attr !=3D hwmon_chip_update_interval)
> +		return -EOPNOTSUPP;
> +
> +	temp *=3D 1000;
        ^^^^^^^^^^^^^

[Severity: Medium]
Could this multiplication overflow before bounds validation occurs?

If a large value is passed (e.g., val =3D 4294968 on a 32-bit architecture),
temp * 1000 could wrap around to a small value like 480. Divided by=20
MPFS_TVS_INTERVAL_SCALE (32), this gives 15, which would successfully pass=
=20
the temp > 254 upper-bound check below and silently write an invalid=20
interval to the hardware.

> +	temp /=3D MPFS_TVS_INTERVAL_SCALE;
> +
> +	/*
> +	 * The value is 8 bits wide, but 255 is described as
> +	 * "255=3D Do single set of transfers when scoverride set"
> +	 * but there's no scoverride bit in the tvs register region.
> +	 * Ban using 255 since its behaviour is suspect.
> +	 */
> +	if (temp > 254)
> +		return -EINVAL;
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
> +	struct device *hwmon_dev;
> +	struct mpfs_tvs *data;
> +
> +	data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->regmap =3D device_node_to_regmap(pdev->dev.parent->of_node);
> +	if (IS_ERR(data->regmap))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(data->regmap),
> +				     "Failed to find syscon regmap\n");
> +
> +	regmap_write(data->regmap, MPFS_TVS_CTRL, MPFS_TVS_CTRL_ENABLE_ALL);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: Medium]
Does this destructively overwrite existing configuration in the control reg=
ister?

Because this uses regmap_write() rather than a read-modify-write operation
like regmap_update_bits(), it replaces the entire register contents. This=20
clears the INTERVAL bits (15:8) to 0 and zeroes out other status bits, whic=
h=20
might erase configuration previously set by the bootloader.

> +
> +	hwmon_dev =3D devm_hwmon_device_register_with_info(&pdev->dev, "mpfs_tv=
s",
> +							 data,
> +							 &mpfs_tvs_chip_info,
> +							 NULL);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-ongoing-br=
unette-51e35be6d93e@spud?part=3D1
