Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171144F5E0E;
	Fri,  2 Oct 2026 16:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790959829; cv=none; b=UkDpZ+ii2Ax6jcGQW0mkwnsbCFW/z725cI6DWWcf1Y2raUuBLCAwwsa5wxLCifLZd0UWpe5d41R7RP/UrQ35Ge2P/mERpu5hd7NUwEbGrmcvUxSfjhxzYScGqEPfswPX4KP3luzyyxar8erR0A+6AtFTdd8z55QrbYgTeghgas0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790959829; c=relaxed/simple;
	bh=Z9zcJfhMa0RGK4NVc8xt2yN0MtPkIGJizqi2W5GkIak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jYiq4OBGo2ImbtLLHX2N2GMBC/cLXtNM57ICxJDhKoe5krCogQq1b4sBTOCvMJvaT/fxNqlv88tSOXIHDs40m3BReUnza5DZioXELxrrJkumqanXt8NFNAcgCzWwytAA7VwPoNvp1Xl2Gnjp0Fe+t2eDiTNL2OrspHYBnULrr7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a8gEhDem; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a8gEhDem"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 967931F000FF;
	Fri,  2 Oct 2026 16:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790959827;
	bh=WOrVLyJVbzL68G3iEiuiCyrTSIScmG6y9DIzNL2ARrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a8gEhDemAniylm3Wlqkfr37ZO8r6r+3vl+qEeXXaagXxiVeBmu5yCJGmL3SljCjKM
	 jd3clJugde7tmaOb1matnS6KgAaDbURAxcMhae19jVJTr4Ygb3KurMo6RBfXxyyeo+
	 U+SD6AJMBbd+m6xaTHII9eYaQC4pGa+XlMfU+zJgsPK8K65q1rP2B3gbYgD4bUlewu
	 V4DGzVDQDlidrTSwfFKpUJwNPkYexVUf/97KIP7+LWW9M41AaiIhPlTcGXfQzJArGP
	 W26QO0P0iw8CBAfmi8BLqLrIXYVraO8Zkre3G8RIDY9V1hFvsFnt3YaZxQXWpyzXyZ
	 d6IuXsO78/UJw==
Date: Fri, 2 Oct 2026 17:50:23 +0100
From: Conor Dooley <conor@kernel.org>
To: vjardin@free.fr
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Charles Hsu <ythsu0511@gmail.com>,
	Eduardo Valentin <eduval@amazon.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: hwmon: pmbus: mps,mpq8785: add
 #thermal-sensor-cells
Message-ID: <20261002-granny-rule-95201e8e36f3@spud>
References: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-0-bfafba9fcc95@free.fr>
 <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-2-bfafba9fcc95@free.fr>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IZZiyIQL10OCGfhS"
Content-Disposition: inline
In-Reply-To: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-2-bfafba9fcc95@free.fr>

--IZZiyIQL10OCGfhS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2026 at 11:47:40PM +0200, Vincent Jardin via B4 Relay wrote:
> From: Vincent Jardin <vjardin@free.fr>
>=20
> Each device of this binding has a single temperature sensor: the
> internal sensor of its die, which the device also uses for its
> over-temperature protection. It is read over PMBus with
> READ_TEMPERATURE_1 (8Dh). The sensor is internal, not an input:
> none of these devices has a pin for an external temperature sensor.
>=20
> Allow a thermal zone to use the device as its sensor, to monitor the
> regulator's temperature. With a single sensor per device, no cell is
> needed.
>=20
> The MPM82504 has four channels, each with its own PMBus address set by
> its own ADDR pin, so each channel is described by its own node.
>=20
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> ---
>  Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.ya=
ml b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> index d7a32fb3b7af..6257a8030e53 100644
> --- a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> @@ -34,6 +34,9 @@ properties:
>      maximum: 4095
>      default: 706
> =20
> +  "#thermal-sensor-cells":
> +    const: 0
> +
>  required:
>    - compatible
>    - reg
>=20
> --=20
> 2.43.0
>=20
>=20

--IZZiyIQL10OCGfhS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar/gzwAKCRB4tDGHoIJi
0mzTAPkBN9E0oiqpmBGWuuhoi0lSSF2am+ddBOBwpTndKZz8twD+Mk6Sat7T0mDu
wC5A0wfAjAcmXWUOF43ZYER3fNfbUwE=
=ixlA
-----END PGP SIGNATURE-----

--IZZiyIQL10OCGfhS--
