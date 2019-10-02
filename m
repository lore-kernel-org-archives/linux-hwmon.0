Return-Path: <SRS0=dESa=X3=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E7CC352AA
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Oct 2019 14:19:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 00F17222C0
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Oct 2019 14:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570025974;
	bh=8GcmlDMDZWAKLDxx4ABFSzP4dQvqF3eFBKWBAB6jmKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ws6kdHK/pW4dz1PD5dDnxnO+1Nunnf/lQvbZLt3o41pmMWa8/+/Ai+iI21TriDsKL
	 /MQHXl6liz+2vJDz2dP7HMOtj9UaSPMobkuvOrIejDrmeBlTCNzosAv/GnUg0heZzf
	 FcuOyfCQDzx3PBR8w1d+0doQj+n0K/cN8Cyq0fbQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728285AbfJBOTd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Oct 2019 10:19:33 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:42905 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728230AbfJBOTc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Oct 2019 10:19:32 -0400
Received: by mail-qk1-f196.google.com with SMTP id f16so15120463qkl.9;
        Wed, 02 Oct 2019 07:19:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=VeC18fTiDpCiD1aerTctLQt8HXgMuu1i7GcCOOIhItk=;
        b=fxqxp3JP+8z1bqxsQrNjBgdPYMmdYCjy+lUY7YncNKsxb0gCwRkQI0hOHz5hl/B32T
         TgPJ3u4ugmnjhTvEgt7f2HPXnP1HLAJ/h8yQ6TR+91U8eSissxysW5Xcdx9E0ue1jrXC
         YQv5n+ZIrHDzgRSvMWJrgmjZHyNB9nsojUrnBYfRRTnhfJIuKbzgANrRko+sLgoQGvtw
         BGxpHIt3SGVeiYf8rlS00F8fO3qDkqOXGYI8AC0bIB99HEYLYuJwITsyMa0eyZkAcL/S
         9DTpJmlakTtvOA5XUhQj9ohDztaJMxoxOxXIDOTJLCpondsgrSMolaBnW4kSqeCYUQh4
         whqg==
X-Gm-Message-State: APjAAAWCJMXZbUibhdCsqy9OjmbchAdh3QLKWkl/3dVnWF7c4afnWnC/
        CUVyH0+ELIUoNcbXA1cuqqnepBs+SA==
X-Google-Smtp-Source: APXvYqxqx5bD5dNV83sTgSiMC7/tuoceP3pYCZ3E9rSZEdOBCkruX4sGwCdWY01UR+WhZB8WoI7dCA==
X-Received: by 2002:a37:84c3:: with SMTP id g186mr3791944qkd.71.1570025971328;
        Wed, 02 Oct 2019 07:19:31 -0700 (PDT)
Received: from localhost ([132.205.230.8])
        by smtp.gmail.com with ESMTPSA id 29sm9359711qkp.86.2019.10.02.07.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 07:19:30 -0700 (PDT)
Date:   Wed, 02 Oct 2019 09:19:27 -0500
From:   Rob Herring <robh@kernel.org>
To:     Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 3/3] dt-bindings: iio: Add ltc2947 documentation
Message-ID: <20191002002331.GA17502@bogus>
References: <20190924124945.491326-1-nuno.sa@analog.com>
 <20190924124945.491326-4-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190924124945.491326-4-nuno.sa@analog.com>
X-Mutt-References: <20190924124945.491326-4-nuno.sa@analog.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Sep 24, 2019 at 02:49:45PM +0200, Nuno Sá wrote:
> Document the LTC2947 device devicetree bindings.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> ---
>  .../bindings/hwmon/adi,ltc2947.yaml           | 101 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 102 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml b/Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml
> new file mode 100644
> index 000000000000..2ea0187421d4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml
> @@ -0,0 +1,101 @@

Missing license. Please make new bindings (GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bindings/hwmon/adi,ltc2947.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices LTC2947 high precision power and energy monitor
> +
> +maintainers:
> +  - Nuno Sá <nuno.sa@analog.com>
> +
> +description: |
> +  Analog Devices LTC2947 high precision power and energy monitor over SPI or I2C.
> +
> +  https://www.analog.com/media/en/technical-documentation/data-sheets/LTC2947.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,ltc2947
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description:
> +      The LTC2947 uses either a trimmed internal oscillator or an external clock
> +      as the time base for determining the integration period to represent time,
> +      charge and energy. When an external clock is used, this property must be
> +      set accordingly.
> +    maxItems: 1
> +
> +  adi,accumulator-ctl-pol:
> +    description:
> +      This property controls the polarity of current that is accumulated to
> +      calculate charge and energy so that, they can be only accumulated for
> +      positive current for example. Since there are two sets of registers for
> +      the accumulated values, this entry can also have two items which sets
> +      energy1/charge1 and energy2/charger2 respectively. Check table 12 of the
> +      datasheet for more information on the supported options.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32-array
> +      - enum: [0, 1, 2, 3]
> +      - minItems: 2
> +      - maxItems: 2
> +    default: [0, 0]

This should be:

allOf:
  - $ref: ...
items:
  enum: [0, 1, 2, 3]
  default: 0
minItems: 2
maxItems: 2

> +
> +  adi,accumulation-deadband-microamp:
> +    description:
> +      This property controls the Accumulation Dead band which allows to set the
> +      level of current below which no accumulation takes place.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - maximum: 255

maximum should be at same indent as allOf. Or default should be at the 
same level as maximum (under a single '-' list entry).

> +    default: 0
> +
> +  adi,gpio-out-pol:
> +    description:
> +      This property controls the GPIO polarity. Setting it to one makes the GPIO
> +      active high, setting it to zero makets it active low. When this property
> +      is present, the GPIO is automatically configured as output and set to
> +      control a fan as a function of measured temperature.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [0, 1]
> +    default: 0

Same here.

> +
> +  adi,gpio-in-accum:
> +    description:
> +      When set, this property sets the GPIO as input. It is then used to control
> +      the accumulation of charge, energy and time. This function can be
> +      enabled/configured separately for each of the two sets of accumulation
> +      registers. Check table 13 of the datasheet for more information on the
> +      supported options. This property cannot be used together with
> +      adi,gpio-out-pol.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32-array
> +      - enum: [0, 1, 2]
> +      - minItems: 2
> +      - maxItems: 2
> +    default: [0, 0]

Similar here.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +
> +examples:
> +  - |
> +    spi0 {

Just 'spi'

> +           #address-cells = <1>;
> +           #size-cells = <0>;
> +
> +           ltc2947_spi: ltc2947@0 {
> +                   compatible = "adi,ltc2947";
> +                   reg = <0>;
> +                   /* accumulation takes place always for energ1/charge1. */
> +                   /* accumulation only on positive current for energy2/charge2. */
> +                   adi,accumulator-ctl-pol = <0 1>;
> +           };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 889f38c1c930..820bdde2044b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9505,6 +9505,7 @@ F:	drivers/hwmon/ltc2947-core.c
>  F:	drivers/hwmon/ltc2947-spi.c
>  F:	drivers/hwmon/ltc2947-i2c.c
>  F:	drivers/hwmon/ltc2947.h
> +F:	Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml
>  
>  LTC4306 I2C MULTIPLEXER DRIVER
>  M:	Michael Hennerich <michael.hennerich@analog.com>
> -- 
> 2.23.0
> 

