Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922484;
	b=BSmKL1CuNmMiQ4ZuRmdn3OyXq+m6iR/FxrT+97/XBCpXVdm4lX6C4OnAnQ+xlIV2SlgV
	 tHaKmn+cIHdQQ3A22SXEmZqAyL/Ky0surTlo3oLSsigRrmtJsb3FOJkH934q9zJlAMouN
	 xFmG59jdNIOfD1367RLDJ1U9TbG37hQdGLqoEka5tiE3qL1EkfntIj95bS/1+1O983eQi
	 1za36qZOP4rHPwBUbeFZSUQT4bNN2hkp9LOrhB58RFvv4cUVvGYs7AGaydt63btPy2uKV
	 R+4/KyA7FzzYTQy/xKbpUGqtN0cxmrSY7Z9fOiNIAszAJXFlCEa0OKVnfYDcqMGHBMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922484;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=frXNhtlgvoh3r1mPy9/4jM0MnyMpGp5jNI1qDaHlCVY=;
	b=09mG9w8/dTnfsxz5GDqgRM/OqcEvfDIUMS3ytUUltzu2Sja69OmNwSzuh+2WjTYjhb7e
	 y6jcYsKqAkp4V7AcO5SGw8lHCIjR0wvKvCrNt1j8ZpiUOHoZcXd0hNniVHwilOmHE0eDx
	 4ZE+3hZcGj1i0F8ktllu6foV9tQlXX3/inO9ukYoFJL8z/Qz+hFCj6+L3z4ozRJivRsib
	 kgUrRIM+4hD4DADDoq909PGlst0Bgv2VOS+wYB0gBxaojBGIeE+MCNQn6+kswjPK6E7yy
	 GuzdNUpdUB5eGbWHJn7Ee3oEXQfbkARYl4vUyl/OlmmYNS/8qV0ho67fiyCvIdxEhhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mUlOGUgx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3907F606A323
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 13:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mUlOGUgx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E7A01F000C4;
	Tue, 17 Nov 2026 13:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794922483;
	bh=frXNhtlgvoh3r1mPy9/4jM0MnyMpGp5jNI1qDaHlCVY=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=mUlOGUgxrvY8C0JaK+D1lBYq26P+Ercgk57ucVWcrjXyqdoyO8PufHBUgtWnWQYct
	 cPGPhtbmuJd2cFG4bcZvmqmw3yDn3MSseK1VZQSZ3Qk4p5wa8u3ERHlBFigrDkfgIZ
	 aGuSFkSWSESf0oWwip4IO/MyPgOwG5ooiVhVV9pWCe0wHBrj2NjIIrjsh6zwhdGd9Q
	 AWoBLu8VoqiU81JSsHbWL9+v2ZdEmg8WDN/Z1ORKKOXyia1WDmCycACAh7ukgXYmIT
	 mKuTjMKVNvuVUiQhf+97wwN+GoNs4EiYvveU2B/BOo0YJ752JshrhHAeVa0aIl+oXE
	 23rztUuQepP0g==
Message-ID: <sashiko-outbox-218884@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (nct6775) Add support for NCT5525-S
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anton Lundin" <glance@ac2.se>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261117133038.40996-2-glance@ac2.se>
References: <20261117133038.40996-2-glance@ac2.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 13:34:43 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> It's a newer revision of NCT5525 with new id.
>=20
> Signed-off-by: Anton Lundin <glance@ac2.se>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117133038.4099=
6-2-glance@ac2.se?part=3D1

