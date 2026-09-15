Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D743D6CB6;
	Tue, 15 Sep 2026 17:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491656; cv=none; b=knOdQlA2BckhXz44RP4EspcWaU5DgglFS9wRHRSC/ZZUqqh6BbdOUVlngKop80s9rbfKobmW6Gk9bYKP87jHJ4W9D1EF091V8092rqE/yvMIL2iruCVsttfJ4zyA4fqbXd0291SV9UYweKN22/QAP6reYbxM5K1yKvVo0Z1YLt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491656; c=relaxed/simple;
	bh=rWJyeMjnNnhlHrBFTQ3oDghU5Y5DHu+FjmkUyF+00+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tPy+MIjAJ6TuW/gd9cPbFuHYfNngOcarHpJSeQw6oMdYRqSrNG4ZPWqoFPKgIeE5nMhNUyy8xAeQJ+JrvaP5CMSjsJmzZd4DFDGM99BsT+iMoMusxcWXiBB3g0MUd8vD7KHcTaK2c41IjZk53CgER4M8UyseTxxrunZB4Ivq+ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=REzWFWmq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="REzWFWmq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B65661F000FF;
	Tue, 15 Sep 2026 17:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789491655;
	bh=/623ZrNSr/NNkkOaUlzLpOh/WJ5q0YOw9HHlwcR7lpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=REzWFWmqJB7gg7z3UPQwLTCSegtjhYoOjs81dh3UjpdtZQwtUuMjOTj9hAiqbv5yk
	 Pnm15fn0rfjwCeMnQ40sthdZsvuxZVfA0by9ryKBbwDVJ6HS6Hx3BGtZZtfe6peMA/
	 95un70rR3Nc5udEbA10EbZwgXMhZSb5b+3S27m11VHDg3uVcuAKIJcxlAntY/HrdSJ
	 Phd0/tq/tgiqADyYeN7l8e5GSdXWB10sgk/BDpR6l4an1J2+DSz5WFolVQjD8RGd6y
	 zOHNx7cNztjz2z/5CL4M5AsC+KJohpj9etO6CE0xRldOI/UmZJZt69nK/R+gp0u8I6
	 YBeM6+wkwjjeQ==
Date: Tue, 15 Sep 2026 18:00:50 +0100
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
Message-ID: <20260915-showcase-reorder-e3c4d45eff60@spud>
References: <20260907-add-raa229639-and-raa229640-v1-0-8f7218cba85d@gmail.com>
 <20260907-add-raa229639-and-raa229640-v1-1-8f7218cba85d@gmail.com>
 <20260907-chimp-pectin-20f4ea3b772c@spud>
 <CAPBH0A9GZSD5R657xo1woijKfgS6gecUND4uabguaqUON2exXw@mail.gmail.com>
 <20260908-dinner-atrophy-757595146656@spud>
 <CAPBH0A9yKhvDA_pda45Me1c0tXcSj3zLqLoFgUOQj3MES0Mk1A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1lIC8xGFLHT1w+hO"
Content-Disposition: inline
In-Reply-To: <CAPBH0A9yKhvDA_pda45Me1c0tXcSj3zLqLoFgUOQj3MES0Mk1A@mail.gmail.com>

