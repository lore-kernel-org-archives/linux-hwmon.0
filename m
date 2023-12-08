Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A11120327;
	Fri,  8 Dec 2023 15:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uR4aYLxz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05F28C433C8;
	Fri,  8 Dec 2023 15:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702047983;
	bh=rxRMtllWNkL0CjKiOAHwkiWZrBIno2pyvADUXOndwAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uR4aYLxzEuSQWQ02ya3aKNE4hsTOV2Rut8TUh4to6KvWemYgfg24xu8J5go4Vl+Vl
	 JcO1oFKUoiN7MW18zZ0ikmZSw7dY2njCC586BBr42zHBi+TJIouGMZluYwCp+TQPxB
	 bBy/bLNyvBsXildL7uaXKCLqeL9mKwmwMUWA70X3fkqwRdMRs/6JI+00GzQQK8MPt3
	 Z/9X5kokMVkoCcCbilWFtjago8hgcSP3p5pwa0Ra55C6v2XQXICZ/ghZjEz/h7wCmU
	 JIH0GUPvbPI+v1gBWIpYzbTe7gyGJyoB1f6j4WqhgdoO2xphZdYzZXPJF0Y8Scs2RZ
	 /Fv30OwT+NaIQ==
Date: Fri, 8 Dec 2023 15:06:18 +0000
From: Conor Dooley <conor@kernel.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 4/5] dt-bindings: hwmon: Add Amphenol ChipCap 2
Message-ID: <20231208-freebase-headlock-9125c4ae6ce1@spud>
References: <20231020-topic-chipcap2-v3-0-5b3bb50a5f0b@gmail.com>
 <20231020-topic-chipcap2-v3-4-5b3bb50a5f0b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4aU2mKqCAe/AIpR/"
Content-Disposition: inline
In-Reply-To: <20231020-topic-chipcap2-v3-4-5b3bb50a5f0b@gmail.com>


--4aU2mKqCAe/AIpR/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 07, 2023 at 08:44:54PM +0100, Javier Carrasco wrote:
> Add device tree bindings and an example for the ChipCap 2 humidity
> and temperature sensor.
>=20
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.


--4aU2mKqCAe/AIpR/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXMw6gAKCRB4tDGHoIJi
0kunAQDl/6ji5ewuFJDegO/MbpUBGL9+a+JAYzdBR23V2icdxgD+IpA10/vOn5Lk
pE5W0DqzmbBhbQMOMsm0hPTuxbViBQU=
=LPfj
-----END PGP SIGNATURE-----

--4aU2mKqCAe/AIpR/--
