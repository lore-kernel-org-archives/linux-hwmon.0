Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193798;
	b=g1Kr6LDZxvfE7V4oY8EJS1+s43RHQ8YcAQZEAQg7rF271FVLZBKfN244DGg5n69ep/qb
	 dfetoflDkgYhGTbB4uTZUi0A4zV528EP1SR8OMPW4Tvgu17HH7gU/traNsuAhtucT07OG
	 MVHHWQZVWI79k4elAl0u4yv/lpDqNJ+ig8Sc7GsxuRg5I7k8VhL5thHvOKkPilwW/8oPb
	 pLiZvPhZjFrak0vWmTMk2op/XTg0vVt1jp8va2dY5SDXiRmbc9jA/oleQVXADNt1pA+9m
	 E0Ng0BDC3RnYlawEiqRL3+XEnROEImsWT57aW/80HmeOt1KRYzKfuR8NQLoVW07+saw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193798;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4yDiw/zUZr941gvc2HodRygiYpEACcTsccJ2mr+QSQM=;
	b=KBfSyqrbSfBkH09pej6Qmz1bgJn+rlbhnMdxBCnuyBzGCBUSIMmPGvJDS2JW89zMDYmL
	 bWYiHRn06d0JMi98JMDhZNBZAzqGSPzXx0talNVLfwUp1TjEOgY/OBtvKO9Xm5C7w/Ik3
	 uRoqFiXKUW7cdjdMM6zdZSILSq2e1cAZE3LTkD5npBCmCk9PVH0qrvpFy103bXnNvSpG4
	 afSEAXPjkLDBfGf7R8Db+Z8Mh2f4CpwTQIbk/HjdP1zmNQfwPbHYM7Qe5jvomAeYrIAj2
	 EVcv9Y4LzwA1Mzy89MYdT8pSbsvqup4wRgxv7NufHhvhjKXID556gWJFRM7nioo3aOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DtozFBOt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40B6606A31E
	for <linux-hwmon@vger.kernel.org>; Wed, 28 Oct 2026 13:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DtozFBOt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 055CB1F01825;
	Wed, 28 Oct 2026 13:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793193798;
	bh=4yDiw/zUZr941gvc2HodRygiYpEACcTsccJ2mr+QSQM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DtozFBOtYD/DX6cD+koK85U5GJCUdVj9PAQjcaPoknOYsznt4jG6B9zDAZMTVim29
	 U6o507aafS1EPNR0KV613pyIBtIbgUeeZncaLRbPHEEzRlJ8t4Dijv2R+meM7MkZob
	 YRLCs3yystxg8MscdhDGJHcllwoqaicEnACuToymu6XLi6r4x0FOjIMznvxi6h4P1c
	 CaiZBfgYpBHMRCRGolqys7IJk58lF8j8oXLOqsoCDr4l+BX9oXN2gzVe5TvyQ+bZgN
	 RZ9awmWmUw2lYgdWY4Oo9lNiVU4XzT7RK/5PJ1BOyHxDjoQCRoKdl9oy4xBfKyL9aR
	 GtcoV2wOIi1hQ==
Message-ID: <sashiko-outbox-187908@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] unaligned: introduce be56 unaligned accessors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261028-topic-sm8x50-iio-max34417-adc-v4-2-d4baaf3ee903@linaro.org>
References: <20261028-topic-sm8x50-iio-max34417-adc-v4-0-d4baaf3ee903@linaro.org>
 <20261028-topic-sm8x50-iio-max34417-adc-v4-2-d4baaf3ee903@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 13:23:17 +0000
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
> The MAX34417, IIO driver, is using some unaligned 56 bit registers.
> Provide some helper accessors in preparation for the new driver.
>=20
> Signed-off-by: Marius Cristea <marius.cristea@microchip.com>
> [narmstrong: update commit message and move to include/linux/unaligned.h]
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028-topic-sm8x=
50-iio-max34417-adc-v4-0-d4baaf3ee903@linaro.org?part=3D2

