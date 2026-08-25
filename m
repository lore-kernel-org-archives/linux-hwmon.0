Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B00637CD2C;
	Tue, 25 Aug 2026 16:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787677140; cv=none; b=SdilOVRHcsPZ4oiZ2VvAtt/YPKNGNsbPejH4DbDaPdZ2NOT7yZlAjUhh8XCIZwiRDrabQBRcUdDnHx+aZpozRRVy4jV3X9xaV9G/vx9GRdTVen29h5PzQIdq3s4C+eAEn40gs1bfbbOuHh+R8XNp5zksv+CXNRQtoTYvzkxpDMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787677140; c=relaxed/simple;
	bh=pIjoEkPTCdDS4o3ecBCBRPRxdAzs4X9VyF3THM3KFhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V1f2de+YXZVyEfSbHo4utilRYBdZ8UV8d+T+leOFEmRRQpr01AKjCJyjmWUDMJqthl1k1Xo24CAqOxohn7KIhV8G6kBPp+aYQyFpIT536rr0uh/REgFinpHQ81J3R8PnxYmNCXomXUZDKrH2ST6zvuuerR2oH1Z99+bBptMrAv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=irNlAnkQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="irNlAnkQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94FE71F000E9;
	Tue, 25 Aug 2026 16:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787677139;
	bh=SoUKIpShsXgeE+dawkrCHb0RtrpeuMsGXBGtr8nYd2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=irNlAnkQfMsFNr0/Wd4Ceg40cU5P2HLohFklKtYyH/SS/tjidGXv7d24JPMr98MSc
	 W4CwmpbzGzJmIj0zSFYTZGUAqtBovlgm2TbAoYcv5cYm7Fox9dJRH5EvipfePPR4Zh
	 u5MyJ5Eb0y5VXmkyOecz2XTHErIGIH9o6f0+kx64cdDfTK1FdXPeMpMyUXQfyECYJX
	 DXp+IQV5yjoV8c0/fmAfQmeiOGaqeC5rq76PjUH6dO6hu5/vOcqbDJbp4OCZk6e038
	 MFwux94Lm02xe6I96Cwiy/p57XgMw52bOnSGukIU458RiTb+afqfzzyrCqYvEyAdcB
	 OznlJO/CRe7LA==
Date: Tue, 25 Aug 2026 17:58:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: national,lm90: Fix channel
 constraints for temperature offset
Message-ID: <20260825-iciness-unsavory-a13f2bf0f2d9@spud>
References: <20260824183900.8983-1-flaviu.nistor@gmail.com>
 <20260824183900.8983-2-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fKeMsBHyzBZsUZpE"
Content-Disposition: inline
In-Reply-To: <20260824183900.8983-2-flaviu.nistor@gmail.com>

--fKeMsBHyzBZsUZpE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 09:38:59PM +0300, Flaviu Nistor wrote:
> Limit temperature-offset-millicelsius to remote channels only, since
> channel 0 is local and this property does not apply to it.
> Channel 2 is only valid on devices with two remote sensors, so reject
> channel 2 for compatibles that do not support a second remote channel.
>=20
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
> ---
>  .../bindings/hwmon/national,lm90.yaml         | 29 +++++++++++++++++--
>  1 file changed, 26 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b=
/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> index 164068ba069d..a7f82b202b86 100644
> --- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> @@ -113,6 +113,29 @@ allOf:
>        properties:
>          ti,extended-range-enable: false
> =20
> +  - patternProperties:
> +      "channel@0":
> +        type: object
> +        properties:
> +          temperature-offset-millicelsius: false

Instead of this, could the two if/then blocks below grow an else with
this instead? What you've got here is a bit abnormal.

Cheers,
Conor.

> +
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - adi,adt7481
> +                - dallas,max6695
> +                - dallas,max6696
> +    then:
> +      patternProperties:
> +        "^channel@[0-1]$":
> +          properties:
> +            reg:
> +              enum: [0, 1]
> +        "channel@2": false
> +
>    - if:
>        properties:
>          compatible:
> @@ -149,7 +172,7 @@ allOf:
>                - onnn,nct1008
>      then:
>        patternProperties:
> -        "^channel@([0-2])$":
> +        "^channel@([1-2])$":
>            properties:
>              temperature-offset-millicelsius:
>                maximum: 127750
> @@ -172,7 +195,7 @@ allOf:
>                - winbond,w83l771
>      then:
>        patternProperties:
> -        "^channel@([0-2])$":
> +        "^channel@([1-2])$":
>            properties:
>              temperature-offset-millicelsius:
>                maximum: 127875
> @@ -186,7 +209,7 @@ allOf:
>                - ti,tmp461
>      then:
>        patternProperties:
> -        "^channel@([0-2])$":
> +        "^channel@([1-2])$":
>            properties:
>              temperature-offset-millicelsius:
>                maximum: 127937
> --=20
> 2.34.1
>=20

--fKeMsBHyzBZsUZpE
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCao3JzwAKCRB4tDGHoIJi
0krJAQDiEUUUrM6+fTmT8SMRPXUg/rHRMv6V3Zr7hQ5y/PXFNgEA67cfFszTtB39
NVD7cVVh3L7XXon9MnLTiNgCg9vDqwo=
=6LE8
-----END PGP SIGNATURE-----

--fKeMsBHyzBZsUZpE--
