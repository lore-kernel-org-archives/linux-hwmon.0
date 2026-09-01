Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817573955EF;
	Tue,  1 Sep 2026 10:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788257654; cv=none; b=PgIcGZsoieKXoi8vhoCEFNJcqHOIjRYv4pRqZdZz4teBEaLaEu2z/kBzmP2QHuiuvX2wPElCE4RdneyawM8pegsf1uNb08ztC34zvdQGDYAewb3N8jWcIL8PxuiWj1sGbqMqp52hZHJanAiLJ9P7VI8eFQs6+pOjfM9n7EVl5NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788257654; c=relaxed/simple;
	bh=YSgUx7F+6Bgbpy1tetwjhc+2/XqqT9olPivWTZ6hAX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=unXU7/q66RAT++iKiCWj2aZTDe+zETLVxHX1kyYXJ7yZSw+QOCKKXUqZJmzk8yX7wjHxLmuFpXHkwoHupTW6vEVBcSFkZlLIPrkwWjxtKL5kN6tcleA+OyjlQHkql0fsK+o7DI2ZlIqfiEelwmH0jIhWZBOD0i5wRIx6Ub4uaMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i6JzaQNP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i6JzaQNP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78EBF1F000E9;
	Tue,  1 Sep 2026 10:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788257653;
	bh=xv+f1Rgq+etXjVp4lARKJYE4SB7VPttZm6scShbV8Z4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i6JzaQNPTb1sirLAaHW1y6s19m7C+gXKl86aYpUGSOWOPf4fjdyHFBEyD8fp1QHmh
	 FA/usaCuqlhNiph+fkVilF1qYR/nb9OTVDqihmkyINHTv9YK8ia9lN1SBaZOvBNqz5
	 ailGOLGmZqfpKm+PWl+1tzqAuG6qBqU6uiyikvPJC+SwfAvyj9T3BcXnKIgtOZpO21
	 ZD1IUpffv/kcbTZCXH/ADDJ1RQDXEF98yMnxq3jh/qveZV/pKOhUUKgYy21jpTRrKJ
	 XsksBOxw6dvYfjAQRFjHrCAamNINCWdvS2hr2qp7EW1yopCQpFbk0ZSzveEx4BSZtr
	 rbpq3DAGTgLMw==
Date: Tue, 1 Sep 2026 11:14:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: Add starfive,jhb100-fan-tach
Message-ID: <20260901-contrite-cathouse-f50c63af6323@spud>
References: <20260830011941.40199-1-changhuang.liang@starfivetech.com>
 <20260830011941.40199-2-changhuang.liang@starfivetech.com>
 <20260831-dominion-data-c8b6f691dd5b@spud>
 <ZQ4PR01MB12023835F6083F45484E1ED3F2A82@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VlZVat/jrvCtGcRs"
Content-Disposition: inline
In-Reply-To: <ZQ4PR01MB12023835F6083F45484E1ED3F2A82@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>

--VlZVat/jrvCtGcRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 01, 2026 at 01:24:39AM +0000, Changhuang Liang wrote:
> > On Sat, Aug 29, 2026 at 06:19:40PM -0700, Changhuang Liang wrote:
> > > +patternProperties:
> > > +  "^fan@[0-9a-f]+$":
> > > +    $ref: fan-common.yaml#
> > > +    unevaluatedProperties: false
> > > +
> > > +    properties:
> > > +      reg:
> > > +        description:
> > > +          PWM channel index. The driver allows two fans to share the
> > same
> > > +          PWM channel, or each fan to use a dedicated channel.
> >=20
> > Doesn't matter what the driver can do, the description should describe =
what
> > the hardware supports.
> > pw-bot: changes-requested
> > Does this fan-tach controller provide the PWMs?
> > If so (although Guenter may correct me), I think the fan-tach controlle=
r needs
> > to be.
> >=20
> > If you don't do that, I think you're going to run into problems with ha=
ving
> > multiple nodes with the same unit address when two fans share a pwm?
> >=20
> > I think what you're supposed to do is drop "reg" and replace it with "p=
wms",
> > but once again Guenter may correct me there.
> > e.g. aspeed,g6-pwm-tach.yaml
> >=20
>=20
> Perhaps I can refer to aspeed,g6-pwm-tach.yaml and change "^fan@[0-9a-f]+=
$" to=20
> "^fan-[0-9]+$", which would remove the reg property. In fact, the driver =
does not=20
> use reg either.
>=20
> Our fan-tach controller does not include PWM. The JHB100 SoC will have a =
separate=20
> PWM controller. (This controller uses the same IP as the JH7110 SoC, but =
there are=20
> some differences in driver implementation.)
>=20
> The JHB100 has 8 PWM channels and 16 fan tach channels.
>=20
> So currently we expect the Device Tree to be configured like this:
>=20
> 	pwm0: pwm {
> 		compatible =3D "starfive,jhb100-pwm";
> 	};
> =09

>=20
> 	fan0: pwm-fan0 {
> 		compatible =3D "pwm-fan";
> 		pwms =3D <&pwm0 0 40000 0>;
> 	};

>=20
> fan-controller {
> 	compatible =3D "starfive,jhb100-fan-tach";
>=20
> 	fan@0 {
> 		tach-ch =3D <0x0>, <0x8>;
> 	};

Truncating this for readability, but it looks wrong to me. How does the
feedback loop work here when there's no way to determine which fan is
connected to a tach channel? The unit address of the child nodes has no
dt enforced guarantee to line up with node names of the fans or pwm
indices.

--VlZVat/jrvCtGcRs
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapalcQAKCRB4tDGHoIJi
0lyNAQDPdzz05UL1RU/DpZYfFtGGKZkd9Ze5/oHm9/nigzFcggEAwwvBYYYhq9XU
O+vT1cEdRGMl4QSX90+weTZok9h4uw8=
=TWjs
-----END PGP SIGNATURE-----

--VlZVat/jrvCtGcRs--
