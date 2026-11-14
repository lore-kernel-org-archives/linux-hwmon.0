Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637493;
	b=YCNIYQBrgAlJtrqcX6fKECQOSzBaj9RT5wf9UDeFUfGh5Tk4cuLoIZSsxu6rSMfKViUg
	 IyQl3fO7RRvRSiIfw3t7VTgtO66KQQACn2ScCX7AsZXcvHAlmE6SVPBpmYH9Ci97bPAyG
	 +t55+XxWmtn6/Vc221AN1Rw6+CL+1sFSrt+7pW7g6jDQXABSnL+mGj2txGQmnfrxa9pSH
	 MfGKeBejzKNJ3tiAUBIsLrfub63B4RLs0MrIk/hkew2Uh6Hz6ALtazQdz1eSdV5pSt1Gw
	 P3JtqEJ7GMLFZYDdw+96zFrbEw3AkfJkdpoWTjEh0FvFJW6LzQDm65+x+cWfV5Bluew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637493;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sr9gxTIL8g12ygSN7FesMgOdQxM8Y3CGXLoTIiNYtU8=;
	b=z4ltYQQZInKd17OQ/JrNFNI+CRbj3BruhX1rYQhfXJxQF0lSsID8+vytvzRQRePa1Wa+
	 /3Q3lyk0e7mVYyTE7Kq4r6nHoWCcb5Y/xJD0KOnS6YeU14Oo4+sPMePhlUdsv/VQXx+BZ
	 p9fSInzwMGPowIjOISVW+r25aWbS0DeBsFDZPIRLkz7G9T6+Hmu0fqumuldBZm0qAO2S0
	 qDKadu63pmjqxmL1khZBxVVssIkd9WENZGiZrmZIyxQDJWU8ZC7W554jep4KwmQcSwfEq
	 ymFxfC9CKRQ4O4/Jn1DnB3QbKopR2Xk/XyiJW5Q0YmmVrNAQFK7pKI/HcBkj0s41i1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W2bonDR2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D51606A327
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 06:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W2bonDR2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 392441F000C4;
	Sat, 14 Nov 2026 06:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794637493;
	bh=sr9gxTIL8g12ygSN7FesMgOdQxM8Y3CGXLoTIiNYtU8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W2bonDR2HsOWFfqXpu4pnLzyGEKAe2E0CGtuU1jpoLv2zZfi6DTtyKmyn892P9Rk0
	 cuSVDUmlNprpshsriwrOum2PyGAa7KEdJnq13iWU/1CpAwN7q8cv/0cHJoFKViJXer
	 swcKAxWs1zeZ/LAHR22T6nRSbRxHY6aJNG+pXyoZgiM191hMu7LlQwstAEqG7pkuCP
	 hyLxXPNHcLx0Tf4Uk+dMdUAM9E4FsQ7IIolZf6mHyI+mwiJwEPPYe4QZltCVSzpQ2S
	 F42DPQQRvf9+ZmRllo+JfP4osrYQexiXnhsYtU4aXtaD3xoPlQGXiTHqqYb/xtVsiO
	 NnfTLrpIMJUtg==
Message-ID: <sashiko-outbox-214217@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] hwmon: (dell-smm) Clamp the pwm value before
 scaling it
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <3c36959a51788bbc5d08f364fe7d922b5c4d4d87.1794633179.git.rosenp@gmail.com>
References: <cover.1794633179.git.rosenp@gmail.com>
 <3c36959a51788bbc5d08f364fe7d922b5c4d4d87.1794633179.git.rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 06:24:52 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> dell_smm_write() scales the value written to pwmN with
>=20
> 	DIV_ROUND_CLOSEST(val, data->i8k_pwm_mult)
>=20
> before clamping the result to the valid fan states. The rounding adds
> i8k_pwm_mult / 2 to val first, which overflows for values near
> LONG_MAX and wraps to a large negative number. That is then clamped to
> 0, so writing a huge value turns the fan off instead of running it at
> the highest speed. With the default fan_max of 2, writing any value
> from LONG_MAX - 63 up to LONG_MAX selects fan state 0.
>=20
> Clamp val to the pwm range of 0 to 255 first.
>=20
> Fixes: e7f5f275c62a ("i8k: Implement hwmon based fan speed control")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794633179.gi=
t.rosenp@gmail.com?part=3D1

