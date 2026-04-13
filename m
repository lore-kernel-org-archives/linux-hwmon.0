Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8577DA66
	for <linux-hwmon@vger.kernel.org>; Mon, 13 Apr 2026 06:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776062315; cv=none; b=fIYgCkLTkCp6TFT3nFN+UQVRJ5lyGC8PTJABd1VbrgXCHU/N3kEjIImnNzP1LX60rqjPELGwaU2xnPoVh2T+GRNuDYh8hDqp4DoTATsqWzjTcuIs2UxNQY30be2JnaQAFvnY2OVerVvhq5F0GL5GE+QtC4sDKJPC3rqQuY5y/X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776062315; c=relaxed/simple;
	bh=octv7Q4o4DlBgOO2FKnIyVmxqkHeitcZ5RFX5S/xtgE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M4mWVEiBXAHymYpXP13O/v8mt3HFbtSKyikuiOtvvxKoVLPpG3ly6FOA7JkOCgQ8yzy+mG0pLE+oAy/9xoR50LGsRt4nsjhTxYyS3ldUztOJmI7cKWzC7/eymiloXPsswEBzPT0PxcVvw/bIRUv13nPE6K9jK9XEijNIoUR7ZGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tl5EqrpZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tl5EqrpZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C331C116C6;
	Mon, 13 Apr 2026 06:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776062315;
	bh=octv7Q4o4DlBgOO2FKnIyVmxqkHeitcZ5RFX5S/xtgE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=tl5EqrpZ2KPdO/vHlXv0kg6RfSWUrc5tSUkqZz/JZ1OEIqxhMQmjQI6Tt5aTXM4Go
	 C0M4A8BBqV50fiBG4mwcC3XTLBu6wdO6V/SVCCOHhHOv9HSJ6/mYb5Uc41be6nMNOC
	 w2dUALusuTHnrCYaAvIwkzAE78tV84cXHqn+tEwqH0SnX/fnKpd4mecDkpseCKDMqt
	 kisvjbKGlmb5FuRXSXau8vpDxJXe3H8bE+8zvCmbxjiNGAldqc85cTrGappoyt1bc2
	 SdbZHKQDENVG8/+1ejO5XIwhFxEvKdUL6u+bYG4rQ7eXlkIRGl4pLqUDagbHFeCjcs
	 Sul7dZmPH7qTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] hwmon: (yogafan) Massive hardware expansion and
 structural refactoring
Reply-To: sashiko@lists.linux.dev
To: "Sergio Melas" <sergiomelas@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260413060931.31091-2-sergiomelas@gmail.com>
References: <20260413060931.31091-2-sergiomelas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Apr 2026 06:38:34 +0000
Message-Id: <20260413063835.2C331C116C6@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 3 potential issue(s):
- [Medium] The driver's anti-spam polling protection fails to prevent rapid=
 ACPI reads, exposing the Embedded Controller (EC) to the exact polling spa=
m it claims to prevent.
- [Medium] The DMI quirk table relies on short, non-unique strings without =
matching the system vendor, risking unintended driver binding on non-Lenovo=
 hardware.
- [Medium] The `const` qualifier was removed from all hardware profile stru=
ctures, directly contradicting the documented security architecture.
--

commit 4e3a104ba986fdf8eb4e1dff6e4429669d7cf376
Author: Sergio Melas <sergiomelas@gmail.com>

hwmon: (yogafan) Massive hardware expansion and structural refactoring

This commit expands support for Lenovo consumer laptops in the yogafan driv=
er,
replacing the pilot implementation with a 7-series Hardware Abstraction Lay=
er.
It introduces discrete-step EC estimation, DMI quirk-based multi-path ACPI
discovery, and implements physics-based RLLag filter dynamics.

> diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
> --- a/drivers/hwmon/yogafan.c
> +++ b/drivers/hwmon/yogafan.c
[ ... ]
> +/* 1.1 Single-Fan Continuous */
> +
> +/* Reference Model: Yoga 14cACN (d=3D50mm) - Baseline inertia (Reference=
 J) */
> +static struct yogafan_config yoga_continuous_8bit_cfg =3D {
> +	.multiplier =3D 100, .fan_count =3D 1, .n_max =3D 0,
> +	.r_max =3D 5500, .tau_ms =3D 1000, .slew_time_s =3D 4, .stop_threshold =
=3D 50,
> +	.paths =3D { "\\_SB.PCI0.LPC0.EC0.FANS", "\\_SB.PCI0.LPC0.EC0.FAN0" }
>  };

Does removing the const qualifier from these hardware profiles contradict t=
he
security architecture outlined in the documentation?

The documentation explicitly claims adherence to IEC 62443 by using read-on=
ly
section (.rodata) placement via "static const" to prevent runtime tampering.
Because these structures are no longer const, they will be placed in writab=
le
memory (.data).

[ ... ]
> +	/* 2. Get hardware data only for INPUT requests */
>  	status =3D acpi_evaluate_integer(data->active_handles[channel], NULL, N=
ULL, &raw_acpi);
>  	if (ACPI_FAILURE(status))
>  		return -EIO;
> =20
> -	apply_rllag_filter(data, channel, (long)raw_acpi * data->multiplier);
> -	*val =3D data->filtered_val[channel];
> +	/* 3. Calculate raw RPM based on architecture */
> +	if (cfg->n_max > 0)
> +		/* Use s64 promotion to prevent overflow during multiplication before =
division */
> +		rpm_raw =3D (long)div64_s64((s64)data->device_max_rpm * raw_acpi, cfg-=
>n_max);
> +	else
> +		rpm_raw =3D (long)raw_acpi * cfg->multiplier;
> +
> +	/* 4. Apply filter only for real speed readings */
> +	apply_rllag_filter(data, channel, rpm_raw);

Does this actually prevent rapid polling to the Embedded Controller (EC)?

The commit documentation mentions a Cybersecurity Gating mechanism to ignore
polling spam faster than 100ms. However, acpi_evaluate_integer() is
unconditionally called here in yoga_fan_read() before invoking
apply_rllag_filter().

Since apply_rllag_filter() checks the time delta and drops the reading if it
is too fast, the EC is still queried on every sysfs read and the result is
simply discarded. Should the time check happen before acpi_evaluate_integer=
()
to truly protect the EC?

[ ... ]
> -static const struct dmi_system_id yogafan_quirks[] =3D {
> +static const struct dmi_system_id yogafan_quirks[] =3D {
> +/* --- 1. YOGA SERIES --- */
> +	{
> +		.ident =3D "Lenovo Yoga Pro 9i (83DN)",
> +		.matches =3D { DMI_MATCH(DMI_PRODUCT_NAME, "83DN") },
> +		.driver_data =3D &legion_high_perf_cfg, /* 16" Chassis - High Inertia =
*/
> +	},

Could matching on short strings like "83DN" without the system vendor
constraint risk binding to non-Lenovo hardware?

The previous implementation included DMI_MATCH(DMI_SYS_VENDOR, "LENOVO").
Without it, these short product name identifiers might collide with hardware
from other manufacturers. If an unrelated system matches the string and uses
a common ACPI path like \_SB.PCI0.LPC0.EC0.FAN0, the driver might bind and
interact with the EC unintentionally.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260413060931.3109=
1-2-sergiomelas@gmail.com?part=3D1
