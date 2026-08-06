Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8499537AA78
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Aug 2026 13:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786022696; cv=none; b=K5eO+uJB43+yiTaIsR4KqNJa4cHFUEWHjdTQ4wtJT+0/nryW0pjVgzB6acrzkTEPe1KJqD3ZxOgD/z9k8HykuUIZYynqWbUoFdVFf6PVm77c/pkoM3QyjQ0VF19yG6ZVpI+LdHq93plgTDTbTB0M2e7JrztsKUDsiGzz7ceUQAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786022696; c=relaxed/simple;
	bh=Y8L50GS85PoTNL4MhHLQH962HG4GaJteWLHG//qe/Ak=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WmvWBbSF4IncTLasdgW6nvTaDEgE4B9AuPNhPykk+SJMcfDdD4eXWmx6JtPsEjU9BgSFT2LF7rpbRyKajCJtE5yCCJxUmJ7Fb7CdUDFa3SeE0g4IybhRISqFFxybNY+UwZreERM+HpmrfaAiHhDIi+ALgJUVWpsKdhZdR3JOnA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CpWXzxgv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CpWXzxgv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80AD21F000E9;
	Thu,  6 Aug 2026 13:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786022692;
	bh=9ct7l36DBFvwH65aL0mQRSBCpMnu3rbt/ZZJtRAYxVI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CpWXzxgvqUr3fYaP8aNlj6J+6bW6qi0mofeMmMCAOiTvqsKc7yilf1ayB+NhbhyK1
	 5UuBhENAFCQrX0OA2fXb06Xfd6nK4KTz01bdHgL/be7e3WVKNyCNt0kUof4GefVpyA
	 iqhl7aTxe0Rkpc3TEGIvsYTUtoLfSDF9kzerJVhxL9E1l8X+AcfPMjsfBrxYR/EdC1
	 22fCPqMFpjM32+evqKuIFvBYbbwCE8CMxw0wOCNCN8aCZ8kDFbv1s0r53HUx5s2bPm
	 h4/zRb+6c1X+ZewYsxhK4WMbImIVxUoYXavmMko99ieTrjH2BoV0XYvhU69opZxKDV
	 ghaDDO5bqDuwg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (yogafan) Add support for new Lenovo models
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sergio Melas" <sergiomelas@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260806131103.19104-1-sergiomelas@gmail.com>
References: <20260806131103.19104-1-sergiomelas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 13:24:51 +0000
Message-Id: <20260806132452.80AD21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Specific Lenovo model DMI quirks incorrectly use `DMI_PRODUCT_FAMI=
LY` for exact model string matching, causing all specific quirks to fail an=
d fall back to incorrect generic profiles.
--

--- Patch [1]: [PATCH] hwmon: (yogafan) Add support for new Lenovo models -=
--
commit ea309cfac96f236f87726dc09f574a3015681685
Author: Sergio Melas <sergiomelas@gmail.com>

hwmon: (yogafan) Add support for new Lenovo models

This patch adds DMI quirk entries mapping correct ACPI paths and
configurations for several additional Lenovo laptop models. It also reorders
the quirk table to evaluate specific model matches before generic family
fallbacks to prevent DMI shadowing.

> diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
> index 0a41b8672b56e..48fa5148d9e2c 100644
> --- a/drivers/hwmon/yogafan.c
> +++ b/drivers/hwmon/yogafan.c
[ ... ]
> @@ -176,6 +189,54 @@ static const struct hwmon_chip_info yoga_fan_chip_in=
fo =3D {
>  };
> =20
>  static const struct dmi_system_id yogafan_quirks[] =3D {
[ ... ]
> +	{
> +		.ident =3D "Lenovo IdeaPad 3 15ALC6",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "IdeaPad 3 15ALC6"),

[Severity: High]
Does this correctly match the hardware?

Lenovo firmware typically populates DMI_PRODUCT_FAMILY with short generic
strings (e.g., "IdeaPad"). Since dmi_first_match() uses strstr() to find the
quirk string inside the hardware string, searching for a long specific stri=
ng
like "IdeaPad 3 15ALC6" inside "IdeaPad" will always fail.

Should this match against DMI_PRODUCT_VERSION or DMI_PRODUCT_NAME instead?

> +		},
> +		.driver_data =3D (void *)&ideapad_8bit_fan0_cfg,
> +	},
> +	{
> +		.ident =3D "Lenovo Legion Pro 7 16AFR10H",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "Legion Pro 7 16AFR10H"),

[Severity: High]
If this match fails for the same reason, the hardware would fall back to the
generic "Legion" quirk at the bottom of the table.

Because the generic profile specifies a multiplier of 1 instead of 100, wou=
ldn't
this result in wildly incorrect sensor readings for this hardware?

> +		},
> +		.driver_data =3D (void *)&xiaoxin_8bit_dual_cfg,
> +	},
> +	{
> +		.ident =3D "Lenovo Yoga Pro 7 14IAH10",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "Yoga Pro 7 14IAH10"),

[Severity: High]
Similarly, if this match fails and falls back to the generic "Yoga" quirk,
the driver would attempt to use the PCI0.LPC0 ACPI path instead of PC00.LPC=
B.
Could this cause the driver to fail to probe on this device?

> +		},

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806131103.1910=
4-1-sergiomelas@gmail.com?part=3D1
