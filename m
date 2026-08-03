Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431823C1F
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Aug 2026 19:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785783892; cv=none; b=e68yLBjfV2UyZXjihdrBv4eMhqKW1OLU04WO/T73Inc7ySZ94IFdTr7ARgYHt1lDiGn/L5VO8VRqRX5oN56QZU4cF49/AS9cU7yvu3/C9B0Iv0hfk5QhdTV9EQFBfqm5DBW9Wxsdq00gKhgdWgVM6yHSJyWcXm5KlYn7q99IpOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785783892; c=relaxed/simple;
	bh=+v7FAuHe7CEmQAss3ivU9PZaKHj2zFtoEULtalAsH00=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MZDLgvcdy0rk0U7HigedSa1KNfmELSyqVoyQz1lw/ZRNCxr1ScfIEwoBfmMNTblxK0N+0fdJ++8s45i62Vhw5YaLHuqefnfENDYavQ0OJBBFsxj/IKEb+HWZEd0mZ59lyz3CQfWJP/lZgShtJcKrmXt25NWA8EgNq6qNWkZFVvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gpXTTvbx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gpXTTvbx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B57FD1F000E9;
	Mon,  3 Aug 2026 19:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785783890;
	bh=O8m38LJRypd7mZXbUpVxHuDtkiERztroF9i4K6eWUCM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gpXTTvbxsR8ZYSYrM5vpDYv9d9lw68YSM/u0wAvFrMpfFro3JtUUWy3dOxTky7euX
	 TbEbuzM0JX5AYGaWlPB/hiAV+tt4aURO46PpQTEIN7IVOpo9QTbTniZMc878sy73IK
	 zHIDB4IytSU5CUkvj119XfqyhE/lVGmv571v/+OV/JcO6qQaTeX/n4rjAIRhqppXPZ
	 wFb7HAm6RMdqx6yUxk/I/4ioVLP9oGPhkeyjF17pW9/Mgdvtd6ZdKeKwJe1sPuFSFr
	 ttH95S/aS9OxWM5YlDMvmrmF5SQ8e9ca6Y20IlToqfylBn1jwhNtpQCwJp4sQ3M+Rh
	 AkcGCTl/kICjA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12] hwmon: (yogafan) Add support for Lenovo Yoga/Legion
 fan monitoring
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sergio Melas" <sergiomelas@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260803184206.18465-1-sergiomelas@gmail.com>
References: <20260803184206.18465-1-sergiomelas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 19:04:50 +0000
Message-Id: <20260803190450.B57FD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The MIN_SAMPLING rate limit fails to prevent excessive ACPI querie=
s to the EC because the check occurs after the ACPI evaluation.
--

--- Patch [1]: [PATCH v12] hwmon: (yogafan) Add support for Lenovo Yoga/Leg=
ion fan monitoring ---
commit c15f7b338b1cdd81a16c2f92f8d5807ac9a0b7da
Author: Sergio Melas <sergiomelas@gmail.com>

hwmon: (yogafan) Add support for Lenovo Yoga/Legion fan monitoring
   =20
This driver provides fan speed monitoring for modern Lenovo consumer
laptops by interfacing with the Embedded Controller (EC) via ACPI.
To address low-resolution sampling in Lenovo EC firmware, a Rate-Limited
Lag (RLLag) filter is implemented. The filter ensures a consistent physical
curve regardless of userspace polling frequency.

> diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
> index 0a41b8672b56e..371e35895f584 100644
> --- a/drivers/hwmon/yogafan.c
> +++ b/drivers/hwmon/yogafan.c

[ ... ]

> @@ -77,6 +78,18 @@ static const struct yogafan_config loq_15iax9_8bit_dua=
l_cfg =3D {
>  	.paths =3D { "\\_SB.PC00.LPCB.EC0.FA1S", "\\_SB.PC00.LPCB.EC0.FA2S" }
>  };
> =20
> +static const struct yogafan_config xiaoxin_8bit_dual_cfg =3D {
> +	.multiplier =3D 100,
> +	.fan_count =3D 2,
> +	.paths =3D { "\\_SB.PCI0.LPC0.EC0.FANS", "\\_SB.PCI0.LPC0.EC0.FA2S" }
> +};
> +
> +static const struct yogafan_config yoga_pro_7_14iah10_cfg =3D {
> +	.multiplier =3D 100,
> +	.fan_count =3D 1,
> +	.paths =3D { "\\_SB.PC00.LPCB.EC0.FANS", NULL }
> +};
> +
>  static void apply_rllag_filter(struct yoga_fan_data *data, int idx, long=
 raw_rpm)
>  {

[Severity: High]
Does the MIN_SAMPLING rate limit effectively prevent excessive ACPI queries?

Looking at yoga_fan_read(), it appears the expensive ACPI evaluation happens
unconditionally before the filter is applied:

drivers/hwmon/yogafan.c:yoga_fan_read() {
    ...
	status =3D acpi_evaluate_integer(data->active_handles[channel], NULL, NULL=
, &raw_acpi);
	if (ACPI_FAILURE(status))
		return -EIO;

	apply_rllag_filter(data, channel, (long)raw_acpi * data->multiplier);
    ...
}

Even though apply_rllag_filter() skips math updates when dt_ms < MIN_SAMPLI=
NG,
the hardware ACPI query has already been executed.

Since the sysfs fanX_input file has 0444 permissions, could an unprivileged
local user continuously read it in a tight loop and cause an EC saturation,
leading to system stalls and keyboard/mouse lag?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803184206.1846=
5-1-sergiomelas@gmail.com?part=3D1
