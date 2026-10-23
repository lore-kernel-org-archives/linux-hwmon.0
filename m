Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792747369;
	b=pdi0I8POGQpUqntPD92d+YAEIdqxokhrXFbkcjcMOEY8qDlWUZE629BUQsIItQNk1He3
	 Mx0toFUn885jyCg0+/AAmta7ky0Bvyvdjwz1BUdK3EzEVA/X4Ya7RtSVKwo+gmHSGI/ct
	 5qpYWiDQNcMMx+70bPVm7P7/jXHNIoX6R3cbBdBQ6i9LMs4HDmTInfDbqEDZlbn15fGLQ
	 tj3f1DPfHEs+ByajIcJ+t/6VW0alFcsEoJFUDNkByssI2L9gtz3kB3vFy3PfqBNWSXtZZ
	 yG14sPjpsh7f1oT5I3wKWNDhuvfaGgbr05MwxmMgHJVaiNejxxA9Ye/s65lSYWz8kjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747369;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PExMIs84I3FinnDOnHYqkwu23wVzTO99qu3ERhcl3eY=;
	b=rD7Dj4HRYuWJiySwRapvDtiyHC03Ehys7w9Wzt6cZUDHtPjc5ZMjrL6MJp1DaNKfcnzl
	 wjjq+5dWjE1gHzF4NlqEO68Je55i3dV2KOnxZK9AXSM4+1lSjTYKqY3eA1Y7vDzlP8VsV
	 29n7xpVjIfE22Az7BFKEuqlOObT+4HOS21Gi0aRkZ6QBipLYC0QNWlgTszIdUHrUq2FNZ
	 +su8jxLNqXzW4MS/CaORUGbwYp19R7cZdRARLdnqX6GuctrsstimDLejSQ7jVmWJxREs4
	 mzLuQeu17+NMIfZGmBf96SPjgVmRX5zXZKrMt2YFbckktFQZs2B2jhI5/hlgnCopfng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TLtEOFnX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB100606A320
	for <linux-hwmon@vger.kernel.org>; Fri, 23 Oct 2026 09:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TLtEOFnX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D5111F01825;
	Fri, 23 Oct 2026 09:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792747368;
	bh=PExMIs84I3FinnDOnHYqkwu23wVzTO99qu3ERhcl3eY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TLtEOFnXc1BUIGSVvHOSFavQBmnjikBZzkoEq36DqYeuEHb2m23UvwBpZoyXZIwc9
	 vJ92vusXKwDc/vnkVjTIvqWcJFB7UHrh7sAfstt63Y3QxmtNm/VRFQ7txSKyVpDwIn
	 aTV42ZNh2FHQwzCI2fW2cLMjoYpWnZ84lN44BwcdvclMLmmqlQi4+7j/aE22bpueqw
	 V8bRC8DrI+jAkzFYLtDJ7/7SqazFp9SuM2Gx6NuAJE16fjdrHlA+2YiYbw60/QjRYW
	 g54hvELX9n/DJfptl4fnFcxw3VNZM/9z+ao8G9moem6tQrc+0jXy4q83cxxNZ6cwiD
	 98rihPhawygHA==
Message-ID: <sashiko-outbox-182576@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] hwmon: (lm75) add MAX31875 documentation
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Erasmus Mari Geronimo" <johnerasmusmari.geronimo@analog.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261023091550.1494-3-johnerasmusmari.geronimo@analog.com>
References: <20261023091550.1494-1-johnerasmusmari.geronimo@analog.com>
 <20261023091550.1494-3-johnerasmusmari.geronimo@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 09:22:47 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Document the Maxim MAX31875 I2C temperature sensor as a supported
> chip in the lm75 driver documentation.
>=20
> Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analo=
g.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023091550.1494=
-1-johnerasmusmari.geronimo@analog.com?part=3D2

