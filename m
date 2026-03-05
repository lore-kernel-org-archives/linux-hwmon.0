Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607B9246781;
	Thu,  5 Mar 2026 18:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772736319; cv=none; b=lKYmHCcDfEKs5MCQyQYvVd7wmHCMS4klUU9lmetBvzxf/AgTMsVnSxpFFuLzEw06x0RoXI5hRvrpdSqj5Z0GbSDqjat8ryBlKAlseWn5qKf4tD64yMckAHjLc33GxDJWVIh5Cgx7z5sPbV2DmobAjiz+6mPiFsplkO8uF8e8L3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772736319; c=relaxed/simple;
	bh=wsYjqB9J7mzSdi2vE2GDXREsczkZV08MQoRRhEFx/Zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YYXNf9dqkiEOiYr4FzPo+29feyQxGpHvZEDjEnX4mjSSRD8XLe90LZsFc3/ibvPbwDe2JFwSmGgo9dxcKbcF06mQ3Bxb9mbbdahL0lgv92Pe9VbW5poIwmLfy//xC1lcWiDPqt7IQJZeok3+7EYi1AAs/p+YSlpO4y1f30Pimz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AeYrGP7M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AeYrGP7M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AE9AC116C6;
	Thu,  5 Mar 2026 18:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772736319;
	bh=wsYjqB9J7mzSdi2vE2GDXREsczkZV08MQoRRhEFx/Zg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AeYrGP7M0an4uOihoCpIV2Hx/7WzsK7ff/SgCGJw16K6G2oFLhZ0zvztBCNlutzcN
	 UohbRvo5wMVeeee+GkQ4Jd1DFP67pZBdQO23uYgNedDUmSzyVmAlnNcZYtNcTbMJK0
	 xSPHqCuHvOqtTcaZk+rk234gctsdffCB67Fmg1yPifvGLb6ZOdFVc0jYXjmQYckycn
	 N6jhhpz5UrN6fbqy35duwZ8hFhYuU8PNLB2YPfzMfGG03H351EK+jqNl+X0WUMNAk8
	 iKnTiaCO49k3/ZjcwTKcDvBcz+uT4MmYK1Gx2a51uVB9gbTO177rF+QU7NHLUqOqL0
	 rtGBdHC2ABY8g==
Date: Thu, 5 Mar 2026 18:45:14 +0000
From: Conor Dooley <conor@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Drew Fustini <fustini@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rahul Tanwar <rtanwar@maxlinear.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: moortec,mr75203: adapt
 multipleOf for T-Head TH1520
Message-ID: <20260305-rocklike-deplored-bb2677f5b97c@spud>
References: <20260305144044.44208-1-zhengxingda@iscas.ac.cn>
 <20260305144044.44208-2-zhengxingda@iscas.ac.cn>
 <aanNQSHxLh2OsbvK@x1>
 <94d742d9ace2ce58ed31525a58973b3a13257577.camel@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="41/65V20v5C4L0rA"
Content-Disposition: inline
In-Reply-To: <94d742d9ace2ce58ed31525a58973b3a13257577.camel@icenowy.me>


--41/65V20v5C4L0rA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 06, 2026 at 02:39:40AM +0800, Icenowy Zheng wrote:
> =E5=9C=A8 2026-03-05=E5=9B=9B=E7=9A=84 10:36 -0800=EF=BC=8CDrew Fustini=
=E5=86=99=E9=81=93=EF=BC=9A
> > On Thu, Mar 05, 2026 at 10:40:43PM +0800, Icenowy Zheng wrote:
> > > The G and J coefficients provided by T-Head TH1520 manual (which
> > > calls
> > > them A and C coefficients and calls H coefficient in the binding as
> > > B)
> > > has the 1/100 degree Celsius bit (the values are 42.74 and -0.16
> > > correspondingly), however the binding currently only allows
> > > cofficients
> > > as precise as 100 milli-Celsius (1/10 degree Celsius).
> > >=20
> > > Change the multipleOf value of these two cofficients to 10 (in the
> > > unit
> > > of milli-Celsius) to satisfy the need of TH1520.
> > >=20
> > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > > ---
> > > New patch in v2.
> > >=20
> > > =C2=A0Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml | 4
> > > ++--
> > > =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git
> > > a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> > > b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> > > index 56db2292f062d..7d57c2934a8a1 100644
> > > --- a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> > > +++ b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> > > @@ -105,7 +105,7 @@ properties:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 G coefficient for temperature eq=
uation.
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Default for series 5 =3D 60000
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Default for series 6 =3D 57400
> > > -=C2=A0=C2=A0=C2=A0 multipleOf: 100
> > > +=C2=A0=C2=A0=C2=A0 multipleOf: 10
> > > =C2=A0=C2=A0=C2=A0=C2=A0 minimum: 1000
> > > =C2=A0=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/uint32
> > > =C2=A0
> > > @@ -131,7 +131,7 @@ properties:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 J coefficient for temperature eq=
uation.
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Default for series 5 =3D -100
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Default for series 6 =3D 0
> > > -=C2=A0=C2=A0=C2=A0 multipleOf: 100
> > > +=C2=A0=C2=A0=C2=A0 multipleOf: 10
> > > =C2=A0=C2=A0=C2=A0=C2=A0 maximum: 0
> > > =C2=A0=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/int32
> > > =C2=A0
> > > --=20
> > > 2.52.0
> > >=20
> >=20
> > I am wondering if there is any backwards compatibility issue but
> > there
> > are no other users of this compatible in mainline other than th1520.
> > There is also the precendent 030d2a0ce5dc ("dt-bindings: hwmon:
> > moortec,mr75203: fix multipleOf for coefficients") having change the
> > property. I suppose it is a not a problem unless other people on the
> > list raise an objection.
>=20
> Well mathematically any number that is a multiple of 100 is a multiple
> of 10?
>=20
> So theoretically there should be no compatibility issue.

Ye I don't think this is likely worth worrying about. The restrictions
exist in these kinds of cases to tell users they're doing the wrong
thing and using a value the hardware doesn't support, the driver almost
certainly will never care and just "blindly" use the number without
doing any validation, so as long as the multipleOf matches the
capability of the hardware you're okay.

--41/65V20v5C4L0rA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaanPOgAKCRB4tDGHoIJi
0smCAP98dLDeRbRIrJ9YocU71BJXE7G4/X1hmSsR8bNPPvdI7wEAsVy+w8bkDBhX
jbjjUIx7vVJCswO7wS4wXgtVcFg4HAM=
=Sx1C
-----END PGP SIGNATURE-----

--41/65V20v5C4L0rA--
