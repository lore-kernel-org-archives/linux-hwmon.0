Return-Path: <linux-hwmon+bounces-8-linux-hwmon=archiver.kernel.org@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4291AC4332F
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Nov 2023 18:43:15 +0000 (UTC)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAD6A1F20EEF
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Nov 2023 18:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D257200D7;
	Fri, 10 Nov 2023 18:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OCXI8xvR"
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E0FC2D2
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Nov 2023 18:43:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D17946C3CD
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Nov 2023 10:43:05 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB241C433C9;
	Fri, 10 Nov 2023 18:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699641785;
	bh=79RvBLjoz3Bd7Y0ag8toULjdzF47Z40+OXM0MpwXmxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OCXI8xvRP0lt0TwjRaxQyKejiXVk6LKZ8bPlwq6p/z/I0u7tPyaTkaah2sSpd9RtN
	 3Mo2hK3lBAPAg0gHkysWxYFzMau6GpoOYLyyKlMQUJuw/orBaPpY8pPSrVDDcIP4e5
	 6NCXYigh3a3mnWq+ZqntJ8t5IdIITHWgNVOudyrFH+9Y/hDKoLH6C4d9Z+Indge+Mt
	 Qib8zp9X8DB6Ogv5v4phP03pcVVxKEypR5p1PKAVoNP5uRTTXJMikHFhyBzgYfNciY
	 szoR34ttdRVNli++WdZvqwNaSAb0iSjK+m2ZQDawd4g4izqdFmLXSAJNNAQtYr/YG3
	 Avt2j7zGHXQlA==
Date: Fri, 10 Nov 2023 18:42:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Nuno Sa <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add LTC4282 bindings
Message-ID: <20231110-astronomy-nicotine-02c798d42910@roley>
References: <20231110151905.1659873-1-nuno.sa@analog.com>
 <20231110151905.1659873-2-nuno.sa@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8eDhNlj9sgP1hXjF"
Content-Disposition: inline
In-Reply-To: <20231110151905.1659873-2-nuno.sa@analog.com>


--8eDhNlj9sgP1hXjF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

On Fri, Nov 10, 2023 at 04:18:45PM +0100, Nuno Sa wrote:
> Add bindings for the LTC4282 High Current Hot Swap Controller with I2C
> Compatible Monitoring.
>=20
> Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> ---
>  .../bindings/hwmon/adi,ltc4282.yaml           | 228 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 234 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/adi,ltc4282.y=
aml
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml b/D=
ocumentation/devicetree/bindings/hwmon/adi,ltc4282.yaml
> new file mode 100644
> index 000000000000..0a5d540f014e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml
> @@ -0,0 +1,228 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/adi,ltc4282.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices LTC4282 I2C High Current Hot Swap Controller over =
I2C
> +
> +maintainers:
> +  - Nuno Sa <nuno.sa@analog.com>
> +
> +description: |
> +  Analog Devices LTC4282 I2C High Current Hot Swap Controller over I2C.
> +
> +  https://www.analog.com/media/en/technical-documentation/data-sheets/lt=
c4282.pdf
> +
> +

Extra blank line here FYI.

> +properties:
> +  compatible:
> +    enum:
> +      - adi,ltc4282
> +
> +  reg:
> +    maxItems: 1
> +
> +  vdd-supply: true
> +
> +  clocks:
> +    maxItems: 1
> +
> +  adi,clkout-mode:
> +    description: |
> +      Controls in which mode the CLKOUT PIN should work:
> +        0 - Configures the CLKOUT pin to output the internal system clock
> +        1 - Configures the CLKOUT pin to output the internal conversion =
time
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]

I really am not a fan of these types of properties. Part of me says that
if you're outputting clocks from this device, then you should be a clock
controller. How do consumers of this @clkout@ pin get the rate of the
clock?
I'd kinda be expecting to see a clocks property with a maxItems of 1 and
clock-names with two, mutually exclusive, options.

The other part says, and it applies in multiple places here, that having
integer properties with non-integer meanings is a poor ABI. I'd be vastly
happier if the various instances in this file became enums of strings,
or $re=E2=94=A4evant-unit so that a dts containing these properties is
immediately understandable.

Cheers,
COnor.

> +
> +  adi,rsense-nano-ohms:
> +    description: Value of the sense resistor.
> +
> +  adi,vin-mode-microvolt:
> +    description:
> +      Selects operating range for the Undervoltage, Overvoltage and Fold=
back
> +      pins. Also for the ADC. Should be set to the nominal input voltage.
> +    enum: [3300000, 5000000, 12000000, 24000000]
> +    default: 12000000
> +
> +  adi,fet-bad-timeout-ms:
> +    description:
> +      From the moment a FET bad conditions is present, this property sel=
ects the
> +      wait time/timeout for a FET-bad fault to be signaled. Setting this=
 to 0,
> +      disables FET bad faults to be reported.
> +    default: 255
> +    maximum: 255
> +
> +  adi,overvoltage-dividers:
> +    description: |
> +      Select which dividers to use for VDD Overvoltage detection. Note t=
hat
> +      when the internal dividers are used the threshold is referenced to=
 VDD.
> +      The percentages in the datasheet are misleading since the actual v=
alues
> +      to look for are in the "Absolute Maximum Ratings" table in the
> +      "Comparator Inputs" section. In there there's a line for each of t=
he 5%,
> +      10% and 15% settings with the actual min, typical and max toleranc=
es.
> +        0 - Use the external dividers.
> +        1 - Internal dividers 5%
> +        2 - Internal dividers 10%
> +        3 - Internal dividers 15%
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2, 3]
> +    default: 0
> +
> +  adi,undervoltage-dividers:
> +    description: |
> +      Select which dividers to use for VDD Overvoltage detection. Note t=
hat
> +      when the internal dividers are used the threshold is referenced to=
 VDD.
