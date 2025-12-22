Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FCC283FC5;
	Mon, 22 Dec 2025 12:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766407023; cv=none; b=ZYkU32zjPngfMNfNATpfR+ofLqijlw4Ir94V8ouSEAUL4dbD1Tzhkc1h6KDO9VLih6wdbWxZ5Q4Bh9B6XgKUTMFayZdMxLpb+wIXd6Bk8yJKYbVoAj/D8yFURC8j3FK71tgWZGB6zPz5kaAM1CiJ/7NolOAzmIXzdfuIps09UKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766407023; c=relaxed/simple;
	bh=JizgybxxUWC/2HrnoU2NhswkyZVW++LprQBKnIr4rxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GosN0rVfI046/C9Ki7mb837ETsF9OEjrVoVfTuVoU/07eSx464HMbLl1ciJ1J24QDavdjcnn7AxOppLxDjgm0P7dxVD6r9dvrea/0Re0nlOE/4+TRTa757RHXhog9bIA6wnT3+rRn3W9gR4Jlgf/Fo+RPp1KrGmrJ3VvLA2vXHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uBrCgH0q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uBrCgH0q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 214E5C4CEF1;
	Mon, 22 Dec 2025 12:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766407023;
	bh=JizgybxxUWC/2HrnoU2NhswkyZVW++LprQBKnIr4rxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uBrCgH0qZLBqLYpsYyOuU95D2K9qf3eP95kd/XRP6tKebUo8jgOmyMgnwparGoA1V
	 lWb8jc9OMqNS2loinlJgn8khUiWjBZT4fWEHAux0h9xzuOZ4oaBUDuuQ4M57JtjETR
	 FDCm4o+N9j3T8OIbzAR4Wn/NYTinOHeX7p+c/A5GieZL4nX8qVASrFw6vA2/Lg0uWg
	 vWZmzUaMI7t0L6JM9xfrPsdcNLAuBef/tb1OPlccS9UX3x9u8AEcXOifhmnEm1R0L5
	 NYyzImQEjNa9jHwa5XAl6wOcPk7i7DI1CCAhDj6D3MMmNrUZWvHA5Ayh5mN0WXMh2a
	 yvDVSFsDUB7zw==
Date: Mon, 22 Dec 2025 12:36:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: regulator: Add TI TPS65185
Message-ID: <f316a771-14f7-4ce9-aa45-c9494e641c1e@sirena.org.uk>
References: <20251222-tps65185-submit-v1-0-34986b504d5f@kemnade.info>
 <20251222-tps65185-submit-v1-1-34986b504d5f@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WRJulVs+j+cHwkrq"
Content-Disposition: inline
In-Reply-To: <20251222-tps65185-submit-v1-1-34986b504d5f@kemnade.info>
X-Cookie: Be different: conform.


--WRJulVs+j+cHwkrq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 22, 2025 at 01:18:30PM +0100, Andreas Kemnade wrote:
> Document the TPS65185. GPIO names are same as in the datasheet except for
> the PWRUP pad which is described as "enable". That pin is optional because
> the rising edge corresponds to setting one register bit and falling edge
> to another register bit.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

> +required:
> +  - compatible
> +  - reg
> +  - pg-gpios

Unless the device can operate without power the supplies should be
required.

--WRJulVs+j+cHwkrq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlJO2kACgkQJNaLcl1U
h9ApnAf+Nqo0yHYwxatVkYtMdcrKFnak4l5lGUWZ8TlakR7I6gVZ5IBE1duUF9sk
JUIvHFk2KzCaASA09E7xB7ZvLN68w5eSEIu6POaYMmJ+3wRHslxdMn1UtegCkZje
QjYiS+0rXmCHp5+uCfZwEbjROQvpzPLiqra5+FFRuVyVw3dp+3B9SfeHYIcXAYdx
oModelxFdoH9XtRLbClfA1XxBMAY9UYlgRl0dwGa7yqi/jKCnsC/ga1vCfel/B3m
Azq9uNDKEYzVsSDGXorKWCLQMCiBpVR8NDncpY8/NZeMImgkThK/OYHqwpPp4e2J
MKy6qj2iy/LV03yvsP5J0BvdjEvkYQ==
=V+Tv
-----END PGP SIGNATURE-----

--WRJulVs+j+cHwkrq--
