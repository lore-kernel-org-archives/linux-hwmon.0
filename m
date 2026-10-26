Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793004350;
	b=zGZSUFAUWCFfktTJ9Ffsh77c/94F8QNYsQki4lOCHYLdLm1qFcmC7/i4eAklLZ+u/TNg
	 SmDsBxKLJjzRAAq78YunMuWQLDA1BS+gkCvRNg5O55FqLTVuIvfICchjsNch/P6iMnsrc
	 r8P0PlPdWDm01HtsUoxZZiaUN/K/I3y1fPoZNZN8oeeKWmhWICkmflcK4TL3Dd5/hgNK5
	 Ln0WhhnqZLZKqUuUomf9/5GtSAC4GIY5IHL5F2UUUN2FQtYGrvf3m8Anh72MQxJNqR1Oe
	 k5RAomFlBDiIIEFop87z1BWBiQ4EEdgaf0lgCY87muUBLQbtI9Q9vNIfvlZDRw5ZLYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793004350;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=E1GDUIjmDzhbHZuoVcMUwDJHwzyDqs1YTco1RGDK3J0=;
	b=31mzaqmR2IP7Chwl6dSPbnYKLpSjFQWHpmiy6Kq9gEo/p9Q+XijEon1KNMqPV8z2+apA
	 AbJy4F9ZLFigz+yDB2/cVnmco/yfgzdF7bOujy7C0FvJiE7DzRsNe4+7MYVv77lSPw45t
	 Ith1YTEsPOp9vluBefZ3f4xqxxVY3iYU54iNOs9CIoOFxG0qQBtHpMejwaaDUqyPHYEkQ
	 alNioV8V864Iluil6AVDkzLdvGZDTeTnbEC2AR2PBcr+18OOkeafuByXA94/NuBlsVWzR
	 DBCzJPCI2hDUGFPgWJLqoPE1dZ4wP+0l76hG9aX8sd7I4MDpEJWRU0zDsonR7jveYzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KIZBcfmY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5D6606A31B
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 08:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KIZBcfmY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CFF31F01829;
	Mon, 26 Oct 2026 08:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793004350;
	bh=E1GDUIjmDzhbHZuoVcMUwDJHwzyDqs1YTco1RGDK3J0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KIZBcfmYHytr1OUKHklBTM2jR6EulyYcgfXIuboWbqUj+B03kSpyYocaFJfMixcQV
	 tfKjC7OTSfciwNCICVV//Ta/tiDiJtuCNEcxvynFXO4jSp3p324offYv0Oo3E41Cbi
	 1POLb8lmvh+RRv/igEM39bTvv/MWLJYF9/bvFmDSLxhEe7QWFclhFp8EFWaJpZId6J
	 YlwGjcKuD8ojqGVJF5kKASdXgltNSa78CIpkSGT8Xd22B4t3cxmvJjPMmByL8EF/jE
	 6lS9WfOovsoofJXfQtLXtSWi+LPQunjpwLj0VnFX+Zyh7WyIUgULjH7Wtrq2qaMb6Q
	 AikLhWEu//wGQ==
Message-ID: <sashiko-outbox-184687@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: max20830: Add MAX20810,
 MAX20815, LTM4739, LTM4740
Reply-To: sashiko-reviews@lists.linux.dev
To: "Carlos Jones Jr" <carlosjr.jones@analog.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261026050241.100428-2-carlosjr.jones@analog.com>
References: <20261026050241.100428-1-carlosjr.jones@analog.com>
 <20261026050241.100428-2-carlosjr.jones@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 08:45:49 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The MAX20810 (10A) and MAX20815 (15A) are members of the same device
> family as the MAX20830, sharing an identical PMBus command set and
> telemetry (VIN, VOUT, IOUT, TEMP). The LTM4739 and LTM4740 are the
> LTM-series module equivalents of the MAX20810 and MAX20815 respectively.
>=20
> All variants use the existing adi,max20830 fallback compatible.
>=20
> Signed-off-by: Carlos Jones Jr <carlosjr.jones@analog.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026050241.1004=
28-1-carlosjr.jones@analog.com?part=3D1

