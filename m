Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219804;
	b=KKxuzPA7tyS2Y3Q61LItfIkTXp0TvZmOwKPClmsSaYIP0ed0wNjH4rmcsNElXakOh1uW
	 aHOZV13CmF5E5ahoVnQJV1Vg3lLuwdi85tl+CXYWtmsEmlZqavO0yCAryTww99SFj09lx
	 6dTcKxpJ4cbHZP9YXYBQM0MLeqyELERjd8wzL6SJgZm6ATbNoQipAf7cS2izWf4kVoyJ5
	 7tmTMv5Q1lEAp9s4F1H0mxkupsluwvVRmoSBOl8z9o+kSXUGIp6GIv2ZuZQ7ADCsskMgi
	 4RKzOIIobbhAeCKKwxowbeo40ZbAVnVL8mVDd2Ui1754iBAQfBFz/MWUyjhza1cj6Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219804;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6cLw6C+yDUXW3qVPAK/Gjqn7YPzyxyUaKbYNndO1Fq4=;
	b=vYEA979jntJIUpj4edHBz3idXFwMPBYvGK4MR4B6x+jl0p6ppzrrGQ6Uwt9BjPV5S/h1
	 ADPp5Zj2HQ5CTBoKfqd8rjnwLCYz25OjwunXPKXdXPLmgEz7yUAFkSlChMj3dde94TtaL
	 wXqlbeXmkIQJSJj7LKvvAM0zpJUNJp/q51m74JH3M4pqnvLmbcAlwPgyJSiHaCSFTiNgu
	 VDs15LFQaudwS2MMRB7QCkPrBHLl+XbLWGCtspLLTsXJp+2o3o3xgXl+IzCa6nwMz083a
	 SCZ5vGjUHDI7C8i/AEJxI6DzgyXiDVe23pDgRJ+Q+I3XffFscm3f0lU80O5XXsoPMEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PCnMokhA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC2C606A322
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 10:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PCnMokhA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 107CD1F0089F;
	Mon,  9 Nov 2026 10:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794219804;
	bh=6cLw6C+yDUXW3qVPAK/Gjqn7YPzyxyUaKbYNndO1Fq4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PCnMokhAGPHayW8yAvS1BSxDGKb3HI3IDw0vdm06j7mLNh18M+Y38tjVSZ3BO/jYQ
	 wvS4DqnnIFMZ+31+t4KTHzOItoLPwqJwvNf+qID87/50UyIu+vgSymJzLBOAAICHzr
	 6a/LhuZ0Dap1LimK3ihVgc1ZfcHdXo2uPBPsq/0w1EJ4LQv/Y41r0qzu6P697ehrlV
	 WV8xBvov48+SsVKf62iHqWfC6CS7CSVMj3FC/FsUvP69UvWwdr2YlqTaVkR1nKOi2I
	 vHVKEG+X5VBhJarxcZC5sWyteSEpeFYpk4U+Nzkp/73kI8uYs1BEYuUQmaBEKspleH
	 MNfMVFMuVcJZg==
Message-ID: <sashiko-outbox-204810@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (lm80) Clamp voltage limits before rounding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261109101821.17104-1-zhujun2@cmss.chinamobile.com>
References: <20261109101821.17104-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 10:23:23 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> IN_TO_REG() adds 5 to the signed sysfs value before clamping the
> register result. A voltage limit close to LONG_MAX can overflow and be
> programmed as zero instead of the maximum.
>=20
> Clamp to the 0..2550 mV register range before rounding to 10 mV units.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109101821.1710=
4-1-zhujun2@cmss.chinamobile.com?part=3D1

