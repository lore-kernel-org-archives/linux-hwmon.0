Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4939A175A7D;
	Thu, 16 Apr 2026 21:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776375066; cv=none; b=ceLxESm6InH0rSM64WnAvzZETRIBkZTYQ0MF7o90ZN/XRNn8v5FvPmuHv3AUaV2tiPzz0DZ28ih6ZDBlsF8V0UJ95qzYIXnA2mPu2kas6pjNS/oZChjNKUOCrdv21B2uGLycLb2E3KoTDhgnNEtLHzRGKWd1q/pnSfIUaJpl274=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776375066; c=relaxed/simple;
	bh=Z7GoRTTVktvFUPIMuYaOTAvGmavvoltTzVfYp4CcrOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=godo0FZo/S1U5mu/VS75fVuSIa2cFji3NLfF9PR6j5+gJIke3sIvkSBJoVKopwfbBRYuf3H+2U3G0xF7vrZo9VEOi6jIr9V+m8zItcIcNPyBjUASMlBO1afIa/s45WExkWg83O1A0ny/9/+GhdG1v4ig9zdB67NGjCeujo7bexQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lZ8NNIkZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZ8NNIkZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3A3AC2BCAF;
	Thu, 16 Apr 2026 21:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776375065;
	bh=Z7GoRTTVktvFUPIMuYaOTAvGmavvoltTzVfYp4CcrOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lZ8NNIkZcgImTSQYQt0Y+2EX3PtpQGg5Y5ksnUAarRSpPVCshMJGPJ3mnTEdHo8Ju
	 UwdiH95v2YbZM4MNHGHPKbi97lNToI39waYb5GlKNSS0UEAfmIUVjx1aagPMH5Q7rn
	 zOsShmgVpBl67zqINwq8BRIdRh0JLqzNQ3wFfJoMvUr9/zeLiVARsixQK9yGiv07dk
	 JVlh5boXs1Unx1HkE07ft3yt3O+B12eKJ7LbHnUxQcD4gDnl6zWXV8meHdnOlVsKmH
	 xdoQUoK2LOSmA3HEhHdSDUY6i/iHfUoKqPeqt4T4Pg7rMwB2tebgUS57Yo/v0OyAYU
	 fqpR72eQ6RmiA==
Date: Thu, 16 Apr 2026 22:31:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: add max20830
Message-ID: <20260416-scoring-secluding-c7a7235b181a@spud>
References: <20260416-dev_max20830-v2-0-2c7d676dc0bd@analog.com>
 <20260416-dev_max20830-v2-1-2c7d676dc0bd@analog.com>
 <20260416-diaphragm-corrode-494560404ed4@spud>
 <84a5154f-1139-425e-94ae-31d7e662cd0e@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f0v2n83I2mzdD3NG"
Content-Disposition: inline
In-Reply-To: <84a5154f-1139-425e-94ae-31d7e662cd0e@roeck-us.net>


--f0v2n83I2mzdD3NG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 11:01:49AM -0700, Guenter Roeck wrote:
> On Thu, Apr 16, 2026 at 04:51:37PM +0100, Conor Dooley wrote:
> > On Thu, Apr 16, 2026 at 03:59:10PM +0800, Alexis Czezar Torreno wrote:
> > > Add device tree documentation for MAX20830 step-down DC-DC switching
> > > regulator with PMBus interface.
> > >=20
> > > Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> > > ---
> > >  .../bindings/hwmon/pmbus/adi,max20830.yaml         | 61 ++++++++++++=
++++++++++
> > >  MAINTAINERS                                        |  7 +++
> > >  2 files changed, 68 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max208=
30.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..8b3ec1ffa0c9460de2122=
f6606ce3dcbcdfbbcc7
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
> > > @@ -0,0 +1,61 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/hwmon/pmbus/adi,max20830.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Analog Devices MAX20830 Step-Down Switching Regulator with PM=
Bus
> > > +
> > > +maintainers:
> > > +  - Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> > > +
> > > +description: |
> > > +  The MAX20830 is a fully integrated step-down DC-DC switching regul=
ator with
> > > +  PMBus interface. It provides 2.7V to 16V input, 0.4V to 5.8V adjus=
table
> > > +  output, and up to 30A output current. It allows monitoring of inpu=
t/output
> > > +  voltage, output current and temperature through the PMBus serial i=
nterface.
> > > +  Datasheet:
> > > +    https://www.analog.com/en/products/max20830.html
> > > +
> > > +allOf:
> > > +  - $ref: /schemas/regulator/regulator.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: adi,max20830
> > > +
> > > +  reg:
> > > +    maxItems: 1
> >=20
> > On the previous version, you got an LLM comment about not having the
> > interrupts property amongst other things.
> > I think the other things got implemented, but I didn't see any reply to
> > the bot about that?
> > I think the answer is that it shouldn't because the pin it referenced
> > doesn't exist, but when looking at the schematic I have to wonder if
>=20
> I had to look this up in the datasheet. A SMBus chip with no alert pin is
> a bit odd, but you are correct.
>=20
> > there should be an interrupts property for dealing with "pgood"?
> >=20
> FWIW, I have never seen that. Normally such pins are used to take devices
> out of reset.

It's an output on this device seemingly. I don't care if the driver
ignores it, but for completeness (and we like completeness with
bindings) I think it should be documented as an interrupt or gpio.

--f0v2n83I2mzdD3NG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeFVFQAKCRB4tDGHoIJi
0l9cAP95IW0T8+cJBejifVq5snVwPmFWG6xu9p7MDFA2sezbXwEAmBJt0bTktCaD
TzQKiqnRjpFHCoY4OlM6K9b0cn4PQwI=
=aOwu
-----END PGP SIGNATURE-----

--f0v2n83I2mzdD3NG--
