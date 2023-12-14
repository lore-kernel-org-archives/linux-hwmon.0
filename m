Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE41D5B209;
	Thu, 14 Dec 2023 15:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VfSZyovl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66CBFC433C8;
	Thu, 14 Dec 2023 15:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702568362;
	bh=OUgQGKm22QNdpXpommaA6FLJdhjRd74GWH/14+qKI1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VfSZyovlHlRjpzeczdQNcJT3OK37zwhq30uHnBLvGvvflGIUUpOFBkTjj6En0yWuQ
	 4jh20GkIla24I08ShPUH5zMb/XqruDn53xePNQb1mm8yxE8HS8gFLrVSFibD3bhxFK
	 Rrr0KswEODyf/rJFxie9mAZFUEG++GSx/led50iKLilM23KjPbkmD1t4piSXLreyNZ
	 WGnwCWeYBw/gNaD2WZNkaQsdklFh0tPA/e8MNqqwQeohrXn+E4jUaoY2kHdBtb5gZH
	 bBhYbRsQIN9G8NJSzAyosSNq/wUZ8WxBdcWJUoKyzf/r2YLyqr3E7RCClkcRk3wiAd
	 4EerzlQyXdneQ==
Date: Thu, 14 Dec 2023 15:39:18 +0000
From: Conor Dooley <conor@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Daniel Matyas <daniel.matyas@analog.com>,
	Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/3] bindings: hwmon: Add adi,adaq4224_temp as compatible
 string
Message-ID: <20231214-coastline-fled-d7788bc2fb97@spud>
References: <20231214143648.175336-1-daniel.matyas@analog.com>
 <20231214143648.175336-2-daniel.matyas@analog.com>
 <d9ccf7ba-42e6-4ec6-9de9-51802e968de9@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="G6GD49EJmszTie2D"
Content-Disposition: inline
In-Reply-To: <d9ccf7ba-42e6-4ec6-9de9-51802e968de9@roeck-us.net>


--G6GD49EJmszTie2D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 07:15:13AM -0800, Guenter Roeck wrote:
> On 12/14/23 06:36, Daniel Matyas wrote:
> > In the device ada4224 the max31827 temperature sensor will be used, so
> > the default values corresponding to adaq4224_temp are the same for
> > max31827.
> >=20
>=20
> I don't know what that device is, but if the max31827 is used it should
> be instantiated as max31827.

An improved commit message would be rather helpful here, as google did
not turn up any information on what this new device is.
Taking the patch on face value, a couple comments below.

> > Signed-off-by: Daniel Matyas <daniel.matyas@analog.com>
> > ---
> >   Documentation/devicetree/bindings/hwmon/adi,max31827.yaml | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/hwmon/adi,max31827.yaml =
b/Documentation/devicetree/bindings/hwmon/adi,max31827.yaml
> > index f60e06ab7d0a..9f3b0839aa46 100644
> > --- a/Documentation/devicetree/bindings/hwmon/adi,max31827.yaml
> > +++ b/Documentation/devicetree/bindings/hwmon/adi,max31827.yaml
> > @@ -20,6 +20,7 @@ properties:
> >         - const: adi,max31827
> >         - items:
> >             - enum:
> > +              - adi,adaq4224_temp

No underscores in the compatible please.

> >                 - adi,max31828
> >                 - adi,max31829
> >             - const: adi,max31827
> > @@ -81,7 +82,9 @@ allOf:
> >         properties:
> >           compatible:
> >             contains:
> > -            const: adi,max31827
> > +            enum:
> > +              - adi,max31827
> > +              - adi,adaq4224_temp

This doesn't do anything afaict, since the binding doesn't allow
"adi,adaq4224_temp" without "adi,max31827".

> >       then:
> >         properties:
>=20

--G6GD49EJmszTie2D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXshpgAKCRB4tDGHoIJi
0i+8AQDLBGQ+HVEs4oHR2QFbfWYmXqmEAx3Uw+1Fm2LmiuGhaQD/b1+AdQl6W2D9
VXZLhAe3bLe3De2JkMLlL8u1XYmRkwc=
=yKeT
-----END PGP SIGNATURE-----

--G6GD49EJmszTie2D--
