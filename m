Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA08EB64DD
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 Jul 2023 17:41:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbjGKRlK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 Jul 2023 13:41:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjGKRlK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Jul 2023 13:41:10 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B29AE4F
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jul 2023 10:41:09 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-1b055510c9dso3807630fac.0
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jul 2023 10:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689097268; x=1691689268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UbsyNgOgJJLYpy4iLTJ6JHKIF6QFA4WfiEM4K08P72w=;
        b=bP8XCE1Q6vuL1CRp2br5UC+iwWO7Nt6Uy5IISezNrb9wq/jrsRLLwD8CbjidHZSG9k
         KIlh0DDd4NhA0W9FsCwnGpAtC6VADmoK59xXNOfNYNYIUM1x+1cYelrKdkaCxbago1Nf
         33QDkw/2CSkwPyWlTlaKHswn7rSh7+diGeQGgMZSirvdXXVeK1V8OqzkQW1WwOCOlhnn
         RSfvZG3ZY6B5t5LHxumwVDEX23UvlEjpF9y1NbzeJopTkH8F0aj049ujTJS30q0OrEvv
         8+KoaMc/uanCPxhDMyeOUoGUDsuQcY3Jd3pEG1iIgG5XpgHLKRV9jBp9WPIOLwX13o4h
         iSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689097268; x=1691689268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UbsyNgOgJJLYpy4iLTJ6JHKIF6QFA4WfiEM4K08P72w=;
        b=ln1gnEK540lXUjvwsXXphCLi8nqxUtR858ZEEMI4GUdXFkwLffcbQpT4O02JSbl7pW
         tecxTLhXZc4wNnpgCdPrjl0bR2FQztQ/GS16xynGl4vYkCUxImzzG+kenHXejhnV5bKy
         8Ty23VmveGBAL0tTa6TKGBVUexbl+dd2txNVyKrSC6cRmaey2B+vym/19DVxTqqDRBpc
         MX9MOQTwdlh5MqEBVKJ33koR5v/6A+5fQaxhPeelulvM1aghRp+xcNIn8RphOiQQIVB5
         kw4M4F9uHpEK0e4gZydm0u7cAY7Wf0vOCDMhMxTsBIEuEzUMa2x5/jXPQYF8HJwlrTnV
         Wk6g==
X-Gm-Message-State: ABy/qLbBak7vDSb3mskySEhkoFBXrTXWzoJF0/PYIGpZVXhfuC8c18Pb
        PA1PtuL2PaRARhJw1R+grcs=
X-Google-Smtp-Source: APBJJlF3byxgQ2rtY0XQSu46HMYoyJ1cr+DH8JCH+ZK9cqapZrSERVjiSAtAnjk5LEbpNoSoqvqzmg==
X-Received: by 2002:a05:6870:1d2:b0:1b4:4935:65c7 with SMTP id n18-20020a05687001d200b001b4493565c7mr11332386oad.35.1689097268119;
        Tue, 11 Jul 2023 10:41:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k125-20020a816f83000000b00577044eb00esm690700ywc.21.2023.07.11.10.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 10:41:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 11 Jul 2023 10:41:06 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Andre Werner <werneazc@gmail.com>, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org,
        Andre Werner <andre.werner@systec-electronic.com>
Subject: Re: [PATCH 2/2] dt-bindings: hwmon: Add description for new hwmon
 driver hs300x
Message-ID: <07f4c669-308b-481f-aa95-90200fa70e57@roeck-us.net>
References: <20230711140637.4909-1-andre.werner@systec-electronic.com>
 <20230711140637.4909-2-andre.werner@systec-electronic.com>
 <f3fedfb2-85a3-2b7b-e474-b082fb60fa3e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3fedfb2-85a3-2b7b-e474-b082fb60fa3e@kernel.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jul 11, 2023 at 06:28:11PM +0200, Krzysztof Kozlowski wrote:
> On 11/07/2023 16:06, Andre Werner wrote:
> > This is the initial description.
> > 
> > Signed-off-by: Andre Werner <andre.werner@systec-electronic.com>
> > ---
> >  .../devicetree/bindings/hwmon/hs300x.yaml     | 58 +++++++++++++++++++
> >  1 file changed, 58 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/hs300x.yaml
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
> 
> You missed at least DT list (maybe more), so this won't be tested by
> automated tooling. Performing review on untested code might be a waste
> of time, thus I will skip this patch entirely till you follow the
> process allowing the patch to be tested.
> 
> Please kindly resend and include all necessary To/Cc entries.
> 

The chips should just be added to trivial-devices.yaml.

> > 
> > diff --git a/Documentation/devicetree/bindings/hwmon/hs300x.yaml b/Documentation/devicetree/bindings/hwmon/hs300x.yaml
> > new file mode 100644
> > index 000000000000..7a9b3ee3738b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/hs300x.yaml
> 
> Filename like compatible
> 
> > @@ -0,0 +1,58 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +
> 
> Drop
> 
> > +$id: http://devicetree.org/schemas/hwmon/hs300x.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas HS300x humidity and temperature sensor
> > +
> > +maintainers:
> > +  - Andre Werner (andre.werner@systec-electronic.com)
> > +
> > +description: |
> > +  This driver implements support for the Renesas HS300x chips, a humidity
> 
> Bindings are for hardware, not drivers.
> 
> > +  and temperature family. Temperature is measured in degrees celsius, relative
> > +  humidity is expressed as a percentage. In the sysfs interface, all values are
> > +  scaled by 1000, i.e. the value for 31.5 degrees celsius is 31500.
> 
> sysfs is not hardware related, drop.
> 
> > +
> > +  The device communicates with the I2C protocol. Sensors can have the I2C
> > +  address 0x44 by default.
> > +
> > +  The driver does not support the sensor's configuration possibilities.
> > +
> > +  The driver is able to be read out using lmsensors.
> > +
> > +  Datasheets:
> > +  https://www.renesas.com/us/en/document/dst/hs300x-datasheet?r=417401
> > +
> > +
> 
> Just one blank line.
> 
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - hs3001
> > +      - hs3002
> > +      - hs3003
> > +      - hs3004
> 
> Eh, so this was not tested... That's not correct compatible, missing
> vendor prefix.
> 

Also, from programming perspective, the chips are all the same.

> > +
> > +  reg:
> > +    maxItems: 1
> > +
> 
> Missing several properties.
> 
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +          #address-cells = <1>;
> > +          #size-cells = <0>;
> > +
> > +          humidity: hs3002@44 {
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> 
> 
> > +              compatible = "hs3002";
> > +              reg = <0x44>;
> > +          };
> > +    };
> 
> Best regards,
> Krzysztof
> 
