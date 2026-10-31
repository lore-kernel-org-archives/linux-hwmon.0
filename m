Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793418597;
	b=ywWnYQdjqvrf0ho7FUT2UuEQTCh/q4jHYJ2uScqCyUTnNtN+fQ4F6yzjfKNlkSOWexxM
	 cC0dKRoP8CqwQwGCJZu1bORL4RPcZUuHkY8lFlIeZCXbXHoS/imyW8SW5krRLURrv9FJG
	 DZNc7/XEq8MG31+on1nurgHFqZLE9BIox1auS/cNBxlP0/dPbSpBYirD4xB3yKjZux6dA
	 lYFqFCF7y5N4faGYZ45SKOlprJvrqAoA5a3KfPw5xxpBI8goNwx3iZcoxj4avVCiPmLux
	 DWreZ5bF4cl9Cj8q9HwaJbiz23KtWDrAkjUf54LsvNLJyO0ow28NABVRaUCGIw1OIww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793418597;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rOi5iTsjfOZEp03tT11p8luWPBz4/+pigeE+AEn4sIM=;
	b=FBFfkA1XCDHAVD+m7f6ElVtgdPQ8OM7x400TOVsDaRBeOkqw02twUSf57UMWvpB0SeU8
	 fqkR8EkLG3jgBUMK+5zyKbQ0O4Fq0wVgtP83VTR2oOYgFm+cxERa6xCL0CJnOK4ugeWtI
	 DwnO+5yFT6n2/F6qP6MOOxC0+5BbplC0sZ/45c5MBMLgfNqCojSAkc3Szf+HF8JQqTnuC
	 P8xgAsC5gyBaUjz+eObfMAb/MYd26Jksg94zxSmYbKL4yQK5bAwTL40n30xpPpwFM7Q4A
	 4nDVQ7mUMKEyRL8ayJJcxc1ustu7zz+0EMZ6QSrYg/pNzgJ/TrYgusjesTNV3G+CTXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IABL8kuK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3B9606A31A
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Oct 2026 03:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IABL8kuK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B98E1F000C1;
	Sat, 31 Oct 2026 03:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793418596;
	bh=rOi5iTsjfOZEp03tT11p8luWPBz4/+pigeE+AEn4sIM=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=IABL8kuK4+FzRLCHGHytdictuFtOHE9AHrwBSYKRoqc7UXCVE1YaixHCbUpai6i24
	 e1nUOhvlm6AU764TSJt3ev5I3kZQOpwE0lfyGR53Ox2Xgk+LCfgtSqijDKvluLBxLS
	 FNcPXaKjBOFoTfx6rYcarHinlKIaC3d4DY0g2dfLw4jQQP9yKYA198ElNCyPCZeaP8
	 tbwR9eLj1Byx45XTDvIqJk7+s3wLom1kT61/VbZluwK8jdjbfUopOCO/69HrbVs+Zm
	 pZZDZEr7lvdZa6Lp4B2E6YuYVhpTfpvVzu9EkDObOVcEY6GOSTv1axKRI2QfAQSyVg
	 qVkFFBBLg9UqQ==
Message-ID: <sashiko-outbox-191736@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (lm75) Fix setting polarity mask for chips with
 16-bit config register
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261031034755.1079779-1-linux@roeck-us.net>
References: <20261031034755.1079779-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 03:49:56 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> When probing a 16-bit compatible temperature sensor configured with the
> "ti,alert-polarity-active-high" device property, lm75_generic_probe()
> writes to a reserved bit instead of the alert polarity bit due to an
> incorrect bit shift in the 16-bit polarity mask.
> On 16-bit sensors, the polarity bit is physically located at bit 2 of the
> MSByte. When accessed via i2c_smbus_read_word_data() or
> i2c_smbus_write_word_data(), the SMBus protocol maps the first received
> byte (the physical MSByte) to the lower 8 bits of the integer
> representation. Consequently, the polarity bit is consistently mapped to
> bit 2, identically to 8-bit sensors. However, the
> LM75_ALERT_POLARITY_HIGH_16_BIT macro applies an 8-bit left shift,
> erroneously targeting bit 10. This causes the driver to silently corrupt a
> reserved bit in the configuration register while leaving the active-high
> alert polarity unconfigured, breaking the polarity feature.
>=20
> Use BIT(2) as polarity mask in the configuration register for all chips
> to fix the problem.
>=20
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Fixes: 1be4001d9b9b ("hwmon: (lm75) Support active-high alert polarity")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261031034755.1079=
779-1-linux@roeck-us.net?part=3D1

