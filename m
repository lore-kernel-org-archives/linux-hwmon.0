Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD10C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 10 May 2022 14:48:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344815AbiEJOwR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 10 May 2022 10:52:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345547AbiEJOvb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 10 May 2022 10:51:31 -0400
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 592C42685C7
        for <linux-hwmon@vger.kernel.org>; Tue, 10 May 2022 07:12:26 -0700 (PDT)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-ed9ac77cbbso18429409fac.1
        for <linux-hwmon@vger.kernel.org>; Tue, 10 May 2022 07:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=OgKELB9jRPS+5ag254sekocF8ws2fik0qJMNCEfEFu0=;
        b=c8JhQVEZGmSNcAC7179E8LQhHA6mpnYuuss9eNpJbEHeTu19rOLLdks/aTnb5dxs97
         /qUXS/y6BV3JeOw99KcQZcg3v1pB3lPUBOzqGyQoxSInugMgFAMcJJCRo0Gzwo7SuD0c
         6RhdO99peHcj4uWs/NKHX/MqgKi1qhRe/nDW/94HK0SocFWyBs4OlP7XwHmBZ9ATdWfZ
         VSvVU7OcfgiDqcIcyoN0DN9XFQ4f8u5WSEHlGWcF6n7kyRO/i7XRvTSnHgDh2K3daw9u
         TzaZaMIx6rN26nbN044BCMi7ArcYEyJdo3iAXGDRCeRybfaQ35994pywZrxf36HAvWR4
         6tZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=OgKELB9jRPS+5ag254sekocF8ws2fik0qJMNCEfEFu0=;
        b=YOd9lJM1PNwEAjX/OZe4VbgAZcaGyaTuKlpCqNvqqRJswwPPGVQALrG8oXJ9lEkFJ4
         NTgqT0SLfIA7ZcnR/pOy9FTuvYf4OAV4vNtBO3tULt9FwoX/QAhtuDTt8cWpjGT/zoOC
         gt60F/TxDfq7pqwh0bYE6AJ/0iKZPf+NGQ7W/v4Adm1h2/BYgLeu+xcVbmsAweQh/Joy
         hQzAvmJOI+jwwfAr+DaIWCxh/HyLp3B8wll8nU2WTB09qlPZdbTPksS2hXnfT1dlYu5H
         POBPharz9yLWC9+3BQmK7p8+p03FnzBhOp+S53dMoRPdjeOzZJbAYw98V1k59k4muSUm
         mmkA==
X-Gm-Message-State: AOAM533iw+AJTUwAmW5aTHVkErXxIib6iQ37GmpsG/R9TLDBDtuO7f5S
        PPxWykkRgJRwUUrBwMsUxdo=
X-Google-Smtp-Source: ABdhPJwr7fLpFJT1JJgA8n3j9MKJRd3X7bJ0JhC/+NhRU1+h1Vq8mFMz85PULyY1si2Isoy7E6ZOKA==
X-Received: by 2002:a05:6870:4188:b0:d9:eed0:5a41 with SMTP id y8-20020a056870418800b000d9eed05a41mr141881oac.161.1652191946148;
        Tue, 10 May 2022 07:12:26 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bp2-20020a056808238200b003289f51c2d7sm483803oib.34.2022.05.10.07.12.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 May 2022 07:12:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <804fbd8e-e665-4c9f-929a-44c5e50019ee@roeck-us.net>
Date:   Tue, 10 May 2022 07:12:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To:     Holger Brunck <holger.brunck@hitachienergy.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220509131016.29481-1-holger.brunck@hitachienergy.com>
 <af58fc2a-9d72-82b5-2cd4-8376a99e9ef5@roeck-us.net>
 <DB9PR06MB7289C1EF96CAC7554D65EC2EF7C99@DB9PR06MB7289.eurprd06.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/2] dt-bindings: add extended-range-enable property to
 lm90.yaml
In-Reply-To: <DB9PR06MB7289C1EF96CAC7554D65EC2EF7C99@DB9PR06MB7289.eurprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/10/22 00:19, Holger Brunck wrote:
>> On 5/9/22 06:10, Holger Brunck wrote:
>>> Add a boolean extended-range-enable to make the extented temperature
>>> feature for some lm90 devices configurable.
>>>
>>> Signed-off-by: Holger Brunck <holger.brunck@hitachienergy.com>
>>> cc: Jean Delvare <jdelvare@suse.com>
>>> cc: Guenter Roeck <linux@roeck-us.net>
>>> cc: Rob Herring <robh+dt@kernel.org>
>>> cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
>>> ---
>>>    Documentation/devicetree/bindings/hwmon/national,lm90.yaml | 4 ++++
>>>    1 file changed, 4 insertions(+)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
>>> b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
>>> index 30db92977937..98d01f6c9331 100644
>>> --- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
>>> +++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
>>> @@ -52,6 +52,10 @@ properties:
>>>      vcc-supply:
>>>        description: phandle to the regulator that provides the +VCC
>>> supply
>>>
>>> +  extended-range-enable:
>>
>> This should probably be either "onsemi,extended-range-enable" (for
>> adt7461) or "ti,extended-range-enable" (for the supported TI chips).
>>
> 
> I can change that, but I thought a generic name would be better as the
> same property name is already used in drivers/hwmon/max6697.c.
> 

That was introduced at times when things were not always reviewed
by DT maintainers, and was wrong. I'd be open to change that to
maxim,extended-range-enable (it isn't used in any upstream or published
DT file). Let's wait for Rob or Krzysztof to decide.

Guenter
