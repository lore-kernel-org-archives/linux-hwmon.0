Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90451155C83
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Dec 2024 16:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734539136; cv=none; b=Pl7N+4UsRH3vqDzLW/iBQNud1dsu0VeWgl47udL6/hc+dKJ7qUPwTAZi8nplgcpZOmynsK4LM0Ayn8zKmYJ9weJBltOrUTnGhGzEm2dCVtXN09skCMfpuXtJ1q21o5t5CHfwsG1KiRTtDZfkS/8+VoATwP03DH6t2G10IfuAxWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734539136; c=relaxed/simple;
	bh=odkKtQO+BvgyZrB6OYn6L827h1FOjcfb5cxkKQ0sTRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YDNhGSMlP+egb2zqfyRYkYxfalXAhrwkRAyc+YXdFaKOQZw1AnmUyONMBZd035BTrWPtDh+vlYmKgO0NEpvyjy4a19xAKdbwrxcbMD7fv0gUzdw5a7Y6pXOlPR5/9eBKMLHcZl4YoRjV601PZV3K7GVjMaCrkBoeE9DSIDXUX8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=G/UGwY38; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="G/UGwY38"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=odkK
	tQO+BvgyZrB6OYn6L827h1FOjcfb5cxkKQ0sTRM=; b=G/UGwY38Kzb2JJbuzYUx
	EAsLJcCFZEkJmwuqbSXDfNPwf2B+X2fzr2vO8gYKCc/Dn4bfbeIq0AJJwpGh2F4Y
	vPlk/u5wRWLOpwvotk6Vy54SDakYln1kr6Df7Goa1fkcsGmxe9FR+cLTfPH+zHdE
	Mlwbr8GbiO0khA7cZCZRGKBjTX+dFTHo29W83UipqfGXcrMuK8QxetzJg9pENCJj
	+FltLCtBvfy3PXtGqAhCG9GsoRm+gDILQgx9RDPqF0F6/RLuVxdC0NmY5rCXbqwU
	CtB4Cw+jPok6oUOwfai0o0QeEeCh8knSAYOCRT4MKeUgqrlk8mL3fyyoftZrKis3
	EA==
Received: (qmail 384159 invoked from network); 18 Dec 2024 17:25:27 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Dec 2024 17:25:27 +0100
X-UD-Smtp-Session: l3s3148p1@6x6J3I0pcoUujnsY
Date: Wed, 18 Dec 2024 17:25:26 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [RFC/RFT PATCH v2] hwmon: (lm75) Hide register size differences
 in regmap access functions
Message-ID: <Z2L3dhneuMi9ckUe@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20241218150404.2713377-1-linux@roeck-us.net>
 <Z2LzPeqyxqJz06dZ@ninjato>
 <bfb3ba78-206d-4f28-a57d-c25e7d90361d@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CIrvX0Bgy6KgaJpp"
Content-Disposition: inline
In-Reply-To: <bfb3ba78-206d-4f28-a57d-c25e7d90361d@roeck-us.net>


--CIrvX0Bgy6KgaJpp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Ah yes, 'client' can be passed as bus context, and isn't used elsewhere.
> The access functions need lm75_data, but they can get the pointer to it
> from drvdata.

Yup, that's exactly what I did.

> Maybe that should be part of this patch. I assume you'll take it over - do you
> want to make that change or should I send another version ? Handling it in a
> separate patch is fine with me as well if you prefer to do that.

Since I already have that patch on top, I suggest to keep it
incremental. Also easier to debug if something goes wrong etc...


--CIrvX0Bgy6KgaJpp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdi93YACgkQFA3kzBSg
KbYb2RAAmO3lT1AyYYdMRGwSjpOiAyf+wrXgO8yQCrPOpXB9cAjZyxAd/MA9YzSS
N61H7WO2uFBhn4YQiM8qsHo7bPATiFlTstre9lh0IGwQO/FpboUlpnZrB0xxC6On
tbftjldk9Ks0/QOWwMQpd8GL8QDil4Vy2niSn84wgI2F6DBdg9G1mwW3QMr1pXyN
3J5hrf6rLT+o/hbvsVcO7rpp2R7zhWfHqpoUYsv/Ag1nQ8k+T6ZdNORgf+9I4inO
dGt5StQ/3Xh8fZR2z661SwD8ZPLxJIg2VTkrpq6B0e/luFEtyrAFxesXuSfHSfNo
JxJyEYWGehHRYAIC+BEddPJ6VgpQ6jCiEkVduPOtu/eMoDx+HZULybZmIW3DomrM
6p/nHVncrifDuYIZuXjWirBy+MRPvbBzAGdYFM8jZ9CtMaeHL10eYLtt0/QEn+Ib
tRoK8ygo+k2pyxueKmgJyHE9jY3HuPAHnEzlUlMrroMHPrRgGy2viXe51H1vzvJ/
IUO1LiNuEDyU1Y7l1+ZdPG+FJMvoVGpx0FnrO9q00bwo965IblUILcp0fxO8M3i/
3LfSW4PbY47jOVKwHnvnVv0BwWk/U8rIa6M3RPCA+V0uxqgqy1wo3JeofDCgT4FZ
tC7BM9ixIJ58BceJGW1KcQo2MMJpTCUcqrEJ9iBz+V740pVv/cI=
=4+/t
-----END PGP SIGNATURE-----

--CIrvX0Bgy6KgaJpp--
