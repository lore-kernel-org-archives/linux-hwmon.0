Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2D858FD1F;
	Tue,  8 Sep 2026 16:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886636; cv=none; b=owduuL3mno2SpfNYlbyyb31SrsTOcnLT6LcJHOOoPlRljBHJfYun8yLnmUeMaDHanSiQ6320CI1xiMGVa57shaeVqtwRrMfQuSMUCZp9f24aAaRZVwX3OtVZ2ZiXXmNdLczj6EQ8fH0aroKwxdhqhS67ZtrcNRUMBJXXgmDp0C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886636; c=relaxed/simple;
	bh=AZ7/hnsRMmplC0Dfsn4n0DXyeBio1jdcbd+swy637ig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h90xzaTOv0jO4oirw4Tc7q/y46JqtxRQqHjDSTqbPcGhEpNmC2TQRn1A1FvnyNZ3uGcosNFwHUM/2QRzdewFSb5t3Nzy99AtiHdXDcB8WPI2SP7CcYlJ8448sHy2c63jThX8ekAg3kUuZ6tWjGikWb8YFMAdye2MCoo3njGSFbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G4VwgGus; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G4VwgGus"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 518681F00A3A;
	Tue,  8 Sep 2026 16:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788886634;
	bh=0/ZRRZlEm9Jct3VZ8ASm/fuP9FSPYxflHWk8H22J5eQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G4VwgGusCcHA2Pr62X2GzMQe1vYfxzkezjoWJOw6RSq0RQPiFNuPQzOmMa0VpD7fN
	 4CRvgS3PXwrFc53IvnvUcPCZMHaVbxAEM1nNay0T3Yo/hxnMaOiOp/kNMcw9hgbMIf
	 0qFwO05fjw9BlS443x7S4gUMnMJ0ofC2P0WMp7kVtHUwliCAbdW7GJlKUEG4FsBh0c
	 JVrWbaSSqV65ljqVxf2qRUL/Br6gh5iFFBfaZTKoelL6DhZXe4gsEoEmvfqG70E2Ha
	 8GDcplXsDCGQJNPVSKmBmowdPkHJZQkSdOdsZ6OxoEhNuj09owELBCLEc257xfSIVb
	 nXKYSTQMQrLmQ==
Date: Tue, 8 Sep 2026 17:57:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Colin Huang <u8813345@gmail.com>
Cc: Colin Huang <colin.huang2@amd.com>, Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Grant Peltier <grant.peltier.jg@renesas.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: isl68137: Add Renesas
 RAA229639 and RAA229640
Message-ID: <20260908-dinner-atrophy-757595146656@spud>
References: <20260907-add-raa229639-and-raa229640-v1-0-8f7218cba85d@gmail.com>
 <20260907-add-raa229639-and-raa229640-v1-1-8f7218cba85d@gmail.com>
 <20260907-chimp-pectin-20f4ea3b772c@spud>
 <CAPBH0A9GZSD5R657xo1woijKfgS6gecUND4uabguaqUON2exXw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e8B7m4pThKSSMqao"
Content-Disposition: inline
In-Reply-To: <CAPBH0A9GZSD5R657xo1woijKfgS6gecUND4uabguaqUON2exXw@mail.gmail.com>

--e8B7m4pThKSSMqao
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2026 at 02:31:40PM +0800, Colin Huang wrote:
> Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=888=E6=97=
=A5=E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=881:01=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > On Mon, Sep 07, 2026 at 03:03:29PM +0800, Colin Huang wrote:
> > > From: Colin Huang <u8813345@gmail.com>
> > >
> > > Add Device Tree compatible strings for Renesas RAA229639 and
> > > RAA229640 PMBus devices.
> >
> > Driver change suggests fallback compatibles could be used.
> > Why aren't they? If they can be, add them. Otherwise, explain why not in
> > your commit message.
> >
> > pw-bot: changes-requested
> >
> > Thanks,
> > Conor.
> >
> Hi Conor
>   Thanks for the review.
>=20
>   I didn't add a fallback compatible because I only have document for
> RAA229639 and RAA229640
>   and could not verify full DT level compatibility with any existing
> supported devices. While both devices
>   are handled by the existing raa_dmpvr2_2rail driver variant, I don't
> have sufficient information to establish
>   a compatible fallback relationship.

