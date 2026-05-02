Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52795309DB5
	for <linux-hwmon@vger.kernel.org>; Sat,  2 May 2026 17:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777744725; cv=none; b=H7fLdGTPtKzbKiDSrSoY20+TYIboWOnGphgN/MUyovdKV2eIleJ49kqTbdkgCDktLhFruQYQC6VzgChfsPvGdNiWmVERbPU0oMoVmFrVRFtf3pUkXceDEVA4oH4Tb/AQPNk5KGhqxSBlD9w71iFBnKRxMODCFVhX/WqHLC6Bccw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777744725; c=relaxed/simple;
	bh=uzHgzz1chE9bCGwi9xNTaTzkbYjUvVjdu15Sb44J2ts=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nctes879Rc8+LVPd8Vsb2A56oR2Nm71zoizorUm31w1q8Nc+FlY7BIjF5B1Ykcl3DjAVAg6Ie4LFRzxC65VGygtDbwYCluKWDDz1nt0RMVJr3E3Ty6TZqMacpDw4TumJtgkevVkxKys5Bh0HrL4Dv5oiB0+84hNKTqVQRTjJgUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XesMqif2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XesMqif2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7762FC19425;
	Sat,  2 May 2026 17:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777744724;
	bh=uzHgzz1chE9bCGwi9xNTaTzkbYjUvVjdu15Sb44J2ts=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=XesMqif2aMPcahCM8D6lLW39Tm2zgIXK5w8LP2s5D9iYEywWstiMsqzoyCNgVEZNO
	 oK+Kin9Zzed1JAXjXsk2rDUazkImFuZMwjaTX9WbeL8BYFPeY6dlh8b7hUBbyhGVjg
	 d9X58MHdwlVg6TdYx+CBBdzqxhn33cClQcJr9Ygz+IVpGfKed20P9Rn02K6bCia7u+
	 JvQE0AL6UjN9sAw0tSpbbiIwoO2/5wk0Iahhn/CkGsgQftR3DyJyewgmDZ7sHbIHEh
	 oForpmhk1hOb9+JWkcFiYedYORkaiTuPs99TMmLj2iZkqf9U//pFH3mQetKPawJrLb
	 3gTBU+jdVonFg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] hwmon: (lm75) Fix AS6200 setup and alarm
 handling
Reply-To: sashiko@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260502173207.3567876-2-markus.stockhausen@gmx.de>
References: <20260502173207.3567876-2-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 02 May 2026 17:58:43 +0000
Message-Id: <20260502175844.7762FC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incorrect Endianness Conversion / Bit Manipulation in Configuratio=
n Mask
--

commit 8a922153b759cd33365a5d701e970e65199083f1
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

hwmon: (lm75) Fix AS6200 setup and alarm handling

The initialization of the AS6200 has shortcomings regarding the conversion
mode and polarity. This patch updates the set_mask to 0x10C0 to fix the
configuration and adapts the alarm handling logic to properly report alarms.

> - Change the set_mask to 0x10c0 to reflect the current active-low
>   setup properly and to drive the sensor in continous mode. This
>   takes into account that the config register is little endian and
>   the first byte sent to the chip is the LSB.

Is the assumption that the config register is little-endian correct here?

The AS6200 is a big-endian sensor (it expects its MSB first). However, the
driver writes the 16-bit config register using i2c_smbus_write_word_data(),
which sends the integer's lower byte first.

Because of this, the lower byte of the driver's set_mask becomes the sensor=
's
MSB, and the upper byte becomes the sensor's LSB.

> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
> index f1a1e5b888f6..7efcef7768cd 100644
> --- a/drivers/hwmon/lm75.c
> +++ b/drivers/hwmon/lm75.c
> @@ -137,7 +137,7 @@ static const struct lm75_params device_params[] =3D {
>  	},
>  	[as6200] =3D {
>  		.config_reg_16bits =3D true,
> -		.set_mask =3D 0x94C0,	/* 8 sample/s, 4 CF, positive polarity */
> +		.set_mask =3D 0x10C0,	/* 8 sample/s, 4 CF */

With the new mask set to 0x10C0, the lower byte is still 0xC0. This means
0xC0 is still transmitted first and becomes the MSB on the sensor, so bit 7
of the MSB (bit 15 of the hardware register) remains set. Will this keep the
sensor in Single-Shot mode instead of continuous mode?

This logic issue appears to persist even after the subsequent patch in the
series (0da1c5266106) fixes the regmap_update_bits() mask application bug.

Additionally, does changing the upper byte from 0x94 to 0x10 unintentionally
scramble the lower configuration bits on the sensor?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260502173207.3567=
876-1-markus.stockhausen@gmx.de?part=3D1
