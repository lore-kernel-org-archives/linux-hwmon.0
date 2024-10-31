Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F7B19CC2E;
	Thu, 31 Oct 2024 12:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730379306; cv=none; b=VrPU9xDuKJng6wXbECPfrCl7WEwBQ6EVhpT4P/3fz2qVA2xxX0Ji3MRsXxlTd+EkR8ycjbTAKDbjzirxBWlKyuk6dpIKmTpc7RArlwyOn9hxNmngOgM+BuJ/yxcSNa8yntzcNlTnHtNk4z+StgZZxHwlifjCk0oNFMnw6AVchHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730379306; c=relaxed/simple;
	bh=GPlv4S+DuUI/4xSmvucFd92+4NRSOm7WZZhkjapC230=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nHgwfwloGz+HpSN0E2DN391Q3IUnAzwCWsb7A52jSeIKvA8vagDXP3SagZfBu5FwL2f1yh0zj1UiuMs4QcEOSUBFpTngH/+fkkNg8DSPEBvYjVi/b4M31LYItuR8xWVT46rHRP1buMXHtCrbGosM8Oqrv444dVPo6GqsxnM+z0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hMYYsU7u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hMYYsU7u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA223C4FE00;
	Thu, 31 Oct 2024 12:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730379306;
	bh=GPlv4S+DuUI/4xSmvucFd92+4NRSOm7WZZhkjapC230=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hMYYsU7uCcUBq9dr1BWK6m4iNNmBR1LY0l4hO45E3uM7RELtX0XBbA31mRXVGNEGs
	 XkV2USCyoUIpxQ7JPJwKfGE2qc52P7f0q+y5tOgHKKJWYO8CcAm0YCNPtrWc9ni2lF
	 xDTZ7ztxlBkpvL/j9y3hfBS/tNw3fBwaE9n5PnPAQ+vaqEpH8OAHJFUTr+kp1Kyzl+
	 u8wNDOGIMBhi5Akm2h+aH5CryzhHZOhqVl0ARB2212ES54U8yBAuJhUtf7UGjAvs4m
	 7B4w4v3xBaaueFvyWuUvYP8o61qAm3y66OwtWvaBnfILD7MCY+T70kGoVue3O0s2mP
	 uYSCDUTk79/AA==
Date: Thu, 31 Oct 2024 12:55:01 +0000
From: Conor Dooley <conor@kernel.org>
To: Grant Peltier <grantpeltier93@gmail.com>
Cc: robh@kernel.org, linux@roeck-us.net, geert+renesas@glider.be,
	magnus.damm@gmail.com, grant.peltier.jg@renesas.com,
	brandon.howell.jg@renesas.com, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	jic23@kernel.org, Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v3 2/2] dt-bindings: hwmon: isl68137: add bindings to
 support voltage dividers
Message-ID: <20241031-chalice-drainpipe-d49b0c5f9ef0@spud>
References: <cover.1729715599.git.grantpeltier93@gmail.com>
 <2cc99616ff3dd9bcecb1309cd4d103d70aea862b.1729715599.git.grantpeltier93@gmail.com>
 <20241024-corporate-faceted-811e8e5a8c58@spud>
 <ZxqSqcN11fTambT4@raspberrypi>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DRCKVA0AUzND/Zu8"
Content-Disposition: inline
In-Reply-To: <ZxqSqcN11fTambT4@raspberrypi>


