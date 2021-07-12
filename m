Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D58D9C07E99
	for <linux-hwmon@archiver.kernel.org>; Mon, 12 Jul 2021 14:57:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF10961167
	for <linux-hwmon@archiver.kernel.org>; Mon, 12 Jul 2021 14:57:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235194AbhGLPAm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 12 Jul 2021 11:00:42 -0400
Received: from mail-il1-f170.google.com ([209.85.166.170]:46031 "EHLO
        mail-il1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233784AbhGLPAm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 12 Jul 2021 11:00:42 -0400
Received: by mail-il1-f170.google.com with SMTP id b6so10235193iln.12;
        Mon, 12 Jul 2021 07:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WVxRJEnC1GdQvhchP0t++AaKpXBj2Uta5gjvaVcQ8l0=;
        b=VWBFVgKqV7SrK3ZfhRciuI8UMbvjzmIEhF7dhUSiVDNI4a1o/wsovYG+/vVUZzwX/o
         U+9ZDhvMyDnHX3i5B+cZLgPKPlpJ6CQE6i8z5bQGLYin45zrd7ZzpJXqn7c/lMfAWl0f
         EiNnvj/9LRkwp8o1UDddzgqtglQiCmUgpyNM1taaJs7lGZzU1I0KBvz+fm85ebHX+dPS
         MX1/CrAjvtb9xtyaIlYgmaJav3AAkGJxzhGIlbE5TD1jlR8ZMUB5i1gvcTR933niVrYh
         /dak3CF/48UgxsYJz08lMFHuJmVLme8/iU94zPdM+XbVoEzYal9+I8D5A7iIEkRM84PR
         GJNg==
X-Gm-Message-State: AOAM531yQM4yQ7s+KZTVI2lTIA766r6GO7zmEcPuQVO8NlWIMsWdxee+
        3eoGdjALJsBOcQmV9PB7921HLkE/OQ==
X-Google-Smtp-Source: ABdhPJwTWG2XzaqVCYwc/OPCbgG1nfl/Hw3uzMQNldk0we+DPR76FQ6tAycpo/NEcC/HzOrTOHZPfA==
X-Received: by 2002:a05:6e02:1a24:: with SMTP id g4mr4417167ile.260.1626101872563;
        Mon, 12 Jul 2021 07:57:52 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id 15sm8238197ilt.66.2021.07.12.07.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 07:57:51 -0700 (PDT)
Received: (nullmailer pid 1919318 invoked by uid 1000);
        Mon, 12 Jul 2021 14:57:49 -0000
Date:   Mon, 12 Jul 2021 08:57:49 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org,
        Javier Martinez Canillas <javier@dowhile0.org>,
        Johannes Pointner <johannes.pointner@gmail.com>,
        Peter Rosin <peda@axentia.se>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: hwmon: Convert NTC thermistor to YAML
Message-ID: <20210712145749.GA1911897@robh.at.kernel.org>
References: <20210703173456.4002549-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210703173456.4002549-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Jul 03, 2021 at 07:34:56PM +0200, Linus Walleij wrote:
> This converts the NTC thermistor DT bindings to YAML. Some care had to
> be taken since I had to add some illustrations to make the connection
> layouts graspable.
> 
> Cc: Javier Martinez Canillas <javier@dowhile0.org>
> Cc: Johannes Pointner <johannes.pointner@gmail.com>
> Cc: Peter Rosin <peda@axentia.se>
> Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Realize I need to CC devicetree@vger.kernel.org on this.
> - Fix Javier's mail address.
> - Drop Naveen's mail (bouncing)
> ---
>  .../bindings/hwmon/ntc-thermistor.yaml        | 142 ++++++++++++++++++
>  .../bindings/hwmon/ntc_thermistor.txt         |  44 ------
>  2 files changed, 142 insertions(+), 44 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/ntc-thermistor.yaml
>  delete mode 100644 Documentation/devicetree/bindings/hwmon/ntc_thermistor.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ntc-thermistor.yaml b/Documentation/devicetree/bindings/hwmon/ntc-thermistor.yaml
> new file mode 100644
> index 000000000000..87589da631c9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/ntc-thermistor.yaml
> @@ -0,0 +1,142 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +---
> +$id: http://devicetree.org/schemas/hwmon/ntc-thermistor.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NTC thermistor temperature sensors
> +
> +maintainers:
> +  - Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +description: |
> +  Thermistors with negative temperature coefficient (NTC) are resistors that
> +  vary in resistance in an often non-linear way in relation to temperature.
> +  The negative temperature coefficient means that the resistance decreases
> +  as the temperature rises. Since the relationship between resistance and
> +  temperature is non-linear, software drivers most often need to use a look
> +  up table and interpolation to get from resistance to temperature.
> +
> +  When used in practice, a thermistor is often connected between ground, a
> +  pull-up resistor or/and a pull-down resistor and a fixed voltage like this:
> +
> +      + e.g. 5V = pull-up voltage (puv)
> +      |
> +     +-+
> +     | |
> +     | | Pull-up resistor
> +     | | (puo)
> +     +-+
> +      |-------------------------o
> +     +-+ |                      ^
> +     | |/                       |
> +     | /                        |
> +     |/| Thermistor             | Measured voltage (mv)
> +     / |                        | "connected ground"
> +    /| |                        |
> +     +-+                        |
> +      |-------------------------o
> +     +-+                        ^
> +     | |                        |
> +     | | Pull-down resistor     | Measured voltage (mv)
> +     | | (pdo)                  | "connected positive"
> +     +-+                        |
> +      |                         |
> +      |                         v
> +      + GND                     GND
> +
> +  The arrangements of where we measure the voltage over the thermistor are
> +  called "connected ground" and "connected positive" and shall be understood as
> +  the cases when either pull-up or pull-down resistance is zero.
> +
> +  If the pull-up resistance is 0 one end of the thermistor is connected to the
> +  positive voltage and we get the thermistor on top of a pull-down resistor
> +  and we take the measure between the thermistor and the pull-down resistor.
> +
> +  Conversely if the pull-down resistance is zero, one end of the thermistor is
> +  connected to ground and we get the thermistor under the pull-up resistor
> +  and we take the measure between the pull-up resistor and the thermistor.
> +
> +  We can use both pull-up and pull-down resistors at the same time, and then
> +  the figure illustrates where the voltage will be measured for the "connected
> +  ground" and "connected positive" cases.
> +
> +properties:
> +  $nodename:
> +    pattern: "^thermistor(.*)?$"
> +
> +  compatible:
> +    oneOf:
> +      - const: epcos,b57330v2103
> +      - const: epcos,b57891s0103
> +      - const: murata,ncp15wb473
> +      - const: murata,ncp18wb473
> +      - const: murata,ncp21wb473
> +      - const: murata,ncp03wb473
> +      - const: murata,ncp15wl333
> +      - const: murata,ncp03wf104
> +      - const: murata,ncp15xh103

All these can be 1 enum.

> +      # Deprecated "ntp," compatible strings
> +      - const: ntc,ncp15wb473
> +        deprecated: true
> +      - const: ntc,ncp18wb473
> +        deprecated: true
> +      - const: ntc,ncp21wb473
> +        deprecated: true
> +      - const: ntc,ncp03wb473
> +        deprecated: true
> +      - const: ntc,ncp15wl333
> +        deprecated: true

And these too.

> +
> +  # See /schemas/thermal/thermal-sensor.yaml for details

Drop. (I hope to generate documentation from the schema and 
automagically create references/links.)

> +  "#thermal-sensor-cells":
> +    description: Thermal sensor cells if used for thermal sensoring.
> +    const: 0
> +
> +  pullup-uv:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Pull-up voltage in micro volts. Must always be specified.
> +
> +  pullup-ohm:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Pull-up resistance in ohms. Must always be specified, even
> +      if zero.
> +
> +  pulldown-ohm:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Pull-down resistance in ohms. Must always be specified, even
> +      if zero.
> +
> +  connected-positive:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: Indicates how the thermistor is connected in series with
> +      a pull-up and/or a pull-down resistor. See the description above for
> +      an illustration. If this flag is NOT specified, the thermistor is assumed
> +      to be connected-ground, which usually means a pull-down resistance of
> +      zero but complex arrangements are possible.
> +
> +  # See /schemas/iio/adc/adc.yaml
> +  io-channels:
> +    maxItems: 1
> +    description: IIO ADC channel to read the voltage over the resistor. Must
> +      always be specified.
> +
> +required:
> +  - compatible
> +  - pullup-uv
> +  - pullup-ohm
> +  - pulldown-ohm
> +  - io-channels
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    thermistor0 {
> +      compatible = "murata,ncp18wb473";
> +      io-channels = <&gpadc 0x06>;
> +      pullup-uv = <1800000>;
> +      pullup-ohm = <220000>;
> +      pulldown-ohm = <0>;
> +      #thermal-sensor-cells = <0>;
> +    };
