Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C8C3921E6;
	Tue, 13 Oct 2026 16:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791909036; cv=none; b=amiVFJLS3vWthGBXLVx0+tItp7eTre6YBtIVhS1btL9lFwbZ1RWg0KDyntv/r2kZzwlV6UJQ4Ayr0pem6QRb2RBDb4U6XAvrXYZ9FhKFfGmU3h+9GoD2s+JTbN6mhSTKV/bbs1Z80/aM32FrwWW03SO3miWFPZQB2rLMP7o8Uhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791909036; c=relaxed/simple;
	bh=//YOPY6vQKmq/roFbnBBtV0XyZS3rD1vuPJk0J3JdRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=usLVt+nc1Q4gMZkbfCElhxk8jSsiW8TPZBzOt6A0hRMmlBEsgNjBEvrnVsRfnjoXZuPbQ7wYVP/pIYuJUIjuS3Ha91SPoP3ACHui17V2fnQn90oLtItak9i3mwMzbEzKu/zrrGW1lBTV3x2OYakn1hWMY73p9N1jTWGEZ/KGAgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ICic/5CH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ICic/5CH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC32D1F000FF;
	Tue, 13 Oct 2026 16:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791909034;
	bh=bCylcL8r7dne6e2xSUn57/ruC99iqBkZb4CHlqtT1Rk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ICic/5CHydH+9bIuXE2dag452kYIQD66ar9sDhSFziK7acorOlC2b8bwaJpcjdLTk
	 pSO4dM9E8PXgsVbA7+4jpxZEeBlys/BOwQcPXPSUg+iSiZY5PGOC+qJMAjAfqZOMJt
	 KuGn5E/rxXhExFAlde+eF/DzjYHZU7ZQ2cHI7KNz5myUOXQwYxqk6FJTZgXyvVWxHG
	 nzFDLKHSya7+8Gic0X7znR/feoR8oTgrgYnZqwkmlFr1hT8i+vPr7u2XYmm0mcjO+r
	 gCTLi2MehvMBJs2UkLM58h7ogPS7qWiQ5lNbm77jBCkaYLHDqRf+MGLDH/gsOjXr/y
	 kbiwEoTzXL8vQ==
Date: Tue, 13 Oct 2026 17:30:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev,
	lars.povlsen@microchip.com, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, luka.perkov@sartura.hr
Subject: Re: [PATCH 1/6] dt-bindings: hwmon: sparx5: add LAN969x fan
 controller
Message-ID: <20261013-stylized-plethora-2a9e27545adb@spud>
References: <20261013125735.1542349-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XdQaVzIG9Y1sxA5J"
Content-Disposition: inline
In-Reply-To: <20261013125735.1542349-1-robert.marko@sartura.hr>

--XdQaVzIG9Y1sxA5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 02:56:25PM +0200, Robert Marko wrote:
> LAN969x integrates a PWM fan controller with a tachometer input in
> addition to the Sparx5-compatible temperature sensor. Add a LAN969x
> hardware-monitor compatible and describe the second register region.
>=20
> Describe the fan as a child node using a two-cell PWM specifier for the
> period and standard polarity flags. The child also carries the optional
> tachometer pulses-per-revolution and thermal cooling properties.
>=20
> Keep the existing microchip,lan9691-temp compatible for device tree ABI
> compatibility.
>=20
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  .../bindings/hwmon/microchip,sparx5-temp.yaml | 90 ++++++++++++++++++-
>  1 file changed, 87 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/microchip,sparx5-tem=
p.yaml b/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yaml
> index 611fcadb1e771..e91c2a3ccd3c9 100644
> --- a/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yaml
> @@ -4,13 +4,15 @@
>  $id: http://devicetree.org/schemas/hwmon/microchip,sparx5-temp.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: Microchip Sparx5 Temperature Monitor
> +title: Microchip Sparx5 Hardware Monitor
> =20
>  maintainers:
>    - Lars Povlsen <lars.povlsen@microchip.com>
> =20
>  description: |
> -  Microchip Sparx5 embedded temperature monitor
> +  Microchip Sparx5 temperature monitor with a fan controller on LAN969x.
> +  The fan child's pwms property references this node to specify the
> +  PWM period and polarity.
> =20
>  properties:
>    compatible:
> @@ -18,11 +20,19 @@ properties:
>        - const: microchip,sparx5-temp
>        - items:
>            - enum:
> +              - microchip,lan9691-hwmon
>                - microchip,lan9691-temp
>            - const: microchip,sparx5-temp
> =20
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +
> +  reg-names:
> +    minItems: 1
> +    items:
> +      - const: temp
> +      - const: fan
> =20
>    clocks:
>      items:
> @@ -31,11 +41,67 @@ properties:
>    '#thermal-sensor-cells':
>      const: 0
> =20
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
>  required:
>    - compatible
>    - reg
>    - clocks
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: microchip,lan9691-hwmon
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +        reg-names:
> +          minItems: 2
> +      required:
> +        - '#pwm-cells'
> +        - reg-names
> +    else:
> +      properties:
> +        '#pwm-cells': false
> +        fan: false
> +        reg:
> +          maxItems: 1
> +        reg-names:
> +          maxItems: 1
> +
>  additionalProperties: false
> =20
>  examples:
> @@ -46,3 +112,21 @@ examples:
>          #thermal-sensor-cells =3D <0>;
>          clocks =3D <&sys_clk>;
>      };
> +
> +  - |
> +    #include <dt-bindings/pwm/pwm.h>
> +
> +    hwmon: hwmon@e2020100 {
> +        compatible =3D "microchip,lan9691-hwmon", "microchip,sparx5-temp=
";
> +        reg =3D <0xe2020100 0xc>, <0xe2010348 0xc>;

Are these actually the same device? These are somewhat disparate
register regions - and the second is at a very odd offset.

Thanks,
Conor.

> +        reg-names =3D "temp", "fan";
> +        #pwm-cells =3D <2>;
> +        #thermal-sensor-cells =3D <0>;
> +        clocks =3D <&sys_clk>;
> +
> +        fan {
> +            pwms =3D <&hwmon 40000 PWM_POLARITY_INVERTED>;
> +            cooling-levels =3D <0 128 192 255>;
> +            #cooling-cells =3D <2>;
> +        };
> +    };
> --=20
> 2.56.0
>=20

--XdQaVzIG9Y1sxA5J
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas5cpQAKCRB4tDGHoIJi
0lm9AQCXQpPsK/Qh9JeeV83vBvj/4SlEGRYK70WcyV1ZZ+XUbwD/RVsReE5mgon+
LvkceSyYW2eJr5Na+TSfbgUhFxZFYg4=
=b6zh
-----END PGP SIGNATURE-----

--XdQaVzIG9Y1sxA5J--
