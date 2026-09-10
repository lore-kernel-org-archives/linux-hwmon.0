Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76CF46F48B;
	Thu, 10 Sep 2026 11:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789039471; cv=none; b=qrssgC93tqdy4lrPPsdGjMm2kt9m+KbDXZBXpWE09p0h88wNSCqVfSbA07aJN32/1db0AtN1JMna23mC9IYthuj76iFz+4DuANabKF7F5rFHFJzNmDTnhJfPFPbOmgt87iTVK8yYP8FgBLtpTOa9nd9ZXyfI6i8mxTnlkbaXuBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789039471; c=relaxed/simple;
	bh=U53K/s0RMCyYoc+aEK0RfYTAbGFsVsgjGR3vSMzJ3tU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lzEHVWCFypp5Dir32Rk73q2fxkhlze6RXqM1h4Jleptzo/HxyDxu/6x4XGD+9JTyz5Lv8jFxl3BILnOG3aJ29zfvokSP+TASIbS2ePLD0v6NTEsiBnGjqEouCTkgWr9QKi3IYIQGONG5KsbfLVghnjdYPfabUvoSBjNAyf9WHJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j2ZXxYMr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j2ZXxYMr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 989A81F00893;
	Thu, 10 Sep 2026 11:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789039469;
	bh=K1k3o3/J6R/KX1MVXsWRSnNHFxeXun8U/5rv0FODWwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j2ZXxYMreCA/KzXhZz1Wt3I28btbeEFVrRjPV26A8Aw9UZ3BghAhEJxp9Nb0KiXk6
	 k64iHz2ANAE6e71uVeZcP/Ck2CG8kn38rW8mFCHovbxtvNy4GPFc9irLshM8IYgRN9
	 6QQ1d4as02MH8jEP99AjpeYL3Drp9AEBF2SeVyo+8f1l1H87ALoX/wjzooV5Yvik53
	 MBuVY/LU6nDTovNpN96vzRTJ9aha5ktvmTObVVm++NOckUPmv9wxrzpE30BKs9l9/+
	 ESNI3ST2YnvGB45Mo9Rq7KU+D83qSwydsGZCnpS6Bdq6LffbI4rpHTVMrzHzCd7/VC
	 38yB1OOec8TeA==
Date: Thu, 10 Sep 2026 12:24:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Colin Huang <colin.huang2@amd.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Colin Huang <u8813345@gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: pmbus: Add Infineon tda38740
 and tda38725
Message-ID: <aqKTZCPto32Ur-CI@squawk>
References: <20260910-add-tda38740-and-tda38725-v3-0-3e87637da3d6@gmail.com>
 <20260910-add-tda38740-and-tda38725-v3-1-3e87637da3d6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MTvoOTKg1w0CtIdx"
Content-Disposition: inline
In-Reply-To: <20260910-add-tda38740-and-tda38725-v3-1-3e87637da3d6@gmail.com>

--MTvoOTKg1w0CtIdx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 02:18:55PM +0800, Colin Huang wrote:
> From: Colin Huang <u8813345@gmail.com>
>=20
> Add devicetree bindings for the Infineon TDA38740 and TDA38725
> single-voltage synchronous buck regulators with PMBus interface.
>=20
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> ---
>  .../bindings/hwmon/pmbus/infineon,tda38740.yaml    | 87 ++++++++++++++++=
++++++
>  1 file changed, 87 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38=
740.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.=
yaml
> new file mode 100644
> index 000000000000..28e6ff9d9d9c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.yaml
> @@ -0,0 +1,87 @@
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
> +    oneOf:
> +      - const: infineon,tda38740
> +      - const: infineon,tda38725
> +    description: |
> +      The Infineon TDA38740 and TDA38725 share the same PMBus programming
> +      model. Use infineon,tda38740 as the preferred compatible string;
> +      infineon,tda38725 is kept as a compatibility alias.

This is not how this should be done. Instead, tda38725 should list
tda38740 as a fallback compatible. Take a look at the example schema for
how this can be done.
Otherwise, this looks okay to me.

pw-bot: changes-requested

Thanks,
Conor.

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
> +    default: 1000000
> +    minimum: 100000
> +    maximum: 2000000
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

--MTvoOTKg1w0CtIdx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqKTZAAKCRB4tDGHoIJi
0uLzAQCdFK45hCT4Cg0De/UHstM132es62S2wjB1mAuE3A/RowD/RfYWwCzGmrze
CX3dPAce7mNZeQIym60Ia8RfYpwubwY=
=uDIT
-----END PGP SIGNATURE-----

--MTvoOTKg1w0CtIdx--
