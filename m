Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38862F8EAC
	for <linux-hwmon@vger.kernel.org>; Sun, 30 Aug 2026 23:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788133293; cv=none; b=gYHixM0BjWZTq+XeaVval4Fk5HvxtEEa4yWRTfMTkzxrpC9snI8cK3o9gKJkkcEEVHCZPN47MtVblTsi7i3tqEN4JCLUf1RYL1AwZW6hc72fUDJr4HSguPXGHcuLh5dTrn84EnDWw1aKiufNh949ILwG2J2btyqIAAlkWrWsfFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788133293; c=relaxed/simple;
	bh=KqrmvfN8WJCfYYWCQvdbeC6IUswtUUuwSJ+ebJ3wZP4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gAs2TMQQJy0qsIt4MwvEwFGuC/FOWgyhSb4xXPBZYT3nu48awhQ7R8LUE7BWhzFeHgCaMdpLpWMofm618X/gRvExRL/6PnQ6xir6TK/V4LUcsIFR8OjQsIIfZaDeZ6K3h9kXYmbFqQ1YAjjuqW8oEjtm83yCZaYKvY+KT1AWAJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d16RwvL2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d16RwvL2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 498F71F000E9;
	Sun, 30 Aug 2026 23:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788133291;
	bh=CATAkK+wYmfCpsVHGXvSaTGW0cMacvGnqfAXofIowwg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d16RwvL2auA5nwm+fqbltx+7YLF1eXoiISyRQhNmGeyB1Evdl+RSZg50uFwNLF1Pj
	 8O+PalUWqa/wjclC+gEv6K8ywPpMILhOtA86oBYcF7BCjHXHDuPfyO1Isz5aCwOD55
	 sRcOl3nGPS6WYyS3fuNK8jR04qoKUSG9iwuuyk1NuY8++9/BJYOq0m/Ava4knyUp6L
	 3NS4F8/nqAMpXbVydjUOHlJnglOAvLBrNm6H0vf4+ZkKQwfbFiSQ15jfm2Touv95Ez
	 BRTOaLQL6xo+hrWjVNXDm/DDhp9F9Z9rW4TlxnBVK48cGu104fMt+oa2e/kTMRme2q
	 SFHZKn/+6IiSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (spd5118) Select page 0 unconditionally
 during probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260830233009.322206-1-W_Armin@gmx.de>
References: <20260830233009.322206-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 23:41:30 +0000
Message-Id: <20260830234131.498F71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Unconditional I2C write in `probe()` before verifying device ident=
ity can cause permanent data corruption on mismatched devices.
- [Medium] Failing probe on read-only buses entirely drops temperature moni=
toring capabilities.
--

commit 83cea797ff679bd0608e7bc406325588975c70cb
Author: Armin Wolf <W_Armin@gmx.de>

hwmon: (spd5118) Select page 0 unconditionally during probe

This commit makes the driver write to the legacy mode register
unconditionally during probe to select page 0. This intentional write
fails on controllers where the BIOS blocks writes to the SPD device,
thereby avoiding issues on such controllers by refusing to probe.

> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
> index 9724cf70b61d4..95b7cbd2f111c 100644
> --- a/drivers/hwmon/spd5118.c
> +++ b/drivers/hwmon/spd5118.c
[ ... ]
> @@ -637,45 +638,32 @@ static int spd5118_i2c_init(struct i2c_client *clie=
nt)
>  				     I2C_FUNC_SMBUS_WORD_DATA))
>  		return -ENODEV;
> =20
> -	regval =3D i2c_smbus_read_word_swapped(client, SPD5118_REG_TYPE);
> -	if (regval < 0 || (regval && regval !=3D 0x5118))
> -		return -ENODEV;
> -
[ ... ]
> +	mode =3D i2c_smbus_read_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE);
> +	if (mode < 0)
> +		return mode;
> +
> +	FIELD_MODIFY(SPD5118_LEGACY_PAGE_MASK, &mode, 0);
> +	err =3D i2c_smbus_write_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE, =
mode);

[Severity: High]
Does this unconditional I2C write in spd5118_i2c_init() risk permanent data
corruption if the driver is bound to a mismatched device?

Because the device identity check reading SPD5118_REG_TYPE has been moved
until after this write, any device mistakenly probed (via sysfs or incorrect
firmware tables) in the 0x50-0x57 address range will have its byte at offset
0x0B overwritten.

For an ordinary EEPROM, this clears bits 0-2 permanently before the
subsequent type check fails and aborts the probe.

> +	if (err < 0)
> +		return err;

[Severity: Medium]
Will failing the probe completely on read-only buses deprive users of all
temperature monitoring capabilities?

If spd5118_i2c_init() returns an error here when probed on an Intel
controller that rejects writes, the driver completely drops support for that
device.

Previously, the probe would succeed and at least allow reading the memory
temperature. Could this degrade gracefully instead, perhaps by marking the
regmap as read-only and disabling suspend/resume writes, rather than totally
preventing hardware monitoring?

> +
> +	regval =3D i2c_smbus_read_word_swapped(client, SPD5118_REG_TYPE);
> +	if (regval < 0)
> +		return regval;
> +
> +	if (regval !=3D 0x5118)
> +		return -ENODEV;
> =20
>  	/* We are reasonably sure that this is really a SPD5118 hub controller =
*/
>  	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260830233009.3222=
06-1-W_Armin@gmx.de?part=3D1
