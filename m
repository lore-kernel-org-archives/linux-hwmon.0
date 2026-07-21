Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65103769F5;
	Tue, 21 Jul 2026 04:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784607978; cv=none; b=bt0qNBnki/rZamnPkIKSrQzMfI+gx6Fzhv7stckOTQvildDWsR7MBBlQdxBpM56UsPS8/Zzm5nvR+U8Z/xja139Az2rySJi1CgpU8iCYo/8aKnKday54ws0aJ3yac8v8xj09VK8KSzjzgqJT+U9084qDvDBJ4VhSsiKIEZoBx0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784607978; c=relaxed/simple;
	bh=cxA3kEUiS/5jSh9nAx4c8qr11h91GRP7agfaAanWK94=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qIT39r8ETs1WuHq36gaNECAPOP+/GPMWYcNgP9CyPlLvGeMvQodd7prNTZipUDOuyNc3M9YNNbSGhAbyVt6m4KQx4CLKRmafNMB3wQDvhKZpAHlV+LVuBtjsVDiYlbfRzrWfzVHOnm0p1mTo6I8lkVt/KIReO0+yaVe6IZdOS0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=esiL2wKl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="esiL2wKl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E38721F000E9;
	Tue, 21 Jul 2026 04:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784607976;
	bh=KQjNZHU8lU+rvCrozyYa4foPCVFUSMsLDpVgo8HjRvs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=esiL2wKlrqtlV7MurL0ZjRNXrH4aMD5RMcV/RvpSCes6Z8Ez/vwsV+TDzrgaxcG63
	 Ols/HHQ7YYfPpDSL7HZd6qehwKyzRpzLyhvIuu0TwefG9paBKst5/sgl1n6Kn2QHxO
	 QGFwLzt+ykgqIALnXuBQ35XZB66nUlKluOnPuVuJPDSKOXAM+iHijkRN4K+OWW19QR
	 +U8qsl2TadFPiAQYKVP5pECyfeoR7mkifRra7HFtWeDrhE5bGZjHlUTjQuYSEQ8V4i
	 varqFY5C6hLC4YAnkAPImIftv+SAgFzN1G0plAFmCHJax5HIRGWXVbwMyZHL/Keqtx
	 It2QIhmx3I6SA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 08/12] i3c: dw-i3c-master: Add ACPI core clock
 frequency quirk
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, conor+dt@kernel.org
In-Reply-To: <20260721040805.1696503-9-akhilrajeev@nvidia.com>
References: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
 <20260721040805.1696503-9-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 04:26:15 +0000
Message-Id: <20260721042615.E38721F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Low] Structurally unreachable error condition in `dw_i3c_master_get_core=
_rate()`.

Pre-existing issues:
- [High] Missing pm_runtime_get_sync() in device removal path causes uncloc=
ked MMIO access bus faults and devres clock refcount underflows.
- [High] Incorrect casting of device_get_match_data() result for ACPI PRP00=
01 devices causes random kernel pointers to be used as quirk bitmasks.
--

--- Patch [8]: [PATCH v6 08/12] i3c: dw-i3c-master: Add ACPI core clock fre=
quency quirk ---
commit f3333de342eb1c266eb94909516ea27afe8378d5
Author: Akhil R <akhilrajeev@nvidia.com>

i3c: dw-i3c-master: Add ACPI core clock frequency quirk
   =20
Some ACPI-enumerated devices like Tegra410 do not expose the controller
core clock through the clk framework. Unlike device tree, ACPI on Arm does
not model clock providers. The hardware is expected to have its clocks
enabled by firmware before the OS takes over.

> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i=
3c-master.c
> index 29030fd9594aa..3ec3ab1c13b4c 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c

[ ... ]

