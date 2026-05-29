Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5580D3ED3A7;
	Fri, 29 May 2026 16:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780072897; cv=none; b=BdleL+7+7e+RhwebVKjWd4hQ8p65CQNbSsYDxN6sJQN+BcccoU3MM71uixisBQDZh83jEMHAHyBjqyCijNKctrA191NH0UaZ0KumNuAPASW0svQa4zKvSvAa01ZlHIWtXtLt9XRWeqURgUUD/fhbJIUMgnjDZDCBxLEagey+sNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780072897; c=relaxed/simple;
	bh=AXVBY2iT07f3f2JA5peWqgTcCEO+GcWGJhiMkvuU/SY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZVk+j5UtfRx5w4FvlGjYT2Rv7kTWk8HkfSV6WYnbFXiikX8khOU1vU3f7t0055Nkxbjs++eslwfthF3syuqI8cQ38CUAf5mjcZzkMimGZGDwl37FymbhPFWadipJ8YcmDusnw0vV62/XpM+n5RThUib5K3xUUBVwAkvKuSkzyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b2W9J7Vx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b2W9J7Vx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 235771F00893;
	Fri, 29 May 2026 16:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780072895;
	bh=49KrXDR1ILqUktozc7Qa5FEeoJQsP+kH07MiBeiTsZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b2W9J7VxuPOnbjlo+YqmNA+VtRxBPSrTzoLs3agLoJFdh65vHAZehcHfvbP3DetWQ
	 RPIruMwbfzRGaH4YpqRMCwEdwAR8NBSiummWMrF33fzZpNX1x3gOi0lTKbFNQI3EFX
	 1LjHgtEvx4vLJ6p0sa26lF8WlgEb2rfzFmISKjGCdojfRcnvR1nKNU6roEFZyb7QQu
	 ZWTXRhSMrgDf1M/mmPJwuVJsVLc+Wauv8BkWWS3cydl+xHrkvIBVuzqDjAtqS8creI
	 o2CFLD4PBsiCznktYh2To6LIA1tbw3f1ctlMojdYhuAH4jrEE5iQjpiaTAh59eTr0m
	 3nVxv1Tq97qTA==
Date: Fri, 29 May 2026 17:41:32 +0100
From: Conor Dooley <conor@kernel.org>
To: ASHISH YADAV <ashishyadav78@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon/pmbus: Add Infineon
 XDP720/XDP730
Message-ID: <20260529-partake-myself-baa76ed4e279@spud>
References: <20260529054218.5184-1-Ashish.Yadav@infineon.com>
 <20260529054218.5184-2-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hg6KsFQl9Tz6Qhdk"
Content-Disposition: inline
In-Reply-To: <20260529054218.5184-2-Ashish.Yadav@infineon.com>


--hg6KsFQl9Tz6Qhdk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 11:12:17AM +0530, ASHISH YADAV wrote:
> From: Ashish Yadav <ashish.yadav@infineon.com>
>=20
> Add documentation for the device tree binding of the XDP720/XDP730
> eFuse Controllers.
>=20
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
> ---
>  .../bindings/hwmon/pmbus/infineon,xdp720.yaml | 59 --------------
>  .../bindings/hwmon/pmbus/infineon,xdp730.yaml | 80 +++++++++++++++++++

This rename just bloats out the diff, no thanks. Please do not do this,
certainly not without a justification.
pw-bot: changes-requested

Thanks,
Conor.

>  2 files changed, 80 insertions(+), 59 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineo=
n,xdp720.yaml
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineo=
n,xdp730.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp72=
0.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml
> deleted file mode 100644
> index 72bc3a5e7139..000000000000
> --- a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -%YAML 1.2
> ----
> -
> -$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,xdp720.yaml#
> -$schema: http://devicetree.org/meta-schemas/core.yaml#
> -
> -title: Infineon XDP720 Digital eFuse Controller
> -
> -maintainers:
> -  - Ashish Yadav <ashish.yadav@infineon.com>
> -
> -description: |
> -  The XDP720 is an eFuse with integrated current sensor and digital
> -  controller. It provides accurate system telemetry (V, I, P, T) and
> -  reports analog current at the IMON pin for post-processing.
> -
> -  Datasheet:
> -     https://www.infineon.com/assets/row/public/documents/24/49/infineon=
-xdp720-001-datasheet-en.pdf
> -
> -properties:
> -  compatible:
> -    enum:
> -      - infineon,xdp720
> -
> -  reg:
> -    maxItems: 1
> -
> -  infineon,rimon-micro-ohms:
> -    description:
> -      The value of the RIMON resistor, in micro ohms, required to enable
> -      the system overcurrent protection.
> -
> -  vdd-vin-supply:
> -    description:
> -      Supply for the VDD_VIN pin (pin 9), the IC controller power supply.
> -      Typically connected to the input bus (VIN) through a 100 ohm / 100=
 nF
