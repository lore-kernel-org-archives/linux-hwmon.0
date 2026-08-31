Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2387B53FD28
	for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 15:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189991; cv=none; b=s3kvrAQsr0CikZOqzmEF3Es+dr/Tg93o2HF+C4ql0DxFncVEyyLzVMGMPYE5J/6aukl7IvSIDCFD7Li8XvAd1Nd86PWR0kaHdWc3vel3lSDjY7KTHqfxTZysi3TQuDSV9O6GVEhDal6sltNu5dLwZX0fTyOCBkb4s4h5+1nPnek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189991; c=relaxed/simple;
	bh=eb5qS76pOJF/UVlj/ZeUouM/oY0ocwUbPC17e0DHgrQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Sn3eWbL5X9XSTnnpa9j5N464bxKyLkXyaj1UUgeb/JDFxo+2TsNuJCPdIfIOvqxzf5FqIk/BwEPU6SQ6B3bIcnM6Te3wg4gAzduZavznh0Lu2RHIfu8NSCiALy8YdsXBTQRHUxHMZt7KAyYYy+7bMim5J79EB38yhZM7xdSYp1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gNsMGOcv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gNsMGOcv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 974531F00A3D;
	Mon, 31 Aug 2026 15:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788189989;
	bh=VLnI9hnDQPlWWzbujsFrx/P0W0AyK+Jc4GA6Ey6EcXE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gNsMGOcvBFmZFrak+UnnbEimYsm4QFU4oQ3OF3u08D6+R/J94+LmdrX0nyPmhh9b6
	 CKxuBMXhLJ5OQaEiixFnVLXpczmO6mbyQuBwSr5hB61bJhl3CfrihwrIZHc0MVJJ3Z
	 fuk3+sBWJGedNtAabmWmvm7kyNJbkGnuQ99fQ8py/RE/AhaJOjB1r9r0CMRDBIwPGX
	 3KtX07ytYuljyUyh3ryYnb1YhCTO4Vz5MnG4L27ML5nHVR3ZwYsmaZAa60ecEc8atc
	 NHMI34rgWhMLHg+d8/4noc3t2XSW2bBv7fUxLFdDZ1lDNO1ToaKIkY7qlhvG0IgAkG
	 Qz+uiXt8j4YCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18-6.6] hwmon: (corsair-psu) Fix linear11
 calculation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260831133314.4125787-287-sashal@kernel.org>
References: <20260831133314.4125787-1-sashal@kernel.org>
 <20260831133314.4125787-287-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 15:26:29 +0000
Message-Id: <20260831152629.974531F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Guenter Roeck <linux@roeck-us.net>
>=20
> [ Upstream commit c6c4234928d2eb4f61fecb61067e612d9bdbd2ff ]
>=20
> In corsairpsu_linear11_to_int(), the mantissa is extracted using bitwise
> operations and cast to s16 before being shifted left:
>=20
> static int corsairpsu_linear11_to_int(const u16 val, const int scale)
> {
>     ...
>     const int mant =3D (((s16)(val & 0x7ff)) << 5) >> 5;
>     ...
> }
>=20
> Due to C integer promotion rules, the masked value (which is always
> [ ... ]
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Tested-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>
> Link: https://lore.kernel.org/r/20260804034811.2385506-1-linux@roeck-us.n=
et
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831133314.4125=
787-287-sashal@kernel.org?part=3D1

