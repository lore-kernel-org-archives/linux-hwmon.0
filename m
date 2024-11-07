Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C18DDBE;
	Thu,  7 Nov 2024 17:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731000270; cv=none; b=I3gGPhaRfncLBCVxdNluAvxdw5fAglv9myfm6M7R4uTGBBbCqQnoUVj39srs6e6SbANbdxdEuMl3EHOkPB+QtPGsJvT0D3DiCODcUmjiRDyxpbL7MKz3L0xvSkZfCbV46cClbDiWspKp/DUO6qfKrDnM91GlFDPzhlrArci/J3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731000270; c=relaxed/simple;
	bh=9jYdA9WdY6+zR7BA/ctc1BsYzyCsgu4a3s6Nj9xnw9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7y2HrwHYevTu+oD5G7tKvadhenxN1cyxtmPYZiLrYr3BdBJpKOEC0R2+igtPyoqU/nNSYXG8nKotM7oB1ZaBIegNf/ZzvkXhrFYKn1tLaIEzIlCbH3m7Qx5fP+yz+6l+TdyjGeQfcQOh1JQucqMTu6PUe8qpahgyf3o+LK65ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vF9zVZn9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vF9zVZn9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30752C4CECC;
	Thu,  7 Nov 2024 17:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731000269;
	bh=9jYdA9WdY6+zR7BA/ctc1BsYzyCsgu4a3s6Nj9xnw9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vF9zVZn9mSTAy6aPZEhP1K+5Y5N1CfIM7c54XV8A8NpO/4x6zordS3joNYIkkXMfv
	 A1jSQHc1Z76a0EP1aPpKyEzT25RdGvdAJCBxUO7ZFaEhPQgcxpoLgM00+sbfosbw3l
	 jPA7wI9EGfJpi30kQT3dij6CnVzSzIJ3Zo6qqfQG2xWAthDgP/RpKHFgH+nGeRNGyR
	 EaBIMy6aphg4txaB7LdLzEAy/iruynv4beghrJOx1Qz6xES1yN/h1hCZDF57HRPv9R
	 FTppYI2eozitJqClkYBeotCtvfh4HCbw7BqiXtM8TIcQdN/YvdW6onPD+caTH5iwsF
	 icwINBYbPB3SA==
Date: Thu, 7 Nov 2024 17:24:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: linux-hwmon@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: pwm-fan: Document start from
 stopped state properties
Message-ID: <20241107-skirmish-paparazzi-dbde65870267@spud>
References: <20241106185925.223736-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Yej4ON283G7ccAAm"
Content-Disposition: inline
In-Reply-To: <20241106185925.223736-1-marex@denx.de>


--Yej4ON283G7ccAAm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 06, 2024 at 07:59:04PM +0100, Marek Vasut wrote:
> Delta AFC0612DB-F00 fan has to be set to at least 30% PWM duty cycle
> to spin up from a stopped state, and can be afterward throttled down to
> lower PWM duty cycle. Introduce support for operating such fans which
> need to start at higher PWM duty cycle first and can slow down next.
>=20
> Document two new DT properties, "fan-stop-to-start-percent" and
> "fan-stop-to-start-usec". The former describes the minimum percent
> of fan RPM at which it will surely spin up from stopped state. This
> value can be found in the fan datasheet and can be converted to PWM
> duty cycle easily. The "fan-stop-to-start-usec" describes the minimum
> time in microseconds for which the fan has to be set to stopped state
> start RPM for the fan to surely spin up.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Yej4ON283G7ccAAm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyz3yQAKCRB4tDGHoIJi
0mj9AQD6zLs1dv6ul0S/L8bIA2WEpv3ENOa94fobfkbsunB33gD/W/Wa7cJpicN4
nRIrCwFisLvNJGWVmONo30KB+0hlxQI=
=FiRR
-----END PGP SIGNATURE-----

--Yej4ON283G7ccAAm--
