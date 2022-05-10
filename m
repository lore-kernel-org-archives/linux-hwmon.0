Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11BC7C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 10 May 2022 07:34:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230157AbiEJHi1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 10 May 2022 03:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238438AbiEJHgp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 10 May 2022 03:36:45 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C736F2B24D4
        for <linux-hwmon@vger.kernel.org>; Tue, 10 May 2022 00:32:24 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id a21so18928874edb.1
        for <linux-hwmon@vger.kernel.org>; Tue, 10 May 2022 00:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=kaiXw0j4ma+RoJmhp2ZCn0fcPSXPMs6qqOOqG1JSj+0=;
        b=V4ZF+tciB+ZXeSDUDmWMuaZEX7ni0X7T48/Itt9hQpmxl6X5K6Q0braT9dPJ0t/nj9
         5kBD8wW1GXgxPRBgxlxhlhEE7uErSQugTiBFechLYGilpJ1YMpPKfHD6HT+6nzL8Ar3v
         Qej8EdYgRQ82QAXD+vGPJgYwwRLkU/UZKv4of+Lrg2brnrGwCl05ccHsXrChw/hPxjNh
         +/JUq2F+SB8ZKFIsVbdsnw8kAoqEUV/oIY17G7xe1nCUtDxhxIolFXXp9Ws+1AbKe5QJ
         ciRAhpKhdXYgUW9igGGYfv1OmWJqqxIO7+VNzvwV3mGpAqcwcziSvBc6SGmfkTDeiMPb
         MDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kaiXw0j4ma+RoJmhp2ZCn0fcPSXPMs6qqOOqG1JSj+0=;
        b=szaF/IZ/477s9Xi8NgHmrULpz6oLTTJMM+rbgyNTbZI/TUkIt6iczWGyEUJ/PXCPWx
         hp3wEbjt0On0IdRFmpHu+xRwZB2O8rhKIFID0ofCxmVaBsqddqAMPRfvckAZgGSiQDbQ
         ZMxtncp91OeMr1pYoHnEzuoXj8GGwdYTQQSGgeYi1GlUsUUXKPOF0v0YbVB5ylGRsTh+
         qHJWpW1FN1GxasS7k92OJm90OObKZ3xQZvq2YvmjUIvy6sc65uoPGFRHkRQkDtob8HFe
         Ropn/9V1L9GGPjcdA2NJ5qxfKVyFOhUbdzzLAfJp3sf0hQF/4MExKVbHec3cuviy2JJn
         9Y0w==
X-Gm-Message-State: AOAM533FvC29niiNxbtV0Lg0GWoArk6lvUwYxMh7AuG+fTSYc1HB7Tck
        +AJ1LbjkRNvcsIPvRKXVurKhpA==
X-Google-Smtp-Source: ABdhPJxFXzUBFGAbcygJe7pI/DQ7+nSor4SuInYePOlJtUIkQsm0hYPiNBZ/qnyNjqTwF4BweSINiQ==
X-Received: by 2002:aa7:d310:0:b0:425:f22f:763f with SMTP id p16-20020aa7d310000000b00425f22f763fmr21799989edq.163.1652167943412;
        Tue, 10 May 2022 00:32:23 -0700 (PDT)
Received: from [192.168.0.250] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id a12-20020a50f0cc000000b00425d6c76494sm7275974edm.1.2022.05.10.00.32.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 May 2022 00:32:22 -0700 (PDT)
Message-ID: <f9f90137-dfd0-e88c-9157-b875afda4194@linaro.org>
Date:   Tue, 10 May 2022 09:32:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/2] dt-bindings: add extended-range-enable property to
 lm90.yaml
Content-Language: en-US
To:     Holger Brunck <holger.brunck@hitachienergy.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220509131016.29481-1-holger.brunck@hitachienergy.com>
 <af58fc2a-9d72-82b5-2cd4-8376a99e9ef5@roeck-us.net>
 <DB9PR06MB7289C1EF96CAC7554D65EC2EF7C99@DB9PR06MB7289.eurprd06.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <DB9PR06MB7289C1EF96CAC7554D65EC2EF7C99@DB9PR06MB7289.eurprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/05/2022 09:19, Holger Brunck wrote:
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
>>>   Documentation/devicetree/bindings/hwmon/national,lm90.yaml | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
>>> b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
>>> index 30db92977937..98d01f6c9331 100644
>>> --- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
>>> +++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
>>> @@ -52,6 +52,10 @@ properties:
>>>     vcc-supply:
>>>       description: phandle to the regulator that provides the +VCC
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

That binding was never reviewed by Rob and it does not use vendor
prefixes for any of the fields, so it should not be treated as an example.

Custom properties should have vendor prefix, like Guenter suggested.


Best regards,
Krzysztof
