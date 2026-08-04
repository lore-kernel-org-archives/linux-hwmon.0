Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C304B3D0932
	for <linux-hwmon@vger.kernel.org>; Tue,  4 Aug 2026 03:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785815744; cv=none; b=ZfX+pqJ06/xKbNy3/8O1EOvjwyhjC9TOtZ8i7QcVZDDWHTzvvkf26gdumoyky/QMLo+yqGlJata6p+eRETYQacXsJOuOCwoBaFta7nP8RL6eIWaE2rQ+p2TFnPEwhOBqEqENY3Ii85W7cdMA01G/A40fIZw1veOiEOQ3O7RBXA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785815744; c=relaxed/simple;
	bh=u77TVoHynM5I8rTRNwqginkS/T8YTFBmYsc/nNc2gqc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LKktjMuyZysJLy4xQe7wafAkpEpXukufhqvTXik0AxkYpnwHo8yBuGFWZx8EM5+O6/hrKJDOXjnBzd9HW40LsD7AgrEg1p+7Rrk3LPI0swM2SU3YOZ3ZZDpacja6hOq630kwV1Rm6aaOg9wN0PKVwk8TYRJB4LWS0/S7Vs11Yzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BmhIDMFs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BmhIDMFs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47AB41F000E9;
	Tue,  4 Aug 2026 03:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785815743;
	bh=KIMUMtkpz9e9/xDHBeCC3RkYm50LPbOQtewx48un/QA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BmhIDMFssr6VcqfJRqbNR+vw/2V1Inb49B+4Ot6D7RsA0lfo/ifIEAQxuKvPAdsLB
	 cVaX94Is+6c9H0tn4eoIMX1y7bS7x76IGwW1ZRoFDb+QA6anULzB0qx8NApGAO8UNb
	 HrJB1S0P/cgXHPj2Jhf+WnTNAWkjEbiRCCwobqJ8WzHEtGSXCkYpYtAsgAfzlf4GCx
	 Mobg0RK3hF7VN47wVoT5lMGLzhmFvM50l7sas9Sr+JloyRbcAPqulmtja1qwJvXZZy
	 D+P+IwakuR47Tazuv0abvlyJt6t+t0WucG9v0vo67Q0etkCpVnX/7N03T2HB1ASAFZ
	 r6yyRyXmjED4A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (corsair-psu) Fix linear11 calculation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260804034811.2385506-1-linux@roeck-us.net>
References: <20260804034811.2385506-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 03:55:42 +0000
Message-Id: <20260804035543.47AB41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

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
> positive) is promoted to a 32-bit integer before the left shift. As a
> result, the sign bit is never extended to bit 31 of the promoted integer.
>=20
> When the device hardware reports a negative temperature in Linear11 format
> [ ... ]
> retaining as much information as possible.
>=20
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Cc: Wilken Gottwalt <wilken.gottwalt@posteo.net>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804034811.2385=
506-1-linux@roeck-us.net?part=3D1

