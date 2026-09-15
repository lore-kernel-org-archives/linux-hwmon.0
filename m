Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAD53BD635;
	Tue, 15 Sep 2026 05:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789450125; cv=none; b=q4oa2s+qSiaeYiguf9p7s3aIr765cHoS30rt71XVBR3bueB4wdEB8J2brcYDrDTG3h2KMuofhKDlrPqBKY8ypobIVG9VIbgphrfzTdn0XrYR/AsTyqbSbZoN6Bszy2opWuaKLIRGGrqVAGt8pBMYLrg0FmFB3S4pMFat4pOLtjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789450125; c=relaxed/simple;
	bh=wQlwETqwXipUPXIDuPSAuFPc6VRfLQB1Nv5syzGhgQ0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PADYdjkGQzUrWQEdjci0dfE7W5uFcIVumd2OgMQDBtq2H05+boKIXV8OyI+C4FowXiQjPC2YxJDCiE8r9GpA3ZzOkMFj8lbueh8aNDrfkTWubmG5PFRTACtq7b30hTXmkRrb92z0hwIMjxeCuGf2bciCve14J48sc2qSAVRX5Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ejG7x/D8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ejG7x/D8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 397FF1F000FF;
	Tue, 15 Sep 2026 05:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789450123;
	bh=fcgYNv4PDpRpFoxYdAkDYWw39suppSbOYfkZMz3ZVio=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ejG7x/D8YATnzUSGsGtPpKfJeRKrIPeVrqIb8bQI/jafrtFSfT/+VvMC03IgkpV00
	 6WSurLlOJigQxo6rtoJ16hVWowRUbtodMJoknaAmXEZCFD2MMp+mQM+ylrnRwQzKK5
	 /7yv4W0z75q6Xye6NDX7+RhBvBjSnfYvt0XaRZPtrk4CMkmeE8sNyew+dSIaN1oNkg
	 T4TksRAkL2TDR9sf4uzUFQ9brY1Yy00r6jfU59h/kdK5kzN1MH1M0TtxlvHMLbgHF/
	 2V7+v5DpOyPJPv5HZ81MnfX7IoM+FlvVaEDPvsA+k2w0neV0MdRBRGQuJ7HxqW7MxM
	 ntd3+tvGUgPTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] hwmon: (lm75) Add support for Nuvoton NCT7715
Reply-To: sashiko-reviews@lists.linux.dev
To: hsyemail2@gmail.com
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260915052021.6959-1-syhuang3@nuvoton.com>
References: <20260915052021.6959-1-syhuang3@nuvoton.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 05:28:42 +0000
Message-Id: <20260915052843.397FF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] hwmon: lm75: NCT7715 initialization fails to clear bit 14 of con=
fig register
--

commit 7bd04866b8e88a3003be284539483cdda6599844
Author: Sheng-Yuan Huang <syhuang3@nuvoton.com>

hwmon: (lm75) Add support for Nuvoton NCT7715

This commit adds support for the Nuvoton NCT7715 temperature sensor to the
lm75 hardware monitoring driver. It introduces a new device parameter entry
that reuses much of the TMP112 handling for configuration and alarms.

> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
> --- a/drivers/hwmon/lm75.c
> +++ b/drivers/hwmon/lm75.c

[ ... ]

> @@ -259,6 +260,16 @@ static const struct lm75_params device_params[] =3D {
>  		.sample_times =3D (unsigned int []){ 30, 60, 120, 240 },
>  		.resolutions =3D (u8 []) {9, 10, 11, 12 },
>  	},
> +	[nct7715] =3D {
> +		.config_reg_16bits =3D true,
> +		.set_mask =3D 0x8060,	/* 12-bit mode, 4 samples / second */
> +		.clr_mask =3D 1 << 7,	/* no one-shot mode */

[Severity: Medium]
Will this leave bit 14 unchanged if it was previously set by a bootloader or
left over from a warm reboot?

During driver probe, lm75_generic_probe() calls lm75_write_config() to
initialize LM75_REG_CONF. The regmap update mask used is:
clr_mask | set_mask | LM75_SHUTDOWN

For nct7715, set_mask is 0x8060 and clr_mask is 0x0080. Bit 14 (0x4000) is
missing from both masks. Because of this, regmap_update_bits() will
silently ignore the 0 in bit 14 of set_mask and preserve its prior value
from the hardware configuration register.

If bit 14 remains set, can the sensor operate at 8 Hz instead of the
intended 4 Hz, leading to a mismatch between the hardware state and the
driver state which expects and reports a 250ms interval?

Should 0x4000 be included in clr_mask to ensure the hardware is properly
initialized to 4 samples / second?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915052021.6959=
-1-syhuang3@nuvoton.com?part=3D1
