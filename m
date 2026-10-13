Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2432651C04B;
	Tue, 13 Oct 2026 16:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791909495; cv=none; b=KliJknG3CH53vIYmNWz/j+h9bxuztEqJ54qXuCjkMMexeSe2wLyGrPMhJuoCPBgBnVJUk9G99+xNsZz+JQ4pJvg/hdTh6/diCC3MNLgWb/eunTewE42GRJQ9p8y4RqScVY7EEWD7G49OrxLxwLGPuN5/DU9hJo4w0ctPje0UffI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791909495; c=relaxed/simple;
	bh=T6HbvwJs0WFdfIMH7iGZvbiuF8hxNT5sxvPhXCviOuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HYFKZz194xiy3sVoscQCLM4IrqaH5f2htYB1XVzgr49RbU7jU4HweDnP34RRCwmMxcwb2gCTxoxzkX2wn0HK9bHiul+wKKPtC0OSNujWw9AtmA+6Nza9Z8cukIIvAHH+SZH4ScA7iBy70d4N/k4dbfCufkQ+JHG2Z++X0ure424=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XOPc8K41; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XOPc8K41"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE3461F008A1;
	Tue, 13 Oct 2026 16:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791909493;
	bh=5JjUhGeNIiMMANRRaRsl1pjhnEELfb6stTWkWEvlDGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XOPc8K41ZtPawQbQY0ycbHdlD1r+q7i2YNb8nWdP3Nki8QCWNHVDWn8Rv9Boj0vA1
	 h54iiFOgIU5hKxvZ/JnFd2AhxdpFHcPWCFLtawSfiqMR/HqRZyrbHdoKZqK3wdzXZl
	 4VCOS5dlwpn6j+8pzRpE4DfksdNVr844PnTv91tpdRjL4uEdKPdJk1hxBHX/+c6+Iq
	 9ugkEdgrOvjXJgUCrboKSoR+vQ4PKlN83dql9jOUE2hy25vcyc8irPF6Z0RKRT+nQ7
	 ZcFkkgfbUMKLCYRQ3lPWWUXcf9p5bUXrkDwqNEsAtrHvCLY/oin8rUAodncurSG0Xm
	 l697HdRha7amg==
Date: Tue, 13 Oct 2026 17:38:08 +0100
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
Message-ID: <20261013-unnoticed-deviator-fa9263334ad5@spud>
References: <20261013125735.1542349-1-robert.marko@sartura.hr>
 <20261013-stylized-plethora-2a9e27545adb@spud>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dNzm2dIscauwjnQ7"
Content-Disposition: inline
In-Reply-To: <20261013-stylized-plethora-2a9e27545adb@spud>

