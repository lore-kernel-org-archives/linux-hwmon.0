Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380762;
	b=fCss/6HSaYGdJEkWLI98ys/y29PKZCPfJIDgBdJJFLo7sydXk3AxvEgSkFl5JvPT/f58
	 larkd7c95qpBHzTMT2AYVH3Ej8X3ZS0Q+IbqeggexHHfzpFVuJYfmbVZKzgF3TXsSde4H
	 dp9m4HDSJCPhainSD8TXbLwoGshr4vfL74lYl7L9Ekd5Rnb9OZjv2PTcTYNlL7y+741wa
	 3cJrpliJIrbYeOa0K5R6U9EgShJO6kYTXl1SKGSpk1Br/HZHVcz6bty2cCi8PwVtwR7HI
	 uP7u32pDlCe/HqVhSkBoGxeDZUVjHPa+joIWViMAYFg/+MEveFEQ5pGHrM+SmdqTZYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380762;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Dp+0R2qGSNYXCGndcFsmP1gandsbqTFe9FKfyEvRa9I=;
	b=NZ2h8kbwmN0PjbumlqNVtokA/qkl4HbTT32uXqGQU6f/yVlso9ogfNqSCI02MX5Pq85n
	 HiVnW6BLLmhJ6GBzzY14yTE8ltfuyIp0lwAB6NlYnrERkxBQTUXBbeeg9D04CF89AAX95
	 h6YwYxM6LAxVY+o10NxdWfd01QTItOcvG7izmfjQDzqTCA4vAGqZJVN2P5wLH2Y1TANhN
	 03v3GIIIQBcZ+J6Dd+WYlRQLMN1N0As8VPT+EbZj6uJV8yU3GzuwzMncsNKPeJCdHIv+F
	 alB0JPVR4OL3oJumRXqfKBQ7m+KFFMGqRqaemrVaPgo+WQI7pHg+3qv6RpzInOci5Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aBNlOVkO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3351F606A332
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 07:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aBNlOVkO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0F31F00A09;
	Wed, 11 Nov 2026 07:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794380761;
	bh=Dp+0R2qGSNYXCGndcFsmP1gandsbqTFe9FKfyEvRa9I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aBNlOVkOpNK1OAliX4WLLW91EuuUZ7gL1C9rOtlBcnVduiY5Mg9rhT21uwiqMITOb
	 QPF0R183jRHukb1JEqqQ5XcpndmrxfiAYSCAdEzoTDqr3335L2mW/l46nOs5VAJBm4
	 hSib10AafetImsJmdfs5nrUzOv05JgApgp6C+B0yXPriZ78LnF8aVGidSDw0TjYPk3
	 TzmbZlOxulXhBn/7Y9OD7ZAPc+qgroC763T90/Jq2xiKwte8+gmTrTjcad3C/XLy8K
	 tw+qAKDurLtAie8sZCsKz6bQrxIbHVRCkrQaTBuJgZRa89NwzmU+scLMdckJEb9onn
	 L3WmnsxrbF4bA==
Message-ID: <sashiko-outbox-208490@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (w83793) Clamp fan control times before rounding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261111065151.17581-1-zhujun2@cmss.chinamobile.com>
References: <20261111065151.17581-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 07:06:01 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> TIME_TO_REG() adds 50 to an unsigned long before applying its upper
> bound. Writing ULONG_MAX to pwm1_stop_time therefore wraps and selects
> zero instead of the maximum duration.
>=20
> Clamp the duration to 25500 ms before rounding to the 100 ms register
> units.
>=20
> Fixes: 6800c3d027b4 ("hwmon: New Winbond W83793 hardware monitoring drive=
r")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111065151.1758=
1-1-zhujun2@cmss.chinamobile.com?part=3D1

