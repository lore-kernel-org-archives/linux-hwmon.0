Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D51437467;
	Tue, 15 Sep 2026 17:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491879; cv=none; b=QRetQwmrhxY8DTTHbMzPF8/G5MXoWWSG9+PA2JD0a2zsezodc3cTKuGZieXQ0XPfrcUPjqNZgVm6n+vmqcQvGww8XkcG2PrWCnFaOCQMK2w6R4rR3QT1FbOzEXnlURnVrQl3DePGWpE+hxiPRzX1sArGzT20PBhz56wUViLiXTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491879; c=relaxed/simple;
	bh=SJB74K38uJedzQLl7qAFXQAV3YZSXZHfZlQFamJaQcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EVyjKaC9VfnAR4+7XQ7jrMacwOL9VUoqd5uvJ3+5SVN6qkdU8QmFLhyd1aUsg+6/s5vE+0xpXiCDtGjdNTnYzIBmatwHx72ZflInv8j/3B2LIcI8oNs1fbaoUSiaAcxuZb45Va69lha0r0l26uCdR1OzIYrhLA8BXNYtQ+PCvBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VqxfRvPw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VqxfRvPw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92EC61F000FF;
	Tue, 15 Sep 2026 17:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789491876;
	bh=SZXMuRL0PaVubpOhLfkony9ps3d0zf372tRd0OzhHIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VqxfRvPwp3FJw9NkDJap66Tu6Gaw1mzlOXlml0iphUiVLB2GMZzZ9QtL4InQ7Vvc1
	 KIVge3M1L0LGsvhI9/awrIU2Q/mcXz5fLU6HgXGvGSDgsXYFe8lLMcOPt5ZQOASyWp
	 g6sLj3cQzG+pEEOx9hvbkv6Kw5AwhrUerNIJxWtNualV5cWgvrHcub4m9W078tjuAd
	 ZYLVVmL/tYfdSPt4myFAjG6RTAfW7e2Q5nWtd0QB7yZH7zrIEojVVIVscNj8F+bRbq
	 3tV2MxiJY6IgqwpC8AL85dPJja6X9HwXEHNsFO57dSTriwa92nnC58hcD1Tv/hEq+x
	 Wd4Hb6Sx7R5XA==
Date: Tue, 15 Sep 2026 18:04:31 +0100
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
Message-ID: <20260915-recognize-activist-733d145c0ca7@spud>
References: <20260907-add-raa229639-and-raa229640-v1-0-8f7218cba85d@gmail.com>
 <20260907-add-raa229639-and-raa229640-v1-1-8f7218cba85d@gmail.com>
 <20260907-chimp-pectin-20f4ea3b772c@spud>
 <CAPBH0A9GZSD5R657xo1woijKfgS6gecUND4uabguaqUON2exXw@mail.gmail.com>
 <20260908-dinner-atrophy-757595146656@spud>
 <CAPBH0A9yKhvDA_pda45Me1c0tXcSj3zLqLoFgUOQj3MES0Mk1A@mail.gmail.com>
 <20260915-showcase-reorder-e3c4d45eff60@spud>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="24vTYmQs4yGc48/J"
Content-Disposition: inline
In-Reply-To: <20260915-showcase-reorder-e3c4d45eff60@spud>

--24vTYmQs4yGc48/J
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 06:00:50PM +0100, Conor Dooley wrote:
> On Mon, Sep 14, 2026 at 08:06:25PM +0800, Colin Huang wrote:
> > Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=889=E6=
=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8812:57=E5=AF=AB=E9=81=93=EF=BC=9A
> > >
> > > On Tue, Sep 08, 2026 at 02:31:40PM +0800, Colin Huang wrote:
> > > > Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=888=
=E6=97=A5=E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=881:01=E5=AF=AB=E9=81=93=EF=BC=
=9A
> > > > >
> > > > > On Mon, Sep 07, 2026 at 03:03:29PM +0800, Colin Huang wrote:
> > > > > > From: Colin Huang <u8813345@gmail.com>
> > > > > >
> > > > > > Add Device Tree compatible strings for Renesas RAA229639 and
> > > > > > RAA229640 PMBus devices.
> > > > >
> > > > > Driver change suggests fallback compatibles could be used.
> > > > > Why aren't they? If they can be, add them. Otherwise, explain why=
 not in
