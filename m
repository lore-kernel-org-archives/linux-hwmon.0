Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A5E19FA93
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Dec 2024 08:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734682861; cv=none; b=tTbqhxqqBrkPxoiIH6xeQZS1x+LJ6J6Nwvr0K71STq4omrd7ipf0t9zMQhEKFiT9IbXEYy3JlRzFoC9TZAZqe4Hy80G6rDSzlaLJ/DrEPbchG/5VEZgQ8qhkP/8l0y08+8PKpbx5BJDz8xdOAiBvQP6N51QDqW8c1FWKAEkXE54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734682861; c=relaxed/simple;
	bh=jFK4CY+HOqq5tEofoqBzQfOOydbwnxCdgp1mHkZHxxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=shBfSRxwuvJjivDMYkZMawX5nyYzo5qhp9MR/v2CJytKj1KmqEllr2k9U4NKCEax7yXUlQlynR7MY4QJBRM2LJAPaifPPZCvkuGWb/ZpPs2DvfKJE9Y5XS4V3FVkeEVSPP1GkjHoVT/q9VEyNjuDYYy2+jRjMttWqwpvrM3xTIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hI19zhQ+; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hI19zhQ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=XJ0M
	85xk/ukMQJR9pwpBrKU/yn4LVI0kmBvI0MgkumA=; b=hI19zhQ+L1998LA0dT2l
	QX7I2xvuZFoW9TUyxFrV2pgar3uQq4W04EKa8s0DExgxHTyw7PR6ShjrCM7j6CXz
	wgP0KROMM/5BjLSV6Kvtok7WICVawtDFtE+Qe3FaBYdyvtsmbmOgdw8Vib4fzAAx
	qrQBZbML6wHtto0u9AEYqf7x3iSob6XLg6nvOjMBid0wvHJ6dksaqv1xNpI9Gxda
	aE+nqfop24L9eBaSOQCdQ5OxFN+Fbz4AN3svanHGZ9uD2fRojGWMeT5pY3RQgcOo
	MzyaEf+L91W8guw3hipi4VToO1LLwh23R1r+T2GzckJ8sZvBTNl+j45AmlcSmSfn
	Gg==
Received: (qmail 932955 invoked from network); 20 Dec 2024 09:20:52 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2024 09:20:52 +0100
X-UD-Smtp-Session: l3s3148p1@dxYuU68pOswujnsY
Date: Fri, 20 Dec 2024 09:20:51 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org
Subject: Re: [RFC PATCH 5/5] hwmon: (lm75) add I3C support for P3T1755
Message-ID: <Z2Uo4yodY0VfU6ZB@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org
References: <20241219225522.3490-7-wsa+renesas@sang-engineering.com>
 <20241219225522.3490-12-wsa+renesas@sang-engineering.com>
 <8c8b2249-75ca-4835-a693-a5df841190b7@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xr8HXrnYQJCPmS3t"
Content-Disposition: inline
In-Reply-To: <8c8b2249-75ca-4835-a693-a5df841190b7@roeck-us.net>


--Xr8HXrnYQJCPmS3t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

> For the few i3c chips which do happen do be lm75 compatible, we should ha=
ve
> something like
>=20
> struct lm75_i3c_devices {
> 	enum lm75_type type;
> 	const char *name;
> };

Sigh, OK, let's have that info a third time.

> And I think "lm75compatible" is really a terrible hwmon device name ;-).

The series is RFC for a reason :D

> i3c doesn't seem to have any access functions (kernel helpers) similar to=
 i2c,
> other than i3c_device_do_priv_xfers(), so unless those are made available
> I think we'll have to bite the bullet and use local access functions.

Well, yes, there are not many I3C target drivers, so there is no
critical mass for I3C helpers yet. With helpers I meant more convesion
helpers like cpu_to_be16 and the likes. I see them rarely used in hwmon,
so I wondered about this.

> The other patches look good to me. If you send me a Reviewed-by: and/or
> Tested-by: to my patch, I'll queue it all up (except for this patch)
> for 6.14.

Done. Thank you!

All the best,

   Wolfram

--Xr8HXrnYQJCPmS3t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdlKOAACgkQFA3kzBSg
KbZovhAAoEu018tUBE1xEHO+RJVZxHyCuEOzU4lR558Gz3qEpN3vS/7G6YC4kAPQ
uuzwFbEjgjeuc7CQvAUgotu/Yw4nYlN6qqPUPOcTwDYy5CykXdyn8GC8PnqUbFFs
gNpdzqJ6AbqyR/LE+DoKjJo4+HZ6vgouCnxyYzdApifPv/6/IUWjW8Pj4uxkp8Lc
DFfeCHqloagh/AuYBOIDfpMt0LUZjPOC9ovzRh0ddeAW2Y+Qr2OHUAyGWveD0rGF
sTeiY5JP5SmxdQ6V2eEhntOGcqbp6hwSX2OK1Fa2X6CqOckJ4R3wkm9GX7Bwn4KV
8Y/U+YL/S3ZxzRq/5FCarOJqJr3qQrQKJeyxK1U3nP39tbzZ8K/8ZxLPe32lxkrO
yDYsYcgzchN/fo//TUwr6MsgoEf1HjBZqbKo0x10ajrUTu0LX1+AVXd7mIGnArex
BmcPeUhnQdiSVws6H5B2ubkYOGJE7sXWKFTP53v8ey/rpudWMWWWPIlOvrT5sqNC
nRSwVXws9L/2sgT4DE3YRu/rXiXEW7y72DaB0CQ7KT4mKJC2WGaXl15J3iUy1fkk
A1OcVfpmzwqU4eEyJFeg4IYivGZrSlSX/O1l6kGBDYVcBi1oM559IpNXLBw3RLh8
JPDXQbUk2duCaHLWcUak+gdRBHx+hll3aOJVmlkPUFpQ+RL1/cI=
=r+ly
-----END PGP SIGNATURE-----

--Xr8HXrnYQJCPmS3t--
