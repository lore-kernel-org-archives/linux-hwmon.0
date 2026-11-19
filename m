Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795047186;
	b=O4JpNrUUcFBd61ErqDciM5OHpY+sOwC7W+8BFUnoSt5BvD3GAtznjZCZhq1R3ksMO7Yd
	 /01E9oXcOAilVveyy4ufyQi+5n0Y06Z38QKVVgv6wEBS+OiJC+Am+flbAUgL4SfjTI3/b
	 90bc9V1PgD1iUaBtZZjIVu4BUD8bMl6/LObGB/+lOG9o/1kYjzLfojTQ8U1wLQQcMPmvp
	 H5/nTLOpnjEgwJBve65SQwSw2MRf7++JqAWIHBfBQzNkP1dSqbLFUDt17o2oezRrNbdA/
	 Y+D56jLtvMb6G5Z76KH4dK7Y+9o6Q75ZFy1GCxhOkbWvSvl5pgga3WsuqDNrIuqz7Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795047186;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=r5ZSl3jj0MFATnk+V57z9z64iOE3H0XzH9mOp0UOeNQ=;
	b=Z+NPMCBJj8//wifGtdJn1d/MdIt/j7RHkSUtfhEugeYcqHmVG+M4AFKiipAQbNkLsu+E
	 TgsDYTHXDEp4mgLErKjfLrumI6FA5mbUaRNtfskKmPNBLQPBQO+ENgUEV+CXkBYlAbxLo
	 LJZw70K83uDHCA3rdQAPI4VlhFQHMKh4xIEQSLsefPZaA+ROP9nkne9R1oTrqqiS2+JAb
	 iitgtegd5CKNjMvBCY842GBxrccwOHaSmPBKzn9W5Qp/tW87D0EK2JniL2CHD3yNRjwv0
	 dypqrhjU5deKXl12xoZiaJrHeZVYjes4aOMC9KLHALgxrS2t/ROvevfGoX/buX72f0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mFOq3fPF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E52760A2609
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 00:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mFOq3fPF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24F6D1F000C5;
	Thu, 19 Nov 2026 00:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795047186;
	bh=r5ZSl3jj0MFATnk+V57z9z64iOE3H0XzH9mOp0UOeNQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mFOq3fPFqhOsQn4A3L54znxU0cgpnYNRMz34OAfH/B8VxonKjWLp0xquUhsH6HsGB
	 i2m7XVQRpd71DzZ9T1XObpaci/juYo6HOXf6o6Wcu8ug20mCWpQu3smElRIEkV8Mt4
	 aLJATvmIVHt05UfpjpqJMEbmCKGgjWQgbLAhM22n0baBKg6HC4vn4ioWi4TNmgqwNN
	 rb2lzF1mhAuQn6Nt4DNZNXaIW9mib4lD+gortA9eDUKwidE77le+mcRByZRbUpk3Xq
	 zL1wE7z6QtWf8byxzo4J0XnhbodCJ8eadqcNjzegE6VaZc7uDRDTTxJ/6C8enKRMO4
	 GM6sa7jzHFx0A==
Message-ID: <sashiko-outbox-222237@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/7] alpha: marvel: notify environmental events
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matt Turner" <mattst88@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261118-marvel-env-v4-4-200317e496c2@gmail.com>
References: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
 <20261118-marvel-env-v4-4-200317e496c2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 00:13:05 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> A change in the state of a sensor arrives as a system event logout
> frame. Call an atomic notifier chain on each one, so that a sensor
> driver can reread its sensors and tell userspace without polling.
>=20
> Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
> Signed-off-by: Matt Turner <mattst88@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-marvel-env=
-v4-0-200317e496c2@gmail.com?part=3D4

