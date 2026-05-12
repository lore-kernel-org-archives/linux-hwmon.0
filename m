Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2463B1022;
	Tue, 12 May 2026 16:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778604097; cv=none; b=n0vMips9u4ZKPKRkVwtlR1X9/OC6jMHXrZr3zvmwF57FZOdD5gxIYall0gIPtmrRsNQhB6MduIpQsmCu7NRGUIod7n9muiI2N9tIDKvDLKfydzfvXR8Y7Vns2LwW0DQhjfUIArzUqvVluwgJ/KcT7Z7hbaPEnNpj4dN4b1N5lig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778604097; c=relaxed/simple;
	bh=3T821//nbNwWklMRAa45rcdnQRCet1wa2TYkQKWcGRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CJ5BBsUfBEcoKwEtu/72DoV22qep2jeQmN6irj/vyxXbIRlRNlt2Dcg+BrI/vDgIIs+zFGxS882xGt1WE4UvXAgO/V8R/3GcR+T1wLE8wW4Mqd6j/wJB/V311bc1RgXyWARyynJfVPG+pItmGhOLW25bW6Iook5qbZhEXhbI9Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RFovT11n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RFovT11n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ACC3C2BCB0;
	Tue, 12 May 2026 16:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778604096;
	bh=3T821//nbNwWklMRAa45rcdnQRCet1wa2TYkQKWcGRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RFovT11nCVNQ0W2sFpLtL7YSr7qsmxl5HTRJsUmGooJgLq7A9p3m0WDHNFRN3sBnS
	 yf8oJAEvi5XTRzfpkeSBIeExVYTRzekMZP8VcSfEuITHIwZbcQt7oOkCciY1/gdAiL
	 7T+3/SnI3CuEKRb4EPA6FGBKWo2S4S/AFccenGoIXxItjqMnOzPOAqV8Zl5zBGWoLN
	 QnRpXsbyZl/MJTfJ1rvxiArEDXqXU5cNchmuy15OMa95AwomBNQnC7Sq98+9cWDcxD
	 p1Uw5nWhi8B+THoLpQQ09GmjqSPIUCsI0IF4QSel3fFlYxKM1M5MTnDL/Z292+x5bb
	 KQAYUXRcsZF0w==
Date: Tue, 12 May 2026 17:41:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: Add Murata D1U74T PSU
Message-ID: <20260512-defame-stinky-62670d7e7ebf@spud>
References: <20260511-d1u74t-v1-0-623c2bc1532a@nexthop.ai>
 <20260511-d1u74t-v1-1-623c2bc1532a@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C1G0h9dIKgTPurGm"
Content-Disposition: inline
In-Reply-To: <20260511-d1u74t-v1-1-623c2bc1532a@nexthop.ai>


--C1G0h9dIKgTPurGm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 06:44:27PM -0700, Abdurrahman Hussain wrote:
> Add devicetree binding for the Murata D1U74T-W PMBus power supply
> unit.
>=20
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

If you're not adding regulators/supplies, this looks like a candidate
for trivial-devices.yaml.

pw-bot: changes-requested

Thanks
Conor.

> ---
>  .../bindings/hwmon/pmbus/murata,d1u74t.yaml        | 41 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  6 ++++
>  2 files changed, 47 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/murata,d1u74t.=
yaml b/Documentation/devicetree/bindings/hwmon/pmbus/murata,d1u74t.yaml
> new file mode 100644
> index 000000000000..ef080283bf79
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/murata,d1u74t.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/pmbus/murata,d1u74t.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Murata D1U74T-W power supply unit
> +
> +maintainers:
> +  - Abdurrahman Hussain <abdurrahman@nexthop.ai>
> +
> +description:
> +  The Murata D1U74T-W is a PMBus-compliant AC/DC power supply unit that
> +  exposes input/output voltage, current and power telemetry, three
> +  temperature sensors and dual fan monitoring over an I2C interface.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - murata,d1u74t
> +
> +  reg:
> +    maxItems: 1
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
> +        psu@58 {
> +            compatible =3D "murata,d1u74t";
> +            reg =3D <0x58>;
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b2040011a386..b6a055fbb870 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6803,6 +6803,12 @@ S:	Maintained
>  F:	Documentation/hwmon/crps.rst
>  F:	drivers/hwmon/pmbus/crps.c
> =20
> +MURATA D1U74T PSU DRIVER
> +M:	Abdurrahman Hussain <abdurrahman@nexthop.ai>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/hwmon/pmbus/murata,d1u74t.yaml
> +
>  CRYPTO API
>  M:	Herbert Xu <herbert@gondor.apana.org.au>
>  M:	"David S. Miller" <davem@davemloft.net>
>=20
> --=20
> 2.53.0
>=20

--C1G0h9dIKgTPurGm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagNYPAAKCRB4tDGHoIJi
0sj1AQDvYulhZABh59b0EWQID7gTD5EkN1jAh17MTdu5gQubBAEA7+3j7Lfi8NLZ
bsIpWTXmocNuMihP8t6Pq7/TqXofNwI=
=mH/0
-----END PGP SIGNATURE-----

--C1G0h9dIKgTPurGm--
