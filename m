Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380663;
	b=dvWJ2r+uYLDeY+rgJwSXciiEZ5uJI9/ZfT5IUS7L5853RotFPvfjgBH12NQOSDYQJds1
	 YvNGY7N3lI1wGnLwwZb9F19gnN7YkujqiIHhj+AU1lGnXAKd8b4nBBdDz0ZvxXvPHbyDg
	 AJmEtfVybrHz0BRz2Z+jfKXBfytP3KrOMwkf+ZyVjSNDsEd4cJErPT7Yj8uwoYxUX8MwS
	 TPp4Aw52B+Ts5nNcbdFKxGWuH4OYKW8JO+MXiXHnNjuW5JLk6jTEWv1bB5OVY4riY7Oas
	 GQXhGkuciFw+ZcmyanyEBhheImBYCL2x6ZHOm7p1eEEGWRg297fnXw3xcfWgTye8+Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380663;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rPrGiw2CS+S81O5DLqE2xwB/yv4ugGxP0U4/IAcqpoA=;
	b=KM/VME6AxzEar+swMFdt06BoAXf3NYfyxe5Pyrie9NpZwqwaRONOmLdMrR1D8H/9qJ3Q
	 ycKqWftDOV1d/hj20Mw/HZIaZ/sn04NIPzsXIoGhd7PkRpbkkXcsjgpi27U6Nf3a03WYn
	 n2TnBPuBXq3XE8DznJBzoYAUvgvJw3VIYpRc4UYypHrHw5BFQ84GcccuwqcW/aUF3TC+e
	 bbFNTpTbDGAS6wp3JZmpdU2GE3qsemVIMqZzOra8gQD+I5f5ZA5Xibfd3Wg3yL+jjmI2T
	 3wQQtpe79GaXREIyW/i5qI0A2VvWB7u/WBcy3Lui/cBaH8lHoFjIP27f0vzIIuzChJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AwuqcCGu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD865606A338
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 07:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AwuqcCGu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 631BD1F00A05;
	Wed, 11 Nov 2026 07:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794380663;
	bh=rPrGiw2CS+S81O5DLqE2xwB/yv4ugGxP0U4/IAcqpoA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AwuqcCGu9vV7tQYQUcq+RFtpm2V3Va4RqamAq/RlhgngLsNANyI804cQTkEmA6hdz
	 pPebNViiS1+/YaKm57Efq66e0q+l5+AWiqeQzC8sddT36d9LZTECq+MoUW/hX60i2S
	 iN87W12k1v1yyKc8eby7kqeDqFWnoXfRewk7m0eSiTYQ2HVb+Gk81Fb5efHwKwZFEa
	 UDxlM/I4N41sLbFw0LMM7xDc6a/5nMuXp5M1Z610ipGgD1tR6gNypuC3rVbwjGdxl6
	 6HC7n3wHdhAsa44fbmOt2aEK/LVrMbEz7MEozJ6LDSbA4CfX7UZXLyd3lqgXmdgmV2
	 lc9cj7jqYR+Zw==
Message-ID: <sashiko-outbox-208486@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (w83781d) Clamp voltage limits before rounding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261111065307.17735-1-zhujun2@cmss.chinamobile.com>
References: <20261111065307.17735-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 07:04:22 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> IN_TO_REG() adds 8 to an unsigned long before clamping. Writing
> ULONG_MAX to a voltage limit therefore wraps and programs register zero
> instead of 255.
>=20
> Bound the input to the 0..4080 mV register range before adding the
> rounding adjustment.
>=20
> Fixes: 1da177e4c3f41 ("Linux-2.6.12-rc2")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111065307.1773=
5-1-zhujun2@cmss.chinamobile.com?part=3D1

