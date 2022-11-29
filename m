Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2097C4167B
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Nov 2022 15:58:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235950AbiK2P6K (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 29 Nov 2022 10:58:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236067AbiK2P5Y (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Nov 2022 10:57:24 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 736B860E97
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Nov 2022 07:57:22 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id s8so22717156lfc.8
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Nov 2022 07:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mDFVPNh4/71qMRqEkALWrbJbV59lQnRr29JZ5Ud10II=;
        b=pHoptnjw71Za8weSzrMZuoqO/WMNgzMO4tC8LVNQprtmxusuAU4+ZnzsYXHcOZ0TXg
         qD76FmCaKxAjfR/zH4WzAicE43pmndPRcPpfKAcr3ZSIjHgFieRGMR2gFrNGKJbXFicC
         GPDFhDCmlLJWOvwvsAcRu8wOIqszrq7QlJNwAZOOMVL18ZpsqfWrTWdJR6AZPD3hs1DC
         dx4XJiHyqaCslldRDtlUHWafs/0iT372J6K58XgpiFTFkB8tQu6fVqjVglzSnkP7R5vn
         YfotcZ8Rpymspq5zxVWU3f0203YTWkHG/7I4jccw2IZTWdUtq2KpYS7sVLQhDFBZm+oC
         vdVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mDFVPNh4/71qMRqEkALWrbJbV59lQnRr29JZ5Ud10II=;
        b=AEhJQFQkSiIi8lg2vOuMJYJl0Xi26uix8HEjwgSjyqQ0kldzRAeO4apzSscQ4W1gqY
         o8MQJMqv3exODL+KArq746voZnKoq/JpNZWTXiqGvganfgmLU2Ng0IPsvYb33pbHfrEY
         uwqr3pdQWCtTvMGE/9showkw5ZybozMnem/1pPXn33nXG/Ut5UcwRP2m/d1Tw73rtBxQ
         TsSTomH7PdokCnC5ccfkAOUxqUpYhXq2aVy/Naf96Tb9XYQi1J4vMZKyRR94dHLnkVMI
         XXYXDuK3D7J1e9n0x+IPqtUsE3e04kjBwzAPKqwYoYjEKrcm6qTbVKlGSzJFCLHMnDbp
         uC0g==
X-Gm-Message-State: ANoB5plDrCpBVHkJ1HLd/fw02L/KiL3RACTvLznAXxdJyC6cOayVukiE
        3ekkO5pytq5RTDsVNthBt3fw1w==
X-Google-Smtp-Source: AA0mqf6+Hvb2/BZUZ6/6JjMgajEPlzD5UDHF+uyv1L7CN3Vz/MpOwoe4OgBBJsjuwKPYH+BgsbC1Mg==
X-Received: by 2002:ac2:5dd3:0:b0:4a2:6e1d:f996 with SMTP id x19-20020ac25dd3000000b004a26e1df996mr14144260lfq.114.1669737440717;
        Tue, 29 Nov 2022 07:57:20 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s11-20020a056512202b00b004979e1ff641sm2220303lfs.115.2022.11.29.07.57.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 07:57:20 -0800 (PST)
Message-ID: <a5e9ecca-b17e-3045-db37-e109ecca3235@linaro.org>
Date:   Tue, 29 Nov 2022 16:57:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v7 1/4] dt-bindings: hwmon: fan: Add fan binding to schema
Content-Language: en-US
To:     Naresh Solanki <naresh.solanki@9elements.com>,
        devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>
References: <20221121122932.2493174-1-Naresh.Solanki@9elements.com>
 <20221121122932.2493174-2-Naresh.Solanki@9elements.com>
 <c35917d1-dfbd-f7d9-5c94-a9f0ee3b7ed8@linaro.org>
 <2487f032-1261-be6e-2e2a-38ca0af7c83c@9elements.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2487f032-1261-be6e-2e2a-38ca0af7c83c@9elements.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 29/11/2022 16:46, Naresh Solanki wrote:
> Hi Krzysztof,
> 
> On 29-11-2022 01:42 pm, Krzysztof Kozlowski wrote:
>> On 21/11/2022 13:29, Naresh Solanki wrote:
>>
>>> +  pulses-per-revolution:
>>> +    description:
>>> +      The number of pulse from fan sensor per revolution.
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +
>>> +  target-rpm:
>>> +    description:
>>> +      Target RPM the fan should be configured during driver probe.
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +
>>> +  pwms:
>>> +    description:
>>> +      PWM provider.
>>
>> Ah, so it is not a PWM provider by this FAN controller? A bit confusing
>> description. Instead maybe:
>> 	PWM signal for the fan
> Sure.
>>
>> and do you expect more than one PWM for one fan?
> One pwm per fan

then:
  maxItems: 1

Best regards,
Krzysztof

