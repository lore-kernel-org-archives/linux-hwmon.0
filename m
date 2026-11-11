Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380480;
	b=ayQaviCAxE+jnT2t+fHzFlKi6hBCq/NKH15Jdpk3G8mormEb8vgqwFAYwb9hzpWQossX
	 saZJB0CdxHOk4H3YWd+Jm2FJT5afKpR0PkjtOVPfWGPxtdkqoFZX0JFey2EwnMgE7dSO/
	 wx6tO7MdmxJ5k87qPCvIA9WOhDf1l4Jysg/17R+zNrLzmh9cVvhhr+HRBrd2AyZ2MG7T8
	 hbTVx0PpwwCnYeQqbgiP1UwkVo8LZV340d6h78u7O0ijv9gesvFx/c6IV/YK6QgjbcAgd
	 eXjCxtEVFcqEYEuunFD0minXHdfBwBTvQJc/Da/oqT12Cts3Eg/zmanMVQDImIn9B3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380480;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=StpK99dmWHQ94n811ksqmvihiH2eR+UQQdanaqkmWss=;
	b=afe+We8zIDPu+x6MQnXn7CMorLt42j8rdrVhD1kDq6FQkxuT7/uXE7aQ818mZuPKlOUE
	 i0xDjac1Rz3fPz2WjQTGC7n7N7D1ZnMG+jM69a/CKPgXvdlZO3rgTVISi48Ap4C0v7saT
	 REkPOu2WvAJRBNM9eAiswkmJbMMXeTJsl//IB7HfCY966Ecur883F75iWnMKDbHUa4GIv
	 XnZoYkghd9oNICeaN8BaRuUcUHcyWchHa82J5dk60gwWhPb23kZC/xkkV+0hotnyfh4E2
	 gQMsuhDV7548ImmAbWudYwm7M0aJhvtTJyQPy8ejDOldvm6jWeAw14eG0v4P40mDs1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YpR4k4G7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B8A606A31C
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 07:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YpR4k4G7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49F4B1F00A05;
	Wed, 11 Nov 2026 07:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794380480;
	bh=StpK99dmWHQ94n811ksqmvihiH2eR+UQQdanaqkmWss=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YpR4k4G7QssEsSj/db4zlI1riUQ8jhmzPtmlkn3uUSZEWv9cpgWtgZBc5I3BsJyf+
	 huzkUtSG8XyHQu4tN+wJlgrDEZL6VCEn4NXSeFaQo69+DVXSrpK9XOr2lRLD8S7Gm/
	 iayzxIOYi8JO0P7VpjmaSKF9mtkAebZzQhHGLsGm2nP6HCYDIxbX+xZav+/0tm7gqN
	 JgBTx6y7CrL0OyI5JxUdlRv6rZPQ3x2+eJ96bVxTWGVFPPmekq71qEKamF7H5PXcQZ
	 8RNo+bbW65oqojmP0wxMsaL1jwIC2HmAViTZrU8BuUhHpeebctLoklJp945qCY5SEP
	 vCu75AAjcexYQ==
Message-ID: <sashiko-outbox-208482@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (it87) Clamp temperatures before rounding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261111065252.17695-1-zhujun2@cmss.chinamobile.com>
References: <20261111065252.17695-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 07:01:19 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> TEMP_TO_REG() adds or subtracts 500 before clamping the result. Values
> near LONG_MAX or LONG_MIN can overflow, causing a high temperature limit
> to select the lowest register value, or vice versa.
>=20
> Clamp the requested temperature to the signed 8-bit range before
> rounding to whole degrees.
>=20
> Fixes: 1da177e4c3f41 ("Linux-2.6.12-rc2")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111065252.1769=
5-1-zhujun2@cmss.chinamobile.com?part=3D1

