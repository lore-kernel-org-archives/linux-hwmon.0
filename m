Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593733;
	b=SHEynlq2I1TsIgnuVcf6NSuj0xya7W+JNM2sD8uWFONGIfBG5tpg1QOuRH2lmfmckhsd
	 az+HIn3haABG6zZlzGjlGWGslkjxB/ivJ0bz7IwXy8SQN9VStMPs7SIGN6MS5GbYt/y3s
	 jAank5/wfs84e9YzkP65ksYaFBxbyAo9dSGnzh4rWxKjgpbvpuWXY382QO1R+1JMgHjTa
	 dBV8nlip96dLIo9PSt8qNTDhRCWmnr+U98FEnyoZwq2+aifIAYsv8U4HUznYCkig73pr9
	 0eTgitosyOQxhdfJ1TcxapSWXrLMtVxy0q/R7QXqxa87Ot9jyGXR1jF0Sjju8056bag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593733;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6mRdi3m8TPRl5ORrWZbmdpjyT6wm1MrDdekjQWk2bT0=;
	b=S2kT3VHXcf/xFewSx+lIDj2K50SDiPR/O3NZfQSz1+7OpWydUszQsGDKsIJRQvrCv+jJ
	 XVV0L3DOAtlaweRQ+OJNeosPE8mu+qS/KYI43Y/z34e1J6J38ssqALixPNeiZ0reQp9V/
	 vPg1nVxLU7wsAxMLuKjuKwPQteKVxveJjuw3tgcybjXGUd41RPfAWVqMmCGOibWV0Apd/
	 CW7yhdj0s/CuT32x6SqB6h6fvWTvL6nbrUF72lChWcg5ITjb90mhz7E/Syb5fWSrDzHgf
	 mM96lpzERo5lRMRi/lZ51kf4jKK62hXEuX7XpanCOKxVEknqioKmW+qzt9hBNeOCSQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aA7+nB0O;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D47606A882
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2026 18:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aA7+nB0O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 746AF1F000C7;
	Fri, 13 Nov 2026 18:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794593732;
	bh=6mRdi3m8TPRl5ORrWZbmdpjyT6wm1MrDdekjQWk2bT0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aA7+nB0OP8lwumk80Y+7EakihaT8uWpecFRS7amDjRXrgDusSaTCBg72Z2yWpC1pZ
	 1lsehRhS+zbBTYNn5m6rcAF7ajhQS/soPZUlIWOduzCDwsnp9WD7VpcYdBc31X1kMG
	 pEKngNe2GVPDK2DuBwg9P2XxW3IXEKNT5hbk2pQPnNMoHsF1nCQX+JXPCMvtmbwCki
	 /Kk/0dm62bv/PbxQvf7EYkXe+RIS88ivWTfihoFXQh9kJMCALq0K0rGBnLxNJxjnOv
	 S/vWik2h4gdLdAQVP3dtZFDE2AI4fOkEcpySKmCodSHh4nH+KJZMTKiIOlg/A2tA5T
	 Xl5bgTJC4dSmA==
Message-ID: <sashiko-outbox-213400@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 1/2] Documentation: ABI: testing: Add
 emdoor-intel-wmi sysfs ABI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ziqiang Xia" <xiazq123666@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261113-emdoor-intel-wmi-rfc-v1-1-d77ecf23693b@gmail.com>
References: <20261113-emdoor-intel-wmi-rfc-v1-0-d77ecf23693b@gmail.com>
 <20261113-emdoor-intel-wmi-rfc-v1-1-d77ecf23693b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 18:15:32 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> From: Ziqiang Xia <xiazq123666@gmail.com>
>=20
> Document the fn_lock, win_lock, touchpad_enabled, and auto_power_on
> sysfs attributes exposed by the Emdoor Intel EWMI platform driver.
>=20
> Signed-off-by: Ziqiang Xia <xiazq123666@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-emdoor-int=
el-wmi-rfc-v1-0-d77ecf23693b@gmail.com?part=3D1

