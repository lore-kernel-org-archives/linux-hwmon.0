Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D771224501D
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 01:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785891865; cv=none; b=cjAR6MNLhxHf9nTXvxyq6+gQqJ3/DAbn5T90/19lcIvCjrHxiQ8tyiRVVMRtZHeZSRjbl8kGgjxM8fU1pVqFQjeVx9hebaR0KU5Ve6Hwn3n/XY90McjmKgdcu0MvUgntza4jo96rOOJL1YD7ZtRShNmJ4Ncy7drra3Jnqcf85FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785891865; c=relaxed/simple;
	bh=bjprX559oV8sumunpgFCCRIUnm7guOtODvyxYhpVJ2A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ikPZvjplPtw/pcSWVHynx3lz0LnYHOTNkRNECcsr/2iSkp9GYBVZezX1CBS5eOWKbtBKplUdyWts8bSqFURNjlTE244adXBwBaFXemXxSSYs0Uhg3Bcb+KAN3Ud9Rrff5UayiWOBHn/1EXUhlXOwUAqVwxSaLkUilb8v1wBJPR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bYJ6qOkC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bYJ6qOkC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C82E1F00A3A;
	Wed,  5 Aug 2026 01:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785891864;
	bh=+uAuZhXBFz5AtE9pH9xci+5Uc5Zqq2jR9XRZFKFmkvE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bYJ6qOkCsfqiyEEUoUUipNIyJpGhW/4R7EwVcnSvmWin/5EqNvEGvh7/rFk5UyItC
	 s/ZiRtfrwEWpzpOCBBusLAe0DczO7P1l3JrQM4Hcua3PDfQU6U1mgK+V1YHi7vDDP4
	 xIT6Zj/4yx8224ES6TQItpzM8KsoZQ4vrIsLqqXEn+evvQnNX9LrSf+m34z3aJeQGC
	 ViwuNtlZ8M3qTOmUG6vHYEGJ2PAH8TNTEnajlTq2Zspr+ArD8umi8bNCVJaUKU4sur
	 2fA79OyaB7iJeNXjoJ4Kloe9FaXuMp09JaXOkXl3lPs0vfjtEpfysKyUh/CmpcL441
	 2xddn8vSyZ/aQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] hwmon: (ltc4282) Clamp negative current limits
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260805005721.1566034-3-linux@roeck-us.net>
References: <20260805005721.1566034-1-linux@roeck-us.net>
 <20260805005721.1566034-3-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 01:04:23 +0000
Message-Id: <20260805010424.5C82E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> When a negative value is passed to ltc4282_write_curr(), the signed long
> val is cast directly to u64:
>=20
> drivers/hwmon/ltc4282.c:ltc4282_write_curr() {
>         /* need to pass it in millivolt */
>         u32 in =3D DIV_ROUND_CLOSEST_ULL((u64)val * st->rsense, DECA * MI=
CRO);
>         ...
> }
>=20
> This cast converts negative inputs into large positive values. The
> subsequent division result overflows the u32 in variable, truncating
> to a pseudo-random positive value. When this is passed to
> ltc4282_write_voltage_byte(), it is clamped to the maximum limit instead
> of zero.
>=20
> Clamp val to 0 and to the maximum supported upper limit before the cast
> and assign the result to a 64-bit temporary variable before the division
> to avoid the underflow and an also possible overflow.
>=20
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Fixes: cbc29538dbf7d ("hwmon: Add driver for LTC4282")
> Cc: Nuno Sa <nuno.sa@analog.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805005721.1566=
034-1-linux@roeck-us.net?part=3D2

