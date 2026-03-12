Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE803FE646;
	Thu, 12 Mar 2026 17:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773337076; cv=none; b=r4E+YYct6ET42FBe7YwBs8iZxsxL9HZOoTic86qXiEnA/WoIkFQ/fjuNJ6tIZZEf4QN6NpKTWSWqtXgbZYdAKB96WMnfggW9Sgh0k5o6ubhSkeY8Fyl4Q4QooQXFOFThzklPfeoymTpB50PU46Wcik5tp5ntjigs10EP0HM07Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773337076; c=relaxed/simple;
	bh=aFQX/mwVXIQpPQX7qxE0nuMOaK4qcK/SeR4LGJuFsa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LbNXwss0sM1Pm7epOEarWnYCaAYCAQV9tnH/PInodP/Oaq/xVfO2hoji/3+7V9wmX7Etbyli0USO+wy3kcNsV1V87eJrvzVsX8zsaxUo2pDEBgVYjTIEeJWFqRGxC9unkPqXYG3gvLviFUUmpDkn4+WFxQY0DRQLOFW22L+nT/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ff4qP7P0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ff4qP7P0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1704C4CEF7;
	Thu, 12 Mar 2026 17:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773337076;
	bh=aFQX/mwVXIQpPQX7qxE0nuMOaK4qcK/SeR4LGJuFsa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ff4qP7P0InVUnBUhM3Vtq96wZ0ILUUgkGrxZYHaddnDcFs6PP+8gyhTAdIIQHPk2Y
	 bOfSGdMdcc2cBbuQ1gxKzvzr5buWAShjm7rNFD+OvKTMrfvtiTh58eoQjFMc6UksGQ
	 6zzbiroo7h6rEQLex6MVQrAvRvw10XGGSbYCdRFNCe5ixJdrzrfagC7rKEuIvs9Umd
	 g/k72i7MWJ+/ClO8ORAOF7wiAw9nYo+oC9RiMeYljmAL/vq+NvPZzSSyBDxHdAFgKE
	 l31FhuKTIMQ1Yw6UGKNFZfHhTNYdEkMlfRmpiagxyWcWqUt28APqTDRU5v/lENzIFo
	 se6GtOW65l5aQ==
Date: Thu, 12 Mar 2026 17:37:51 +0000
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
Subject: Re: [RFC PATCH v2 1/2] dt-bindings: hwmon: emc2305: Add
 fan-shutdown-percent property
Message-ID: <20260312-triage-shallot-1b3d9f07d250@spud>
References: <20260312122248.1281572-1-florin.leotescu@oss.nxp.com>
 <20260312122248.1281572-2-florin.leotescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oDbvumbCQdRDhubR"
Content-Disposition: inline
In-Reply-To: <20260312122248.1281572-2-florin.leotescu@oss.nxp.com>


--oDbvumbCQdRDhubR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 02:22:47PM +0200, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
>=20
> The EMC2305 fan controller supports multiple independent PWM fan
> outputs. Some systems require fans to enter a defined safe state
> during system shutdown or reboot handoff, until firmware or the next
> boot stage reconfigures the controller.
>=20
> Add an optional "fan-shutdown-percent" property to fan child nodes
> allowing the shutdown fan speed to be configured per fan output.
>=20
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> ---
>  .../devicetree/bindings/hwmon/microchip,emc2305.yaml      | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.ya=
ml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> index d3f06ebc19fa..7bcadfab9fc4 100644
> --- a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> @@ -54,6 +54,12 @@ patternProperties:
>            The fan number used to determine the associated PWM channel.
>          maxItems: 1
> =20
> +      fan-shutdown-percent:
> +        description:
> +          Fan RPM in percent set during shutdown.

This sounds like something generic, that other devices might need and
should be in fan-common.yaml?

> +        minimum: 0
> +        maximum: 100
> +
>      required:
>        - reg
> =20
> @@ -80,12 +86,14 @@ examples:
>              fan@0 {
>                  reg =3D <0x0>;
>                  pwms =3D <&fan_controller 26000 PWM_POLARITY_INVERTED 1>;
> +                fan-shutdown-percent =3D <100>;
>                  #cooling-cells =3D <2>;
>              };
> =20
>              fan@1 {
>                  reg =3D <0x1>;
>                  pwms =3D <&fan_controller 26000 0 1>;
> +                fan-shutdown-percent =3D <50>;
>                  #cooling-cells =3D <2>;
>              };
> =20
> --=20
> 2.34.1
>=20

--oDbvumbCQdRDhubR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabL57wAKCRB4tDGHoIJi
0noHAP9z/fCiq8hV4ZCCK6xJrtd6hvHbeRv80Hgr1bMapjuwoAD/QTtp9v/Ab3J9
3q1keEgHBJviuIq0kTxW0wHKYbkL+g0=
=Y6RW
-----END PGP SIGNATURE-----

--oDbvumbCQdRDhubR--
