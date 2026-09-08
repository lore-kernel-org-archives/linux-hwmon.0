Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1484B0491
	for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2026 10:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861753; cv=none; b=MJbCQ544aK/rVPO/hTrDvg3dzAN+A9cPETx6We8ZWmSiyjijzVu7lKwKe9L61FF+sNOcyxTghg0LM0qcP6SoH25Tgc88TVidf4M/093GfiFCq4SnGHjAQf0vhNvhXCU47wlN2N1XGJnxCIJvP91F7YYhj8dFHpYpk2jO5x8LuhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861753; c=relaxed/simple;
	bh=J0GyC8P3dj+nWLKaAcSBPeXPUGOxRE+QtJThxizTT4c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fbmtBr3z+UERf+8L8wUZJU1yN+mtc49T/0lOyCvE2io3X6omxApOo3yDeQM3VEAZKrNjDyGT50VLFUt9lq9ZWyVLojjbvW0sVhdYkw5jvHHlvHWTXam5jV57x5QaxZnBKRiNHGAiTvRaFqE1jPToow3KJfGbCN4N5r022mT3LuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZS0wSyQw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZS0wSyQw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AD361F00A3A;
	Tue,  8 Sep 2026 10:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788861751;
	bh=tD0Iojj36mGsAuf7q3uA38uP+ianv67Pn/rK60OT8tQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZS0wSyQwngkltYPYtMt4mCDRLFHj74wdUOYHlXH8XbVfGy/eqscF1dddT99HMYyXS
	 W859T0+dmgzb5IGteGFwZYRGHSHP6bKUhJeKVZE3F5uCOSynPN8vmR+9Vez3D9mXRJ
	 GhfWF4/0LPp1TzLWOIkNdXaQ+OKTejo3rSlwtpuPKatVeD0aoLnQ57HIYNY7Vda8Qn
	 si6CMPrQlJpgUJ8azc1W4Hv3iNz8wfcizHMIzZ5qIEwdRfx0b43qXlKEPWjT6M4ZT1
	 jiMp2sPGVAVcjoqPdU0dVnOYixONTgvD+sUR9thqb1mOWbN2Ra3fu+/Vls+qHfCA7w
	 ZQ2aPCYCUNXrg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (yogafan) Update reference database and
 contributors for new models
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sergio Melas" <sergiomelas@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260908095009.2227661-1-sergiomelas@gmail.com>
References: <20260908095009.2227661-1-sergiomelas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 10:02:26 +0000
Message-Id: <20260908100231.6AD361F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing driver implementation for the newly documented laptop mo=
dels (Yoga 740-15IML and IdeaPad 3 15ALC6 Ub), leading to broken hardware s=
upport.
- [Low] Misaligned table columns in the reference database.
--

commit 23a8dae262a81e6cfc70a98f694a306fc940b81b
Author: Sergio Melas <sergiomelas@gmail.com>

hwmon: (yogafan) Update reference database and contributors for new models

Add documentation entries for the newly supported laptop models
(Yoga 14cACN 2021, Yoga 740-15IML, and IdeaPad 3 15ALC6 Ub) in the
master reference database table, and include the new contributor.

> Add documentation entries for the newly supported laptop models
> (Yoga 14cACN 2021, Yoga 740-15IML, and IdeaPad 3 15ALC6 Ub) in the
> master reference database table, and include the new contributor.

[Severity: Medium]
Are the changes to drivers/hwmon/yogafan.c missing from this patch?

The commit message states these are newly supported models, but the
driver changes are not included. When booting the kernel on these models,
yoga_fan_probe() will fail.

The documentation specifies unique ACPI paths required for these models,
but the driver relies on DMI matches that map to incorrect fallbacks (e.g.,
Lenovo Yoga providing LPC0 instead of LPCB for the 740-15IML) or incorrect
fan paths (e.g., mapping to FAN0 instead of FANS/FA2S for the IdeaPad 3
Ub). This causes acpi_get_handle() to fail and return -ENODEV.

Should the updates to yogafan_quirks in drivers/hwmon/yogafan.c be
included here?

> diff --git a/Documentation/hwmon/yogafan.rst b/Documentation/hwmon/yogafa=
n.rst
> index 9ff5db5dc08ce..5c21c50b7c4fa 100644
> --- a/Documentation/hwmon/yogafan.rst
> +++ b/Documentation/hwmon/yogafan.rst
> @@ -87,6 +87,9 @@ immediately to ensure the user knows the fan has stoppe=
d.
> =20
>   MODEL (DMI PN) | FAMILY / SERIES  | EC OFFSET | FULL ACPI OBJECT PATH  =
        | WIDTH  | MULTiplier
>   -----------------------------------------------------------------------=
-----------------------------
> + 82N7           | Yoga 14cACN 2021   | 0x06      | \_SB.PCI0.LPC0.EC0.FA=
NS        |  8-bit | 100
> + 81TD           | Yoga 740-15IML     | 0x06      | \_SB.PCI0.LPCB.EC0.FA=
NS        |  8-bit | 100
> + 82KU           | IdeaPad 3 15ALC6 Ub| 0x06      | \_SB.PCI0.LPC0.EC0.FA=
NS/FA2S   |  8-bit | 100

[Severity: Low]
Does this cause misalignment in the rendered documentation?

The newly added rows exceed the width of the FAMILY / SERIES column header.
This shifts the subsequent pipe separators by up to 3 spaces and breaks the
literal text block table alignment.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908095009.2227=
661-1-sergiomelas@gmail.com?part=3D1
