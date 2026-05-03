Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEE81D5160;
	Sun,  3 May 2026 18:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777831362; cv=none; b=hFE6TfkTPKWJH7Fpq9jMYt8eJcwBSiN0/l1oqbEzz4JpvcESa/EZpiLZzK89uelHqJhTQk69eNOgqrjEbjudh6W2KbsYxEyUqgl2hFnYqr3sHRM0wvwNpQGMgLsbw+SXhkChow0YBcDLrM/qx7JF7b7H4/afGFyyRpm7Vay4zqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777831362; c=relaxed/simple;
	bh=ulntF4mPLFHXb/9wMY7GY0e4NFEKhqLcWDtK6LuQaZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QkjxSTg34DCo6ahtW5v2YFDKljuiasuzZabNckNtgE8WDFDihbNZD2kLuI6rFujmXG5nICJlIxfa1oyIzVv7urfvZXxh2raJilGkuFWyGarN+q9rC2KWFv1EccPNye/1ZwudQ3WEErNodvrlTot+R635eLfZUJfroUKnuK+UFik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o/WNooOC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o/WNooOC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53C2BC2BCB4;
	Sun,  3 May 2026 18:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777831362;
	bh=ulntF4mPLFHXb/9wMY7GY0e4NFEKhqLcWDtK6LuQaZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o/WNooOC93pLcv9NHBGE/uh5hsLEtzHlW4fYo4YGzLvIe2sT5SOQ0B9GV949LK5aY
	 cM/6E5t7uvLsmiLu40iwldkf/VG+BY1yOkmQwxApOADtXLy1TNuMBmnPytfG8p0+Ca
	 Q2E9QwLZnp1BtvEUycYooOh9gfoqy6shVLTW/2nM1Y4HSVRQEgCVthp7zpaPAY44TK
	 euG+efWkg362daE+hwv70RJgGYKY6/GV5rtHZX66m8DCG0RfwDZH6smVb9Y5ZDnU36
	 k4hBCvEpX9rB1gnHbK8SjzjdwZjFwjibtk86KOfGbB2/DN4St3XyfKm2JWKS1b1J9W
	 5jH4Is151a1wA==
Date: Sun, 3 May 2026 19:02:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Markus Stockhausen <markus.stockhausen@gmx.de>
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, jdelvare@suse.com, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: lm75: Add
 lm75,alert-polarity-active-high property
Message-ID: <20260503-punisher-friend-08a942437954@spud>
References: <20260501120518.3085501-1-markus.stockhausen@gmx.de>
 <20260501120518.3085501-2-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gRT99R7m+UNpv6DB"
Content-Disposition: inline
In-Reply-To: <20260501120518.3085501-2-markus.stockhausen@gmx.de>


--gRT99R7m+UNpv6DB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 01, 2026 at 02:05:17PM +0200, Markus Stockhausen wrote:
> The LM75 alert pin is asserted based on the value of alert polarity bit of
> the configuration register. The device/driver default is 0 which means al=
ert
> pin is configured to be active-low. A value of 1 maps to inverted (active=
-high).
>=20
> Add an optional boolean property "lm75,alert-polarity-active-high" to
> override the alert pin polarity. When absent, the default active-low
> polarity is kept.
>=20
> Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
> ---
>  Documentation/devicetree/bindings/hwmon/lm75.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/lm75.yaml b/Document=
ation/devicetree/bindings/hwmon/lm75.yaml
> index 0b9fda81e3ec..173751a726f3 100644
> --- a/Documentation/devicetree/bindings/hwmon/lm75.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/lm75.yaml
> @@ -54,6 +54,13 @@ properties:
>    interrupts:
>      maxItems: 1
> =20
> +  lm75,alert-polarity-active-high:

This should be "national" or "adi" as a prefix, lm75 isn't a vendor!

Otherwise, seems reasonable enough to me.

pw-bot: changes-requested

Cheers,
Conor.

> +    description: Alert pin is asserted based on the value of alert polar=
ity
> +      bit of configuration register. Default value is normal (0 which ma=
ps to
> +      active-low). The other value is inverted (1 which maps to active-h=
igh).
> +      Specify this property to set the alert polarity to active-high.
> +    $ref: /schemas/types.yaml#/definitions/flag
> +
>  required:
>    - compatible
>    - reg
> --=20
> 2.54.0
>=20

--gRT99R7m+UNpv6DB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafeNvgAKCRB4tDGHoIJi
0h7OAQCnqXDyL2cs9BRUcbngjv09iDFLi0EXYmnva80Ce9y0QgEAnWOoZlVV7XDn
FuSel+wQiNb/aYES38V4n6ia3QVI7wc=
=0/hP
-----END PGP SIGNATURE-----

--gRT99R7m+UNpv6DB--
