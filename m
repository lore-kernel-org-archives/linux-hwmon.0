Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4E92EB64DD
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Jul 2023 17:05:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbjGPRFX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 16 Jul 2023 13:05:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjGPRFW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 16 Jul 2023 13:05:22 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9477BE52;
        Sun, 16 Jul 2023 10:05:21 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1b9d80e33fbso22506425ad.0;
        Sun, 16 Jul 2023 10:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689527121; x=1692119121;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=56N0FWY67kwv0l0oCm41cdPkUcQgcQjinlre/d9a1zU=;
        b=M4oX9j2woHibPfW3PxFbPA2ksy0QWa8kxicR5FrNnVkaq/yCjO6mv8FQ16ZLCdEIcU
         l9XKWKj30McT5LlPIg0wnKYitys5Aiew3fshgiQQi5bLHY0U3gpFkXxEXOD0CzCIurgv
         3gaIsFI0XdU97DGoEoXNWnUOfrvqgAlK3QT1/hRUyMqeZjwxulYQm86YovRHMrjXkte+
         6ltoRC37sx//NnXlskA8LC590KQsBLPG1OA1cL2Rpj1fjZhaHggv0U03QBgZ3euXuut/
         BPcuXh6agm9rSgyeFodUPlAenI4vvwtx/ZCPu/PerNP8iN4IRL3p64h/WRIzDUQWPgSU
         EkgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689527121; x=1692119121;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=56N0FWY67kwv0l0oCm41cdPkUcQgcQjinlre/d9a1zU=;
        b=TrnOYrVAIpTNFj64zguXy8rJbX+Ep+pclCenIBHx3jkXFv02/bkiq+sLiybvIN/7bh
         xkdf82TOxZ9Sj8NwWk4OjUaH8lrSruuPcaxnyWKO6BSGWZ7ga579BlprrLI13r8OFnLR
         RqZ7lsE5hB3XjO8bwqaBck5AQ61bJy+CHF38A7JYi+qR47665zUoLKSHojAYTttrcFbY
         1pjlHTz/ZnximTVe1yJQu/W1jvSuIaUI2ScxspRkV4OBh/ZZ2dWWHL48X4Zw0uCPJVXN
         tx/TZW5PJuBhmh+RLOQkS03WlwY16AjfAo2WWWTST8tYMUbF3M/ixPrtbCXSwJeVKaD4
         nTyA==
X-Gm-Message-State: ABy/qLbW+OoepNsRqYi7Bl9APxDJzPDapyhI9IHw4b/49WUzauJMFTWS
        WldFxhBMUC3z7yyrJP4KsLL5EuakHDU=
X-Google-Smtp-Source: APBJJlE5Gwc8TJ1An6zIfMpovJfBWIaH9GHYqjMawBey5XOo4r9n86875z8dknTOs+6G0jvEFnripA==
X-Received: by 2002:a17:902:ea05:b0:1b8:9b17:f63d with SMTP id s5-20020a170902ea0500b001b89b17f63dmr12304871plg.23.1689527120792;
        Sun, 16 Jul 2023 10:05:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 17-20020a170902e9d100b001b8ab115ce4sm11218068plk.278.2023.07.16.10.05.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jul 2023 10:05:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9ca518f1-4cd1-f024-4e67-5abc67eb6507@roeck-us.net>
Date:   Sun, 16 Jul 2023 10:05:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add description for new hwmon
 driver hs3001
Content-Language: en-US
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Andre Werner <werneazc@gmail.com>, jdelvare@suse.com,
        robh+dt@kernel.org
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Andre Werner <andre.werner@systec-electronic.com>
References: <20230716150556.26155-1-andre.werner@systec-electronic.com>
 <f0c8adfb-bc72-3424-c021-d694e98a8537@kernel.org>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <f0c8adfb-bc72-3424-c021-d694e98a8537@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/16/23 09:33, Krzysztof Kozlowski wrote:
> On 16/07/2023 17:05, Andre Werner wrote:
>> This is the initial description.
>>
>> Signed-off-by: Andre Werner <andre.werner@systec-electronic.com>
> 
> Duplicated patch, but my comments stay - you did not CC people I asked for.
> 
>> ---
>>   Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
>> index ba2bfb547909..5a5de3f6cd37 100644
>> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
>> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
>> @@ -320,6 +320,8 @@ properties:
>>               # Rohm DH2228FV
>>             - rohm,dh2228fv
>>               # S524AD0XF1 (128K/256K-bit Serial EEPROM for Low Power)
>> +          - renesas,hs3001
>> +            # Renesas HS300[1,2,3,4] Temperature and Relative Humidity Sensors
> 
> wrong comment.
> 

Maybe clarify that the comment comes first, i.e., that it should be

+            # Renesas HS300[1,2,3,4] Temperature and Relative Humidity Sensors
+          - renesas,hs3001

and that it should be added before renesas,isl29501 to retain alphabetic order.

Guenter

>>             - samsung,24ad0xd1
> 
> Samsung, not Renesas
> 
> 
> Best regards,
> Krzysztof
> 

