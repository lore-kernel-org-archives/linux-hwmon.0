Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F278F25A655
	for <linux-hwmon@vger.kernel.org>; Sun,  6 Sep 2026 02:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788661081; cv=none; b=GY7GIGsjBq2kk/wiHc0KLJ6wq4jjN3znB5lisKTfAIt+Aq42hPhMo+Zv9lPQcA841T4TfOW4EqKS+qYX9t/p9q8lKi1jQgLg4HsWv9wAnYccjeZhJZDu9QgzJ5N5ejGfE0VawQ0x3T8R5CxAjWsknJdctUC2GKC4KEg3Wr78dCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788661081; c=relaxed/simple;
	bh=Wy/D1GpYAq0NcZxA3/6DU65Kja8Pp/ch+uteoeaITjY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r8gqsCfhlai8og6gP+C5DxTnhA6hpzH5mEuwNmlL241TE8B0OdHiUBajKfZAV25tBwcqbC2krUu2HffW17zzzhaYDoQo5jCPRfUpuU1lMtqOFRAaESAf/dVYDEqsy8Ne70N4S/jo7Tu1v+zwO92rFgHhdtmrjEowcCXGLll1gsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y4KV/k89; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y4KV/k89"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E91B1F00A3A;
	Sun,  6 Sep 2026 02:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788661079;
	bh=YP4ItK4dLw33B0uS2eW4AL7rBhROdWfYv/R48vzfSUc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y4KV/k89BAnmbcL7gIJx632D/5vglHuFLCAIiwNCaFLLB5mobr22wzlGss1U1oDRk
	 4jCrR077N45uYl1MgqUR/d3ziEj01l0kcEgWfOWaWyzVYxJAJE6FYwXs+vR2vR7TW6
	 s4ragzRbqv76NObY5reTi6NDT2p6CVcN+FL3+drDRUU1kyfQLRXDCJCJ3rCYEduUaj
	 LnW1htXOyRQjAoktdkPR+YnDsd9KIknA2hAAnId+tSw67WBjx/9NPrgoKxDvmYO/Mc
	 cOoV/Tlz4UXCivp9NfxOUPncsoo0nfs91Bv6yI7mRmzym2bD94vpBYch2qllkGn9fK
	 QqrZ80uphIImg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (yogafan) Add support for new Lenovo models
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sergio Melas" <sergiomelas@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260906021023.766992-1-sergiomelas@gmail.com>
References: <20260906021023.766992-1-sergiomelas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 02:17:59 +0000
Message-Id: <20260906021759.6E91B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Regression / Missing Device Support for Lenovo Yoga Pro 9 16IMH9 (=
83DN)
- [Medium] Casing mismatch for IdeaPad 3 15ALC6 Ub DMI string
- [Low] Redundant DMI quirk for Yoga 14cACN 2021
--

commit 401f8cbc6c1564d4dde7841a9984dbdade60d7ca
Author: Sergio Melas <sergiomelas@gmail.com>

hwmon: (yogafan) Add support for new Lenovo models

This commit adds DMI quirk entries and maps ACPI paths and configurations
for several new Lenovo laptop models. It also shifts towards matching by
DMI product family instead of product name to distinguish internal fan
layouts.

> diff --git a/Documentation/hwmon/yogafan.rst b/Documentation/hwmon/yogafa=
n.rst
> index 9ff5db5dc08ce..a7e628bc3e44f 100644
> --- a/Documentation/hwmon/yogafan.rst
> +++ b/Documentation/hwmon/yogafan.rst
> @@ -85,27 +85,26 @@ immediately to ensure the user knows the fan has stop=
ped.
> =20
>  ::
> =20
> - MODEL (DMI PN) | FAMILY / SERIES  | EC OFFSET | FULL ACPI OBJECT PATH  =
        | WIDTH  | MULTiplier
> + MODEL (DMI PN) | FAMILY / SERIES    | EC OFFSET | FULL ACPI OBJECT PATH=
          | WIDTH  | MULTiplier
>   -----------------------------------------------------------------------=
-----------------------------
> - 82N7           | Yoga 14cACN      | 0x06      | \_SB.PCI0.LPC0.EC0.FANS=
        |  8-bit | 100
> - 80V2 / 81C3    | Yoga 710/720     | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0=
        |  8-bit | 100
> - 83E2           | Yoga Pro 7       | 0xFE      | \_SB.PCI0.LPC0.EC0.FANS=
        |  8-bit | 100
