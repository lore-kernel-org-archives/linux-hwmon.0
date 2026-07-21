Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAC440B112;
	Tue, 21 Jul 2026 15:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784648782; cv=none; b=lQ301Nu5KO/rmawdhNcrSTGi/jUxZD6ELIZKCVGx6lxpfhK6tZbzaPJLxibNTY8CRge2K1xAwTOc2JD5f/WUXUmwruNGwa1GHaMxCmHWvUHvlfAH5x+fia7PJPCHPQ0n71v+JAmoZzQ465k5gsjpC9piuVWVcJBYkbdd9waAKZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784648782; c=relaxed/simple;
	bh=Uf5pEzCcqggScFMznE0AJEdNcsTic4s1MFH/4TOYnks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GXeEIfo2/LX8l1G0OHO/v6X7T121I5k+voNGb415nS0/OGIlUOmRpVMrVVRvakY90JhNvwPfz/0CufAWk0euB6VAtMhq9L0lt+hTDR8XpFP1upevXmMjrXB14ozeq5RUvemLu3SiTfFLp/JpjhLmhCSGfUXOMMuQSZ3a3qTgS4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KHjrHUfk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KHjrHUfk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90E4B1F000E9;
	Tue, 21 Jul 2026 15:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784648780;
	bh=qyvqI3FKItNNn+NSl40sfGAVdAD6Z9EAaM5p5OjFDvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KHjrHUfkgQ3Tch0hggGta8g4ZcwSXL29bYV79h1Vuoh0MJxlZSgv+AzdKZxx6s8rd
	 uMKKO4aLB6/S+WsS+loWRLJw2fB5/OQ9+xYvkCu+8FuBLnn2gwcHOjZhGrgJabdv14
	 +GDesQQjDjZ/EaP+MPFLnZNzFXjmbBn4YOFRm3yfYi1HA7fbrC1FyjmQlJqSohACGM
	 DWd1kUC4EjDA9zDOK7VM11wASduAwUMwxQG088znYu6uS2YKtrgoSouO3XJyMo4nqc
	 f3B7Vfa9t63k9132ohQKSss7uprLUXcM41XYpNtTBrSKVG4mXnB8rP7+yyHd7REypq
	 oXQeHUVmAC7RA==
Date: Tue, 21 Jul 2026 16:46:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 3/6] dt-bindings: hwmon: Add Sensylink CTF2301
Message-ID: <20260721-handbook-dancing-0c6805fbc94e@spud>
References: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
 <20260721-ctl2301-v2-3-ef5fb342872a@linux.dev>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+s1jSkmJwwBDoYeF"
Content-Disposition: inline
In-Reply-To: <20260721-ctl2301-v2-3-ef5fb342872a@linux.dev>

--+s1jSkmJwwBDoYeF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 02:48:29AM -0700, Troy Mitchell wrote:
> Add the Sensylink CTF2301 temperature sensor and fan controller to the
> LM63 family binding. The chip follows the LM63 register model and can
> provide a thermal cooling device when #cooling-cells is present.

Commit message should explain why a fallback compatible is not suitable.

pw-bot: changes-requested

Thanks,
Conor.

>=20
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
> ---
>  Documentation/devicetree/bindings/hwmon/national,lm63.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/national,lm63.yaml b=
/Documentation/devicetree/bindings/hwmon/national,lm63.yaml
> index 92b0094ff303..4a1ffebfdbef 100644
> --- a/Documentation/devicetree/bindings/hwmon/national,lm63.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/national,lm63.yaml
> @@ -12,7 +12,8 @@ maintainers:
>  description: |
>    The LM63 family provides local and remote temperature monitoring toget=
her
>    with fan speed monitoring and PWM fan control. Supported devices inclu=
de
> -  the National Semiconductor LM63, LM64 and LM96163.
> +  the National Semiconductor LM63, LM64 and LM96163, and the Sensylink
> +  CTF2301.
> =20
>  allOf:
>    - $ref: hwmon-common.yaml#
> @@ -23,6 +24,7 @@ properties:
>        - national,lm63
>        - national,lm64
>        - national,lm96163
> +      - sensylink,ctf2301
> =20
>    reg:
>      maxItems: 1
>=20
> --=20
> 2.55.0
>=20

--+s1jSkmJwwBDoYeF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCal+URwAKCRB4tDGHoIJi
0sguAP4/8GCUUUqjVudh2Yt2jdeHsUNXy8PqWvK/6mq9GnClgAEA10CrvsBJI2OD
37FQBfZ2wKxrlsiR8AoHkpIejBLmPgc=
=WK2c
-----END PGP SIGNATURE-----

--+s1jSkmJwwBDoYeF--
