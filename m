Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743033B4EA1;
	Tue, 28 Jul 2026 07:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223079; cv=none; b=FkSMHigG1LT/QF77NRypmVwaJ1bmtwNsXJDzezc3i79MWVN8zKxUMkj/Ch+geaV9AzdIR55HmDSqogalhNt/TC4XnmOcSzLEHd1GuSNlpBxspN6wVz52wGTkcoxPzwj+eoeqdfa7vcdfdiO28Qpsru8M+aosnBMKH5a3JPyE5s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223079; c=relaxed/simple;
	bh=/WCRP/2K5uixFf6KNa5E0DW6HfHtq9UlFAUjK8p37xA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XJQhvyEBXTJkraZGB2ND5pheNgLT5IqxgvoLS60BoezfJRL1gYGYmiVBM7103LrzaSmJ6HrAXxXitmSsAG5O5i+43atTVJK4qR87gI5T/0RACMDmPdhiqZ9rVtWxUz3f3GNslhYKqesZqWTNuicWBq/wMm9l1Bz8nDBo0iBHqRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SfWvXH9a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SfWvXH9a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B3CD1F000E9;
	Tue, 28 Jul 2026 07:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785223078;
	bh=ZV9s5koBwDvkf6kgOQAypAmADL08e8qeJSgkZB8c9nU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SfWvXH9ak5fOc2XdGMrBtGs+yvHPZyGbx3/yUxAxdu93m/YXUlCXaV6lu8IC/ALEB
	 DaCmhjYRvWmONrZuP5CDeIwQIADle0iLH1/IM22OmYCJ+5P4vBX68I6GVhYvTz78PD
	 knO+YT3il8ARWuyEfGY88alTDuzba+dFeLzWkkZoUZoWdhjNyrg+7tPiaK8V5k7qTQ
	 1OII7Kxlgymvtn1qGZf5+9GVjqdTJ/UnZ4aTyZRAnBZqqtbVTQvkc/s/n6eH+sQWC7
	 xAOgqdoHaJdFlNd+ojXYPbCqZwcuNe+CUSkmw9t2XMTZir2EaUGqTw/Nf0VQGCZ/5U
	 FLUxQG5sK11XA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 08/12] i3c: dw-i3c-master: Add ACPI core clock
 frequency quirk
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-i3c@lists.infradead.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260728065955.809445-9-akhilrajeev@nvidia.com>
References: <20260728065955.809445-1-akhilrajeev@nvidia.com>
 <20260728065955.809445-9-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 07:17:56 +0000
Message-Id: <20260728071757.5B3CD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] Dead Code / Missing Feature Implementation for DW_I3C_ACPI_SKIP_=
CLK_RST

Pre-existing issues:
- [High] Runtime PM and Resource Cleanup Bug during driver unbind
- [High] Type Confusion and Pointer Truncation for PRP0001 ACPI Devices
--

--- Patch [8]: [PATCH v7 08/12] i3c: dw-i3c-master: Add ACPI core clock fre=
quency quirk ---
commit 7469594594011ab29fdf220e06f76b074bff94d1
Author: Akhil R <akhilrajeev@nvidia.com>

i3c: dw-i3c-master: Add ACPI core clock frequency quirk

Some ACPI-enumerated devices like Tegra410 do not expose the controller
core clock through the clk framework. Unlike device tree, ACPI on Arm does
not model clock providers. The hardware is expected to have its clocks
enabled by firmware before the OS takes over.

> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i=
3c-master.c
> index 29030fd9594aa..273d7a0020993 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
[ ... ]
> @@ -1573,14 +1589,28 @@ int dw_i3c_common_probe(struct dw_i3c_master *mas=
ter,
> =20
>  	master->dev =3D &pdev->dev;
> =20
> +	if (has_acpi_companion(&pdev->dev)) {
> +		quirks =3D (unsigned long)device_get_match_data(&pdev->dev);

[Severity: High]
This isn't a bug introduced by this patch, but does this cast cause type
confusion for PRP0001 ACPI devices?

When an ACPI device binds to the driver using the PRP0001 OF-compatibility
mechanism, device_get_match_data() delegates to the OF match table and
returns a pointer to struct dw_i3c_drvdata.

Because has_acpi_companion() returns true, this branch will cast that
pointer directly to an unsigned long, treating the memory address as a
bitmask of quirks. This could corrupt the driver state.

> +	} else if (pdev->dev.of_node) {
> +		drvdata =3D device_get_match_data(&pdev->dev);
> +		if (drvdata)
> +			quirks =3D drvdata->flags;
> +	}
> +	master->quirks =3D quirks;
> +
>  	master->regs =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(master->regs))
>  		return PTR_ERR(master->regs);
> =20
> -	master->core_clk =3D devm_clk_get_enabled(&pdev->dev, NULL);
> +	master->core_clk =3D devm_clk_get_optional_enabled(&pdev->dev, NULL);
>  	if (IS_ERR(master->core_clk))
>  		return PTR_ERR(master->core_clk);
> =20
> +	if (!master->core_clk && !(master->quirks & DW_I3C_ACPI_SKIP_CLK_RST)) {

[Severity: Medium]
Will this driver still fail to probe on ACPI platforms without a core clock?

The code checks if DW_I3C_ACPI_SKIP_CLK_RST is set in master->quirks.
However, it appears this quirk is never included in the driver's ACPI
match table (amd_i3c_device_match). Without being populated by the ACPI
matching framework, the feature seems to act as dead code.

> +		dev_err(&pdev->dev, "missing core clock\n");
> +		return -EINVAL;
> +	}
> +

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but is there a runtime PM and
resource cleanup issue during driver unbind?

When the device is removed (e.g., driver unbound via sysfs) while in a
runtime-suspended state, or an autosuspend timer fires concurrently with the
remove callback, the driver core calls pm_runtime_put_sync() before remove.

This means the device may be suspended when dw_i3c_common_remove() executes.
The callback unregisters the I3C master:

dw_i3c_common_remove()
    i3c_master_unregister(&master->base)
        dw_i3c_master_bus_cleanup()
            dw_i3c_master_disable()

This access to the DEVICE_CTRL MMIO register happens while the controller
might be unclocked, which could cause a synchronous external abort
(kernel panic).

Would it be safer to wake the device via pm_runtime_get_sync() before
unregistering the bus?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728065955.8094=
45-1-akhilrajeev@nvidia.com?part=3D8