> > > > > your commit message.
> > > > >
> > > > > pw-bot: changes-requested
> > > > >
> > > > > Thanks,
> > > > > Conor.
> > > > >
> > > > Hi Conor
> > > >   Thanks for the review.
> > > >
> > > >   I didn't add a fallback compatible because I only have document f=
or
> > > > RAA229639 and RAA229640
> > > >   and could not verify full DT level compatibility with any existing
> > > > supported devices. While both devices
> > > >   are handled by the existing raa_dmpvr2_2rail driver variant, I do=
n't
> > > > have sufficient information to establish
> > > >   a compatible fallback relationship.
> > >
> > > Given that the match data table looks like this:
> > > static const struct of_device_id isl68137_of_match[] =3D {
> > >         { .compatible =3D "isil,isl68137", .data =3D (void *)raa_dmpv=
r1_2rail },
> > >         { .compatible =3D "renesas,isl68220", .data =3D (void *)raa_d=
mpvr2_2rail },
> > >         { .compatible =3D "renesas,isl68221", .data =3D (void *)raa_d=
mpvr2_3rail },
> > >         { .compatible =3D "renesas,isl68222", .data =3D (void *)raa_d=
mpvr2_2rail },
> > >         { .compatible =3D "renesas,isl68223", .data =3D (void *)raa_d=
mpvr2_2rail },
> > >         { .compatible =3D "renesas,isl68224", .data =3D (void *)raa_d=
mpvr2_3rail },
> > >         { .compatible =3D "renesas,isl68225", .data =3D (void *)raa_d=
mpvr2_2rail },
> > >         { .compatible =3D "renesas,isl68226", .data =3D (void *)raa_d=
mpvr2_3rail },
> > >         { .compatible =3D "renesas,isl68227", .data =3D (void *)raa_d=
mpvr2_1rail },
> > >         { .compatible =3D "renesas,isl68229", .data =3D (void *)raa_d=
mpvr2_3rail },
> > >         { .compatible =3D "renesas,isl68233", .data =3D (void *)raa_d=
mpvr2_2rail },
> > >         { .compatible =3D "renesas,isl68239", .data =3D (void *)raa_d=
mpvr2_3rail },
> > >
> > >         { .compatible =3D "renesas,isl69222", .data =3D (void *)raa_d=
mpvr2_2rail },
> > >         { .compatible =3D "renesas,isl69223", .data =3D (void *)raa_d=
mpvr2_3rail },
> > >         { .compatible =3D "renesas,isl69224", .data =3D (void *)raa_d=
mpvr2_2rail },
> > >         { .compatible =3D "renesas,isl69225", .data =3D (void *)raa_d=
mpvr2_2rail },
> > >         { .compatible =3D "renesas,isl69227", .data =3D (void *)raa_d=
mpvr2_3rail },
> > >         { .compatible =3D "renesas,isl69228", .data =3D (void *)raa_d=
mpvr2_3rail },
> > >         { .compatible =3D "renesas,isl69234", .data =3D (void *)raa_d=
mpvr2_2rail },
> > >         { .compatible =3D "renesas,isl69236", .data =3D (void *)raa_d=
mpvr2_2rail },
> > >         { .compatible =3D "renesas,isl69239", .data =3D (void *)raa_d=
mpvr2_3rail },
> > >         { .compatible =3D "renesas,isl69242", .data =3D (void *)raa_d=
mpvr2_2rail },
> > >         { .compatible =3D "renesas,isl69243", .data =3D (void *)raa_d=
mpvr2_1rail },
> > >         { .compatible =3D "renesas,isl69247", .data =3D (void *)raa_d=
mpvr2_2rail },
> > >         { .compatible =3D "renesas,isl69248", .data =3D (void *)raa_d=
mpvr2_2rail },
> > >         { .compatible =3D "renesas,isl69254", .data =3D (void *)raa_d=
mpvr2_2rail },
> > >         { .compatible =3D "renesas,isl69255", .data =3D (void *)raa_d=
mpvr2_2rail },
> > >         { .compatible =3D "renesas,isl69256", .data =3D (void *)raa_d=
mpvr2_2rail },
> > >         { .compatible =3D "renesas,isl69259", .data =3D (void *)raa_d=
mpvr2_2rail },
> > >         { .compatible =3D "isil,isl69260", .data =3D (void *)raa_dmpv=
r2_2rail },
> > >         { .compatible =3D "renesas,isl69268", .data =3D (void *)raa_d=
mpvr2_2rail },
> > >         { .compatible =3D "isil,isl69269", .data =3D (void *)raa_dmpv=
r2_3rail },
> > >         { .compatible =3D "renesas,isl69298", .data =3D (void *)raa_d=
mpvr2_2rail },
> > >
> > >         { .compatible =3D "renesas,raa228000", .data =3D (void *)raa_=
dmpvr2_hv },
> > >         { .compatible =3D "renesas,raa228004", .data =3D (void *)raa_=
dmpvr2_hv },
> > >         { .compatible =3D "renesas,raa228006", .data =3D (void *)raa_=
dmpvr2_hv },
> > >         { .compatible =3D "renesas,raa228228", .data =3D (void *)raa_=
dmpvr2_2rail_nontc },
> > >         { .compatible =3D "renesas,raa228244", .data =3D (void *)raa_=
dmpvr2_2rail_nontc },
> > >         { .compatible =3D "renesas,raa228246", .data =3D (void *)raa_=
dmpvr2_2rail_nontc },
> > >         { .compatible =3D "renesas,raa229001", .data =3D (void *)raa_=
dmpvr2_2rail },
> > >         { .compatible =3D "renesas,raa229004", .data =3D (void *)raa_=
dmpvr2_2rail },
> > >         { .compatible =3D "renesas,raa229621", .data =3D (void *)raa_=
dmpvr2_2rail },
> > >         { },
> > > };
> > >
> > > It's probably pretty safe to assume that a fallback would work here,
> > > given how many devices are served by the same data structures but
> > > maybe one of the Renesas folks on CC can confirm that for us.
> > > At the very least, you have documents for two devices and should be a=
ble
> > > to confirm if they're compatible with one another.
> > >
> > > Thanks,
> > > Conor.
> > >
> > Hi Conor,
> >   Thanks for the review.
> >   I found a very similar precedent here:
> >       Link: https://lore.kernel.org/r/20260325090208.857-2-dawei.liu.jy=
@renesas.com
> >       RAA228942 and RAA228943 use renesas,raa228244 as fallback compati=
ble
> >=20
> >   Therefore, I plan to followthe same approach:
> >   RAA229639 and RAA229640 also use renesas,raa228244 as fallback compat=
ible.
> >=20
> > ```
> > @@ -60,13 +60,13 @@ properties:
> >            - renesas,raa229001
> >            - renesas,raa229004
> >            - renesas,raa229621
> >=20
> >        - items:
> >            - enum:
> >                - renesas,raa228942
> >                - renesas,raa228943
> > +              - renesas,raa229639
> > +              - renesas,raa229640
> >            - const: renesas,raa228244
> >=20
> >    reg:
> > ```
> > Does this look reasonable?
>=20
> It does, thanks for the update.

