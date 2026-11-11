Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380627;
	b=SMYgiWFhvVr/S0gn4xMewEvKNfPIi8ySU4469oeH3uM24mrp3If59fsYy+xpDwGjQufX
	 gednQu6JRh16qx8QlnQe1fwJb7IlzdDiRRE/59XkxpaJYHpH/0BUIZnMoR20K/ltids3X
	 j8L+Em3SylPfsK9N/PLtr6foGYmIFbcPf8ckREcwj1EkbUsTxcKtxqoqCga67rAbMBpax
	 G4a/J+JqK4xisdFjmAdsdE2y8Ap+2LjoxtG6dRJB75sCCZqJxdnjIbs1LnPA59lmS+XB/
	 ri279Bz+T6wRbOjQpIoBdcyjIqttW7MfPxCJMue8wkrjUuwA2UlFjPwcCYCHIdNCS7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380627;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8WZDCxooPwaK2xuTeyfnIa4T8MftKUfiJ9EHWAEVLoQ=;
	b=m30HhU1wy4XWJA4x6S5K5jn+CzifYWIdJYOi6jeNazLGQ3t67a3zWFg+BXndCtAToN6s
	 rAGEMJ4o7KLEszspHeBUKC73xjct1t+NeKWhGVjHzGobW4zfVRD4PDs0L7IYUmUG/tAjE
	 unkD02gk7cmr2HfNy4iHRScgYtJO7QryPLlbDYHmj0KF5EoCZ8KqLp0iTnKLUqQAsxZid
	 Kt35UD5Mov7S9pTX8vgkFJ1Bqc3idHz4Ns+b6ZJEJKIZpx1p2o5I9HMMLfwOros/t1Fgf
	 8OGyNA1j9cAhlGyms50UNwmjhFV5aph7EyLbgJ/9k9ykix3s0iH5EWdL3W+iAYSv6rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j7PdCOUe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654E9606A320
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 07:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j7PdCOUe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6401F00A05;
	Wed, 11 Nov 2026 07:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794380627;
	bh=8WZDCxooPwaK2xuTeyfnIa4T8MftKUfiJ9EHWAEVLoQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j7PdCOUeDpU3AfDjVs0236aXI+ir38v4vcjZPEj+/4VRVtIBCYD5T3C7o8r90X9Zs
	 moT/KDZS8eJNRy/R2pcB23XM9rbcO9CMmz8gEg5V2nBweoVDx7LiS+jhWyWhMqAsbI
	 CI3I4fJvYdyKdbNbpXIKcuA231gdsecex98fKVIeOICwMFYr63cihbggc+ZGTlSm+S
	 QKOVG6n3uuALn5bahJhpRxn/Mbssaloc5k9V6T6sjBU2fI3d/epPGUDk5x/tfjfR4Q
	 fYgfETp+v6LbWYgey2sjagMOpWFyDtTcPJphCkjH3k6h+nf6HDU4dw+axL/aF+dE6U
	 xb/P/S+WblnNA==
Message-ID: <sashiko-outbox-208484@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (w83793) Clamp temperatures before rounding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261111065257.17708-1-zhujun2@cmss.chinamobile.com>
References: <20261111065257.17708-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 07:03:46 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> TEMP_TO_REG() applies its rounding adjustment to an unrestricted long.
> LONG_MIN minus 500 and LONG_MAX plus 500 overflow before the register
> range is enforced, potentially selecting the opposite end of that range.
>=20
> Clamp the input to the requested temperature range before adding the
> rounding adjustment.
>=20
> Fixes: 6800c3d027b4 ("hwmon: New Winbond W83793 hardware monitoring drive=
r")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111065257.1770=
8-1-zhujun2@cmss.chinamobile.com?part=3D1