> +      The percentages in the datasheet are misleading since the actual v=
alues
> +      to look for are in the "Absolute Maximum Ratings" table in the
> +      "Comparator Inputs" section. In there there's a line for each of t=
he 5%,
> +      10% and 15% settings with the actual min, typical and max toleranc=
es.
> +        0 - Use the external dividers.
> +        1 - Internal dividers 5%
> +        2 - Internal dividers 10%
> +        3 - Internal dividers 15%
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2, 3]
> +    default: 0
> +
> +  adi,current-limit-microvolt:
> +    description:
> +      The current limit sense voltage of the chip is adjustable between
> +      12.5mV and 34.4mV in 3.1mV steps. This effectively limits the curr=
ent
> +      on the load.
> +    enum: [12500, 15625, 18750, 21875, 25000, 28125, 31250, 34375]
> +    default: 25000
> +
> +  adi,overcurrent-retry:
> +    description:
> +      If set, enables the chip to auto-retry 256 timer cycles after an
> +      Overcurrent fault.
> +    type: boolean
> +
> +  adi,overvoltage-retry-disable:
> +    description:
> +      If set, disables the chip to auto-retry 50ms after an Overvoltage =
fault.
> +      It's enabled by default.
> +    type: boolean
> +
> +  adi,undervoltage-retry-disable:
> +    description:
> +      If set, disables the chip to auto-retry 50ms after an Undervoltage=
 fault.
> +      It's enabled by default.
> +    type: boolean
> +
> +  adi,fault-log-enable:
> +    description:
> +      If set, enables the FAULT_LOG and ADC_ALERT_LOG registers to be wr=
itten
> +      to the EEPROM when a fault bit transitions high and hence, will be
> +      available after a power cycle (the chip loads the contents of
> +      the EE_FAULT_LOG register - the one in EEPROM - into FAULT_LOG at =
boot).
> +    type: boolean
> +
> +  adi,gpio-alert:
> +    description: Use the ALERT pin as a GPIO.
> +    type: boolean
> +
> +  adi,gpio1-mode:
> +    description: |
> +      Defines the function of the Pin.
> +          0 - GPIO Mode.
> +          1 - Power Bad. Goes into high-z to indicate that the output po=
wer is
> +              no longer good.
> +          2 - Power Good. Pulls low to indicate that the output power is=
 no
> +              longer good.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 2
> +
> +  adi,gpio2-mode:
> +    description: |
> +      Defines the function of the Pin.
> +          0 - GPIO Mode.
> +          1 - Acts as an input pin and it is feeded into the ADC.
> +          2 - Pulls Low when the MOSFET is dissipating power (stress).
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 2
> +
> +  adi,gpio3-mode:
> +    description: |
> +      Defines the function of the Pin.
> +          0 - GPIO Mode.
> +          1 - Acts as an input pin and it is feeded into the ADC.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 1
> +
> +  gpio-controller:
> +    description:
> +      This property applies if some of the pins are used as GPIOs.
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - adi,rsense-nano-ohms
> +
> +dependencies:
> +  adi,alert-as-gpio: [gpio-controller, '#gpio-cells']
> +
> +allOf:
> +  - if:
> +      required:
> +        - adi,gpio1-mode
> +    then:
> +      allOf:
> +        - if:
> +            properties:
> +              adi,gpio0-mode:
> +                const: 0
> +          then:
> +            dependencies:
> +              adi,gpio0-mode: [gpio-controller, '#gpio-cells']
> +  - if:
> +      required:
> +        - adi,gpio2-mode
> +    then:
> +      allOf:
> +        - if:
> +            properties:
> +              adi,gpio1-mode:
> +                const: 0
> +          then:
> +            dependencies:
> +              adi,gpio1-mode: [gpio-controller, '#gpio-cells']
> +  - if:
> +      required:
> +        - adi,gpio3-mode
> +    then:
> +      allOf:
> +        - if:
> +            properties:
> +              adi,gpio2-mode:
> +                const: 0
> +          then:
> +            dependencies:
> +              adi,gpio2-mode: [gpio-controller, '#gpio-cells']
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        hwmon@50 {
> +            compatible =3D "adi,ltc4282";
> +            reg =3D <0x50>;
> +            adi,rsense-nano-ohms =3D <500>;
> +
> +            gpio-controller;
> +            #gpio-cells =3D <2>;
> +
> +            adi,gpio1-mode =3D <2>;
> +            adi,gpio2-mode =3D <0>;
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 43121073390c..9f9527f6057b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12481,6 +12481,12 @@ S:	Maintained
>  F:	Documentation/hwmon/ltc4261.rst
>  F:	drivers/hwmon/ltc4261.c
> =20
> +LTC4282 HARDWARE MONITOR DRIVER
> +M:	Nuno Sa <nuno.sa@analog.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Supported
> +F:	Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml
> +
>  LTC4306 I2C MULTIPLEXER DRIVER
>  M:	Michael Hennerich <michael.hennerich@analog.com>
>  L:	linux-i2c@vger.kernel.org
> --=20
> 2.42.1
>=20

--8eDhNlj9sgP1hXjF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZU55rAAKCRB4tDGHoIJi
0pvAAP9esODBQZLF7ZBK2MgDPLaXWSCOSQSs3WDKBqqNKVpNZAD/aCn9opeIrbZB
0100JHXLumH3i4n5PN4e4eROqX9uigk=
=DUnj
-----END PGP SIGNATURE-----

--8eDhNlj9sgP1hXjF--