> @@ -556,13 +557,33 @@ static void dw_i3c_master_set_intr_regs(struct dw_i=
3c_master *master)
>  	writel(IBI_REQ_REJECT_ALL, master->regs + IBI_MR_REQ_REJECT);
>  }
> =20
> +static unsigned long dw_i3c_master_get_core_rate(struct dw_i3c_master *m=
aster)
> +{
> +	unsigned int core_rate_prop;
> +
> +	if (master->core_clk)
> +		return clk_get_rate(master->core_clk);
> +
> +	if (!(master->quirks & DW_I3C_ACPI_SKIP_CLK_RST)) {
> +		dev_err(master->dev, "missing core clock\n");
> +		return 0;
> +	}

[Severity: Low]
Is this check reachable?

During initialization in dw_i3c_common_probe(), if the core clock is missing
and DW_I3C_ACPI_SKIP_CLK_RST is not set, probe immediately aborts with -EIN=
VAL.

By the time dw_i3c_master_get_core_rate() is executed, it seems guaranteed
that if core_clk is missing, the DW_I3C_ACPI_SKIP_CLK_RST quirk is already
set, making this fallback check dead code.

> +
> +	if (device_property_read_u32(master->dev, "clock-frequency", &core_rate=
_prop)) {
> +		dev_err(master->dev, "missing clock-frequency property\n");
> +		return 0;
> +	}
> +
> +	return core_rate_prop;
> +}

[ ... ]

> @@ -1573,14 +1594,28 @@ int dw_i3c_common_probe(struct dw_i3c_master *mas=
ter,
> =20
>  	master->dev =3D &pdev->dev;
> =20
> +	if (has_acpi_companion(&pdev->dev)) {
> +		quirks =3D (unsigned long)device_get_match_data(&pdev->dev);
> +	} else if (pdev->dev.of_node) {

[Severity: High]
This isn't a bug introduced by this patch, but since this block was
relocated, I noticed a potential issue for devices using ACPI PRP0001.

If the device is instantiated via ACPI using the PRP0001 HID,
device_get_match_data() correctly falls back to the OF match table and
returns a pointer to struct dw_i3c_drvdata.

Does casting this pointer to an unsigned long and assigning it to
master->quirks cause random kernel pointers to be used as a quirk bitmask?
Depending on the kernel layout, this might cause erratic driver behavior su=
ch
as missing PM operations.

> +		drvdata =3D device_get_match_data(&pdev->dev);
> +		if (drvdata)
> +			quirks =3D drvdata->flags;
> +	}
> +	master->quirks =3D quirks;
> +
>  	master->regs =3D devm_platform_ioremap_resource(pdev, 0);

[ ... ]

> @@ -1636,15 +1671,6 @@ int dw_i3c_common_probe(struct dw_i3c_master *mast=
er,
>  		master->has_ibi_data =3D true;
>  	writel(thld_ctrl, master->regs + QUEUE_THLD_CTRL);
> =20
> -	if (has_acpi_companion(&pdev->dev)) {
> -		quirks =3D (unsigned long)device_get_match_data(&pdev->dev);
> -	} else if (pdev->dev.of_node) {
> -		drvdata =3D device_get_match_data(&pdev->dev);
> -		if (drvdata)
> -			quirks =3D drvdata->flags;
> -	}
> -	master->quirks =3D quirks;
> -
>  	/* Keep controller enabled by preventing runtime suspend */
>  	if (master->quirks & DW_I3C_DISABLE_RUNTIME_PM_QUIRK)
>  		pm_runtime_get_noresume(&pdev->dev);

[Severity: High]
This is a pre-existing issue, but I noticed a potential problem in the devi=
ce
removal path regarding runtime PM state.

When the driver is unbound, dw_i3c_common_remove() calls
i3c_master_unregister(), which internally calls dw_i3c_master_bus_cleanup():

dw_i3c_common_remove()
    i3c_master_unregister()
        dw_i3c_master_bus_cleanup()

The dw_i3c_master_bus_cleanup() function accesses the DEVICE_CTRL MMIO
register. Because the driver does not wake the device via
pm_runtime_get_sync() before unregistration, the device may be in a
runtime-suspended state with its core clocks disabled.

Could this cause a fatal bus fault on platforms like ARM due to unclocked M=
MIO
accesses?

Additionally, if the device remains suspended, will the subsequent devres
cleanup attempt to disable the already-disabled clocks, causing a clock ena=
ble
counter underflow warning?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721040805.1696=
503-1-akhilrajeev@nvidia.com?part=3D8
