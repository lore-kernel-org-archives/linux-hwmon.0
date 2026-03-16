Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE453BA22E
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Mar 2026 16:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773676804; cv=none; b=j7C7BeeeYe9Nr2xYL6hA7BueRvO7I7hW+LqCF6z3vArxUnv/ei71OzhfZJ3j9zv67e51rXB8O5ySOWIA1BMQZC4rw8YUnYa0DQG1FWbMvYVrNVVkUOPTxQTSVqr6zfBrD6QN+uAz/FTKFWYHvaaS/SMmQyQhFeETRLc8RnQmDbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773676804; c=relaxed/simple;
	bh=zlkyQWpxbXVWuEYCvTbCPl6ah+DNoG67ZQ2g20gaCsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nQLUS9VP4rAd0bsIlTx34Akvwaq4WQopf1P39Xp4rbqS8W+DscNEiyEYk1Os7oZHE/ejFlOYabA3gaT1nl1oY1HeFP594ihQsw7GZeTuPH605nRVhk2eNkOUwXoJj4Mo2OK1k7SV9NovrarlA1btC5I3YN214XCvQTiDWepe2yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OyCnBjvS; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OyCnBjvS"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2beb0246931so5145081eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 16 Mar 2026 09:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773676802; x=1774281602; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+1SmoxvUH6Gph+iSv3rj6ZF+MrAyLmghEWqn/nKSy/w=;
        b=OyCnBjvSu46sPhdZco0xTrSg+0Ivk57/JEJL7BeO6iqmYHDGYaxa2AN/G350aalE8E
         3nUDHOauMCUkPKEa+UrGHOaYyJETgOB3GuCHPmxAcrt+2d5QC2kT1+ld1t6HoT1Ry2Li
         V3HehbeKNrky1gDoMwBWnzu4kYBtcCNBL13aFxWiGkc5SnG/SojpyyxuBPKBS4J79wzr
         xIEg4HJt7McatKoRu9J71ITVfp/aY7/5TVCFpMJprhbfC9JuahySQRPUevG4rfmbZU7w
         lYr696qBgbZAUw+u/9Dp6LoO09eoUXlB5QqNouJCZEoCirE+Ma+Uc5NuIHR1Vc0V16C1
         GGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773676802; x=1774281602;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+1SmoxvUH6Gph+iSv3rj6ZF+MrAyLmghEWqn/nKSy/w=;
        b=nwQeS4qAJLEs+flZvfufQ6Ltnc4x++DrQc9KiikaIXfp8Ual+2PSV4giNcYP11KrU6
         DD7BP8AMxL2MICwAUbBkbzzF/6Gy44hkD/uoZT69SQSDft4TN6Gtt/sRhDBcRzrdnehF
         sG3lv1wZGGdWQOBtKIk49zRDqKE6YVLHYKWqpqtpO9+UplsEPLYpBqWQQfi+0ptVHhfr
         sN9ZLrS5LtZ7H+wM4iKPaI7bQEtkn5J2Rk6VoTTG55htpwJR5frvBN1l5qQqAcLdT4so
         7LKxYX8wLiQSbxOGAr0XmkU2ngpSLMkQdQCatWAP5xCV0UWX42g4YZ+7heGb21v9g+bg
         jZ5A==
X-Forwarded-Encrypted: i=1; AJvYcCUd9VhnDo+6wVArt7AVom+jwS2SpUFPNoNRW/Q1mqBQjHg1ipWCOEkUd5zHGMZhBua9x5Vm79O1Rn5Dkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHzneEbqT8emwWm7WQhANkhisLv392t9gFXG3fTXsaECvdU5yg
	q+lnFsC8JbG+VXgm2073w/UfNTZoBa4P9784mbmP5xNxy6iGgtC/Xe/u
