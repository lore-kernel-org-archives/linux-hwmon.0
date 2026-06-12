Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07DE37647E;
	Fri, 12 Jun 2026 21:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781298841; cv=none; b=rUdiOeEkn8RPCe52mozpG5CpDU1TJmstC/QG77oCEMhJxVe1WqJvm3QQ2WUEH7SNcZzYa730P6lV2c1qNqpKge/Tf5jOLXE4qDMmw27uLXNxrrfEX5Q+9ov8y4Z5mxeFdejS0HAIJLhaixpyunt0FzTrrKmzSSh0W1LN7w8Dywc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781298841; c=relaxed/simple;
	bh=X8/mzh+inunp+gG1BvKDbZBQ7Nsa24AJ7mSimiY5CLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ld4Se586mcFBO2vygEjHpZWbrukBwtqiVnaSIbQ5m1SdoyuNER/CblZKlltUHVW5JPM3UXrHo0KEt1bdZ63JkHkmhUmIHisTluEuWRnHNu4eLfxH1WBAKAM10oPNWt6wtA1SatVD5vo4NKFIxRmsvO+f/zP2XcNRrKWfkw5xf30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PSLI2Q3O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PSLI2Q3O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BFDC1F000E9;
	Fri, 12 Jun 2026 21:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781298839;
	bh=GVaKUBpztZCZV5GTCEwQbwwfhQ1Fy0JgfjwmlCFG+Y4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PSLI2Q3OE7J9j41eGrFA9z5xL2BsJSw24C/505d08fiGfHnNin0/HZIU33Pcy8JZK
	 rcHnw59ylwmo76Z7/gRaZ72FNxQgda8svyCynrAvjot1kWFjKv7mF2wYZXVgDEC9bP
	 flz87xCMdpkZjrqZuGAhsOGaeZu7YRG9fkSN/E+AaMnQEICJfjjz6JUXbaezMJ+nSd
	 s1eaTpUV2gpcTWif706CVO6u+5sUeFyiwvytYU3yk/O7ezbOOtiIUsog7sv/nD/5SI
	 mecLptR2+4grUJ4fsvK0ZqnMf5phMNJ9O6HFb1fAOAIK8dXS2HVTDZpGVFmhT93aGQ
	 3GEnoWk7I8djw==
Date: Fri, 12 Jun 2026 22:13:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Potin Lai <potin.lai.pt@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Zev Weiss <zev@bewilderbeest.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Cosmo Chou <cosmo.chou@quantatw.com>,
	Mike Hsieh <Mike_Hsieh@quantatw.com>,
	Potin Lai <potin.lai@qunatatw.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: ti,lm25066: add current
 limit properties
Message-ID: <20260612-sibling-battalion-453d3d239aaa@spud>
References: <20260611-lm25066-cl-config-v1-0-02e567bf3d91@gmail.com>
 <20260611-lm25066-cl-config-v1-1-02e567bf3d91@gmail.com>
 <20260611-mocha-strive-a7f3265dd3f4@spud>
 <CAGfYmwWPhdpTLGhOdddJ0hSj-H86+XOVGTR9eDkZSVqGRLfJvQ@mail.gmail.com>
 <20260612-lecturer-unclad-d80218119ae5@spud>
 <059f9ce2-39f0-4553-909d-58585d46edd3@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QGjV0SrnjzKctOUC"
Content-Disposition: inline
In-Reply-To: <059f9ce2-39f0-4553-909d-58585d46edd3@roeck-us.net>


--QGjV0SrnjzKctOUC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 10:19:14AM -0700, Guenter Roeck wrote:
> On 6/12/26 09:12, Conor Dooley wrote:
> > On Fri, Jun 12, 2026 at 05:10:38PM +0800, Potin Lai wrote:
> > > On Fri, Jun 12, 2026 at 1:27=E2=80=AFAM Conor Dooley <conor@kernel.or=
g> wrote:
> > > >=20
> > > > On Thu, Jun 11, 2026 at 05:58:44PM +0800, Potin Lai wrote:
> > > > > Add mutually exclusive 'ti,cl-smbus-high' and 'ti,cl-smbus-low' b=
oolean
> > > > > properties to configure the device's Current Limit (CL) behavior =
using
> > > > > SMBus settings instead of physical pins.
> > > > >=20
> > > > > Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> > > > > ---
> > > > >   .../devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml  | 20 +++++=
+++++++++++++++
> > > > >   1 file changed, 20 insertions(+)
> > > > >=20
> > > > > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm2=
5066.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
> > > > > index a20f140dc79a..95ea7c26dec2 100644
> > > > > --- a/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.ya=
ml
> > > > > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.ya=
ml
> > > > > @@ -46,6 +46,26 @@ properties:
> > > > >=20
> > > > >       additionalProperties: false
> > > > >=20
> > > > > +  ti,cl-smbus-high:
> > > > > +    description: |
> > > > > +      Configure the Current Limit (CL) to use the SMBus high set=
ting.
> > > > > +    type: boolean
> > > > > +
> > > > > +  ti,cl-smbus-low:
> > > > > +    description: |
> > > > > +      Configure the Current Limit (CL) to use the SMBus low sett=
ing.
> > > > > +    type: boolean
> > > >=20
> > > > What's smbus specific about this? If the pin was connected to a GPI=
O,
> > > > you'd then need to have different properties or use these ones with=
 an
> > > > inaccurate name.
> > > >=20
> > >=20
> > > The "smbus" in the property name was originally meant to indicate
> > > that the setting is configured via the internal register over the SMB=
us (I2C)
> > > interface, rather than physical pins.
> >=20
> > Right, but if you do it via the physical pins using a gpio, you still
> > need a way to say what limit is. The status quo only works if the limit
> > pin is tied high or low.
> >=20
>=20
> The physical pin is supposed to be connected to ground or left floating.
> It seems unlikely that anyone would ever have the idea of connecting it
> to a GPIO pin, and doing so would for sure mess up the driver because
> its state is only read in the probe function. The configuration here

Well yeah, "obviously" if someone wanted to use a GPIO the driver would
have to change to handle that - but probably not that much since it'd be
a static setting that could be done at probe.

I get that it may be unlikely, but it seems like a reasonable thing that
someone might want to do, and renaming the property to not exclude that
usecase seems to be "free".

> is for setting the limit range (scale) with a configuration register
> to override the configuration obtained from the external pin.

> Either case, even _if_ the CL pin is connected to a GPIO pin, the status
> of that pin would be read from the configuration register. A devicetree

This isn't true, I don't think, unless you're using GPIO hogs?
The GPIO state when linux comes up could be the reset value of the
controller, rather than the correct configuration. You'd need a way to
tell the driver what way to drive it.

> property is not needed for that. The properties are to _override_ the pin
> configuration, not to reflect it.

TL;DR, I think the removal of smbus from the property name (I'm not
asking for it to be taken out of the description) is reasonable.


--QGjV0SrnjzKctOUC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaix2kgAKCRB4tDGHoIJi
0p9+AP9b0/VfVteb08FG4efUqinCeQOfdUFTmfnJpX8I+CbavwD7BhsGFwBEXjDC
syh17asFm+UNGUt1pnjHiBdOp6Vu5Qk=
=kh2Q
-----END PGP SIGNATURE-----

--QGjV0SrnjzKctOUC--
