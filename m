Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E2E358B3;
	Mon, 27 Nov 2023 17:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zyseagj8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32784C433C7;
	Mon, 27 Nov 2023 17:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701106434;
	bh=4sXySQchTuW8h+aOTNQyzU6G4RPf33PoqMAO4ZKZSNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zyseagj8U+MIhkThFmLfwbzPrVUYzPUIDmxEORqw7b3WqnjDJGDdMXthWDoPKG8UM
	 OhT8o8lpnZLDgvsa5/1y97sBT5xUcKIG/jhuOF4UlO3zaKnfYy/LzW25vF7tq7jH+u
	 0W+u768afJEGa77/4TWt4QgmOhgFe+jejOeP8oBJEtwlfbQKqsM1Y41jhqaAxWNY6/
	 /+9qyKoH3E1EQ6iacJ0fccJKDvKSBGjpver+r9MqxiYfhZxvR5h6e/dGVB4sDtC/vv
	 IE7YKnDSBIB1fcFSugGfSZTINGkZFRIsfy/qyZBfpBSAChOqmzwmHxx/kBcdSyO/Mx
	 ROmP9HsoifxAw==
Date: Mon, 27 Nov 2023 17:33:48 +0000
From: Conor Dooley <conor@kernel.org>
To: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
Cc: nuno.sa@analog.com, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add LTC4282 bindings
Message-ID: <20231127-payback-bulginess-3afd21d0e0fb@spud>
References: <20231124-ltc4282-support-v2-0-952bf926f83c@analog.com>
 <20231124-ltc4282-support-v2-1-952bf926f83c@analog.com>
 <20231125-chivalry-bargraph-cb6bb2b1ed66@spud>
 <ac3d17579847686f9800567aecfeb749c04ba759.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sSckkexfIMYASZhR"
Content-Disposition: inline
In-Reply-To: <ac3d17579847686f9800567aecfeb749c04ba759.camel@gmail.com>


--sSckkexfIMYASZhR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2023 at 08:56:36AM +0100, Nuno S=E1 wrote:
> On Sat, 2023-11-25 at 11:56 +0000, Conor Dooley wrote:
> > On Fri, Nov 24, 2023 at 03:18:16PM +0100, Nuno Sa via B4 Relay wrote:
> >=20
> > > +=A0 adi,gpio1-mode:
> > > +=A0=A0=A0 description: Defines the function of the Pin.
> > > +=A0=A0=A0 $ref: /schemas/types.yaml#/definitions/string
> > > +=A0=A0=A0 enum: [gpio, power_bad, power_good]
> > > +
> > > +=A0 adi,gpio2-mode:
> > > +=A0=A0=A0 description: Defines the function of the Pin.
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 0 - GPIO Mode.
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 1 - Acts as an input pin and it is feede=
d into the ADC.
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 2 - Pulls Low when the MOSFET is dissipa=
ting power (stress).
> >=20
> > These three descriptions here probably need to be updated, one for being
> > too short and these two for still having the integer stuff in the
> > descriptions. Otherwise I think this is looking okay.
> >=20
>=20
> Yeah, the integer stuff are leftovers. I can also try to add more into the
> description.

That'd be great, thanks.

--sSckkexfIMYASZhR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWTS/AAKCRB4tDGHoIJi
0uuwAP4kjTrjXbUqkYAUovnUt/B2RFg6oZ4kGaG4G1wAsfZKqwD9E4mdinkpH6bj
TJpLbUTYSremMCno0sBVGAYoa51tvwA=
=eMK4
-----END PGP SIGNATURE-----

--sSckkexfIMYASZhR--
