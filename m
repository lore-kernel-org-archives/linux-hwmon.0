Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793572627;
	b=An0dlZu5FdJ3ePz4swIX3Nfup5JQTJgDH4gQ+2wdOPHWQL0dxnAZwQKzSmxFfHOXIYcB
	 THUdvO1ihlMmAjXZRJB4AE2wa7bj9B7fyUmtC6bd3lLzOkABIqk3n+/SMEbOjOmSK6Fuy
	 WtmyUQIuDIiytdfk1Z/erzpofO68Mde8zz/czCXeigxUeubnFUpv3J6doHYNmr5sgHNrg
	 2xrLzX8iuEm++XWMlR/goQgiwqVB+YIJnvT+6nmzYyeguclVvr1Vgzoe6gvgPap3VglKg
	 ePqBKtsYeaztA0m8FllOOeESg2R4QcgnhN5Gy3hZnB0wRwHvIqBkgIDSSKOora74XqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793572627;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RK3+vztI1vNn4OfcVJGZom51QJpK2BM8NoNEB3aLp1s=;
	b=owxA4o9M4stRxg/MWVDJKMuLKO/G9SPQiBFHomp9XpPsXmt2/H+pDfll19ubCuGK65wG
	 Gb3C6f1u/vQObRynJZh/FvjkqKYRCcvWGmnDbBR7WFFkcEFXoLVcHPq+7P2kyTu1/LyZU
	 ZwvwaiPgC2gVVDNtjKHm1AZb33SbvtsuiHl1GJYBGui52nw6jccJH6aTay86fDzggZfyp
	 cepMUnUuB3Cxp60yGXtbuDioynhly3eIJvqyBp2gnKW4NUbGD3duouvDdKxb1A6Geo2AI
	 /pXsImvZ8ysBeXUdxI0VdqoQh3GQ2sNKNSsPr/xOkQxvZM2S2JPUMa7RhlkFU72KuCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CHJZy9mA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A07B606A324
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Nov 2026 22:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CHJZy9mA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 045101F000C1;
	Sun,  1 Nov 2026 22:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793572627;
	bh=RK3+vztI1vNn4OfcVJGZom51QJpK2BM8NoNEB3aLp1s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CHJZy9mAVrn2EfCJLO3FiPs6Q7lKHysT/rsCha+yiFVgHtbv5l6Oz2YlmzgO2KwTt
	 YYME1Bpxju564R6SpdPgR3oyzj4ZJn0YMlb0jBYFETxbuKMfybsbRQpmzoj2r/M1PS
	 4puGQFvVNs78R6J8rfNWYNpLk5SJ1cTdJUmsGOa+s/QFDvzER24w7LtNygc7naf+1z
	 h4iYKwcFW9P3EWrdTXrMn7Dv1voJBNmtgC0B662Xc1HH1JwYLnhmntnVbOLDN5sbO8
	 CQswEkWCAlMUuquDAN8sgHs8Gthd1ny7Q40AYeY9ukZfoVm/6MC9wYtN3fjq3JtpD1
	 LUhR+llCmKbOA==
Message-ID: <sashiko-outbox-192718@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/7] hwmon: sy7636a: fix negative temperatures
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pablo Mazzini" <pmazzini@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261101223125.302001-5-pmazzini@gmail.com>
References: <20261101223125.302001-1-pmazzini@gmail.com>
 <20261101223125.302001-5-pmazzini@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 22:37:06 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The thermistor readout is a signed 8-bit value in degrees Celsius.
>=20
> Fixes: de34a4053250 ("hwmon: sy7636a: Add temperature driver for sy7636a")
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101223125.3020=
01-1-pmazzini@gmail.com?part=3D4

