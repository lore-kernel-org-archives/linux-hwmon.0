Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A863B2FC4
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Apr 2026 11:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775735516; cv=none; b=rsy/igVvCsgvPMBXXR9hsHkJEl3PbZwq9wvn9XvNH5J1QR23v/ss8WEsNtihSJypiL0cCQ4KXliP1/MeP/nfhHQQEg8D+ZYiE29+SREkZoe5nTdPzm+bd8yOQWQ8eP/RWzxAJIY22lA6yRuPsL25tyHiYP9swbz8DwxnMs58dOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775735516; c=relaxed/simple;
	bh=3gILUTmE0V8H5kb6VnVd7wgI5C9YQJ+2FHwmRlGdlLM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HI1JUPJgPk5dAyPJ4wrGH/0Atxc9/U92jwAAhYCoZrPi6/YfQ5FeEoBxnYQVSFy8D3SvF5fLfzr3o/AYIk+xEliLaSbJ6gyKvN8Fy/UmxiMcDcdTeG++zi6QD6va/eMegTB9IG0rpJrMLtD7MpklPiulvgRHt49H5WEmwPgCBmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bwHM7QKl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bwHM7QKl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C306C4CEF7;
	Thu,  9 Apr 2026 11:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775735515;
	bh=3gILUTmE0V8H5kb6VnVd7wgI5C9YQJ+2FHwmRlGdlLM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=bwHM7QKl9RTLJDpVdQnDmMvTPdbFY+8x0zELAiK3SLetY/BCe+A9DG1kbphlcyCjV
	 DYmoURIdyIn8GXPczBg8d4XxBJLFy2fa4/0yUetXcq1LLrM0pY2VDxvrA3aYrE52F6
	 auUq2nklq/DGUwIhnx0aaEQz3AQaD0d85s8QlLS0WzpSEwhUanUSFKbZaCilan5gKo
	 bDOYVoLK2DgRfG1yre0Q/nBXt34kr12nmHi0uFEIIQnSr+ripAwXgoUoJffRmhKSUo
	 7EN26iALIci66Jm2sVH+tDiGtSEcJX36p+0b5Q4BuUGhr3ZkR4mNXu6Nhq2pvl3ndc
	 /JScsuMRfWiMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/13] i3c: dw-i3c-master: Add a quirk to skip clock
 and reset
Reply-To: sashiko@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260409105747.48158-10-akhilrajeev@nvidia.com>
References: <20260409105747.48158-10-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Apr 2026 11:51:54 +0000
Message-Id: <20260409115155.7C306C4CEF7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 3 potential issue(s):
- [High] Missing reset control assertion on pclk acquisition failure.
- [High] Type confusion when parsing match data for ACPI devices using PRP0=
001.
- [Medium] Semantic misuse of the `clock-frequency` device property.
--

commit e97fa5a2aa57bfea8bd1aabcc2dc629a2e47c19c
Author: Akhil R <akhilrajeev@nvidia.com>

    i3c: dw-i3c-master: Add a quirk to skip clock and reset

This commit adds a quirk to skip clock and reset acquisition for
ACPI-enumerated devices like Tegra410. It moves match data parsing
earlier in the probe sequence and falls back to reading the
"clock-frequency" property if the quirk is present.

[ ... ]

> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i=
3c-master.c
> index 05ccdf177b6dd..a62eec6d2ac0a 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c

[ ... ]

> @@ -560,13 +561,26 @@ static void dw_i3c_master_set_intr_regs(struct dw_i=
3c_master *master)
>  	writel(IBI_REQ_REJECT_ALL, master->regs + IBI_MR_REQ_REJECT);
>  }
> =20
> +static unsigned long dw_i3c_master_get_core_rate(struct dw_i3c_master *m=
aster)
> +{
> +	unsigned int core_rate_prop;
> +
> +	if (!(master->quirks & DW_I3C_ACPI_SKIP_CLK_RST))
> +		return clk_get_rate(master->core_clk);
> +
> +	if (device_property_read_u32(master->dev, "clock-frequency", &core_rate=
_prop))
> +		return 0;
> +
> +	return core_rate_prop;

Does this usage conflict with standard device tree bindings? The
"clock-frequency" property in the I2C and I3C subsystems typically represen=
ts
the external bus frequency (e.g., 400kHz or 12.5MHz), not the internal IP c=
ore
clock rate.

Reusing this standard property for the internal core clock rate might cause
integer underflows and timing misconfigurations if standard bus frequencies=
 are
provided in the device tree or ACPI tables.

[ ... ]

> @@ -1600,21 +1614,34 @@ int dw_i3c_common_probe(struct dw_i3c_master *mas=
ter,
>  	if (IS_ERR(master->regs))
>  		return PTR_ERR(master->regs);
> =20
> -	master->core_clk =3D devm_clk_get_enabled(&pdev->dev, NULL);
> -	if (IS_ERR(master->core_clk))
> -		return PTR_ERR(master->core_clk);
> +	if (has_acpi_companion(&pdev->dev)) {
> +		quirks =3D (unsigned long)device_get_match_data(&pdev->dev);
> +	} else if (pdev->dev.of_node) {

Will this cause type confusion if an ACPI device uses the PRP0001 mechanism?

If PRP0001 delegates matching to the OF table, device_get_match_data()
returns a pointer to a struct dw_i3c_drvdata rather than an integer bitmask.
Casting this memory pointer directly to an unsigned long would assign
arbitrary bits based on the kernel's memory layout, potentially triggering
random quirks like DW_I3C_ACPI_SKIP_CLK_RST.

> +		drvdata =3D device_get_match_data(&pdev->dev);
> +		if (drvdata)
> +			quirks =3D drvdata->flags;
> +	}
> +	master->quirks =3D quirks;
> +
> +	if (master->quirks & DW_I3C_ACPI_SKIP_CLK_RST) {
> +		master->core_clk =3D NULL;
> +		master->core_rst =3D NULL;
> +	} else {
> +		master->core_clk =3D devm_clk_get_enabled(&pdev->dev, NULL);
> +		if (IS_ERR(master->core_clk))
> +			return PTR_ERR(master->core_clk);
> +
> +		master->core_rst =3D devm_reset_control_get_optional_exclusive(&pdev->=
dev,
> +									     "core_rst");
> +		if (IS_ERR(master->core_rst))
> +			return PTR_ERR(master->core_rst);
> +		reset_control_deassert(master->core_rst);
> +	}
> =20
>  	master->pclk =3D devm_clk_get_optional_enabled(&pdev->dev, "pclk");
>  	if (IS_ERR(master->pclk))
>  		return PTR_ERR(master->pclk);

If devm_clk_get_optional_enabled() fails here (e.g., returning -EPROBE_DEFE=
R),
will this leave the hardware out of reset?

The code returns directly, but master->core_rst was already deasserted.
While devres frees the reset control reference, it won't automatically
re-assert the reset line. Should this path use the err_assert_rst label
to ensure proper cleanup?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260409105747.4815=
8-1-akhilrajeev@nvidia.com?part=3D9
