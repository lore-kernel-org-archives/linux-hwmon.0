Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAC720F08C
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Feb 2026 19:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770146148; cv=none; b=YViZ7zDNSJz77VD69a/ObtSh/w4jwnvmmwzygNi7VWl+A8wiLMKP/EBGEj4OxgMBKFhJBKDabnAcDH94mOneSwbIueTX1dCLTH82dhVSHxrYRLez6rF+wlWep9ly9nvf8t55xFXskzyBPYbjSZiRY7gvj2O7GED3iIVkCHm07MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770146148; c=relaxed/simple;
	bh=HdovgMFgPml3ffAC3j7hWH1Mn+3kZIzQLWAdI4K+4CE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W5b5E9FLElpOh8cHD2SYT4PmdCD8denXruiHKP1dcmH7OSav2GyiD31CkQtGb4UDWFbluu56uB1JBJUe+7iGcwDnwkkBFdlYboqGmzroQoRDnNFqsL/nrL/VRuOaxWqIROnH10vtrJ65PLCaemlHFHWoMmTKFlCWGZGJI2LfU1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EOED4AGr; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EOED4AGr"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso3885608a12.3
        for <linux-hwmon@vger.kernel.org>; Tue, 03 Feb 2026 11:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770146146; x=1770750946; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E822W1lTVzNTxJuLwIpJE7KuY53gxa4z3vTcPjID5rk=;
        b=EOED4AGrAMYHuJWl/Lu0xuBowUXIoVjMq5edHCRCTaxr1liQGGcnD2Gw1YoN+7T66f
         m/q/eIJFQq5WIcSbUvx2Cg1Whkkl7MQW9ZTtwzSH4vvYafktOl+EVNrqNefIIsUxvEWL
         IMFTj+sBJQrN6YamcMEAtDmtSINkMGVkTRwb8i4OvCljBUjsUHJ6RCIODM8Ejin/jHPh
         IcrAwXStTXS6gQRwNjYmCVgUduZMZS8hMvWPePou6USpuaI4QJhGbtDzGvjfMPnE1+4z
         yoqgnbQbPm1P/3BAkpWA7J8zDMWXCcXKgDP6I4obXmqmNuh1ubCVoYHHx2PlXy6fShEi
         l8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770146146; x=1770750946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E822W1lTVzNTxJuLwIpJE7KuY53gxa4z3vTcPjID5rk=;
        b=BhcfEe+fZypzNQmzQwfUzHHngofzhWNTfZsbVfu0bsJ4xai/CrYQOIIVBnqHkDxJt5
         qusApqRFaltH1HcHDruDXygd89hrZvnFVfqCAe9UsnpJel9XobIflP1DrU70eqD5NgYO
         oAgOpugtNTVoYXPWGgMwwgen0hN0KvwMqDjVnHsnpF6j+EwnJj+92P/IMBNofVTzrWR3
         rINz9sDBfwvI+LhbuhYmMEDsL63vrsncOO65jNIMMMes6UTC4Yx5ZeQHh9ps+WxOvZK7
         JAQrimRoHsXrdcF5tnCxxZEn0miE5uVx/+NW1jtdbMOvQN7xGTHNs6TQAMHcnQ+iIulX
         Mj4w==
X-Forwarded-Encrypted: i=1; AJvYcCVnTo2l0i50+pKAAW2vpDqzvqGP/WHb/0doJSUBoQsLzQPvsIOBdZwQuN8YwqwhkQGd8C/m3GK5/8vzIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMSs8HCL5JGcZOEJ7iZXdM9+z+J7teCAlcSMlpQJYpT7DoXUtZ
	+ozFakno8dZ+hGwpWn4DzhWDcehh80iAeMcXcO5cSEsbSaGfqCoEHLvP
X-Gm-Gg: AZuq6aLDMpG/UoV9kU5ZodarLsZV50ts69uovwXEZmhhY8JXR5VWD2DQtCMWOvqcl88
	3Qe6rktuzWlt1g83hwiCiIXh8ynUh/4S9a5ukmXgwvsvOY4XN0O3q+yqKYURRc3oVf6Ft6hXh1G
	AESdwPjIc7agbYkkvpMM/v+MT/nR0si0hLAWPpQHPtfD+PJduxWACdaLBogeWiKysO5gQHSYLPG
	HGNERc+1XztX3BMsKyred93pOJ8qse/w8UdVFYjgvctohqBVFJ0YivrJoC90SZuQ4MPyVyGQ356
	RbPUHOqMnT5/C4V5DD8bF1I21vuXFwMC9ZkhIBGheM3+fa59EESrHgX6+jt5G+a3MrAxP9Ma9db
	2V8HJWtTGaOlQ5fC/k7Ob5T3+u4L0h4nkuLDvKIr4rclK6XFgtzeO3kZzrawRBRwcX2BIRHDPSZ
	5taA36/gu1a7JVtkIthVwuG+Jx
