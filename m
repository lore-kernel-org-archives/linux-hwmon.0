Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067714AC17D;
	Wed, 23 Sep 2026 16:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181464; cv=none; b=JBv7FAS82xq3ER44KMIFAVmd0tqOuKRoMuE08K3LKA7dHKfL4LOInoFmqbJ75muboG6DcN9NeurxgNdAssN5FRQ9AYI9Xbq93NeHcDKUSRueC0WkFYA0nzVIj+nzx/r1sCjbyvGNAAfa+iDdgqrFCgr9REhEN2q26KhNoBA8RKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181464; c=relaxed/simple;
	bh=DfX58RjKbY3+QWH4JypoUVAjAvCmIzBd8+qdQIqUedI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dt8yw6GOGSZj0n8yuwaBOzHSmP+Vh9MWSXOOSeMlkEVrTQw0505S2NBhBT1mI0PlC2WG7l6iU2btRtJwF0i1S3iH/a6pg1so6YGhQMIbkvznHw2bkYF1x5uUbmY7OOGEdukzIw1yj7Y8EVT17jgQmSSHIWoVKKvuSV04AiKX0+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nwCZcYKT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nwCZcYKT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66C361F00893;
	Wed, 23 Sep 2026 16:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790181453;
	bh=TECMxX4kgDyzPpjvbd6cL8RihEt1rmrbBVZxTQOHxdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nwCZcYKT8Kro1GD8l8rFRT0HjmZrw6cmKJXXRws8Wm2XZ8rsOhDxvb6lNO+X/QHQy
	 tLgCO63wJ5+STY8g2GHPHt6SW/E0tkkpLWOYhe55A3nRhqfYErwsoo5P0EpUP2XsgE
	 j8EUE75MdR8Hj6BivjseyesRwtJHQLWaQK/Gq2PdkuIhoyYrPNSVfH3Au8/F0Vb3vz
	 fiBqyyaz7e0CssTUSPu9xtmFpHXuvVjOOswor5dxDOJW6Xz2ZMFUb9F/3WMAmsE3P5
	 Kl1wYhiPnc7+vmwDHVYw4gf+W5IJi3cRMHuE29Y8JhzaYGDvHB+upTqqkK41yFaDbU
	 njSENt1RP4bDA==
Date: Wed, 23 Sep 2026 17:37:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: hwmon: Add starfive,jhb100-pwm-fan
Message-ID: <20260923-feline-tattle-ecc37a0a9c56@spud>
References: <20260923130624.239499-1-changhuang.liang@starfivetech.com>
 <20260923130624.239499-2-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3XsPMAk746vFPwZe"
Content-Disposition: inline
In-Reply-To: <20260923130624.239499-2-changhuang.liang@starfivetech.com>

--3XsPMAk746vFPwZe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 06:06:23AM -0700, Changhuang Liang wrote:
> Add a binding for the StarFive JHB100 PWM fan controller. The controller
> has a hardware tachometer block with 16 tachometer inputs, while fan
> speed is controlled through 8 PWM channels supplied by an external PWM
> controller.
>=20
> One PWM channel can drive up to two fans, so each fan-N child node
> references one PWM channel and lists the tachometer inputs wired to the
> fans it drives.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> ---
>  .../hwmon/starfive,jhb100-pwm-fan.yaml        | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/starfive,jhb1=
00-pwm-fan.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/starfive,jhb100-pwm-=
fan.yaml b/Documentation/devicetree/bindings/hwmon/starfive,jhb100-pwm-fan.=
yaml
> new file mode 100644
> index 000000000000..b05789867c0e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/starfive,jhb100-pwm-fan.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/starfive,jhb100-pwm-fan.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JHB100 PWM Fan Controller
> +
> +maintainers:
> +  - Changhuang Liang <changhuang.liang@starfivetech.com>
> +
> +description:
> +  The StarFive JHB100 fan controller uses a hardware tachometer block wi=
th
> +  16 tachometer inputs to measure fan speed. Fan speed is controlled thr=
ough
> +  8 PWM channels supplied by an external PWM controller, and one PWM cha=
nnel
> +  can drive up to two fans. Each fan child node references the PWM chann=
el
> +  driving the fan(s) and lists the tachometer inputs wired to them.
> +
> +properties:
> +  compatible:
> +    const: starfive,jhb100-pwm-fan
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
> +patternProperties:
> +  "^fan-[0-7]$":
> +    $ref: fan-common.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      pulses-per-revolution:
> +        minimum: 1
> +        default: 2
> +
> +      tach-ch:
> +        description:
> +          The tachometer input(s) wired to the fan(s) driven by the PWM
> +          channel. One PWM channel can drive up to two fans.
> +        minItems: 1
> +        maxItems: 2
> +        items:
> +          maximum: 15
> +
> +    required:
> +      - pwms
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
> +        compatible =3D "starfive,jhb100-pwm-fan";
> +        reg =3D <0x11be0000 0x400>;
> +        interrupts =3D <128>;
> +        clocks =3D <&per2crg 33>;
> +        resets =3D <&per2crg 5>;
> +
> +        fan-0 {
> +            pwms =3D <&pwm0 0 40000 0>;
> +            tach-ch =3D /bits/ 8 <0x0 0x8>;
> +            pulses-per-revolution =3D <2>;
> +        };
> +
> +        fan-1 {
> +            pwms =3D <&pwm1 0 40000 0>;
> +            tach-ch =3D /bits/ 8 <0x1 0x9>;
> +        };
> +    };
> +...
> --=20
> 2.25.1
>=20

--3XsPMAk746vFPwZe
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarQASQAKCRB4tDGHoIJi
0uWkAQCVbRgZiz8EdoB3thWoFVtHbH1/2HqRXHrITN0AcIfDMgEAq5zyTCYSolIi
nXd3sujXn3XPr0CGKKRvjQdN6Pz/QQg=
=IHKj
-----END PGP SIGNATURE-----

--3XsPMAk746vFPwZe--
