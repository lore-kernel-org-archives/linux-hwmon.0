Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 405D9C6FA8E
	for <linux-hwmon@archiver.kernel.org>; Fri, 23 Sep 2022 11:09:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231341AbiIWLJI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 23 Sep 2022 07:09:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbiIWLJH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 23 Sep 2022 07:09:07 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 158B1131F54
        for <linux-hwmon@vger.kernel.org>; Fri, 23 Sep 2022 04:09:04 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id y11so12605349pjv.4
        for <linux-hwmon@vger.kernel.org>; Fri, 23 Sep 2022 04:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=272D0hG/Ha0B1Yebkuj63s7D6j3RhV9b5TJtxOtd/ok=;
        b=U/IDhz3ZCT6WmB6ym3aAigDGVN/Op726Rzt5Ab6W9uCPDDZ7mqHeMi6aft4DTu55LR
         pi9XKbcSpLzOaGHSlQoi6G394meWU0MmsgGEiZqhtZ3zepJYWwJXKKSG7inPdBlhvsJI
         tNR93IGc4Ro6bgVKgTdlCIC0bFFj8zgZx+zIXYdH1GMFpDEZy5XobMe2d08OmsvKEBrk
         gmbL4k7gbSSW1ULEHlS+fN2sQpiPELk7uR5ePW6c/RMsi/cLqKLS124g50jnjIcrTuvU
         dvPPZ/jsYrrKWqtkRbzFQ2EF7WqrCkSI8I7G4gTkYYY9Dpu3X14zSmYFwW293k9Na/7n
         28JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=272D0hG/Ha0B1Yebkuj63s7D6j3RhV9b5TJtxOtd/ok=;
        b=PfxjLdN4WjW34odAML0dW/Gz+RHl+C8hxmzRdISMmBwmnw4eJg5l7hf2VgKcUvIIxY
         4Q48HCzpKF0MfTAqmYRMKFQkjPhLJpsCdcH++Wk33yU1R+m/7s4rKM2YE9jRpwGtdfyV
         yYH/ov+KwXdZeq8DI29+Lq1foZoklp+89WDQCu3wou1Yw5iknHLzC/YzlD5sVTuIz3my
         v+16CjCBtp9K0oaPQC5cFFo+wSf+Lsw9iiSzUqj+GrxgHyBL0mfyXFis7XpyBwz4PNoF
         arGL7hYBOVLU2H7Kp85Ch1oslNYdbI4bdgxkstxGSuPN+F6mOaYa4ivmrjebBTP86e+w
         YWHg==
X-Gm-Message-State: ACrzQf3d1PbPf0rM7Hi2w9A4bmtHx39kiGdrKtxz+GyrOt6+xsRn4ugS
        Yy9cpl4opJ5ndKp0ckHuuoy8KdLOZUs28IPgzJs7tgVZVsa34Q==
X-Google-Smtp-Source: AMsMyM54bHzAx6TnOAho9bwOMUXQO5P+GU/uo7LLC0vqoBySGFXpPNHg0Si+bJHtTUWiCxWVQgnyh1MhIrW5nzXyD1k=
X-Received: by 2002:a17:903:25c4:b0:178:b625:e9f6 with SMTP id
 jc4-20020a17090325c400b00178b625e9f6mr8010749plb.120.1663931343800; Fri, 23
 Sep 2022 04:09:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220922050718.1079651-1-Naresh.Solanki@9elements.com> <20220922050718.1079651-2-Naresh.Solanki@9elements.com>
In-Reply-To: <20220922050718.1079651-2-Naresh.Solanki@9elements.com>
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
Date:   Fri, 23 Sep 2022 13:09:11 +0200
Message-ID: <CALNFmy2_wQ+qFCFjh8NcPy9QR95HYA1h6SS40MaYMFVNbpL3vQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add binding for max6639
To:     Naresh Solanki <naresh.solanki@9elements.com>
Cc:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Roland Stigge <stigge@antcom.de>, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Marcello Sylvester Bauer <sylv@sylv.io>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 22, 2022 at 7:07 AM Naresh Solanki
<naresh.solanki@9elements.com> wrote:
>
> From: Marcello Sylvester Bauer <sylv@sylv.io>
>
> Add Devicetree binding documentation for Maxim MAX6639 temperature
> monitor with PWM fan-speed controller.
>
> Signed-off-by: Marcello Sylvester Bauer <sylv@sylv.io>
> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
> ---
>  .../bindings/hwmon/maxim,max6639.yaml         | 112 ++++++++++++++++++
>  1 file changed, 112 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
>
> diff --git a/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
> new file mode 100644
> index 000000000000..c845fb989af2
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
> +  - "fan@0"
> +  - "fan@1"
Why are both fan children required? The driver doesn't care and uses
the default settings if not present.

> +
> +additionalProperties: false
> +
> +patternProperties:
> +  "^fan@[0-1]$":
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
> +      maxim,rpm-range:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [2000, 4000, 8000, 16000]
> +        default: 4000
> +        description:
> +          Scales the tachometer counter by setting the maximum (full-scale) value
> +          of the RPM range for max6639.
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
> +        fan@0 {
> +          reg = <0x0>;
> +          pwm-polarity = <1>;
> +          pulses-per-revolution = <2>;
> +          maxim,rpm-range = <4000>;
> +        };
> +
> +        fan@1 {
> +          reg = <0x1>;
> +          pwm-polarity = <1>;
> +          pulses-per-revolution = <2>;
> +          maxim,rpm-range = <4000>;
> +        };
> +      };
> +    };
> +...
> --
> 2.35.3
>
