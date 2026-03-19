Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B94B3ED5AC;
	Thu, 19 Mar 2026 16:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773939331; cv=none; b=Auxe0ekOe28Hqm3i87ZQyxtHa+yy/1s2s7zXEaa15KXl8jfOst1js+XLQ7a048ddca0h1t+mld2eDPQVXavbVOiZmH3fGQmonk1d4K1GjrZDGQ2i0Xd/5XAnS2CyemLJ+KuqaBYz0ZKGX+/ZH93JZ8/xqXqQh0c/IOiiw+Imf8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773939331; c=relaxed/simple;
	bh=M2SBBNV5aKTGPPzCrrx50PyGmFS9nxiImbbU0ZNYNGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BFDdXhVpwYu4TSQX1XRetFl8j3eszL1eG/PiOmzuLKFD2kJ8kvalE9r/y00ZbORPt2KEu958XkGvl5nO0QcPG9GHaNcwkfrAuJXLxJtHQdyn5JauCRNTVluoD1OmBn/YhYWkxicGeYaB0U57ueFy7+8l6DDTUj6W1l0iWigZUzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mBI+koqG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mBI+koqG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71E44C19425;
	Thu, 19 Mar 2026 16:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773939331;
	bh=M2SBBNV5aKTGPPzCrrx50PyGmFS9nxiImbbU0ZNYNGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mBI+koqG61T/KphSEnJ3BUrMX1uJmjHDSDHajPSRnjIUStpRAAnYpleaIC7X8hFQR
	 Hi61v9TJiWcea+hKfS3P/1iND0Kl+fC3odgqx4NWTnaDWmjmx3S2UD5aarDPHL84qJ
	 JUG2rUg+KbJmUH7k6k5svVYtrqOUfcryK356llc3zVzw2Gmlk4raEVxUUA/uxyngHr
	 cUFNM/a81JNn8raunT/sshkKIya+yWgi4sb22I75JGVFZ/jCM3X1yCCd8Z1AJ8YMPn
	 KEA4/VYxwSjsPWAJ/pI7mlcp6WibPQj1miTfHr77bOfFzNE60/EcyQR8q9UB0M1IOP
	 MzzGlwOhOwUKA==
Date: Thu, 19 Mar 2026 16:55:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add GXCAS Technology
Message-ID: <20260319-starboard-decent-059a83babb19@spud>
References: <1773920314-17755-1-git-send-email-zaixiang.xu.dev@gmail.com>
 <1773920314-17755-2-git-send-email-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LFmX4B17aUj1/g9f"
Content-Disposition: inline
In-Reply-To: <1773920314-17755-2-git-send-email-zaixiang.xu.dev@gmail.com>


--LFmX4B17aUj1/g9f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 07:38:32PM +0800, Zaixiang Xu wrote:
> Add vendor prefix for Beijing Galaxy-CAS Technology Co., Ltd. (GXCAS).

Worth citing that gxcas comes from their website:
https://www.gxcas.com/en/index.html

With that,
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: changes-requested

>=20
> Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index ee7fd3cfe203..354836eb8e72 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -676,6 +676,8 @@ patternProperties:
>      description: Gateworks Corporation
>                   use "gateworks" vendor prefix
>      deprecated: true
> +  "^gxcas,.*":
> +    description: Beijing Galaxy-CAS Technology Co., Ltd.
>    "^hannstar,.*":
>      description: HannStar Display Corporation
>    "^haochuangyi,.*":
> --=20
> 2.34.1
>=20

--LFmX4B17aUj1/g9f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabwqfwAKCRB4tDGHoIJi
0r8gAQDBLYWZiS6P1c6wBWa+7WFzFkM+1X/9JL8s39YSlhefkgEA++7+8rY4edEL
5etJLz3B1dvtUZJnAifjdq2Qz8SAhAs=
=wfm3
-----END PGP SIGNATURE-----

--LFmX4B17aUj1/g9f--