--DRCKVA0AUzND/Zu8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 01:32:09PM -0500, Grant Peltier wrote:
> On Thu, Oct 24, 2024 at 06:01:11PM +0100, Conor Dooley wrote:
> > On Wed, Oct 23, 2024 at 03:53:51PM -0500, Grant Peltier wrote:
> > > + [...]
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - renesas,isl68220
> > > +      - renesas,isl68221
> > > +      - renesas,isl68222
> > > +      - renesas,isl68223
> > > +      - renesas,isl68224
> > > +      - renesas,isl68225
> > > +      - renesas,isl68226
> > > +      - renesas,isl68227
> > > +      - renesas,isl68229
> > > +      - renesas,isl68233
> > > +      - renesas,isl68239
> > > +      - renesas,isl69222
> > > +      - renesas,isl69223
> > > +      - renesas,isl69224
> > > +      - renesas,isl69225
> > > +      - renesas,isl69227
> > > +      - renesas,isl69228
> > > +      - renesas,isl69234
> > > +      - renesas,isl69236
> > > +      - renesas,isl69239
> > > +      - renesas,isl69242
> > > +      - renesas,isl69243
> > > +      - renesas,isl69247
> > > +      - renesas,isl69248
> > > +      - renesas,isl69254
> > > +      - renesas,isl69255
> > > +      - renesas,isl69256
> > > +      - renesas,isl69259
> > > +      - renesas,isl69260
> > > +      - renesas,isl69268
> > > +      - renesas,isl69269
> > > +      - renesas,isl69298
> > > +      - renesas,raa228000
> > > +      - renesas,raa228004
> > > +      - renesas,raa228006
> > > +      - renesas,raa228228
> > > +      - renesas,raa229001
> > > +      - renesas,raa229004
> >=20
> > Damn, that;s a list and a half, innit! Looking briefly at the driver
> > change, the match data implies that quite a few of these actually would
> > be suitable for fallback compatibles.
>=20
> Yes, there are quite a few part numbers (and likely to be more in the
> future). My intention was to make the driver more user friendly since the
> variants listed in the driver do not map to something in any of the
> datasheets. So using those instead would require users to inspect the
> source of the driver instead of simply referencing their part number(s).

I don't understand. How would a fallback materially change anything in
that regard? You still put the compatible corresponding to the device
you have in your dts. A fallback means having multiple compatible
strings in the property, not a single one corresponding to another
device.

> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  '#address-cells':
> > > +    const: 1
> > > +
> > > +  '#size-cells':
> > > +    const: 0
> > > +
> > > +patternProperties:
> > > +  "^channel@([0-3])$":
> > > +    type: object
> > > +    description:
> > > +      Container for properties specific to a particular channel (rai=
l).
> > > +
> > > +    properties:
> > > +      reg:
> > > +        description: The channel (rail) index.
> > > +        items:
> > > +          minimum: 0
> > > +          maximum: 3
> > > +
> > > +      renesas,vout-voltage-divider:
> >=20
> > There's already a binding for voltage dividers: voltage-divider.yaml
> > That said, I have no idea how that would work with an extant driver for
> > the hardware like we have here. I'd imagine it would really have to be
> > used with iio-hwmon? + Peter and Jonathan, since I don't know how the
> > driver side of using the voltage divider works.
>=20
> In his recent revier, Guenter requested using a standard voltage divider
> schema as well. I see there is an implementation in maxim,maxim20730.yaml
> but that differs from the one in voltage-divider.yaml. Should I opt to
> match maxim,maxim20730.yaml?

I would rather the standard binding was used, but it would probably
involve having to hook up iio-rescale to hwmon? I don't know enough
about that, which is why I Cced Peter and Jonathan.

> > > +examples:
> > > +  - |
> > > +    i2c {
> > > +      #address-cells =3D <1>;
> > > +      #size-cells =3D <0>;
> > > +
> > > +      isl68239@60 {
> > > +        compatible =3D "renesas,isl68239";
> > > +        reg =3D <0x60>;
> > > +      };
> > > +    };
> >=20
> > Without any channels, what does this actually do? If you've got no
> > channels you cannot measure anything making this example invalid?
>=20
> The channel structures are optional to allow users to arbitrarily define
> voltage dividers for any particular rail. Omitting the channel definitions
> still allow the device to be instantiated and probed as an I2C device
> along with all related hwmon PMBus telemetry dictated by the part variant.

I dunno, either the channels are hooked up to something or they are not.
If they are, the channels should be populated in the devicetree.

Cheers,
Conor.

--DRCKVA0AUzND/Zu8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyN+JQAKCRB4tDGHoIJi
0on0AQDBZsF7avHEorAfrgsVeB5TjV/Vrbg91EUg7hgYV/HMIwEAqxpcskKUxXdi
fbWd2rKSQ4yLYkRQm59qmLH2Fhz7CQQ=
=DmG0
-----END PGP SIGNATURE-----

--DRCKVA0AUzND/Zu8--