--1lIC8xGFLHT1w+hO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 08:06:25PM +0800, Colin Huang wrote:
> Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=889=E6=97=
=A5=E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8812:57=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > On Tue, Sep 08, 2026 at 02:31:40PM +0800, Colin Huang wrote:
> > > Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=888=E6=
=97=A5=E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=881:01=E5=AF=AB=E9=81=93=EF=BC=9A
> > > >
> > > > On Mon, Sep 07, 2026 at 03:03:29PM +0800, Colin Huang wrote:
> > > > > From: Colin Huang <u8813345@gmail.com>
> > > > >
> > > > > Add Device Tree compatible strings for Renesas RAA229639 and
> > > > > RAA229640 PMBus devices.
> > > >
> > > > Driver change suggests fallback compatibles could be used.
> > > > Why aren't they? If they can be, add them. Otherwise, explain why n=
ot in
> > > > your commit message.
> > > >
> > > > pw-bot: changes-requested
> > > >
> > > > Thanks,
> > > > Conor.
> > > >
> > > Hi Conor
> > >   Thanks for the review.
> > >
> > >   I didn't add a fallback compatible because I only have document for
> > > RAA229639 and RAA229640
> > >   and could not verify full DT level compatibility with any existing
> > > supported devices. While both devices
> > >   are handled by the existing raa_dmpvr2_2rail driver variant, I don't
> > > have sufficient information to establish
> > >   a compatible fallback relationship.
> >
> > Given that the match data table looks like this:
> > static const struct of_device_id isl68137_of_match[] =3D {
> >         { .compatible =3D "isil,isl68137", .data =3D (void *)raa_dmpvr1=
_2rail },
> >         { .compatible =3D "renesas,isl68220", .data =3D (void *)raa_dmp=
vr2_2rail },
> >         { .compatible =3D "renesas,isl68221", .data =3D (void *)raa_dmp=
vr2_3rail },
> >         { .compatible =3D "renesas,isl68222", .data =3D (void *)raa_dmp=
vr2_2rail },
> >         { .compatible =3D "renesas,isl68223", .data =3D (void *)raa_dmp=
vr2_2rail },
> >         { .compatible =3D "renesas,isl68224", .data =3D (void *)raa_dmp=
vr2_3rail },
> >         { .compatible =3D "renesas,isl68225", .data =3D (void *)raa_dmp=
vr2_2rail },
> >         { .compatible =3D "renesas,isl68226", .data =3D (void *)raa_dmp=
vr2_3rail },
> >         { .compatible =3D "renesas,isl68227", .data =3D (void *)raa_dmp=
vr2_1rail },
> >         { .compatible =3D "renesas,isl68229", .data =3D (void *)raa_dmp=
vr2_3rail },
> >         { .compatible =3D "renesas,isl68233", .data =3D (void *)raa_dmp=
vr2_2rail },
> >         { .compatible =3D "renesas,isl68239", .data =3D (void *)raa_dmp=
vr2_3rail },
> >
> >         { .compatible =3D "renesas,isl69222", .data =3D (void *)raa_dmp=
vr2_2rail },
> >         { .compatible =3D "renesas,isl69223", .data =3D (void *)raa_dmp=
vr2_3rail },
> >         { .compatible =3D "renesas,isl69224", .data =3D (void *)raa_dmp=
vr2_2rail },
> >         { .compatible =3D "renesas,isl69225", .data =3D (void *)raa_dmp=
vr2_2rail },
> >         { .compatible =3D "renesas,isl69227", .data =3D (void *)raa_dmp=
vr2_3rail },
> >         { .compatible =3D "renesas,isl69228", .data =3D (void *)raa_dmp=
vr2_3rail },
> >         { .compatible =3D "renesas,isl69234", .data =3D (void *)raa_dmp=
vr2_2rail },
> >         { .compatible =3D "renesas,isl69236", .data =3D (void *)raa_dmp=
vr2_2rail },
> >         { .compatible =3D "renesas,isl69239", .data =3D (void *)raa_dmp=
vr2_3rail },
> >         { .compatible =3D "renesas,isl69242", .data =3D (void *)raa_dmp=
vr2_2rail },
> >         { .compatible =3D "renesas,isl69243", .data =3D (void *)raa_dmp=
vr2_1rail },
> >         { .compatible =3D "renesas,isl69247", .data =3D (void *)raa_dmp=
vr2_2rail },
> >         { .compatible =3D "renesas,isl69248", .data =3D (void *)raa_dmp=
vr2_2rail },
> >         { .compatible =3D "renesas,isl69254", .data =3D (void *)raa_dmp=
vr2_2rail },
> >         { .compatible =3D "renesas,isl69255", .data =3D (void *)raa_dmp=
vr2_2rail },
> >         { .compatible =3D "renesas,isl69256", .data =3D (void *)raa_dmp=
vr2_2rail },
> >         { .compatible =3D "renesas,isl69259", .data =3D (void *)raa_dmp=
vr2_2rail },
> >         { .compatible =3D "isil,isl69260", .data =3D (void *)raa_dmpvr2=
_2rail },
> >         { .compatible =3D "renesas,isl69268", .data =3D (void *)raa_dmp=
vr2_2rail },
> >         { .compatible =3D "isil,isl69269", .data =3D (void *)raa_dmpvr2=
_3rail },
> >         { .compatible =3D "renesas,isl69298", .data =3D (void *)raa_dmp=
vr2_2rail },
> >
> >         { .compatible =3D "renesas,raa228000", .data =3D (void *)raa_dm=
pvr2_hv },
> >         { .compatible =3D "renesas,raa228004", .data =3D (void *)raa_dm=
pvr2_hv },
> >         { .compatible =3D "renesas,raa228006", .data =3D (void *)raa_dm=
pvr2_hv },
> >         { .compatible =3D "renesas,raa228228", .data =3D (void *)raa_dm=
pvr2_2rail_nontc },
> >         { .compatible =3D "renesas,raa228244", .data =3D (void *)raa_dm=
pvr2_2rail_nontc },
> >         { .compatible =3D "renesas,raa228246", .data =3D (void *)raa_dm=
pvr2_2rail_nontc },
> >         { .compatible =3D "renesas,raa229001", .data =3D (void *)raa_dm=
pvr2_2rail },
> >         { .compatible =3D "renesas,raa229004", .data =3D (void *)raa_dm=
pvr2_2rail },
> >         { .compatible =3D "renesas,raa229621", .data =3D (void *)raa_dm=
pvr2_2rail },
> >         { },
> > };
> >
> > It's probably pretty safe to assume that a fallback would work here,
> > given how many devices are served by the same data structures but
> > maybe one of the Renesas folks on CC can confirm that for us.
> > At the very least, you have documents for two devices and should be able
> > to confirm if they're compatible with one another.
> >
> > Thanks,
> > Conor.
> >
> Hi Conor,
>   Thanks for the review.
>   I found a very similar precedent here:
>       Link: https://lore.kernel.org/r/20260325090208.857-2-dawei.liu.jy@r=
enesas.com
>       RAA228942 and RAA228943 use renesas,raa228244 as fallback compatible
>=20
>   Therefore, I plan to followthe same approach:
>   RAA229639 and RAA229640 also use renesas,raa228244 as fallback compatib=
le.
>=20
> ```
> @@ -60,13 +60,13 @@ properties:
>            - renesas,raa229001
>            - renesas,raa229004
>            - renesas,raa229621
>=20
>        - items:
>            - enum:
>                - renesas,raa228942
>                - renesas,raa228943
> +              - renesas,raa229639
> +              - renesas,raa229640
>            - const: renesas,raa228244
>=20
>    reg:
> ```
> Does this look reasonable?

It does, thanks for the update.

Conor.

--1lIC8xGFLHT1w+hO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaql5wgAKCRB4tDGHoIJi
0sqCAP9IpczqByFr8qC434W0Icf8xrHmhnnYECkMY/UVsU6SIgEA57dUl7bML3Ae
eAj5/7705FnI8GkI6auKSgTG2c5pHQw=
=CLsO
-----END PGP SIGNATURE-----

--1lIC8xGFLHT1w+hO--
