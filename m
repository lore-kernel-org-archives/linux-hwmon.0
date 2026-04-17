Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1928240DFBB
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Apr 2026 16:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776443513; cv=none; b=D/CsCuwGiU20X0EUcWAq2018DFLniHQizvmM28HKQDZfLehEddL/CDJ0f327tT2gNUh2avQ0kCXE8b3i+yozneuqMl+ZFmDc3ZUCNctdDU+6w2LlGmyWY0dfWaT/98fLwoIkiZle9ZhFEmFUPk0bUgwotalaDsLLmAADoH4Acms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776443513; c=relaxed/simple;
	bh=axIMIcjPHajR85poit/YsZNvcxzxaG5aN7E2zmMLdOE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GuVWDyzAOIzGCChOQZqWTqkHhzzMv2MyHgwo73+we2EYqqwgg+bje1DuY6Z0XLM6LvKc6Pb5rQVXsNpd6PofKyPzWC8MyLe7JyT/gg1JHIzh/AditPtoj4IMnvYjIlEGKk5sMoCIpEQfQxiE/DvoS2HS29mW2zzKYPrEW8/eURo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jAcHuPrD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jAcHuPrD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8912EC19425;
	Fri, 17 Apr 2026 16:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776443512;
	bh=axIMIcjPHajR85poit/YsZNvcxzxaG5aN7E2zmMLdOE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=jAcHuPrDR5y4H3xycy5/yywIW7Uy9JwWPUuUJyp3vMPD4rIXP8H6OUmghFmOSWKp8
	 jnNiOC1mv0vtBBTNZJcNoEqviCvaA5grCcncMhUZR2+8T3QEsclXMMCk/5Hey2y8lL
	 nA937O2J0G/p8YyrcYFaHwkszXiVLhD4Fq+xbjipuc3bCQdfiZGvaIrDXzDJoEulVZ
	 jZEd9wjURuKAkfNvzeiqFgZBTBb3yP+FfNuKx6JAwoI0LfFuW+liOXLYvROgqa4g2B
	 Mv5GDfFae+ISIEE3D40zdsNu6pmApiOR/js/nKfLcp3An/TPb+PMtoPivibsgQRYin
	 PwgHMpZY/6Axw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (yogafan) Add support for new Yoga,
 Legion and LOQ models
Reply-To: sashiko@lists.linux.dev
To: "Sergio Melas" <sergiomelas@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260417142455.18806-2-sergiomelas@gmail.com>
References: <20260417142455.18806-2-sergiomelas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Apr 2026 16:31:51 +0000
Message-Id: <20260417163152.8912EC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 2 potential issue(s):
- [High] Out-of-bounds array access and invalid pointer dereference in the =
ACPI read fallback logic causes a kernel panic.
- [Medium] DMI quirk table ordering logic error permanently shadows specifi=
c device profiles.
--

commit 5e3726bab54f2c6b5ea348bbc4d3a5bf91397732
Author: Sergio Melas <sergiomelas@gmail.com>

hwmon: (yogafan) Add support for new Yoga, Legion and LOQ models

This commit expands hardware support for Lenovo laptops including Yoga,
Legion, LOQ, IdeaPad, and ThinkBook series. It utilizes 15 distinct
physical profiles based on the Hardware Abstraction Layer (HAL) to manage
diverse Embedded Controller behaviors.

> diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
> index 9df42990b723d..de8d1f4ccba04 100644
> --- a/drivers/hwmon/yogafan.c
> +++ b/drivers/hwmon/yogafan.c
[ ... ]
> @@ -89,6 +103,118 @@ static const struct yogafan_config legion_5_cfg =3D {
[ ... ]
> +/* 1.3 Triple-Fan Continuous */
> +
> +/* Legion 9i (d=3D70mm primary) - Massive inertia, triple assembly */
> +static const struct yogafan_config legion_triple_16bit_cfg =3D {
> +	.multiplier =3D 1, .fan_count =3D 3, .n_max =3D 0,
> +	.r_max =3D 8000, .tau_ms =3D 1500, .slew_time_s =3D 6, .stop_threshold =
=3D 50,
> +	.paths =3D { "\\_SB.PCI0.LPC0.EC0.FANS"
> +		 , "\\_SB.PCI0.LPC0.EC0.FA2S"
> +		 , "\\_SB.PCI0.LPC0.EC0.FA3S" }
> +};

Does this new 3-fan profile introduce a regression by exposing an
out-of-bounds array access in yoga_fan_read()?

When fan_count is 3, channel can be 2. In yoga_fan_read(), the fallback
logic evaluates:

if (ACPI_FAILURE(status) && cfg->paths[channel + 1])
    status =3D acpi_evaluate_integer(data->active_handles[channel + 1],
                                   NULL, NULL, &raw_acpi);

For channel 2, channel + 1 is 3. Since both cfg->paths and
data->active_handles are sized to MAX_FANS (3), accessing index 3 will read
out of bounds.

Due to the structure layout, data->active_handles[3] would read the adjacent
field, data->filtered_val[0], passing a raw integer instead of an
acpi_handle to acpi_evaluate_integer(), which could cause a kernel panic.

Additionally, conflating channel + 1 with a fallback path appears to cause
telemetry cross-talk by reading the next fan's speed when the current one
fails.

[ ... ]
> @@ -288,6 +665,228 @@ static const struct dmi_system_id yogafan_quirks[] =
=3D {
[ ... ]
> +/* --- 7. THINKPAD SERIES --- */
[ ... ]
> +	{
> +		.ident =3D "ThinkPad Classic (Generic T/X/Edge)",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "ThinkPad")
> +		},
> +		.driver_data =3D (void *)&thinkpad_discrete_cfg,
> +	},
> +	{
> +		.ident =3D "ThinkPad L-Series (Generic Match)",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "ThinkPad L")
> +		},
> +		.driver_data =3D (void *)&thinkpad_l_cfg,
> +	},

Could this generic "ThinkPad" entry cause a regression by shadowing the
"ThinkPad L" entry below it?

Since dmi_first_match() processes the yogafan_quirks table sequentially and
uses strstr() for DMI_MATCH evaluations, placing "ThinkPad" before
"ThinkPad L" means the generic thinkpad_discrete_cfg profile will
unconditionally match all L-Series devices.

This seems to prevent the intended thinkpad_l_cfg profile from being applie=
d.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260417142455.1880=
6-1-sergiomelas@gmail.com?part=3D2
