Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A1E2420D;
	Mon, 13 Nov 2023 20:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="haCbuI2s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7D9FC433C8;
	Mon, 13 Nov 2023 20:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699906383;
	bh=mkFNYQekjSsmlOCaHbFJs+oa++zMf0A3M1ozUlk0TTQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=haCbuI2sKy7WLtWDDQ/5ttrUTi3+cYbmISTNNw34E0FxcJadleNVOx37PrVjq5jmQ
	 AJhg3QIlt7kuz7IPowMO/R16qT4MzrQMJsfzFK+QOljXwT7CGMH0CfZB54AKjS26d6
	 hZz5mVym+ZbvMT0yJREH4+lqxNJdb0M9jAjcj38xvfN+5u+GLOR7Xeob2i8phyejUR
	 0GipMOrWkYH9ZlWyuRRLc96GrMAlScG0eefHBY5dq4zO6JIRlbfyP1z9uWyvIF/3nd
	 +5r4zgjTsQPvBMHShf781Yw0VcnABSLRjnLrXDZqA1PtBKEOHwPAgETtyRqtaT2T0Z
	 IueNacO/zl+aw==
Date: Mon, 13 Nov 2023 20:12:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
Cc: Nuno Sa <nuno.sa@analog.com>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add LTC4282 bindings
Message-ID: <20231113-conclude-throat-fa7b5f63d464@squawk>
References: <20231110151905.1659873-1-nuno.sa@analog.com>
 <20231110151905.1659873-2-nuno.sa@analog.com>
 <20231110-astronomy-nicotine-02c798d42910@roley>
 <65060d844b4cdab02079a05286b506740623ed53.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zTK8eFRoSX30osHd"
Content-Disposition: inline
In-Reply-To: <65060d844b4cdab02079a05286b506740623ed53.camel@gmail.com>


--zTK8eFRoSX30osHd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 13, 2023 at 10:32:17AM +0100, Nuno S=C3=A1 wrote:
> On Fri, 2023-11-10 at 18:42 +0000, Conor Dooley wrote:
> > On Fri, Nov 10, 2023 at 04:18:45PM +0100, Nuno Sa wrote:

> > > +=C2=A0 adi,clkout-mode:
> > > +=C2=A0=C2=A0=C2=A0 description: |
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Controls in which mode the CLKOUT PIN=
 should work:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 - Configures the CLKOUT=
 pin to output the internal system clock
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 - Configures the CLKOUT=
 pin to output the internal conversion
> > > time
> > > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/uint32
> > > +=C2=A0=C2=A0=C2=A0 enum: [0, 1]
> >=20
> > I really am not a fan of these types of properties. Part of me says that
> > if you're outputting clocks from this device, then you should be a clock
> > controller. How do consumers of this @clkout@ pin get the rate of the
> > clock?
>=20
> I explained it to Guenter as he also argued about this. I'll wait for more
> feedback but it's likely this will just turn into a clock provider, yes.
>=20
> > I'd kinda be expecting to see a clocks property with a maxItems of 1 and
> > clock-names with two, mutually exclusive, options.
> >=20
> > The other part says, and it applies in multiple places here, that having
> > integer properties with non-integer meanings is a poor ABI. I'd be vast=
ly
> > happier if the various instances in this file became enums of strings,
> > or $re=E2=94=A4evant-unit so that a dts containing these properties is
> > immediately understandable.
>=20
> Well, I think you're mentioning the 'gpio-mode' 'and under/over-voltage-
> dividers'. I think for both it's clear that having the relevant units is =
not
> feasible (at least I'm not seeing a way of properly do it). As for the st=
rings,
> well, I don't have any much to argue other than:

Yeah, sorry - I was kinda making a general point there about not liking
having integer values mapped to some sort of meaning, when units or some
other sort of more meaningful property is possible.
I really do not like these sorts of properties that you go and put
"gpio-mode =3D <3>;" or whatever in the devicetree.
I know its not quite units, but you could use 5, 10 & 15 as the
allowable values for the divider property and I think that'd be fine.

Oh and now that I think of it - for the divider property, how does
"adi,undervoltage-dividers =3D 0" differ from omitting the property
altogether? It's not entirely apparently from the binding what that
actually means. If they do differ, I think you need to mention what
the omission of the property means, and if they do not, then that =3D 0
case should be removed IMO.

> 1) It's pattern seen in a lot of bindings - yes, that's not an excuse to =
copy
> bad/wrong things over new bindings - but, honestly, it's the first time I=
 have
> someone complaining about it so I never thought it was wrong.
>=20
> 2) It makes much more easier to handle the properties in the driver (yeah=
, I
> know that, as far as you're concerned, this does not matter to you :))

Yeah, with one hat on, sure, I don't care. Realistically I am aware that
having these integers makes your life a little easier though.
>=20
> So yeah, if you insist on it, no strong reasons on my side to not do it. =
As long
> as I see some consistency down the road :)).

=46rom me at least, I try to push people away from these sorts of integer
properties and will continue to do so.

Cheers,
Conor.

--zTK8eFRoSX30osHd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVKDSAAKCRB4tDGHoIJi
0l3xAP9GrA0u06vyokw9k1DVqZadcxbf+HX74J0Gmvf6HAo90gEAruR2qkBQq3sc
XuojY3aMXssbc0422jP8ZbOxIFkuMQs=
=rlHn
-----END PGP SIGNATURE-----

--zTK8eFRoSX30osHd--
