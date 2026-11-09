Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794254442;
	b=KCCVKLtoQSj0koWNpwsgLaC5OobKcDxB5R5d4KXPaPMjkIiB8jqfCVIYGL354wnCcCWo
	 dbvKdPn67f0sW1bgaCtxZFawyMLI7iPskgkHV/N4eWAoxfqFwSd4RZJ2rbHqSsRqBfPNF
	 yR+NVmJ/9THGoPSmxWzCZWseHFODoDK4JWe1MZWMUGw5K+71i57Nbc/s5FNnJYq/hIK8o
	 UnY1AbtRu78UOtW+NNyQSJZQsxRDQt95+girvFIc4fJbjZpl1F5HNSJ6BlOWA8sIbXWXo
	 NMu7qy90MGaHxyJ1pR+xRj37SyJACE6siYEkwNNaPkGbBydXjpLQl+VTt5ePlh4LoDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254442;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Ovlm9cImQS3p5lX+VhA7M6tcPoYjfe752cg9CRIkRac=;
	b=Rgz5nkq9h2hZrYJVGBUYWG56EZxYMXg/+JgcfcznH1VIxeY8Lho0TK1lYb88irGqPRtY
	 4Landqfs0vZMShr5jxD2mbMC3watKpuSTYR4uhyQ41XPeUkdcDiLmUrTUtbr4EbFFJ9t1
	 w0iQy3hprBBi12B/bZPeLbcCdmal2z95Sr92/NzST9EzMFrf9CrihxWtMcNU7dhxdIEDY
	 NgMeohupskjbisA2N6Zdlo9FEavEJs/3JeOHnP9SZ2CzR5DWM+VgRevlm9MLGl+XvzKOc
	 WuFZhBwZw+tLU2ZI0Voix6qALWlKKg3ONhcVy3EMA9lQirm8RJWNwymbmVOYeMJfLbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XyC32KmY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11C1606A31C
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 20:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XyC32KmY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3798F1F0089F;
	Mon,  9 Nov 2026 20:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794254441;
	bh=Ovlm9cImQS3p5lX+VhA7M6tcPoYjfe752cg9CRIkRac=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XyC32KmY1wHxf81Gns3tQZGqoidRGQcNovVxlnZ5sC1+yARk4NkswsgXBXu18tX+H
	 KsrPOvN9JOBpwCWsmphxxcTkJE4K1Mrp4BTZuO5gFhZotGt6fQY2gbDdya8FdJ/Lek
	 f/NoZonALL6U0qQ9MMwNkF0HjJAE/DMI/UpmMVXK6Zo+TNsMQtm1uS38Imd6XdkNaJ
	 8XL5yD8UymfhVNfgY6jJPKBtrqQDoY7sdeTO/wjGiYLZs3doNRgolVPrOEHfXTFNkO
	 hcjfnvQX5V5s2aHbSCWhCX1scqSsCxW/eUcU4uHUFjKyAnndkJr3uTzvIZgvRIZ+bD
	 sK4M80U1x7gLA==
Message-ID: <sashiko-outbox-205521@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (nct6775) Clamp voltage limits before narrowing
 and scaling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261109092533.5146-1-zhujun2@cmss.chinamobile.com>
References: <20261109092533.5146-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 20:00:40 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> From: zhujun <zhujun2@cmss.chinamobile.com>
>=20
> store_in_reg() parses an unsigned long, but in_to_reg() takes a u32 and
> multiplies it by 100 before clamping. Large limits can therefore wrap to
> a low register value. For example, 4294967296 mV becomes zero on a
> 64-bit system.
>=20
> Keep the input as an unsigned long and bound it to the register range
> before scaling.
>=20
> Fixes: 9de2e2e84e7d ("hwmon: Driver for Nuvoton NCT6775F, NCT6776F, and N=
CT6779D")

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109092533.5146=
-1-zhujun2@cmss.chinamobile.com?part=3D1

