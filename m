Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B8C4C433F5
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 May 2022 07:10:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243659AbiEYHKq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 May 2022 03:10:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236882AbiEYHKi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 May 2022 03:10:38 -0400
Received: from smtpo68.interia.pl (smtpo68.interia.pl [217.74.67.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11937958A
        for <linux-hwmon@vger.kernel.org>; Wed, 25 May 2022 00:07:12 -0700 (PDT)
Received: from t480s.localdomain (unknown [80.68.225.159])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by poczta.interia.pl (INTERIA.PL) with ESMTPSA;
        Wed, 25 May 2022 09:07:08 +0200 (CEST)
Date:   Wed, 25 May 2022 09:07:07 +0200
From:   Slawomir Stepien <sst@poczta.fm>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        Slawomir Stepien <slawomir.stepien@nokia.com>
Subject: Re: [PATCH 3/8] dt-bindings: hwmon: Allow specifying channels for
 lm90
Message-ID: <Yo3Vm4yAX6E7v0aN@t480s.localdomain>
References: <20220520093243.2523749-1-sst@poczta.fm>
 <20220520093243.2523749-4-sst@poczta.fm>
 <3ea92486-0cf9-ce3d-d1b6-7a76f1d5a129@linaro.org>
 <0b84d109-d6be-dfba-99bb-0b7136af875e@roeck-us.net>
 <b5ff0f2c-d741-6dec-c306-b54cb5075ccf@linaro.org>
 <f124cbcb-3fca-3f1c-f47e-730f15c1f074@roeck-us.net>
 <YozHOsSdpWBRNLYt@t480s.localdomain>
 <YozM0L5uftHOgkjL@t480s.localdomain>
 <Yo0VfVthNdtjIWF+@t480s.localdomain>
 <5e841cdb-ca44-02f9-6c98-3d000b515b6b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e841cdb-ca44-02f9-6c98-3d000b515b6b@linaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
        s=biztos; t=1653462430;
        bh=alF/L2KheAuMSFd4siclkV/CVPvou05cT5t8mv9BvVo=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=K9rNQ+vgN2r6V6R5Tu8C47SRveMcooy63RHjJYX5eX2W/qRC3fVMZUPPPtiu5THII
         STkRbKh61fO0SlH7rH76nJOAiqBHk2tu3b0qIsdqbhovyKVtNA5yFGDQcEvmV+ZQRT
         Ijtz+q5g+KTIJsOQCcjLN4b0ajhAD/MKGY80nEQU=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On maj 24, 2022 19:59, Krzysztof Kozlowski wrote:
> On 24/05/2022 19:27, Slawomir Stepien wrote:
> >> Well ok, looks like this:
> >>
> >>       temperature-offset-millicelsius:
> >>         description: Temperature offset to be added to or subtracted from remote temperature measurements.
> >>         items:
> >>           items:
> 
> I think this is not an array, so items are not needed.
> 
> >>             type: integer
> 
> types are instead:
> $ref: /schemas/types.yaml#/definitions/int32
> but I think it still does not work.
> 
> >>             minimum: -128000
> >>             maximum: 127000
> > 
> > This isn't working...from what I've read we cannot just simply overwrite existing schemas.
> > 
> > Krzysztof, Guenter what I should do? Is there a way to match with uint32-array schema and with
> > schema that allows items in array to be below 0 (seems impossible to me)? I've tried a lot of
> > combinations today without any luck. Any helpful tips? Thanks!
> 
> However this still does not work. I changed in schema:
> 
>    # Temperature
> 
>    "-celsius$":

I'm using -millicelsius.

> -    $ref: "types.yaml#/definitions/uint32-array"
> 
> +    $ref: "types.yaml#/definitions/int32-array"

If I drop the "-millicelsius" and set the ref to types.yaml#/definitions/int32, all seems fine (the
sign is parsed correctly and the max/min are enforced correctly too).

> but that does not solve the problem that property is stored as uint32
> and parsed like uint32:
> 
>     4294967291 is greater than the maximum of 40
> 
> 
> Maybe Rob has some idea. Till then, you can skip minimum.

I will skip for now. I will send the new series and we can continue the discussion there. Thank you!

-- 
Slawomir Stepien
