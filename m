Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F5547669A;
	Tue,  1 Sep 2026 10:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788257870; cv=none; b=RC1EluW7Ca7zzM2bbSxFeKaDCjSKtmFbdNBIbEhUhBK6w9YtoXhu/NYrvLk9h8uYUoYK8mIFboHHDjZb+oxt8lbKjwUrh08Y6XW7maMhON0e9RT3Ak5/XjvyrRH6nHitQdHwVpUD4xgI6d83Zab7VoyBeSPDlVn1GLfNRyWs8uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788257870; c=relaxed/simple;
	bh=b5nF/rkMUtpaOMm853YhrTWPu8MRNN+GraOtoNwSRoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q4DAhHr7gVc8lL6N9mt5r7vscUK8X0xN+qPy5X4+5ug6HwI45z/OLC8iNdA7+hFvIghNfTc1mO3aQxy4jRVjVadkwryR3JwI7v1QM5EjGdQshhNSHBK/Id31UbYrD5c6TMq5y/+mjLgg44sNq0Mj0iQnox9OUdwstz0cGWIe1qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ACutFyiY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ACutFyiY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50AB31F00A3D;
	Tue,  1 Sep 2026 10:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788257869;
	bh=bD+NO1g8IcJci8fvIzJFemXzIyBE1S8uBHtu51YLBF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ACutFyiY8cBL8pUEITCpBSusdAAbThw3ByP8SxszmZRUwdllDgLVVhD1FQrsGDy9L
	 DO95/RErUhBoER1ZrmyczpdHgFoqpGiLuT4ueF2SIGxZfrH1+K1ILboFOWsYvglMSW
	 pMxgNyddQtnZCgelaeXVn1t/ZHF3jb5YgCsckx9gZsUQzb9qC6qIDEaZ9zBqY1EtYE
	 a1nZqam8j3aURnydgbAjLqicbx9Xcp06BtI0WDagtlzLhAQCSSibmz5l1LqSefhGft
	 xfXuoCBsG0/n2yUzhkdKs/IzxmrvE9ZvKkLfh9WrVmMLolLxkXl0ay8+v1US8X9i6/
	 SalC+3IKnHMHg==
Date: Tue, 1 Sep 2026 11:17:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: Add starfive,jhb100-fan-tach
Message-ID: <20260901-rascal-accompany-019414202877@spud>
References: <20260830011941.40199-1-changhuang.liang@starfivetech.com>
 <20260830011941.40199-2-changhuang.liang@starfivetech.com>
 <20260831-dominion-data-c8b6f691dd5b@spud>
 <9f4e99f4-5135-4db8-8534-46c91bf4f7d2@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OllR8tuWijpArDcA"
Content-Disposition: inline
In-Reply-To: <9f4e99f4-5135-4db8-8534-46c91bf4f7d2@roeck-us.net>

--OllR8tuWijpArDcA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 10:54:32AM -0700, Guenter Roeck wrote:
> On 8/31/26 09:32, Conor Dooley wrote:
> > On Sat, Aug 29, 2026 at 06:19:40PM -0700, Changhuang Liang wrote:
> > > Add compatible "starfive,jhb100-fan-tach" for StarFive JHB100 Fan-Tach
> > > controller.
> > >=20
> > > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > > ---
> > >   .../hwmon/starfive,jhb100-fan-tach.yaml       | 93 ++++++++++++++++=
+++
> > >   1 file changed, 93 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/hwmon/starfive=
,jhb100-fan-tach.yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/hwmon/starfive,jhb100-=
fan-tach.yaml b/Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan=
-tach.yaml
> > > new file mode 100644
> > > index 000000000000..1dcd4932768f
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tac=
h.yaml
> > > @@ -0,0 +1,93 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/hwmon/starfive,jhb100-fan-tach.ya=
ml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: StarFive JHB100 Fan-Tach controller
> > > +
> > > +maintainers:
> > > +  - Changhuang Liang <changhuang.liang@starfivetech.com>
> > > +
> > > +description:
> > > +  The StarFive Fan-Tach controller can support up to 16 fan tach inp=
ut.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - starfive,jhb100-fan-tach
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  resets:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  "#address-cells":
> > > +    const: 1
> > > +
> > > +  "#size-cells":
> > > +    const: 0
> > > +
> > > +patternProperties:
> > > +  "^fan@[0-9a-f]+$":
> > > +    $ref: fan-common.yaml#
> > > +    unevaluatedProperties: false
> > > +
> > > +    properties:
> > > +      reg:
> > > +        description:
> > > +          PWM channel index. The driver allows two fans to share the=
 same
