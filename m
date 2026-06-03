Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF723E1695;
	Wed,  3 Jun 2026 16:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780502953; cv=none; b=lJ7Y2Min8uxfG1mGYD5MdisoP7UNdsQzVJ/TTOpOxteUqC1wuNnE74RmpssiDUIxDNB5TwKZwf+t6RTZ6f1EPsNU2lmhG1H7ee9MvFO6oKFSgQcxliWfju1LKlQkmaCoSMpvyEEg0xg3dsDHep9ajfT77NoLLpLQYh+qQW3HXHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780502953; c=relaxed/simple;
	bh=6qQIi4PERWYdCZONYjLeYqfVwfyVmBDCzpICxIiP164=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RT0xxp8n/x3ZT/aieAbwnHyfao03Jllo0RdEqE/aH2zCFLwFYpI0yGje6+bsZylNV7MM/anl9P2aMRzcb6sMcA1LR8AEkFpGxjOFZQKS/eHxqo1OeVGCe891C+XovppTMq5jgNNrbGkMuZR2bPQLlrhPJybIygOnol6k+SxInFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h1BvWgcO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h1BvWgcO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13DA91F00893;
	Wed,  3 Jun 2026 16:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780502952;
	bh=4/pU9fMPP8JL14qM3Pb2BBg4NSP65giNpbo1qkk12b4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h1BvWgcO2Ib8u4CxNHE6pt0GZUWlfZwOpaEbi068hrE6WElulUIhW9QZ63fmRLO5Y
	 CRGsQJq8VIx+GDOBn9Cx8VZRkFtgwhzhHf86K8qN2t4PKGcTNO0qhbpVXTSfe2zcYj
	 ZZ1ZJJ2DR6MQt0/LGtTXQVueAX0kEyZIYQJrTvBLmoQMmpL3WRgblUGpng1aAjuErp
	 FSwE0N1UaVir4fIaZ92Unzqf0G28/57I+SJCcw66gDfGApQ+0fksQRCT+E05UC3xWZ
	 7Ii14JV4gzAp1Pyxz0/E0NiXOsR8kDoUlj14QkT9ExOI8Vj/DYYDQPAXT/hrcL6DAw
	 x48bUupbbANfA==
Date: Wed, 3 Jun 2026 17:09:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Naresh Solanki <naresh.solanki@9elements.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Patrick Rudolph <patrick.rudolph@9elements.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: isl68137: Add RAA228234
 compatible
Message-ID: <20260603-deskwork-perch-ae4eaf92368f@spud>
References: <20260603110127.23930-1-naresh.solanki@9elements.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QeDkZfr0BVzojq6B"
Content-Disposition: inline
In-Reply-To: <20260603110127.23930-1-naresh.solanki@9elements.com>


--QeDkZfr0BVzojq6B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2026 at 11:01:26AM +0000, Naresh Solanki wrote:
> From: Patrick Rudolph <patrick.rudolph@9elements.com>
>=20
> Add the compatible string for the Renesas RAA228234 8-phase PWM
> controller, which shares the same PMBus interface as the RAA228228.

Given this, and what the driver change looks like, why is a fallback
compatible not used?

>=20
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> ---
>  Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.=
yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> index 8216cdf758d8..2988bc6300ae 100644
> --- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> @@ -55,6 +55,7 @@ properties:
>            - renesas,raa228004
>            - renesas,raa228006
>            - renesas,raa228228
> +          - renesas,raa228234
>            - renesas,raa228244
>            - renesas,raa228246
>            - renesas,raa229001
> --=20
> 2.43.0
>=20

--QeDkZfr0BVzojq6B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiBRpAAKCRB4tDGHoIJi
0sh6AQD8lGvpCpMc99IlWSLUlv3v6nzagQS+wdlQpGJkek58EQEA+CE4i6tJWSNg
NRNN9P0IfqlzWlfD3NsUZEz9VKb5mA0=
=W0gz
-----END PGP SIGNATURE-----

--QeDkZfr0BVzojq6B--