X-Gm-Gg: ATEYQzyvgguMu+sS+Agh1lG4qHgkEF9B3MxBzvqqpcGgUhGFpo3QHmLvHkdEOusPLE1
	2fT5hrvJb7xtxc+yinAk2y08/nqvl/JQtd4xwnJceB3UXgdt/7O6pcDsZYCgUuBY4vIQG7G1cDY
	IlH+UAGXn+NKLBUjYk8ua2MmHsxqo2UVjNjPIQQ5WTQvTUVurH5MEuid+H5vPYT4PWqsQW804F7
	NAU0/TThYVns5TEC2zqcl1LBo6/1AoNJT5dHx2r2EybxoWl9Z/Puebgt9+EnfxMzUpORD4csB7E
	EzzmwSWyCNNOxfKa5aR3ELjVnpb7vM+a3+6eMnfubut6RYZQ+xw6KVeyjNfiNDN7WmkvVfDQJ3S
	ss7FGq53q/vmLTHly2o9kNWuZYfsDnncHcPoNsCIyrEVCbzAv0WHbrk4UFClZ59j9JX3OqODECn
	Gaatj41u6zYvJno1SNSqp8UQQtVsyB49mJr9NX
X-Received: by 2002:a05:7301:10c4:b0:2b8:c1b4:9cb7 with SMTP id 5a478bee46e88-2bea5523f59mr6710445eec.22.1773676802057;
        Mon, 16 Mar 2026 09:00:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0c12fb4a8sm5959340eec.0.2026.03.16.09.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 09:00:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 16 Mar 2026 08:59:56 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: nuno.sa@analog.com
Cc: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v7 1/3] dt-bindings: hwmon: Document the LTC4283 Swap
 Controller
Message-ID: <c395fad0-ca24-448a-a77f-ddac1cd9f809@roeck-us.net>
References: <20260314-ltc4283-support-v7-0-1cda48e93802@analog.com>
 <20260314-ltc4283-support-v7-1-1cda48e93802@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260314-ltc4283-support-v7-1-1cda48e93802@analog.com>

On Sat, Mar 14, 2026 at 10:52:19AM +0000, Nuno Sá via B4 Relay wrote:
> From: Nuno Sá <nuno.sa@analog.com>
> 
> The LTC4283 is a negative voltage hot swap controller that drives an
> external N-channel MOSFET to allow a board to be safely inserted and
> removed from a live backplane.
> 
> Special note for the "adi,vpower-drns-enable" property. It allows to choose
> between the attenuated MOSFET drain voltage or the attenuated input
> voltage at the RTNS pin (effectively choosing between input or output
> power). This is a system level decision not really intended to change at
> runtime and hence is being added as a Firmware property.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Some AI review feedback inline. Feel free to ignore if wrong, but please let me know
to help improve it.

Thanks,
Guenter

> ---
>  .../devicetree/bindings/hwmon/adi,ltc4283.yaml     | 272 +++++++++++++++++++++
>  MAINTAINERS                                        |   6 +
>  2 files changed, 278 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml b/Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..f82fff1ec7e4407ed63d00f8b1281db459d7221b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
> @@ -0,0 +1,272 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/adi,ltc4283.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LTC4283 Negative Voltage Hot Swap Controller
> +
> +maintainers:
> +  - Nuno Sá <nuno.sa@analog.com>
> +
> +description: |
> +  The LTC4283 negative voltage hot swap controller drives an external N-channel
> +  MOSFET to allow a board to be safely inserted and removed from a live
> +  backplane.
> +
> +  https://www.analog.com/media/en/technical-documentation/data-sheets/ltc4283.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,ltc4283
> +
> +  reg:
> +    maxItems: 1
> +
> +  adi,rsense-nano-ohms:
> +    description: Value of the sense resistor.
> +
> +  adi,current-limit-sense-microvolt:
> +    description:
> +      The current limit sense voltage of the chip is adjustable between
> +      15mV and 30mV in 1mV steps. This effectively limits the current
> +      on the load.
> +    minimum: 15000
> +    maximum: 30000
> +    default: 15000
> +
> +  adi,current-limit-foldback-factor:
> +    description:
> +      Specifies the foldback factor for the current limit. The current limit
> +      can be reduced (folded back) to one of four preset levels. The value
> +      represents the percentage of the current limit sense voltage to use
> +      during foldback. A value of 100 means no foldback.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [10, 20, 50, 100]
> +    default: 100
> +
> +  adi,cooling-delay-ms:
> +    description:
> +      Cooling time to apply after an overcurrent fault, FET bad or
> +      external fault.
> +    enum: [512, 1002, 2005, 4100, 8190, 16400, 32800, 65600]
> +    default: 512
> +
> +  adi,fet-bad-timer-delay-ms:
> +    description:
> +      FET bad timer delay. After a FET bad status condition is detected,
> +      this timer is started. If the condition persists for the
> +      specified time, the FET is turned off and a fault is logged.
> +    enum: [256, 512, 1002, 2005]
> +    default: 256
> +
> +  adi,power-good-reset-on-fet:
> +    description:
> +      If set, resets the power good status when the MOSFET is turned off.
> +      Otherwise, it resets when a low output voltage is detected.
> +    type: boolean
> +
> +  adi,fet-turn-off-disable:
> +    description:
> +      If set, the MOSFET is turned off immediately when a FET fault is detected.
> +    type: boolean

