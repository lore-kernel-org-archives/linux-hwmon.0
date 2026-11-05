Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793837564;
	b=yvlg4NTtcNPtKlXDctWGqSlo94CSh8XdytMO8xngUy4rvrG150T86sJRcEgMWz+wNQg5
	 t37R3F3UBN7EET/MwEdouBUwN97Uf3yQ3ok2M6cGGhbpPPgStyiO9uzvGo8ynhkoWl1DC
	 aD4H8kKLC1KStahHhw2mJ7JKPCalXwnr7Vgx70ogz+yMIYdpsu6PdlDEIV41WtCLAlL/F
	 GWbvv+7iLW/f8dKdfI/Bgy7BMzR32l9GEL7yLQLIT30YILez6wGIr3IYk0PtjPHh2CXMb
	 iHcOIs771D7RMnHvd3o1BLzM0sP+7nlAbqx+VQgxVKDdMzF2R6xHp5UI9dKthIQNZuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837564;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=TefUB/dw7a0/nIm3W17NuqE4FHbU+QJb3Vs/l2deZwE=;
	b=bdijWgaLJ7h1Wh3rdjNeikX+7z7xbwVcww+HkU5liXPol0hrNy92uZAwOvbDENcigtnQ
	 Mxrpr1RqJSape7g0Ec3ZBXI19zKyiFFcIFzycK9QMFHA9G/Ne7V6c8yYo1tp5y1zz+w9A
	 3C07n/nbOOP9+vsaMu0sdq+O91sB66dOni/zMxFz8+dpBFFvuNKoGGB7QsGwNo6jWcRrz
	 OufUdncubTyhY+ByOBKx1OsG/pD7uoD/Z0c8jkJB0XhQYA1eY1qpOSewHIJH6VFQqR9Ms
	 moDcABX8CRkdbukibhEDRDQFjWC3ZFscNHA5y9tT3ILRuIg0CocLC6OtJwrg/PDCJWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BR3E9IIj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3607606A329;
	Thu,  5 Nov 2026 00:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BR3E9IIj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30651F000C1;
	Thu,  5 Nov 2026 00:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793837563;
	bh=TefUB/dw7a0/nIm3W17NuqE4FHbU+QJb3Vs/l2deZwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BR3E9IIj+1S3U66dWvWvsSnONIxuLBf9sEfEo39FDcJl9jWiKCyrSB7WEXmSrhU5g
	 6OHoFoWImjT1XONxrMlgs1chkQ7OslHd79d1FxjE2xKS11NIudZUSUJzKZFG/eDo/z
	 n9Y/yXSzIbsRsVi5UmqHtSlTvQBGTNiyfnRbT4S1esOLucsAF0rNcCmbNO22qksu4Q
	 sx64EEJ4gfCQRqstacsSCBsCyqC1UqlM+PqsfdQMSRelLOcEWqvgnsKvBMFyhe0eQs
	 2yClIsR+y9Uz1eHCA5LsJZrMA5ydabQ5FH7F/90vRd40XN4gCA6J1Wrw/WWC+A9M8r
	 D1+Vk4jVb6+Fw==
Date: Thu, 5 Nov 2026 00:12:39 +0000
From: Conor Dooley <conor@kernel.org>
To: "Torreno, Alexis Czezar" <alexisczezar.torreno@analog.com>
Cc: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: hwmon: ltc4283: add ltc4284
Message-ID: <20261105-glitzy-uneatable-0eebf04012ec@spud>
References: <20261104-staging-ltc4284-v1-0-49fce67ebc48@analog.com>
 <20261104-staging-ltc4284-v1-1-49fce67ebc48@analog.com>
 <sashiko-outbox-196618@kernel.org>
 <PH0PR03MB63510EDCF229B247474764C8F1682@PH0PR03MB6351.namprd03.prod.outlook.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xwUMzqhiGVB1cFn8"
Content-Disposition: inline
In-Reply-To: <PH0PR03MB63510EDCF229B247474764C8F1682@PH0PR03MB6351.namprd03.prod.outlook.com>

