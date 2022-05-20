Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7459EC433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 20 May 2022 13:23:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241541AbiETNXu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 20 May 2022 09:23:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236665AbiETNXt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 20 May 2022 09:23:49 -0400
Received: from smtpo52.interia.pl (smtpo52.interia.pl [217.74.67.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BCBD14916D
        for <linux-hwmon@vger.kernel.org>; Fri, 20 May 2022 06:23:44 -0700 (PDT)
X-Interia-R: Interia
X-Interia-R-IP: 80.68.225.159
X-Interia-R-Helo: <t480s.localdomain>
Received: from t480s.localdomain (unknown [80.68.225.159])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by poczta.interia.pl (INTERIA.PL) with ESMTPSA;
        Fri, 20 May 2022 15:23:41 +0200 (CEST)
Date:   Fri, 20 May 2022 15:23:40 +0200
From:   Slawomir Stepien <sst@poczta.fm>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        Slawomir Stepien <slawomir.stepien@nokia.com>
Subject: Re: [PATCH 3/8] dt-bindings: hwmon: Allow specifying channels for
 lm90
Message-ID: <YoeWXEb+iNIpFZVR@t480s.localdomain>
References: <20220520093243.2523749-1-sst@poczta.fm>
 <20220520093243.2523749-4-sst@poczta.fm>
 <3ea92486-0cf9-ce3d-d1b6-7a76f1d5a129@linaro.org>
 <YoeLuffNoUoNx2Bc@t480s.localdomain>
 <0e0dd0a1-0312-46f0-40b3-d3d2576ef08f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e0dd0a1-0312-46f0-40b3-d3d2576ef08f@linaro.org>
X-Interia-Antivirus: OK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
        s=biztos; t=1653053022;
        bh=b342xzMLn3SOYVUY09UIgcF3+OVHLlN7134mdWw6HCk=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=m3Sc1rg5sXF1vdC+L/3jCSnVib7YNrTz9oNzikpLHKct9ocm//jVG0y8QK2QzZKaL
         vw2F8HpWU1m1SZ/OnT3Y5149L0v4rD82a71V1kVq6e3U9sA6lLDEIAnUMpRgZg008j
         7oz63dsUOSwLHuTG3yktAQkM3nQ82qvG5/DbFwVM=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On maj 20, 2022 14:47, Krzysztof Kozlowski wrote:
> On 20/05/2022 14:38, Slawomir Stepien wrote:
> > On maj 20, 2022 12:13, Krzysztof Kozlowski wrote:
> >> On 20/05/2022 11:32, Slawomir Stepien wrote:
> >>> From: Slawomir Stepien <slawomir.stepien@nokia.com>
> >>>
> >>> Add binding description for temperature channels. Currently, support for
> >>> label and offset is implemented.
> >>>
> >>> Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>
> >>> ---
> >>>  .../bindings/hwmon/national,lm90.yaml         | 39 +++++++++++++++++++
> >>>  1 file changed, 39 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> >>> index 066c02541fcf..9a5aa78d4db1 100644
> >>> --- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> >>> +++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> >>> @@ -62,6 +62,37 @@ required:
> >>>  
> >>>  additionalProperties: false
> >>>  
> >>> +patternProperties:
> >>
> >> Which models use this?
> > 
> > This is used in tmp421 model.
> 
> Then please add allOf:if:then disallowing the property for other models.

A misunderstanding. The channel node can be used by every device supported by lm90. At least each
channel of each device can have label.

> >>> +  "^channel@([0-2])$":
> >>> +    type: object
> >>> +    description: |
> >>
> >> No need for |
> > 
> > Will fix in v2.
> > 
> >>> +      Represents channels of the device and their specific configuration.
> >>> +
> >>> +    properties:
> >>> +      reg:
> >>> +        description: |
> >>
> >> The same.
> > 
> > Will fix in v2.
> > 
> >>> +          The channel number. 0 is local channel, 1-2 are remote channels.
> >>> +        items:
> >>> +          minimum: 0
> >>> +          maximum: 2
> >>> +
> >>> +      label:
> >>> +        description: |
> >>
> >> The same.
> > 
> > Will fix in v2.
> > 
> >>> +          A descriptive name for this channel, like "ambient" or "psu".
> >>> +
> >>> +      offset:
> >>> +        description: |
> >>
> >> This does not look like standard property, so you need vendor and unit
> >> suffix.
> > 
> > Currently in lm90 we have support for devices that have different width (including sign) for offset
> > register. We have 10 bits, 11 bits and 12 bits. Do I understand correctly that I can use the same
> > vendor prefix if the width is the same? Just like "ti" was used for adi and ti in
> > "ti,extended-range-enable"?
> > 
> > For example:
> > 
> > adi,10-bit-offset-millicelsius # (only for adt7481)
> > adi,11-bit-offset-millicelsius # (for adt7461 but also for lm90 and others)
> > ti,12-bit-offset-millicelsius  # (ti - since only tmp451 and tmp461 supports 12 bit)
> 
> Wait, these are then strictly per-compatible, so there is no sense in DT
> property at all.

But isn't the value of offset a hardware-design-time calculation? So if I have a piece of
hardware that describes itself using device-tree, then offset information should be stored on the
device-tree rather then be "calculated" by the software running on that piece of hardware?

And what if such piece of hardware has been changed (e.g. new PCB version) and now the offset are
different? Then if device-tree is on hardware (e.g. on EEPROM) with new offsets, then software would
not require a change to support this new hardware version.

> >>> +          The value (millidegree Celsius) to be programmed in the channel specific offset register
> >>> +          (if supported by device).
> >>
> >> You described programming model which should not be put in the bindings.
> >> Please describe the hardware.
> > 
> > I am also not sure about the "-millicelsius" in example above. From device point-of-view, this
> > offset is just two's complement, so is it more desirable to have the values here as just bytes
> > rather than millicelsius?
> 
> No, the programming model of a device can change and should be
> abstracted to hardware property.

OK, so I will leave millicelsius as the unit.

> >>> +          For remote channels only.
> >>> +        $ref: /schemas/types.yaml#/definitions/int32
> >>> +        default: 0
> >>> +
> >>> +    required:
> >>> +      - reg
> >>> +
> >>> +    additionalProperties: false
> >>> +
> >>>  examples:
> >>>    - |
> >>>      #include <dt-bindings/interrupt-controller/irq.h>
> >>> @@ -76,5 +107,13 @@ examples:
> >>>              vcc-supply = <&palmas_ldo6_reg>;
> >>>              interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
> >>>              #thermal-sensor-cells = <1>;
> >>> +            #address-cells = <1>;
> >>> +            #size-cells = <0>;
> >> I assume you tested the bindings with dt_bindings_check?
> >>
> >> I have some doubts, as this should fail.
> > 
> > I did. All was fine. What should fail here?
> 
> This:
> 
> linux/out/Documentation/devicetree/bindings/hwmon/national,lm90.example.dtb:
> sensor@4c: '#address-cells', '#size-cells' do not match any of the
> regexes: '^channel@([0-2])$', 'pinctrl-[0-9]+'
> 
> 	From schema:
> linux/linux/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> 
> 
> So no, you did not test it. Asking reviewer to perform a test which you
> can do by yourself is a huge waste of reviewers time.

Ah I see it too. This is not stopping the make dt_bindings_check and that is why I have missed it.
My apologies! I will be more careful next time!

-- 
Slawomir Stepien
