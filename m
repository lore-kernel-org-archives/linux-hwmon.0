Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450E423E33D;
	Sun,  3 May 2026 18:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777831985; cv=none; b=F5S3BCIqns241rVYT7Ezdikk//HX1zNO0l+JDG+JMEJFRG7fY1srf7ZjI5iMVxphyT4+ifrh8+KvuEar+el4ptn9SdsqeqomkuX6GhoZK0jyq7TmbLwRVgH3IhikyHhQHqt/adInuCT5n1vAoQMuCCepkh53wmgb57JF4J4OBxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777831985; c=relaxed/simple;
	bh=6klYnKC4RXHOdJ3ZuuclrwuTvOEpiEC/KlJrZ4KodOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CBO7ViCgcLYpqjcv9VACu5WD98Nm3/1Zf04bWz7y2LuDxNNWCkxqUjSm9RxCraeNnkKPrCVA/MAf6ih3kBn5fqvilcU4qIkkDn2rtUtF1O5tGtGtxBdAeJrQWY0BC5YOkayyg0PJCt93EeY+rZ3s7qy1EyWIwxb5hlPwOtr/1F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PgMBReOV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PgMBReOV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE02C2BCB4;
	Sun,  3 May 2026 18:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777831985;
	bh=6klYnKC4RXHOdJ3ZuuclrwuTvOEpiEC/KlJrZ4KodOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PgMBReOVIQqxZTLgYWJyxf+rLTn2fDZeQbxZHAYeMzS6Ece6sF/iExepd0VJyAi2U
	 wPT9CqaMrcD1oH57ZGu4tLb4V3L8Gbr7wwRrKeYoYyIVaMy1mAAElXI4QHsmYWkETF
	 YjvsQNAqZ/Ru7myxJWUoAnqXsRa9gyp5Dql6i7tNF9lLyb8tA3sqhTbq/2RG69MRrj
	 WM+V+cjJmIhfqqWbH/CIbI9ZDMaQto5RsALldjiMyhVsZ5HMliottF/6TvOwiAwIA9
	 YpaxX+g+CdpI0H6LLWgzk0M5g9EFE7QCTOkRerBYnCy/5Blai1ITaKpxQrSheZJ7H6
	 yN13oFVERHO8w==
Date: Sun, 3 May 2026 19:13:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Markus Stockhausen <markus.stockhausen@gmx.de>
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, jdelvare@suse.com, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: lm75: Add
 ti,alert-polarity-active-high property
Message-ID: <20260503-ravioli-spirits-476c1d1152bc@spud>
References: <20260502190408.3577731-1-markus.stockhausen@gmx.de>
 <20260502190408.3577731-2-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j1lCQ+r1Alurczau"
Content-Disposition: inline
In-Reply-To: <20260502190408.3577731-2-markus.stockhausen@gmx.de>


--j1lCQ+r1Alurczau
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 02, 2026 at 09:04:07PM +0200, Markus Stockhausen wrote:
> The LM75 alert pin is asserted based on the value of alert polarity bit of
> the configuration register. The device/driver default is 0 which means al=
ert
> pin is configured to be active-low. A value of 1 maps to inverted (active=
-high).
>=20
> Add an optional boolean property "ti,alert-polarity-active-high" to
> override the alert pin polarity. When absent, the default active-low
> polarity is kept.
>=20
> Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--j1lCQ+r1Alurczau
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafeQLQAKCRB4tDGHoIJi
0rpEAP4gNXB8UozmLy3fgcBpQiGh/JAciUwbwkxxC0VcQs5YNgD/QnYoL4m6kQCc
Gqxznm5rGlmKbwLRwepqpawknoK50wc=
=LHJW
-----END PGP SIGNATURE-----

--j1lCQ+r1Alurczau--
