Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAED19C553;
	Sun, 15 Mar 2026 15:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773589444; cv=none; b=uOkWotnjXfKnrXkV5x9kWNZeIlbqYrTaylWMCvL7VVzTpxLk4UblddfBfnk9XKwC6EdAisGKUs06aRsyI1+/i7ozIt8wKT+jUdf7W3nOhYFpX5+oCdmXH/fMRKKgrbwNsQSkUaWZWfXfZ8LeUdOQQanXQO7vQgAzkq7YsdpNpwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773589444; c=relaxed/simple;
	bh=T2WiSdPf90DBlRhXs8K5bj+h+XrpfiKq077HjRLBytM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HW4/9qheoRZQ1XwWPblO/flS94lNbmTi0wML+dq9jGdJjq6C5zWTRwiEfLE35g4dGyo8I9D4I12Jg0z51DUNY4ddNBMO7Y1JNea8mbENMTjTO3b9U6M4wC9SLYpvGgILs9B1j09YOIcTBN62CAMCj7fNx41tUxR2U4o4k/FEdzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fq6T5vXp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fq6T5vXp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C0FC4CEF7;
	Sun, 15 Mar 2026 15:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773589443;
	bh=T2WiSdPf90DBlRhXs8K5bj+h+XrpfiKq077HjRLBytM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fq6T5vXp4HTEDulwoRGzNwgc+NvCL4su0DtGKkqkA5XHuCNlauZSpHNVnMTuy0iql
	 x8o3NxdQYpaCHHxpNixLRfNrRvIhMdPyB+BZRfzBCE/UwQ7vnQxm9BsqkfwiGCNjNc
	 T3JkwFy8thKTHjfEAfhUlgBw+wT8RxX6nifo/4qAJHeqf+q4gFx0/4ox6YHVUgrxWc
	 uPyYHq6lVpJyYhYuMreubfrfLEW7lwkVvTq6Z3Q3KtnWc0W/9aeejV5c6kToQWGsNy
	 kcno2KIIME1Yw4s8a7z+vUB6Y7wLb/nxHxyIfxtaeniqUHGqjGkripH1Xg5QG1dc4P
	 aJ496NPPnzupg==
Date: Sun, 15 Mar 2026 08:44:02 -0700
From: Drew Fustini <fustini@kernel.org>
To: Conor Dooley <conor@kernel.org>
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
Message-ID: <abbTwrAALGy3QbxN@gen8>
References: <20260309162457.4128205-1-zhengxingda@iscas.ac.cn>
 <20260309162457.4128205-2-zhengxingda@iscas.ac.cn>
 <abWTO7QBFIcjxKn6@x1>
 <20260315-cogwheel-dislodge-a3efe31728d1@spud>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+F+4oLCDbQt9O7DS"
Content-Disposition: inline
In-Reply-To: <20260315-cogwheel-dislodge-a3efe31728d1@spud>


--+F+4oLCDbQt9O7DS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 15, 2026 at 12:12:13PM +0000, Conor Dooley wrote:
> On Sat, Mar 14, 2026 at 09:56:27AM -0700, Drew Fustini wrote:
> > On Tue, Mar 10, 2026 at 12:24:56AM +0800, Icenowy Zheng wrote:
> > > The G and J coefficients provided by T-Head TH1520 manual (which calls
> > > them A and C coefficients and calls H coefficient in the binding as B)
> > > have 1/100 degree Celsius precision (the values are 42.74 and -0.16
> > > respectively), however the binding currently only allows coefficients=
 as
> > > precise as 100 milli-Celsius (1/10 degree Celsius).
> > >=20
> > > Change the multipleOf value of these two coefficients to 10 (in the u=
nit
> > > of milli-Celsius) to satisfy the need of TH1520.
> > >=20
> > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > > Reviewed-by: Drew Fustini <fustini@kernel.org>
> > > ---
> > > Changes in v3:
> > > - Added Drew's R-b.
> > > - Fixed some typos in the commit message and slightly reworded the
> > >   precision sentence.
> > >=20
> > >  Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.=
yaml b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> > > index 56db2292f062d..7d57c2934a8a1 100644
> > > --- a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> > > +++ b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> > > @@ -105,7 +105,7 @@ properties:
> > >        G coefficient for temperature equation.
> > >        Default for series 5 =3D 60000
> > >        Default for series 6 =3D 57400
> > > -    multipleOf: 100
> > > +    multipleOf: 10
> > >      minimum: 1000
> > >      $ref: /schemas/types.yaml#/definitions/uint32
> > > =20
> > > @@ -131,7 +131,7 @@ properties:
> > >        J coefficient for temperature equation.
> > >        Default for series 5 =3D -100
> > >        Default for series 6 =3D 0
> > > -    multipleOf: 100
> > > +    multipleOf: 10
> > >      maximum: 0
> > >      $ref: /schemas/types.yaml#/definitions/int32
> > > =20
> > > --=20
> > > 2.52.0
> > >=20
> >=20
> > I have applied this to thead-dt-for-next.
>=20
> That's odd, why is a hwmon binding in your branch?
>=20
> > https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/commi=
t/?h=3Dthead-dt-for-next&id=3Deb4fd43ff6793681f0a0a8e8ac861142caba2b19
>=20
> I don't see an ack on it from the relevant maintainer either?

Sorry, my mistake, I should not have applied the binding. And you are
right to point out that there was no ack from Guenter or Rahul Tanwar.
I will drop both patches from thead-dt-for-next and wait for agreement
on the binding.

Thanks,
Drew

--+F+4oLCDbQt9O7DS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCabbTuAAKCRDb7CzD2Six
DAWrAP4xDvkXL4ryz5mqHC42vAKQLprtWK3yOVHg0qHRPUP0LQEAzWZ82751xGky
SDgVYjNgQpHEejY52ScPCJjQS9yh2g4=
=EKB3
-----END PGP SIGNATURE-----

--+F+4oLCDbQt9O7DS--