> > > +          PWM channel, or each fan to use a dedicated channel.
> >=20
> > Doesn't matter what the driver can do, the description should describe
> > what the hardware supports.
> > pw-bot: changes-requested
> >=20
> > Does this fan-tach controller provide the PWMs?
> > If so (although Guenter may correct me), I think the fan-tach controller
> > needs to be.
> >=20
> > If you don't do that, I think you're going to run into problems with
> > having multiple nodes with the same unit address when two fans share a
> > pwm?
> >=20
>=20
> Depends on how the controller works. Normally fan controllers have a feed=
back
> mechanism which can be either temperature -> pwm output or fan speed -> p=
wm output.
> I don't know how this controller works, specifically if the fan speed inp=
uts are
> internally associated with pwm outputs or if they are completely independ=
ent
> of each other. If it is the latter, aspeed,g6-pwm-tach.yaml would probably
> be a good baseline.

Judging from the other reply, it probably isn't a good baseline because
this is not a pwm provider.

> > I think what you're supposed to do is drop "reg" and replace it with
> > "pwms", but once again Guenter may correct me there.
> > e.g. aspeed,g6-pwm-tach.yaml
> >=20
>=20
> Sorry, when it comes to devicetree properties, I am completely clueless.
> Usually the devicetree and pwm maintainers insist that all fan controllers
> are modeled as pwm controllers because they have pwm outputs. My approach
> is "use whatever bindings are acceptable by DT maintainers".

Would you mind taking a look at my question in the other reply about how
the feedback path works (or doesn't) in that case? My lack of
familiarity with the subsystem has me scratching my head about how the
tach would be used to adjust the pwm duty cycle with the dt setup
described there!

Thanks,
Conor.

>=20
> Guenter
>=20
> > Cheers,
> > Conor.
> >=20
> > > +        maximum: 15
> > > +
> > > +      tach-ch:
> > > +        description:
> > > +          The tachometer channel(s) wired to the fan(s) driven by th=
is PWM
> > > +          channel. Integer values in the range 0-15.
> > > +        minItems: 1
> > > +        maxItems: 2
> > > +        items:
> > > +          maximum: 15
> > > +
> > > +    required:
> > > +      - reg
> > > +      - tach-ch
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - resets
> > > +  - interrupts
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    fan-controller@11be0000 {
> > > +        compatible =3D "starfive,jhb100-fan-tach";
> > > +        reg =3D <0x11be0000 0x400>;
> > > +        interrupts =3D <128>;
> > > +        clocks =3D <&per2crg 33>;
> > > +        resets =3D <&per2crg 5>;
> > > +        #address-cells =3D <1>;
> > > +        #size-cells =3D <0>;
> > > +
> > > +        fan@0 {
> > > +            reg =3D <0x0>;
> > > +            tach-ch =3D /bits/ 8 <0x0 0x8>;
> > > +            pulses-per-revolution =3D <2>;
> > > +        };
> > > +        fan@1 {
> > > +            reg =3D <0x1>;
> > > +            tach-ch =3D /bits/ 8 <0x1>;
> > > +            pulses-per-revolution =3D <2>;
> > > +        };
> > > +    };
> > > --=20
> > > 2.25.1
> > >=20
>=20

--OllR8tuWijpArDcA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapamSQAKCRB4tDGHoIJi
0pcFAP9NvhtVArULnG8/TcoZuMv9hLMI3fMdLauAVZ1kqkpcwgD/dvDa1Dh0dbVn
wntMkz3OdcbTVJykj8hjq6a8pHhDngQ=
=X4B+
-----END PGP SIGNATURE-----

--OllR8tuWijpArDcA--
