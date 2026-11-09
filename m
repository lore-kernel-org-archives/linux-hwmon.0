Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219891;
	b=DwntMWSQQFYTuxB+yS5EDXO7uYrj7CghbpPpwwyvu5p1UcE1tnO8Lpij8/+2n3BEFAuh
	 iUSddWQNjj8hQkmkSuV8hnKJPIcN+Fh3a2T264a57WIRJLUljLBU7xO+Nxmt/Zh3rXm5v
	 XwNNabAF7hwO7ZSUNxrbrVhH/7mtxC4EhYeyHzlUD6zjmrf0G1D4hPedSl2Xm9XAXbGYC
	 T9gMsyAojeP7cZ2zUvixOw8AaMcRCv56b4wALU7YJtc0io2Uv49UafNcN/XlmVEH2x931
	 9rMsgE+H5qxzZKJipbTOE48FhxMPz8xXRwEOVvlr+DbsOnc2EYhrFo+uNaJLPR7i8Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219891;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=a6mWLiwTjJW5J818L2N84RjoWVGizucso1t2lkiYAzM=;
	b=aOSjnz6mwq+tXkH+IOf/3Ao3VwVvOO9zQCKeK3sAfAPDShbLlM9/Xt4RdDDsZrM23W1X
	 CbtvrXXU/LmvFaoBPf4EYiDIj3Lx4YKKY2tgLZDbz8YGDbg/A8oIIlISyOGhK9uv8V46L
	 tse25JPGbCg29H7k43eCMivHU5mgHaCOrg2YOpddSWPLdVJR7AfC0HENnr1Tu3o9TSf5n
	 l+o53xykPrArX3Ytr7fncsIDt8/TwD0Lj7d5VjVtsHc43kmWk4lt8Lj/kIyopBvXzCh/h
	 lyxMNmo+HNLGa1Ud81t6fp4apsAum9Kvv00jn0OgNvxr7tPAiB9BvrmYIN4O2dwZZaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WKFhA4Tv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378D4606A332
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 10:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WKFhA4Tv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98BE61F008A1;
	Mon,  9 Nov 2026 10:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794219890;
	bh=a6mWLiwTjJW5J818L2N84RjoWVGizucso1t2lkiYAzM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WKFhA4TvRmKqyKdlRFOeFz41llSoeMDK7khm9carwwc8Wq7uc57riJA1M2dcFQE6B
	 5rlYpevpTNkZnwgr+/02ydIJxCEa0Kmuqc4Ye6Pg7iK4WMuX3gFo9jlV3//Ff7QV59
	 SnN2eAllU0XSWq6coWUKZbcN7poA1tVJZ1FnKDiJdNCTQ7zW2b0k2f+aHkE5eh7osz
	 xpsTPkGGt6gCExl99avWc/3BRYj0qt/Mk9XMApTcnhi8Uj2WClEdKHLrx+Rtc25Pvt
	 SGBcqVbw6qWzkCwHYHqTaC26Yqr8YQ1dDHop4QwWlVhW9o1CS//RtgwGqZJycRC67Y
	 S/EgWw1oxBcAw==
Message-ID: <sashiko-outbox-204812@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (w83793) Clamp temperatures before rounding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261109101800.17028-1-zhujun2@cmss.chinamobile.com>
References: <20261109101800.17028-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 10:24:50 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> TEMP_TO_REG() applies its rounding adjustment to an unrestricted long.
> LONG_MIN minus 500 and LONG_MAX plus 500 overflow before the register
> range is enforced, potentially selecting the opposite end of that range.
>=20
> Clamp the input to the requested temperature range before adding the
> rounding adjustment.
>=20
> Fixes: 6800c3d027b4 ("hwmon: New Winbond W83793 hardware monitoring drive=
r")

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109101800.1702=
8-1-zhujun2@cmss.chinamobile.com?part=3D1

