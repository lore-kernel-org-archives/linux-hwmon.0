Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C7C2C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri,  8 Oct 2021 12:56:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5D8060E95
	for <linux-hwmon@archiver.kernel.org>; Fri,  8 Oct 2021 12:56:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241603AbhJHM6o (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 8 Oct 2021 08:58:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230258AbhJHM6o (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 8 Oct 2021 08:58:44 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD24FC061570;
        Fri,  8 Oct 2021 05:56:48 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id t4so11815506oie.5;
        Fri, 08 Oct 2021 05:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=V63qv/jYzPM0fFY3PqPhokRoYHonuC+5thUplbcP5Xk=;
        b=f20GwZyWF8zfY14hwKjNK8PMKRCnZMU1sPdrE+RvXi66Euw0EhiGFsPDW+AkFMPExb
         t3mtU9ZC8TD1sIACpuvJ1IMQNf5b7tzGAdrmCe1XtZ/vWZnyy//nQfT0DA9XChWBTj4C
         aWq1cZP99eCMvDlmkXPoPDrjdmX0iAHy9EHuJEoxK5+NVivxvOWik9iHoSGu0DnkkOs3
         Hiq9jM4kFi+QM2It9s1xbJHpkbzYuJZ5pZypqugJQS1gN+O1xi6zs0AI5dqwix3QsZzY
         y7Ke3jrFy8PIqfOJw+bY/GS7RPwlqFQ/Rnm3wRCYPsiaHyNsmt9stHhXWox7G/DpgtKL
         RR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=V63qv/jYzPM0fFY3PqPhokRoYHonuC+5thUplbcP5Xk=;
        b=6gUrKN2obuy5vhV7l6Mhn8vzpqhs/lbVJk3L4wU+Xwk2Dg4lwXOQI2gPdvYG40uMmC
         jmg1716R5vKrLz4VUS8N8SOo8RNxyNzTY4xwcnGPMrPE77bi9hiHOi1rBiqB8dJ+E9QI
         Tu++a0pad41FdgpmvbhZkPCNidUgo7T3ySJ/661w3zwHDBwHyPFT8kOcsNAkBBw9tiU9
         FynmB8OIlyOxyIjKjTPWM/xV+q5yp3O2+8REwLP+TjA1vwtSssMxZRAQs9jPLliJvwe8
         GvSGCaej25+6Y19nnpvpGi0aLP38yu/RbR7Xi3/Dhw2Ddh/s0zMsc5MDS4FMCUoXsbTe
         O0Qw==
X-Gm-Message-State: AOAM531yFKprlGUkACt/PRQwj0qODP+tm/EEsNPQeqv9U8vvI2K2G0ly
        d43WCkCeoA/tyms6MLcIqj0=
X-Google-Smtp-Source: ABdhPJywnbg3rV4+7SfSfUAQzPjaDFhSnFbqC7OJx9NrOvw3SLVn9huoUOwHjTDNd6j951UJZW/Srw==
X-Received: by 2002:a54:4e94:: with SMTP id c20mr7340587oiy.57.1633697808236;
        Fri, 08 Oct 2021 05:56:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v1sm506867otj.70.2021.10.08.05.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 05:56:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 8 Oct 2021 05:56:46 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Javier Martinez Canillas <javier@dowhile0.org>,
        Johannes Pointner <johannes.pointner@gmail.com>,
        Peter Rosin <peda@axentia.se>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: hwmon: Convert NTC thermistor to YAML
Message-ID: <20211008125646.GA3534032@roeck-us.net>
References: <20210922233901.1871274-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210922233901.1871274-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 23, 2021 at 01:39:01AM +0200, Linus Walleij wrote:
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
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied.

Thanks,
Guenter

> ---
> ChangeLog v2->v3:
> - Rebase on v5.15-rc1
> - Drop comment reference to thermal-sensor.yaml
> - Keep the oneOf rather than using an enum for the compatible:
>   I can't figure out how to make deprecated work for enums?
>   https://lore.kernel.org/linux-hwmon/CACRpkdZDLSA5YJtc3XCkfPZUNqo1MOWLBwVDGQ4vN8cDXD3aYg@mail.gmail.com/
> ChangeLog v1->v2:
> - Realize I need to CC devicetree@vger.kernel.org on this.
> - Fix Javier's mail address.
> - Drop Naveen's mail (bouncing)
> ---
>  .../bindings/hwmon/ntc-thermistor.yaml        | 141 ++++++++++++++++++
>  .../bindings/hwmon/ntc_thermistor.txt         |  44 ------
>  2 files changed, 141 insertions(+), 44 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/ntc-thermistor.yaml
>  delete mode 100644 Documentation/devicetree/bindings/hwmon/ntc_thermistor.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ntc-thermistor.yaml b/Documentation/devicetree/bindings/hwmon/ntc-thermistor.yaml
> new file mode 100644
> index 000000000000..9e77cee07dbc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/ntc-thermistor.yaml
> @@ -0,0 +1,141 @@
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
> +
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
> diff --git a/Documentation/devicetree/bindings/hwmon/ntc_thermistor.txt b/Documentation/devicetree/bindings/hwmon/ntc_thermistor.txt
> deleted file mode 100644
> index 4c5c3712970e..000000000000
> --- a/Documentation/devicetree/bindings/hwmon/ntc_thermistor.txt
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -NTC Thermistor hwmon sensors
> --------------------------------
> -
> -Requires node properties:
> -- "compatible" value : one of
> -	"epcos,b57330v2103"
> -	"epcos,b57891s0103"
> -	"murata,ncp15wb473"
> -	"murata,ncp18wb473"
> -	"murata,ncp21wb473"
> -	"murata,ncp03wb473"
> -	"murata,ncp15wl333"
> -	"murata,ncp03wf104"
> -	"murata,ncp15xh103"
> -
> -/* Usage of vendor name "ntc" is deprecated */
> -<DEPRECATED>	"ntc,ncp15wb473"
> -<DEPRECATED>	"ntc,ncp18wb473"
> -<DEPRECATED>	"ntc,ncp21wb473"
> -<DEPRECATED>	"ntc,ncp03wb473"
> -<DEPRECATED>	"ntc,ncp15wl333"
> -
> -- "pullup-uv"	Pull up voltage in micro volts
> -- "pullup-ohm"	Pull up resistor value in ohms
> -- "pulldown-ohm" Pull down resistor value in ohms
> -- "connected-positive" Always ON, If not specified.
> -		Status change is possible.
> -- "io-channels"	Channel node of ADC to be used for
> -		conversion.
> -
> -Optional node properties:
> -- "#thermal-sensor-cells" Used to expose itself to thermal fw.
> -
> -Read more about iio bindings at
> -	https://github.com/devicetree-org/dt-schema/blob/master/schemas/iio/
> -
> -Example:
> -	ncp15wb473@0 {
> -		compatible = "murata,ncp15wb473";
> -		pullup-uv = <1800000>;
> -		pullup-ohm = <47000>;
> -		pulldown-ohm = <0>;
> -		io-channels = <&adc 3>;
> -	};
