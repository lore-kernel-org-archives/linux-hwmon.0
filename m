Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB273D9058;
	Tue, 28 Jul 2026 07:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223165; cv=none; b=PNKlJ2yD1RiOwPLsHGd7NPtvaAFh8VcvhsTvZj3KVzAC9vQIH3zw1dFxVPPl5+iFvDRCW/3M8t8EGQl6Yrlr703AGwA600r40Q8AwNCLzouE5U6CI8OjHMwyjBJ1Czdn8gCxieS2LqbosblCx4r/NcZiOc/ITqN6bMdgj4k2lTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223165; c=relaxed/simple;
	bh=S8BJ0Z13JddD/YGIRZfUBl0grZ1ITqxpISh3QPR/jMY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Vfd48fVCZtSCC2qyfXEHyURbg92jg5qrPcx0ZMts8N15ACRVJpL1w0muxRUgIYngcRRzm4obQdPN+NGzTfqIQVfpadcb+PmvjR3erhbC7omAiIwCigNdbWrrvqhrDTLCviDNKY8qUCwId9JXZoq/P5S4V50KKpt0wMb/cmfb4cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OOguL1AD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OOguL1AD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC361F00A3D;
	Tue, 28 Jul 2026 07:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785223163;
	bh=BupQScWeuFpJY913ZAydOTcxRX0VNfdyZHsAKeY3uRI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OOguL1AD27oSOI2Gc3iHcNNQkekXsmfSBgEDX/XqXvEuUwX17Oj9b9Nf6c/ZKVRSr
	 mbDfESM5eVLlpQOxk6+tpsa6ksMwDrQeOUmL3jo8sevkr1pGOJCCpl8X9fixYTnTMh
	 37DRDX38AMcediA74HKpc5g+m0slxDjWHy1E/HFBUPULZTpkOATjCgfmu4qfGgo/mL
	 skrv2Ostr4+7QESYJtLaWhu+a1XBLg18gujZMxh6x4yy4TOCRbMU4u43ACuQLlfJTW
	 /IAgBlwLzF/N95XoDMnkm2tpYJI+zjWPDAI5AjADYCmNyxPKhbtLi+EVAOAcbXbdF1
	 CdqCfgn8IEM7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 09/12] i3c: dw-i3c-master: Add ACPI ID for Tegra410
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-i3c@lists.infradead.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260728065955.809445-10-akhilrajeev@nvidia.com>
References: <20260728065955.809445-1-akhilrajeev@nvidia.com>
 <20260728065955.809445-10-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 07:19:22 +0000
Message-Id: <20260728071923.2EC361F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Pointer address assigned to an integer bitmask variable for quirks=
 under ACPI PRP0001 matching.
--

--- Patch [9]: [PATCH v7 09/12] i3c: dw-i3c-master: Add ACPI ID for Tegra41=
0 ---
commit 4b2659ca2047946e238179b5da94407cbd49ffa2
Author: Akhil R <akhilrajeev@nvidia.com>

i3c: dw-i3c-master: Add ACPI ID for Tegra410
   =20
Update variable names to generic names and add Tegra410 ACPI ID to
support the I3C controller in Tegra410, which is a DesignWare I3C host
controller.

> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i=
3c-master.c
> index 273d7a0020993..12069aa56fad8 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1855,11 +1855,12 @@ static const struct of_device_id dw_i3c_master_of=
_match[] =3D {
>  };
>  MODULE_DEVICE_TABLE(of, dw_i3c_master_of_match);
> =20
> -static const struct acpi_device_id amd_i3c_device_match[] =3D {
> +static const struct acpi_device_id dw_i3c_master_acpi_match[] =3D {
>  	{ "AMDI0015", AMD_I3C_OD_PP_TIMING },
> +	{ "NVDA2018", DW_I3C_ACPI_SKIP_CLK_RST },
>  	{ }
>  };

[Severity: High]
This is a pre-existing issue, but does dw_i3c_common_probe() improperly cast
pointers to integer bitmasks under ACPI PRP0001 matching?

If a system uses the ACPI PRP0001 HID alongside the "altr,agilex5-dw-i3c-ma=
ster"
compatible string, device_get_match_data() will return a pointer to
altr_agilex5_drvdata.

Because the device has an ACPI companion, the probe function processes it l=
ike
this:

drivers/i3c/master/dw-i3c-master.c:dw_i3c_common_probe() {
    ...
	if (has_acpi_companion(&pdev->dev)) {
		quirks =3D (unsigned long)device_get_match_data(&pdev->dev);
	} else if (pdev->dev.of_node) {
    ...
}

Will this cause the memory address of altr_agilex5_drvdata to be cast direc=
tly
to an integer bitmask, resulting in random quirks being activated based on
memory alignment (e.g., falsely applying DW_I3C_ACPI_SKIP_CLK_RST or
DW_I3C_DISABLE_RUNTIME_PM_QUIRK)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728065955.8094=
45-1-akhilrajeev@nvidia.com?part=3D9
