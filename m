Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631542;
	b=j4SeQ8fQ3J/pp+Avbeo+n4ig53+VTuVFexhOHpcx2H9WSf5oER6c0CH36BroVFqGAVHR
	 d9CI9jEIczs2lFUqufrYBmh3OGsSr6rXwW/Qpd5DKDjMRBC9Rua1DvBKLYPi6TUF9Op55
	 NmSJjAyJm8Q5GGbLML4ktak87/6HTqejPTwpxyKatdVIoO/uZ3+JtU/GfSL5+755AarX4
	 12CMNflpMtRXkSYw+LgN89BqBf16BvJT8N08YJV7c5ZGrTzTJGsbqvfDu716eMPLMyvn4
	 S7KA20hvcq7pQ/8NZbSRGvpFIDBvQlW1BlO5k7HnFWraQqai4o+kSLxS2QC1+bDEN2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631542;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Dv597yS4H1oPJctlJvImKkvY8fbTjE2SGemjSG/ArLc=;
	b=eJehaXa6KfOpAsjOh7LSdN0ZyWmiPKIUh3iY7WS0Qa3AbOk1bhqNOeV/nSUmM1OCALxm
	 t7g0GZ73xJAJ7j294hhjGKI05vQMuqSxTEx4dc5FI1NFUlzMMgpb4+2KYghaU35pxQxtp
	 zdVAG4oiTvKHYbsCT1M+6NZEjy6ZtSzcLSMU0X8JiRNUZkyLLKp8m4ic5LGrTaHy7rUF1
	 fAmQej1XesobIbOVq7owm4J0AN7TCnInDTaZf7ZR4P597MseIXqAd2lirIjfsvtGT0NVa
	 u2RSGJiotS4n+h0tWVqgu1P4IYpYFE+zv7wpyCj6NtH05rGXd8iGVpyHUA4jYHPpiSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Jh/h1P7o";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0E3606A5A6
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 14:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jh/h1P7o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49D0E1F00A1B;
	Mon,  2 Nov 2026 14:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793631541;
	bh=Dv597yS4H1oPJctlJvImKkvY8fbTjE2SGemjSG/ArLc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jh/h1P7o95z0qppKiOhFm7AcjYl4LBQXiIgDpK6R5JcVUVEBJ2l7czpLtAU9C6e3S
	 xi+2JCWHdR6sp4HakzOUvWdPZGK8nRVQn/8AJC1oJA+JesGJhB4nDy/lgblDGGQJZV
	 yNovi2lr3kC3Rm18OusYmcQkgKnyl8Rol0LCJLkwWf5t2zplW/IC4ZEY2FepIGsMVs
	 T6sWIsJNIU5JGOtuYUwrFjDnM/DofnprmKL3Hk0WrnGM4/dND0e9VT/cCLYAksO/bd
	 tM5Ncfwkg8YNdJYNlgc290elfbyehisDnsQttALVJg+zYjrpMEi+0PngRF4sv2LlIu
	 D+VaKFw2y7Pgg==
Message-ID: <sashiko-outbox-193621@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] unaligned: introduce be56 unaligned accessors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261102-topic-sm8x50-iio-max34417-adc-v5-2-0ffa5e5f2d5c@linaro.org>
References: <20261102-topic-sm8x50-iio-max34417-adc-v5-0-0ffa5e5f2d5c@linaro.org>
 <20261102-topic-sm8x50-iio-max34417-adc-v5-2-0ffa5e5f2d5c@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 14:59:00 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> From: Marius Cristea <marius.cristea@microchip.com>
>=20
> The MAX34417, IIO driver, is using some unaligned 56-bit registers.
> Provide some helper accessors in preparation for the new driver.
>=20
> Signed-off-by: Marius Cristea <marius.cristea@microchip.com>
> [narmstrong: update commit message and move to include/linux/unaligned.h]
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-topic-sm8x=
50-iio-max34417-adc-v5-0-0ffa5e5f2d5c@linaro.org?part=3D2

