Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DC43B2FC6;
	Mon, 22 Jun 2026 14:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782137066; cv=none; b=UXAdaE275Px7Z17kBtWjBecsJueCjmgbEZ86M1OA/hggnSyxElEjNE7IBnBKOfMLJShhGdEjSpTL+jZgYP5nGrmGKB72GqG3jPpAfhb+CYMSJy+0GymUeLHWyrlTofu9PU2i4zKp6909THt4aWEJHC5lQolnusw+5jxMqNuLauM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782137066; c=relaxed/simple;
	bh=c8rHtVAFZEGm03Oje6Exjz24ec2PoLZW5waoSUV3t1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oNYSlk8Z6AdVEWpf35r4pvaL4MDVw+WXZ4AGJrpS8du2X4mVs+qoreUCraF/hSy81oQexTuPCPI4mmBIQ+dimwn3+Z9pbMD/QpyK7DKnxdpLEh7oXDKvIIRrEkVxWYGUC00FhFDAc13Ka/8wchVgobH0Chb8V9i7MCV4hgt1t8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c83UrsCX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c83UrsCX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A47501F000E9;
	Mon, 22 Jun 2026 14:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782137065;
	bh=EY91yHe36/89Hn+RQo7CZy0mvBvIJQ0EV5pzsSJNlVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c83UrsCXIvVTSobPRa05r1uNqRRsxMTHNVwlQssBVjMx2JZxoGRH15oUVgYpIWKnI
	 w8IjD5oAhmWTmEcUjViEwmEglkbSG8Y+kmjBMjuuTWuZh5mN6jLf9aPP0t5SxhmcHG
	 ByaTnRYdHN13P4mba5ZB7iQa+7XJ2l7DWQsf2BD5eU3Lr7RmfBx1l8xyop9TRSMTc+
	 XYP2UwDw72fGkjnRrBA/kanDtAtnj20uFumurZzgIKWjoWdZMp0Pft+DQCt2V2bfK7
	 tlFutlu6facorb8qQY41RqN6p5X0/FE3nWGxtGW5t4MiJRp1uN51DTdItWM+camN9G
	 4PLKm7N8HtrpQ==
Date: Mon, 22 Jun 2026 16:04:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: tze.yee.ng@altera.com
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, 
	Mahesh Rao <mahesh.rao@altera.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: hwmon: add Altera Stratix 10 hardware
 monitor binding
Message-ID: <20260622-wakeful-grumpy-condor-4e542c@quoll>
References: <cover.1781861409.git.tze.yee.ng@altera.com>
 <ac5a118394e96f707823463fedd32b6a484c1ceb.1781861409.git.tze.yee.ng@altera.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ac5a118394e96f707823463fedd32b6a484c1ceb.1781861409.git.tze.yee.ng@altera.com>

On Fri, Jun 19, 2026 at 02:38:52AM -0700, tze.yee.ng@altera.com wrote:
> From: Tze Yee Ng <tze.yee.ng@altera.com>
>=20
> Document the device tree binding for the Altera Stratix 10 SoC FPGA
> hardware monitor, including temperature and voltage sensor nodes.
>=20
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.co=
m>
> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
> ---
>  .../bindings/hwmon/altr,stratix10-hwmon.yaml  | 164 ++++++++++++++++++
>  MAINTAINERS                                   |   7 +
>  2 files changed, 171 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/altr,stratix1=
0-hwmon.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/altr,stratix10-hwmon=
=2Eyaml b/Documentation/devicetree/bindings/hwmon/altr,stratix10-hwmon.yaml
> new file mode 100644
> index 000000000000..5bd98660ee7b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/altr,stratix10-hwmon.yaml
> @@ -0,0 +1,164 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/altr,stratix10-hwmon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Altera Hardware Monitor for Stratix 10 SoC FPGA
> +
> +maintainers:
> +  - Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> +  - Tze Yee Ng <tze.yee.ng@altera.com>
> +
> +description: |
> +  The Altera Stratix 10 SoC FPGA hardware monitor unit provides on-chip
> +  voltage and temperature sensors. These sensors can be used to monitor
> +  external voltages and on-chip operating conditions such as internal
> +  power rails and on-chip junction temperatures.
> +
> +  The specific sensor configuration varies by device. Check the device
> +  documentation to verify which sensors are available.
> +
> +  Stratix 10 voltage sensors:
> +
> +    page 0, channel 2 =3D 0.8V VCC
> +    page 0, channel 3 =3D 1.8V VCCIO_SDM
> +    page 0, channel 6 =3D 0.9V VCCERAM
> +
> +  Stratix 10 temperature sensors:
> +
> +    page 0, channel 0 =3D main die
> +    page 0, channel 1 =3D tile bottom left
> +    page 0, channel 2 =3D tile middle left
> +    page 0, channel 3 =3D tile top left
> +    page 0, channel 4 =3D tile bottom right
> +    page 0, channel 5 =3D tile middle right
> +    page 0, channel 6 =3D tile top right
> +    page 0, channel 7 =3D hbm2 bottom
> +    page 0, channel 8 =3D hbm2 top
> +
> +properties:
> +  compatible:
> +    const: altr,stratix10-hwmon
> +

