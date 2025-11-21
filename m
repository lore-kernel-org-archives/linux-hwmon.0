Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08902882DB;
	Fri, 21 Nov 2025 18:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763749849; cv=none; b=cOh2u6ANtz16h1h3NwZAMktBHE6YE3ioImP6vP57fXMg3jW7w2pTLwJ25dG7z8QYSxPGUWTAFTUtYpl6MhNwQ1vevdy3HuKjxHOksdD0JxhOv+n5o1Gv0n/rTUUdP2ukW/c97wdDEMbtwKKl6zpRv4h323/mriXqs+YT3NVl4j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763749849; c=relaxed/simple;
	bh=fi9S8EfVoFHwQDOKdElhfKtB84IzNSnmcI8//1Lr9eE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hkN7mWX72kvWZ2FrtuYVfj22zwO3BFKxTxumV1UbOWMsXlsPUZfTqOrN3dWObq65YWfjE6TNP8KHW44veCGUk/k/AmvMQ+ZPOmkMGqBMvOfpdyIu6imLuiKnZDcPysY97dfs9j5jzqPgi0mwr21m7weMxoWCrwB47g2DSaj7giM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nrTwGmyq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nrTwGmyq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D0C1C4CEF1;
	Fri, 21 Nov 2025 18:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763749849;
	bh=fi9S8EfVoFHwQDOKdElhfKtB84IzNSnmcI8//1Lr9eE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nrTwGmyqCnrPG7MMfbGCTul3fvXsDQLFeZtq7G5UjpAM7RWOgUSJbutuSiIBGUBrF
	 tCYEedNkOLPCnr2awl+JvgcGendMn0bsuF8hAz0hEquGzyBMLncPejiq1gqr1gg0t5
	 i8L3RmQjlETFm/8XPSP8oSmzLWdrMJRK/72eGhvJod2Jk6ZLFCj6ljdBvJ8FJNdTdH
	 asz7JSuCnBbDr4dNBOKp4zq55viGjIRRjElOxumT7l6vJsHkJUrAV+en2XSGkdiqMk
	 dW2PfpIHZOjn6rx1Gg+u88Qeavuxe26t/9mrH1PjNg6WNI5PKYZdL7AmqqekIi44Wo
	 fFzOPVOKd2zSA==
Date: Fri, 21 Nov 2025 18:30:45 +0000
From: Conor Dooley <conor@kernel.org>
To: Marius Cristea <marius.cristea@microchip.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: temperature: add support for
 EMC1812
Message-ID: <20251121-swimmable-lining-9cde54c6ab47@spud>
References: <20251121-hw_mon-emc1812-v2-0-5b2070f8b778@microchip.com>
 <20251121-hw_mon-emc1812-v2-1-5b2070f8b778@microchip.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dutviNx2RnugnChe"
Content-Disposition: inline
In-Reply-To: <20251121-hw_mon-emc1812-v2-1-5b2070f8b778@microchip.com>


--dutviNx2RnugnChe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 10:48:54AM +0200, Marius Cristea wrote:
> This is the devicetree schema for Microchip EMC1812/13/14/15/33
> Multichannel Low-Voltage Remote Diode Sensor Family.
>=20
> EMC1812 has one external remote temperature monitoring channel.
> EMC1813 has two external remote temperature monitoring channels.
> EMC1814 has three external remote temperature monitoring channels and
> channels 2 and 3 supports anti parallel diode.
> EMC1815 has four external remote temperature monitoring channels and
> channels 1/2  and 3/4 supports anti parallel diode.
> EMC1833 has two external remote temperature monitoring channels and
> channels 1 and 2 supports anti parallel diode.
>=20
> Signed-off-by: Marius Cristea <marius.cristea@microchip.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--dutviNx2RnugnChe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSCv1QAKCRB4tDGHoIJi
0qvPAQCpauFh1MyKH0eUIZRrwP0dM0fsEdjvZI0mqtcJ5NznKgEAtavkj+JEmXJ6
5m6ZXfWiKtVSzC4yV94N2l3w/UvFPQw=
=MFkI
-----END PGP SIGNATURE-----

--dutviNx2RnugnChe--
