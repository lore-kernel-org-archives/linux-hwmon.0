Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD973AF666;
	Mon,  7 Sep 2026 17:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788800462; cv=none; b=Wc7eQDc3AL9CGa53DleJHgVQ+7JmIbhEMoMkINTig/OdyB1e7AIV39xyLbv0wFXECnsHtq4g5xKhlXzmbC5aWKTyW3YR3oyNsHz7koyLenvu3nDZ2rf6yH5Lh/bM+UW6RpPVVh0Y2hIcskhOqerXulH4UjAkP/nPAeePv7WtSpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788800462; c=relaxed/simple;
	bh=jOI0MMEL4S/zjaXkNu4zzVrGq/jySwLqN8V+weesn9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PMJEc/cQD6R1lrPITxGWAbbxLCvVGEzziWhADALDgL1cr4AZygsDCkJe8zdvf2EdzIWmTitk8/G9tCsUZ1e4f+nzrdnz8k9nTb7rD21q8fF6JIy8mUyUgKHLVm2HgkL8hbHxFlWch5YM8agUsmo/lqJ2nHtmcVaoFMLlvbG51fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NPe5XElc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NPe5XElc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 189F51F00A3A;
	Mon,  7 Sep 2026 17:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788800460;
	bh=I9jSIjH9CKbeYfqhN91dl2AUmDzRgsURGsGitrqG3Dc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NPe5XElcSj+ognHvfyo4OgE2Ja+k3kb0mR/fp5nRxc5L5z0YMlHEjqagfsGWguq1q
	 LtOUFA1V+xG0gr6pcM/ZuQEyl1JVRL/lDWcf7ecABcd4BckfqHEP1BgHNrbrmD71X/
	 raOEsp8+shH0TKQoR1iMbgwtOfFfbUBg8YdPA1N4HO/9VOZoaVmSx/gA2rQJAAnrhv
	 14o6h64DccdmzxQSRj/Id6wfVU9KXztBdjGu9uXA2HDZ08CMOB88EifBKU09Sb4lFX
	 JWRTXv8uYQ+RPOAtuCJER3YN7Gb+9zfa3jaVzLYuE2lP4wM/oK/EoJLyP7MMOHD/Rj
	 LGbbIciQQO3kw==
Date: Mon, 7 Sep 2026 18:00:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Colin Huang <colin.huang2@amd.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Grant Peltier <grant.peltier.jg@renesas.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Colin Huang <u8813345@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: isl68137: Add Renesas
 RAA229639 and RAA229640
Message-ID: <20260907-chimp-pectin-20f4ea3b772c@spud>
References: <20260907-add-raa229639-and-raa229640-v1-0-8f7218cba85d@gmail.com>
 <20260907-add-raa229639-and-raa229640-v1-1-8f7218cba85d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HhmU8rXA8ylKId0C"
Content-Disposition: inline
In-Reply-To: <20260907-add-raa229639-and-raa229640-v1-1-8f7218cba85d@gmail.com>

--HhmU8rXA8ylKId0C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 07, 2026 at 03:03:29PM +0800, Colin Huang wrote:
> From: Colin Huang <u8813345@gmail.com>
>=20
> Add Device Tree compatible strings for Renesas RAA229639 and
> RAA229640 PMBus devices.

Driver change suggests fallback compatibles could be used.
Why aren't they? If they can be, add them. Otherwise, explain why not in
your commit message.

pw-bot: changes-requested

Thanks,
Conor.

>=20
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> ---
>  Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.=
yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> index 8216cdf758d8..3537c7ddfb09 100644
> --- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> @@ -60,6 +60,8 @@ properties:
>            - renesas,raa229001
>            - renesas,raa229004
>            - renesas,raa229621
> +          - renesas,raa229639
> +          - renesas,raa229640
> =20
>        - items:
>            - enum:
>=20
> --=20
> 2.34.1
>=20

--HhmU8rXA8ylKId0C
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCap7tyAAKCRB4tDGHoIJi
0vWkAQCjzsynPNmvqg+nOTSt1FNnUM8x5V6/1sDozQZ1xVIvbAEA86vBJiZ2H4Kf
9esT6FXoeTbv/n+YKzHxZw4wZHD1XQk=
=YQWN
-----END PGP SIGNATURE-----

--HhmU8rXA8ylKId0C--
