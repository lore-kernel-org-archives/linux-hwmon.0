Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF8A83CDF;
	Wed, 21 Feb 2024 19:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708542279; cv=none; b=uSHiqUvbv4iJiCsV6kmTVb6WOXGYm9SWNQNR2GwtleqLkn0ckndlhohoOMRcO9clYPT90BAMA8wTJeQtoC/qMLFjAbZFdfZoarDozTwsHOjHPp9X09kTyp/x+Lc6CYlwLkZUFDcy6dkdyDJ6iifOxjla/MaNMno/JSP8/qcwVx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708542279; c=relaxed/simple;
	bh=NJr0kU4HKd9Cq5dTKxpS+QwQd1RVnuBn72URxt0AwCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gMKJeFDnw6A0LFye8XaGiVYKB7IYE/uMI0LjrYZ9YyNP6HQDoxzpqL2qi4qYx3welU8MQroJv51Jo3QTFBovLJ6rJc2KpZnl0x52WgeCv8fxJPTeazWfYM9KWP228Xd763FbIM9zTR+yFqVidnOEnNtrWebwJ5ZuKdrFllHrw1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jRYPf2p1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jRYPf2p1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07104C433C7;
	Wed, 21 Feb 2024 19:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708542278;
	bh=NJr0kU4HKd9Cq5dTKxpS+QwQd1RVnuBn72URxt0AwCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jRYPf2p1tJeQLUMXYTaypEyvaqBBZWQmXCMhlz1/QnRdZznHmPSVZhdu8LgmmygrR
	 GqmkWycomOB+8/QB6T4cSOcRfYSIhMsvCT8TgAxhR+ksxI9vXoYCfxC4Si+HC6110w
	 uBeqeB4mUZ1eW4Uw/dlvOn0hbgtStNKfyE65l1f3Cy7vJFuu8ofJYyKzNEIVTgnpVe
	 vs/cMdDskjIuKbFQ6Kofhv1VDfkAN8BNmSMr+LYeULq5f6IEbW8w6/4jfyEnkIG38Y
	 BYbZO9Wabb6uSs9kSl2Ne8hAilKOmQZe8c/kAzpmNGsVWpvvlBYXX+m+hFOR2ZHrZu
	 dUslM4cJgD8MQ==
Date: Wed, 21 Feb 2024 19:04:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH] dt-bindings: hwmon: nuvoton,nct6775: Add compatible
 value for NCT6799
Message-ID: <20240221-profound-static-6a027433f3b1@spud>
References: <20240221155158.2234898-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kQlp8ugGV5PK/iEO"
Content-Disposition: inline
In-Reply-To: <20240221155158.2234898-1-linux@roeck-us.net>


--kQlp8ugGV5PK/iEO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 07:51:58AM -0800, Guenter Roeck wrote:
> While NCT6799 is mostly compatible to NCT6798, it needs a separate
> compatible entry because it is not completely compatible and does
> require chip specific code in the driver.
>=20
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml=
 b/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
> index 358b262431fc..e3db642878d4 100644
> --- a/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
> @@ -25,6 +25,7 @@ properties:
>        - nuvoton,nct6796
>        - nuvoton,nct6797
>        - nuvoton,nct6798
> +      - nuvoton,nct6799
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.39.2
>=20

--kQlp8ugGV5PK/iEO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZdZJQgAKCRB4tDGHoIJi
0u83AP41nrxwD6RprpM4m8EkrzvmoWcDp7un159ipgYova/QhQEA6Il8rLcecH7f
cu5how/Rq4vFVXEKZXF9KN3ItEigCAY=
=7e1D
-----END PGP SIGNATURE-----

--kQlp8ugGV5PK/iEO--
