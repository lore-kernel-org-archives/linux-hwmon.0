Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10ADB503BC5;
	Mon,  7 Sep 2026 17:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788802621; cv=none; b=IHwx4KlMN8WFcCh6ootSFzMxEVHOLAgY6890MI24BVYcYWBuo+wCcDQwW0DCHQLpOYIMMxRStrDXe1BimK21RmV4rMf/JqIECllgxTxiX9JYlWZ8IMGdiE5o9M40nkIgQuqOw/TeQC3pxOknM+Oe6cp8OZ7BFfsCyDum5l5Lu8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788802621; c=relaxed/simple;
	bh=rXNI0sxaGfzGhxmNiI39YkU4f/YVE1BmIR7J5iPmvoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=diuv/tcVJu4PheONuHCktqzFt6JJWBoGH7R3WmLWx0tH6xR736uELSIBfjvLOxIthi0Y5r4u5wviQqVOqwYxwMqsJrc8N1ImcR/AM1tQ+oOpmBGAUn4avxlZqrQFJbNtS6S1kcGwaZrvVipzblusI5Uus/xlxKhE3ARyFpQKRHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IhhrbmGP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IhhrbmGP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76A051F00A3A;
	Mon,  7 Sep 2026 17:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788802619;
	bh=rXNI0sxaGfzGhxmNiI39YkU4f/YVE1BmIR7J5iPmvoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IhhrbmGPdjcfKms+DFeGssfFj9nsAP8KPS7tYH7zg13gT22VQyTvxLIRjcPBHr24g
	 EeoTfsIxTgSGoS8bkcOejtq/fjt83LWzuyfJTFenMf/4radxdgvj310kLBN5lYm169
	 TyEoPS/yQJ+xsNmwea6vTA/Er/hY9eFiAVqFm6Y4QauzHYBR/zMyH9e1Cm16TCs5Dt
	 bu5bm6yWu9zfY+0zyRLDNAyZu4AlPrdH3Buheh8L4UWaVbZw0i+3OpnF0yO0Wn8Rs2
	 lGAkZnpMTcuqU2Myhtk8/ACocphYDalwCqHaYu7YqYX9Oo/b16/JXwmTEe7Mge21Mi
	 Pw2YgEHsWZAxQ==
Date: Mon, 7 Sep 2026 18:36:55 +0100
From: Conor Dooley <conor@kernel.org>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH 2/3] dt-bindings: trivial-devices: Add TI TPS536C7
Message-ID: <20260907-hatchling-engraving-6bb5c1f6d232@spud>
References: <20260904220843.495082-1-sanman.pradhan@hpe.com>
 <20260904220843.495082-3-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K9KX9OyNqx388E2S"
Content-Disposition: inline
In-Reply-To: <20260904220843.495082-3-sanman.pradhan@hpe.com>

--K9KX9OyNqx388E2S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--K9KX9OyNqx388E2S
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCap72NwAKCRB4tDGHoIJi
0lRgAP9/jk+gQ2BF7A2AzrwUycisYYvPdGjpjDwJxP6g+oiZzAEAzEiGo5yF0QNY
f+qsahEvzIpS7kI+8/QzT+pOY3jC8gQ=
=42rq
-----END PGP SIGNATURE-----

--K9KX9OyNqx388E2S--
