Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884669;
	b=UoC4BFCimrEaY0x0V0eibOOhlkv6ALuq8NWUHVffOA37eNQ/UMxyw8SpI5J1VlloBSWW
	 xuqisVaMgwWY8Qpgtw5vgo0t0OuQuAHq1EZCxOakT8UsGgTDsN1+635/wRHJ2vu9NSHxn
	 CCLbB4CDVoBm2CGNE19Bd3xN6emicGNHa+kDwXzyIPCpYYuuGQFifIr0yY5jii2+h+q8G
	 UaeTpx5iiu51TjIDJcgJjLkEaGIwzivAHI0AQ4ActlSa2jp54KETSwfw9y9TgrTQ9eSS9
	 RMVEY0BIQN4ZDuzXmjIZlLvSxpSEnR0Oko0BhSY2ljbf0kU3l33W1Zqi+0PnACoQwXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884669;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xb/Lmpi16wGzXfRywNvArORNafiU8JN27s1XVfx8u7E=;
	b=Bf5ta95Ck49+HKy8E7UVZcq2NI/3LUUzNf/u56xleUjdoa68OyFhYD9iknyy/2Dqvtyh
	 1g+Aa7NJ4W5/IvlcqDYOyQ2F73hc8mZtWC3ORog65WDDLyBhjpYOy4mqx+Zq83ZwwMzWx
	 6I2K4PHhU7/cxJjvlFENuwghqsHmUV62BN4spltXnX5IQ4NtEPY79l63HaF26QuAY+Rxd
	 JNCyjCr7yY/CtfVipgiLWqtXZolEmdMdIpUyhS837I4Hook90F4hvPzsTrH6NmEXCpc/P
	 4YiH1ZrmBa2SKWLPzSrp6Vk2RX2Ob8F306yRf/Mcxx1CxoVNHwhyBOBHV1Tp1zvX2oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kCFmYnwU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36165606A31C
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 03:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kCFmYnwU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A73371F000C5;
	Tue, 17 Nov 2026 03:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794884668;
	bh=xb/Lmpi16wGzXfRywNvArORNafiU8JN27s1XVfx8u7E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kCFmYnwU35keMOkDXDpULCLAYovD5LTObzrjfBRzh5K71R9Xlm7O0HN2eR7nBLEue
	 3nS9lq/PaSHd5BJgSS/rvlq+/FRJ/OwGMaIEIrEEEbFzEi28OQBdZR2MTHb9VW9UPJ
	 ltw1bmqhf0iLkPwiADRvXkDd8ncz6NmX3+8IdV8BwneiVMFM8VI+ptmoW33Dl8dU19
	 wnNIVaVQqT5smtFsbgdOiBN5uYwqXQhOuWeUsW9e/DHXC8E/vBfUD1m3TmnUEYTvdw
	 Fz8pCukMIuSXy8hlNSkedHCh8fWc1IPyaI4q8zrj6ZYojZWtk89hTzqw886ffq3nqV
	 KsjozbR1KTmSg==
Message-ID: <sashiko-outbox-218118@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/7] alpha: marvel: register a platform device for
 the environmental sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matt Turner" <mattst88@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261116-marvel-env-v2-5-ef614eb2e7f1@gmail.com>
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
 <20261116-marvel-env-v2-5-ef614eb2e7f1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 03:04:28 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Register a "marvel_env" platform device on Marvel systems booted from
> SRM, for the hwmon driver to bind to.
>=20
> Signed-off-by: Matt Turner <mattst88@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-marvel-env=
-v2-0-ef614eb2e7f1@gmail.com?part=3D5

