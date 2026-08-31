Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02D5302CC1
	for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 21:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788211937; cv=none; b=Yoet9mLyZ/dVSKcvJYSb2U3RaIbQM3rfwUPmwEF2I7bZF3CcggTAWrO0cgNlk19XuUplYfG89B7cHdEd3kNF4qaW8tSLUlqBvIP2j3iLRAJzd+CIUFg4z2rqCPIU0UXQj/ACQZBWgz+zGhVyyeF5ix/EjA4kqOdJ56cMqbEsNPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788211937; c=relaxed/simple;
	bh=BU3ruw0nHo+PCeM/v4GkC4DZMWZl1Tx5B6AkvKt4ZnE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i8OZukmEdGfMNyTc+NYPTYIzDMmG1KJSrbyZC4Ryd2Pii6PRmvUOt/d1Z/zRLAFJjgJH0dXv+9K/rjnaIVVLlXQmtBOSNlDHJMhzqxPfnDgPuUzYgsgpAKAQFIC+fbpoIiKkqhBaMTqzfPw85cTtjLRtcMCt9AnMSTylSTRiJ9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lIv21bVF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lIv21bVF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C6F61F000E9;
	Mon, 31 Aug 2026 21:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788211936;
	bh=IfCyvX5G2YqwYbYubnePZ2Ad3KFHI8IJvxe/58ESdac=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lIv21bVF3gaB40Ngn/6A/JNUVQ6Qstittt6Iwp8R/8Q7HUFOGKsAis9yYTtChRFX3
	 mHebXvxe4PKvvaZPzzkTBTuHeZ5akW/fpxDkrvGxfg1hT20eLb4a/N6UzMtduf3K1B
	 32gkaY4Y1c6cHR8FBnAEFSv8Rfrzc03lmsmiYnStDJwrXS1Xqcno8XXXTCu7eyoJdP
	 7g+jiQ0niNhMivqLxpW3uacr7zBk2GpKcolsNKQiHkh7X0zq1eSBeIDRyNoN8fGIVE
	 96lf4eTyMvGIXUqXbcA6DnKN65rpTcGU13Q75gr8u7LwipeVpvmjUlsLfwUL0vu9Ib
	 ze6GpEzRVfBpw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] hwmon: (spd5118) Select page 0 unconditionally
 during probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260831193424.95135-1-W_Armin@gmx.de>
References: <20260831193424.95135-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 21:32:15 +0000
Message-Id: <20260831213216.0C6F61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Unconditional write during I2C probe permanently corrupts stan=
dard EEPROMs sharing the SPD address space.
--

commit e2971449a7fa80893d9c9314c59edd4a92223f9c
Author: Armin Wolf <W_Armin@gmx.de>

hwmon: (spd5118) Select page 0 unconditionally during probe

Some Intel i2c controllers can be configured by the BIOS to reject writes
to the SPD device. This commit avoids probing on affected devices by
unconditionally selecting page 0 by writing the SPD5118_REG_I2C_LEGACY_MODE
register during probe.

> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
> index 9724cf70b61d4..038d9e6e6a737 100644
> --- a/drivers/hwmon/spd5118.c
> +++ b/drivers/hwmon/spd5118.c
> @@ -637,44 +637,31 @@ static int spd5118_i2c_init(struct i2c_client *clie=
nt)
[ ... ]
> +	mode =3D i2c_smbus_read_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE);
> +	if (mode < 0)
> +		return mode;
> +
> +	err =3D i2c_smbus_write_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE,
> +					mode & ~SPD5118_LEGACY_PAGE_MASK);

[Severity: Critical]
Does this unconditional write risk corrupting standard EEPROMs that share
the SPD address space (0x50-0x57)?

Writing to offset 0x0B of a standard EEPROM (such as a DDR4 SPD) before the
device identity is verified modifies its contents, potentially rendering the
memory module unrecognizable to the system BIOS.

This also initiates a self-timed write cycle (typically 5ms) which puts the
device into a busy state where it NAKs all subsequent I2C transactions.

> +	if (err < 0)
> +		return err;
> +
> +	regval =3D i2c_smbus_read_word_swapped(client, SPD5118_REG_TYPE);
> +	if (regval !=3D 0x5118) {
> +		/* Restore original register content */
> +		i2c_smbus_write_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE, mode);

[Severity: Critical]
Does this restore attempt silently fail on standard EEPROMs?

Since the initial write puts a standard EEPROM into a busy write cycle where
it NAKs transactions, the subsequent read of SPD5118_REG_TYPE will fail.

The code then reaches this point to restore the original value, but because
the EEPROM is still busy, this write is also NAKed and silently fails. The
probe then exits with -ENODEV, leaving the EEPROM permanently corrupted.

> +		return -ENODEV;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831193424.9513=
5-1-W_Armin@gmx.de?part=3D1
