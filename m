Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251668;
	b=UK9ZPr0j37u7KUNjdHA3ADQ2Nn3MgTu7IodqZ4uxhf0fPq7a1hYrnXeJDyhCChgfiS2J
	 x6A9VQ3jkwvSM6lD3TB4780Oj9dJGUFPDE/PZNkrnU8/a9OIyqpiWF88BrIF8GCPqwN+p
	 Fd9pBOHPuftI2/AEZUOkyYjK/HEZSPb3+m4IjIgb+GTdxcOzEmkHsaRqg7PrUxgfEGzLk
	 JTroi/CSQSfNr7+glFuxF/ByCMEnhbIi8yTreZvwL9Su4ZQ/91S7mKq1C+Q/SkI3uRxmL
	 LcaQl02g7rkVVAohacL35Z5vEYHfeqfy9z0wS62JtBOK/wADMvbPtSaQQkSdmJfgbkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251668;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=yScAPiGp0GFiBSNweFgyV+f5Nk+ImZsWDqxYjRGsZ40=;
	b=qqJp7U3cb0oA9FKIM7s+gSM5cDy48NbfgmvGzAqqFX/F3YHKGV9XwwxO9bHnHhVMFWhm
	 B/HjQXHDckOLBFadDckhoblnueT7d++ka0emRKQDARf86dHB5uF/X2WzhVJ7J0oYUDIiq
	 AWlQp65lUoUJGVJUyC5hgGvFkQIfjg5EkWiWgRfEYb+/saxZjPIqvrgcQ2es29xMC0huc
	 8TGQ6ZG1gsZmV6APpQexsIgx2doIIcqi7apU6TkQo3h7s0EciLVfg9Htzp9fa9zL35RmC
	 Cjw7G7f6hudlyn5Io2dOjkpDXv1/kKHGPwYos5HJEDBHWKqp69alZvurJq19QFtq9BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ikuyOB2O;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05521606A33C;
	Mon,  9 Nov 2026 19:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ikuyOB2O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BAE41F0089F;
	Mon,  9 Nov 2026 19:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794251667;
	bh=yScAPiGp0GFiBSNweFgyV+f5Nk+ImZsWDqxYjRGsZ40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ikuyOB2OXRQw3yowsJsGzDGPhOKU0n3ncbrXKnNwHhHzCyfJbAMYD8iKMyybsBq+z
	 EOeE1gALckotHJxh8YOj1ftSZLk2R6m5+4iOpH9+7jSa/TsAa/Yw+3MAqEb7fsxVVm
	 xwuGIWN/SURgpmJyZuz0PFvAAq73nCezlWg8Y/KFq7LB52quzB5Vub21bzIwmaoD9l
	 XJxg2cb+9TDqcDasjfsNTrHHduwAYg1x3FpPBELg+Wo7RjWgyb4azKHpfXnqrz+9cm
	 5cs+r1zTJd3uguXKZt5NVG/HJFZxwcnvfe0CEda9JAuvAL+bTT9blJhSRy9BQclCIJ
	 4aCmDcUI6BRlg==
Date: Mon, 9 Nov 2026 19:14:22 +0000
From: Conor Dooley <conor@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	rdunlap@infradead.org, Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, luka.perkov@sartura.hr
Subject: Re: [PATCH v2 1/6] dt-bindings: hwmon: add Microchip LAN969x fan
 controller
Message-ID: <20261109-mulch-mountain-118fd114a797@spud>
References: <20261109133609.810876-1-robert.marko@sartura.hr>
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
	protocol="application/pgp-signature"; boundary="tL8PWQule9TDGmoi"
Content-Disposition: inline
In-Reply-To: <20261109133609.810876-1-robert.marko@sartura.hr>

--tL8PWQule9TDGmoi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 09, 2026 at 02:35:05PM +0100, Robert Marko wrote:
> The LAN969x fan controller has a PWM output and tachometer input in a
> register block separate from the Sparx5-compatible temperature sensor.
> Describe it with its own compatible and binding.
>=20
> The optional fan child specifies PWM period and polarity, tachometer
> pulses per revolution, and thermal cooling levels.
>=20
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
> Changes in v2:
> - Describe the fan controller in a separate binding and compatible.
> - Keep the existing temperature-sensor binding unchanged.

