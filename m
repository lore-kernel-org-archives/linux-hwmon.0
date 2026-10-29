Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793292523;
	b=qxra34yQHwRWfnX2MavTOaQuAlTs0qX8tQiNZdVQ89Xhv6r32uWBldlZ+JQPKUjmMjHK
	 fR5iz6Awu0uGwFOQKQWcEz7/0kz42vbc9MaIjNaB4nwUBSAqQT931doI6IOkwddtOX+US
	 ZQn4oAtQZZlTo5z1FWagL/Fd2IKLZYNEVaRzvUTqwyYxSfv7xU7FiLrkF6KQEYCmpxDL9
	 e7twPAViF4saN9eN+GYxapJEuO02/IfKAwz+bxPjM4haOE1YsaPIKYbpaW73/QfwieENJ
	 49yzfwF/cX4dlWPN/1gtwgkxdE/dT9c1vbCM+myhVCYysorebk8luZy9Iu54FOSmGCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292523;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oX0MOfujR27ilWWUJgFvqBOmf9euIdZ8rpLbKkaTfPw=;
	b=v1BfnK/ctOpxB467D1JiewB5t//qck9ViQm+zLz6OjgQ0MAI7tV2d330xMlxDIw2xcwX
	 tfZxkVDx4wGOoiCPGZwBvTYebTuGBxdb+wFhEf7Vf9XTBAmv5F4WUCrqO8h90zzvgZFOb
	 bqKnlM57/9BEshpDCYgk0UyUzHsgl1lT43LDaKN4NcpiI5MnDr+mQfUGwftCJfQ+sTeo6
	 TqidlZl7f7jnbCduV1x+6tM8eJNELVOfiJNvUM/dppqHrmKpHiQppra4X34ETRnc0afhg
	 RN+FNzB1ZfdCm3yt5ICn8CPfygZzsOvXRnRrcKTQzNt+NtmjPUoPQKb5VlVPk6vFE5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I3u0sXjo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D8D606A31A
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Oct 2026 16:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I3u0sXjo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A69341F01816;
	Thu, 29 Oct 2026 16:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793292522;
	bh=oX0MOfujR27ilWWUJgFvqBOmf9euIdZ8rpLbKkaTfPw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I3u0sXjoKP3i86ieSCKqpqPx/VEpUUq0cE3fK0y0OgETOsB/7ojW7rPlpQS9RmTm+
	 XLNa44tDVfbXzdKkoikq3+sG7e+Pnf5DRRnDfHx9I2MsAG6CJ6GdWLXUvua6Eoae+e
	 Zi/WXnBrWWfiKrt6GC3XsWskClsLxn1AL449ZsXHhcultewUdiEu7BdYIcgLzG7gEb
	 Z15KW+zUG53uSc4rT5PExF1y13zx+BiIpFuwmshrs2EtSA0foxSEvDXF/ev0CqpUfd
	 /bmyur0HxNMSkwZ9BERP0Kw6/9+70WGO4KZ87F5NywUbXK5I8fK4aBdxcyUhGIpOgc
	 QVPtwx5/Mtguw==
Message-ID: <sashiko-outbox-189679@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] hwmon: (lm87) Propagate cached sensor read
 errors
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmFlayBLeXUsIEtpbQ==?= <pocj8ur4in@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261029164016.338450-3-pocj8ur4in@gmail.com>
References: <74e00272-306d-4d83-b6f6-10059ad3a91f@roeck-us.net>
 <20261029164016.338450-1-pocj8ur4in@gmail.com>
 <20261029164016.338450-3-pocj8ur4in@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 16:48:42 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Abort cache refresh when an I2C read fails and pass the error to
> sysfs readers instead of returning stale or invalid sensor values.
>=20
> Read the alarm registers last, since reading them can clear latched
> alarms. Preserve the first alarm byte if reading the second fails,
> so a retry can still report the captured alarm.
>=20
> Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029164016.3384=
50-1-pocj8ur4in@gmail.com?part=3D2

