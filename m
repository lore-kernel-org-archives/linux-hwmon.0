Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCD0233941;
	Mon,  7 Sep 2026 17:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788800635; cv=none; b=JYDYJgNUpWHEB8SgKYq30paNTKM0A83vaUt7MMve+OHvGaIYQ5se+ChbmBU6Fsi54/g96gcsgEo+oDML2fnJ13hgDjO5/q4x3a5Ke5ajB7xE6HFNNrIorIFwZBMybQZp05BkvR3L334EpXC+8PrHfRACO/zmor9zCwQq+2Qq/Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788800635; c=relaxed/simple;
	bh=Xc49cuTW0kvx0+30mXiT7jEV6fIhnzvvb1e2UKa9cY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jimmc00bigwai2sBmbQcafDhTPVF8cC12c2UDxJO/+ughui/J6SPKMYBh5NqJdn4dEqwQK4Sar7StfaIGI2Z6AESG1nLx7RDaF5zI6x695gywL2HInT1ab7gH3wFYp7bextqymbq8CKRTSzI7IhoX+iZav7lnJ2RdY3cQqbox5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KHjSuIKd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KHjSuIKd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D17951F00A3A;
	Mon,  7 Sep 2026 17:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788800633;
	bh=Z2Pc137GIbdjSz4LrRiSmmEBkN9icDlM2chpH0bvPA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KHjSuIKdhJAIVr697AS09BJMkH4ztz2qXkyhdoCY8M79P4jcKM7P/C74nUgJTT11D
	 pZCfn0AEsvGxVoW4MCwJ/ATJ9Ob63qXGKrDEQMDEfSD+PcAi74GBmVZ0rOzvMVY7Lh
	 SWkUm3x1zhnVgQFzxF5PATQuFJkZ+nd/bN2iY+xcAjXs55Rsgp4w7rSUZMKCLnMEgr
	 e43aoSf0aIeVl9gnV1C2YPchuXkRSqug/PrFHRlDW9pDhFTtifgWshUqHbzouBBcEp
	 VqZpYGfGeP8NXZFFc01503maFS1y4JH3PXwLtOUJzOL0B6VEJDaXNfbMfo+HTW3HoM
	 u50AoJOxgtROg==
Date: Mon, 7 Sep 2026 18:03:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Colin Huang <colin.huang2@amd.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Colin Huang <u8813345@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: Add Infineon tda38740
 and tda38725
Message-ID: <20260907-kangaroo-ascend-d0541fbdc975@spud>
References: <20260907-add-tda38740-and-tda38725-v2-0-1d051d63aa01@gmail.com>
 <20260907-add-tda38740-and-tda38725-v2-1-1d051d63aa01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pHo79YEtLLqeokGw"
Content-Disposition: inline
In-Reply-To: <20260907-add-tda38740-and-tda38725-v2-1-1d051d63aa01@gmail.com>

--pHo79YEtLLqeokGw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 07, 2026 at 02:52:29PM +0800, Colin Huang wrote:
> From: Colin Huang <u8813345@gmail.com>
>=20
> Add devicetree bindings for the Infineon TDA38740 and TDA38725
> single-voltage synchronous buck regulators with PMBus interface.
>=20
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> ---
>  .../bindings/hwmon/pmbus/infineon,tda38740.yaml    | 82 ++++++++++++++++=
++++++
>  1 file changed, 82 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38=
740.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.=
yaml
> new file mode 100644
> index 000000000000..c9bf19902d3c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,tda38740.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Infineon TDA38740 and TDA38725 PMBus Synchronous Buck Regulator
> +
> +maintainers:
> +  - Colin Huang <u8813345@gmail.com>
> +
> +description: |
> +  The Infineon TDA38740/TDA38725 is a 40A/25A single-voltage synchronous
> +  buck regulator with a PMBus interface designed for industrial use.
> +
> +  Datasheet:
> +  https://www.infineon.com/row/public/documents/24/49/infineon-tda38740-=
tda38725-datasheet-en.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - infineon,tda38725
> +      - infineon,tda38740

If the programming model for these devices doesn't differ, one should
fall back to the other.

> +
> +  reg:
> +    maxItems: 1
> +
> +  infineon,vout-scale-micro:
> +    description: |
> +      Scaling factor applied to READ_VOUT telemetry.
> +
> +      TDA38740/25 pin strap parts are available in two flavors of
> +      VOUT_SCALE_LOOP: 1:1 and 1:2.
> +
> +      For the 1:1 VOUT_SCALE_LOOP version, output voltage sense pins are
> +      directly connected to the output, and no resistor divider is used.
> +
> +      For the 1:2 version, a resistor divider is typically used (for exa=
mple,
> +      499 ohms for both top and bottom resistors).
> +
> +      In some designs, users intentionally modify the feedback divider r=
atio
> +      to obtain an output voltage different from the internally configur=
ed
> +      VBOOT or VOUT value.
> +
> +      In such cases, the device telemetry (READ_VOUT) continues to report
> +      the internally programmed voltage and does not reflect the actual
> +      externally adjusted output voltage.
> +
> +      This property provides a multiplier to scale the reported telemetry
> +      value so that the monitoring system reflects the actual output vol=
tage.
> +
> +      The value shall be expressed in micro units where 1,000,000 repres=
ents
> +      a scaling factor of 1.0.
> +
> +      Example:
> +        If actual Vout =3D 0.75V and READ_VOUT reports 0.7V:
> +        scaling factor =3D 0.75 / 0.7 =3D 1.071
> +        value =3D 1071000
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 100000
> +    maximum: 2000000

This is not a required property, so you need a default.
pw-bot: changes-requested

Thanks,
Conor.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        sensor@40 {
> +            compatible =3D "infineon,tda38740";
> +            reg =3D <0x40>;
> +            infineon,vout-scale-micro =3D <1071000>;
> +        };
> +    };
> +
>=20
> --=20
> 2.34.1
>=20

--pHo79YEtLLqeokGw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCap7udQAKCRB4tDGHoIJi
0j/AAP0bbuUB0ZgTwUhc/dD9fsx8sIsLzIXbpyJAC9WPbtuvJAEAoc5yZCYOELB8
vCrVohmD7mc1sclfRm8Y5+X9AdTkuww=
=kvlv
-----END PGP SIGNATURE-----

--pHo79YEtLLqeokGw--
