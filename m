Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637509;
	b=nxCKl9qUHmeangy5Z8EzqOHkf6Qoy8JledciJv1/EOTvVO53GlmK7EZ2YW3ITi4xQSQF
	 EsIcH49Q48nPW3xPbC98CUgil3OXkKx5FdGH01BMS6HmNgTBhbalHDenA9k5OFwN48r3V
	 +qyDAA9ZcjTED9ktLPrKiJPu202OBQQuZpFd3x+tP203ulEmoUyIpXq1xyGZxs9Gu8qEB
	 9/i7tR6e9uFAQ1Oboez/cfX6bV+mPk7whONsUmvYifq96opYB5bgLBrsamrVCYqIiNK++
	 v6SU/EKI+0oeTF5vYSja1uIY22TRFy2fYiyIFfo37Pz42ciwBMk933YAMU/vHYRxkgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637509;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4ydJj6KzbNEJuL3l3t5zHdqyNMAtDfNuZFfVb651Ius=;
	b=xK2HHhX/kJ3KxqduBphFpRyFJYjYt9SGCi5+tRHiIWrAQs3zKjh/Yq8l4yUQSCfxSIHm
	 tcmJMM5iTgSlqE4J2eJB++xVIecwfF/33a3Zf4R+7p66/cxl8zhf+oDFDaMcDuwyKyRFS
	 Yh3Zed78H9BaNeg0Oreqnl56lb6FIEKyStyDi/xZB5sIpwsctlyMV38v9ZlGPsuRrr1v+
	 RA1+byB00Deekb99J9uOidyuL/No9rkJ7BWbuyLjmAIMTPT7qMjaMdimtPk8NC1s5eP4I
	 zBtP5c3xxvWIUEXmOUFSvcvLihIcLaSRbWR+eyYsjXfpNn2raErJfGaLk8RxC+uSJwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fDw5GvHI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564C7606A327
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 06:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fDw5GvHI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D56A51F000C4;
	Sat, 14 Nov 2026 06:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794637509;
	bh=4ydJj6KzbNEJuL3l3t5zHdqyNMAtDfNuZFfVb651Ius=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fDw5GvHIvJWi6anaouyHHiOAgLux2WX2BuUN53MX+LMZDen02xQI+cl6T7ld4nCAx
	 icaebrKMBQC+qmh6f0UsALDSDgPlcJZbu2PPCFP0YOJ49A6hiqpscJYyQlA+y6RCGV
	 XLqZ8hD67+ue2R7JnZlFLAKAiVWCi9W53b0RAIEk3Mi2Ewy5xPow+Je3XpunfORt7A
	 k+pkw7os3+q28bavlhGGqHlom+B7JOIu6mnePBRh90eIEeQuyTztDYjzgjHCta0A7/
	 MVGhvuWR1JIiQEnMp+iJS3tUQ50D9PwJJmi5U+7oPj0HpH4TAWfSES3vjSLJDsmcpe
	 c3Q51EtS8dXHA==
Message-ID: <sashiko-outbox-214218@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (dell-smm) Reject a fan_max that the BIOS
 cannot take
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <6d3b86acf6713e9286e60ecf788582e840946238.1794633179.git.rosenp@gmail.com>
References: <cover.1794633179.git.rosenp@gmail.com>
 <6d3b86acf6713e9286e60ecf788582e840946238.1794633179.git.rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 06:25:08 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The fan_max module parameter is used without any range check, unlike
> fan_mult. dell_smm_init_hwmon() allocates the nominal speed table with
>=20
> 	devm_kmalloc_array(dev, data->i8k_fan_max + 1, ...)
>=20
> and fan_max=3D4294967295 wraps the count to 0. devm_kmalloc() then
> returns ZERO_SIZE_PTR, which the first successful nominal speed call
> writes through.
>=20
> Values above 255 are also meaningless: the fan state is passed to the
> BIOS as fan | (speed << 8), so the higher bits end up in other parts of
> the request. Large values that do not wrap still cost one SMM call per
> state and fan while probing.
>=20
> Fail probing if the maximum fan state does not fit in a byte, like the
> existing check for fan_mult.
>=20
> Fixes: 81474fc2fae9 ("i8k: Add support for configurable maximum fan speed=
 value")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794633179.gi=
t.rosenp@gmail.com?part=3D2

