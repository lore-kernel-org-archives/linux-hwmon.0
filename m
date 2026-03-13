Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2160F3C9ED4;
	Fri, 13 Mar 2026 17:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773423507; cv=none; b=BAm7Q2wxTxmDX9B2EIt8ngIDZVmMu8iWwVsLUrVOkMu1Pd1q8SttMnWn50EA6B35QHPYjGr4vhXKBTDteUovx52wu1D/gqQcLKuUy8lf+zgEsJoiGXCT0VDFidAhTj1W7Kulqtl1Lig7XettrnfONSxAkskq4i9H428VTLrZt1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773423507; c=relaxed/simple;
	bh=pEHIjPLLAyJbunLR/+3GSHp919/LviLx+j05gDMtNZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m1I4goqx+3ZAtpNWQCCwHxT3dp5fP5o3g+RLVcqp2WMTgPaF39WlKw/AgNZRe/YEjRLaXIO2ej5bFgGQjcVYj5mHifqK7eNR/LNbtc+Cmu4HBrtR8v0S7AE8qgpjKzRhcrR+JJPFZG6/KOG1XNCmVkkt80yf8snU1wo4DtZMkNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gr51Wc7K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gr51Wc7K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06E8EC19421;
	Fri, 13 Mar 2026 17:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773423506;
	bh=pEHIjPLLAyJbunLR/+3GSHp919/LviLx+j05gDMtNZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gr51Wc7K1DtoLWmDKQ3BBzpCyjiyDBTPicGxfBQpxokQazBrG7Zm5GlzilZnRPh/8
	 oXegj7eW9iLjOcwUk1AwfS3cD2eUhPj3qjFytjJLiObo2QBnCQNoHJFm51RT9VBlpv
	 z9aXSnJWTBlx52o/reWOS/lLYwmz8C3fT0wMyG4zaJ1httk/lfgpzlT71zzsSCNryT
	 TIZ/5XT9kmhhepBYsXBAroC0z3cfjM474MkptSEE00IoZPac/MYLSZpbDFnnEuvD1f
	 nfhDBKSjWdzQ66nvLyPmCf0M1ndECq34x+RsvgU8o5gCB/dNuTkWyuXMX+laaSjNNN
	 GZ4BVhlHTE0wQ==
Date: Fri, 13 Mar 2026 17:38:21 +0000
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
Subject: Re: [RFC PATCH v2 1/2] dt-bindings: hwmon: emc2305: Add
 fan-shutdown-percent property
Message-ID: <20260313-mulberry-glamorous-6afbfc52e42f@spud>
References: <20260312122248.1281572-1-florin.leotescu@oss.nxp.com>
 <20260312122248.1281572-2-florin.leotescu@oss.nxp.com>
 <20260312-triage-shallot-1b3d9f07d250@spud>
 <abRF+TPKuXFDJc55@ro-kernel-workstation>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b8ufdPzhwf0sXJGA"
Content-Disposition: inline
In-Reply-To: <abRF+TPKuXFDJc55@ro-kernel-workstation>


--b8ufdPzhwf0sXJGA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 07:14:33PM +0200, Florin Leotescu wrote:
> On Thu, Mar 12, 2026 at 05:37:51PM +0000, Conor Dooley wrote:
> > On Thu, Mar 12, 2026 at 02:22:47PM +0200, florin.leotescu@oss.nxp.com w=
rote:
> > > From: Florin Leotescu <florin.leotescu@nxp.com>
> > >=20
> > > The EMC2305 fan controller supports multiple independent PWM fan
> > > outputs. Some systems require fans to enter a defined safe state
> > > during system shutdown or reboot handoff, until firmware or the next
> > > boot stage reconfigures the controller.
> > >=20
> > > Add an optional "fan-shutdown-percent" property to fan child nodes
> > > allowing the shutdown fan speed to be configured per fan output.
> > >=20
> > > Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> > > ---
> > >  .../devicetree/bindings/hwmon/microchip,emc2305.yaml      | 8 ++++++=
++
> > >  1 file changed, 8 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc230=
5.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > > index d3f06ebc19fa..7bcadfab9fc4 100644
> > > --- a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > > +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > > @@ -54,6 +54,12 @@ patternProperties:
> > >            The fan number used to determine the associated PWM channe=
l.
> > >          maxItems: 1
> > > =20
> > > +      fan-shutdown-percent:
> > > +        description:
> > > +          Fan RPM in percent set during shutdown.
> >=20
> > This sounds like something generic, that other devices might need and
> > should be in fan-common.yaml?
> >
> Thanks for the feedback.
>=20
> The property name was reused from pwm-fan.yaml where it already exists
> with the same meaning. I kept it local to minimize the scope of the chang=
e.
>=20
> However, if you prefer it to be modelled as a common property, I can adju=
st it in the next revision.

I see. Makes me wonder why half the properties in pwm-fan aren't also in
fan-common.

I suppose there's a reason for it, carry on I guess.. Can be lifted if
there are more users other than you and pwm-fan.

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

Also leads to the question of why these devices aren't pwm-fans. Too
late now to change anything, I just wanna understand why.

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

--b8ufdPzhwf0sXJGA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabRLjQAKCRB4tDGHoIJi
0gxXAQDLNny5+JBigAMP8x97WhMaJzcNIQcIcnyA8xYB6KhxZAEAyqPmHFwb8Dv0
W//gQmXWLMt2mmzU7cRwWasLWidO2wk=
=Z1vV
-----END PGP SIGNATURE-----

--b8ufdPzhwf0sXJGA--
