Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD094343F2;
	Tue, 22 Sep 2026 17:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790099655; cv=none; b=LkDq9zvY2SegDTuz15/1DeDgBfRpBSR8amOpW8hNZ/rJqHwh320MDQBCHkftn3YEuDD0UpQfbPKt6KtfDd2qSyEOX0XCBjIlG2qJ0AUMSZL52JI6NBLzg+wrHIlQOn+RirnKqZ3yxqdM3Pf8g/jjaMbaLLbsXAwIrOD54JPJmC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790099655; c=relaxed/simple;
	bh=rOLHGgc4u6oJzArWgygaRht6GTfcLwfTVoJvN+nwixo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JZ1ZYVI1uSaS2NgeyYU5tI2wyvRynn4tc0Fb/3LKKFPCXdm47g5lh5ijrSyn6OVBPr4kbBFHESXqW8/tWD3ME0WHaeiap48G+joEkGokaqf5BKjJp5sNy+rKbFTeKfJO4NywMQFqHFQtCsETh5NezRc8nkOTViBd3cgNKbQQiqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cGHCs7wY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cGHCs7wY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96BE41F000FF;
	Tue, 22 Sep 2026 17:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790099653;
	bh=EC0CCQoxmQLsdmVTupxShjuq40cV9/N7tOVdJ6WL+Tg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cGHCs7wY3GLWO2KX6OZiAq6rDhoGiuKcfvk6jOdZ127AEP6apvE4Cb/wuWqsGI92m
	 8L0vD9RjhzZIewE1UBok7x0AyBVm5D732QC093fSSZ2RfDZzoUHvnVItOGPAyOFtqW
	 2ON+vxyBjA3Ph/fUDN6uarvuF/6IUk1B/M8+Z5T7FlXcla4OGhWkULXeqAdZNQDhZm
	 ovVvyPSaZZws5ncnbSAOWC2dVbu9Lmx9oCRFwSycw61soV8n6+6rTC3ScX6AKj/ssr
	 65UKRjw+7DF2DGhVZ6Thw4t5bMAXTeOgm4ioPpcYoDDCN0jqSBL2XIprbkmP+U00L5
	 6fp8lCi4Qm70Q==
Date: Tue, 22 Sep 2026 18:54:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: Add starfive,jhb100-fan-tach
Message-ID: <20260922-buffalo-urology-0395e437ae61@spud>
References: <20260830011941.40199-1-changhuang.liang@starfivetech.com>
 <20260830011941.40199-2-changhuang.liang@starfivetech.com>
 <20260831-dominion-data-c8b6f691dd5b@spud>
 <ZQ4PR01MB12023835F6083F45484E1ED3F2A82@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260901-contrite-cathouse-f50c63af6323@spud>
 <4cc20c64-bd95-4689-81b3-3f01d9c3bc8e@roeck-us.net>
 <ZQ4PR01MB1202328B1B28955A0C6DF44DF2B22@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="od/SITDpZ8ZnvRxl"
Content-Disposition: inline
In-Reply-To: <ZQ4PR01MB1202328B1B28955A0C6DF44DF2B22@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>

