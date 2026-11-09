Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794254529;
	b=YZ30LOVMCux8hfVJ/nlZe8m47PIcD07o2vZ0b/SSuUyuB+uYFayQVfBSfuuAZphs/yrR
	 +fODuxbmdX0l0D/eM40yNaMDu3/49PuD8vN+HKjDuTHi8DBp1tgw6gaWI/0e54SW+Edhd
	 qrfccUA9eG4gh8sgnn1NSgP9LFxd6L8FUBQlYVQsn0+PoL0xxy+MjiUt6DsvLdo0gPVrB
	 MhZVIRULS6zWTz40GTQi81yYHDTEAFBURH4797dRv4yy9zBdt4I2AZtJ6lKGit7CUorC2
	 Mtq9rkJ22gsi85FxnBYh63SWCJUTwBTLg7FA9Ls58RDfSmd6WludosgEhJEzMqxudRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254529;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qfhyMJ58uR4wAyi7IlV/BfJDC0bg1TKCyfBB6DZFKtI=;
	b=R83Pac6FHAriJx9cT9q7ju/eUXlu0O+WfSDmALTeOEM1RulQ/y8o186GmIDWqQTjRoKh
	 3nrozULZKmuMFUm5FxRIgLowudjx8CwBiVQffRKSX3y/ikXGJSfqwf21qBX/mneOQ7MKO
	 743/8395sDVCVEVTo6R3LznmGlbOQICpENrI/K8pO23D+2JnppeYUjx61FUZoWjGMrqim
	 Xg9yuJlz4pHPaZ3W6z8Nbi/qrIBYsCBeyXsWL5zq0+bMjVX0gRtXedxXxO/q2fTQkfli3
	 3t+FOXr+3FQWPsd3nYsFKLQW+9DjVVpzaSp7mubk5Q2pH4J++1Rvn9PB2vBQleO8kbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BEHd6uxX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4781B606A32A
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 20:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BEHd6uxX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9DB51F0089F;
	Mon,  9 Nov 2026 20:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794254528;
	bh=qfhyMJ58uR4wAyi7IlV/BfJDC0bg1TKCyfBB6DZFKtI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BEHd6uxXRMl3+739OK2M8gaJaildR9hFgYAu2Sw32Plk5C3JfHiaROvtUcuWXyGLJ
	 cHgODabj68cRtMsNBsvVNqQCndomRBlkMq9RYEKxkL5aeNqlHyVFFB6kASGtkzAWdh
	 mucHM0uaFXigzJqWWmoQAS1Kh3juewnMKzO6OcuUmnJuapzlnqcluF5lLTuxYPqNoZ
	 HMr6FYs0MjYxBPHG7j/JA8X9AgDqCLVfPW+piT5HBN+x/cQFgwZYvTOB3gWLToE9K8
	 5heZBZKuGsGB7hOTIuNEwxeGgok5ABQ7QhR13LYFrCWXKCogbwpvwotMmPsqWEC6GX
	 TMa2y+/XyffOw==
Message-ID: <sashiko-outbox-205524@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (it87) Clamp voltage limits before
 multiplication
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261109092742.5237-1-zhujun2@cmss.chinamobile.com>
References: <20261109092742.5237-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 20:02:08 +0000
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
> set_in() accepts an unsigned long, but in_to_reg() converts it to long
> and multiplies it by 10 before clamping. Large positive limits can
> become negative and select register zero instead of the maximum.
>=20
> Keep the unsigned input type and clamp the voltage before scaling it by
> the ADC resolution.
>=20
> Fixes: ead8080351c9 ("hwmon: (it87) Add support for IT8732F")

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109092742.5237=
-1-zhujun2@cmss.chinamobile.com?part=3D1

