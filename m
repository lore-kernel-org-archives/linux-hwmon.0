Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AE42C0F8C;
	Thu, 16 Apr 2026 15:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776354702; cv=none; b=IADHrJBjEd3d4dc49/B3CXRPCjW7E39rebTVPEljeGAW0HhKBucJe16gFvvGcPhl3arw6lxw7ywET7HDfeH4Ui1+al1uA+S686IsVsQ6unSTbgtmTHt76Go536vPsNVZo6CqtCAyNJv7gNLvrokmjo5D0/8tb+cfSPvK8hrcyNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776354702; c=relaxed/simple;
	bh=gocU0gn9oGsMsa4dqjIXHPUCMwGyN0yqB2RdmCXUIBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m1frDKXV7CPQiSGzhaXHkcitK7Itamgej4z07YiWkUTgpeRNlIGDZXfUHkVVbtfUVUU1DBvqNPMDy1xxd1yu7qUBl+K0XzH1yw77aFDJn7QTsPPlEiItKVX/fy0zcxhQLlSPLmFIKUmwWQk3Iz4aI2fTWncPnMOxlIMCRmsKAgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gi4NtKra; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gi4NtKra"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BD1DC2BCAF;
	Thu, 16 Apr 2026 15:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776354701;
	bh=gocU0gn9oGsMsa4dqjIXHPUCMwGyN0yqB2RdmCXUIBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gi4NtKraGCKiZQoBXa+Hh+rs/3dJr1f6ZkScs24dWwL99kAtlugVXXENoW+2QTib8
	 BW53UdxbjMghHn3op0d+aZFAayPlQNfQG7T2BjCPgmGziRm1+h+N1t3MMzrMH79DkU
	 C0+6yh0oVEMuIIQv0X8IIhqReA+NDFWy8VXUSUZ8ywNhCjHJAQUXG3+ENYkySNzOuf
	 l7SHtFAFT0t81O8Y9/nj3HAXNfdS5+WmsjFL2Wrss5Jzj6b8QICh/zCbmoR2Z3+45Y
	 hQBC+D9yrI85gdYO9dJ4xx+y7emHLKdGGWpoNJX5ERa5IFj0VubMkxKj/l1nMywPWE
	 Bghs5wPGgB7Pg==
Date: Thu, 16 Apr 2026 16:51:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: add max20830
Message-ID: <20260416-diaphragm-corrode-494560404ed4@spud>
References: <20260416-dev_max20830-v2-0-2c7d676dc0bd@analog.com>
 <20260416-dev_max20830-v2-1-2c7d676dc0bd@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xk2KV3EV8VV32UNB"
Content-Disposition: inline
In-Reply-To: <20260416-dev_max20830-v2-1-2c7d676dc0bd@analog.com>


--xk2KV3EV8VV32UNB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 03:59:10PM +0800, Alexis Czezar Torreno wrote:
> Add device tree documentation for MAX20830 step-down DC-DC switching
> regulator with PMBus interface.
>=20
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> ---
>  .../bindings/hwmon/pmbus/adi,max20830.yaml         | 61 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  7 +++
>  2 files changed, 68 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.y=
aml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..8b3ec1ffa0c9460de2122f660=
6ce3dcbcdfbbcc7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/pmbus/adi,max20830.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices MAX20830 Step-Down Switching Regulator with PMBus
> +
> +maintainers:
> +  - Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> +
> +description: |
> +  The MAX20830 is a fully integrated step-down DC-DC switching regulator=
 with
> +  PMBus interface. It provides 2.7V to 16V input, 0.4V to 5.8V adjustable
> +  output, and up to 30A output current. It allows monitoring of input/ou=
tput
> +  voltage, output current and temperature through the PMBus serial inter=
face.
> +  Datasheet:
> +    https://www.analog.com/en/products/max20830.html
> +
> +allOf:
> +  - $ref: /schemas/regulator/regulator.yaml#
> +
> +properties:
> +  compatible:
> +    const: adi,max20830
> +
> +  reg:
> +    maxItems: 1

On the previous version, you got an LLM comment about not having the
interrupts property amongst other things.
I think the other things got implemented, but I didn't see any reply to
the bot about that?
I think the answer is that it shouldn't because the pin it referenced
doesn't exist, but when looking at the schematic I have to wonder if
there should be an interrupts property for dealing with "pgood"?

Cheers,
Conor.

> +
> +  vddh-supply:
> +    description:
> +      Phandle to the regulator that provides the VDDH power supply.
> +
> +  avdd-supply:
> +    description:
> +      Phandle to the regulator that provides the AVDD power supply.
> +
> +  ldoin-supply:
> +    description:
> +      Optional 2.5V to 5.5V LDO input supply.
> +
> +required:
> +  - compatible
> +  - reg
> +  - vddh-supply
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        regulator@30 {
> +            compatible =3D "adi,max20830";
> +            reg =3D <0x30>;
> +            vddh-supply =3D <&vddh>;
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0a3991c10ade20dd79cc7d1bf2a1d307ba6bd19d..031c743e979521a92ed9ac679=
15c178ce31727bd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15579,6 +15579,13 @@ F:	Documentation/devicetree/bindings/hwmon/pmbus=
/adi,max17616.yaml
>  F:	Documentation/hwmon/max17616.rst
>  F:	drivers/hwmon/pmbus/max17616.c
> =20
> +MAX20830 HARDWARE MONITOR DRIVER
> +M:	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Supported
> +W:	https://ez.analog.com/linux-software-drivers
> +F:	Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
> +
>  MAX2175 SDR TUNER DRIVER
>  M:	Ramesh Shanmugasundaram <rashanmu@gmail.com>
>  L:	linux-media@vger.kernel.org
>=20
> --=20
> 2.34.1
>=20

--xk2KV3EV8VV32UNB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeEFiQAKCRB4tDGHoIJi
0t7hAQDOOLZV3vgpWe3h0GvckV6mI1IAYYiUN2qSiHChot76wQEA6GyR+9BeaPF1
NiSxvfVyp2jEdn60S2Ax1hDX0EGl7gQ=
=fow4
-----END PGP SIGNATURE-----

--xk2KV3EV8VV32UNB--
