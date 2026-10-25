Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901901;
	b=qKnYpn10sdNt+3HclYBnMoWuFFRnRaHa3JWySrot4ZXx6HmRUdyrr6FjitoOmrJxNS67
	 NqErngxZKMGQkAQEMQGJ1ozA8ijP2XSwBR2RXhGmlX8rpAvDNaOIJrnbls+qYk0tBwt7d
	 e1hVp0UNc+GJI/OdfyHgv9YQTiN/ceq0psMuM1aqhXTrqg6XQm/znK7JI88Y4J9VVU2Tw
	 lJ1cmLTYRD88NeSQGwnGQqURhNxnXJQDfLLuehWa+nUFg/ZKTMYzryj1Uj50MrgI9Kefn
	 h0JAbOs4iJUwPhLlks1kQRdvDDPb+Bs105ljA0wwHZauuI6kDqM/2CWx/cjZgToZlzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901901;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=v7hnq944XNoEfbtbXMSTCSIJTNizt3oAv3+y5FVOcBg=;
	b=Zx2KH5N96Q5MWoRKjFNAjQJoSyrmbWlo5/KJuQGOpHJyZvZQrbdst7GmTPyoqrbwAWHY
	 0agVJ2H5hKeed8VCi7XZg1avVhp8TCgoYm8YG0Qbi2EUo1FjPnC8u87mCLO4z3Ttm1dCL
	 IEaBnabsENmC8eN994lyked1aNPcZ4dZgIuH7wZ5Szr1+mvdOrfpOJoK/QDseivFZYMw7
	 q2ZHao7l1dAW/3b5L4RQbBtzM8f3UvLtulpurEP98dChxxTUzcufYAfIic7iQ0e+A7HEi
	 C/ipsU/OoHq6AprBO5qEp3KjXrWUbTuHZgfSg/0Ugj6oT0PcKU+a8ZR+x3wP1tDp7aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OsVM3j9n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4C2606A31A
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 04:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OsVM3j9n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 783451F01825;
	Sun, 25 Oct 2026 04:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792901900;
	bh=v7hnq944XNoEfbtbXMSTCSIJTNizt3oAv3+y5FVOcBg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OsVM3j9nUZ/z5u9UWzuKPJYRs9liHb5p0XJcBxRNGx75/70mfBzEWdImdzLNK5og5
	 uuhjdBz2WlBJMBEXaUP3xnBDsnSXg6kri3xFarVuNEbXH4xVOnWN9uT4QQuS8iqDAr
	 EoBzvvVFlXGr2Nnpw2p37mZk0wwRUITf6J80dmM0lc9Lsxrq1UOca8/JhgFnXb9M49
	 pM1sGBm2E2OCrc5558/RYnt7U/l3LUN6Vt8A4bpEK5CHgPt5VYV9jTySdSL2BjDZA/
	 MabKO4FHmokgf49n/opm6KbSyzw/H1t6O1oSMN/+x99k5aA/ZDWaRKK9lPgBRQbjGH
	 ZfZ2OP25AJCJg==
Message-ID: <sashiko-outbox-184053@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 27/31] hwmon: (pmbus/stpddc60) use 4-argument
 i2c_smbus_read_block_data()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-27-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
 <20261024-hwmon-i2c-smbus-read-block-data-v1-27-e81941ad0cd3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 04:18:20 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Pass sizeof(device_id) - 1 to i2c_smbus_read_block_data() in
> stpddc60_probe() to leave room for the NUL terminator, and ensure the
> buffer is NUL-terminated before string comparisons.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hwmon-i2c-=
smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com?part=3D27