So, I think that this device has been modelled incorrectly from the
outset. "devcpu_gcb" should probably be a syscon/simplemfd, as least
going off of what I see in
https://microchip-ung.github.io/lan969x-automotive_reginfo/reginfo_LAN969x-=
Automotive.html?select=3Ddevcpu_gcb
and the fact that we see silly offsets in the dts:
		reset: reset-controller@e201000c {
			reg =3D <0xe201000c 0x4>;
		};

		gpio: pinctrl@e20100d4 {
			reg =3D <0xe20100d4 0xd4>,
			      <0xe2010370 0xa8>;
		};

		mdio0: mdio@e20101a8 {
			reg =3D <0xe20101a8 0x24>;
		};

		mdio1: mdio@e20101cc {
			reg =3D <0xe20101cc 0x24>;
		};

		sgpio: gpio@e2010230 {
			reg =3D <0xe2010230 0x118>;
		};
That ship has sailed I think though, so I'm not going to ask you to
rework this whole device.

>=20
>  .../bindings/hwmon/microchip,lan9691-fan.yaml | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,lan=
9691-fan.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fa=
n.yaml b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml
> new file mode 100644
> index 0000000000000..0b7d38a6d20ae
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/microchip,lan9691-fan.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip LAN969x Fan Controller
> +
> +maintainers:
> +  - Robert Marko <robert.marko@sartura.hr>
> +
> +description: |
> +  LAN969x fan controller with a PWM output and tachometer input. The fan
> +  child's pwms property references this node to specify the PWM period a=
nd
> +  polarity.
> +
> +properties:
> +  compatible:
> +    const: microchip,lan9691-fan
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: System reference clock
> +
> +  '#pwm-cells':
> +    const: 2
> +    description: |
> +      Number of cells in a PWM specifier.
> +      - cell 0: PWM period in nanoseconds
> +      - cell 1: PWM polarity: 0 or PWM_POLARITY_INVERTED
> +
> +  fan:
> +    $ref: fan-common.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      cooling-levels:
> +        description:
> +          PWM duty-cycle values corresponding to thermal cooling states.
> +        items:
> +          maximum: 255
> +
> +      pulses-per-revolution:
> +        minimum: 1
> +        maximum: 4
> +        default: 2
> +
> +    required:
> +      - pwms
> +
> +    dependencies:
> +      '#cooling-cells':
> +        - cooling-levels
> +      cooling-levels:
> +        - '#cooling-cells'
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - '#pwm-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/pwm/pwm.h>
> +
> +    fanctrl: fan-controller@e2010348 {
> +        compatible =3D "microchip,lan9691-fan";
> +        reg =3D <0xe2010348 0xc>;

btw, how do I translate the addresses you have here to those in
https://microchip-ung.github.io/lan969x-automotive_reginfo/reginfo_LAN969x-=
Automotive.html?select=3Ddevcpu_gcb,fan_ctrl
? Or are you looking at a register map in a different form?

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

Cheers,
Conor.

> +        clocks =3D <&sys_clk>;
> +        #pwm-cells =3D <2>;
> +
> +        fan {
> +            pwms =3D <&fanctrl 40000 PWM_POLARITY_INVERTED>;
> +            cooling-levels =3D <0 128 192 255>;
> +            #cooling-cells =3D <2>;
> +        };
> +    };
> --=20
> 2.56.0
>=20

--tL8PWQule9TDGmoi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavIbjgAKCRB4tDGHoIJi
0tTZAQDJGw60A4OFmEARRryj9PsxPvhxg1QcXsmWAOIEbtCcxwD/Yg1yrJwMpVRb
lq5d8M3MBVVStjG8TV1Me+VIOtF+KAc=
=XmEl
-----END PGP SIGNATURE-----

--tL8PWQule9TDGmoi--
