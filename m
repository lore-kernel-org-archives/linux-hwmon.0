Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420340;
	b=Ijmfur4t4iMr3gxe0OL6RzkHfHx31fYTPaC1NBlkaGwacjMGNnGKRsi+FkarFmXZ0wnR
	 EFAte7Z0uL9uKBXP4/Ify8ESBu0mIT1DV4kOAQwXeqH2F75cquD/q2J7nSu5BOUStpZ3r
	 dX15ZCKiKE+AT9ZS3i0HPMqrfvTBTK+uK3B0Seb/EDd050pnX7QzJwmExNCbX0KZdrEQ5
	 fqH2NcUKyOmkcE93MtplU1KKkgkr6iiltrEimSgCkcqAKWk0oMFdM58PiwES5LzD8DFfC
	 upxYp+SUmyWp4G9CwSu4Vtxuv6pB3ibfUfGnfWWmDYxofI479ggDHfshge2lYi4cXNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420340;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zSo3unqvBrZporRwPav8awCXc1FvN+t8J/dMOVvmeF8=;
	b=yP9psh/FFox2xj4XrYBU2x6gRg2y6/QpVMH9zoTx8oa1VoU+O0m+Q2VPNsjSwmnsJNHI
	 DRByctDwbV9tCQeLAdaUCVHl6ZtgMLp601keTXgWNWym/5c/lqVt1qOlZvWLsARuZy77a
	 XZ47fRhqot3Nbv7WIgZLO2rvB69mNaDoe3OaaNWZ7jro/5k1W2ZrVM+5TDbw1P+/EuMy0
	 4YNXtN2IUCJqPJLbm5THMdDiRz9f28bZn6JarVq3hfuAnlX6S2tOmfZpHG3v6ewUlJ97Z
	 0g5IHMxNC05LbzTWQXh1ShD+Vb9Mh+E9fXhJxwRw1yf8MIeCk3woNmXmobsfHadK08A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Busl06BC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D65F606A687
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 07:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Busl06BC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0F701F000D1;
	Mon, 23 Nov 2026 07:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795420340;
	bh=zSo3unqvBrZporRwPav8awCXc1FvN+t8J/dMOVvmeF8=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Busl06BCneAMA4GyfwFZiOmAB9B1wwjvxqM+4I1f+rdSjIe3tx9pVfs9+x4Bvmj+y
	 lKlbAyg8gnQBCRr8u0evGKgQQpdILB4SxUbNtS6e05l32L+B4SiksdSlNzCq0VQAIm
	 RtXsuYcYRkCxmbwUHX+sAhmmzzoy5dPmTLad0vrhfmI3Q96euj53831LsB4+rwYz8C
	 YElD1OSoAiovH1+06d/0h82xHush9q7cqJJb0vyiuFlDO7am15S9C7he9pMQc32jGb
	 qnBQYV93Ng/sJC8xEAbyxE9wbWCvMUNFKpFywyjauAZe5LDMoR0by+/WUZY2jPqWEF
	 mxKAOb0ZbuvWA==
Message-ID: <sashiko-outbox-228843@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH hwmon-next] hwmon: (it87) Add support for IT8686E
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261123074813.18577-1-rosenp@gmail.com>
References: <20261123074813.18577-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 07:52:19 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The IT8686E is the main Super I/O chip on many Gigabyte AM4 and LGA1151
> boards, often paired with an IT8792E. Its hardware monitoring block
> matches the IT8689E: 12 mV ADC, 16-bit fan counters, six fans, six PWM
> channels, six temperature inputs and the newer autopwm. The fan and
> PWM pin multiplexing is read from the same GPIO registers.
>=20
> Unlike the IT8689E, where AVCC3 is always present on in9, the IT8686E
> only measures AVCC3 when bit 0 of the PINX2 register is set. Hide in9
> when it isn't.
>=20
> Tested on a Gigabyte X470 AORUS ULTRA GAMING (IT8686E rev 2 at 0xa40,
> IT8792E at 0xa60). All six temperatures, fan1/fan2 and pwm1-pwm4 report
> sensible values; the CPU temperature tracks k10temp. in9 is hidden,
> since the board's BIOS does not set PINX2 bit 0. The board's BIOS
> claims the chip's I/O ports in an ACPI OpRegion, so testing used
> ignore_resource_conflict=3D1.
>=20
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123074813.1857=
7-1-rosenp@gmail.com?part=3D1
