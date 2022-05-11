Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0C9FC433F5
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 May 2022 17:21:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242759AbiEKRVL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 11 May 2022 13:21:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240438AbiEKRVK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 May 2022 13:21:10 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 835AB4092D
        for <linux-hwmon@vger.kernel.org>; Wed, 11 May 2022 10:21:08 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id i19so5377898eja.11
        for <linux-hwmon@vger.kernel.org>; Wed, 11 May 2022 10:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=9VZSlkse5R+QheCAFM/RySDSEUzTKDk3QbqNO4/cqNs=;
        b=i21Bn2f8z/RoyGLdL1MzrJ25inccRWnlwp69squ4H0m02uzstrf3wKCVTVXlQGIxPL
         Vp7TOMs+Cm6J79JZrOVgVwDQIiai6f+Xh9aRpnngxlocKAxHjhp8ZvKCrB0m/faPqe+V
         DPtQkRLma1DwHxRscKIb4IhGcfqdpOrzMmU/yLmTO1tehAbMKbMs7tErPTMXuSIjOtFu
         Xxq2KoLLyKpDjM0NSjpVClX/SIJQANm+tprBqKl3NURZoVPuUSM/W6dI62UKy9vpH41c
         DGOvc2r9hPi3HjWqRsH29EGO5xW650qCzImhATFmnqfBvOBuZWtlP1pKvHnJkWjq4CvD
         +cPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9VZSlkse5R+QheCAFM/RySDSEUzTKDk3QbqNO4/cqNs=;
        b=RswJcfHNzzIOqu/4MbAwd5/6irOaJUsQQsn2pWJxmS00GNxraNTtAULBnFwSmYksyS
         JQIJKa98o0Ep68Yd2bekgZacAJBIvL8d30uqGnfB9GpIoQfvdQh8m87SM0sU+pP5Vf9H
         HszvXcHEYQotdyfZtKxvEJcGTETFuhcORw1J3M6pnWB2X7admrui2CjOO0tRWavCH+NX
         i7pK2G3T8koNtuCaB82GarHfAdmo7Ppvy3RXyWTdb5uqwLAYqHs38mujdaeADzl6IFwN
         AEbnsDYHMeuwemwjhyxAqFh30XWn3ycUWJTjx+wJOaytmbxAyRi6iwOQgNVDgsFR2NE7
         xZ9w==
X-Gm-Message-State: AOAM531kIsZ9Zcjdt6VG1+8ToemDBn5x5/wmy67+x+6ALOwEev9/7e2T
        BvRdQPOY+2/qq+AIP53rjOiVIA==
X-Google-Smtp-Source: ABdhPJzBCOTLZiola6iiyid8thhE2d7pQ32uW3aiqwL/iEWP439UsoZGWxYOjDrK2OI2sYiYUzjj0w==
X-Received: by 2002:a17:906:265b:b0:6f4:f408:13c1 with SMTP id i27-20020a170906265b00b006f4f40813c1mr25958255ejc.602.1652289667117;
        Wed, 11 May 2022 10:21:07 -0700 (PDT)
Received: from [192.168.0.155] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id m11-20020a50cc0b000000b0042617ba63a9sm1401668edi.51.2022.05.11.10.21.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 10:21:06 -0700 (PDT)
Message-ID: <b895f874-c8b8-3889-c7c9-0c0494e9bae0@linaro.org>
Date:   Wed, 11 May 2022 19:21:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [v2 1/2] dt-bindings: add extended-range-enable property to
 lm90.yaml
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>,
        Holger Brunck <holger.brunck@hitachienergy.com>,
        linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220510080900.22758-1-holger.brunck@hitachienergy.com>
 <34d88cd9-2bcd-77e6-8cc9-93b8cbd63a8f@linaro.org>
 <037b551f-1781-321a-1984-117d098d980d@roeck-us.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <037b551f-1781-321a-1984-117d098d980d@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 11/05/2022 19:00, Guenter Roeck wrote:
> On 5/11/22 08:32, Krzysztof Kozlowski wrote:
>> On 10/05/2022 10:08, Holger Brunck wrote:
>>> Some devices can operate in an extended temperature mode.
>>> Therefore add a boolean onsemi,extended-range-enable to be able to
>>> select this feature in the device tree node.
>>>
>>> Signed-off-by: Holger Brunck <holger.brunck@hitachienergy.com>
>>> cc: Jean Delvare <jdelvare@suse.com>
>>> cc: Guenter Roeck <linux@roeck-us.net>
>>> cc: Rob Herring <robh+dt@kernel.org>
>>> cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
>>> ---
>>>   Documentation/devicetree/bindings/hwmon/national,lm90.yaml | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
>>> index 30db92977937..92afa01380eb 100644
>>> --- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
>>> +++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
>>> @@ -52,6 +52,10 @@ properties:
>>>     vcc-supply:
>>>       description: phandle to the regulator that provides the +VCC supply
>>>   
>>> +  onsemi,extended-range-enable:
>>> +    description: Set to enable extended range temperature.
>>> +    type: boolean
>>>
>>
>> There is no such vendor and it does not match the existing vendor for
>> these bindings (nor the current owner of National). Was there some
>> change? What is onsemi?
>>
> My bad, I should have looked up official prefixes before suggesting onsemi
> as an option. That should have been "onnn".
> 
> It should be either onnn (for adt7461/adt7461a) or ti for tmp451
> and tmp461. adi instead of onnn may make sense since that is already
> used in the driver. I personally don't have a preference.

Me neither. Just pick one matching the device actually using this
property. If all of them are using it, how about keeping old "national"
or it's owner "ti"? If not all of them are using it, then this would
need "allOf:if:then" restricting where the property is (not) applicable.


Best regards,
Krzysztof
