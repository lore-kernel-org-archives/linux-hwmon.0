Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E07C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 25 Jan 2022 06:49:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359686AbiAYGtb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 25 Jan 2022 01:49:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358766AbiAYGqY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 25 Jan 2022 01:46:24 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0536FC061768;
        Mon, 24 Jan 2022 21:08:08 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id m9so14566685oia.12;
        Mon, 24 Jan 2022 21:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3zHucago0KMMDuM1xTqy4nCKeA990ZoKYszzwxXx8QU=;
        b=e1AGsOImoW62Z6UyZe7p2l6YPlcnvx6g/nIuSQSdi/XYa3TTV+nY9W8z6DADAP0JVE
         VUh6Qq0HcNfWX387y7iSi1K1bt1elTu6fULQQ9W9po5JsADOF51n7OaMHkZ4wYrqL1HB
         vaFkSwj+c/gYsX5Ju89hozmvgd0B9QBFlj4gRxmMXqHdutwMkdtN3PinQdRDce2XhnXj
         qfdA2G363UFjEuhDdlkEJyL6cXpiIAizkpaszUN9b6D2ayq05TdGovMhlYkNo/Gdrvsu
         aBkOjeVvg2cHdyGC01/Wh75K+D5x0rn5HQ3WDPlg8fgyXv+CFGtKZDaZYv9c0l2ymY4R
         KPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=3zHucago0KMMDuM1xTqy4nCKeA990ZoKYszzwxXx8QU=;
        b=4M21OsoPHiqqjQl11zGZbu9FbdoIQPjlfyRW0kIfFGnAO1lIcs4OycRg8XLcup/cVw
         HweFMCAucY0dUrBkV0mGbxUPZb7J3GKjNoDTWSSHUXxv46GahNtITbVyl15EFBXt9Gn1
         IpFuR3WyNrKf+HFWfN1Y7R709sgxkdmUGKm3GPO9quSk4jEq1IOcRr88kHzLGNDzCeoo
         IJEDKrzdIbO9DMxwrxOYxKf1rzBslhQLzhTqAcerut5CwhuY7hlenXkaqJj8jatuwITG
         v/qdIAHlohnOZPBRjtBLkznUHLQZHKTpV40fXjA8j8oYTohj+FMYFafmfnmLx0aLDBYl
         +axg==
X-Gm-Message-State: AOAM531GhaMpYym8OvVfby6k8/nJhdYDvMgR+IumpjsAjBAVDrhfmSdS
        SaIDKEa3wAX++edxHwrZh/7EOjLXVek=
X-Google-Smtp-Source: ABdhPJzQBU266dsrRyi7Zm+emdQWA7jSFil+VBcZsUvevT+3WEtUHcKDluHwBW7H6Yl46X0oah0TWQ==
X-Received: by 2002:a05:6808:1a23:: with SMTP id bk35mr4282567oib.52.1643087287369;
        Mon, 24 Jan 2022 21:08:07 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k11sm2137125otb.68.2022.01.24.21.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 21:08:06 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 24 Jan 2022 21:08:04 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Marcello Sylvester Bauer <sylv@sylv.io>
Cc:     linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Roland Stigge <stigge@antcom.de>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/4] dt-bindings: hwmon: Add binding for max6639
Message-ID: <20220125050804.GA361944@roeck-us.net>
References: <cover.1642585539.git.sylv@sylv.io>
 <24e812dc80983ce20cd51a446c4f6d4a1db7da37.1642585539.git.sylv@sylv.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24e812dc80983ce20cd51a446c4f6d4a1db7da37.1642585539.git.sylv@sylv.io>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Jan 19, 2022 at 10:53:54AM +0100, Marcello Sylvester Bauer wrote:
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
> index 000000000000..7093cbeba44b
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
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1]
> +        description:
> +          PWM output is low at 100% duty cycle when this bit is set to zero. PWM
> +          output is high at 100% duty cycle when this bit is set to 1.
> +
> +      pulses-per-revolution:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [1, 2, 3, 4]
> +        description:
> +          Value specifying the number of pulses per revolution of the controlled
> +          FAN.
> +

I think the above two properties should be optional.
pulses-per-revolution is 2 for almost all fans out there,
and pwm polarity is positive almost all the time.

> +      rpm-range:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [2000, 4000, 8000, 16000]
> +        description:
> +          Scales the tachometer counter by setting the maximum (full-scale) value
> +          of the RPM range.
> +
Isn't this the maximum rpm ? Using the term "range" seems to be
a bit misleading.

> +    required:
> +      - reg
> +      - pwm-polarity
> +      - pulses-per-revolution
> +      - rpm-range
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
