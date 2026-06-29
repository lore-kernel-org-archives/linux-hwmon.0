Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CE223ED5B
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 19:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782760865; cv=none; b=VwpUOwLi3Vq9we+j5pk7xYFQVU5vYy6K9FiT+VeVs2qwl0+0AfBdIvuPcAg9kSkc2gUFQsvv40w/Z/4D1mD0Df0J/U8g17lXF0VVfHSjNNPwFEv0E2x59nTiGVShUMpoA3LeF4TL+jeCoSTSTV9en5kVNxEwVVD5la3zELt46UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782760865; c=relaxed/simple;
	bh=ZaQtcP9ObGFJAkeMdAENi/JJL/+aOt7M3Cfg5LE8jL0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SaUNpG8LOYEo7zu3lQUOloeo7fYR0EoFdjcLXl1wl1J3ACHijmWMwH9tupa0kfmk666UV/gw2U4VpdJMVGUvRRyh9NiaiRFZGbkc/1rwsO3tECv9X3a9Z3/iUfhPURxKfgN/QQB5BixyXg5yIGor8n5ErdOtMr6ejGayoti8VPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VP2a3Cub; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VP2a3Cub"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7115D1F000E9;
	Mon, 29 Jun 2026 19:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782760864;
	bh=ZaQtcP9ObGFJAkeMdAENi/JJL/+aOt7M3Cfg5LE8jL0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VP2a3CubmxA+fizRq4Mnn8iTZhQQmsRdiraaZqeJKB/z0D/MlSzAN0BrnbZEyiPV0
	 S2U+jhZ49C4hTQzjAitakO/r51HHQaYxyjp1Run56KbofDPRTPXI8924zjRpDXD2/F
	 tWtydNZuN8xnFOv+FLuKsEmOIEBpFVz10YQDbwkGYjKysTcGwZiuTEHDUhsO4Av9e5
	 6STcqmHhAzwnZKsQoxbPFoKohrIyfcJyJt9f2h3ETwbrSxil8aQiY7jYRIWVLgKXH6
	 i9zskhdb74tBrby4dqWMM42a7iRaKLkAPs+LUzlP3Gzktre+9zn657JRxoaRQ7Efa6
	 kF7Cv9TIwkipA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] hwmon: (max1619) add missing 'select REGMAP' to
 Kconfig
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Crofts" <joshua.crofts1@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260629-add-kconfig-deps-v1-1-8104df929b1a@gmail.com>
References: <20260629-add-kconfig-deps-v1-0-8104df929b1a@gmail.com>
 <20260629-add-kconfig-deps-v1-1-8104df929b1a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 19:21:03 +0000
Message-Id: <20260629192104.7115D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The Kconfig entry for the MAX1619 sensor doesn't contain a
> `select REGMAP` parameter, causing build failures if regmap
> isn't selected previously during the build process.
>=20
> Fixes: f8016132ce49 ("hwmon: (max1619) Convert to use regmap")
> Cc: stable@vger.kernel.org
> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-add-kconfi=
g-deps-v1-0-8104df929b1a@gmail.com?part=3D1

