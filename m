Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 537CCC433EF
	for <linux-hwmon@archiver.kernel.org>; Thu,  3 Feb 2022 19:07:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353686AbiBCTHj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 3 Feb 2022 14:07:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234813AbiBCTHj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 3 Feb 2022 14:07:39 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CE7FC061714;
        Thu,  3 Feb 2022 11:07:39 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id m10so5615773oie.2;
        Thu, 03 Feb 2022 11:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eCuuemjXeI2Xft57eZOD6i/qhA3d7D7300BKm3xWh2U=;
        b=dO0Qc23eRNM+UbEtVBF4/VqVQMZTZQ714+OdDYiKduiTfIZdoWg9M3IiSa8zdbQYjb
         3D7bHuWhtTdbiGfytmXYI+Vm/yUS+gnT65xG6ILj1V7lyOmeFD6sXGEPv0bRTM7L+ydV
         T5pstle0QQuxcbtoy1fWXjsY/IGTZRPLWaf41NAJw5X4VtOm51AfJw0PEaTgHIc8X5eq
         sNXGDiITLRXbKKKQchUojOiZyIznv4ju3RFi2k/ITN/Ubn38ZpsvOiacXNlzY8JXYBCr
         ay7f4O4WrKIQOIz6GGZwbRV4v17j94UQ9mVxr8edJBPClXi6Fbi2zKR5L9NcpEoywo1F
         OPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=eCuuemjXeI2Xft57eZOD6i/qhA3d7D7300BKm3xWh2U=;
        b=iXhWrilNNvzTjsNtCdWde6/NIdcH9wpMXcY7o5pdemSyFBdaGDeHFYMREJBsA9vy+D
         wjCsXlCb/EMmURO7i9R9HI1CF8l4lqx2rQsceXDpXEfKOXkEMEpuAhieXCftHiHwtQra
         wsQoGBC5NLOAUeDTBmB6CVbEiyHsdrrbmNoJClBPrSkVp5tTv5j8MdQzWgf7HKhtc6rM
         u6lbqTNi/tRLNtxCDFrIspyLXXFwNfA3lQsdFoXucVTL4d1acpKrgvWbsbkjy+21a8VH
         cVYHSehu4iOWjaPSa4U26xPSGdQdXo+C1BgCGCPfnb9zIdNVsVzcuZGD2U058e/BKDYq
         WoFg==
X-Gm-Message-State: AOAM531kej3Ip3N6utPM/cNHwZ2mPnPc0aKP73pImCi7vmveKNNrSlCz
        jbgbsMasGsXlJYjywzyDVNw=
X-Google-Smtp-Source: ABdhPJwWCq+84Z0ZalGxzYEc03l0kH1P2pzwG/FA1zyF23+X8tO38hF/3DuGEa9ycO4sy5lmMOBM5w==
X-Received: by 2002:a05:6808:11cf:: with SMTP id p15mr8511449oiv.209.1643915258519;
        Thu, 03 Feb 2022 11:07:38 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z17sm15881296otk.62.2022.02.03.11.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 11:07:37 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 3 Feb 2022 11:07:36 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Marcello Sylvester Bauer <sylv@sylv.io>
Cc:     linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Roland Stigge <stigge@antcom.de>, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 3/4] dt-bindings: hwmon: Add binding for max6639
Message-ID: <20220203190736.GA236927@roeck-us.net>
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

lgtm, but we'll have to wait for dt review.

Guenter

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
> +
> +    required:
> +      - reg
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
