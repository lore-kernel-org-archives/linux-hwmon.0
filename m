Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DFA39EB47
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 21:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785275061; cv=none; b=A+z4TDznxIyUiKPds94rTqhedV/z4P2mtA2LilmTEqyhnK6N5WO9TPL99SZ1vGFSkZhrVWGjjo8FRqVEliuUUs2YPOPNAVJik6Y8lVXFf5Ez03zJFJGV25SdZg3jW7gZAnn3A43ArtCs6AKEsu/GnbDHY2nFx/oeEmA3neZMYZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785275061; c=relaxed/simple;
	bh=lN7eIROdO9J9rir2WwIki6oWiTqSSe7dc1oa+4fFRUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ENhIgt3WFA/k5HFjXF/l0KIi7sMTNpNSywqDgF19beAZYc5Zt4pPAMBkqNMB910H5SYpPkINZ4qYGqL0YV+weNx56tDJqoUgrDqwpgPIfhuaJXQQnvszcKwzxNyqm9teZ18cxHbTFr/JUr50HNJ6gEfk7O0RT/r4baLiYuEDKCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=UrHqA454; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="UrHqA454"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4957eefd361so2255235e9.1
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 14:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785275056; x=1785879856; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lN7eIROdO9J9rir2WwIki6oWiTqSSe7dc1oa+4fFRUc=;
        b=UrHqA454bnR+Nz9RKnEagDj0Dv0N2G/mxIR1ObAQgD9zpQd/s0kBCNMUR2Sg/UvBZa
         IqigIq53K3TCys+v0BSRMwckSGTugIdeANImxE15cs7YFqVCEN2L9TqJWdEW1hhhWK0x
         ZAYv1kZYyEHxqUc7o2EPq0EMPLj/l7KpnTKCHb/NSiGaiu7LQ8n3i1/3/q1q9ofJZWNR
         UZCIi6djv4YTg5aYtdzbVSwF8dRyLgJbVTM8OEyzLMK6mquAAi2X/xpikIZkSGQLJTf3
         1tS0u9MT0aQImHLxjBm0pboqjqmsOMnWQdGpWbn1B/EZPFlW00/nxgiRzuPCGaA698YU
         IC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785275056; x=1785879856;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lN7eIROdO9J9rir2WwIki6oWiTqSSe7dc1oa+4fFRUc=;
        b=gSA0bLMfygdnO11ChwNDw8MEcWi9TkxLgC08S/lFa1wEtDL5mIiBroPXJLvd3R8a0u
         MI7bMyOPMu4puzFE5VU2eB34qxaCZEyQf9MbTdq2a+y3Bu4XYTQmAD28chtq4IVoaH9A
         k2gVJdTSXVv0LePkP7yNQhb94TpdbL7ojIIxHn4Ez3CrLuOsQx3NM6L932ECndg1XzTV
         HL9P/QMrnFklfrYpyYR6KK3881ynn3WidfGz+DTyYEUFzkH08HrZV1dS9hpQQeJGjxEs
         qM1vfd1Pt6j2RnRjGwOrLii6pY28NOF2Pp1eDm8pJt7yrH6lQ9ij/BODy2JWqyD7rlJc
         0v0g==
X-Forwarded-Encrypted: i=1; AHgh+RpaiAnR16DTY5nbRTu17on2oq2V253EbwSfJMO1/Y4LeAKxx+VhxUyO9q4DNv6kXiml9ax12ynvwmczrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOk0EqEMd65GqAjbb5O77si4HN8Q36S0yDfZ9nRS8T9lTBwAOX
	At91a3IYACfeYfqpmQXegAO4dqeb09SmpvMwhYbVqdVuVVl7MMqODoA9bE6E8Cgg72M=
