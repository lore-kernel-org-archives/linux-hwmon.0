Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33DD6C433EF
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 May 2022 17:40:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345705AbiEKRkW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 11 May 2022 13:40:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245036AbiEKRkV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 May 2022 13:40:21 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FC85231CBA
        for <linux-hwmon@vger.kernel.org>; Wed, 11 May 2022 10:40:20 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id w130so3624610oig.0
        for <linux-hwmon@vger.kernel.org>; Wed, 11 May 2022 10:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=l4HdAR5ICM08BvOQsQ3xyy4gHWanyd5oie4UrOP1TYs=;
        b=RMgbJGXO2QYrQykmtBSt2uhcBHKUVnrCvFfWOs13AvCc/9rCNc+A2N4iW/PWHG8Beg
         8uWH/f3b2WXv047GcJZFHc+TtoDbXEpX5EoWMa+jKOv5b+pKvcCG+R7jp8VCmzbicSPy
         NFxBAVMlwU4So3g0bZM83E/eyTBhvS3l3UDc1HDWfw0vec8BKbryzJ7aXW7ku6B8viRt
         wlgiqrWkTsT0IX5KwK7mM1vnjoTt/LKLiudBd9rX6HUBWzDCVGqPy0lWtqnuHG0IReWI
         wAw4kQxhmX7qdiJFs/l0fzL5N2YsvMozPQz2iGyU6cOpRY8X9J/fSm+xVjRurcoGHrvN
         dglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=l4HdAR5ICM08BvOQsQ3xyy4gHWanyd5oie4UrOP1TYs=;
        b=ogA2updJbZpFgczEAfYyw7bMJjMhaeR5g/4+sY//sIc366OOaK2lGecP58wXSba/ck
         cH13c0PqKiiWHRRt0OcZ54fOF5dHn0SfgSLSd1h2g0Jx9v4FgOmiXA/Pblq8eZH0zJql
         XwJd9HtwrZufJPweWEVl9lAaOe1NXjDUiGEvS37O4236vEbJ8TRtILtr4mLlKGPpizuO
         fNzIp0g6XILBMwEuZWUyZMO9Lo1hDpxr6gKtXNyzvNQTZRfR3CCDJOL6U899OflZ/FWu
         So01+ZH6zVsLyMKTHIQI3PqPbZRLOne5uUaIdm2f0ftvCrHRTdM0uTIphDwVqMx3v8Wp
         SimQ==
X-Gm-Message-State: AOAM531H/yEyt46OoqQA1/MT2nDv2CvwkAcA58OIOI2Ej+4rCJ+MJ4nJ
        C6plIcb/2VjhtXbGUXwek4c=
X-Google-Smtp-Source: ABdhPJy4d5shg2Cn+sgcIyAZhBd5XQxmjnImgmPt9YgRtCAi/Ab1hw/Wv7DWY82PgduyESJmH2YC0A==
X-Received: by 2002:a05:6808:221c:b0:326:cb2e:a2a6 with SMTP id bd28-20020a056808221c00b00326cb2ea2a6mr3071662oib.191.1652290819944;
        Wed, 11 May 2022 10:40:19 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u18-20020a056870701200b000e686d13875sm797012oae.15.2022.05.11.10.40.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 10:40:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <85d1ed0b-1e1f-bee7-9b0f-fbbf50921ad0@roeck-us.net>
Date:   Wed, 11 May 2022 10:40:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [v2 1/2] dt-bindings: add extended-range-enable property to
 lm90.yaml
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Holger Brunck <holger.brunck@hitachienergy.com>,
        linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220510080900.22758-1-holger.brunck@hitachienergy.com>
 <34d88cd9-2bcd-77e6-8cc9-93b8cbd63a8f@linaro.org>
 <037b551f-1781-321a-1984-117d098d980d@roeck-us.net>
 <b895f874-c8b8-3889-c7c9-0c0494e9bae0@linaro.org>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <b895f874-c8b8-3889-c7c9-0c0494e9bae0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/11/22 10:21, Krzysztof Kozlowski wrote:
> On 11/05/2022 19:00, Guenter Roeck wrote:
>> On 5/11/22 08:32, Krzysztof Kozlowski wrote:
>>> On 10/05/2022 10:08, Holger Brunck wrote:
>>>> Some devices can operate in an extended temperature mode.
>>>> Therefore add a boolean onsemi,extended-range-enable to be able to
>>>> select this feature in the device tree node.
>>>>
>>>> Signed-off-by: Holger Brunck <holger.brunck@hitachienergy.com>
>>>> cc: Jean Delvare <jdelvare@suse.com>
>>>> cc: Guenter Roeck <linux@roeck-us.net>
>>>> cc: Rob Herring <robh+dt@kernel.org>
>>>> cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
>>>> ---
>>>>    Documentation/devicetree/bindings/hwmon/national,lm90.yaml | 4 ++++
>>>>    1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
>>>> index 30db92977937..92afa01380eb 100644
>>>> --- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
>>>> +++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
>>>> @@ -52,6 +52,10 @@ properties:
>>>>      vcc-supply:
>>>>        description: phandle to the regulator that provides the +VCC supply
>>>>    
>>>> +  onsemi,extended-range-enable:
>>>> +    description: Set to enable extended range temperature.
>>>> +    type: boolean
>>>>
>>>
>>> There is no such vendor and it does not match the existing vendor for
>>> these bindings (nor the current owner of National). Was there some
>>> change? What is onsemi?
>>>
>> My bad, I should have looked up official prefixes before suggesting onsemi
>> as an option. That should have been "onnn".
>>
>> It should be either onnn (for adt7461/adt7461a) or ti for tmp451
>> and tmp461. adi instead of onnn may make sense since that is already
>> used in the driver. I personally don't have a preference.
> 
> Me neither. Just pick one matching the device actually using this
> property. If all of them are using it, how about keeping old "national"
> or it's owner "ti"? If not all of them are using it, then this would
> need "allOf:if:then" restricting where the property is (not) applicable.
> 

It is only applicable for tmp451, tmp461, and adt7461[a], so it looks
like "allOf:if:then" will be needed. Note that none of those chips are
or have ever been owned by National. Given that, maybe ti would be most
appropriate ?

Thanks,
Guenter
