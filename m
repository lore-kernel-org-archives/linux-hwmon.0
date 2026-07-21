Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2AD1D5CFB;
	Tue, 21 Jul 2026 04:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784607781; cv=none; b=akiK6i2dK+pN92zeA/Mlt0GIxXCEX8T6oleE5JIWLmj1lGA8FXer8uYnNrvtRBH+oH+c6k7OyrLM0vZQVoQjObSB78Cw5MtjBeiVITtxcg5sckch+Ya0KRDiewmNUlTv60q3QbZIx9klHQmNaYj1sR9+PQ4N53Tl4Bi7qNXUHNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784607781; c=relaxed/simple;
	bh=cBT+Q1wBl69/Tlsr6brXIqumat06FU4GIHZBzg1whcw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VcN43XaYcZJM+p5DOsnidC9Yrq61GKyLWXRjNyClobnobK+aCe2OJxdcwF3VqRXJIjFHB0S6kk9jn/I/oNjaJMNyGc3kQ/DUcpNx6IMagbWPTROkvDTiFMS9kunce1Kt8UgKXGNWpHhjCiBbRuglWD3I44avGbIR39sC49uX2To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GIjUc+Z7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GIjUc+Z7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80FA81F000E9;
	Tue, 21 Jul 2026 04:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784607780;
	bh=PWvM2MmnmbgbH+IBz0d4aWyaYJD3egvzO6jQPMvTRaI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GIjUc+Z7Vk8uiOjaQooqzvrgI5gTV0Xcg02T9emi2xnUfcP7W8sqdBp7Ip6zRxP8x
	 oHBfvCxdq3zxPz3fd0Yso0mbs3DbMLVQTZ1eiDxzj0KZXXmvhLhQ1+90hOL9a4XepP
	 j2TYxiEbw2SCZoBuW0uoaE2NdgKYs5ziomXQMDJwYcwuhwStwOgzvtJFI4PEIk4and
	 RZCXPIzwrNDGUsxrIf/oTDEZQkjLMV/u1Xh7b0j/1LLzRa31eaQlAYeyH6pU7mVsht
	 eBIImQ6ddkrap6shRg16Uc0qEczj0/I4F7/nY/sDcthr6S4BOIlV8nZ3LP7K48XIU2
	 bx0onIDq4ifbQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 09/12] i3c: dw-i3c-master: Add ACPI ID for Tegra410
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260721040805.1696503-10-akhilrajeev@nvidia.com>
References: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
 <20260721040805.1696503-10-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 04:22:59 +0000
Message-Id: <20260721042259.80FA81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unsafe pointer cast of device_get_match_data() return value when b=
inding via ACPI PRP0001.
- [High] Double-disable of core clocks during driver removal if the device =
is in runtime suspend.
--

--- Patch [9]: [PATCH v6 09/12] i3c: dw-i3c-master: Add ACPI ID for Tegra41=
0 ---
commit bf82e9c156c66763c855e5549bd1a91bafc5fdf3
Author: Akhil R <akhilrajeev@nvidia.com>

i3c: dw-i3c-master: Add ACPI ID for Tegra410
   =20
Update variable names to generic names and add Tegra410 ACPI ID to
support the I3C controller in Tegra410, which is a DesignWare I3C host
controller.

> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i=
3c-master.c
> index 3ec3ab1c13b4c..efe37f5224c71 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1860,11 +1860,12 @@ static const struct of_device_id dw_i3c_master_of=
_match[] =3D {
>  };
>  MODULE_DEVICE_TABLE(of, dw_i3c_master_of_match);
> =20
> -static const struct acpi_device_id amd_i3c_device_match[] =3D {
> +static const struct acpi_device_id dw_i3c_master_acpi_match[] =3D {
>  	{ "AMDI0015", AMD_I3C_OD_PP_TIMING },
> +	{ "NVDA2018", DW_I3C_ACPI_SKIP_CLK_RST },

[Severity: High]
This isn't a bug introduced by this patch, but adding a new ACPI ID brings
attention to a pre-existing issue when handling ACPI bindings.

Does this driver safely handle ACPI PRP0001 bindings?

In dw_i3c_common_probe(), if an ACPI companion is present, the match data is
cast to an integer bitmask:

	if (has_acpi_companion(&pdev->dev)) {
		quirks =3D (unsigned long)device_get_match_data(&pdev->dev);
	} else if (pdev->dev.of_node) {
...

When an ACPI device binds using the PRP0001 mechanism, it utilizes the OF
compatible strings and the OF match table. In this scenario,
device_get_match_data() returns the .data pointer from the of_device_id
table (e.g. &altr_agilex5_drvdata), rather than an integer quirk bitmask
from the acpi_device_id table.

Because of the unconditional cast, won't this store a kernel memory address
into master->quirks instead of a valid bitmask, thereby activating random
driver quirks?

[Severity: High]
This is also a pre-existing issue, but does dw_i3c_common_remove() correctly
handle devres clock cleanup when the device is in runtime suspend?

The probe function acquires and enables the core and pclk clocks using
devm_clk_get_optional_enabled():

	master->core_clk =3D devm_clk_get_optional_enabled(&pdev->dev, NULL);
...
	master->pclk =3D devm_clk_get_optional_enabled(&pdev->dev, "pclk");

These clocks are explicitly disabled in dw_i3c_master_runtime_suspend().=20

If dw_i3c_common_remove() is invoked while the device is in runtime suspend,
the clocks are already disabled. Since dw_i3c_common_remove() does not wake
the device (e.g., via pm_runtime_get_sync()), won't the devres cleanup
routine run clk_disable_unprepare() again on already disabled clocks,
leading to a negative clock enable count?

>  	{ }
>  };
> -MODULE_DEVICE_TABLE(acpi, amd_i3c_device_match);
> +MODULE_DEVICE_TABLE(acpi, dw_i3c_master_acpi_match);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721040805.1696=
503-1-akhilrajeev@nvidia.com?part=3D9
