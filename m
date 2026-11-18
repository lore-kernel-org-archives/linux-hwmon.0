Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795025006;
	b=iC5FvHeP+Vu0GfrJN5seXNXcWke/hyhUYbiH7idFVA+K3qdTOz4lUo2Ah7lG6JNypsPO
	 YpiAWeYUfLUwhsW4WuLTnEUihJoszSmfAGS2LBKJ6QeXvjha0NGminvoorckIpe++ASXE
	 seK+bp59k5wNKhBCQbyo5XT643ZtVa6gCC4jLA5yaIk5MVk9WZE4k+v22p+yk4OMMXiZh
	 NFnUBq82mUdxjWDEJflISwbSiO9b7n6tyJH4Nztjcb1cDkr5PPsUf55T2i0QMeHtoI0f1
	 HUo95nfgZx/iSSKtHLC0OhZgBrGlh0m5jiwk4qhVfW4pdIOtmf3q4YnxeFgPa+9hpJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025006;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=7wpaQzEaKoLzL3UBag8yDMk/SewVlnrxKqHpOfOClEs=;
	b=iWb88SnqI0ZfXdog4pLK9icRzjLIfO+3SfjRWl6uXdUqAUys2TLMbgMYcTUiesDCHpzJ
	 uZv+CEi970zCQA4ZE41X+iQcg9trAX3kG5vgo/+AubDQtrRn2TqryUEzGIymPK3SO5mYk
	 Ny2c4JBEfK7PSkUZ8Nufk1dz/A7NpSi3jI1PPjIe2VGU6+EvDTUTTENhw34p+ZGawNv1N
	 V1x2yVeoCfxvGhPeTtGewSP1io45vFVycBhnh/JM/MHwEtaVjKwpTJ3AycG7nqmlJmTeC
	 hIfScHYJVMiuOll4Q06yxV2FGkZac1omWQDV5x2bu/h5BIe61k2ef6VP7rZQ5x2tFBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QOxSe2ui;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603FF60A2605;
	Wed, 18 Nov 2026 18:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QOxSe2ui
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73AF31F000C4;
	Wed, 18 Nov 2026 18:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795025006;
	bh=7wpaQzEaKoLzL3UBag8yDMk/SewVlnrxKqHpOfOClEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QOxSe2uihnkcb5fk1DOs0sOet+rnRTkzHYN5tszK503F8vfwA/ZI2biH2aAlWjKTW
	 DTgBKTUXVnaRcpU39Gj9moTbdkuenzLvNBPbKPCvn668bzWUWTV6I0vhPiSg9l3C9k
	 I1D/7yHiWKxiPQikvGlt9UJOJcEr3XCRriFuJPtII9Sjk2/5rVMnPvE3uBXdEU23eq
	 /quWjFOJLqBAoSfzbRmsu9uZReCRR7dTREkELtfzIRw3YlaAZe8jviY6K3kYmO7mco
	 q+V7QBceiT35PlyDoTgtbiGNMVFlTwe04fuEBxrBMSKhVTkBbOPfs4LsiJ/UcTj2Mp
	 IcE2FwIRrueuw==
Date: Wed, 18 Nov 2026 18:03:21 +0000
From: Conor Dooley <conor@kernel.org>
To: lhart.opensource@witekio.com
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Flaviu Nistor <flaviu.nistor@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add TI TPS389006/TPS389008
Message-ID: <20261118-mystify-both-ec4feb95933a@spud>
References: <20261117-lhart-dev-tps38900x-v2-0-e5730523d3ee@witekio.com>
 <20261117-lhart-dev-tps38900x-v2-1-e5730523d3ee@witekio.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lFWzrv9N2quXIhcE"
Content-Disposition: inline
In-Reply-To: <20261117-lhart-dev-tps38900x-v2-1-e5730523d3ee@witekio.com>

