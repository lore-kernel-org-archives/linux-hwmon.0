Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7F449CF46;
	Mon, 31 Aug 2026 16:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788193965; cv=none; b=mxjCax65xn9KHiqqB271uJqfVfkvu8AYf+niL6GLzYEENgOrYdp2NpgtGRYh2I8nYByIBgzv7a7YhmNna67bvWib+oB9bxc2EcwANHDaC1Gbqg4ebQJQ2qeAGkchk0ZtejN5GoUJAXh5D17ewhKxKbiAs+5jDfd/BDJ8oxNQ0HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788193965; c=relaxed/simple;
	bh=3SeeWB2J9QJfMtK7ieEMZIHW0SOZB1ghPyE/Zx0ncCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCyDwXXY0NMZudgJ6X05xxnWIPh0n1t/B0nVPzSL4uukRns36vxFm5M5K3AIjMfBmP/pr8N4J0HafaGP1rMx94lDTjAFGGkOCYUb6kV2sQu2plkvjl8ykKNCyDaGE4qXor9P7VguuNZUcI2L4OxNscNXnw36R/wPXjytdnMCWDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d1M8rhwa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d1M8rhwa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99D211F000E9;
	Mon, 31 Aug 2026 16:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788193964;
	bh=4EHPpunVWCfvSsl9XR/vLgJXnGfu3RbcnjxL2uwJevM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d1M8rhwah8JEEByU1jPvUfpA/uRIt207m5rvobtM0FQqYSLkRUbUeBOf5Dr+01pdK
	 xt2J9Y9U0qD9P9XVLUa63yK8j2xKxQwASOWx0QWBE/CBEVscNDa3k6waHOKuQIQLdL
	 XG2pwRcne/Jr0zngV3XX42HHYsF2KDEsGAN5jTc86dIKZKbwBpiIgIqfcCZGCsSiza
	 PzTcdLqY7kiq4zkOl9OiW200hLvMB9OlN4u323NgaSUK/ORzce5JKFyivapQI2N3tj
	 m5XOnMvIgP/nna5eUxsYBtmoCMN+eiu6A15euz24yhFfRNBCDlT9FNF1F9nbORstJj
	 exUg4VtY4+umg==
Date: Mon, 31 Aug 2026 17:32:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: Add starfive,jhb100-fan-tach
Message-ID: <20260831-dominion-data-c8b6f691dd5b@spud>
References: <20260830011941.40199-1-changhuang.liang@starfivetech.com>
 <20260830011941.40199-2-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uatR7M6gSft/ZZlk"
Content-Disposition: inline
In-Reply-To: <20260830011941.40199-2-changhuang.liang@starfivetech.com>

--uatR7M6gSft/ZZlk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 29, 2026 at 06:19:40PM -0700, Changhuang Liang wrote:
> Add compatible "starfive,jhb100-fan-tach" for StarFive JHB100 Fan-Tach
> controller.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../hwmon/starfive,jhb100-fan-tach.yaml       | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/starfive,jhb1=
00-fan-tach.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-=
tach.yaml b/Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tac=
h.yaml
> new file mode 100644
> index 000000000000..1dcd4932768f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tach.ya=
ml
> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/starfive,jhb100-fan-tach.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JHB100 Fan-Tach controller
> +
> +maintainers:
> +  - Changhuang Liang <changhuang.liang@starfivetech.com>
> +
> +description:
> +  The StarFive Fan-Tach controller can support up to 16 fan tach input.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - starfive,jhb100-fan-tach
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^fan@[0-9a-f]+$":
> +    $ref: fan-common.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        description:
> +          PWM channel index. The driver allows two fans to share the same
> +          PWM channel, or each fan to use a dedicated channel.

Doesn't matter what the driver can do, the description should describe
what the hardware supports.
pw-bot: changes-requested

Does this fan-tach controller provide the PWMs?
If so (although Guenter may correct me), I think the fan-tach controller
needs to be.

If you don't do that, I think you're going to run into problems with
having multiple nodes with the same unit address when two fans share a
pwm?

I think what you're supposed to do is drop "reg" and replace it with
"pwms", but once again Guenter may correct me there.
e.g. aspeed,g6-pwm-tach.yaml

Cheers,
Conor.

> +        maximum: 15
> +
> +      tach-ch:
> +        description:
> +          The tachometer channel(s) wired to the fan(s) driven by this P=
WM
> +          channel. Integer values in the range 0-15.
> +        minItems: 1
> +        maxItems: 2
> +        items:
> +          maximum: 15
> +
> +    required:
> +      - reg
> +      - tach-ch
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - resets
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    fan-controller@11be0000 {
> +        compatible =3D "starfive,jhb100-fan-tach";
> +        reg =3D <0x11be0000 0x400>;
> +        interrupts =3D <128>;
> +        clocks =3D <&per2crg 33>;
> +        resets =3D <&per2crg 5>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        fan@0 {
> +            reg =3D <0x0>;
> +            tach-ch =3D /bits/ 8 <0x0 0x8>;
> +            pulses-per-revolution =3D <2>;
> +        };
> +        fan@1 {
> +            reg =3D <0x1>;
> +            tach-ch =3D /bits/ 8 <0x1>;
> +            pulses-per-revolution =3D <2>;
> +        };
> +    };
> --=20
> 2.25.1
>=20

--uatR7M6gSft/ZZlk
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapWsqAAKCRB4tDGHoIJi
0sZSAP9cKHl0zdIlOjfBnMN5epXZo6x8A8vqSqvMKJwzPsUZ+wEAlA0F0f+TnzOa
adsoEcX6fjQuNjiqs3leujt+2M/dUAk=
=orlK
-----END PGP SIGNATURE-----

--uatR7M6gSft/ZZlk--
