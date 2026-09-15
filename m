Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A168E42F712;
	Tue, 15 Sep 2026 17:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491917; cv=none; b=T0h8/AefP5JnjR+mXM8ngOKB7d0x2AoIKqlEWiY0pQgzARqvJ5ehbnM0cLpg61LiH/7+QwkuizOdHIixy+SUVdColTRKmourGl9Arryf7+xV8tdGOIFiLU76LKofXqOoLq33qjztp/oPuoHtzxJ/pJlsVvSoq82hYy6iNnWa5FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491917; c=relaxed/simple;
	bh=N9bp9aIdX/UF3pDoQFbzq22XXlePpDCVw0pCjcDP8rY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OztrLRZ9nCvWACSN/joQu84alVdrdqlVCANw2ftN58Lv37CvqiaaZ6AlWgNmtSt3QvhXt8+qb5L+ceZl9Zkj40P0KMuSZO1cdYD/D7VA5Pde0mQ/aMnj3x1LdU0D2Hsh3Cpr6fpNMSIRPlV2cGbR30rLLikd36Rfy/phOoBdIGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LeT8o7dr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LeT8o7dr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71C941F000FF;
	Tue, 15 Sep 2026 17:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789491915;
	bh=P0BetlmHOEhoxbhXpdfaDNlWbCytk0FwLw4b3iIAtAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LeT8o7dr2m4dSzTzJXbOz1Af1CG6DaGb6szdjWB9dFY+otDJkCJmXp1G4qQjc/xD6
	 arotaN0/5RwyHjotNA55SJUQalRAyx1G7uX/5lzoijXz37yyD3AgVjDYsX4qrzedSZ
	 hsaf7p8dRXIGDTuatPNgDyzTkx3STTsyBA4Cp/9xPPuqHhtgGVWtyqPZcBFJu7v3jz
	 vYA7UYEli5luZAQZu9mntc45U133FbihKcMKuznxlXmTtXaer2nmAOEfQ25AboFowC
	 wpvXtK/kXw0SZieORsp/RK49MOs6QG0kvwA4f4bd3YcFue83h3Dj5cOkBx3Xp3p3H5
	 iYLekI28n+gBg==
Date: Tue, 15 Sep 2026 18:05:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Colin Huang <u8813345@gmail.com>
Cc: Colin Huang <colin.huang2@amd.com>, Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: pmbus: Add Infineon tda38740
 and tda38725
Message-ID: <20260915-uneasy-mute-f2ec9cb2715b@spud>
References: <20260910-add-tda38740-and-tda38725-v3-0-3e87637da3d6@gmail.com>
 <20260910-add-tda38740-and-tda38725-v3-1-3e87637da3d6@gmail.com>
 <aqKTZCPto32Ur-CI@squawk>
 <CAPBH0A-voEks+jygGaBErgFwqNMuk6QnO9PPiYzrRLKVua0mGg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZOF7tPBN+k7uYQZ/"
Content-Disposition: inline
In-Reply-To: <CAPBH0A-voEks+jygGaBErgFwqNMuk6QnO9PPiYzrRLKVua0mGg@mail.gmail.com>

--ZOF7tPBN+k7uYQZ/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 05:12:59PM +0800, Colin Huang wrote:
> Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=8810=E6=97=
=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=887:24=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > On Thu, Sep 10, 2026 at 02:18:55PM +0800, Colin Huang wrote:
> > > From: Colin Huang <u8813345@gmail.com>
> > >
> > > Add devicetree bindings for the Infineon TDA38740 and TDA38725
> > > single-voltage synchronous buck regulators with PMBus interface.
> > >
> > > Signed-off-by: Colin Huang <u8813345@gmail.com>
> > > ---
> > >  .../bindings/hwmon/pmbus/infineon,tda38740.yaml    | 87 ++++++++++++=
++++++++++
> > >  1 file changed, 87 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,t=
da38740.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38=
740.yaml
> > > new file mode 100644
> > > index 000000000000..28e6ff9d9d9c
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740=
=2Eyaml
> > > @@ -0,0 +1,87 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +
> > > +$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,tda38740.yam=
l#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Infineon TDA38740 and TDA38725 PMBus Synchronous Buck Regulat=
or
> > > +
> > > +maintainers:
> > > +  - Colin Huang <u8813345@gmail.com>
> > > +
> > > +description: |
> > > +  The Infineon TDA38740/TDA38725 is a 40A/25A single-voltage synchro=
nous
> > > +  buck regulator with a PMBus interface designed for industrial use.
> > > +
> > > +  Datasheet:
> > > +  https://www.infineon.com/row/public/documents/24/49/infineon-tda38=
740-tda38725-datasheet-en.pdf
> > > +
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - const: infineon,tda38740
> > > +      - const: infineon,tda38725
> > > +    description: |
> > > +      The Infineon TDA38740 and TDA38725 share the same PMBus progra=
mming
> > > +      model. Use infineon,tda38740 as the preferred compatible strin=
g;
> > > +      infineon,tda38725 is kept as a compatibility alias.
> >
> > This is not how this should be done. Instead, tda38725 should list
> > tda38740 as a fallback compatible. Take a look at the example schema for
> > how this can be done.
> > Otherwise, this looks okay to me.
> >
> > pw-bot: changes-requested
> >
> > Thanks,
> > Conor.
> >
> Hi Conor,
> Thanks for review and explanation.
> I misunderstood the intended use of fallback compatible.
> My v4 proposal was not correct approach.
> ```v4 used:
>  compatible:
>    enum:
>      - infineon,tda38725
>      - infineon,tda38740
> ```
>=20
> I plan to change it and examples to:
> ```
>   compatible:
>     oneOf:
>       - const: infineon,tda38740
>       - items:
>           - const: infineon,tda38725
>           - const: infineon,tda38740
>=20
> examples:
>   - |
>     i2c {
>         #address-cells =3D <1>;
>         #size-cells =3D <0>;
>=20
>         regulator@40 {
>             compatible =3D "infineon,tda38725",
>                          "infineon,tda38740";
>             reg =3D <0x40>;
>         };
>     };
>=20
> ```
> Is this what you had in mind?

Yea that is what I was looking for.

Thanks,
Conor.

--ZOF7tPBN+k7uYQZ/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaql6xwAKCRB4tDGHoIJi
0pZjAP9TVW0sB3kVOhH/IqDafhvi0NzG49UDaDEUGlGLIMdRzwEA1WiBJ88wmCco
N9e0RS1Ogb5cX63O56W/YxScFHmHcAI=
=3Ivx
-----END PGP SIGNATURE-----

--ZOF7tPBN+k7uYQZ/--
