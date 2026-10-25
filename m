Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901842;
	b=nhZqd8Ao558uWjAumrOprcDuvjYxYOM2g6KK153myKW9Lbk4K2SyoIrquKCMzKvzbksL
	 T1oXzJL8lIUJZHdKCKqHY2S01cY2iuzcjqgpSfR/pLpv5y10WvpmcPQiYn8eeobCGwHLd
	 LWh902xynQeXgoga+4lk13ZR8MtWQv2HXVrBI/Fe5996Jg47K0Guw50CbjAgATwqF8D2M
	 8k5KU5XP9bn5sd2IjfEuJkWbCe+P/zJ3IeWwZ6oUYoVnS9OROCDWC0zrOj4SdL/XMEqt1
	 D6HoJrwj+HlW+mi/5hXacNeuz1BbccjZttKJf6CnI9kDfUP/Eg9cO2TVQByxmuGsXlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901842;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wOjGh7YVnNY1q9RbqbelKzi1oc2Plj52GOgC/QMbjHg=;
	b=eKJaODQaS65pDRqEjC9JsHa5T6MFbvtzu41Zxrh35c6dzc5bZkc8AfZr0Jztw0tmhqoU
	 rDnoJCz7zLo6MRSMBmIFSnKEPrm1j205Zp+g0y+9ojvlsk09XA322bkFakpn2e650DnGn
	 OaZOjJO69phw8ffwxXw1ycQGcViQrKU66wMyKI4E2cNmGAzq3DEl+kMs1BKZZQuyRE/5Y
	 U64bnDibbLg2GvnWbuz2YefGNw/alH3RtMwWZtZmVD93mYySmdD92fTsU/N9g4Ia78Zf4
	 01PL6P+KgB9LfCulvE94rZ6P1Q4ynTnkhYlO+f/4/EX7a3a0esMNfER7KqzjwCz888g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ggl7o2hn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE63606A31A
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 04:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ggl7o2hn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 241701F01828;
	Sun, 25 Oct 2026 04:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792901842;
	bh=wOjGh7YVnNY1q9RbqbelKzi1oc2Plj52GOgC/QMbjHg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ggl7o2hnkAQB3+1KQvPiLdAc2/tBvaPehigBWd8ZJWN9MbiKP2Tvh6+5lQHYz/yHz
	 MZGMedVvUmo5Za/BenPncDFhdXFUBGSsnwBHkoT+7xi+qZEFpTromOJzxbwxsv8Eeb
	 4g7abJ0yHhKFFWh8Y1td6g8cLq3Q2YvxAqSOEIORfCBDqy2tIk1bdC9nbb8QY+jFUV
	 +so6dpofh28QoPsiP/UWvH4u6RjSPW5UhDxpfuO+aFiQlT5wZZr0qS0mxBFr1lGaaG
	 Ag9+I+tHkhV97PCnMw0sP8fmoKSOYwfll2/L8Tm3NdS+OxCex+NENoaMK2sq7mfyWw
	 KwLeElquVVB9g==
Message-ID: <sashiko-outbox-184048@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 16/31] hwmon: (pmbus/lt7182s) use 4-argument
 i2c_smbus_read_block_data()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-16-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
 <20261024-hwmon-i2c-smbus-read-block-data-v1-16-e81941ad0cd3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 04:17:21 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Pass sizeof(buf) - 1 to i2c_smbus_read_block_data() in lt7182s_probe()
> to leave space for the NUL terminator.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hwmon-i2c-=
smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com?part=3D16

