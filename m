Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794110609;
	b=P44N89a2IF5LjtkOacSIhk8oUHzBHxycyv4qL/qqelHFpHBcwDPXn+uQf1R7XYVQWo88
	 Di4jQrLxM55oiC7+NSoigmH38965oFOp0i00PW/tJaSmQzgl4RYTHkPDqt0VdCRljeVDB
	 jhYSbhPNMnaUBczfMJzdWb1SBHn1NYgtigZKgrD9S364J3gc8/bEGOJpItrec0MqD1e44
	 UjHWfGBcNHbGHiLh2onccx1eAxpXQZFiN9GQuyrJ02/zvuZHFLL+AQFH3E+AfsS6fC1hJ
	 cmfdZPwfxnyk2Lyl+2ezeuG5TZbc7cFGFBDLRVrcBVwJNbcYwmRagJeTrcNNi+g8O+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794110609;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2Cp62NMOFWdG1jxV8LHAlHWQxg7Z660gFAEqeGOL9F0=;
	b=I9KkNaDYm8Tx1Z+YZxGU0t+ln8stXfFN17oiIvfNYYrXdg7Hz5Bu48BoRBZU0QD8DMxy
	 zXSGliCMN+5z+HAUpWjgqal3jmS+LCGUPNecrcvpgWPcjcQrpCC+yJ70RGwJwogCARch3
	 09h0kgHBCs9eSEDXY3xITGYmr1DDvn/NG40Gq1WL2t4MzoveqCtihQnWvjO6Zkj8Eae+9
	 UmCLEgwK3wDpANc/FBkw14FGjjKmGor/zPKysVyU7ckhlIwDrVso6O0oDU9JTFX/HY0Px
	 6mMQRetRcZGdlTURNFR9gb0Epw6O8vY8rUv04Pz1V6Eny7x48cGjgdmBDYhXJXjVE1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LtmX4qOS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476F1606A31A
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Nov 2026 04:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LtmX4qOS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7FB1F008A1;
	Sun,  8 Nov 2026 04:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794110608;
	bh=2Cp62NMOFWdG1jxV8LHAlHWQxg7Z660gFAEqeGOL9F0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LtmX4qOSZ1nluKe6FAym0WxbPGAyqYpyhKPR5HjLY3qTL8ofc8f729EBF9iSYWW6b
	 crsFzRNaAzixZonKnzalMA/B9T3by6VgBfY5QmVt7EVVU/1BUHMU06Z2IAEZ3jy7Hu
	 ITdmxO8/S5zl6AgvJlwqzFg5KiBiwGmIJ6Ya3xD9ZrIbYrUYI2JwF4GUsk253qQnxi
	 cCHX1WpwC9tXVQwSsVRFiSF8RB6z0i4lZEpUCiXhVKFYfpEmk/d26Axgawqoy1WF/0
	 0D1CAbHq9+hzSWNof6jSr+aKecdHPHqo/Av2g04rXkbwwbqfp3i3FoT35VlLqzGFiM
	 5l9NIr0ZH2xhw==
Message-ID: <sashiko-outbox-203554@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] hwmon: (max31760) Report 0 RPM before the first fan
 speed measurement
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261108-max31760-fixes-v1-3-a61450463059@gmail.com>
References: <20261108-max31760-fixes-v1-0-a61450463059@gmail.com>
 <20261108-max31760-fixes-v1-3-a61450463059@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 04:03:28 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The tachometer count registers initialize to 0 until the first
> measurement cycle completes after power-on. To prevent division by
> zero, tach_to_rpm() clamped tach =3D=3D 0 to 1, causing it to compute
> and report 3,000,000 RPM (60 * 100000 / 1 / 2).
>=20
> Return 0 RPM when tach =3D=3D 0 instead.
>=20
> Fixes: 38b04ad02d0d ("drivers: hwmon: Add max31760 fan speed controller d=
river")
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108-max31760-f=
ixes-v1-0-a61450463059@gmail.com?part=3D3