--od/SITDpZ8ZnvRxl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 07, 2026 at 02:51:44AM +0000, Changhuang Liang wrote:
> Hi, Guenter, Conor
>=20
> Thanks for the review.
>=20
> > On 9/1/26 03:14, Conor Dooley wrote:
> > > On Tue, Sep 01, 2026 at 01:24:39AM +0000, Changhuang Liang wrote:
> > >>> On Sat, Aug 29, 2026 at 06:19:40PM -0700, Changhuang Liang wrote:
> > >>>> +patternProperties:
> > >>>> +  "^fan@[0-9a-f]+$":
> > >>>> +    $ref: fan-common.yaml#
> > >>>> +    unevaluatedProperties: false
> > >>>> +
> > >>>> +    properties:
> > >>>> +      reg:
> > >>>> +        description:
> > >>>> +          PWM channel index. The driver allows two fans to share
> > >>>> + the
> > >>> same
> > >>>> +          PWM channel, or each fan to use a dedicated channel.
> > >>>
> > >>> Doesn't matter what the driver can do, the description should
> > >>> describe what the hardware supports.
> > >>> pw-bot: changes-requested
> > >>> Does this fan-tach controller provide the PWMs?
> > >>> If so (although Guenter may correct me), I think the fan-tach
> > >>> controller needs to be.
> > >>>
> > >>> If you don't do that, I think you're going to run into problems with
> > >>> having multiple nodes with the same unit address when two fans shar=
e a
> > pwm?
> > >>>
> > >>> I think what you're supposed to do is drop "reg" and replace it with
> > >>> "pwms", but once again Guenter may correct me there.
> > >>> e.g. aspeed,g6-pwm-tach.yaml
> > >>>
> > >>
> > >> Perhaps I can refer to aspeed,g6-pwm-tach.yaml and change
> > >> "^fan@[0-9a-f]+$" to "^fan-[0-9]+$", which would remove the reg
> > >> property. In fact, the driver does not use reg either.
> > >>
> > >> Our fan-tach controller does not include PWM. The JHB100 SoC will
> > >> have a separate PWM controller. (This controller uses the same IP as
> > >> the JH7110 SoC, but there are some differences in driver
> > >> implementation.)
> > >>
> > >> The JHB100 has 8 PWM channels and 16 fan tach channels.
> > >>
> > >> So currently we expect the Device Tree to be configured like this:
> > >>
> > >> 	pwm0: pwm {
> > >> 		compatible =3D "starfive,jhb100-pwm";
> > >> 	};
> > >>
> > >
> > >>
> > >> 	fan0: pwm-fan0 {
> > >> 		compatible =3D "pwm-fan";
> > >> 		pwms =3D <&pwm0 0 40000 0>;
> > >> 	};
> > >
> > >>
> > >> fan-controller {
> > >> 	compatible =3D "starfive,jhb100-fan-tach";
> > >>
> > >> 	fan@0 {
> > >> 		tach-ch =3D <0x0>, <0x8>;
> > >> 	};
> > >
> > > Truncating this for readability, but it looks wrong to me. How does
> > > the feedback loop work here when there's no way to determine which fan
> > > is connected to a tach channel? The unit address of the child nodes
> > > has no dt enforced guarantee to line up with node names of the fans or
> > > pwm indices.
> >=20
> > Normally (for other fan controllers) the fan would have a target speed.
> > The controller measures the speed and adjusts pwm output values until t=
he
> > fan speed matches the expected value. The controller needs to know the
> > association between tachometer input and pwm output for this to work.
> > Typically (for classic fan controllers) that association is static.
> > In the Aspeed G6 fan controller it is dynamic/configurable.
> >=20
> > I thought this is the case here as well, but I have no idea if that is =
correct (or if
> > there is a chip-internal feedback loop to start with).
>=20
> Here is some information I found about fan tach and PWM control. It looks=
 like these=20
> two devices are managed through an application.
>=20
> Do you have any new suggestions for modifications?

I, at least, have no new suggestions. I thought the most recent reply
=66rom Guenter was pretty clear? If you've got a dedicated fan controller
with static association then you don't need to provide the association,
but if there's dynamic/configurable pwm-tach then you need to provide
the association so that the fan controller can work correctly?
To me, that read as if the pwms property would be required here, because
what's proposed above represents the same fan twice, as pwm-fan0 and
fan0 without an association between the two because you have an
different IP entirely providing the pwm.

For this to work, don't you actually need to do:
pwm0: pwm {
	compatible =3D "starfive,jhb100-pwm";
};

fan-controller {
	compatible =3D "starfive,jhb100-fan-tach";
=09
	fan@0 {
		pwms =3D <&pwm0 0 40000 0>;
		tach-ch =3D <0x0>, <0x8>;
	};
};

Cheers,
Conor.

>=20
> https://github.com/openbmc/phosphor-pid-control/blob/master/README.md
>=20
> Best Regards,
> Changhuang
>=20

--od/SITDpZ8ZnvRxl
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarLAwQAKCRB4tDGHoIJi
0uavAQD5HvKTsT2Foge676M5xjojdBzg7BMwIIHH2vrdwaWgoAD+LQwN8E8Kisk8
hDGatefDO9/Ieb0s9+honip7zOLYqQw=
=UlLZ
-----END PGP SIGNATURE-----

--od/SITDpZ8ZnvRxl--
