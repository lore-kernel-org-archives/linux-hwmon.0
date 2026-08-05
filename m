Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539CF26738C
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 01:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785892048; cv=none; b=kedYEvRKlOAwFWN48LRJfQ6GmQ0xri5qbk7GlKqei3DkZDQv7smpiFzm+l5A8OGCAh7ydhjiTvn8mVdu2Fyc0fNA/W/r3nPOjrF5RO2nWD18bCMLZyK/o949UTE6X93N4+7hanYey6ibfvNbzeon+lbOIKGYEDJOLe7KuSHMQRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785892048; c=relaxed/simple;
	bh=lu6W7joA8UzomQ54RPtFBHwrVZlbq4j/T0q1mTN6HKQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oOnHzfHY4AbVRF+A170LAMfGJHujNQmm4e4ORyFmu41bsmXkB8RKo7y5ozFJtKid3Ncqtx7QJa3d++FpdJIhJK2EWrrlECRJSCjMteswsyKcIpF7VxHb2Vw0IRKEl4p0y2MsV7zAkcsXQCL3az2fh6FPfOz/dXF9ZaEMyCryUCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dnum56rY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dnum56rY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C8191F00A3A;
	Wed,  5 Aug 2026 01:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785892047;
	bh=NM5hYD9GLlCid6pRdpNS5dSA2JUuDhNXURlpUGn/xEA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dnum56rYYmCPZ2IkyGhN9QCDrlJZBywlo9s95sppIJYpOfzaqNXB6H7M6+x1iAoq4
	 MHOOZBDAjUSN6ACNxri368ZRARdau6fZnbz3OYNZbgEVi7T8+Td6bU70Pr1/fLTjVb
	 5UqOxvytO6gtnRWwcACtacQBbffNQmuCC/hIvh9AQb9KaIWTRsuyab2QbyH5XaXeMJ
	 UWf5gZHmp0V20v1BXG/iw5dAcLmDB6egXzW6Ua49YDazi1EiA7Eh5krvsE3Jk/dUr0
	 OyRkkUIXv9FwVojc6tp0+Vo7cYIVW54jD46esz+hlwm++H73Cc8EVPQ+ypDfbKBDeP
	 S8W/yzPUI9skg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] hwmon: (ltc4282) Avoid overflow in maximum power
 calculation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260805005721.1566034-2-linux@roeck-us.net>
References: <20260805005721.1566034-1-linux@roeck-us.net>
 <20260805005721.1566034-2-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 01:07:26 +0000
Message-Id: <20260805010727.1C8191F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> During device initialization in ltc4282_set_max_limits(), the calculation
> of the maximum power limit can suffer from a 32-bit integer overflow.
>=20
> static int ltc4282_set_max_limits(struct ltc4282_state *st)
> {
>     ...
>     st->power_max =3D DIV_ROUND_CLOSEST(st->vsense_max * DECA * MILLI,
>                                       st->rsense) * st->vfs_out;
>     ...
> }
>=20
> The result of DIV_ROUND_CLOSEST() evaluates to a 32-bit unsigned integer
> on 32-bit architectures. This result is then multiplied by st->vfs_out,
> which is a 16-bit unsigned integer. According to C promotion rules, since
> both operands are 32-bit or smaller, the multiplication is performed in
> [ ... ]
>=20
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Fixes: cbc29538dbf7d ("hwmon: Add driver for LTC4282")
> Cc: Nuno Sa <nuno.sa@analog.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805005721.1566=
034-1-linux@roeck-us.net?part=3D1

