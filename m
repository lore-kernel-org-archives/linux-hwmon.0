Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B425637B00E
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 21:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785187462; cv=none; b=reT7Cf3xRNmPZcJeMj6KqBzoleUicYN8qCERuSIB0OhhGbqMKI6aw+WhCgGkCudgotttW9svs9SFGVHk1VHgWw/faTXkqwrBh8o7i6k6vifaYGVoarMg5cWHzt6uRoGMAao3ZQL6C4bk5meNgVQXyZ/B8J0hWBkJk6ODJFUWfng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785187462; c=relaxed/simple;
	bh=GDEDn0GtYwSYcdnqPJN5ZV8igzdcSSoDDyLAP1MBG4o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rBEI8THlnaGYAEidP3DVveFg4UpiJo+qrAuwM1MKc33agb/Ln8RhRtd/Wq4Q2n6cJPICnZJFF/R2t1ZqQ9tjPd67OfGHIGY6ENghrawW5xmi+tyi6xTBiG3TcLZZhsJ3D1u5IWWumx4LTPzKFKntXhB+Ng2LKE+JkoW1t3t9CzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=by8r/hYd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="by8r/hYd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15F7C1F000E9;
	Mon, 27 Jul 2026 21:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785187461;
	bh=GDEDn0GtYwSYcdnqPJN5ZV8igzdcSSoDDyLAP1MBG4o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=by8r/hYdSFl+G2QuJWbKLq3D6tCIAaj3rO1i9zFET5rGaaNPKWQZQWi7RKfZ0PD9i
	 hseOPij+tmlahTDLHOyW+VSg2lF6nk93JE58pTmpBfH0UJWPHsDI1E/YlVpPXW+IjE
	 KuCRY5/Z/Kq3sTaFYTJ1sPtE/CzKx/ayjCLdNjz53VKxkNYq8YbhSzm13YSC8VaUR0
	 iR86mp3uRycyDRYSIsAA2x5jSQ1SV8b67B0ax8Bqh1o9Ck1O/z767zCCfM0HlGeGWA
	 /kKv7RyDl3HnDRj+wxB8/VKVa6TMAFRGLIek223eUUzSkkfzlD+v87oHgoAAiNdN0B
	 /CIpVDsiJ/UQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (lm63) Mask PWM frequency multiplier to
 supported bits
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260727210457.3720204-1-linux@roeck-us.net>
References: <20260727210457.3720204-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:24:20 +0000
Message-Id: <20260727212421.15F7C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Sashiko is concerned that reading a PWM frequency multiplier outside
> the supported range of [1, 31] might result in bad PWM values written
> to the chip. Technically, the chip should never return a value with
> the upper 3 bits set, so this should never happen. However, it is
> unknown if there are LM63 variants where the upper bits of the register
> can be written.
>=20
> Mask the register value read from the chip to only accept the lower 5 bit
> when reading it from the chip to avoid the problem.
>=20
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727210457.3720=
204-1-linux@roeck-us.net?part=3D1

