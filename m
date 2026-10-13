Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3483F105B;
	Tue, 13 Oct 2026 17:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791912706; cv=none; b=E347YHXBZmfUC4Lv4S5fcdXG/Fnr2ja5QuLtrWlTaAvwBWYMbTlQ+ozoyxQFsH0LuQzt4PB3sO/Jmi/HuagWSRpegitUImybP9td7c5QqpRpMFkXSA/aNJVAzmmjF9fPN0YA3jaSMlY7O9mT9/UXzBRMe4tfgXW8dXqug54b79c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791912706; c=relaxed/simple;
	bh=v/vKKtpOzS8YzsPNGdZBQvqeKkAcEpPqOMnXjUDK6v8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C6PQiIgyLBg7ds7JTazSqqUlzc1XgMQDa6pcb8jKj+QHlAI3hrt9fswI7NkEYOrgeq0SG7rr8gRgke+CheEdJsMDxES6anAYNoG7kVo0UJ+aoaqIybssxsia+dgtBCuIus0+5yGElOCM+a0zmNF4UnrqvIdgFm2WUsHVEHtneOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RP0AZWag; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RP0AZWag"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ED681F00893;
	Tue, 13 Oct 2026 17:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791912704;
	bh=P9yR/iQvDBD3fVqX5zNUr7e6YuxSLAfgJx2C9bX9mSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RP0AZWagpWx8ooO3zve15EY0NR6XeW6zRpQCg83idaGBKc+gX7vR6qKKLyk+uS6jN
	 Yy7ZXuHwNEz2fjUp9OmlzJ8LJugiSviNiaL0SxxzJ8eXL6yvBihqKK1AHwj+MJMgsr
	 C5ONhehkgTm0Cw+F10gs19lNCT7q+NM4ZEcvufCDajHIOT+ckKsa/sB7Q2YuTsSEIx
	 8fiYDnYMoSCm98ahoETeDjmJDLBYBBl3YLK5x+46iVDZgkSxKg6fd2zGep5uHyfID8
	 fiFmPc0SlkJsI15Ti7wmOrgILq16GCtGZYZqySaqsjkCzovf3970Z4ynbMtNPVTCpy
	 zsDMRta+FQj7g==
Date: Tue, 13 Oct 2026 18:31:39 +0100
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
Message-ID: <20261013-footwear-boxer-458afbcff303@spud>
References: <20261013125735.1542349-1-robert.marko@sartura.hr>
 <20261013-stylized-plethora-2a9e27545adb@spud>
 <CA+HBbNHZZePJh6s2xujmjA57GYZTgwhMqBnf0atM9aPQJP77Rw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GZAyrRYchvfkwe6C"
Content-Disposition: inline
In-Reply-To: <CA+HBbNHZZePJh6s2xujmjA57GYZTgwhMqBnf0atM9aPQJP77Rw@mail.gmail.com>

