Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB62225416
	for <linux-hwmon@vger.kernel.org>; Wed, 14 May 2025 09:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747213555; cv=none; b=LH6yR8OunwyS+Acf7bxNkpE9ycEYVgOFf/Eif6uoa8f3z42u/gim7KPqIXVJgv53P33qIoOZMjxPOkN1NMJy7BaVg2D1lQMV+/HeGV1aCrL80Sgz5LMdQ55NLgC50Fnp+rgIUPCuVoRfEKLn++ApDFf9+EWzNzQyKDgft7GbNaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747213555; c=relaxed/simple;
	bh=17rwjRlR7RhKANLI1Mls54AWGoy6onjo5K/eZRVo6rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nu+bLyT6wETfLowfpih0Q08CX5HFC1EJS3gs/jsBfEii4O4Ex0iWOnjinyN9L48VafqYgr+cQJP8f0RFYazPiSNBNkfYrClHxGu4GMi3ARGCXVlNbCdqj4zR0Cjcwb3b0OE7NdC4BRksBO4IP3gBhHeslYMUUn2lhrYNcbkGs8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=LNJwAO8F; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="LNJwAO8F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=17rw
	jRlR7RhKANLI1Mls54AWGoy6onjo5K/eZRVo6rk=; b=LNJwAO8F8YE5VYk6jrqc
	QiLd3u71TnyY6aCz1R1YWVLGXACtlVuC1XVvxDShA0fZQRG/w4w5OtwngYIB5jBb
	4CQSKiDiTDpVcs0Jt7wvS3dur6j1HBM4SLHdr78AKINcW5LnqtTHrzSzOpOyIH8p
	CNOwTXahhgFzKmh20dgBCD6LNTwFXHqTbO0XY1FoTA5cZ7AkVeNhQN2EQ1WgovAX
	PhCV9Z3Xxc5jhiMOY1ZYxQUTDIuQlgKFL4BsX8cZjNqttI+6AJcARTjwH/hQkIGA
	UMiA9VPnATQeO+7X6LgP8Oz4L1/Gu86VJ6Zylnumb8d5P9MeUS5pg7MqCVQM3DQb
	ew==
Received: (qmail 596971 invoked from network); 14 May 2025 11:05:39 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 May 2025 11:05:39 +0200
X-UD-Smtp-Session: l3s3148p1@G7NT2hQ1COZtKLF2
Date: Wed, 14 May 2025 11:05:38 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: (lm75) Fix I3C transfer buffer pointer for
 incoming data
Message-ID: <aCRc4mdDpG5ADjKk@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
References: <20250513111739.508886-1-jarkko.nikula@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RNcrZaYRXS8pNr6r"
Content-Disposition: inline
In-Reply-To: <20250513111739.508886-1-jarkko.nikula@linux.intel.com>


--RNcrZaYRXS8pNr6r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 02:17:39PM +0300, Jarkko Nikula wrote:
> Use the I3C private transfer input buffer pointer for incoming data
> instead of output buffer. For now this is harmless since both of those
> pointers are union members but may confuse when reading the code.
>=20
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

FTR:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I am on the road, so I cannot test it currently. I wanted to do this
once I am back.


--RNcrZaYRXS8pNr6r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgkXNoACgkQFA3kzBSg
KbaNtRAApsF5/GeSyvHeydiQkXZ/jd2tp/7BAFAUTv+QFxlM57+6zkKgqhNCgy/E
bc+Uk+mnOWEemmGlpGWrWc/M8HaJjbtEahlNPV1mBclLSWkoDfTabi49OQl9f42k
akPdyMCnwg70rB+X/C1m9yDJ91YYt/YOFIb9uDURYlMYlO+BTf7vRBAbw8asj7sQ
XIL4uu3pzPYvSwyB22jUgNMy6dt/cC4/C1LdTIXwExBhu9vYzhGVmqjUQsjbfKuS
WZlO7+/MlqrZRG/8C8RlBLTI00pVzgd191UuJHGZsgxSQhF73EJKIjYsi+mvwaIy
jMyjugIF9xqOFlBFblo3eYjNrpqtBpMR6AZwcXoUnzIAbWnROuoS/SXJ2vt5ZmGB
Ssx8AdOzmhWlvdnBdb6wOl+ldFPvRC2U+CmRpclWNTKlHmHmp2zg7GL0h2p0kdnt
K5j22bzFDodnQ0hIYZGwgWSAxaVc7WZbqpdxjZyeiTpsjICpE9S8whOp+yqYF75k
L6mvaz8SYX5sHfZKfCn98zbe7aNR6b6wlyC2hQPa2Pfqkvx4eFRcpYutkcfTBKs9
5T+6Dk4QuAcMT35SqAOmLCerl3rYmMcelQW79dJlR+ohm5iOfryi/zBWp541hbeB
osx+JOWCQxzVV9jQlE3HEdAeFCulOzZlPCQ5F+MDu001gdxpWiA=
=5LmM
-----END PGP SIGNATURE-----

--RNcrZaYRXS8pNr6r--
