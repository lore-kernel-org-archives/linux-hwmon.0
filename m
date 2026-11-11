Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380052;
	b=fZAv5f/9QU7ltVoR4K4lVQTPJ3faVFpirY+FRkelE9bvuJO1X0GyDQmpVW6RPxbFPXns
	 6XDZacUbhPLCUNfKwVPxew5x2rYtdeM3NkCVSJi9FgcERdgpj499oNgp4QH97LYBQ6b20
	 cZ14S/Ggyh0Cl8nZrRH7z5Eo4OekEGMBwBPG3MeAIzzjutxw45Gk/3EaBVgWdoquF00cd
	 xfe8Yf8hJnL2arY9BTYAoIx1Z8wWDzfpJjzMZyx8Jhnah6XJyfhepipYDn9fbyf62F4SR
	 70EQt9BuDnQn132skV8fCEPxnkrmR/MMkBSWFKXt95QTMRyg0AGu+eRKj4WZoVwoXyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380052;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2UQJezTr3WuB1+IG6nI34NmEzLFpppDpxRbeC+qjcaE=;
	b=NU6eIh34A08K7aKRIvk0gRz78VTpq4yS8Zow2YjQdrCv0IKjpzzecYFq3pdgx8X4dZ9c
	 QAXS4oTBrOU60dNLJPOnBn7LhDTBYyAdRi6iy5pPLi21j5WJfD8vYvDvIWzeyrwMxn8XL
	 ACvQGyQURzZAE8jTfIramEuD7LQinIlRobkJ5sMzSY4TZ8lEvWBCvByHD9LifPbpe1Pwp
	 5FCSbaaOT0GUw42+tLRgLSw1llgyZ/WuVklE/xzYEYVRI/JovKyoSCYtzGj1mPGBSVR37
	 aflRFzDGZDUw+MxAAOKR8yZCBY7xJoHheOcJ8aq3uPKQ+Xt6+rs3/aUj1JYY22+zxzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aFLUE2QJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B47606A32D
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 06:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aFLUE2QJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EA941F00A06;
	Wed, 11 Nov 2026 06:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794380052;
	bh=2UQJezTr3WuB1+IG6nI34NmEzLFpppDpxRbeC+qjcaE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aFLUE2QJ9saCGUTJLDyxEwpVJXZeOzXiV+5obvjKzfMjtMUo8ByzMiV9v7y+vAv7U
	 0bhY2WnYHJ7Jy6bAF5F613RqGOgLriXyo99rfhRBng87m86bxXIVQxOmRuqlVmsMXh
	 VeT7X8WjJPIcbapST1OwB7JZutCnZ2UtB624de1G7BF6ELetQ0LvUcNENyRqdfqggF
	 3ecYmfSMe1R1/V7BB0+FEn7RcjwQkopQkP4+GOTfr8SbkmMPQy6I0cLxYdpguKmhK/
	 WQKRE2W2zAj8q99WJFDl6MXO9F4M+CmU1t7Vc6zgLERBlW0+NAB0vsHL4refkRw3do
	 GaeSgCSYqAb5Q==
Message-ID: <sashiko-outbox-208469@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (it87) Clamp voltage limits before
 multiplication
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261111064847.17317-1-zhujun2@cmss.chinamobile.com>
References: <20261111064847.17317-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 06:54:11 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> set_in() accepts an unsigned long, but in_to_reg() converts it to long
> and multiplies it by 10 before clamping. Large positive limits can
> become negative and select register zero instead of the maximum.
>=20
> Keep the unsigned input type and clamp the voltage before scaling it by
> the ADC resolution.
>=20
> Fixes: ead8080351c9 ("hwmon: (it87) Add support for IT8732F")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111064847.1731=
7-1-zhujun2@cmss.chinamobile.com?part=3D1