Where are top-level properties? clocks? interrupts? power-domain,
resets? address space? Anything? Did you read writing bindings doc?

> +  temperature:
> +    description:
> +      The temperature node specifies mappings of temperature sensor diod=
es on
> +      the Stratix 10 SoC FPGA main die and tile die.
> +    type: object

Blank line

> +    properties:
> +      '#address-cells':
> +        const: 1
> +      '#size-cells':
> +        const: 0

Blank line

> +    patternProperties:
> +      "^input(@[0-9a-f]+)?$":

Unit address should not be optional.

Also, use consistent style of quotes.

> +        description:
> +          The input node specifies each individual temperature sensor.
> +        type: object
> +        properties:
> +          reg:
> +            description:
> +              Sensor channel index in the lower 16-bits (0-15). For temp=
erature
> +              sensors, the page number is encoded in the upper 16-bits.
> +              The driver encodes the SMC request argument as a channel
> +              bitmask (1 << channel) in bits 0..15, with the page number
> +              placed in bits 16..31. Channel values >=3D 16 are rejected=
 to
> +              avoid overlap with the page field. For example, reg =3D <2>
> +              selects channel 2 and the driver passes 0x4 to the service=
 layer.
> +          label:
> +            description:
> +              A descriptive name for this channel (e.g. "Main Die" or
> +              "Tile Bottom Left").
> +        required:
> +          - reg
> +        additionalProperties: false

All this is difficult to read. Please open other bindings to understand
the style used in Linux kernel.

> +    required:
> +      - '#address-cells'
> +      - '#size-cells'
> +    additionalProperties: false
> +
> +  voltage:
> +    description:
> +      The voltage node specifies mappings of voltage sensors on the Stra=
tix 10
> +      SoC FPGA analog to digital converter of the Secure Device Manager =
(SDM).
> +    type: object
> +    properties:
> +      '#address-cells':
> +        const: 1
> +      '#size-cells':
> +        const: 0
> +    patternProperties:
> +      "^input(@[0-9a-f]+)?$":

Isn't this usually called channel?

> +        description:
> +          The input node specifies each individual voltage sensor.
> +        type: object
> +        properties:
> +          reg:
> +            description:
> +              Sensor channel index in the lower 16-bits (0-15). The driv=
er
> +              encodes the SMC request argument as a channel bitmask
> +              (1 << channel). For example, reg =3D <2> selects channel 2=
 and
> +              the driver passes 0x4 to the service layer.
> +          label:
> +            description:
> +              A descriptive name for this channel (e.g. "0.8V VCC" or
> +              "1.8V VCCIO_SDM").
> +        required:
> +          - reg
> +        additionalProperties: false
> +    required:
> +      - '#address-cells'
> +      - '#size-cells'
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    hwmon {
> +      compatible =3D "altr,stratix10-hwmon";
> +
> +      voltage {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        input@2 {
> +          label =3D "0.8V VCC";
> +          reg =3D <2>;
> +        };
> +
> +        input@3 {
> +          label =3D "1.8V VCCIO_SDM";
> +          reg =3D <3>;
> +        };
> +
> +        input@6 {
> +          label =3D "0.9V VCCERAM";
> +          reg =3D <6>;
> +        };
> +      };
> +
> +      temperature {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        input@0 {
> +          label =3D "Main Die";
> +          reg =3D <0>;
> +        };
> +
> +        input@1 {
> +          label =3D "Tile Bottom Left";
> +          reg =3D <1>;
> +        };
> +
> +        input@2 {
> +          label =3D "Tile Middle Left";
> +          reg =3D <2>;
> +        };
> +      };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6aa3fe2ee1bb..678f6c429627 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -937,6 +937,13 @@ ALPS PS/2 TOUCHPAD DRIVER
>  R:	Pali Roh=C3=A1r <pali@kernel.org>
>  F:	drivers/input/mouse/alps.*
> =20
> +ALTERA STRATIX 10 SoC FPGA HWMON DRIVER
> +M:	Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> +M:	Tze Yee Ng <tze.yee.ng@altera.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/hwmon/altr,stratix10-hwmon.yaml
> +
>  ALTERA MAILBOX DRIVER

Does not look sorted. Please read this file before changing it.

Best regards,
Krzysztof