Actually no. The idea is right, but the specific fallback is not?
You added to the driver
diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
index 2f7f825bfb69..53b44775ba1e 100644
--- a/drivers/hwmon/pmbus/isl68137.c
+++ b/drivers/hwmon/pmbus/isl68137.c
@@ -456,6 +456,8 @@ static const struct i2c_device_id raa_dmpvr_id[] =3D {
 	{ .name =3D "raa229004", .driver_data =3D raa_dmpvr2_2rail },
 	{ .name =3D "raa229141", .driver_data =3D raa_dmpvr2_2rail_pmbus },
 	{ .name =3D "raa229621", .driver_data =3D raa_dmpvr2_2rail },
+	{ .name =3D "raa229639", .driver_data =3D raa_dmpvr2_2rail },
+	{ .name =3D "raa229640", .driver_data =3D raa_dmpvr2_2rail },
 	{ }
 };
=20
@@ -506,6 +508,8 @@ static const struct of_device_id isl68137_of_match[] =
=3D {
 	{ .compatible =3D "renesas,raa229001", .data =3D (void *)raa_dmpvr2_2rail=
 },
 	{ .compatible =3D "renesas,raa229004", .data =3D (void *)raa_dmpvr2_2rail=
 },
 	{ .compatible =3D "renesas,raa229621", .data =3D (void *)raa_dmpvr2_2rail=
 },
+	{ .compatible =3D "renesas,raa229639", .data =3D (void *)raa_dmpvr2_2rail=
 },
+	{ .compatible =3D "renesas,raa229640", .data =3D (void *)raa_dmpvr2_2rail=
 },

but the raa228244 uses a different bit of match data:
> > >         { .compatible =3D "renesas,raa228244", .data =3D (void *)raa_=
dmpvr2_2rail_nontc },

So you need something like
- items:
    - enum:
        - renesas,raa229639
        - renesas,raa229640
    - const: renesas,raa229001

--24vTYmQs4yGc48/J
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaql6nwAKCRB4tDGHoIJi
0tIlAQC+cFf0k8OYHcWRBBtKBfyIu1E/vsw05G9I7DCwO7p1mwEAk+9J5Ba2GOuv
WH4BnF7XVPXEzdJqS6DxEcN23WDHuwU=
=gcXN
-----END PGP SIGNATURE-----

--24vTYmQs4yGc48/J--
