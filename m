Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F305A2EDD78;
	Mon,  8 Jun 2026 17:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780939102; cv=none; b=M9cJEHFemA9c4E3afXJ1r/qFBS6m8ak52YnOrqwHvofjP6Wy9LTNs75Lf9bFKLNRsRZahvzv6jAyF3zDBTqCdxq9KSDtQ9bSJDT//JGh7zU5hWYGVjXVulEZHx19k5y4ai1bHnaRQiqvXB3qVrh1fif69nMfWTM4c816SDwnVgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780939102; c=relaxed/simple;
	bh=HsPxXKGj6/qBN1ecCgR3oVnbOmSy/EFX1ZklFlG/Gp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TFndVTUQlIPaggWRIC7m558ec3ffWr7JWheTMtFhJCISaxu3K4Bekm2a+4EjL0IzBGv8Jy5xWYFZt1p7utJ9T89nShsrPO/tr+ePYzHegf1BEGKO9o0TW5dVRXNtr8pt33m2c2xxwPsK4uyyvyCvlenOmfpXwT1I80u542N85Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A7DmLsWb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A7DmLsWb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D47511F00893;
	Mon,  8 Jun 2026 17:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780939101;
	bh=HsPxXKGj6/qBN1ecCgR3oVnbOmSy/EFX1ZklFlG/Gp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A7DmLsWbZ0+Yj1yo54XuIuzqxxgR1pIm3K4l6yC/t28NXl7szH7p7hLlktqpwZEd4
	 pWnJyhUPoauFvActSK5raKmsDBBdXlo7VKyKb27IjfWRmK+wOUjykJ+xuVNt8wJ5eN
	 EWIBh0K1ZWNNEY8HmJn0ntRzrUWX4niAWKmGvQ5AzmAmGR13++Fevcp2wHZHp/okTv
	 bmN0QBkhNP8FOgqqvlY+NOaV7h5mPKyuSU1dXazSpyVCkdopH82+s/lRY0kFCbwXQ7
	 T4KUpv7pH2AE1KBO/7dCRI19yLVslvA6H8wSj0Fw+c/Zp+YWJBQ5av9FP77YOsHt5i
	 8TCpkUGQ2cjlQ==
Date: Mon, 8 Jun 2026 18:18:17 +0100
From: Conor Dooley <conor@kernel.org>
To: ASHISH YADAV <ashishyadav78@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon/pmbus: Add Infineon xdp730
Message-ID: <20260608-scariness-tingly-5464a7dc00f5@spud>
References: <20260608061544.5613-1-Ashish.Yadav@infineon.com>
 <20260608061544.5613-2-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EOOfmi8a/teAP9vw"
Content-Disposition: inline
In-Reply-To: <20260608061544.5613-2-Ashish.Yadav@infineon.com>


--EOOfmi8a/teAP9vw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--EOOfmi8a/teAP9vw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaib5WQAKCRB4tDGHoIJi
0p7JAQC6NLApEpmNK4Nr7Y+yIh2gW3U3bGlw14cnwgKk6Jj9SgEAzUrHOkVyPrwZ
H0MkKZoeS9QAxcBfCd1mcwog7c74rQA=
=6vdU
-----END PGP SIGNATURE-----

--EOOfmi8a/teAP9vw--
