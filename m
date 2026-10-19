Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792435621;
	b=G+wrcHXdMgIUiv33JB/ad9n/feYb7lBPyltw+bniDNemw6oeVjfrBYdLYrGfK1EawLDz
	 aXog5bwRZH4gK7E9fmY8m84HWsm8wabv6YWIqfUFC67NbfDZT624UYTqwRGely4DJKIva
	 xA9eZia0ocz9BnPnuNobM1MVX2ozY4k5mnoEQ6q+YX6FnxYSPZWxjceom2OQrRyfb+5RI
	 eSAxIwMm01OgdJwV/0ExweJo2gG3FAdq4oRJym+d2CPzoL3w/u5pUb3ncAjiyVx8u3pET
	 4Tkj/2gMA0O9xp47FObna11e6Ge4f6AmqMxuvPMwoDlJOS6mw0L9xWmu8JHyEItzqPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792435621;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XQa35Sez0fdP3VVos++a0a3nDjwxPlYiOelg+V9iSLc=;
	b=jhkNIJOL/tUSBBIp2oqXWYjv2mDsrr0zNMCl2e0BO6f+B5Pujsw1bffARdF43Gehy+eh
	 b1X29BnD1aKGRIiozgiN3f9/ahk2m7gTDPQCbUo0I0nXSlQRSvcJFdMjKvLWomO//VnXe
	 2o+hxpoqb6D97cc4NpRLWixZsoN5J6+pZJVxjWdVU0x7s25bbcBMQOMRg9ENoJeJAPPFn
	 2ZENzLlXxBSLxKppJu5ybevD9MBXmRhsv5mYYR7rmYzQ/lGidytOFZB8Br3en05hqIbbr
	 cPLBow0SCLatcv4nJkEcdBgpeh2/1SJLnYBEUn7eal/b7nam1s93p5zx5GZaef5TgxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O8zKN4MK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568B7606A31F
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 18:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O8zKN4MK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B64C01F000C6;
	Mon, 19 Oct 2026 18:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792435620;
	bh=XQa35Sez0fdP3VVos++a0a3nDjwxPlYiOelg+V9iSLc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O8zKN4MKF2hw8GHpIs/YmVB+2W0HYsnHdqMTiASP7bBFLRCAB3icY8TwaPSdnLrrv
	 p2S44ZAxwOkBO+d6YEJGBF7vArcGi5EJ0l31+LsPfxNNmxd2mQjtLj0uh/iYXfzzwm
	 D/OiCXcC5fmxOE6j90Z9H7ZPJDkLJ/HznbROdQpAgO1SYCq1+OHL5QhoxDrolzeEM3
	 AlWqR4mZ87TiEZCRHhZInNCGx7dw+d3W3KmbBIMnFuC3sDq2VWFuRFJnzS78uINb1c
	 pqNoWxHiTDXaxYc+1HSAA/LdTaVYEfvOHXeRhCDiuGbo6zL0VRrXxmDKdRviIvKU4/
	 0YJ0xm8JKV3qQ==
Message-ID: <sashiko-outbox-178105@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add TDK
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kevin Jia" <kjia@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261019-fs1603-v1-1-8adf972386c1@nexthop.ai>
References: <20261019-fs1603-v1-0-8adf972386c1@nexthop.ai>
 <20261019-fs1603-v1-1-8adf972386c1@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 18:47:00 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Add a vendor prefix for TDK Corporation.
>=20
> Link: https://www.tdk.com/
> Signed-off-by: Kevin Jia <kjia@nexthop.ai>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-fs1603-v1-=
0-8adf972386c1@nexthop.ai?part=3D1

