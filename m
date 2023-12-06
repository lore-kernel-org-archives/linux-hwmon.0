Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AA83DBBC;
	Wed,  6 Dec 2023 15:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hB0+DXoy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08782C433C8;
	Wed,  6 Dec 2023 15:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701877289;
	bh=Uv8b+EwMtwJvMdfrPZdZ0AgVz/8itxAOt+skCzPWAIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hB0+DXoyAPXGeE5NqAPSHP0yqeelHdgj73jAwCnh6L8msEZco1WvyF8zme077/FvN
	 yEHv2cEhn4UwjMD4b01vuIkYLb97o13SSMvQXJSk0thkT2cPyVi9nIBqS38oSkiRE7
	 Sd08aV0X/FdkYpG0/x0+zekyJS8fe7FzhBmhoqvgtXCXrF07yUiTjpXaY1GqY5sZ2N
	 Y1AzFg7mKOL/jDyeUKtWSVsXxCaPsQhdMpHH3fBFmw6B2subP5uAVDXu3xOde3AxAM
	 gR+Qz9LjLWwG0bwrUN7gYaMNtmoRwXdKYehPgbL/5OqwskQ2pqx4srqMTkBWtqMKE6
	 Si0FFSv0ZvUfg==
Date: Wed, 6 Dec 2023 15:41:24 +0000
From: Conor Dooley <conor@kernel.org>
To: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
Cc: nuno.sa@analog.com, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: Add LTC4282 bindings
Message-ID: <20231206-reference-litigator-eb7c466222a3@spud>
References: <20231205-ltc4282-support-v3-0-e0877b281bc2@analog.com>
 <20231205-ltc4282-support-v3-1-e0877b281bc2@analog.com>
 <20231205-cognitive-propose-aa71278f65ea@spud>
 <92aeaa124adf7e678f9ef1750b353fe9d11f8909.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s9iPQ469fKQZnoy/"
Content-Disposition: inline
In-Reply-To: <92aeaa124adf7e678f9ef1750b353fe9d11f8909.camel@gmail.com>


--s9iPQ469fKQZnoy/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 06, 2023 at 09:38:11AM +0100, Nuno S=E1 wrote:
> On Tue, 2023-12-05 at 16:18 +0000, Conor Dooley wrote:
> > On Tue, Dec 05, 2023 at 04:22:55PM +0100, Nuno Sa via B4 Relay wrote:
> >=20
> > > +=A0 adi,overvoltage-dividers:
> > > +=A0=A0=A0 description: |
> > > +=A0=A0=A0=A0=A0 Select which dividers to use for VDD Overvoltage det=
ection. Note that
> > > +=A0=A0=A0=A0=A0 when the internal dividers are used the threshold is=
 referenced to VDD.
> > > +=A0=A0=A0=A0=A0 The percentages in the datasheet are misleading sinc=
e the actual values
> > > +=A0=A0=A0=A0=A0 to look for are in the "Absolute Maximum Ratings" ta=
ble in the
> > > +=A0=A0=A0=A0=A0 "Comparator Inputs" section. In there there's a line=
 for each of the 5%,
> > > +=A0=A0=A0=A0=A0 10% and 15% settings with the actual min, typical an=
d max tolerances.
> > > +=A0=A0=A0 $ref: /schemas/types.yaml#/definitions/string
> > > +=A0=A0=A0 enum: [external, vdd_5_percent, vdd_10_percent, vdd_15_per=
cent]
> > > +
> > > +=A0 adi,undervoltage-dividers:
> > > +=A0=A0=A0 description: |
> > > +=A0=A0=A0=A0=A0 Select which dividers to use for VDD Overvoltage det=
ection. Note that
> > > +=A0=A0=A0=A0=A0 when the internal dividers are used the threshold is=
 referenced to VDD.
> > > +=A0=A0=A0=A0=A0 The percentages in the datasheet are misleading sinc=
e the actual values
> > > +=A0=A0=A0=A0=A0 to look for are in the "Absolute Maximum Ratings" ta=
ble in the
> > > +=A0=A0=A0=A0=A0 "Comparator Inputs" section. In there there's a line=
 for each of the 5%,
> > > +=A0=A0=A0=A0=A0 10% and 15% settings with the actual min, typical an=
d max tolerances.
> > > +=A0=A0=A0 $ref: /schemas/types.yaml#/definitions/string
> > > +=A0=A0=A0 enum: [external, vdd_5_percent, vdd_10_percent, vdd_15_per=
cent]
> >=20
> > > +=A0 adi,gpio1-mode:
> > > +=A0=A0=A0 description: Defines the function of the Pin. It can indic=
ate that power is
> > > +=A0=A0=A0=A0=A0 good (PULL the pin low when power is not good) or th=
at power is bad (Go
> > > +=A0=A0=A0=A0=A0 into high-z when power is not good).
> > > +=A0=A0=A0 $ref: /schemas/types.yaml#/definitions/string
> > > +=A0=A0=A0 enum: [power_bad, power_good]
> > > +
> > > +=A0 adi,gpio2-mode:
> > > +=A0=A0=A0 description: Defines the function of the Pin. It can be se=
t as the input for
> > > +=A0=A0=A0=A0=A0 the ADC or indicating that the MOSFET is in stress (=
dissipating power).
> > > +=A0=A0=A0 $ref: /schemas/types.yaml#/definitions/string
> > > +=A0=A0=A0 enum: [adc_input, stress_fet]
> >=20
> > None of these properties have a default nor are required.
> > What happens when they are omitted?
> >=20
>=20
> Yeah, they get the power on reset default values (or whatever is in eepro=
m but that's
> not the typical usecase). I'll add a default for all these properties. Yo=
ur question
> already made me realize something I need to fix for v4. For some reason, =
I thought
> gpio3 was the default pin to be muxed into the ADC (and hence monitored b=
y hwmon) but
> I realized that gpio2 is the default one. Hence, I need a boolean propert=
y to allow
> for users to mux gpio3 instead of gpio2.

:+1: patch should be good to go then IMO with those defaults added and
the mux one fixed.

Thanks,
Conor.

--s9iPQ469fKQZnoy/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXCWJAAKCRB4tDGHoIJi
0iy7AQDlbLpqU0xbjnJVhrmJIKxpmhs40HeLz0LxacxpaCytWAD8Dq6mYWlGLajz
uJt7xdmFpf1v61NEz7qhRpOseP4cagk=
=3D/+
-----END PGP SIGNATURE-----

--s9iPQ469fKQZnoy/--
