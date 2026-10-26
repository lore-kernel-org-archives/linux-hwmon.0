Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793041279;
	b=Ll/yNB7LPntcdLLkqqcGJSn0BUljRJZp4th+C8grhZQGBcg3PAKUghUU9/VrKaWaOLf7
	 RjohR1RgW38CM8TP6T2jZC+B0COadP1drLD7R0RP9Fzct9UcK9zmJ9fkve+mGxAEjJu9s
	 1AevlIfS2mPXVabaXtFTKieqkIYNz3VR5m3lNL0D0GVBduqpER1APTM3kyMWnfFqmERso
	 dHlqkLR9GjMq8sTwHY6L8XI/AAaVqOfL4NZW+Cm5jihcZaTtmMGsAjSFP2ylGsm/dHdMD
	 tFnKqErQF+QMAAF0+7VyGc0qmoPTAaW9zCM0UxVhsoCIAPwyas2LWrAxwcEnMiS0dUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793041279;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=A4PemadTeQbjsJohAGGihDgo5G3CzFHovhD53Y0Q1zc=;
	b=1ErA4rRTD9EIb0GBBCRO+v3bir1hO+WJMaHBkHF4r2jhtHok8667ru5kedIKIOdkhFPB
	 K1I0la1cRCDTrRtBs2O2+2wBK1WXHogk0C/uMEaqq5+J+wtAJmJ2c2p7toyHum7Rf4QhN
	 7qre5t06f4vU534/EJe+od31r4ckLCbFmd6ULLpzFQPcGVNn1wbaraSzC0ToaihhW0OKk
	 WUHVdieB08JzkuDupGrk2Mlg99nBEW1FoNXLZBIhBT4KqrBnTklYvqxbDubmGT4BYULEm
	 6kolSLYb0kkmOq/NqPivbqhFItKxyKeQTNAfJeeBOCUGhp6HNR7UEbeBxUYtSA74sgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="i4/ZjJE1";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B87C606A31A;
	Mon, 26 Oct 2026 19:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i4/ZjJE1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0F201F01825;
	Mon, 26 Oct 2026 19:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793041279;
	bh=A4PemadTeQbjsJohAGGihDgo5G3CzFHovhD53Y0Q1zc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i4/ZjJE16Zzyzk5Ycvc93WT/OHTOJ4SUiMgRPiOd0EY/0QW907P95QixeMqCDFtP1
	 8CF63P36Nd8yTS12r5JPUe6Db2XqBv5mowOtbZGkBEodf6Zw5EjZeDYMdUX0z50qFE
	 /ndk4Mh+kjhnWw75/QJ0Xveix/ADMopMdzwx8+5O8EXB3OXoxOPy/uvH8zfMEYwZxd
	 Z30foh/Agz2DvQnMiDy7qfRQrmQGcCzh8uRFGgayewLQpmqZ/GDyVY2dlJCkgsEub5
	 OJE+VMFAYa/JtXQ4P0eNvtLAv0sYC2Ve3IvGfV4r1JG95LdCnZiL/NAqihrpN/ZyKv
	 kuQ/Nwc9xxAgw==
Date: Mon, 26 Oct 2026 19:01:14 +0000
From: Conor Dooley <conor@kernel.org>
To: Carlos Jones Jr <carlosjr.jones@analog.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: max20830: Add MAX20810,
 MAX20815, LTM4739, LTM4740
Message-ID: <20261026-skinny-enchanted-df8dfdccebe9@spud>
References: <20261026050241.100428-1-carlosjr.jones@analog.com>
 <20261026050241.100428-2-carlosjr.jones@analog.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FrUjqUpTkpC+AgxC"
Content-Disposition: inline
In-Reply-To: <20261026050241.100428-2-carlosjr.jones@analog.com>

--FrUjqUpTkpC+AgxC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--FrUjqUpTkpC+AgxC
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCat+jdwAKCRB4tDGHoIJi
0n3lAQCKYxNkjvfVhlQnnBw80d4CjFatsIa9vO42t/gXeqdVuAD/fr1FpQ9Va2/j
3N+U9x1Axk70Ml1ZvLnY5P2b05/fhwk=
=Ra3M
-----END PGP SIGNATURE-----

--FrUjqUpTkpC+AgxC--
