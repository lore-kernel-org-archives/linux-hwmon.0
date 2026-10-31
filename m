Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793461113;
	b=MQMVitP/im8LMFEpab9dHHulxlcDharVO6a+aNdg4rDXO0E+Pk1Iv4wyXn15969yIcJ6
	 +BP7h7P5llZnXw2/nvv3NpFF9loZRaN7g6bUp+6U3Qu1Dt1Yn12nvST9460G3Pfkyn6qT
	 HzdMegyvPTJdhnrNjJfNbsJIhuQgmbYHFU+nTImMWvlFhfRHezJZHx9xnLSs7KlD3xXzF
	 fX480IoCMmgekiXe83rd6y0/N4U9TDHpHvnaoJ/yzCQz/yXY4XWPC8oYSjrrAxTHpTSd6
	 rKWGI1bBzT34s/XUBLKLWQTKw+LJmf/XzlTnU2xXLT+iH+4JeNgE6bQO5rko4sIkC6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793461113;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xt6bsYioNSQDhniPm5sIRLVwVFKsTj4CFL1lYQnhiJQ=;
	b=Nnry66FzWb0LCMTSDO/mYRnTbkKUAPGCOr4SsJ0kIgadviOKz824jHIshThUE89DcBF7
	 6+MXVMC3uhfhjI/YKeJ/xDCr+35JO2LE8OwtjqOQ/nqAmXjwMBhJGi9UJ97aoHazNTUeK
	 hmJXb6e6zx9JHuK0j2c1whax1pkl0cYJwklkyiOqTzOi40+54wOYbwyFg67hhFqQUwp98
	 5lOstTP5ZWdMVqFkQq5+h3nK9SpiutckxMokNfTtRjsy1Wl99o4bW2Af0M20lrxOluQ+4
	 /beRQkU1QTxrOOGV0FAWv7P48ZYzmcpux406r15PN4u/GAJWieh0xpSW6beZmIoHtvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gz1Jrl9Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91955606A31A
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Oct 2026 15:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gz1Jrl9Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 228801F00919;
	Sat, 31 Oct 2026 15:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793461113;
	bh=xt6bsYioNSQDhniPm5sIRLVwVFKsTj4CFL1lYQnhiJQ=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Gz1Jrl9YH/tcYwIBcefuKwgYwcKApB9gTYz7hXL2swnyz+OXSIX/8990/lSH+LVHc
	 18xBu/aYXd8eY97QUtcgAceV86HAh5TAAHGcEO5tGf6X1w1f0NDTLlScl6E95s7k5P
	 jVYXt1xHxfUvec+lAuPbLG93UXQu7guK6lR73Ps9plu3YDLmp89C9Ddi1Yf3qfClG2
	 zIV0zpMbZ2AMWbMJ9nEB4VPYtxgnizonY1+JGwCnsAkFhuLayCg62g+7C5BlyA5iza
	 yRG1faEnwrDEGcl5znvudsQABVAt/tcUtf6GwCRgAD7mbe3dDX9y0VPI5NryXRJj90
	 npm0IR2p3lPcA==
Message-ID: <sashiko-outbox-192023@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] hwmon: (coretemp) Fix 32-bit jiffies wraparound in
 show_temp()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261031153528.3195123-4-linux@roeck-us.net>
References: <20261031153528.3195123-1-linux@roeck-us.net>
 <20261031153528.3195123-4-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 15:38:32 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> show_temp() rate-limits MSR reads by storing tdata->last_updated as an
> unsigned long and comparing it against jiffies using
> time_after(jiffies, tdata->last_updated + HZ).
>=20
> time_after() relies on signed long subtraction, which only produces the
> expected result while the two timestamps are within LONG_MAX jiffies of
> each other. On 32-bit kernels, if tempX_input is not read for more than
> LONG_MAX jiffies (~24.85 days at HZ=3D1000), the signed difference flips
> sign and time_after() evaluates to false. Because tdata->last_updated is
> only refreshed when time_after() succeeds, subsequent reads remain
> blocked from refreshing for another ~24.85 days until jiffies wraps
> past tdata->last_updated + HZ again, returning either a stale cached
> temperature or -ENODATA if the sensor had never been read since
> initialization.
>=20
> Store tdata->last_updated as a u64 and use get_jiffies_64() with
> time_after64(), which does not wrap in any practical uptime.
>=20
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Fixes: bebe467823c0 ("hwmon: New coretemp driver")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261031153528.3195=
123-1-linux@roeck-us.net?part=3D3

