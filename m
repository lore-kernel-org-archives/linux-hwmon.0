Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901916;
	b=KMuAp3ddYT0obPe7ICVjLITpGw7OLelwc9WEtsEAdb8dKA3OoSy1u1/05oyu0mb5P2ka
	 7C849RtYEFC1Lgj09fPnxmPL90XRDf38QZBe47Vk4zeY7avYqy2Lothuqt4EFigdfBL8A
	 Yc/FwYCOhsNiO3XJhp+D104921j2GHbNELPkmzthWSQU4UdVfKsGCd4v54qATnsueZgPN
	 nkaVkgfClDKdzx1gLl+4AdToAIps2r8S9YPI0VlPIT9UJZz0FCRqpX9qccr/a3Mvi+4uv
	 fDhFIORzh5FO+y7zlokm7+FgH29ZDnUzq30xKv4MLXpiXmk+S/aEK/yGNovbWTsSgZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901916;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=a5gP4PycvxfBnXs4j4IOdOa3IGzzxhXsHvZY/xv6DDQ=;
	b=JyizXPRIPlfPqLi6SdNp0Br+0HIZPj0YeEvmEhv11V4eIH8ilyd+gojQTNtB4qThhMHh
	 GOcwlF22IpiZbc4ITUospTzPdkhEzKRQzi2tObwvOcJbycvgEX5GgskW3q7g6uSMzfSLx
	 xspdtUHzaFplJDZMlfM5AdtRmtzOGffBwHsSeOA9pkJMirH2ZX+twkoeVgQjglL/Ya/m4
	 oXaew5qSh1HFblXqsjqLhJWsimW7PoIZeXVG68u7ajINcHM1nRSS5h09G3QTG+ZeHCqmC
	 AgoHA8F9q66R9DSPcvHq91k7t95tqHEOjdFPpd+59ivVsbywrvJyCPxqjBBj+zkkzkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="TY/4VUbM";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5371606A31A
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 04:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TY/4VUbM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 274421F01825;
	Sun, 25 Oct 2026 04:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792901916;
	bh=a5gP4PycvxfBnXs4j4IOdOa3IGzzxhXsHvZY/xv6DDQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TY/4VUbM2Qn3c1V97FNqq3HZb4zySuhaJTdsdA9P6MNsFcwmjQWVBBy0aXTOWG1WG
	 mFCLzFoLtI10OpFr77y3q34LrhY1+U21GiYz5jFZSlT2kfl1Wzw0U7Dq001HL/r/+/
	 9DhXuduWLMw3fw5Djy0be6LxKmSyZFhwsJzXOlhICPfPrs9nO4GIPOw22ixb50+2YH
	 6vQ97Ha30Bae2sDpUfQV29WA27Ukr46//oeB2Ks9OtJWbdVkxMg+DuVmkvLsW7kxcT
	 FNX4cTEpfvcB3p8aElsjvNgFb06NQ3bhw+YSlR4j461HMOomAftbh5t58Ur4eaeVE0
	 J7M8mGUig3XgQ==
Message-ID: <sashiko-outbox-184054@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 20/31] hwmon: (pmbus/max16601) use 4-argument
 i2c_smbus_read_block_data()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-20-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
 <20261024-hwmon-i2c-smbus-read-block-data-v1-20-e81941ad0cd3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 04:18:35 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Pass the buffer size to i2c_smbus_read_block_data() and shrink the
> temporary buffer in max16601_read_word() to I2C_SMBUS_BLOCK_MAX since
> it holds binary data and is never NUL-terminated.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hwmon-i2c-=
smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com?part=3D20