--GZAyrRYchvfkwe6C
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 07:08:34PM +0200, Robert Marko wrote:
> On Tue, Oct 13, 2026 at 6:30=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Tue, Oct 13, 2026 at 02:56:25PM +0200, Robert Marko wrote:
> > > LAN969x integrates a PWM fan controller with a tachometer input in
> > > addition to the Sparx5-compatible temperature sensor. Add a LAN969x
> > > hardware-monitor compatible and describe the second register region.
> > >
> > > Describe the fan as a child node using a two-cell PWM specifier for t=
he
> > > period and standard polarity flags. The child also carries the option=
al
> > > tachometer pulses-per-revolution and thermal cooling properties.
> > >
> > > Keep the existing microchip,lan9691-temp compatible for device tree A=
BI
> > > compatibility.
> > >
> > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > ---
> > >  .../bindings/hwmon/microchip,sparx5-temp.yaml | 90 +++++++++++++++++=
+-
> > >  1 file changed, 87 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/hwmon/microchip,sparx5=
-temp.yaml b/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.=
yaml
> > > index 611fcadb1e771..e91c2a3ccd3c9 100644
> > > --- a/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.y=
aml
> > > +++ b/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.y=
aml
> > > @@ -4,13 +4,15 @@
> > >  $id: http://devicetree.org/schemas/hwmon/microchip,sparx5-temp.yaml#
> > >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> > >
> > > -title: Microchip Sparx5 Temperature Monitor
> > > +title: Microchip Sparx5 Hardware Monitor
> > >
> > >  maintainers:
> > >    - Lars Povlsen <lars.povlsen@microchip.com>
> > >
> > >  description: |
> > > -  Microchip Sparx5 embedded temperature monitor
> > > +  Microchip Sparx5 temperature monitor with a fan controller on LAN9=
69x.
> > > +  The fan child's pwms property references this node to specify the
> > > +  PWM period and polarity.
> > >
> > >  properties:
> > >    compatible:
> > > @@ -18,11 +20,19 @@ properties:
> > >        - const: microchip,sparx5-temp
> > >        - items:
> > >            - enum:
> > > +              - microchip,lan9691-hwmon
> > >                - microchip,lan9691-temp
> > >            - const: microchip,sparx5-temp
> > >
> > >    reg:
> > > -    maxItems: 1
> > > +    minItems: 1
> > > +    maxItems: 2
> > > +
> > > +  reg-names:
> > > +    minItems: 1
> > > +    items:
> > > +      - const: temp
> > > +      - const: fan
> > >
> > >    clocks:
> > >      items:
> > > @@ -31,11 +41,67 @@ properties:
> > >    '#thermal-sensor-cells':
> > >      const: 0
> > >
> > > +  '#pwm-cells':
> > > +    const: 2
> > > +    description: |
> > > +      Number of cells in a PWM specifier.
> > > +      - cell 0: PWM period in nanoseconds
> > > +      - cell 1: PWM polarity: 0 or PWM_POLARITY_INVERTED
> > > +
> > > +  fan:
> > > +    $ref: fan-common.yaml#
> > > +    unevaluatedProperties: false
> > > +
> > > +    properties:
> > > +      cooling-levels:
> > > +        description:
> > > +          PWM duty-cycle values corresponding to thermal cooling sta=
tes.
> > > +        items:
> > > +          maximum: 255
> > > +
> > > +      pulses-per-revolution:
> > > +        minimum: 1
> > > +        maximum: 4
> > > +        default: 2
> > > +
> > > +    required:
> > > +      - pwms
> > > +
> > > +    dependencies:
> > > +      '#cooling-cells':
> > > +        - cooling-levels
> > > +      cooling-levels:
> > > +        - '#cooling-cells'
> > > +
> > >  required:
> > >    - compatible
> > >    - reg
> > >    - clocks
> > >
> > > +allOf:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: microchip,lan9691-hwmon
> > > +    then:
> > > +      properties:
> > > +        reg:
> > > +          minItems: 2
> > > +        reg-names:
> > > +          minItems: 2
> > > +      required:
> > > +        - '#pwm-cells'
> > > +        - reg-names
> > > +    else:
> > > +      properties:
> > > +        '#pwm-cells': false
> > > +        fan: false
> > > +        reg:
> > > +          maxItems: 1
> > > +        reg-names:
> > > +          maxItems: 1
> > > +
> > >  additionalProperties: false
> > >
> > >  examples:
> > > @@ -46,3 +112,21 @@ examples:
> > >          #thermal-sensor-cells =3D <0>;
> > >          clocks =3D <&sys_clk>;
> > >      };
> > > +
> > > +  - |
> > > +    #include <dt-bindings/pwm/pwm.h>
> > > +
> > > +    hwmon: hwmon@e2020100 {
> > > +        compatible =3D "microchip,lan9691-hwmon", "microchip,sparx5-=
temp";
> > > +        reg =3D <0xe2020100 0xc>, <0xe2010348 0xc>;
> >
> > Are these actually the same device? These are somewhat disparate
> > register regions - and the second is at a very odd offset.
>=20
> Not really, they can be separately configured and have their own register=
 space.
>=20
> I did not see a point in separate drivers, but we could model these as
> separate DT
> nodes with their individual bindings if that is more appropriate.

Doing that seems more appropriate to me.

--GZAyrRYchvfkwe6C
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas5q+wAKCRB4tDGHoIJi
0gzXAP9jIRVOGR1N1MGiguEHKD2U5b6VJpB8hxA7f8I8m727RQD/SdMGdtxaTCdp
/h5u8x95jfEpATwvdc9htfT3ghTakwo=
=tl+d
-----END PGP SIGNATURE-----

--GZAyrRYchvfkwe6C--
