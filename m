Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217005;
	b=TEegPQm8u2WvxRgQY+VEZEq/uVuD2h56ssDq+VKYpICnQNrsnsh5UMIvzgYC4xLegKiU
	 E8zJElfw3hu2tvey/2IBNx4EMTg1cKP2HYAV1pewMRsyav917CVHiRk83g1HxNEO21IDX
	 khXjYeHTShXekFJjaqAy+tAO1PboH3dMFhXsUgUWlEg/ZUUvPwv61hNSdq5llWx5i6j88
	 mo9JrSGDC28D6kilhYTdRxhKOLkuMSn0IzsPSI9pdepK14pULB9v2yqt0wJsMKHfDyBY1
	 bAazjxGuzyfaSRTvKWN6G4tjwK9m/M6sFfNJAzixsZG7SZNHOmJik4ySGtPFWIR5tCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217005;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Tu/2Hawcii02qAov3/wCPGaFmU9bQCkowFRcAw4ZDDY=;
	b=Q0s+67EEmEUPPxVdLbn+EflcoB5l1p8pmb4brHhtt+n0Ri/stiR+d7Plv4hr6hKXcIed
	 xrKnlASYrC3ngR3Hzq338snRrF/f0O0OYUySWyx3nCjeK25TbXKFqDien1NE/T2YQX3I8
	 eOgUYXll+8p7NRZrV81Z0A4djIxiiV5FcHhb/PZwdQP/y0grjsQsdMZd1dLUoU7g9dbwL
	 kYTd1TRGpNrH+a5ebSNKcw3/wbByU+aRnHjtnr+y+Tbe9TQ456mWlZl0sm/zI8YPiNI3o
	 tZVu7xbuqnWI41Y4tM3Tdw0SY8e1dPx8bIzE9Nb0WBvhxvV7LaSKgOu7ZesKgzyCGjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oTBum6bN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E10606D81A
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 09:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oTBum6bN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17B3B1F0089F;
	Mon,  9 Nov 2026 09:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794217005;
	bh=Tu/2Hawcii02qAov3/wCPGaFmU9bQCkowFRcAw4ZDDY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oTBum6bN/mMDlGYNGxEjrfQAISWfZdckSyidtxi6LHcrsf151jb6IkjiGARy7zZPJ
	 t7EHr3udt5hm5cziCeCSFwoQ4w7QV0w9bA8eUkFRLKG1a2HmIvDVpBTPVhh5B2QPTu
	 jJMOAyruAARzNVdwT0khjIaE6Kf6HISMmLhRTKTP52JjGqR8Shb9SUoFY7++cAnMcd
	 E6R3eguSj6griPHYzT0Oop2pId2tJgwjAaLRkpyjlqtmSTXGpwyucbuq+G9bzJpa6c
	 u+ue7rPFmgfVGNnPCHkMt8QAlEaMzs9IZNAtRF8bPC2dyxmu4yOtdUUZvjJmB3u3Ki
	 Yxgp4SprAD/kg==
Message-ID: <sashiko-outbox-204718@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (w83627hf) Clamp VRM9 voltage limits before
 subtracting
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261109092816.5268-1-zhujun2@cmss.chinamobile.com>
References: <20261109092816.5268-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 09:36:44 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> From: zhujun <zhujun2@cmss.chinamobile.com>
>=20
> The VRM9 limit conversion subtracts the 700 mV offset from an unsigned
> value before clamping. Writing zero to in0_min or in0_max therefore
> selects register 255 instead of zero. Multiplication can also wrap for
> large inputs.
>=20
> Bound the input before applying the VRM9 conversion. The chosen bounds
> cover the full register range and keep the arithmetic within range.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109092816.5268=
-1-zhujun2@cmss.chinamobile.com?part=3D1

