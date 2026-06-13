Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67387184;
	Sat, 13 Jun 2026 15:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781363277; cv=none; b=EoQvp56XZoyOg4hlH4QATNxOSABhnYvx+KQJ9cudgLfbp8KAU+Nv9Gsch1uM/0+a6Tp86hBaU2D6GN5OM9EOpbfDAt3gwf7U38pVhgHTDaCEaJ69qqI8jiM7ab7OnYSL9YQd7dNQSLzsk1Al8boKqFuLTCV9PSmg6IDGfuPW+JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781363277; c=relaxed/simple;
	bh=ICbOkjn5IbS6WDSvVKepOdPbb232Qq2/gf+4IWBF6jM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NEHxiNQyXWXkCWOwlcJ95Iot5NlsT69Zc/T4G1lQjE111jkJ2RqDOxLsRp+sGiJqA32gBFpTMQjWrGPFojHubol4/470fgecqyc8nKQfTP+AQhUsKjH0ExTrtko8Y/d5bb+ciNvwABYIidxukl4ihbhfsDgXhJlAP3Z6z59yDSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YtrWVRK7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YtrWVRK7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B48E11F000E9;
	Sat, 13 Jun 2026 15:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781363276;
	bh=AITbY4Tube4FADzz0RDs3sWOQpXOpb2A2jd+2ehSyIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YtrWVRK75S0fvsrKt6+QLnb36ap+Tq1DJbZZxrn3ZVI+7mCerF3z/YBN6DKlIAuVU
	 w/y2H0f6ZhO3i/t4tQ2YIvD999H9iFbOh3aCoVVHGv4sXeXJAXLHiE5qD9zqdBYg8V
	 8E8fApVa3xtt9HIgKJ8KvXmPwrZcUtbBXRHp0pF0NBOOAoFrX2qNQ7vzDsXO+Kzs0x
	 lXxnpWsOD8gO27vDIUlltta2m+9y4W131gS9DkHIFtWJj5o/i1B+HJPO+pmfh03EvY
	 jLKzEnvdnG9GptwUwDLzWVKn42CNYSIHU97KRGJWfZCmeJH5GftjcfKfZN8YCMfaMR
	 EU6JAjM/bvz3g==
Date: Sat, 13 Jun 2026 16:07:51 +0100
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
Message-ID: <20260613-synthetic-synopsis-57f40cb2cf92@spud>
References: <20260611-lm25066-cl-config-v1-0-02e567bf3d91@gmail.com>
 <20260611-lm25066-cl-config-v1-1-02e567bf3d91@gmail.com>
 <20260611-mocha-strive-a7f3265dd3f4@spud>
 <CAGfYmwWPhdpTLGhOdddJ0hSj-H86+XOVGTR9eDkZSVqGRLfJvQ@mail.gmail.com>
 <20260612-lecturer-unclad-d80218119ae5@spud>
 <059f9ce2-39f0-4553-909d-58585d46edd3@roeck-us.net>
 <20260612-sibling-battalion-453d3d239aaa@spud>
 <4875e6b4-0d9f-4920-9efa-883d1fed983f@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WQQ7w2n8+IYsUPvF"
Content-Disposition: inline
In-Reply-To: <4875e6b4-0d9f-4920-9efa-883d1fed983f@roeck-us.net>


--WQQ7w2n8+IYsUPvF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 13, 2026 at 06:05:28AM -0700, Guenter Roeck wrote:
> On 6/12/26 14:13, Conor Dooley wrote:
> > On Fri, Jun 12, 2026 at 10:19:14AM -0700, Guenter Roeck wrote:
> > > On 6/12/26 09:12, Conor Dooley wrote:
> > > > On Fri, Jun 12, 2026 at 05:10:38PM +0800, Potin Lai wrote:
> > > > > On Fri, Jun 12, 2026 at 1:27=E2=80=AFAM Conor Dooley <conor@kerne=
l.org> wrote:
> > > > > >=20
> > > > > > On Thu, Jun 11, 2026 at 05:58:44PM +0800, Potin Lai wrote:
> > > > > > > Add mutually exclusive 'ti,cl-smbus-high' and 'ti,cl-smbus-lo=
w' boolean
> > > > > > > properties to configure the device's Current Limit (CL) behav=
ior using
> > > > > > > SMBus settings instead of physical pins.
> > > > > > >=20
> > > > > > > Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> > > > > > > ---
> > > > > > >    .../devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml  | 20 =
++++++++++++++++++++
> > > > > > >    1 file changed, 20 insertions(+)
> > > > > > >=20
> > > > > > > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti=
,lm25066.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.ya=
ml
> > > > > > > index a20f140dc79a..95ea7c26dec2 100644
> > > > > > > --- a/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm2506=
6.yaml
> > > > > > > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm2506=
6.yaml
> > > > > > > @@ -46,6 +46,26 @@ properties:
> > > > > > >=20
> > > > > > >        additionalProperties: false
> > > > > > >=20
> > > > > > > +  ti,cl-smbus-high:
> > > > > > > +    description: |
> > > > > > > +      Configure the Current Limit (CL) to use the SMBus high=
 setting.
> > > > > > > +    type: boolean
> > > > > > > +
> > > > > > > +  ti,cl-smbus-low:
> > > > > > > +    description: |
> > > > > > > +      Configure the Current Limit (CL) to use the SMBus low =
setting.
> > > > > > > +    type: boolean
> > > > > >=20
> > > > > > What's smbus specific about this? If the pin was connected to a=
 GPIO,
> > > > > > you'd then need to have different properties or use these ones =
with an
> > > > > > inaccurate name.
> > > > > >=20
> > > > >=20
> > > > > The "smbus" in the property name was originally meant to indicate
> > > > > that the setting is configured via the internal register over the=
 SMBus (I2C)
> > > > > interface, rather than physical pins.
> > > >=20
> > > > Right, but if you do it via the physical pins using a gpio, you sti=
ll
> > > > need a way to say what limit is. The status quo only works if the l=
imit
> > > > pin is tied high or low.
> > > >=20
> > >=20
> > > The physical pin is supposed to be connected to ground or left floati=
ng.
> > > It seems unlikely that anyone would ever have the idea of connecting =
it
> > > to a GPIO pin, and doing so would for sure mess up the driver because
> > > its state is only read in the probe function. The configuration here
> >=20
> > Well yeah, "obviously" if someone wanted to use a GPIO the driver would
> > have to change to handle that - but probably not that much since it'd be
> > a static setting that could be done at probe.
> >=20
> > I get that it may be unlikely, but it seems like a reasonable thing that
> > someone might want to do, and renaming the property to not exclude that
> > usecase seems to be "free".
> >=20
>=20
> It is not only unlikely, it would be risky and potentially result in
> undefined behavior. The pin is supposed to be static. It is undefined
> if the hardware evaluates it once after power-up, after "power good"
> was detected (if the specific chip supports it), or continuously.
> Making the pin run-time configurable would be a risky endeavor with
> zero gain since the value can be set by software configuration,
> while at the same time adding complexity to the hardware.

Okay, if you think noone will do it, then I will cede to your more
relevant expertise.

--WQQ7w2n8+IYsUPvF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCai1yRAAKCRB4tDGHoIJi
0uafAQChruwsjjg6BpbcePQcblVtw8qKqTKoQ+bUWASgMnYLqgD9ExNJ8fzw0+yE
M1jk7jmJUPWahgqkZAPzbQFWtxe9Ugk=
=lSJs
-----END PGP SIGNATURE-----

--WQQ7w2n8+IYsUPvF--