Is there a logic inversion between the property name and its description?
The property name uses a -disable suffix, but the description says "If set,
the MOSFET is turned off immediately", which sounds like it is enabling the
behavior rather than disabling it.
> +
> +  adi,tmr-pull-down-disable:
> +    description: Disables 2uA pull-down current on the TMR pin.
> +    type: boolean
> +
> +  adi,dvdt-inrush-control-disable:
> +    description:
> +      Enables dV/dt inrush control during startup. In dV/dt mode, the inrush
> +      current is limited by controlling a constant output voltage ramp rate.
> +      If not set, the inrush control mechanism is active current limiting.
> +    type: boolean

Does this description contradict the property name?
The -disable suffix implies the property turns off the dV/dt inrush control,
but the description states that setting the property enables it.

[ Non-AI note: It seems to me that the description contradicts itself. 
  It first says "_Enables_ ...", then it says "If _not_ set, the inrush control
  mechanism is active current limiting" ]

> +
> +  adi,fault-log-enable:
> +    description:
> +      If set, enables logging fault registers and ADC data into EEPROM upon a
> +      fault.
> +    type: boolean
> +
> +  adi,vpower-drns-enable:
> +    description:
> +      If set, enables the attenuated MOSFET drain voltage to be monitored. This
> +      effectively means that the MOSFET power is monitored. If not set, the
> +      attenuated input voltage (and hence input power) is monitored.
> +    type: boolean
> +
> +  adi,external-fault-fet-off-enable:
> +    description: Turns MOSFET off following an external fault.
> +    type: boolean
> +
> +  adi,undervoltage-retry-disable:
> +    description: Do not retry to turn on the MOSFET after an undervoltage fault.
> +    type: boolean
> +
> +  adi,overvoltage-retry-disable:
> +    description: Do not retry to turn on the MOSFET after an overvoltage fault.
> +    type: boolean
> +
> +  adi,external-fault-retry-enable:
> +    description: Retry to turn on the MOSFET retry after an external fault.
> +    type: boolean

This isn't a bug, but there's a typo in the description where the word
"retry" is repeated.

> +
> +  adi,overcurrent-retries:
> +    description: Configures auto-retry following an Overcurrent fault.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [latch-off, "1", "7", unlimited]
> +    default: latch-off
> +
> +  adi,fet-bad-retries:
> +    description:
> +      Configures auto-retry following a FET bad fault and a consequent MOSFET
> +      turn off.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [latch-off, "1", "7", unlimited]
> +    default: latch-off
> +
> +  adi,pgio1-func:
> +    description: Configures the function of the PGIO1 pin.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [inverted_power_good, power_good, gpio]
> +    default: inverted_power_good
> +
> +  adi,pgio2-func:
> +    description: Configures the function of the PGIO2 pin.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [inverted_power_good, power_good, gpio, active_current_limiting]
> +    default: inverted_power_good
> +
> +  adi,pgio3-func:
> +    description: Configures the function of the PGIO3 pin.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [inverted_power_good_input, power_good_input, gpio]
> +    default: inverted_power_good_input
> +
> +  adi,pgio4-func:
> +    description: Configures the function of the PGIO4 pin.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [inverted_external_fault, external_fault, gpio]
> +    default: inverted_external_fault
> +
> +  adi,gpio-on-adio1:
> +    description: If set, the ADIO1 pin is used as a GPIO.
> +    type: boolean
> +
> +  adi,gpio-on-adio2:
> +    description: If set, the ADIO2 pin is used as a GPIO.
> +    type: boolean
> +
> +  adi,gpio-on-adio3:
> +    description: If set, the ADIO3 pin is used as a GPIO.
> +    type: boolean
> +
> +  adi,gpio-on-adio4:
> +    description: If set, the ADIO4 pin is used as a GPIO.
> +    type: boolean

Does this dependency block force a redundant specification of adi,pgio4-func?
The default for adi,pgio4-func is inverted_external_fault, which means the
default hardware state already supports external fault features.
If a device tree legitimately omits adi,pgio4-func to rely on that default,
will it fail schema validation here since the dependencies keyword strictly
checks for the literal presence of properties without injecting defaults?

> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +dependencies:
> +  adi,gpio-on-adio1:
> +    - gpio-controller
> +    - '#gpio-cells'
> +  adi,gpio-on-adio2:
> +    - gpio-controller
> +    - '#gpio-cells'
> +  adi,gpio-on-adio3:
> +    - gpio-controller
> +    - '#gpio-cells'
> +  adi,gpio-on-adio4:
> +    - gpio-controller
> +    - '#gpio-cells'
> +  adi,external-fault-retry-enable:
> +    - adi,pgio4-func
> +  adi,external-fault-fet-off-enable:
> +    - adi,pgio4-func
> +
> +required:
> +  - compatible
> +  - reg
> +  - adi,rsense-nano-ohms
> +
> +allOf:
> +  - if:
> +      properties:
> +        adi,pgio1-func:
> +          const: gpio
> +      required:
> +        - adi,pgio1-func
> +    then:
> +      required:
> +        - gpio-controller
> +        - '#gpio-cells'
> +
> +  - if:
> +      properties:
> +        adi,pgio2-func:
> +          const: gpio
> +      required:
> +        - adi,pgio2-func
> +    then:
> +      required:
> +        - gpio-controller
> +        - '#gpio-cells'
> +
> +  - if:
> +      properties:
> +        adi,pgio3-func:
> +          const: gpio
> +      required:
> +        - adi,pgio3-func
> +    then:
> +      required:
> +        - gpio-controller
> +        - '#gpio-cells'
> +
> +  - if:
> +      properties:
> +        adi,pgio4-func:
> +          const: gpio
> +      required:
> +        - adi,pgio4-func
> +    then:
> +      properties:
> +        adi,external-fault-retry-enable: false
> +        adi,external-fault-fet-off-enable: false
> +      required:
> +        - gpio-controller
> +        - '#gpio-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        swap-controller@15 {
> +            compatible = "adi,ltc4283";
> +            reg = <0x15>;
> +
> +            adi,rsense-nano-ohms = <500>;
> +            adi,current-limit-sense-microvolt = <25000>;
> +            adi,current-limit-foldback-factor = <10>;
> +            adi,cooling-delay-ms = <8190>;
> +            adi,fet-bad-timer-delay-ms = <512>;
> +
> +            adi,external-fault-fet-off-enable;
> +            adi,pgio4-func = "external_fault";
> +
> +            adi,gpio-on-adio1;
> +            adi,pgio1-func = "gpio";
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 830c6f076b0029f0ff1abee148ad0e1905a60e82..13ae2f3db449e5fd3a7d0fbac92aabdc01734ba9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15141,6 +15141,12 @@ F:	Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml
>  F:	Documentation/hwmon/ltc4282.rst
>  F:	drivers/hwmon/ltc4282.c
>  
> +LTC4283 HARDWARE MONITOR AND GPIO DRIVER
> +M:	Nuno Sá <nuno.sa@analog.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Supported
> +F:	Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
> +
>  LTC4286 HARDWARE MONITOR DRIVER
>  M:	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
>  L:	linux-hwmon@vger.kernel.org
> 
> -- 
> 2.51.0
> 
> 
> 