> -      RC filter.
> -
> -required:
> -  - compatible
> -  - reg
> -  - vdd-vin-supply
> -
> -additionalProperties: false
> -
> -examples:
> -  - |
> -    i2c {
> -        #address-cells =3D <1>;
> -        #size-cells =3D <0>;
> -
> -        hwmon@11 {
> -            compatible =3D "infineon,xdp720";
> -            reg =3D <0x11>;
> -            vdd-vin-supply =3D <&vdd_vin>;
> -            infineon,rimon-micro-ohms =3D <1098000000>;  /* 1.098k ohm */
> -        };
> -    };
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp73=
0.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp730.yaml
> new file mode 100644
> index 000000000000..fdbc577bccdd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp730.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,xdp730.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Infineon XDP720 / XDP730 Digital eFuse Controllers
> +
> +maintainers:
> +  - Ashish Yadav <ashish.yadav@infineon.com>
> +
> +description: |
> +  The XDP720 and XDP730 are PMBus-compliant digital eFuse controllers
> +  with an integrated current sensor.  They provide accurate system
> +  telemetry (V, I, P, T) and report analog current at the IMON pin for
> +  post-processing.
> +
> +  Both parts share the same PMBus register map and direct-format
> +  coefficients; they differ in the GIMON gain step exposed via the
> +  TELEMETRY_AVG register (bit 10) and in the VDD_VIN pin number
> +  (XDP720: pin 9, XDP730: pin 20).
> +
> +  Datasheets:
> +    - XDP720: https://www.infineon.com/assets/row/public/documents/24/49=
/infineon-xdp720-001-datasheet-en.pdf
> +    - XDP730: https://www.infineon.com/assets/row/public/documents/24/49=
/infineon-xdp730-001-datasheet-en.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - infineon,xdp720
> +      - infineon,xdp730
> +
> +  reg:
> +    maxItems: 1
> +
> +  infineon,rimon-micro-ohms:
> +    description:
> +      The value of the RIMON resistor, in micro ohms, required to enable
> +      the system overcurrent protection.
> +
> +  vdd-vin-supply:
> +    description:
> +      Supply for the VDD_VIN pin (XDP720 pin 9, XDP730 pin 20), the IC
> +      controller power supply.  Typically connected to the input bus
> +      (VIN) through a 100 ohm / 100 nF RC filter.
> +
> +required:
> +  - compatible
> +  - reg
> +  - vdd-vin-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        efuse@11 {
> +            compatible =3D "infineon,xdp720";
> +            reg =3D <0x11>;
> +            vdd-vin-supply =3D <&vdd_vin>;
> +            infineon,rimon-micro-ohms =3D <1098000000>;  /* 1.098k ohm */
> +        };
> +    };
> +
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        efuse@12 {
> +            compatible =3D "infineon,xdp730";
> +            reg =3D <0x12>;
> +            vdd-vin-supply =3D <&vdd_vin>;
> +            infineon,rimon-micro-ohms =3D <1098000000>;  /* 1.098k ohm */
> +        };
> +    };
> --=20
> 2.39.5
>=20

--hg6KsFQl9Tz6Qhdk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahnBvAAKCRB4tDGHoIJi
0j/FAQCvvfwoLTjgCgmBWEX9s1FubG2bzRAJdtXGH7rKeT4LoAD8CC2/FgGfbc5I
+PuIGebBLyVfiN9T6wJm+uBWitgplA0=
=g1RT
-----END PGP SIGNATURE-----

--hg6KsFQl9Tz6Qhdk--
