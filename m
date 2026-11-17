Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904296;
	b=DdQswLRsOMWE6SNjV88WtFpXpDRScRPb1XYr8R1ZM1b6CgferCXxxnLoyF3zJp/l+kq1
	 s/TNW111okhhXoe0/i1CE4bPWq5lMj3x2nS19ZLTOM4JmhLQmgfvCn25ZfjgG1BGtWvlj
	 6tgoWapKXgAPBpjL5UrdpvzeTekj9T4RewIAfbHQx4rlDaDJ49Hp2RyHTF169lR+NIQSB
	 W38flC1puVlPIjuytFgt50IS1XMB3+9ooxnsP3dY2aDKTXt8vVodBN/t+HOdWcX6cUgeN
	 tRUo1ObVK11YxnAcaeW3B2v/vr6RiBiGyGuA8mDdr3EiQw+HGjun7Jgttm+XomHDC8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904296;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Q91YMaskWw0CPxVZFQaDDaPMe2rTNZU+WRYrFd1vYwE=;
	b=0JFW3zG61DW6fHd7kbzslMEpFuT7g6ED05P7zhRHSfuLubdMXb4ScuwEReUa0CGJFFkn
	 owCCV+XFlzhDOnIRtJZmYDKcf8o3fCZxMeqJHiy9PbatcFNsqx6rk7u5cpXmdg41AjRYi
	 STL9WTw6sa392iyr1z+Ip+I1G6fm5QDgt4Azp1VaHYX9ZdiH+nlqvAfBZtNK7COXkaEeZ
	 /WzPuNZbqJvm74YOZ3I2aME1LK/noHEF/xiOMO3sllD9l4v1AD0cAzSlzFLVAGbHfOFSQ
	 5Yvil6ALQ+UIeYxsEgV0c1wVH92fRN3qxYI8xaxCcdvKCIJU/OC5docaZXjIQUYMZSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XRAagsnu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9860606A336
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 08:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XRAagsnu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70D691F000C4;
	Tue, 17 Nov 2026 08:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794904296;
	bh=Q91YMaskWw0CPxVZFQaDDaPMe2rTNZU+WRYrFd1vYwE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XRAagsnurt/t201XYngIaZv6K8YFbMpWLEi6FuWpx/gzII6TV8ppZpVi6qabeB/Xa
	 dlw2Dlm+tsx8Eigs2rvFgDGyN7zug33Lpa/CxH8cpAfQw9tWZONN5PnorhKSJR/NeP
	 0FOwQFEZNwraZdm82noksf8HKygykACCvZMYYWsGXjaw8NJxOUvhP6gU96P2dso+g8
	 84OrQfGjjPRwKGKYYz/RgweqOUJR//xRWs9zmjFJ0irWQ06TvbHF+WafUBNiCmgORV
	 ISGgiq+9aFm8ABz+wzm7n7PdRIpi+Ywe4mqthns75vpcVcBcEotQ2G8o79vkYTI0PT
	 kivWl4qxGrQaw==
Message-ID: <sashiko-outbox-218416@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] gpio: gpio-ltc4283: update Kconfig description
 to include LTC4284
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261117-staging-ltc4284-v3-3-326bb844e08c@analog.com>
References: <20261117-staging-ltc4284-v3-0-326bb844e08c@analog.com>
 <20261117-staging-ltc4284-v3-3-326bb844e08c@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 08:31:35 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> LTC4284 shares the same GPIO hardware as LTC4283 =E2=80=94 same pin count=
, names,
> and registers. It is already handled by the existing gpio-ltc4283 driver.
> Updates Kconfig description to reflect this.
>=20
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-staging-lt=
c4284-v3-0-326bb844e08c@analog.com?part=3D3

