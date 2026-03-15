Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1044346A1D;
	Sun, 15 Mar 2026 12:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773576738; cv=none; b=CzOOzI4Ho46aT/xYz/WC14/Q7FSzmd37MzvL4NKQwrPMLOuTBhQ8lFA4kZj2EH12LsX+Rlsu9wR8kKV+qcCz8tUwvj+66HkxNf3ZddX5nbAF/+P/qhmqWGdMIc0Zd/Vep0VYt7g/J4Ji7UkC8/t9+sEZRW4xYJk9lSCO43AUbOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773576738; c=relaxed/simple;
	bh=6CGcM3IIxKsMzHTVUtHK9uC5NP4xomnmcR+Vtyq5J4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T0n7aU6GtcxcRVWEI6onTM4b6B/cwrnnw8/XspeC8uVwRkM0MSKNBsdV7M3X+Kp0mAM2EG9J8sQBtDBhi4GnA1BSqwyWD6EmIz3H0gTJ3D97yXPDWPs6DBMqP9FGVXImr/N+zxj3w7a25C0TckkGbWsPPq2CjX2q87qdQjdUvgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xye8T87s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xye8T87s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F112C4CEF7;
	Sun, 15 Mar 2026 12:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773576738;
	bh=6CGcM3IIxKsMzHTVUtHK9uC5NP4xomnmcR+Vtyq5J4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xye8T87sqEmhusxuk+NSjtJawsXqCHdy/Tp6LOpl1tOZb0g1oMBTy1jQyMbY1URn/
	 yUVlDlGzUiAuvvX3ywbujI7hnxLgEuhMdhI/LD3kaHVVuTHlwjdOx/Qo8DzvZ7dULi
	 Njs5ME23BdPtoQpF2xqbXxp6kLZzpX0b/P/7BtKIQOazSFo1hU6bhy+hFbCnXiKBmA
	 eHTx97n9AJhRmA77ZF8AwAl7rIZ++qHs+SoGZqqh5netbueup7dtYkL+TkiLDtMPkK
	 WnRWjmw6qis6GhaUjTPq7CLbz12qcjAtq9IFdLsIOULpkVc+Ngf+bsLWBgU5aZ4KxI
	 nGfhnCXdrTkbA==
Date: Sun, 15 Mar 2026 12:12:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rahul Tanwar <rtanwar@maxlinear.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>, Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: moortec,mr75203: adapt
 multipleOf for T-Head TH1520
Message-ID: <20260315-cogwheel-dislodge-a3efe31728d1@spud>
References: <20260309162457.4128205-1-zhengxingda@iscas.ac.cn>
 <20260309162457.4128205-2-zhengxingda@iscas.ac.cn>
 <abWTO7QBFIcjxKn6@x1>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K2OPznGYZkKn+vwY"
Content-Disposition: inline
In-Reply-To: <abWTO7QBFIcjxKn6@x1>


--K2OPznGYZkKn+vwY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 14, 2026 at 09:56:27AM -0700, Drew Fustini wrote:
> On Tue, Mar 10, 2026 at 12:24:56AM +0800, Icenowy Zheng wrote:
> > The G and J coefficients provided by T-Head TH1520 manual (which calls
> > them A and C coefficients and calls H coefficient in the binding as B)
> > have 1/100 degree Celsius precision (the values are 42.74 and -0.16
> > respectively), however the binding currently only allows coefficients as
> > precise as 100 milli-Celsius (1/10 degree Celsius).
> >=20
> > Change the multipleOf value of these two coefficients to 10 (in the unit
> > of milli-Celsius) to satisfy the need of TH1520.
> >=20
> > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > Reviewed-by: Drew Fustini <fustini@kernel.org>
> > ---
> > Changes in v3:
> > - Added Drew's R-b.
> > - Fixed some typos in the commit message and slightly reworded the
> >   precision sentence.
> >=20
> >  Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.ya=
ml b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> > index 56db2292f062d..7d57c2934a8a1 100644
> > --- a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> > +++ b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> > @@ -105,7 +105,7 @@ properties:
> >        G coefficient for temperature equation.
> >        Default for series 5 =3D 60000
> >        Default for series 6 =3D 57400
> > -    multipleOf: 100
> > +    multipleOf: 10
> >      minimum: 1000
> >      $ref: /schemas/types.yaml#/definitions/uint32
> > =20
> > @@ -131,7 +131,7 @@ properties:
> >        J coefficient for temperature equation.
> >        Default for series 5 =3D -100
> >        Default for series 6 =3D 0
> > -    multipleOf: 100
> > +    multipleOf: 10
> >      maximum: 0
> >      $ref: /schemas/types.yaml#/definitions/int32
> > =20
> > --=20
> > 2.52.0
> >=20
>=20
> I have applied this to thead-dt-for-next.

That's odd, why is a hwmon binding in your branch?

> https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/commit/=
?h=3Dthead-dt-for-next&id=3Deb4fd43ff6793681f0a0a8e8ac861142caba2b19

I don't see an ack on it from the relevant maintainer either?

--K2OPznGYZkKn+vwY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabaiHQAKCRB4tDGHoIJi
0sHpAQCQjzi+cNolm2xVUQPM/xhXGlaZd27ksgr515avB8wazwEA23VtiIN0eo3j
ca7CEQM0KubAhupaXlPmwyZWu6IPNwY=
=4gr8
-----END PGP SIGNATURE-----

--K2OPznGYZkKn+vwY--
