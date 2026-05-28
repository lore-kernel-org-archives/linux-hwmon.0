Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AABE31C57B
	for <linux-hwmon@vger.kernel.org>; Thu, 28 May 2026 06:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779948203; cv=none; b=JFVEDJ7jZRHpGcdkkOCiGIq7KgaRSaSLqlOJ1nw3Q+9nnPJSU2Vyuj95N9GqxUtGU/ZSeqkmhpcvrZeSpNSzXvDwb8g43A0EU95dQuhXz4GDj1Zsw7hQcJ2OzMMRTfnz4kzmexzQAyj+IbMpm/763qTpAk2lXoQBwq78KTVRNQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779948203; c=relaxed/simple;
	bh=qqZPGHWUxW5CfpHx4EW5cwolFaeQKedHUF3UiC7OAr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KDUZm9GkRgItR/dZrTq9IiayEQ/rmnjbEBGEIxD/EURQn2iccIqixHeaLl9cDm0BJiWkGaeFr/BmHxygbqaamX/jZ3E8Q2DH/UuEtyj170ndwjFA3vnss2kGFQ6dMMWusbWWCH3OFZFovw9OnHyyUqIlkl29edRdY2T4DRhrhTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=UyHAwRXg; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="UyHAwRXg"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49041e84237so49912175e9.1
        for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 23:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779948199; x=1780552999; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vCRyA7AidG7NUP2SsWWiU3GDr7vPq0M3ztsPUhYIMds=;
        b=UyHAwRXgtH1AKgMWZLmEJo/i/zEO8jVeNw0KEoTH6oHka/nB+0aUi8+v83HlBvAWUD
         w2ByeiNdHF6Ytate6bOGqjt2KW4jZBwekPvBSwUdRnckLSC9HuXI2AtLVrVUWmCOhHqT
         YYOYsuTp7eAQ4ixUkutRYPdbh/YVPwZ2TJp7d1+lIfn6ypdnrYAXNs9ueTMSHPpXAShy
         1lC18fllc1NBnBExiqQTYGvTXaHK0VWAoKvWu+O4usBYrSca1i/00Mzdm7ceToEgg7hf
         QE7GsKlwl544rwpw7gkdzV4dnpU1772p06ViTR0+gxzXyL+EoZ+1C3vM8f92ouvmPucV
         zByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779948199; x=1780552999;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vCRyA7AidG7NUP2SsWWiU3GDr7vPq0M3ztsPUhYIMds=;
        b=JFwE1VFsmIOZwk0ZhtVnMS/TX1xGIY1k+30cmafPA0k2MUupLFgjx7ufsH68zfe21Q
         He1CO9oZxHr7F5LPf5YZ5AcwY/1ZF2N8UDBgU2XvJzVv1Z/g0YhDNaAvnqQ6Nsfh5HfQ
         T38tvp/pqEca0/olvX/xSsXywzHGWR9HI6Dvw2lWRyo5IMrSuB5D8o+n846o6FVW0AmJ
         +/gBTXXp/iogdaJwiCbtgskNIjar6uYdEVOJLwQXGW4CeeRSqFLb9khfEm7yCnqC21bF
         Ig0p8zNKmCwODwntfzICVgLCIE9Z91ifNoTlhTJ5NHDOX4Z69SMgBbqu7jxfTkRPnD9O
         fCgA==
X-Gm-Message-State: AOJu0YzAkWtKXx02T90IngM93ohKhNUQBz7rWRtlaY2hNaYM2gWxcw3r
	MAXetHK7G3JqMB8J177PSoMAsiEYPgfpRuNk7K6lrumRKsfO+sYkmfHKaIE1ph/S5Xc=
X-Gm-Gg: Acq92OGFbpCCa1DZYchrPdRTPve5L1yWzdovRPaPTz+XUkpgl8Lt0I3CqYkb4mRC+ok
	XjNi9BKMnwEGrVsaK+RkDZjTY/7BxmFH2nmYJj6/HQyFJk8Er5N7f8sxA2iPs3tTdeiv+84Cy0v
	RgxzEME+bTE4/Cn0Q4TW7Sm5ICKwwPlvyQ1e5e2C3gcJbwx50c1n3N86/HRBplsMmyWomuhv03+
	6KOltpSF2b9ySt/1UhhJbmbRkKAxyJ62JrxVe4XvkZNAXSahkr21CZgDU26+P3jvfsWrYqGK25u
	gV4D+MKu3r0kAr5ag6CB4X1rT/RvbH7/IcJ6LK2PrPMYEhPG3hHTqbA0yzJcF2FEXW3bvPpJCy0
	k8Mpv1XdW8BR/4L6DT75UrKnElmUBvh73JrRnMCVFqWYpPRCJ6LYUUReZ7sExe99D+YZ6YMKVP5
	8/3ff2B0QkqFe30FWON65pT5YBu9Af9Iosa1/gMVQoSHcVBM1/y0qPHAs59mnSSj0Rr3wtLGSLH
	pZVQ7qsvvmthYaVer8CtgxUTw==
X-Received: by 2002:a05:600c:8214:b0:490:5000:917 with SMTP id 5b1f17b1804b1-490947855eamr3418605e9.1.1779948199447;
        Wed, 27 May 2026 23:03:19 -0700 (PDT)
Received: from localhost (p200300f65f47db04e95e43453a0d1648.dip0.t-ipconnect.de. [2003:f6:5f47:db04:e95e:4345:3a0d:1648])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4908f0b5c92sm8682465e9.35.2026.05.27.23.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 23:03:17 -0700 (PDT)
Date: Thu, 28 May 2026 08:03:16 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] hwmon: Use named initializers for
 platform_device_id arrays
Message-ID: <ahfYpNHNijgGP_Ev@monoceros>
References: <cover.1779894738.git.u.kleine-koenig@baylibre.com>
 <25d38df8db42d69f33fa30267c9fd5ea058223d0.1779894738.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="53harr2yokckm53b"
Content-Disposition: inline
In-Reply-To: <25d38df8db42d69f33fa30267c9fd5ea058223d0.1779894738.git.u.kleine-koenig@baylibre.com>


--53harr2yokckm53b
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 2/2] hwmon: Use named initializers for
 platform_device_id arrays
MIME-Version: 1.0

On Wed, May 27, 2026 at 05:15:53PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous unit.
>=20
> While touching these arrays usage of commas.
                             ^
Here is a word missing ------', please add "unify" here if you apply
this version. I fixed that in my tree, so if it comes to a v2 this will
be fixed there, too.

Best regards
Uwe

--53harr2yokckm53b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoX2qEACgkQj4D7WH0S
/k7iZgf/bVm4xDrqAyTfO/GfGWvxYB55lTDO+/AQpu3RLorqvFxUa28i2Nxvu6Ob
A8YpsYhVAW9i/T7ewVWKfxVVbTM6xqyc/Swrh1Seuev/iA3Cj4ak+ILPdOtsF5Ft
9H01KKyO1oFkVC8yukarAx5buHdL9S/GcSaUYECymdcHBd4N9XtqFl+yzv7TFkrM
29uTI+pSjWG/h/cKI3fVC4dBN6NwiedppBitpUcMSrNnUuLEzdIlVx4ibOWabUgv
GHG3gElMyz0GFTPSLl+pG5WqmkDa6JhzXhRvm3URkED3Qg1KrxX7EmDrHL361ugS
S75VyC5EVxcVGM/H7GjUQJY2rryKzA==
=vd97
-----END PGP SIGNATURE-----

--53harr2yokckm53b--
