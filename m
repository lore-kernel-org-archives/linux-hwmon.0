Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DE63BE165;
	Tue,  7 Apr 2026 16:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775578814; cv=none; b=bvJGXhK1FXi9XI51x9puXCzY6rCnerv0X/mg2//d79l56N7p2/cIj7g7DdVCUZwSOM55BM9z8Lq0PM5RADDFsRGdv021pTAI9X2umGrSREYAeLR04jUQCioVb17cnxSLJ0I9btrQ5CbeXGLySLljocZvBV6zfDGB0As9tW1SCtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775578814; c=relaxed/simple;
	bh=qLSOcHPJ/LT9wr/fQ9H8JFrAuuvSRX/sEM3SKVjwVhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SfrmaT33oUzs6m8gqbz9pQYMZP0pFqYObLy7cwgNtUz+MjbospHINCLdIC9noh6hKtONsl9FQQWlHw2RgCseXw/vdPOusFIrlKjXf4haoddDViqrjf1Dlv14RO5hOuZb1IlZTPux+VfGYIy8BSuLZb6Rbo6IUn/5UL6cWk0Yd9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VvyR4JRo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VvyR4JRo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23D1DC19424;
	Tue,  7 Apr 2026 16:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775578814;
	bh=qLSOcHPJ/LT9wr/fQ9H8JFrAuuvSRX/sEM3SKVjwVhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VvyR4JRo8MP4XchgDZHkJK+xhrdJ4hJYSqFvsIrTb5kCbMSAtxiFit6EDSYddduhg
	 2NCBwHFOB6mQxYMlXQnHWMl2JiltkZr2WsWAS6lLCvH4bJIZiVRt5jr/BKZjNzk34V
	 ppOEFAO6dQbzUIGirFM3NHLksT7sQiG0JLCNjYg0/uY+fqe6F3CctUkcSimBM08k90
	 yalf2rPk7mmMbXyYMuFAbp0ATMRlKqs8GosBv/U4LI1J023vXANHTsr1+wOBbQyqBJ
	 lyOuiDTddfC5CWSLyFQOzh3PGjqG9z2M8jXOB1K/am86iDxJWuvk/Rd5WPpSq29sCt
	 Pv5pBmqtDiWYg==
Date: Tue, 7 Apr 2026 17:20:08 +0100
From: Conor Dooley <conor@kernel.org>
To: florin.leotescu@oss.nxp.com
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, viorel.suman@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
Subject: Re: [PATCH v6 2/3] dt-bindings: hwmon: emc2305: Add
 fan-shutdown-percent property
Message-ID: <20260407-slang-scoff-795164352c62@spud>
References: <20260402122514.1811737-1-florin.leotescu@oss.nxp.com>
 <20260402122514.1811737-3-florin.leotescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DeEoZ3LUzOVpm+Wq"
Content-Disposition: inline
In-Reply-To: <20260402122514.1811737-3-florin.leotescu@oss.nxp.com>


--DeEoZ3LUzOVpm+Wq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 02, 2026 at 03:25:13PM +0300, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
>=20
> The EMC2305 fan controller supports multiple independent PWM fan
> outputs. Some systems require fans to enter a defined safe state
> during system shutdown or reboot handoff, until firmware or the next
> boot stage reconfigures the controller.
>=20
> Add an optional "fan-shutdown-percent" property to fan child nodes
> allowing the PWM duty cycle applied during shutdown to be configured
> per fan output.
>=20
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--DeEoZ3LUzOVpm+Wq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCadUuuAAKCRB4tDGHoIJi
0vYKAQDc8PmGvn+SYQyxj/xBCFto2oQSVCh4pi6grWFMzYdABQD+PBeWK1D/8di9
FKOw6IBmOzagSoiKXzLj6NnQuvX6EQI=
=QQhM
-----END PGP SIGNATURE-----

--DeEoZ3LUzOVpm+Wq--
