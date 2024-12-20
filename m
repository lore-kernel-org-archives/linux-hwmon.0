Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAAA1946C8
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Dec 2024 06:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734675677; cv=none; b=T1ZxTYXgk8MQAzdWhCVGWSOW1YkDwF0JOyebSA6b9Xdemi4j/TWxdXp+PGKMVY7+X70o/5+UixpJgDzp2mJAdc9suDyn78XbnbR9UwxAp6lm3Y5Mnn25VmRvgvBZejKvpoQSc7YmofjhvzSoGx30FltymvoNKa4m8MWzuWKBdrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734675677; c=relaxed/simple;
	bh=/jQ66JoTsZ4zxaWjJKceO7M30Xl8l2rQdAg6S7rbvoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ka6e16jPR/otONVD2RHWot+duZsly1pBdgJJpRYOJ2l4+uRkq1I4Avq5hvJMXAor4uOsDelk21fn0M8svHuaFoIpC2yD5EmFba3OqVKmI67S/s07CTsb0WeTiHAB4JkcNbQyZ1jHeJEitRX6/w4JdSKKdasevWzQ2W2f3fX+tdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=E2+CQPSr; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="E2+CQPSr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=/jQ6
	6JoTsZ4zxaWjJKceO7M30Xl8l2rQdAg6S7rbvoQ=; b=E2+CQPSregQi2o81BgRn
	OmiFvYyyYuatGyVtNWSNXOOpkhhei9E7LyVPlbsqB2eAnfcWDgpcqLSzTv29sT3s
	brGxU/xdMyQ1Hz0eiF182OfpSR/WroTWde/FY176+gs+2RsDhzdO1pKEDrFCNxzS
	koVLGh3N3mqg2MUvMnitQcz6GchAundBwgrf/1pL0q/Z6HQroIINEre7tehhCc5Y
	LIL7cDCWQtfjcnwOCoiS0i6jl0PqZp49o/tg0tspR87KRrkfk30K2VrKE6NUY+aP
	ma9oUGl54RejUbvJC2bDfkvCl/7lB9njs8fywbsOt3WHsy8zEwGpTF1TCF8BnXfw
	cg==
Received: (qmail 903437 invoked from network); 20 Dec 2024 07:21:06 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2024 07:21:06 +0100
X-UD-Smtp-Session: l3s3148p1@WSfppq0ppKYujnsY
Date: Fri, 20 Dec 2024 07:21:06 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [RFC/RFT PATCH v2] hwmon: (lm75) Hide register size differences
 in regmap access functions
Message-ID: <Z2UM0p3YYa4JfCz2@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20241218150404.2713377-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qdJ2iLuGl8ka+E0z"
Content-Disposition: inline
In-Reply-To: <20241218150404.2713377-1-linux@roeck-us.net>


--qdJ2iLuGl8ka+E0z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 07:04:04AM -0800, Guenter Roeck wrote:
> Hide register size differences in regmap access functions to simplify
> runtime code and to simplify adding support for I3C devices. Also
> use regmap API functions for bit operations where possible.
>=20
> For this to work, the 16-bit and 8-bit configuration register has to be
> mapped to a 16-bit value. Unlike other registers, this register is a
> low-byte-first register, presumably for compatibility with chips with
> 8-bit wide configuration registers. Hide the differences in the regmap
> access code.
>=20
> While at it, enable alarm attribute support for TMP112.
>=20
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--qdJ2iLuGl8ka+E0z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdlDM4ACgkQFA3kzBSg
KbYC3hAAqmfkRNqxGFKU2McR6/kktQZui2WzkXD3hlBbkVRVywEXXj9CBcXEBnsJ
pKFAJBzQT/eEFJluvTnWQHLSkMZT8R/MGG7Mq/4pweBF1lXPbxtj7nosfuiqPoKL
MlzgrXSQXvy2+czsR7WnYAYszIC6GezkhC9AbaAq7kgCGllEl7GdzQClQ77cbWsp
qZgNtIhfppAlEuXo3UDlWy/4fpthM12CDrOLWlTpcSSjfmrYmXcsQxyoBxw44EZz
AnvaXK3dDSSY9fKLuX+FLBRjPz2RqCyyOgrTX+CPbYYypDdZuuB66KgC9qPhyhYf
Z5Ff11ke7LeHmb6JmpuKVV4DwlReU/VoOoWKy9gCH/FDb0y8JPH186np451d89Nc
BqQ1YYFZWVjYgwNG1+YIQAVGH8cdk6Eyx5uGkOPAVL3tMh/SqtRhwrJCVkZf5fV8
IhpTqXO/aEl5Bx+0q7GgR5kg2hDBKEXqbTRZTjCUknV7BNyX96+N2vYt0Tro1etk
z7CoyoTqLUo2NRiGX6EYEMTpxh3LkNuxaQeVd3u8QVzj8Ki7o7oJJikw+D3NMhzH
/ZxkJd+eLSOPihSejSxd12pf4RRmZr/USlqBN4GmYxFr/kffI+zT8kdrJtZmzBbY
XKelK15b7vG9RQW5vvIPBvbnrTNrSoSPcZ798dDZgea3tI+frcg=
=C/Ty
-----END PGP SIGNATURE-----

--qdJ2iLuGl8ka+E0z--
