Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29777356742
	for <linux-hwmon@vger.kernel.org>; Sun, 30 Aug 2026 23:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788131986; cv=none; b=DqXCJOSBdLS8D2cU5yakrSia+YO6zGF9Zgx9FrhRQ5V2s9/Cr0VrGWfrb2yu9GxaV00qwx0++7QhDdTxfzX5RzrJFrIWnyZENOi1m/c+4vXjH5K7HuZps3omsUTaSVVPIk8AYeOiRNt9hcYS95ebSJIWeKkm9wi6zoJjWYrpXco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788131986; c=relaxed/simple;
	bh=RA/jywUYIdn6TCurtF8eKkcJCnjkbUA4bZEpMtTOT3Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qevctJCVxq3e3W5qhXFIzp9m656JnmmtgY1mFM983DmTVWarixWkzB/VIeKGEdsd9dExueDtscOMgCDiqEdMYAMZb0hS10/m14Ga7kbIcVq47cfQ+84EtmujM5kE2oawUZDeKrMgsPIuouvkCSN7KoXY39FJmCWmNfyy3177DH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AU12JUYh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AU12JUYh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A0F01F000E9;
	Sun, 30 Aug 2026 23:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788131984;
	bh=tGIbw+V5PVa2WbJE5mMDTRKS17CHAf70FWDnzB6sJvg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AU12JUYhowjUq2YL1Aw2kb+EgzPnXlkrlQJui4sIW5iHw/m/R3Jr4f967p/nuLW4I
	 6dK5ladAtyOR3lSpSH9db6QvGxRr3r4cXTMPAlZ0XTiELb+hrejoV7MKxj+sABLayk
	 ACXHco62C/KOf0hx7bPOjyMNGtwu15YY4kzrjpiB9pRb16qwIdHtRy6PsboiR6XZ4V
	 YGQ8TmOE3vpWLMsM46Iv9+xRHtjCsFzEF8DadW4I6rFwpr/ebGjH4p5K6jxhCnyrue
	 330obm0IoJfW++4DyOINHYciC1Ga9GHZLq51ivln+5ElNbOCkBFsKh94+5cIwt1YdG
	 KYKejb0GRpYXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (spd5118) Select page 0 unconditionally during
 probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260830231036.203719-1-W_Armin@gmx.de>
References: <20260830231036.203719-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 23:19:44 +0000
Message-Id: <20260830231944.9A0F01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Unsafe unconditional I2C write during probe before device verifica=
tion risks permanent data corruption on unrelated devices.
- [Medium] The I2C write to select page 0 unintentionally clears bits 7:4 o=
f the legacy mode register due to an incorrect bitmask.
--

commit 270ea09e9966102e26a3fc6a4bba86ec060d0e37
Author: Armin Wolf <W_Armin@gmx.de>
hwmon: (spd5118) Select page 0 unconditionally during probe

This commit modifies the probe sequence of the spd5118 driver to
unconditionally select page 0 before attempting to read the device type
register. This change is intended to bypass BIOS-level restrictions on I2C
writes to the SPD device and properly handle chips that restrict access to
volatile registers when a non-zero page is selected.

> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
> index 9724cf70b61d4..65a0d5852ce86 100644
> --- a/drivers/hwmon/spd5118.c
> +++ b/drivers/hwmon/spd5118.c
[ ... ]
> @@ -637,45 +637,32 @@ static int spd5118_i2c_init(struct i2c_client *clie=
nt)
[ ... ]
> +	mode =3D i2c_smbus_read_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE);
> +	if (mode < 0)
> +		return mode;
> +
> +	err =3D i2c_smbus_write_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE,
> +					mode & SPD5118_LEGACY_MODE_ADDR);

[Severity: High]
Does this unconditional write execute before any device identity checks,
creating a risk of data corruption for incorrectly bound devices?

If this driver binds to an incorrect I2C device, such as a standard DDR4 SPD
EEPROM residing at the same 0x50-0x57 address range, it will blindly overwr=
ite
byte 0x0B of the device before verifying its identity.

[Severity: Medium]
Does this bitwise AND inadvertently zero out bits 7:4 of the legacy mode
register?

The masking operation mode & SPD5118_LEGACY_MODE_ADDR effectively masks out
all bits except bit 3, forcing bits 7:4 (and bits 2:0) to zero. In the
previous implementation, the driver explicitly verified that bits 7:4 were
zero before applying this mask. With that check removed, any device with bi=
ts
7:4 set will have them silently wiped out.

To safely clear only the page bits (2:0), should the mask logically be
mode & ~SPD5118_LEGACY_PAGE_MASK?

> +	if (err < 0)
> +		return err;
> +
> +	regval =3D i2c_smbus_read_word_swapped(client, SPD5118_REG_TYPE);
> +	if (regval < 0)
> +		return regval;
> +
> +	if (regval !=3D 0x5118)
> +		return -ENODEV;

[Severity: High]
If the type mismatch occurs here, the probe aborts without rolling back the
write to SPD5118_REG_I2C_LEGACY_MODE. Does this leak the state modification
to misidentified devices?

> =20
>  	/* We are reasonably sure that this is really a SPD5118 hub controller =
*/
>  	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260830231036.2037=
19-1-W_Armin@gmx.de?part=3D1
