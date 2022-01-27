Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B922C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 27 Jan 2022 14:49:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238164AbiA0OtT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 27 Jan 2022 09:49:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238121AbiA0OtT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Jan 2022 09:49:19 -0500
Received: from mout-y-111.mailbox.org (mout-y-111.mailbox.org [IPv6:2001:67c:2050:1::465:111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF684C061714;
        Thu, 27 Jan 2022 06:49:18 -0800 (PST)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:105:465:1:3:0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-y-111.mailbox.org (Postfix) with ESMTPS id 4Jl3Q41Tljz9sH1;
        Thu, 27 Jan 2022 15:49:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sylv.io; s=MBO0001;
        t=1643294954;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FF8+oawUKMaz29IqMMpfs7eXCdT8kpzrL/KwN7xVNoM=;
        b=BeYOZ0kOBuvx9QAzastIyIuEFpvagGoZXTeSxm4rFcvZhJuOpi/JVj5oyJ/GpsHzhFDNpu
        roV6dsCAa9sKvVsHR1iUcFXdmIesEAt4JYntO/vUIwMEYYw05zHj5PRcpDi54ASJgXhBom
        uVQ724yu/3GJg5IocKB6D72tvf9XtLcgUQRxo+ySDvAC7s0pxl0+QcaScvzS0pMD+Crb7S
        pG6CThrNm3HIEwJ4yqsjJFMeqMJVuYlHe7AJNjlawnuZ0egbPKVOet+3TkrquZWSqURXjA
        gahE0hS7i/0SRCLApZhG2pUlk8/gfVAt/kcH7YYH2Rjb5s5okRqB1AdGeytxEQ==
Message-ID: <9f1f48ac68f0afed92d7fa114fb8af74c81aa581.camel@sylv.io>
Subject: Re: [PATCH v3 3/4] dt-bindings: hwmon: Add binding for max6639
From:   sylv <sylv@sylv.io>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Roland Stigge <stigge@antcom.de>, devicetree@vger.kernel.org
Date:   Thu, 27 Jan 2022 15:49:08 +0100
In-Reply-To: <20220125050804.GA361944@roeck-us.net>
References: <cover.1642585539.git.sylv@sylv.io>
         <24e812dc80983ce20cd51a446c4f6d4a1db7da37.1642585539.git.sylv@sylv.io>
         <20220125050804.GA361944@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, 2022-01-24 at 21:08 -0800, Guenter Roeck wrote:
> On Wed, Jan 19, 2022 at 10:53:54AM +0100, Marcello Sylvester Bauer
> wrote:
> > Add Devicetree binding documentation for Maxim MAX6639 temperature
> > monitor with PWM fan-speed controller.
> > 
> > The devicetree documentation for the SD3078 device tree.
> > 
> > Signed-off-by: Marcello Sylvester Bauer <sylv@sylv.io>
> > ---
> >  .../bindings/hwmon/maxim,max6639.yaml         | 112
> > ++++++++++++++++++
> >  1 file changed, 112 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
> > b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
> > new file mode 100644
> > index 000000000000..7093cbeba44b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
> > @@ -0,0 +1,112 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +
> > +$id: http://devicetree.org/schemas/hwmon/maxim,max6639.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Maxim max6639
> > +
> > +maintainers:
> > +  - Roland Stigge <stigge@antcom.de>
> > +
> > +description: |
> > +  The MAX6639 is a 2-channel temperature monitor with dual,
> > automatic, PWM
> > +  fan-speed controller.  It monitors its own temperature and one
> > external
> > +  diode-connected transistor or the temperatures of two external
> > diode-connected
> > +  transistors, typically available in CPUs, FPGAs, or GPUs.
> > +
> > +  Datasheets:
> > +   
> > https://datasheets.maximintegrated.com/en/ds/MAX6639-MAX6639F.pdf
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - maxim,max6639
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - "channel@0"
> > +  - "channel@1"
> > +
> > +additionalProperties: false
> > +
> > +patternProperties:
> > +  "^channel@[0-1]$":
> > +    type: object
> > +    description: |
> > +      Represents the two fans and their specific configuration.
> > +
> > +    properties:
> > +      reg:
> > +        description: |
> > +          The fan number.
> > +        items:
> > +          minimum: 0
> > +          maximum: 1
> > +
> > +      pwm-polarity:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        enum: [0, 1]
> > +        description:
> > +          PWM output is low at 100% duty cycle when this bit is
> > set to zero. PWM
> > +          output is high at 100% duty cycle when this bit is set
> > to 1.
> > +
> > +      pulses-per-revolution:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        enum: [1, 2, 3, 4]
> > +        description:
> > +          Value specifying the number of pulses per revolution of
> > the controlled
> > +          FAN.
> > +
> 
> I think the above two properties should be optional.
> pulses-per-revolution is 2 for almost all fans out there,
> and pwm polarity is positive almost all the time.

makes sense. I guess I'll keep the default values like before and
also set rpm-range (resp. rpm-max) to 4000.

> 
> > +      rpm-range:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        enum: [2000, 4000, 8000, 16000]
> > +        description:
> > +          Scales the tachometer counter by setting the maximum
> > (full-scale) value
> > +          of the RPM range.
> > +
> Isn't this the maximum rpm ? Using the term "range" seems to be
> a bit misleading.

Yeah, the data sheet explicitly calls this register "rpm fan range".
But since this is not a vendor specific property and the purpose is
to set a maximum rpm value, it should rather be called "rpm-max".

Thanks!

Marcello

> 
> > +    required:
> > +      - reg
> > +      - pwm-polarity
> > +      - pulses-per-revolution
> > +      - rpm-range
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +
> > +      max6639@10 {
> > +        compatible = "maxim,max6639";
> > +        reg = <0x10>;
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        channel@0 {
> > +          reg = <0x0>;
> > +          pwm-polarity = <1>;
> > +          pulses-per-revolution = <2>;
> > +          rpm-range = <4000>;
> > +        };
> > +
> > +        channel@1 {
> > +          reg = <0x1>;
> > +          pwm-polarity = <1>;
> > +          pulses-per-revolution = <2>;
> > +          rpm-range = <4000>;
> > +        };
> > +      };
> > +    };
> > +...

