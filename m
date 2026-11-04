Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793763324;
	b=4ebQJ88Ta3MwIYYQHDejh+nj2d8aarnkz7IBFA8sLbCtDE+qogxzhMMyxso+ZpZJGriq
	 3X8DsIT8lme7LI2AsgeyBtUq5kKgZp+coMyT/gl8U1NXGzUflXkn0H1MfSCr2Tmv/E1pR
	 XxYKO5mdVc+Vu6Kpj42RUWbyX18rmdT11yOnJP5QX3KaSk4XJzSD421Vt4YxBZS6S8RzO
	 8xVcDvlVlm/2lEjRwAbMFMgx/7y9indB9lwsGM5bXpJ0Ovm/qLl0R08R9vjvzt37UrB+c
	 2Hx0qy3VqmopGg0UGFtus1ZwfUD4Io6rfQGEtZGJ9DuPg0ateRCTqKn0F/VTvgJBnHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793763324;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=33lXlb0RxzLXK6upjltCYhV+FTRkaI3XOn/p2I8UtaM=;
	b=GM2ceAcw+fm9sQV70jQHhlePBIDy1Ch4oNSLcIM1mizZq9Gj8oc3wgHhZ+NdyNLY8oyC
	 Dq6rW4Udj7MfxlYyTwksBQOwZvB4ljnZkWzaxm2hcvgLYDKrt8hJBFuoOqofUAMukDmlZ
	 BY39T1PRwudNIFsLPhrR3o0P6styg2q67vJyD4R/VWy40vZEovdxCOT0kH9bRtWasIDve
	 F1U6TvWbyklPVfyi5li9sdb6fiCDyoL4GoXel9xKEgpfxGvMiNbBcZKH5nI36ou2Fv4OG
	 IRndgVJFUZcpNWdNkWE4sQthwJUpO7tGcZIahARMjB1Kq2HpqDJYqFM6V1p/zearG7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A0JlzS4x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A62606A31B
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Nov 2026 03:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A0JlzS4x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54A091F000C1;
	Wed,  4 Nov 2026 03:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793763323;
	bh=33lXlb0RxzLXK6upjltCYhV+FTRkaI3XOn/p2I8UtaM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A0JlzS4xw2xSw8N+r3StDmptTbHI3rNUXVE37dKeAyMjZXESVh4bzcM+8kWeI+9nB
	 kY9znrBdPu0OEWSh+bTgLyQB4EuJh4jEOPJIq/9KPSA9Q5eBZpZsWMko/nWWz6+MzQ
	 fOD+RIKZo9aZwafSREBLUVlfl52M6aR/NQxG5hmKKXqj8sJR5oHYLBxEjFfHT3eELx
	 tTy24DXHigyYEUxw3vNtZUQBBsQqDplLfmF1yJPqjrvgtYOt/+yZriSz9D+2LC50U+
	 fVZXyTocWiYNUtxeySEH79wb37NygTCVcB/SwwDArNr+L0R0rIGmLKFCyUYogbkHf9
	 bpW6yX8Wg2cSQ==
Message-ID: <sashiko-outbox-196613@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] gpio: gpio-ltc4283: Add support for the LTC4284
 Swap Controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261104-staging-ltc4284-v1-3-49fce67ebc48@analog.com>
References: <20261104-staging-ltc4284-v1-0-49fce67ebc48@analog.com>
 <20261104-staging-ltc4284-v1-3-49fce67ebc48@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 03:35:22 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Similar to LTC4283, LTC4284 has up to 8 pins that can be configured
> as GPIOs and behaves the same.
>=20
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-staging-lt=
c4284-v1-0-49fce67ebc48@analog.com?part=3D3

