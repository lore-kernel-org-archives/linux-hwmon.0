Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94044ADD8C;
	Thu, 27 Aug 2026 17:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787851332; cv=none; b=swkGHuiwaW6SW8jpirYK98ovNllmaFxKSwBdEv2e0wK19swd0juVnHwxGFS5PB+XCzFtofQ1cS9iz3aQsEp4zV6hUGjOQwxTgGmZkNSk3BRZrePHh1Qil4M1oDSKANhgji+V2mvLCLinQKWXQaE4RSsEvcmmYFTfEWctv4qwhM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787851332; c=relaxed/simple;
	bh=QqFF7mb7V201nLy+PFI3x27Ars0zx68gF74x7OZ6DNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SSpi5LBn2oBU7OgUzRGNcCLo08PIbSIpFq+XaWAQO4ThDdFNo3aCWgc8uTtmgV1bxBlOKi85C8ZOUL5AhcY0CTz6jLu7BFW6gnw2Ub4GmgPfZZ60y7rOiULafnj1GcbVAQfi9KHBTGrI5cAyS6k9cLSgT9GQZCeCvUc9u9/fWs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kv4MURIE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kv4MURIE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A3271F00A3D;
	Thu, 27 Aug 2026 17:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787851330;
	bh=7u7ZPuPJHj2UUGNORw/yyq7QMmQ0D8n5FCO1KV6e29A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Kv4MURIEUbwcaQYcS3GNHaXJCeEMTpNooG1L5DM+jZwJp0O0Immd8omZOGWgWwqoG
	 8vTCqeBUvpID3XZ2iItl9jpIywvp8wzlkZ2+T9vwnFMfrxgd9SFl2Fm0I/Yrx5ZdMv
	 ws8DcW8T07jx9xXexnUoLO6+ySc4gCKNDEuUvdJD30njO9rvf2z0S0TNxGhKnmm0Zx
	 iMrUOvG033Ktyv4az383Eym/fvKZpkhOocvkd1LbYR+YDrENqgzZ1AjeZ3yTXS3YRZ
	 n+kdUq+S0MqdR6SOcWIJJufD805sWQeKkrOUYQ7CugKbaCgLcyWQDezSHXExXotCNa
	 8nm5cpHQJ+qrA==
Date: Thu, 27 Aug 2026 18:22:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: national,lm90: Fix channel
 constraints for temperature offset
Message-ID: <20260827-cried-dynasty-21bbba968593@spud>
References: <20260826184750.4798-1-flaviu.nistor@gmail.com>
 <20260826184750.4798-2-flaviu.nistor@gmail.com>
 <20260827-stooge-polish-b23739e44224@spud>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZPAKDB6h9A5N0y/W"
Content-Disposition: inline
In-Reply-To: <20260827-stooge-polish-b23739e44224@spud>

--ZPAKDB6h9A5N0y/W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 06:01:28PM +0100, Conor Dooley wrote:
> On Wed, Aug 26, 2026 at 09:47:48PM +0300, Flaviu Nistor wrote:
> > Limit temperature-offset-millicelsius to remote channels only, since
> > channel 0 is local and this property does not apply to it.
> > Channel 2 is only valid on devices with two remote sensors, so reject
> > channel 2 for compatibles that do not support a second remote channel.
> >=20
> > Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
> > ---
> > Changes in v2:
> > - Use else statement in if/then block as suggested by Conor Dooley.=20
> > - Link to v1: https://lore.kernel.org/all/20260824183900.8983-2-flaviu.=
nistor@gmail.com/
> >=20
> >  .../bindings/hwmon/national,lm90.yaml         | 28 +++++++++++++++++--
> >  1 file changed, 25 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml=
 b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> > index 164068ba069d..a8b2a24501b3 100644
> > --- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> > +++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> > @@ -113,6 +113,23 @@ allOf:
> >        properties:
> >          ti,extended-range-enable: false
> > =20
> > +  - if:
> > +      not:
> > +        properties:
> > +          compatible:
> > +            contains:
> > +              enum:
> > +                - adi,adt7481
> > +                - dallas,max6695
> > +                - dallas,max6696
> > +    then:
>=20
> > +      patternProperties:
> > +        "^channel@[0-1]$":
> > +          properties:
> > +            reg:
> > +              enum: [0, 1]
>=20
> Is this needed? If channel@2 is false, then you won't be able to get to
> this point to begin with, right?

Hmm, actually keep it. It'd fail dtbs_check but I don't think
dt_binding_check fails for channel@0 + reg =3D <2>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

>=20
> Conor.
>=20
> > +        "channel@2": false
> > +
> >    - if:
> >        properties:
> >          compatible:
> > @@ -134,6 +151,11 @@ allOf:
> >          "^channel@([0-2])$":
> >            properties:
> >              temperature-offset-millicelsius: false
> > +    else:
> > +      patternProperties:
> > +        "channel@0":
> > +          properties:
> > +            temperature-offset-millicelsius: false
> > =20
> >    - if:
> >        properties:
> > @@ -149,7 +171,7 @@ allOf:
> >                - onnn,nct1008
> >      then:
> >        patternProperties:
> > -        "^channel@([0-2])$":
> > +        "^channel@([1-2])$":
> >            properties:
> >              temperature-offset-millicelsius:
> >                maximum: 127750
> > @@ -172,7 +194,7 @@ allOf:
> >                - winbond,w83l771
> >      then:
> >        patternProperties:
> > -        "^channel@([0-2])$":
> > +        "^channel@([1-2])$":
> >            properties:
> >              temperature-offset-millicelsius:
> >                maximum: 127875
> > @@ -186,7 +208,7 @@ allOf:
> >                - ti,tmp461
> >      then:
> >        patternProperties:
> > -        "^channel@([0-2])$":
> > +        "^channel@([1-2])$":
> >            properties:
> >              temperature-offset-millicelsius:
> >                maximum: 127937
> > --=20
> > 2.34.1
> >=20



--ZPAKDB6h9A5N0y/W
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapByPgAKCRB4tDGHoIJi
0rl3AP9QB081e1m5BuSfHhwxsiNUylOcUyIMEFoR6Ah6kmW6qAD9EUWwSEbJYuPd
ZYwB5OeQpxKqIuK3NECoLb2XUaR0nAQ=
=h+vh
-----END PGP SIGNATURE-----

--ZPAKDB6h9A5N0y/W--
