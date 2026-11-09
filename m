Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213696;
	b=LdrzaD7f5k298m6xWPIqeDuHCR2UwqTtOtnSJOm8q2UvQ/7sp7M5eCEWOKA0jluS1L+N
	 kkR1KLPADF7BwJ3HBvoiUpRBxGoGVImYsrar1ycYAznpmHyxv9COTIitfFCEt8JSOdGmg
	 55HSIvDdpH4+CpF6k/SK1FpYHU26WjWAsH1KZZJaju3ZHEWfXho+ZADHpIqRG40eBPcw4
	 vpRqy13e5CLBW8vt4u4BqUSOHRvss7GGWNYVsz/Y9teoRrJVW1cJBfLfiz6pFfvZ0A0Bz
	 68aJ7BviabECW1FFyhXOJnKO0yQX8re+Y0Mfn6URgd2jzARD5qxkFnni2cRcDBrVwYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213696;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HyDygZwp+rel8KoO43yeG/Jr5GAM4Btmk+k5iI6sg80=;
	b=yDJOW1yIPHbVx5mT+MQJWnX01s22GbbFyyFQZFmTIYupeLHO+NOVusL2kDBvm8c/9wSg
	 T+fqtpsc9MCPBYBUHv+n4jAUP9cHTQ9VOcoMKeln8LORGmmd2JOKlUt2pFKgdAHTiRsrn
	 FJi75SZLUnMDvq4UtLUbqWfgzJY8Jh2/D8wswpB+flRZkInIM4f2usZ8qLMNcIl6ph/U8
	 armGgZJUmAya6PTGF5k8cVL+QZ3y6gczOzYOg5nLKfwxKbp82Zq5kT1WblI+t3IDLTr+J
	 0B6YScfYHmzfezFQjdw1cM0Cy4YWCZPe1dTcfB5aCXZKv/Mzv8WQ4tNXfykQS0FkPkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UDyHX2LU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B29606A322
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 08:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UDyHX2LU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F651F0089F;
	Mon,  9 Nov 2026 08:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794213695;
	bh=HyDygZwp+rel8KoO43yeG/Jr5GAM4Btmk+k5iI6sg80=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UDyHX2LUiEufQvD343A20+/xnf5BLOrLHVqLj0XcZE5k0Z1RQ7LGX2rnlKaRkn7GV
	 86XFh3KldZWu6eyOnY6gfiBbQe9iOFYUNKxpS42VrMl/gvpAMsj6CtyAGo0sSoGE6N
	 5ZQEiFEGjbHmvwWgVqUm2T3J3oRznDd9UCwNPbl5+MPjp0AT47Zc0FSIp4tS9nGOcU
	 xrSaouxRGnLZ1KIOTm6PK1rWbcFBzsfF5+/QrpEeM03pQeIrmitWY6vw/OcNdTNvcO
	 A/fkHLK1mqIf5WqghZqds4JvDRipojkiP7cl5Gs1SNehSNmv42PBLRl6ymI05Gu9Xc
	 sq/KKxov+Zn4Q==
Message-ID: <sashiko-outbox-204602@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (scmi) Enable temperature sensors using their
 sensor IDs
Reply-To: sashiko-reviews@lists.linux.dev
To: raoxu <raoxu@uniontech.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <AED18609B941BCFD+20261109082854.3739085-1-raoxu@uniontech.com>
References: <AED18609B941BCFD+20261109082854.3739085-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 08:41:34 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> From: Xu Rao <raoxu@uniontech.com>
>=20
> scmi_hwmon_probe() groups sensors by hwmon type, so the index in
> scmi_sensors->info[hwmon_temp] is not necessarily the SCMI sensor ID.
> Passing that index to config_set() targets a different sensor if the
> platform exposes non-temperature sensors ahead of temperature sensors.
> The intended temperature sensor can remain disabled, causing subsequent
> readings to fail. If configuring the wrong sensor fails, thermal
> registration of the intended sensor is also skipped.
>=20
> Use the firmware sensor ID, as the read and thermal registration paths
> already do, so temperature sensors are enabled correctly.
>=20
> The patch was reviewed and the commit message expanded with OpenCode
> AI assistance.
>=20
> Fixes: 72804d1631b3 ("hwmon: (scmi) Enable sensors to assure they can be =
read")
> Signed-off-by: Xu Rao <raoxu@uniontech.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/AED18609B941BCFD+20=
261109082854.3739085-1-raoxu@uniontech.com?part=3D1