Given that the match data table looks like this:
static const struct of_device_id isl68137_of_match[] =3D {
	{ .compatible =3D "isil,isl68137", .data =3D (void *)raa_dmpvr1_2rail },
	{ .compatible =3D "renesas,isl68220", .data =3D (void *)raa_dmpvr2_2rail },
	{ .compatible =3D "renesas,isl68221", .data =3D (void *)raa_dmpvr2_3rail },
	{ .compatible =3D "renesas,isl68222", .data =3D (void *)raa_dmpvr2_2rail },
	{ .compatible =3D "renesas,isl68223", .data =3D (void *)raa_dmpvr2_2rail },
	{ .compatible =3D "renesas,isl68224", .data =3D (void *)raa_dmpvr2_3rail },
	{ .compatible =3D "renesas,isl68225", .data =3D (void *)raa_dmpvr2_2rail },
	{ .compatible =3D "renesas,isl68226", .data =3D (void *)raa_dmpvr2_3rail },
	{ .compatible =3D "renesas,isl68227", .data =3D (void *)raa_dmpvr2_1rail },
	{ .compatible =3D "renesas,isl68229", .data =3D (void *)raa_dmpvr2_3rail },
	{ .compatible =3D "renesas,isl68233", .data =3D (void *)raa_dmpvr2_2rail },
	{ .compatible =3D "renesas,isl68239", .data =3D (void *)raa_dmpvr2_3rail },

	{ .compatible =3D "renesas,isl69222", .data =3D (void *)raa_dmpvr2_2rail },
	{ .compatible =3D "renesas,isl69223", .data =3D (void *)raa_dmpvr2_3rail },
	{ .compatible =3D "renesas,isl69224", .data =3D (void *)raa_dmpvr2_2rail },
	{ .compatible =3D "renesas,isl69225", .data =3D (void *)raa_dmpvr2_2rail },
	{ .compatible =3D "renesas,isl69227", .data =3D (void *)raa_dmpvr2_3rail },
	{ .compatible =3D "renesas,isl69228", .data =3D (void *)raa_dmpvr2_3rail },
	{ .compatible =3D "renesas,isl69234", .data =3D (void *)raa_dmpvr2_2rail },
	{ .compatible =3D "renesas,isl69236", .data =3D (void *)raa_dmpvr2_2rail },
	{ .compatible =3D "renesas,isl69239", .data =3D (void *)raa_dmpvr2_3rail },
	{ .compatible =3D "renesas,isl69242", .data =3D (void *)raa_dmpvr2_2rail },
	{ .compatible =3D "renesas,isl69243", .data =3D (void *)raa_dmpvr2_1rail },
	{ .compatible =3D "renesas,isl69247", .data =3D (void *)raa_dmpvr2_2rail },
	{ .compatible =3D "renesas,isl69248", .data =3D (void *)raa_dmpvr2_2rail },
	{ .compatible =3D "renesas,isl69254", .data =3D (void *)raa_dmpvr2_2rail },
	{ .compatible =3D "renesas,isl69255", .data =3D (void *)raa_dmpvr2_2rail },
	{ .compatible =3D "renesas,isl69256", .data =3D (void *)raa_dmpvr2_2rail },
	{ .compatible =3D "renesas,isl69259", .data =3D (void *)raa_dmpvr2_2rail },
	{ .compatible =3D "isil,isl69260", .data =3D (void *)raa_dmpvr2_2rail },
	{ .compatible =3D "renesas,isl69268", .data =3D (void *)raa_dmpvr2_2rail },
	{ .compatible =3D "isil,isl69269", .data =3D (void *)raa_dmpvr2_3rail },
	{ .compatible =3D "renesas,isl69298", .data =3D (void *)raa_dmpvr2_2rail },

	{ .compatible =3D "renesas,raa228000", .data =3D (void *)raa_dmpvr2_hv },
	{ .compatible =3D "renesas,raa228004", .data =3D (void *)raa_dmpvr2_hv },
	{ .compatible =3D "renesas,raa228006", .data =3D (void *)raa_dmpvr2_hv },
	{ .compatible =3D "renesas,raa228228", .data =3D (void *)raa_dmpvr2_2rail_=
nontc },
	{ .compatible =3D "renesas,raa228244", .data =3D (void *)raa_dmpvr2_2rail_=
nontc },
	{ .compatible =3D "renesas,raa228246", .data =3D (void *)raa_dmpvr2_2rail_=
nontc },
	{ .compatible =3D "renesas,raa229001", .data =3D (void *)raa_dmpvr2_2rail =
},
	{ .compatible =3D "renesas,raa229004", .data =3D (void *)raa_dmpvr2_2rail =
},
	{ .compatible =3D "renesas,raa229621", .data =3D (void *)raa_dmpvr2_2rail =
},
	{ },
};

It's probably pretty safe to assume that a fallback would work here,
given how many devices are served by the same data structures but
maybe one of the Renesas folks on CC can confirm that for us.
At the very least, you have documents for two devices and should be able
to confirm if they're compatible with one another.

Thanks,
Conor.

>=20
>   I will clarify this in commit message in v2.
>=20
> Thanks.
> Colin
> > >
> > > Signed-off-by: Colin Huang <u8813345@gmail.com>
> > > ---
> > >  Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml | 2=
 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68=
137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> > > index 8216cdf758d8..3537c7ddfb09 100644
> > > --- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> > > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> > > @@ -60,6 +60,8 @@ properties:
> > >            - renesas,raa229001
> > >            - renesas,raa229004
> > >            - renesas,raa229621
> > > +          - renesas,raa229639
> > > +          - renesas,raa229640
> > >
> > >        - items:
> > >            - enum:
> > >
> > > --
> > > 2.34.1
> > >

--e8B7m4pThKSSMqao
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqA+ZgAKCRB4tDGHoIJi
0rebAP9vWApRS2E/5cuGc3YpDfv9PUaMuq1UbT+MAk/mJ2lrlAEAq3V78XBC+40S
gUOVRUWTkP0VEXMt0J1FbZ2vYs7zzAI=
=IdR0
-----END PGP SIGNATURE-----

--e8B7m4pThKSSMqao--
