Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795047160;
	b=QTlhCszs4kT4fa9Dae+U4c3+8PFzDh5AiU39XuekSsGcK70F7ea5K3j3eGJx7+A7QuuO
	 NwQPUBnNoOwvCzYvgMhuvtummYdoI3WKd1Qf1s1VvVxrDOzBWCCQDVU+rfCzmR2WCaWet
	 K28WyNph2e810OPtZVtKFOWmGYCfUhKR6AAr6IoBqh0TvXwPYKDrwCIOalG9nSfJN2Y+S
	 tZVcuTzBAJnM72t9F+AznxDM4xuKJDWKcVrOX6CDTL7jLamaw3hgDeI/+M4mtYW33ImtV
	 9JdQk0Ovu4YS9Q633bqjamDnARtpgJWwIlG1GUlLZmQ3rG6+E4KtqC41xWsNKoIsliw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795047160;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UHEixifVejnjgq2sbNd+QIf/+gb+/OICDd6rrGO7I34=;
	b=KGqVhNfrs7exsle3g++uox/4hqaBErGpwwohPxEsklqXiciCZOdRDvaaEMfGZDung8Fp
	 0DOnchAo89t1j//8ub++6UPTR401dZ+x6r28N7O7unDAQ84fIOEVy1oSGazdECW5UWLub
	 O4/sDC0mrX653lgPrVV0Pj+TtbIMtP9d5MtVgESZg1AyO40OG+5oqircyrwPJn2azcsfE
	 a+57Y8BjRvZqMbpMGdzBPfxsgVL67wWHt812Ap9fqSqSbDnpIUUOxJJCNzYH7HaAtGiPD
	 GQ0z4lyqWM+W5fudwPqIcuOweAxBYr1QL3+7OKwaOXijwjSbB6Lq+53oObBXW7cYaBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MSRRxWoH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC67E606A320
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 00:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MSRRxWoH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F8BE1F000C4;
	Thu, 19 Nov 2026 00:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795047160;
	bh=UHEixifVejnjgq2sbNd+QIf/+gb+/OICDd6rrGO7I34=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MSRRxWoHTXqcB2UNANZLZoemBK28SYRjTTQukqu1HmX9Mc2TyIGTf9dvagd3EyxPD
	 4AuLfnNmq7pMqiyJEmRshwhU7b9B6sMRo747rUEx6Q159GiQRgN+wFCEs0gJECF/Z/
	 jUdPZ05eKaXfuCoaQwlDPWP7l6xN+GC14qc/ylYMy+ZZnzOa5yanEPWPy8tR7/m4zV
	 KVW/YsawnRkvOXP+RhygREioS5Mw2Fh+tLMtXPoAEUhgMkGI0dnWMTKC1gFhof+Tau
	 R4IcG3+S2ucC1BulXPFZ3PYQKpAAdAS9wLd4Fm080NgPaaS129a/l9mNre4tI87wFV
	 NPZaDLmIzAbXg==
Message-ID: <sashiko-outbox-222236@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/7] alpha: marvel: register a platform device for
 the environmental sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matt Turner" <mattst88@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261118-marvel-env-v4-5-200317e496c2@gmail.com>
References: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
 <20261118-marvel-env-v4-5-200317e496c2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 00:12:40 +0000
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
> Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
> Signed-off-by: Matt Turner <mattst88@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-marvel-env=
-v4-0-200317e496c2@gmail.com?part=3D5

