Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3033563E7;
	Fri, 30 Jan 2026 17:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769792688; cv=none; b=YRkqEDd1jjXgMpd+4qrOFzFtPmp50z9qLM3GY5n7Yh2cYjc3A8PvdpEqTfnX4lRL2RbvQ/gCWNMHnTurL086o5BEwXLiHaKeOj4pWEoTAYamZ5k+eEy0JBZ3ECkXRkyjcnQ9PkmyNzwdxg6JEUaGx0san+Y29+5EXv/RrYK48Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769792688; c=relaxed/simple;
	bh=Aokumbn4pYY+yO1AHJkg6UzYFc3KfvSIeFM3/ulG6Lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V+Y+7rhURXX/tFTF0bQiGz/SiKQYvfxw86rYS8FFSOzLV8qVlb2fUt3hMHG5FgB4AiTD9s54yhrYHMubBcGSHZY4gf25FLuQzz0yzGd/hI0cqaqwQadDc8YBcZd6vI6ZS1XyJUwwWZ8GCTgZfbSNLLzgpVbxtRW77igOf5Xhh7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WMkDZ4J2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WMkDZ4J2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD834C4CEF7;
	Fri, 30 Jan 2026 17:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769792687;
	bh=Aokumbn4pYY+yO1AHJkg6UzYFc3KfvSIeFM3/ulG6Lk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WMkDZ4J2HLOjRLM8QLA6JSWVjY7CyjMpv+0UoR1aHgdBgeI+JUAYCxdeEZz2oWmhx
	 tjaOW/eFXq+prCI/35BDgS/8WTFYU9ivIbb/9+8XYlk4XC5R5gW06o9RdI35p4GOWa
	 bvvcClCyE99Uroz1a1tppdRNFCUuBvCK/1xYtrEXsEt0seQU9fumJoq2zsxhcDWn1C
	 MNF8G9j/v/7C0526SUHVoWIibMBLXcvzJkI7IPFhFUMZtt+nBgVqnQ6gG8r5jmkV6x
	 JoHmzSfgBBahAxim8QabBKNuuGNIAtuxWNbgimp0j8HHDXYvaj4+H4+rd+kkN3hMDT
	 6rTaHTvcakfTA==
Date: Fri, 30 Jan 2026 17:04:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Huan He <hehuan1@eswincomputing.com>
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, p.zabel@pengutronix.de,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com,
	luyulin@eswincomputing.com
Subject: Re: Re: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add Eswin EIC7700 PVT
 sensor
Message-ID: <20260130-variety-unseeing-1abc6a941405@spud>
References: <20260128101400.859-1-hehuan1@eswincomputing.com>
 <20260128101636.914-1-hehuan1@eswincomputing.com>
 <20260128-amperage-handstand-36fa4b3ec447@spud>
 <372016a8.2e10.19c07b74792.Coremail.hehuan1@eswincomputing.com>
 <20260129-unpainted-educated-3017ed90c817@spud>
 <1a01417e.2e9c.19c0ca12dc5.Coremail.hehuan1@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ltszGMIB7Xi46LRn"
Content-Disposition: inline
In-Reply-To: <1a01417e.2e9c.19c0ca12dc5.Coremail.hehuan1@eswincomputing.com>


--ltszGMIB7Xi46LRn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 10:00:15AM +0800, Huan He wrote:
> > > > >=20
> > > > > Add device tree binding documentation for ESWIN EIC7700 Process, =
Voltage
> > > > > and Temperature sensor.
> > > > >=20
> > > > > The EIC7700 SoC integrates two PVT instances for monitoring SoC a=
nd DDR
> > > > > power domains respectively.
> > > > >=20
> > > > > Signed-off-by: Yulin Lu <luyulin@eswincomputing.com>
> > > > > Signed-off-by: Huan He <hehuan1@eswincomputing.com>
> > > > > ---
> > > > >  .../bindings/hwmon/eswin,eic7700-pvt.yaml     | 70 +++++++++++++=
++++++
> > > > >  1 file changed, 70 insertions(+)
> > > > >  create mode 100644 Documentation/devicetree/bindings/hwmon/eswin=
,eic7700-pvt.yaml
> > > > >=20
> > > > > diff --git a/Documentation/devicetree/bindings/hwmon/eswin,eic770=
0-pvt.yaml b/Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..f4ba228924fe
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.y=
aml
> > > > > @@ -0,0 +1,70 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/hwmon/eswin,eic7700-pvt.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: ESWIN EIC7700 PVT Sensor
> > > > > +
> > > > > +maintainers:
> > > > > +  - Yulin Lu <luyulin@eswincomputing.com>
> > > > > +  - Huan He <hehuan1@eswincomputing.com>
> > > > > +
> > > > > +description:
> > > > > +  ESWIN EIC7700 SoC integrates embedded process, voltage and tem=
perature
> > > > > +  sensors to monitor the internal SoC environment. The system in=
cludes two
> > > > > +  PVT sensor instances. The PVT0 monitors the main SoC power dom=
ain. The
> > > > > +  PVT1 sensor monitors the DDR core power domain.
> > > > > +
> > > > > +allOf:
> > > > > +  - $ref: /schemas/hwmon/hwmon-common.yaml#
> > > >=20
> > > > FYI, including this is kinda pointless because you have the label
> > > > property defined below and your "additionalProperties: false" blocks
> > > > shunt-resistor-micro-ohms from being used.
> > >=20
> > > I plan to keep the $ref: /schemas/hwmon/hwmon-common.yaml in use, cha=
nge
> > > the original additionalProperties: false to unevaluatedProperties: fa=
lse,
> > > and remove the label definition from our schema since it is already
> > > provided by hwmon-common.yaml. Could you please confirm if this
> > > modification conforms to the community standards?
> >=20
> > That's fine. Does the shunt resistor property apply on your platform?
>=20
> The shunt-resistor-micro-ohms property does not apply to our platform. We
> only use the label property from hwmon-common.yaml.

You could just remove
  label:
    description:
      Human readable identifier used to distinguish between different PVT
      instances. Typically "pvt0" for SoC PVT sensor and "pvt1" for DDR
      core PVT sensor.

and do
  label: true

or leave it as-is.

I don't mind.


--ltszGMIB7Xi46LRn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXzkpwAKCRB4tDGHoIJi
0k2bAQD+Ri6xmsnw8mkuYLWgr9qD9hPCKnjnJf0DwQ9PDviU/AEAnW/rxarr2j1h
zNqOVLU5SybFlbpAipgp63M9Xk0ccA0=
=4IrT
-----END PGP SIGNATURE-----

--ltszGMIB7Xi46LRn--