X-Received: by 2002:a17:90b:38ca:b0:32b:623d:ee91 with SMTP id 98e67ed59e1d1-354871ddd10mr296178a91.27.1770146145975;
        Tue, 03 Feb 2026 11:15:45 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35485da2a03sm375157a91.3.2026.02.03.11.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 11:15:45 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 3 Feb 2026 11:15:44 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: victor.duicu@microchip.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, marius.cristea@microchip.com,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: add support for MCP998X
Message-ID: <0b3979d6-895f-4c8a-8251-d3c793385bf4@roeck-us.net>
References: <20260127151823.9728-1-victor.duicu@microchip.com>
 <20260127151823.9728-2-victor.duicu@microchip.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127151823.9728-2-victor.duicu@microchip.com>

On Tue, Jan 27, 2026 at 05:18:21PM +0200, victor.duicu@microchip.com wrote:
> From: Victor Duicu <victor.duicu@microchip.com>
> 
> This is the devicetree schema for Microchip MCP998X/33 and
> MCP998XD/33D Multichannel Automotive Temperature Monitor Family.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Victor Duicu <victor.duicu@microchip.com>

Some AI generated feedback inline, generated using Gemini 3 and Chris Mason's
prompts as base. I don't know much if anything about devicetree properties,
but it does seem to me that the AI has a point.

> ---
>  .../bindings/hwmon/microchip,mcp9982.yaml     | 205 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 211 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,mcp9982.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/microchip,mcp9982.yaml b/Documentation/devicetree/bindings/hwmon/microchip,mcp9982.yaml
> new file mode 100644
> index 000000000000..05ea3c6a5618
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/microchip,mcp9982.yaml
> @@ -0,0 +1,205 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/microchip,mcp9982.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip MCP998X/33 and MCP998XD/33D Temperature Monitor
> +
> +maintainers:
> +  - Victor Duicu <victor.duicu@microchip.com>
> +
> +description: |
> +  The MCP998X/33 and MCP998XD/33D family is a high-accuracy 2-wire
> +  multichannel automotive temperature monitor.
> +  The datasheet can be found here:
> +    https://ww1.microchip.com/downloads/aemDocuments/documents/MSLD/ProductDocuments/DataSheets/MCP998X-Family-Data-Sheet-DS20006827.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - microchip,mcp9933
> +      - microchip,mcp9933d
> +      - microchip,mcp9982
> +      - microchip,mcp9982d
> +      - microchip,mcp9983
> +      - microchip,mcp9983d
> +      - microchip,mcp9984
> +      - microchip,mcp9984d
> +      - microchip,mcp9985
> +      - microchip,mcp9985d
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Signal coming from ALERT/THERM pin.
> +      - description: Signal coming from THERM/ADDR pin.
> +      - description: Signal coming from SYS_SHDN pin.
> +
> +  interrupt-names:
> +    items:
> +      - const: alert-therm
> +      - const: therm-addr
> +      - const: sys-shutdown

The top-level definition of interrupt-names specifies exactly 3 items.
How does this interact with variants that only have 2 interrupts?

> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  microchip,enable-anti-parallel:
> +    description:
> +      Enable anti-parallel diode mode operation.
> +      MCP9984/84D/85/85D and MCP9933/33D support reading two external diodes
> +      in anti-parallel connection on the same set of pins.
> +    type: boolean
> +
> +  microchip,parasitic-res-on-channel1-2:
> +    description:
> +      Indicates that the chip and the diodes/transistors are sufficiently far
> +      apart that a parasitic resistance is added to the wires, which can affect
> +      the measurements. Due to the anti-parallel diode connections, channels
> +      1 and 2 are affected together.
> +    type: boolean
> +
> +  microchip,parasitic-res-on-channel3-4:
> +    description:
> +      Indicates that the chip and the diodes/transistors are sufficiently far
> +      apart that a parasitic resistance is added to the wires, which can affect
> +      the measurements. Due to the anti-parallel diode connections, channels
> +      3 and 4 are affected together.
> +    type: boolean
> +
> +  microchip,power-state:
> +    description:
> +      The chip can be set in Run state or Standby state. In Run state the ADC
> +      is converting on all channels at the programmed conversion rate.
> +      In Standby state the host must initiate a conversion cycle by writing
> +      to the One-Shot register.
> +      True value sets Run state.
> +      Chips with "D" in the name can only be set in Run mode.
> +    type: boolean
> +
> +  vdd-supply: true
> +
> +patternProperties:
> +  "^channel@[1-4]$":
> +    description:
> +      Represents the external temperature channels to which
> +      a remote diode is connected.
> +    type: object
> +
> +    properties:
> +      reg:
> +        items:
> +          minItems: 1
> +          maxItems: 4

Should the reg property in a channel node allow up to 4 items? Since the
node naming ^channel@[1-4]$ implies a single channel per node, it seems
reg should have maxItems: 1.

Second feedback:

Is this reg schema correct? For a single cell index (e.g. reg = <1>), the
items are integers, and minItems/maxItems are not valid constraints on
integers. Did you mean to use minimum/maximum here, or just maxItems: 1
on the reg itself?

> +
> +      label:
> +        description: Unique name to identify which channel this is.
> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - microchip,mcp9982d
> +              - microchip,mcp9983d
> +              - microchip,mcp9984d
> +              - microchip,mcp9985d
> +              - microchip,mcp9933d
> +    then:
> +      properties:
> +        interrupts-names:

Is "interrupts-names" a typo for "interrupt-names"? The plural form
does not match the property defined at the top level.

Also, if the top-level interrupt-names requires 3 items, will a 2-item
override here conflict during validation?

> +          items:
> +            - const: alert-therm
> +            - const: sys-shutdown
> +      required:
> +        - microchip,power-state
> +    else:
> +      properties:
> +        interrupts-names:

Same question here regarding the typo; should this be interrupt-names?

> +          items:
> +            - const: alert-therm
> +            - const: therm-addr
> +        microchip,power-state: true
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            pattern: '^microchip,mcp998(2|3)$'
> +    then:
> +      properties:
> +        microchip,enable-anti-parallel: false

If "D" variants only support Run mode as described in the property
description, why is this property required in the devicetree?

Second feedback:

Since the description says "D" versions can only be set in Run mode
(where True sets Run state), should this property also have a const: true
constraint here?

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            pattern: '^microchip,mcp998(2|3)d$'
> +    then:
> +      properties:
> +        microchip,enable-anti-parallel: false
> +      required:
> +        - microchip,parasitic-res-on-channel1-2
> +        - microchip,parasitic-res-on-channel3-4

Should the parasitic resistance compensation properties be required? These
represent board-specific parasitics and may not be present on all
designs using these chip variants.

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            pattern: '^microchip,mcp99(33|8[4-5])d$'
> +    then:
> +      required:
> +        - microchip,parasitic-res-on-channel1-2
> +        - microchip,parasitic-res-on-channel3-4
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        temperature-sensor@4c {
> +            compatible = "microchip,mcp9985";
> +            reg = <0x4c>;
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            microchip,enable-anti-parallel;
> +            microchip,parasitic-res-on-channel1-2;
> +            microchip,parasitic-res-on-channel3-4;
> +
> +            vdd-supply = <&vdd>;
> +
> +            channel@1 {
> +                reg = <1>;
> +                label = "Room Temperature";
> +            };
> +
> +            channel@2 {
> +                reg = <2>;
> +                label = "GPU Temperature";
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0d044a58cbfe..f88d837cb586 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17149,6 +17149,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/iio/adc/microchip,mcp3911.yaml
>  F:	drivers/iio/adc/mcp3911.c
>  
> +MICROCHIP MCP9982 TEMPERATURE DRIVER
> +M:	Victor Duicu <victor.duicu@microchip.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Supported
> +F:	Documentation/devicetree/bindings/hwmon/microchip,mcp9982.yaml
> +
>  MICROCHIP MMC/SD/SDIO MCI DRIVER
>  M:	Aubin Constans <aubin.constans@microchip.com>
>  S:	Maintained
