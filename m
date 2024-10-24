Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFC919DF7A;
	Thu, 24 Oct 2024 17:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729789276; cv=none; b=qjCGhMueeB2XhcH/A3FgsA8YsNm8h9IX/iBL1GmBNK6YbMfl/iZyQw2vHbfACt/ng0f593vgyoMqBvwyJV90rxpp2XfG7LI6kjqQvc5OXwpqjxyg1QF60W2ZXFYF7iu0qvjZbp/6IFl1CvQP39fWmln8FYmT3xTJ+0JhQisJ1zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729789276; c=relaxed/simple;
	bh=2WZoOxFV07GhqbVsinQIcZWsKviy23da5sP+xQg+SiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n/DNwMuOVupsuSPpem0glhR3Z8NorpvnTy6cOFj0ibiPrwWIX2BIXC19+9FOMpFpXVra6lhoYwZ1DGAyHnsKnih4gZnOPx38JCUMFw6/kpeavJVF18yuBFmdOiqy7DBu1ZOjuMq3U6wbvHT06lZO2SNRoK6G04UbDuYloRVLc7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bT1vf/qd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bT1vf/qd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5187CC4CEC7;
	Thu, 24 Oct 2024 17:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729789275;
	bh=2WZoOxFV07GhqbVsinQIcZWsKviy23da5sP+xQg+SiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bT1vf/qdITM9d3RPJbXEBwCchbxunm+9A9YuXTKBx/kPQ4PREbFMSTs2cynD5SOyE
	 OruOW+DN0vYXCwQIW3yj+1y/KftGSszqLpzeNT0mdeQqX2d1zvlx17o/i9YfFYs5WF
	 dr2lnRHBtxn1I+hJ0txaAN5j7E/yO/p41kjbkCoWgHqp3FYiLHSkFzFYVzryVWObl/
	 ytfHr11DDqQMuVRtivfv7C6BLHZD3/eGRrbDp9vFxiUaGvCnWq+gr1VXhBtZPsloOb
	 C0ikSiXN6uVumQpYehg3Xkw9mrnQCD8V9lwGMn49kUTWLxW4BAS1SuhJCXxtit5Iqx
	 SdQQCLppWPZDg==
Date: Thu, 24 Oct 2024 18:01:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Grant Peltier <grantpeltier93@gmail.com>
Cc: robh@kernel.org, linux@roeck-us.net, geert+renesas@glider.be,
	magnus.damm@gmail.com, grant.peltier.jg@renesas.com,
	brandon.howell.jg@renesas.com, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	jic23@kernel.org, Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v3 2/2] dt-bindings: hwmon: isl68137: add bindings to
 support voltage dividers
Message-ID: <20241024-corporate-faceted-811e8e5a8c58@spud>
References: <cover.1729715599.git.grantpeltier93@gmail.com>
 <2cc99616ff3dd9bcecb1309cd4d103d70aea862b.1729715599.git.grantpeltier93@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NJwqiCkcv/UgtFdL"
Content-Disposition: inline
In-Reply-To: <2cc99616ff3dd9bcecb1309cd4d103d70aea862b.1729715599.git.grantpeltier93@gmail.com>


