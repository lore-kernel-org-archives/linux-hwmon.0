Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5719CC433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 May 2022 17:27:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234463AbiEXR1g (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 May 2022 13:27:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234115AbiEXR1f (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 May 2022 13:27:35 -0400
Received: from smtpo68.interia.pl (smtpo68.interia.pl [217.74.67.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D95A6830D
        for <linux-hwmon@vger.kernel.org>; Tue, 24 May 2022 10:27:30 -0700 (PDT)
Received: from t480s.localdomain (unknown [80.68.225.159])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by poczta.interia.pl (INTERIA.PL) with ESMTPSA;
        Tue, 24 May 2022 19:27:27 +0200 (CEST)
Date:   Tue, 24 May 2022 19:27:25 +0200
From:   Slawomir Stepien <sst@poczta.fm>
To:     Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        Slawomir Stepien <slawomir.stepien@nokia.com>
Subject: Re: [PATCH 3/8] dt-bindings: hwmon: Allow specifying channels for
 lm90
Message-ID: <Yo0VfVthNdtjIWF+@t480s.localdomain>
References: <20220520093243.2523749-1-sst@poczta.fm>
 <20220520093243.2523749-4-sst@poczta.fm>
 <3ea92486-0cf9-ce3d-d1b6-7a76f1d5a129@linaro.org>
 <0b84d109-d6be-dfba-99bb-0b7136af875e@roeck-us.net>
 <b5ff0f2c-d741-6dec-c306-b54cb5075ccf@linaro.org>
 <f124cbcb-3fca-3f1c-f47e-730f15c1f074@roeck-us.net>
 <YozHOsSdpWBRNLYt@t480s.localdomain>
 <YozM0L5uftHOgkjL@t480s.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YozM0L5uftHOgkjL@t480s.localdomain>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
        s=biztos; t=1653413248;
        bh=ZlSTmvT/m6HstUXSbdPJ4qaoowYbpX7dTPrAM846xyA=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=KBTz46JBZ4PW/gxBYFpCGey9EfT2zeEyQUINA+M8ByaQy0JSaFUYgIpd13Y2Xtp8N
         fT7zYfLS6BtJCGnS3U805TvBepYv+l9ZdXsLW3nmfgXa9/fYRXum0qVW6KtV+FdZbM
         zhLAdH7S5poVJqRQMaU8xlwVOeQ49eeaN67cS3u4=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On maj 24, 2022 14:17, Slawomir Stepien wrote:
> On maj 24, 2022 13:53, Slawomir Stepien wrote:
> > On maj 20, 2022 07:22, Guenter Roeck wrote:
> > > On 5/20/22 07:09, Krzysztof Kozlowski wrote:
> > > > On 20/05/2022 15:42, Guenter Roeck wrote:
> > > > > > 
> > > > > > > +          A descriptive name for this channel, like "ambient" or "psu".
> > > > > > > +
> > > > > > > +      offset:
> > > > > > > +        description: |
> > > > > > 
> > > > > > This does not look like standard property, so you need vendor and unit
> > > > > > suffix.
> > > > > > 
> > > > > 
> > > > > Temperature offset is a standard property for temperature sensor
> > > > 
> > > > The original description was strictly connected to registers, so that
> > > > one as not a standard. It seems it was just a wording...
> > > > 
> > > > > chips with external channels, implemented by a diode or transistor.
> > > > > Making it non-standard will mean that we'll have lots of
> > > > > "vendor,offset" properties, one each for each vendor selling
> > > > > temperature sensor chips with external channels. This gets
> > > > > more complicated here because the lm90 driver does support chips
> > > > > from several different vendors. Almost all of them support
> > > > > this functionality. Which vendor do you select in this case ?
> > > > > 
> > > > > I would suggest to use temperature-offset-milliseconds, though.
> > > > 
> > > > Yes, this sounds good. Just not seconds but millicelsius, I guess?
> > > > 
> > > 
> > > Uuh, yes. Sorry, must be too early in the morning here.
> > 
> > Hello
> > 
> > I see that: *-millicelsius is defined as uint32-array:
> >   "-millicelsius$":
> >     $ref: "types.yaml#/definitions/uint32-array"
> >     description: Degreee milli-Celsius
> > 
> > But it would be nice to have negative values as the prop value, for example <(-1000)>.
> > 
> > How should I approach that? Is change to this definition possible? If yes, how should it be
> > conducted? On github or via device-tree mailing list?
> > 
> > Or maybe there is a way to overwrite this (using $defs?) for this particular binding? I haven't
> > found any solution that will pass dt_binding_check.
> 
> Well ok, looks like this:
> 
>       temperature-offset-millicelsius:
>         description: Temperature offset to be added to or subtracted from remote temperature measurements.
>         items:
>           items:
>             type: integer
>             minimum: -128000
>             maximum: 127000

This isn't working...from what I've read we cannot just simply overwrite existing schemas.

Krzysztof, Guenter what I should do? Is there a way to match with uint32-array schema and with
schema that allows items in array to be below 0 (seems impossible to me)? I've tried a lot of
combinations today without any luck. Any helpful tips? Thanks!

> Will overwrite the definition...most likely just minimum: -128000 in 2nd items will be enough.
> 
> > > > > > > +          The value (millidegree Celsius) to be programmed in the channel specific offset register
> > > > > > > +          (if supported by device).
> > > > > > 
> > > > > > You described programming model which should not be put in the bindings.
> > > > > > Please describe the hardware.
> > > > > > 
> > > > > 
> > > > > It is a configuration value, which is hardware dependent because
> > > > > it depends on the temperature diode or transistor connected to the chip.
> > > > 
> > > > Sure, so this could be reworded "Offset against some base value for each
> > > > channel temperature", or something similar (you know better than me).
> > > > Referring to registers and where exactly this should be programmed in
> > > > the device is related to device programming model, not to bindings.
> > > > 
> > > 
> > > Maybe something like "Temperature offset to be added to or
> > > subtracted from remote temperature measurements".

-- 
Slawomir Stepien
