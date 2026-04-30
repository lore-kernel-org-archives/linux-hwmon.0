Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0115717B50A;
	Thu, 30 Apr 2026 18:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777575209; cv=none; b=DiJKlJ16ij9VWhC6QdwxydiK7f0S17Ffr2zZxj+qt6gOtb57URiM3vCuv0xebFco54W1Z3iudfeEpL0QsYbLCp9SD4a2S0DANQhBG7W/z5SPfuGir9w0Xp5ihhiydxuGAX/Qpj9ZM5n1r8TZRyu+IblY8p4TeFtsOwm34EKPr8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777575209; c=relaxed/simple;
	bh=fwwPcQWOWqGnk9tycak+N0Nfom1/bWobWQp3LsvSbMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I5HGrT/wooIIG0jx6Lzj14y5fk0vx2FbzoeehNCpl9Y7HS85v/IA3MK3TS2AwjSwwYrOiW3Z+MS17vxXkW/JvMEZ0JdQ/nDPplcQsjTyDBANfTg3PgnpF2MgikQ1EP9/Q1n/nEM8cz6a6WFv9aFf+suz7jSNzuCRZRN45cVPXyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HYYQdIsb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HYYQdIsb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 477E7C2BCB8;
	Thu, 30 Apr 2026 18:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777575208;
	bh=fwwPcQWOWqGnk9tycak+N0Nfom1/bWobWQp3LsvSbMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HYYQdIsb3BRSmWBGulj7gwK+RisK5UnSmL0v6Uql95ZJ91CIS3Z/Na5yOKCPnJkM/
	 CFUdYrcKqaJyGj05fQfcM5vePhU5XBHIvgKHBgPJWyEoJEgSgE08DtBOx0bDl+A3d3
	 ctOE5gRi0xHUSoS4mk5QhzmitJJrtpFGGjH2qkyyL9UgiCYAZziccu98mSKX2YDO4p
	 93DNOP/tDrgGRvpv2DLgEQ/1bH3/wpgS/fRNY5EIuGrABiWiDeEBUxjbVDo5RBciz/
	 uZrBgydmZNXs/6ZVDDu32rbQDf2tMGIYx67hnnuOfY7PsPP16d5hVVHmj1fvrmR3jR
	 7CgCIkFVv6uFA==
Date: Thu, 30 Apr 2026 19:53:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Florin Leotescu <florin.leotescu@oss.nxp.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, viorel.suman@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
Subject: Re: [PATCH v7 2/3] dt-bindings: hwmon: emc2305: Add
 fan-shutdown-percent property
Message-ID: <20260430-breeching-directly-811a1b78182b@spud>
References: <20260429065955.2113012-1-florin.leotescu@oss.nxp.com>
 <20260429065955.2113012-3-florin.leotescu@oss.nxp.com>
 <20260429-shiftless-docile-e57509e967c4@spud>
 <afNE46C7GBswP8LG@ro-kernel-workstation>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CIKz425QYUwqIjTi"
Content-Disposition: inline
In-Reply-To: <afNE46C7GBswP8LG@ro-kernel-workstation>


--CIKz425QYUwqIjTi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 03:02:43PM +0300, Florin Leotescu wrote:
> On Wed, Apr 29, 2026 at 07:18:04PM +0100, Conor Dooley wrote:
> > On Wed, Apr 29, 2026 at 09:59:54AM +0300, florin.leotescu@oss.nxp.com w=
rote:
> > > From: Florin Leotescu <florin.leotescu@nxp.com>
> > >=20
> > > The EMC2305 fan controller supports multiple independent PWM fan
> > > outputs. Some systems require fans to enter a defined safe state
> > > during system shutdown or reboot handoff, until firmware or the next
> > > boot stage reconfigures the controller.
> > >=20
> > > Add an optional "fan-shutdown-percent" property to fan child nodes
> > > allowing the PWM duty cycle applied during shutdown to be configured
> > > per fan output.
> > >=20
> > > Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> >=20
> > Why didn't you pick up my tag from here:
> > https://lore.kernel.org/all/20260407-slang-scoff-795164352c62@spud/
> >
>=20
> Apologies, I missed your Acked-by tag when preparing the series.
> I will include it in the next revision.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

Don't resend unless there's something else wrong with the series.

>=20
> > > ---
> > >  .../devicetree/bindings/hwmon/microchip,emc2305.yaml      | 8 ++++++=
++
> > >  1 file changed, 8 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc230=
5.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > > index d3f06ebc19fa..8c2548539d7f 100644
> > > --- a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > > +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > > @@ -54,6 +54,12 @@ patternProperties:
> > >            The fan number used to determine the associated PWM channe=
l.
> > >          maxItems: 1
> > > =20
> > > +      fan-shutdown-percent:
> > > +        description:
> > > +          PWM duty cycle in percent applied to the fan during shutdo=
wn.
> > > +        minimum: 0
> > > +        maximum: 100
> > > +
> > >      required:
> > >        - reg
> > > =20
> > > @@ -80,12 +86,14 @@ examples:
> > >              fan@0 {
> > >                  reg =3D <0x0>;
> > >                  pwms =3D <&fan_controller 26000 PWM_POLARITY_INVERTE=
D 1>;
> > > +                fan-shutdown-percent =3D <100>;
> > >                  #cooling-cells =3D <2>;
> > >              };
> > > =20
> > >              fan@1 {
> > >                  reg =3D <0x1>;
> > >                  pwms =3D <&fan_controller 26000 0 1>;
> > > +                fan-shutdown-percent =3D <50>;
> > >                  #cooling-cells =3D <2>;
> > >              };
> > > =20
> > > --=20
> > > 2.34.1
> > >=20
>=20
>=20

--CIKz425QYUwqIjTi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafOlIgAKCRB4tDGHoIJi
0tzDAPoCZp0mN8oQj5I4vZNujEnYEEez3a7DkufwLlRs66MyAwD/UfOlbzrNu9E9
Tx1XmbVtEQZazMbIlyCCtrdKiJ+/2w0=
=Zgdq
-----END PGP SIGNATURE-----

--CIKz425QYUwqIjTi--
