Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794549284;
	b=4YSaIy/6QlLXgTDKFUaEz17XbNTAKJtae5Ii/2DtAlZ5zjSFxyCua0YZmEaqu168FuUq
	 jANumOqiN4u3K5hhrZJmgGB0k0OhIKUkhWNW1AAFQIsjG/1xJ5B/LFWonD3cwxz87IQv9
	 FGlrHV/rPVAJsGletHSrmtE0zotrYAHyDIzGK6fDwxTpJm7K1ivCvBRET8sUWbPfkJU4+
	 tGYYyGdkxN1JZkera0htg3sMEuPyLFA+RAusjinP7MqVDejH6aRjOe7PT1XxQHFdt7NjK
	 kRVCXo6aKkZKXNXjRENPRglAmz2mRXRrP3qJ13PlPWuYrjdBT7EgSu1CnRfBbgjFURA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794549284;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rc4T77GMcVmsn/taCoJC/fHpJ2L80yKtWZQGczudF1Y=;
	b=22vSgSv468JE+8gL45aEui5PvcQMNkxQFq/ltbrhnslpMUpI7jt8LgAl7C3EMca49Pcr
	 r5uN4Gtb8xdkt7ui3wsAJe8hLJosxOLdyac8A5aMt2uhHNM+uUnf+igrjqY+73RMUBn/9
	 zYsglL98R2s5LsUKu38UjC33bISDqGzaymAB4Ehszk3uf26w2XGomGmmZ6MIoXIY/GhcF
	 sMyKTOHXxdWpEbtblRiqz9j+zLKPK/zckQSXuud/vxE6T/wYU1PmM/sIfk3iHMcSghSOO
	 ZMJhpR1dP1n+V3aOci6XMoRwjvonpJyEjxBimTG8PBqbrsIbpJaCt2lPBuoNNgZ8yQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SxjrbDLW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847AA606A321
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2026 05:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SxjrbDLW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46B921F000C4;
	Fri, 13 Nov 2026 05:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794549284;
	bh=rc4T77GMcVmsn/taCoJC/fHpJ2L80yKtWZQGczudF1Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SxjrbDLWj4kRt9Qkm3Xxv3gcCHD+bW5ZZL1PA5tTUICLffN++/IvGHCHVm3/tmPsu
	 RW8EExyqmp5NfqgJIzQXGaUQYeIYEhY6844d4TTWMO8FIHufQ49a0CFmCHfL/vi6Jq
	 iaTHlUbwFHw7rwXXs2PWVZF6xVjoBF5aAkHJP7Ru1snVwdaMk5ZnL03JcgwI/uQJ6r
	 Hs/u8vsBgg5/8yLR7OBvtCACpjo6ET9cMVDjjQyrwNYpHVx0wxEaNwUeuO2PMO3xyc
	 vo4Phkb9k7kCPmYh5nWt8U5pTDmOEAXfPXG4IksqNS5lMzvQidkwpciB7rMttxo2Tb
	 f/J2rF69c+fYQ==
Message-ID: <sashiko-outbox-212260@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (sht3x) Fix overflow when writing alert limits
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wayne Ho" <wayneho219@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261113054857.97048-1-wayneho219@gmail.com>
References: <20261113054857.97048-1-wayneho219@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 05:54:43 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> limit_write() encodes the limits with 32-bit arithmetic, which overflows
> for the largest accepted values:
>=20
>   (130000 + 45000) * 24543 =3D 4295025000 > U32_MAX
>   100000 * 42950           =3D 4295000000 > U32_MAX
>=20
> Writing 130000 to temp1_max therefore programs -45 degrees C, and
> writing 100000 to humidity1_max programs 0 %RH, so a limit set to its
> maximum makes the alert fire instead of never firing. Reading the
> attributes back returns the cached values, so this is not visible from
> sysfs.
>=20
> Use 64-bit arithmetic and clamp each result to its field width. Even
> with 64-bit arithmetic, 130000 encodes to 0x200, which overflows the
> 9-bit temperature field, and 100000 encodes to 0x10000, which is still 0
> after masking.
>=20
> Prepared with the help of an AI coding assistant (Claude); I reproduced
> the bug and tested the fix on hardware.
>=20
> Fixes: 7c84f7f80d6f ("hwmon: add support for Sensirion SHT3x sensors")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/linux-hwmon/20260725222229.EA69B1F000E9@s=
mtp.kernel.org/
> Signed-off-by: Wayne Ho <wayneho219@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113054857.9704=
8-1-wayneho219@gmail.com?part=3D1

