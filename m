Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F0FC433EF
	for <linux-hwmon@archiver.kernel.org>; Fri,  4 Feb 2022 23:32:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378190AbiBDXch (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 4 Feb 2022 18:32:37 -0500
Received: from mail-oo1-f51.google.com ([209.85.161.51]:42875 "EHLO
        mail-oo1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234948AbiBDXch (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 4 Feb 2022 18:32:37 -0500
Received: by mail-oo1-f51.google.com with SMTP id w5-20020a4a9785000000b0030956914befso6379360ooi.9;
        Fri, 04 Feb 2022 15:32:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KcTj9dEcrviOHQz+AnbjieXf51h9e3tvw+Y8xZow8uw=;
        b=VzcbO8q0dpwGAnd/AWDWQw4InklKFNQFnItKd5Pfu57OBjqpQ4fOwAAm5dLrwKyqZL
         zex2AHJAyV9KNASQizWLbAIhCPwgCu7i4dB7YPLZXXJBZAN3spKtlVGPZbdqeJPjRx5J
         KrPAsJLWgy3OsallBdINBCsiKmXNS0YEdkRJw1/ex76+FavQi3B8WgJoryxEFzVSlQ8r
         8htmqxfiJon0k+mlBDAZyxg6lUYJajYSRm5Iq3LS2VzaodCiiNM9ejuoWVenF6vwo2iP
         /WlD6sZCxfX0k4unz/ZNYsxcWhp3PL45ecfh0fFV8nVvqPgDjnUs6LLQWIYugDK14rEV
         Z+qg==
X-Gm-Message-State: AOAM532BV4q5ssC8aZDZwKBN8DN98V4c31Z39hMXZAFqdmubhM4ZeJ6J
        q1KMI5ynyTQESrHT0WJfMA==
X-Google-Smtp-Source: ABdhPJw9g8xk9SbCc58QldjT38YtjIIVPKXXaWrfilh7C0qtDoNF7A40+XJXn1VpLZGVhztyBObr0A==
X-Received: by 2002:a05:6870:e6d1:: with SMTP id s17mr349214oak.143.1644017557023;
        Fri, 04 Feb 2022 15:32:37 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id v26sm1252542ooq.20.2022.02.04.15.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 15:32:36 -0800 (PST)
Received: (nullmailer pid 3389813 invoked by uid 1000);
        Fri, 04 Feb 2022 23:32:35 -0000
Date:   Fri, 4 Feb 2022 17:32:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     Marcello Sylvester Bauer <sylv@sylv.io>
Cc:     linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Roland Stigge <stigge@antcom.de>, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 3/4] dt-bindings: hwmon: Add binding for max6639
Message-ID: <Yf23k5vrZ8CEAKda@robh.at.kernel.org>
References: <cover.1643299570.git.sylv@sylv.io>
 <224e73b57101aa744244bd396a700d5365eb72ec.1643299570.git.sylv@sylv.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <224e73b57101aa744244bd396a700d5365eb72ec.1643299570.git.sylv@sylv.io>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Jan 27, 2022 at 05:17:29PM +0100, Marcello Sylvester Bauer wrote:
> Add Devicetree binding documentation for Maxim MAX6639 temperature
> monitor with PWM fan-speed controller.
> 
> The devicetree documentation for the SD3078 device tree.
> 
> Signed-off-by: Marcello Sylvester Bauer <sylv@sylv.io>
> ---
>  .../bindings/hwmon/maxim,max6639.yaml         | 112 ++++++++++++++++++
>  1 file changed, 112 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
> new file mode 100644
> index 000000000000..570e9fe07503
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
> @@ -0,0 +1,112 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/hwmon/maxim,max6639.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Maxim max6639
> +
> +maintainers:
> +  - Roland Stigge <stigge@antcom.de>
> +
> +description: |
> +  The MAX6639 is a 2-channel temperature monitor with dual, automatic, PWM
> +  fan-speed controller.  It monitors its own temperature and one external
> +  diode-connected transistor or the temperatures of two external diode-connected
> +  transistors, typically available in CPUs, FPGAs, or GPUs.
> +
> +  Datasheets:
> +    https://datasheets.maximintegrated.com/en/ds/MAX6639-MAX6639F.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - maxim,max6639
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - "channel@0"
> +  - "channel@1"
> +
> +additionalProperties: false
> +
> +patternProperties:
> +  "^channel@[0-1]$":

fan@...

> +    type: object
> +    description: |
> +      Represents the two fans and their specific configuration.
> +
> +    properties:
> +      reg:
> +        description: |
> +          The fan number.
> +        items:
> +          minimum: 0
> +          maximum: 1
> +
> +      pwm-polarity:

See PWM_POLARITY_INVERTED

> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1]
> +        default: 1
> +        description:
> +          PWM output is low at 100% duty cycle when this bit is set to zero. PWM
> +          output is high at 100% duty cycle when this bit is set to 1.
> +
> +      pulses-per-revolution:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [1, 2, 3, 4]
> +        default: 2
> +        description:
> +          Value specifying the number of pulses per revolution of the controlled
> +          FAN.
> +
> +      rpm-max:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [2000, 4000, 8000, 16000]
> +        default: 4000
> +        description:
> +          Scales the tachometer counter by setting the maximum (full-scale) value
> +          of the RPM range.

Why do you need to know the max? I don't recall needing this for other 
fan controller bindings.

All this needs to be pulled out to a common schema fan that is 
referenced.

> +
> +    required:
> +      - reg

This should all be in a common fan schema that can be re
> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      max6639@10 {
> +        compatible = "maxim,max6639";
> +        reg = <0x10>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        channel@0 {
> +          reg = <0x0>;
> +          pwm-polarity = <1>;
> +          pulses-per-revolution = <2>;
> +          rpm-range = <4000>;
> +        };
> +
> +        channel@1 {
> +          reg = <0x1>;
> +          pwm-polarity = <1>;
> +          pulses-per-revolution = <2>;
> +          rpm-range = <4000>;
> +        };
> +      };
> +    };
> +...
> -- 
> 2.34.1
> 
> 