--NJwqiCkcv/UgtFdL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 03:53:51PM -0500, Grant Peltier wrote:
> Add devicetree bindings to support declaring optional voltage dividers to
> the rail outputs of supported digital multiphase regulators. Some
> applications require Vout to exceed the voltage range that the Vsense pin
> can detect. This binding definition allows users to define the
> characteristics of a voltage divider placed between Vout and the Vsense
> pin for any rail powered by the device.
>=20
> Signed-off-by: Grant Peltier <grantpeltier93@gmail.com>
> ---
>  .../hwmon/pmbus/renesas,isl68137.yaml         | 131 ++++++++++++++++++
>  1 file changed, 131 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/renesas=
,isl68137.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl681=
37.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.ya=
ml
> new file mode 100644
> index 000000000000..af10c55d547f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml
> @@ -0,0 +1,131 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/hwmon/pmbus/renesas,isl68137.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas Digital Multiphase Voltage Regulators with PMBus
> +
> +maintainers:
> +  - Grant Peltier <grant.peltier.jg@renesas.com>
> +
> +description: |
> +  Renesas digital multiphase voltage regulators with PMBus.
> +  https://www.renesas.com/en/products/power-management/multiphase-power/=
multiphase-dcdc-switching-controllers
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,isl68220
> +      - renesas,isl68221
> +      - renesas,isl68222
> +      - renesas,isl68223
> +      - renesas,isl68224
> +      - renesas,isl68225
> +      - renesas,isl68226
> +      - renesas,isl68227
> +      - renesas,isl68229
> +      - renesas,isl68233
> +      - renesas,isl68239
> +      - renesas,isl69222
> +      - renesas,isl69223
> +      - renesas,isl69224
> +      - renesas,isl69225
> +      - renesas,isl69227
> +      - renesas,isl69228
> +      - renesas,isl69234
> +      - renesas,isl69236
> +      - renesas,isl69239
> +      - renesas,isl69242
> +      - renesas,isl69243
> +      - renesas,isl69247
> +      - renesas,isl69248
> +      - renesas,isl69254
> +      - renesas,isl69255
> +      - renesas,isl69256
> +      - renesas,isl69259
> +      - renesas,isl69260
> +      - renesas,isl69268
> +      - renesas,isl69269
> +      - renesas,isl69298
> +      - renesas,raa228000
> +      - renesas,raa228004
> +      - renesas,raa228006
> +      - renesas,raa228228
> +      - renesas,raa229001
> +      - renesas,raa229004

Damn, that;s a list and a half, innit! Looking briefly at the driver
change, the match data implies that quite a few of these actually would
be suitable for fallback compatibles.

> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  "^channel@([0-3])$":
> +    type: object
> +    description:
> +      Container for properties specific to a particular channel (rail).
> +
> +    properties:
> +      reg:
> +        description: The channel (rail) index.
> +        items:
> +          minimum: 0
> +          maximum: 3
> +
> +      renesas,vout-voltage-divider:

There's already a binding for voltage dividers: voltage-divider.yaml
That said, I have no idea how that would work with an extant driver for
the hardware like we have here. I'd imagine it would really have to be
used with iio-hwmon? + Peter and Jonathan, since I don't know how the
driver side of using the voltage divider works.

> +        description:
> +          Resistances of a voltage divider placed between Vout and the v=
oltage
> +          sense pin for the given channel (rail). It has two numbers
> +          representing the resistances of the voltage divider provided as
> +          <R1 R2> which yields an adjusted Vout as
> +          Vout_adj =3D Vout * (R1 + R2) / R2 given the original Vout as =
reported
> +          by the Vsense pin.
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        minItems: 2
> +        maxItems: 2
> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      isl68239@60 {
> +        compatible =3D "renesas,isl68239";
> +        reg =3D <0x60>;
> +      };
> +    };

Without any channels, what does this actually do? If you've got no
channels you cannot measure anything making this example invalid?

Thanks,
Conor.

> +  - |
> +    i2c {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      isl68239@60 {
> +        compatible =3D "renesas,isl68239";
> +        reg =3D <0x60>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        channel@0 {
> +          reg =3D <0>;
> +          renesas,vout-voltage-divider =3D <1000 1000>;  // Reported Vou=
t/Pout would be scaled by 2
> +        };
> +      };
> +    };
> --=20
> 2.39.5
>=20
>=20

--NJwqiCkcv/UgtFdL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxp9VwAKCRB4tDGHoIJi
0vHuAQDlsgMHZw3XJVlp7aJncbubXIxyp/w5fvjwYOxOo12UpwD/XctC5cLXeq+b
xmxKq0l7ImD6VIWua/BnLTFiNSyxSwY=
=FxOO
-----END PGP SIGNATURE-----

--NJwqiCkcv/UgtFdL--