--lFWzrv9N2quXIhcE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 03:45:35PM -0800, Luna Hart via B4 Relay wrote:
> From: Luna Hart <lhart.opensource@witekio.com>
>=20
> Add a binding for the TI TPS389006 and TPS389008 I2C voltage
> supervisors and monitors, which provide 6 and 8 voltage inputs
> respectively. Each input may be described by an optional child node,
> containing additional properties including the label and voltage
> monitoring range. Inputs that are not connected can be marked with
> status set to "disabled".
>=20
> Based on an earlier binding by Flaviu Nistor.

Perhaps a co-developed-by for that?

>=20
> Signed-off-by: Luna Hart <lhart.opensource@witekio.com>
> ---
>  .../devicetree/bindings/hwmon/ti,tps389006.yaml    | 114 +++++++++++++++=
++++++
>  1 file changed, 114 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/ti,tps389006.yaml b/=
Documentation/devicetree/bindings/hwmon/ti,tps389006.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..2a26f6623adf06d1df38d5bc3=
683b5d2e06f3c0f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/ti,tps389006.yaml
> @@ -0,0 +1,114 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/ti,tps389006.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI TPS389006/TPS389008 voltage supervisor and monitor
> +
> +maintainers:
> +  - Luna Hart <lhart.opensource@witekio.com>
> +
> +description: |
> +  Voltage supervisor and monitor from TI (TPS389006, TPS389008) on I2C b=
us.
> +
> +  Datasheets:
> +    https://www.ti.com/lit/ds/symlink/tps389006.pdf
> +    https://www.ti.com/lit/ds/symlink/tps389006-q1.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,tps389006
> +      - ti,tps389008
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +    description: NIRQ fault interrupt output (active low).
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0

Missing a vdd-supply here I think?
pw-bot: changes-requested

> +
> +patternProperties:
> +  "^channel@[0-7]$":
> +    description:
> +      A monitored input. Inputs that are not connected can be marked with
> +      status set to "disabled".
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      reg:
> +        description: Input index, 0 for MON1 up to 7 for MON8.
> +        enum: [ 0, 1, 2, 3, 4, 5, 6, 7 ]

Or else, min: 0 and max: 7.

> +
> +      label:
> +        description: Name of the input source.
> +
> +      ti,vrange-multiplier:
> +        description:
> +          Voltage monitoring range of the input. 1 selects 0.2V to 1.475=
V in
> +          5mV steps, 4 selects 0.8V to 5.5V in 20mV steps. If absent, the
> +          range programmed in the device is used.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [ 1, 4 ]

Would this be more naturally expressed as "ti,vrange-steps-microvolt"
and be "5000" and "20000"? microvolt because that's the standard
voltage suffix we have, and in the actual range in case another device
in the future wishes to use this binding but has different scaling.

Cheers,
Conor.

> +
> +    required:
> +      - reg
> +
> +required:
> +  - compatible
> +  - reg

Probably the supply is also required.

> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: ti,tps389006
> +    then:
> +      patternProperties:
> +        "^channel@[67]$": false
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        voltage-monitor@30 {
> +            compatible =3D "ti,tps389008";
> +            reg =3D <0x30>;
> +            interrupt-parent =3D <&gpio1>;
> +            interrupts =3D <12 IRQ_TYPE_LEVEL_LOW>;
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            channel@0 {
> +                reg =3D <0x0>;
> +                label =3D "input0";
> +                ti,vrange-multiplier =3D <4>;
> +            };
> +
> +            channel@1 {
> +                reg =3D <0x1>;
> +                label =3D "input1";
> +                ti,vrange-multiplier =3D <1>;
> +            };
> +
> +            channel@7 {
> +                reg =3D <0x7>;
> +
> +                status =3D "disabled";
> +            };
> +        };
> +    };
>=20
> --=20
> 2.47.3
>=20
>=20

--lFWzrv9N2quXIhcE
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCav3oaQAKCRB4tDGHoIJi
0ts9AP92eXi1qsykVWIf39CYl4t7e7MdSoD0CWtfprP16aJAUAD+K2tQcKG5LEKc
Rg6QULAe1kWwL9/edSQUg7jmclFgzwk=
=oHfn
-----END PGP SIGNATURE-----

--lFWzrv9N2quXIhcE--
