Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C65BCC6FD1D
	for <linux-hwmon@archiver.kernel.org>; Tue,  4 Apr 2023 10:08:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234356AbjDDKIY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 4 Apr 2023 06:08:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234350AbjDDKIX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 4 Apr 2023 06:08:23 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62CEC1BD6
        for <linux-hwmon@vger.kernel.org>; Tue,  4 Apr 2023 03:08:21 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id cn12so128393812edb.4
        for <linux-hwmon@vger.kernel.org>; Tue, 04 Apr 2023 03:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680602900;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZlNybzVLYx+A0XBeoH4oXwuGxi1u7KKBqs1hBUDO4vo=;
        b=hFSvDhnr6/SiTUZWMmI6o6a09OPjQKM+CX//VRhSYtWawTDhAbGCWc9WqmkneaBOAA
         u5ut8fQpyXa5GU3O4sCiX4dBMC0/8pzL73PzO1dTaiOvivV2ETDp2k+Yy/wyPlKkKRWz
         VvdTl/OUrmF9GAc7YE9a9pC77VCb7VZjshJ37i4CYZ9p07oh8kI7mOxQ6y2HQ/djxp05
         WpQIzcdwTW2QmJvEurxazwv+UhmtMJB0xcbjpqq3+ih2Y6n0iV0N6FPXzmIELq1BYRbh
         mZSb+35C7dFZvILeDrhqfEOyPuppguyHtrw9DxTc/kffGrgVUmzhGiMtz6ciLC2GTIK3
         ZaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680602900;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZlNybzVLYx+A0XBeoH4oXwuGxi1u7KKBqs1hBUDO4vo=;
        b=UXXjxImN1jGXr023yrxfY9x4W0Zym6u8moxx+9FvCplL39qHwhwPwWI0mJrHUJgNM4
         ageakLFtlxOXYTat8N0Seg/+wmNiIulr0lqrCMC3fbudGEMsF0jyi5ec5YPqUlcab4aY
         xd0/K/oxG4fXPhIEFo7rguU7g0itkxgh9JiHNYTr6Qe9iWC7DxyNm2DAw6XRT2H2Bi2C
         S+Lo2kU/outRAiTIEndPRaq4pMy1GYss2CfLhBSMorGgRtevNJ82S/k6h6n9lP4hK3qP
         mZCYyGUX+OWBz6mJbsDV2tQFIJ+cuRmILcTxrqW3j/g7vx3XtOd4Hy6aPwqm15Mmi9Q5
         herA==
X-Gm-Message-State: AAQBX9dfyoYrllEBO+ZxLd3foODK7ozcBaabcC//0JDKFclvimvlwHTv
        OyxqsnqTxerE4tkVKuhD4DTCfw==
X-Google-Smtp-Source: AKy350bJMw5BxtPsRrX6tWOtAUx08BJPXquoaQXRMSvM7Ko3k4DaEbSSeB4O1fnXi4QX4w3SK+g8tg==
X-Received: by 2002:a17:906:1c0a:b0:947:f4e2:ad6d with SMTP id k10-20020a1709061c0a00b00947f4e2ad6dmr1416732ejg.72.1680602899914;
        Tue, 04 Apr 2023 03:08:19 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:99ed:4575:6001:8bda? ([2a02:810d:15c0:828:99ed:4575:6001:8bda])
        by smtp.gmail.com with ESMTPSA id s5-20020a170906454500b008e54ac90de1sm5765184ejq.74.2023.04.04.03.08.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 03:08:19 -0700 (PDT)
Message-ID: <1efdb870-cac2-f6ed-72b5-d0550dbb5257@linaro.org>
Date:   Tue, 4 Apr 2023 12:08:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5 2/2] dt-bindings: rtc: add max313xx RTCs
Content-Language: en-US
To:     "Tilki, Ibrahim" <Ibrahim.Tilki@analog.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "Arslanbenzer, Zeynep" <Zeynep.Arslanbenzer@analog.com>
References: <20230403154342.3108-1-Ibrahim.Tilki@analog.com>
 <20230403154342.3108-3-Ibrahim.Tilki@analog.com>
 <dd6f0842-519f-1bc9-f7f5-459863dc3dcd@linaro.org>
 <202304040710049c9cc01a@mail.local>
 <CY4PR03MB2488DFC99C23ADE16FF40E2F96939@CY4PR03MB2488.namprd03.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CY4PR03MB2488DFC99C23ADE16FF40E2F96939@CY4PR03MB2488.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 04/04/2023 11:26, Tilki, Ibrahim wrote:
>>>> +  aux-voltage-chargeable:
>>>> +    enum: [0, 1, 2]
>>>> +    description: |
>>>> +      Enables trickle charger.
>>>> +      0: Charger is disabled (default)
>>>> +      1: Charger is enabled
>>>> +      2: Charger is enabled with a diode
>>>
>>> 2 is not an allowed value. I asked to drop this property. It is coming
>>> from rtc.yaml. I also do not understand "with a diode". So otherwise it
>>> is charging with, I don't know, FET?
>>
>> No, what is not explained here (and maybe not unsterstood by the
>> submitter) is that the RTC has an extra diode so, charging will always
>> enable a diode, select a resistor and then have or not an extra diode.
>> Figure2 of the MAX31329 datasheet is great.
>>
> 
> That is exactly why I had "adi,trickle-diode-enable" property in previous patch.
> So if I can't have "adi,trickle-diode-enable" and can't add an additional value
> to "aux-voltage-chargeable", I am not sure how to add support for the extra
> diode at this point.

Ask the person who asked you to remove adi,trickle-diode-enable...
Anyway even if you decided to go with such advise, the solution is not
to create binding which fails.


Best regards,
Krzysztof

