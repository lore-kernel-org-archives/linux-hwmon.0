Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795418961;
	b=DJdtFqub+B+7S8sY2RNRWDtYsK9KrwEM+4vNGx7YnQQ1gRw5eSKAB/kIZauk2GgO2wor
	 eFZZnSNqfHfErYiIjaW68k2QZs2ky4qDAesDdpZRer7S4pa27yOCTF8ATv+5EMhuIkfW2
	 0W40sSsCwWK+0rd0xQpRHsxkddwJZpSx0DOPsSwjL5q4l4+4tx18BtD/NXEBc6KiYepqf
	 YTmmdN7DATfrivDI6J7ZHlOMDMNOo2ZQP2OZRCHkcUOmbCFfgOxfNF8EcEPjMebbo946k
	 VPDwrwhtMGuRw9FgbbN3sue/vTKBk5iBip1TYSXQ1kl4BXByVy3dWKtTbagCowscfwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795418961;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=64EotijHxBxceaQpx8UowTBF1Bj6inHSGGgupxuRn9c=;
	b=kxyanZp1SdIajKHEblPJZYIaZtsTiD4tfi2pfYYMPP2ZsenKpvriwkoMwrMZKfWFq25A
	 b5T5K4VnzoL11u8OC5ln81Hf/lgDpLQA1k8j1PeL4loa2dlWsYZDV4lzyIaxukItyNWdt
	 nRadYgJK2bbhf8U538QTZs/XcEz5VAG0+6yOHM4Q/HbRSBAodM1K35Ojfa5bomR4sQcSy
	 KX57zSqUjq1gE3+X8c6KtoT3m+buGtX3w7tUaSPcY/l4iI1oVFXUqCtop/D0XcQ1UdpSr
	 k2bMEiCk4h9/4Cbc9bnssl00ok8ReKPiW6/JPipeuJkG87Y/auVPTnR4f8a09MDDL9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LnAlX96c;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254D6606A31A
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 07:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LnAlX96c
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 958191F000CF;
	Mon, 23 Nov 2026 07:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795418960;
	bh=64EotijHxBxceaQpx8UowTBF1Bj6inHSGGgupxuRn9c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LnAlX96c8WpIXZE60UwBuJnh9Lf/b6CCEXiQToqOo88KM/iAVt20YnU5KM9EdKmZm
	 oyAO2FuWUzdlxAA+fRmerzhOu5qfH1cJCvlheYbj8j46HmNEJasQ5wG+W9SaieIy6G
	 ZoTXrbGwq+emPw9Go9a1BIGm1k6HxPoChNepaDDmkj74LBocCYqVIx3bff5eysIlm2
	 eYZWFSoQ1jTdIrRk2T5mUr3GAtU2to+tF0kAk2V3L3NUcsyim+xb0gQg1WXHBOlfNN
	 3LRaWoLIb39QvPzFVa4l9qS91sGXaqSeONqn+LWdKodTT+DW0Apv5g3wRp1uJESRVv
	 lv4wlEtKpbe1Q==
Message-ID: <sashiko-outbox-228812@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (cgbc-hwmon) Add module alias
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Haberlander" <markus.haberlander@rosenberger.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261123-cgbc-hwmon-alias-v1-1-3054681f984a@rosenberger.com>
References: <20261123-cgbc-hwmon-alias-v1-1-3054681f984a@rosenberger.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 07:29:20 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> From: Markus Haberlander <markus.haberlander@rosenberger.com>
>=20
> The board controller's core driver adds the hwmon cell as platform
> device "cgbc-hwmon", but the driver declares no matching module alias.
> Built as a module, it is therefore not loaded automatically, unlike the
> GPIO, I2C and backlight drivers, and the sensors stay missing until it
> is loaded by hand.
>=20
> Tested on a conga-PA7: with the alias, the driver loads at boot.
>=20
> The patch and this changelog were drafted with the help of Claude
> Opus 5.5 and reviewed and tested by me.
>=20
> Fixes: 08ebc9def79f ("hwmon: Add Congatec Board Controller monitoring dri=
ver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Markus Haberlander <markus.haberlander@rosenberger.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-cgbc-hwmon=
-alias-v1-1-3054681f984a@rosenberger.com?part=3D1
