Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901821;
	b=YHmnPHfgPsEj1npWpgiSEQiHvot1WDy5PPXIL9Yh3h0bS943oVOvn2cZMGyYQlLysqmJ
	 pkP3hSvlWyyTqdMRMMjUEOkFtAHM4pPBrcZN0pV3WGaJi5WV9DeuFIJ5gkWVvdq47ES9X
	 Wzulht4hMZOz5+/rbw+MF9/KDUUkEp+jKQj4v1vW/Qh8RSOpz1HqBVpx9PJsoh/JUvwDC
	 Prq3Mo4fb9E++eZOPkvFLoMmYsSSEn2RmGLOnJS5R21bnmxbmEXOHk6x0P+qI6bxvWg3x
	 AhFqVgwFYqWs8WqzOOdvgGeJS7RXKfMZ7At447Hwjz5zUmX8Ha5fLtoQZz9b6y957gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901821;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KtNZ9/umpfLlnXYJ1E0Cd90jMOUnb7xmrw3AEcLoz88=;
	b=xSL78oOwpNGNQ+IoG+5vfx3qiClkyqkZsUgMFLQSnPUeA6pMRPe39uDcOBbVWn+c/h65
	 LjJ7VMGs2mfponfCTJDmzWGWXrSTCwy1LW6gh1lm81osMG9j54dJ8+9kZ6lqeLvq9eR/M
	 vkMyHUiZeNIPXHUsm4RUnHZ7iU2HGk5vkWskBcyoQlORY6s4EGyoGt9R0YPrTo+cli7JM
	 n8qv2ViDcxX9BXGFYRHrJzDAYv72IiIe8DFLyrljP+6SUxpTWA93wuIDRRy7+Uq0GPsVy
	 PPXotdEx5VE5su0cMVdQ4/xzPvpTtnKiWIeUHzo8/Fy4gbkBvb/tpT5RRC3z12BPY4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VVgIT7eU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61244606A321
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 04:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VVgIT7eU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17CF81F01825;
	Sun, 25 Oct 2026 04:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792901821;
	bh=KtNZ9/umpfLlnXYJ1E0Cd90jMOUnb7xmrw3AEcLoz88=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VVgIT7eUhak7Hwc5eOQwTyfjgu6VxNPK0pFkhPDrX+nwje88TS9nWyqeSrWse2RSb
	 Ym7YlgF8yIvvvHnB3O08IHOpPsXC9gq+qb380JI84AiEsz1qKiAHtOGAYInXrs05Pm
	 l74yg7+TAj71rmJtltZelHrevxUaKkRJVe1Cb/ZDkaTX5ycww9OR8MRHP/4M0/OCK9
	 NORg/LfOk4kl5mTwneD6BcJyWQkjlwRKRUkjT+Ks7v9wsmD5yiNuLXmiZC61Qd/ga0
	 3A7ov+KHUHPNYVD48vPz5GYKwgsPVFxseww2taPwDnRT3KqBSTU2l5vpFSc8kpywTM
	 TXKXFnycwiP/g==
Message-ID: <sashiko-outbox-184039@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 15/31] hwmon: (pmbus/ir35221) use 4-argument
 i2c_smbus_read_block_data()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-15-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
 <20261024-hwmon-i2c-smbus-read-block-data-v1-15-e81941ad0cd3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 04:17:00 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Pass the size of the receive buffer to i2c_smbus_read_block_data() in
> ir35221_probe().
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hwmon-i2c-=
smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com?part=3D15

