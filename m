Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901923;
	b=GoKBIyRhdgKjYfRfCGk8uGrBJgjS4wN+P34vNpSZ/2XWWIF2Eag3E1VFIK5MDF6ui2N1
	 lIpK3GoiSlVSklo/5iG0vYrzgZwcT7+nzYwBfyINWJlJFjl437YrwPibH6KYWRz7oimyy
	 gYlLOFvEBsz0mxT4V8+1O4sJ2x28TgRr3qNU6gcVvbklv9XlWjnifKrwRoXbNRGImciZ/
	 +24bsh0IixKNJYMZ3oPeJ2L+XZUHRZutBBvcAnYrTHjAHNvES1nOkUBSkjGsVe2mzLXa5
	 7nspWWOTTx+ecATQcm1u0OguC5ypTCAfWWSSZm9h8r3pHawQYsDgXcMhicJSnqsjLwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901923;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ciYRTHfYEXru+CcLe1Z8QhAUcPh6U5Rqgv30mEijkbE=;
	b=FIKKycBCG6QYl3GP1V9vLdeG+LEKcF602kQLiKWi3R3bSY+EdPeSDZDdtAleRIIi35Tx
	 SaZABUE0K4YYhAwjIRRZa771Ktckv3ezgxHd6RqHH2EQcRhoUla3TBNexio/zsgDjtDpa
	 OJuP7IWzlEDsSGihmNvDcVqa1h5G+X/e+PN44f8/kMVaZJ+hSfk4NgULRpVRwlcgBt4r5
	 u17Zv6nt03YJp3JyXi+vTXiPYzNyCg3rM1qSqSPZ1bSkZNTdlx13kzzNVmhEKFGLxz8/7
	 +eB6beaCzvsV+3MKuCxzkWcP/3F3iaEmmq0UqrUH4xbJ+c+8vrD2GA5hAtzPBN8zMCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AbMit4kc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC174606A31A
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 04:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AbMit4kc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70B6F1F01825;
	Sun, 25 Oct 2026 04:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792901922;
	bh=ciYRTHfYEXru+CcLe1Z8QhAUcPh6U5Rqgv30mEijkbE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AbMit4kcp4kmMcPEuaqrC7+8BLR3MTadvGzY8YHJ2svMvv5WkcFgyjfhtuYDNvGkg
	 41tuczSgDn+bN3L1mYmA0zm1TxFKI2t+MI20/K4Ra6ver2RKA2W7ll0kIEBlCILfjV
	 SrzuMm7Js8wxJCgvhEmZPBjhxwk6q2Y5AP3a5lf3p2EoDUE7DEp0mBRxBkEo1OkQUU
	 qdAtsVQsffFRaT/eKhHfFWdsZVXVm1UsnOjldF0tlQXfCSZEFZNmaV6f5ZwW6yhsw7
	 z92HwOnz6b92LU69URnf0r4/a11t4HMYYNGtqUwICAGxSvj3wLIdQVPAJV/9YsWowR
	 9VwCLHOgdM3Ig==
Message-ID: <sashiko-outbox-184056@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 25/31] hwmon: (pmbus/pxe1610) use 4-argument
 i2c_smbus_read_block_data()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-25-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
 <20261024-hwmon-i2c-smbus-read-block-data-v1-25-e81941ad0cd3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 04:18:42 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Pass the size of the receive buffer to i2c_smbus_read_block_data() in
> pxe1610_probe().
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hwmon-i2c-=
smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com?part=3D25

