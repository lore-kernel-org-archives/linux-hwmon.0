Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794254530;
	b=I/XogoX7p+3IJJcTV/8fT1Zm6IqD0ikCC2VYDRz5JRPKQPTrH8DGFpk6AfRh8ZpmpBZX
	 AAd/eeTaBXOTwu5lRqwRhNviZ1h3U9Rb4Nfz6CJktOJsrVzDrqXtl8Ns3p86JUrbbG1Yv
	 AbpaEeqrbB17rPTLrcCMtxwSpzQO1Mc3IlotPaSgYzUgmafQu9yZdsoguDSmVtK0fnsjp
	 sk0giwM7WfB5HdEekIMlgYW0dpet/Yo8gsPZKIsAbLabXMCyje2+ikUA6YFN1JGYxc2+6
	 JXwEArZkptbOAaz/2HFOw+VQuaXNTJRlJxOamIM1erZU7qnwQBhsNZx8F5FUQOwMaNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254530;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ycWxdupgMnZJa0hQn93JJ6J7E486/T6u0bfIjf7FSFc=;
	b=FkocISIrV3IWGM+h0XDmHDmb9rNi4RiOv8ZZRPL9swmQki76ufiTVeurhN5903iVu2Aq
	 molUgviThKH3W+0HqvTxqmtWcA2yzKExPAUD2EuYZhdhgo/LVGYSAwvAxhLrquGKcU7Mw
	 w4Nu33xhLT+d5uKml8jDKyafqby+wmE3wuHfwDQQAHuAVNFGsNIlu0f4oQIPeKGxuIzvf
	 XPjpZd2PN+xodPiHmpbz5DElvdgDiwnNqNw7nn3qbceKAQAlM9zcF6QHvZD/k9TApo7F7
	 CcLzirOK/f8i0G18p4k0FFOE+q7vYJ/J9r3bIgCIEDgDmEsGn4EZtNTmxvFchGn1z4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kyiWjt7G;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F11606A331
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 20:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kyiWjt7G
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 777D51F008A1;
	Mon,  9 Nov 2026 20:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794254529;
	bh=ycWxdupgMnZJa0hQn93JJ6J7E486/T6u0bfIjf7FSFc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kyiWjt7GJfpay3LzXrz1AfACiDN7k8NkaQHM4KZ3gxwFxoRGpUqJLh155B4kwQKcf
	 PTD6vc4bCwYRanVIH3/12BwHQnVgUjxUjc2nzblFTDabK7hHCAVhj1xhn74spPxNll
	 EC5miXcVhaE7RAZcGJIfaZuABKy7mZV++SNHSli4Cp2dHf6I2Hzx9N0qVb2lBAGRvO
	 bUvEvSbF7LUzQA8zhW5Tqzcs+8jAqkc3m9SCs0/Unf4UdpwkKoM66aYYn2kFAmk9Ep
	 Y3MwLPKi29GLcAO8A39za94E2nETjsJLWrYtvQmEvoWIaDm27ffBnx536kCZ4VPiGv
	 pnh9zXkIJ1ZGQ==
Message-ID: <sashiko-outbox-205525@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (w83627ehf) Clamp voltage limits before scaling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261109092654.5177-1-zhujun2@cmss.chinamobile.com>
References: <20261109092654.5177-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 20:02:09 +0000
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
> in_to_reg() narrows the sysfs value to u32 and multiplies it by 100
> before clamping. A large positive voltage limit can consequently be
> programmed as zero instead of the maximum; 4294967296 mV reproduces this
> on a 64-bit system.
>=20
> Preserve the input width and clamp to the representable voltage range
> before multiplication.
>=20
> Developed with assistance from OpenAI Codex.
>=20
> Fixes: cf0676fe42c8 ("[PATCH] w83627ehf: Add voltage inputs support")

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109092654.5177=
-1-zhujun2@cmss.chinamobile.com?part=3D1