--dNzm2dIscauwjnQ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 05:30:29PM +0100, Conor Dooley wrote:
> On Tue, Oct 13, 2026 at 02:56:25PM +0200, Robert Marko wrote:
> > LAN969x integrates a PWM fan controller with a tachometer input in
> > addition to the Sparx5-compatible temperature sensor. Add a LAN969x
> > hardware-monitor compatible and describe the second register region.
> >=20
> > Describe the fan as a child node using a two-cell PWM specifier for the
> > period and standard polarity flags. The child also carries the optional
> > tachometer pulses-per-revolution and thermal cooling properties.
> >=20
> > Keep the existing microchip,lan9691-temp compatible for device tree ABI
> > compatibility.
> >=20
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  .../bindings/hwmon/microchip,sparx5-temp.yaml | 90 ++++++++++++++++++-
> >  1 file changed, 87 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/hwmon/microchip,sparx5-t=
emp.yaml b/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.ya=
ml
> > index 611fcadb1e771..e91c2a3ccd3c9 100644
> > --- a/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yaml
> > +++ b/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yaml
> > @@ -4,13 +4,15 @@
> >  $id: http://devicetree.org/schemas/hwmon/microchip,sparx5-temp.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> > =20
> > -title: Microchip Sparx5 Temperature Monitor
> > +title: Microchip Sparx5 Hardware Monitor
> > =20
> >  maintainers:
> >    - Lars Povlsen <lars.povlsen@microchip.com>
> > =20
> >  description: |
> > -  Microchip Sparx5 embedded temperature monitor
> > +  Microchip Sparx5 temperature monitor with a fan controller on LAN969=
x.
> > +  The fan child's pwms property references this node to specify the
> > +  PWM period and polarity.
> > =20
> >  properties:
> >    compatible:
> > @@ -18,11 +20,19 @@ properties:
> >        - const: microchip,sparx5-temp
> >        - items:
> >            - enum:
> > +              - microchip,lan9691-hwmon
> >                - microchip,lan9691-temp
> >            - const: microchip,sparx5-temp
> > =20
> >    reg:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  reg-names:
> > +    minItems: 1
> > +    items:
> > +      - const: temp
> > +      - const: fan
> > =20
> >    clocks:
> >      items:
> > @@ -31,11 +41,67 @@ properties:
> >    '#thermal-sensor-cells':
> >      const: 0
> > =20
> > +  '#pwm-cells':
> > +    const: 2
> > +    description: |
> > +      Number of cells in a PWM specifier.
> > +      - cell 0: PWM period in nanoseconds
> > +      - cell 1: PWM polarity: 0 or PWM_POLARITY_INVERTED
> > +
> > +  fan:
> > +    $ref: fan-common.yaml#
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      cooling-levels:
> > +        description:
> > +          PWM duty-cycle values corresponding to thermal cooling state=
s.
> > +        items:
> > +          maximum: 255
> > +
> > +      pulses-per-revolution:
> > +        minimum: 1
> > +        maximum: 4
> > +        default: 2
> > +
> > +    required:
> > +      - pwms
> > +
> > +    dependencies:
> > +      '#cooling-cells':
> > +        - cooling-levels
> > +      cooling-levels:
> > +        - '#cooling-cells'
> > +
> >  required:
> >    - compatible
> >    - reg
> >    - clocks
> > =20
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: microchip,lan9691-hwmon
> > +    then:
> > +      properties:
> > +        reg:
> > +          minItems: 2
> > +        reg-names:
> > +          minItems: 2
> > +      required:
> > +        - '#pwm-cells'
> > +        - reg-names
> > +    else:
> > +      properties:
> > +        '#pwm-cells': false
> > +        fan: false
> > +        reg:
> > +          maxItems: 1
> > +        reg-names:
> > +          maxItems: 1
> > +
> >  additionalProperties: false
> > =20
> >  examples:
> > @@ -46,3 +112,21 @@ examples:
> >          #thermal-sensor-cells =3D <0>;
> >          clocks =3D <&sys_clk>;
> >      };
> > +
> > +  - |
> > +    #include <dt-bindings/pwm/pwm.h>
> > +
> > +    hwmon: hwmon@e2020100 {
> > +        compatible =3D "microchip,lan9691-hwmon", "microchip,sparx5-te=
mp";
> > +        reg =3D <0xe2020100 0xc>, <0xe2010348 0xc>;
>=20
> Are these actually the same device? These are somewhat disparate
> register regions - and the second is at a very odd offset.
>=20

Hmm, doubly suspect since there's already a lan9691-temp compatible...

> Thanks,
> Conor.
>=20
> > +        reg-names =3D "temp", "fan";
> > +        #pwm-cells =3D <2>;
> > +        #thermal-sensor-cells =3D <0>;
> > +        clocks =3D <&sys_clk>;
> > +
> > +        fan {
> > +            pwms =3D <&hwmon 40000 PWM_POLARITY_INVERTED>;
> > +            cooling-levels =3D <0 128 192 255>;
> > +            #cooling-cells =3D <2>;
> > +        };
> > +    };
> > --=20
> > 2.56.0
> >=20



--dNzm2dIscauwjnQ7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas5ecAAKCRB4tDGHoIJi
0miiAQDcoS6pSOZe09nTKWW5+iqnZh40Ene/HF8ywjE+shE02AD+L+ZLOFQc9oo7
WY2OttGlEwnYUHuXtVrbQDVuvlVSAAs=
=YRrz
-----END PGP SIGNATURE-----

--dNzm2dIscauwjnQ7--
