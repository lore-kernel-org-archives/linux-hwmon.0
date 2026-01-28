Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFD232939F;
	Wed, 28 Jan 2026 17:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769622678; cv=none; b=B3B/a8tZbGB18pepabSd/ZCUzz380l+n1xpx0ReJkUNxB0ilhPh5jojQLsUAsHOpSk3WimhQ6HNnb/lpe89LgxbPi0NaUpakH9KpC3aVLKZY7GCz/LdFgR8ioLJB4TIm1hdmWQr5AbkmvgcdvejFW5FT646kTgTqgI44Hp4amM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769622678; c=relaxed/simple;
	bh=OHriWR9VA6FaL+3cVrWjeH11sIcXfq7AuY35folvfdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R/tcJLfgao6pTytHUml8pS8USBDPK69mL11/TvbYVkp1CnClimxGiRrnmuiy31D+Pm4mlymk0gvUsT8lh3qOVVRnR+efy6o2GmDU0blM/d+zjsH4YvYmvA4I6eFtr9G0HCnsGY7iNXBd3c3igJvA1yH+gG5uPn3/v5wqhTbwoAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qFVStRz/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qFVStRz/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A07F6C4CEF1;
	Wed, 28 Jan 2026 17:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769622678;
	bh=OHriWR9VA6FaL+3cVrWjeH11sIcXfq7AuY35folvfdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qFVStRz/+mpgA60qjhb4H5qp5ytd8vEgzko7Vr4XlZShGkxVGyl3xdEeagcLKO7fG
	 cNPHrnW2EdXJ+WD04R4A4uZsLYUCoHAEOqwPCKoIu2E8mBCpdBEzi8VOrPoVds/7Ui
	 SOSYPo6OvxggsE3Y5uYaVR42rMOFEDqTyeFzYRJ9R7Sl2qZoUkxFJ5sDGv4WZSnXic
	 m3m6alVsmORPY8rDKieUbAAORxg7e9bU13vuRYTeBQZcJ183CKCAwz9NnpXlCrBRaB
	 9AWczriE+yGQnM6RKQtS3SFUrLbvDRzCPd5rhGVVfhkf9ozrYPgscZa9vVlWwMVd5g
	 8UJVJYAGWauYQ==
Date: Wed, 28 Jan 2026 17:51:13 +0000
From: Conor Dooley <conor@kernel.org>
To: hehuan1@eswincomputing.com
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, p.zabel@pengutronix.de,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com,
	luyulin@eswincomputing.com
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add Eswin EIC7700 PVT sensor
Message-ID: <20260128-amperage-handstand-36fa4b3ec447@spud>
References: <20260128101400.859-1-hehuan1@eswincomputing.com>
 <20260128101636.914-1-hehuan1@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tuUCN8TnH+eCuqa1"
Content-Disposition: inline
In-Reply-To: <20260128101636.914-1-hehuan1@eswincomputing.com>


--tuUCN8TnH+eCuqa1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 06:16:36PM +0800, hehuan1@eswincomputing.com wrote:
> From: Huan He <hehuan1@eswincomputing.com>
>=20
> Add device tree binding documentation for ESWIN EIC7700 Process, Voltage
> and Temperature sensor.
>=20
> The EIC7700 SoC integrates two PVT instances for monitoring SoC and DDR
> power domains respectively.
>=20
> Signed-off-by: Yulin Lu <luyulin@eswincomputing.com>
> Signed-off-by: Huan He <hehuan1@eswincomputing.com>
> ---
>  .../bindings/hwmon/eswin,eic7700-pvt.yaml     | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/eswin,eic7700=
-pvt.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.ya=
ml b/Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.yaml
> new file mode 100644
> index 000000000000..f4ba228924fe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/eswin,eic7700-pvt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ESWIN EIC7700 PVT Sensor
> +
> +maintainers:
> +  - Yulin Lu <luyulin@eswincomputing.com>
> +  - Huan He <hehuan1@eswincomputing.com>
> +
> +description:
> +  ESWIN EIC7700 SoC integrates embedded process, voltage and temperature
> +  sensors to monitor the internal SoC environment. The system includes t=
wo
> +  PVT sensor instances. The PVT0 monitors the main SoC power domain. The
> +  PVT1 sensor monitors the DDR core power domain.
> +
> +allOf:
> +  - $ref: /schemas/hwmon/hwmon-common.yaml#

FYI, including this is kinda pointless because you have the label
property defined below and your "additionalProperties: false" blocks
shunt-resistor-micro-ohms from being used.

> +
> +properties:
> +  compatible:
> +    const: eswin,eic7700-pvt
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  label:
> +    description:
> +      Human readable identifier used to distinguish between different PVT
> +      instances. Typically "pvt0" for SoC PVT sensor and "pvt1" for DDR
> +      core PVT sensor.
> +
> +  resets:
> +    maxItems: 1
> +
> +  '#thermal-sensor-cells':

> +    description: Thermal sensor cells if used for thermal sensoring.

You can drop this description if there's a resend, common properties
used in the obvious way don't need any more info.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

Cheers,
Conor.

> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +  - label
> +  - resets
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pvt@50b00000 {
> +      compatible =3D "eswin,eic7700-pvt";
> +      reg =3D <0x50b00000 0x10000>;
> +      clocks =3D <&clocks 244>;
> +      interrupts =3D <349>;
> +      interrupt-parent =3D <&plic>;
> +      label =3D "pvt0";
> +      resets =3D <&reset 111>;
> +      #thermal-sensor-cells =3D <0>;
> +    };
> +...
> --=20
> 2.25.1
>=20

--tuUCN8TnH+eCuqa1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXpMkQAKCRB4tDGHoIJi
0szCAQDN5UWNFzZVq7KK5Xh2IznQ6JZGtioDcPtFq7m3SlDUQAD+Lbn4YAlpt8oo
dUaVeT6HKcmDnXxe8U89/H3mDz4njQ4=
=VgJT
-----END PGP SIGNATURE-----

--tuUCN8TnH+eCuqa1--