> - 83DN           | Yoga Pro 9 16IMH9 | 0x06/0xFE | \_SB.PC00.LPCB.EC0.FAN=
S/FA2S  |  8-bit | 100
> + 82N7           | Yoga 14cACN        | 0x06      | \_SB.PCI0.LPC0.EC0.FA=
NS        |  8-bit | 100
> + 80V2 / 81C3    | Yoga 710/720       | 0x06      | \_SB.PCI0.LPC0.EC0.FA=
N0        |  8-bit | 100
> + 83E2 / 83DN    | Yoga Pro 7/9       | 0xFE      | \_SB.PCI0.LPC0.EC0.FA=
NS        |  8-bit | 100

[Severity: High]
Does 83DN actually share this ACPI path and single-fan layout with 83E2? The
previous code and documentation indicated it had two fans and used the
\_SB.PC00.LPCB namespace.

[ ... ]

> - 82KU           | IdeaPad 3 15ALC6 | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0=
        |  8-bit | 100
> + 82KU           | IdeaPad 3 15ALC6   | 0x06      | \_SB.PCI0.LPC0.EC0.FA=
N0        |  8-bit | 100
> + 82KU           | IdeaPad 3 15ALC6 ub| 0x06      | \_SB.PCI0.LPC0.EC0.FA=
NS/FA2S   |  8-bit | 100

[ ... ]

> diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
> index 413ddc721a113..2ce358c74410d 100644
> --- a/drivers/hwmon/yogafan.c
> +++ b/drivers/hwmon/yogafan.c

[ ... ]

> @@ -200,6 +200,30 @@ static const struct hwmon_chip_info yoga_fan_chip_in=
fo =3D {
>  };
> =20
>  static const struct dmi_system_id yogafan_quirks[] =3D {
> +	{
> +		.ident =3D "Lenovo Yoga 740-15IML",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "Yoga 740-15IML"),
> +		},
> +		.driver_data =3D (void *)&yoga_740_15iml_cfg,
> +	},
> +	{
> +		.ident =3D "Lenovo IdeaPad 3 15ALC6 Ub",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "IdeaPad 3 15ALC6 Ub"),
> +		},

[Severity: Medium]
Is the DMI string casing correct here? The code checks for "Ub" (uppercase =
U),
but the documentation table added in this same commit lists it as "ub"
(lowercase u). Since DMI_MATCH uses a case-sensitive match, if the hardware
actually uses the lowercase version, this quirk will silently fail to match
and the device will incorrectly fall back to the generic 1-fan profile.

> +		.driver_data =3D (void *)&ideapad_3_15alc6_82ku_cfg,
> +	},
> +	{
> +		.ident =3D "Yoga 14cACN 2021",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "Yoga 14cACN 2021"),
> +		},
> +		.driver_data =3D (void *)&yoga_8bit_fans_cfg,
> +	},

[Severity: Low]
Is this specific quirk necessary? The generic "Lenovo Yoga" fallback further
down the list in yogafan_quirks[] already maps to yoga_8bit_fans_cfg. Since
"Yoga" is a substring of this product family, wouldn't it achieve the exact
same behavior without this extra entry?

>  	{
>  		.ident =3D "Lenovo LOQ 15IAX9",
>  		.matches =3D {

[ ... ]

> @@ -248,14 +272,6 @@ static const struct dmi_system_id yogafan_quirks[] =
=3D {
>  		},
>  		.driver_data =3D (void *)&xiaoxin_8bit_dual_cfg,
>  	},
> -	{
> -		.ident =3D "Lenovo Yoga Pro 9 16IMH9 (83DN)",
> -		.matches =3D {
> -			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "83DN"),
> -		},
> -		.driver_data =3D (void *)&yoga_pro_83dn_cfg,
> -	},

[Severity: High]
Was the removal of the 83DN quirk intentional? By removing this without add=
ing
a functional equivalent using DMI_PRODUCT_FAMILY, the Yoga Pro 9 16IMH9 (83=
DN)
will likely fall back to the generic 'Lenovo Yoga' quirk. That generic quirk
expects the PCI0.LPC0 namespace and 1 fan, whereas 83DN requires the PC00.L=
PCB
namespace and 2 fans. Will this cause a functional regression for this devi=
ce?

>  	{
>  		.ident =3D "Lenovo Yoga",
>  		.matches =3D {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906021023.7669=
92-1-sergiomelas@gmail.com?part=3D1
