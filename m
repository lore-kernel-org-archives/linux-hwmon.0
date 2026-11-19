Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115711;
	b=FCqdc+V12ePLLotNeUlJV+TU+kUdlhfzKfaOM/8JBg9xu+HwlAmmcTAAsyzZWK1cOwUJ
	 WnukhmZxhhdxvrnFNo4jrUQsg3KwARtZ06GcaP6U4rGdArOUe9VSDUHA6mJB81/i21q7V
	 nOiZFxD89DjIV2sLXBXdv4k2B8fwYJ/CrStKk2R31NXqm1AHKLil0uiGDkhCgMcASWIAc
	 BYda4UQz7q94pefudBeUPCk9ZQFCaP+JI5oJWIcYNJApPWUGL5QeOrWNA8RbEWM/6lIYH
	 trjyYEbiy51wCTNrkFsbJcdK6gVeeRXl/66VOnKM9eV/O8N23mZnHD3MfI9/0sp45AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115711;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UdQ+Z4T0uxljsg5Q9yknTqx68itITlNORQSVQMXzuOw=;
	b=jF3qkVUh9AbzrETQ7so3FSfN4P1KEF3op+zWixPizPHZfFz0ex/Jyakw3+alrlLn80QU
	 FywunaS47vbbWc/qVibgYQ/zddoqoIeo3/wCUjd2OC22bn5mUZHV2AbaLydYdDbFSaywM
	 VqK27nxqnb8mqj6nYPC7A3hteAVyH79+J6n7GOlNcpEzQn2wkqu/1rVBHLoEN7uSX3CSl
	 VijK6tLQcbsD4BOsSglbq5OIqjWKmzyFHhiRZFBmYFaOcqqKDkjyx7/vdSY4yifxcwTeM
	 iKyxFnBV7aV1n2BVKglKnEG2xEBUFMnH8bUFsIlPl2o9U1lnvtH8r53vCOWqqEcwQDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tgw6l2gu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F39606A32C
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 19:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tgw6l2gu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DEA11F000C5;
	Thu, 19 Nov 2026 19:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795115710;
	bh=UdQ+Z4T0uxljsg5Q9yknTqx68itITlNORQSVQMXzuOw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Tgw6l2gudaPWHD7Y71y3BEQYku/elHABguNC1t2mt3AtDnHmvgmzFQyZ1loAeNBf9
	 3lXD5a8WtOl5YzYcv9jxrQ0xb7xJX4xH0BE/8m0cppERDPUvTTjXZoqbJ8tPugkUKO
	 oRLy3nkLz5i8ICvn2i2BZkpBGTYC4A9aZSURmA/N3PFWHg7tEMZDt8d638xQ1Mur4W
	 TcAwAd4qFx50FQKQgP5GuEs8rQmi3dthhaZGtByKQ76KVFoBwZxHnQOXsjfrz6V82C
	 9UhwcSKtpkex9GeK7o907wBWuEGDAx5LQOgHjsP25Ai2aB3cWtvBro5byxdLLGoaL7
	 1b3gIUdVk9SVQ==
Message-ID: <sashiko-outbox-223851@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] firmware: raspberrypi: Register PMIC hwmon
 driver on Pi 5
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sander Speetjens" <sander.speetjens@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261119-hwmon-da9091-v2-2-d6c624272a9e@gmail.com>
References: <20261119-hwmon-da9091-v2-0-d6c624272a9e@gmail.com>
 <20261119-hwmon-da9091-v2-2-d6c624272a9e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 19:15:09 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Register the raspberrypi-pmic-hwmon platform device
> on BCM2712-based Raspberry Pi 5 systems,
> including the BCM2712 D0 revision.
>=20
> Store the registered device in the firmware state
> and unregister it during driver removal
> to ensure proper resource cleanup.
>=20
> Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-hwmon-da90=
91-v2-0-d6c624272a9e@gmail.com?part=3D2