X-Gm-Gg: AR+sD11JbQIQQzEh3OIzRblvzLAsKlvTLqUsW+DMrO4wjwvJxYtFKHBc18xZ6Vf6eoq
	zAxzmmWXC/b3CqSVdeRPHSxwESD6zTTa9hx0ueU1pxy9DDCRC2W7swaPGNyl/2TMQ+tVEiKHAQD
	2xqAR3squ2HAAB4sjfMbKgO5UwUkTlyzqf355fBBegifLr4ExjZRYPB9uFWA6MVF5TqxhNJf+bO
	eX3ZBakFUdVWpToSuV2SN89apzB/AC0IBOo1cWvW9K/yFaidj9PWXcr2nAFjEb5VIJD0YR1lqQG
	Cmcu2ZfmKItIxQ5uudjBVn/JANBYPem5fYDO4iS4IsrzdV1JtVnG+eDV/0PcuoJpz+4JzaGux6O
	M/c6wo6Yo4iM0hab8H+NwoAQGEIeeRq5ywle8EZsOT8povrEQ6b3OB/lf00Tt2h93TpNK6Zoj8V
	1Jnn8bnBTI7iAmOlMuAb9LAtFRfSRl02sGjrULBluyScDBK/oOGpZn11ZlX5nAisJ28A==
X-Received: by 2002:a05:600c:4f91:b0:495:7eab:3abd with SMTP id 5b1f17b1804b1-496c65a26bemr41645105e9.33.1785275056065;
        Tue, 28 Jul 2026 14:44:16 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49764d70014sm12407405e9.3.2026.07.28.14.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 14:44:15 -0700 (PDT)
Date: Tue, 28 Jul 2026 23:44:13 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, 
	Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] hwmon: (emc1403) Convert to use OF bindings
Message-ID: <amUz_ilAvq_fBHld@monoceros>
References: <20260721095935.439174-1-clamor95@gmail.com>
 <20260721095935.439174-3-clamor95@gmail.com>
 <amGz2YZogakb5XAv@monoceros>
 <CAPVz0n3WKw74zg0HmBBOo8Z7JV_pku-DjsgKF_74B8EdD5cXgA@mail.gmail.com>
 <1d7b6ff4-4ea6-41c4-b59c-25e14fdd8b53@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rtua2nzjsltgdmou"
Content-Disposition: inline
In-Reply-To: <1d7b6ff4-4ea6-41c4-b59c-25e14fdd8b53@roeck-us.net>


--rtua2nzjsltgdmou
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 2/3] hwmon: (emc1403) Convert to use OF bindings
MIME-Version: 1.0

On Sat, Jul 25, 2026 at 07:23:13AM -0700, Guenter Roeck wrote:
> On 7/25/26 06:24, Svyatoslav Ryhel wrote:
> > =D1=87=D1=82, 23 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 09:28 =
Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >=20
> > > Hello,
> > >=20
> > > On Tue, Jul 21, 2026 at 12:59:34PM +0300, Svyatoslav Ryhel wrote:
> > > > From: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> > > >=20
> > > > Add OF match compatible table to be able to use this driver with De=
vice
> > > > Trees.
> > > >=20
> > > > Signed-off-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > >=20
> > > Please put your S-o-b line last.
> > >=20
> >=20
> > If S-o-b's should be chronological, then this order is correct.
> > Guenter added his reviewed-by after I have added my signed-off-by.

It's a nitpick, but as you added Guenter's tag, you modified the commit
log and then your S-o-b has to be renewed.=20

> That refers to S-o-B, not to Reviewed-by: trailers.
>=20
> Do we really have to argue about something like this ? Do I have
> to mandate the order of non-SoB trailers for this subsystem ?

I wouldn't have replied just for the order, but I think it's convenient
and usual to have the own S-o-b last.

Depends on you how strict you want to be here, as usual. I for my part
ask for reordering or announce to fix the ordering if nothing else is in
the way for application.

Best regards
Uwe

--rtua2nzjsltgdmou
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmppIo8ACgkQj4D7WH0S
/k7NBAf9H9PboIOanFsnYEPcO8yizZKYWNgORBgU8FXewHvKIsjh879MUTrnJv0F
N7l6AeHZyLZk9ecLIJ7McB4Mo4szHCUGOvP1yD5YclFrJ2AZfe9TdlWo1K+YaSO3
jAsedGc48zcRFaI14Put1VIenkzRZt5CcqsDWyylSJO6Kja1BnN3ptq7dx8hOGRT
C5TSxoMKQkDj3jfKJ+gUiuzcIhun62T7lvp0smZoRPoR3xiLx+xrCsYDrxIecBRw
+WdnWqxR8EVLLubKspROGG5QC6+6HVHBUWYaecqIDF4l28t7goCD49Y4H6RzI/CE
Vk+TSm7D19nrLfN1JpNNfTPnhmuI9w==
=zmaf
-----END PGP SIGNATURE-----

--rtua2nzjsltgdmou--