--xwUMzqhiGVB1cFn8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2026 at 04:06:13AM +0000, Torreno, Alexis Czezar wrote:
> > [External]
> >=20
> > Thank you for your contribution! Sashiko AI review found 2 potential is=
sue(s) to
> > consider:
> > - [Medium] dt-bindings: hwmon: ltc4283: requiring rsense2 breaks single=
-driver
> > mode
> > - [Low] dt-bindings: hwmon: ltc4283: ltc4284 example sense resistors be=
low min
> > 50000
> > --
> >=20
> > commit 9676b294cf2ad1168e5ce0d8de5c0cd58e68d9ed
> > Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> >=20
> > dt-bindings: hwmon: ltc4283: add ltc4284
> >=20
> > This commit adds device tree binding support for the Analog Devices LTC=
4284
> > negative voltage hot swap controller to the adi,ltc4283 schema, includi=
ng new
> > properties for its second sense resistor and ADC resistance.
> >=20
>=20
> ...
>=20
> > > +
> > > +  adi,rsense2-nano-ohms:
> > > +    description:
> > > +      Value of the SENSE2 current sense resistor. This resistor is c=
onnected
> > > +      between SENSE2+ and SENSE2- pins.
> > > +
>=20
> ...
>=20
> > >  allOf:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: adi,ltc4284
> > > +    then:
> > > +      required:
> > > +        - adi,rsense2-nano-ohms
> > > +        - adi,radc-nano-ohms
> > > +    else:
> > > +      properties:
> > > +        adi,rsense2-nano-ohms: false
> > > +        adi,radc-nano-ohms: false
> >=20
> > [Severity: Medium]
> > As noted in the binding description above, the LTC4284 supports four ha=
rdware
> > operating modes configured via the MODE pin, including single driver mo=
de.
> >=20
> > In single driver mode, only the first MOSFET path (GATE1 and SENSE1+/SE=
NSE1-
> > ) is used, and no second sense resistor is populated between SENSE2+ and
> > SENSE2-.
> >=20
> > If adi,rsense2-nano-ohms is unconditionally required in the allOf block=
 for
> > adi,ltc4284, wouldn't boards wired in single driver mode fail schema va=
lidation
> > unless they specify a nonexistent adi,rsense2-nano-ohms property?
> >=20
>=20
> I suppose I can make rsense2 optional (+ corresponding driver code change=
)?
> Or can it be kept as is?

If it's actually optional, the dt should reflect that.

>=20
> > > @@ -269,4 +303,19 @@ examples:
> > >              #gpio-cells =3D <2>;
> > >          };
> > >      };
> > > +
> > > +  - |
> > > +    i2c {
> > > +        #address-cells =3D <1>;
> > > +        #size-cells =3D <0>;
> > > +
> > > +        swap-controller@20 {
> > > +            compatible =3D "adi,ltc4284";
> > > +            reg =3D <0x20>;
> > > +
> > > +            adi,rsense-nano-ohms =3D <1000>;
> > > +            adi,rsense2-nano-ohms =3D <1000>;
> > > +            adi,radc-nano-ohms =3D <500>;
> > > +        };
> >=20
> > [Severity: Low]
> > In drivers/hwmon/ltc4283.c, ltc4283_setup() validates the sense resistor
> > properties against [LTC4283_MIN_RSENSE, LTC4283_MAX_RSENSE], where
> > LTC4283_MIN_RSENSE is 50000 nano-ohms (50 micro-ohms) and
> > LTC4283_MAX_RSENSE is 1677721599 nano-ohms:
> >=20
> >     if (st->rsense < LTC4283_MIN_RSENSE || st->rsense > LTC4283_MAX_RSE=
NSE)
> >         return dev_err_probe(dev, -EINVAL,
> >                              "adi,rsense-nano-ohms(%u) too small or too=
 large [%u %u]\n",
> >                              st->rsense, LTC4283_MIN_RSENSE, LTC4283_MA=
X_RSENSE);
> >=20
> > The example above sets adi,rsense-nano-ohms =3D <1000>, adi,rsense2-nan=
o-
> > ohms =3D <1000>, and adi,radc-nano-ohms =3D <500> (1 micro-ohm and 0.5 =
micro-
> > ohm), which will cause ltc4283_setup() to fail probe with -EINVAL.
> >=20
>=20
> This was just random numbers to show the example. I can change the values
> to a more realistic sample if preferred.=20

Random numbers are fine.

--xwUMzqhiGVB1cFn8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauvJ9wAKCRB4tDGHoIJi
0tMmAP40U52XsS0rSG5meVAlWbRzsQkzTi9gD88VJHEfciEy/AEAp7ernegeW6Mi
NRY9g/At1UxQvbgvBBOai4Lt63Rx0Qw=
=bWUS
-----END PGP SIGNATURE-----

--xwUMzqhiGVB1cFn8--
