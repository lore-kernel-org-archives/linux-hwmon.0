Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C893F4DCF;
	Wed, 22 Jul 2026 16:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784738046; cv=none; b=s9kq//QuHLyU/mtYTS8dRvJbI0+XVvlVznHPBHC/9Wrm/q20TdSZwUUfuiCCVKIRM5oAJZuE1vIO2462UrKnMX3j9m2bQlBEJ295JM7O0SxvxjIyALvpqKwGS+xL+rQGHPAE0ZoPtd/cllt0j/YQAT7FuP2pn4SNWDyOzFhAHdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784738046; c=relaxed/simple;
	bh=BmFJQxsg61FRIy2oaFgr7RV0amZDVmPp3fV2QRQTbp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZBg8iwDJyQ5bwGdU8oQR7v4nsGQGRTXSXU56nWmaYx4/BM1fyeMj+nf0QNFZ8WSoQq15q34UNhHMQGs4C51LBotu0+n/JUXj3mcGPPyX8bbBrpeanWO/56PCk6kVkAoMJe+Tvr1lYEidXpjgRsLuvDZbOjqF8HV4ho07DETyjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YEkXwlpz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YEkXwlpz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5D431F00A3A;
	Wed, 22 Jul 2026 16:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784738044;
	bh=Ik0pBfV5EU46muvb8hZ15lL3dXdA82nB9uVdoDxoK9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YEkXwlpzOq2EzU9z+YVVQAdi2Gw9pQvLpTp539npKSjizwP7UBKwIMva6fBzATGRq
	 NbZI68EMGBRN9v1YGpAGE1fYikIeqIaUQcJ5doYXXFI8BUsUGqhM2K8uUHcb2xXUEP
	 L1UrSyGWbvL4DneF2LWqNUKQR/ympRmcG+SxV3+IfAadCY0vh/muWGENbe3OgxkQbV
	 cUSg5pdSBlR45cXPTLhAR8LUvQD3nZ9pNtMPypkLS0pcrfhIw4GYCcUKci5MLKvZk2
	 FJq6gENm1Hrc60294aqPujAVjqSWSomicjMj/jOgTj9OsGJkJ63smHFNiwdQ4j0fRu
	 C/xd3dIhtIA3A==
Date: Wed, 22 Jul 2026 17:34:00 +0100
From: Conor Dooley <conor@kernel.org>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux@roeck-us.net" <linux@roeck-us.net>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX16545/MAX16550 and Volterra VT7505
Message-ID: <20260722-everglade-nickname-cdd52d3842a5@spud>
References: <20260722150324.164799-1-sanman.pradhan@hpe.com>
 <20260722150324.164799-2-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KHfazsegxw9UKhXk"
Content-Disposition: inline
In-Reply-To: <20260722150324.164799-2-sanman.pradhan@hpe.com>

--KHfazsegxw9UKhXk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 03:03:37PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
>=20
> Add device tree binding documentation for the Analog Devices MAX16545 and
> MAX16550, and the Volterra VT7505 PMBus controllers.
>=20
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>
> ---
>  .../bindings/hwmon/pmbus/adi,vt7505.yaml      | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/adi,vt7=
505.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,vt7505.yam=
l b/Documentation/devicetree/bindings/hwmon/pmbus/adi,vt7505.yaml
> new file mode 100644
> index 000000000000..286c88eb7be8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,vt7505.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/pmbus/adi,vt7505.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices MAX16545/MAX16550 and Volterra VT7505 PMBus contro=
llers
> +
> +maintainers:
> +  - Sanman Pradhan <psanman@juniper.net>
> +
> +description: |
> +  The Analog Devices MAX16545 and MAX16550, and the Volterra VT7505, are=
 PMBus
> +  controllers that provide input/output voltage, input/output current,
> +  input power and temperature monitoring over the PMBus interface.
> +
> +  The MAX16545 uses the same programming model as the VT7505.
> +
> +  Datasheets:
> +  https://www.analog.com/media/en/technical-documentation/data-sheets/ma=
x16545b-max16545c.pdf
> +  https://www.analog.com/media/en/technical-documentation/data-sheets/ma=
x16550.pdf
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - adi,max16550
> +          - adi,vt7505
> +      - items:
> +          - const: adi,max16545
> +          - const: adi,vt7505
> +
> +  reg:
> +    maxItems: 1
> +
> +  adi,rload-ohms:
> +    description:
> +      Resistance in ohms of the external current-report resistor connect=
ed
> +      between the ILOAD pin and ground. It is used to scale the reported
> +      input and output current and power.:wq
> +    minimum: 1
> +    default: 4750
> +
> +  adi,ocp-severe-filter:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Deglitch time applied to the severe overcurrent-protection compara=
tor,
> +      programmed into the MFR_CONFIG[15:14] field. The MAX16550 and VT75=
05
> +      expose this field; it decodes as 0 =3D 0 us, 1 =3D 1 us, 2 =3D 2 u=
s and
> +      3 =3D 10 us. On the MAX16545 the severe overcurrent delay is fixed=
 and

Please represent this property in microseconds.
pw-bot: changes-requested

Otherwise, I think this looks fine.

Thanks,
Conor.

> +      these bits are reserved.
> +    enum: [0, 1, 2, 3]

--KHfazsegxw9UKhXk
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCamDw+AAKCRB4tDGHoIJi
0mQzAQDNmvjb7B+qqu5PY1+LtRz40ZdxCt1mISa0jQ7AkiJWewD+JKMFFIjMfP9E
i9Ab2CUSte5ylsxTbcaYWYtCgGVfLQQ=
=+XE3
-----END PGP SIGNATURE-----

--KHfazsegxw9UKhXk--
