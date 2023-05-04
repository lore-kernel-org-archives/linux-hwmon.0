Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0768C77B78
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 May 2023 11:44:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbjEDLow (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 May 2023 07:44:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230147AbjEDLow (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 May 2023 07:44:52 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 671744223
        for <linux-hwmon@vger.kernel.org>; Thu,  4 May 2023 04:44:50 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-50bd37ca954so16392628a12.0
        for <linux-hwmon@vger.kernel.org>; Thu, 04 May 2023 04:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683200689; x=1685792689;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=psZX5RvMka6EfTIT04LB484cGcwOW4uCNYm9T1PIx84=;
        b=wRywg3Njv7yCL2L7wjU2PrGS7srBglHCcTE0R1cAfC2EG/iExFfLueT/SGiuYkw5jD
         x14y6lL8/8ooSocbEkyfCdt3uaLGSWdrI/9eebO8yDoyM5ghIvrzEkX+BdfNHsNCO8u/
         fIRKlKVJoqfuCHet+7cbe9cGwSLLDCRJEZI8vCafpbYkco6f4fS9tiiYxlOxaH4oNMCo
         zQTzlYj1IdnGXVKQIMCkX1RcCXHCsmf+6t9ll7XafqRUnPnmGkZWgD7u9pSTBhD2Z4z5
         F4ZwP50teV/KqX/EMiTIt9IDIrpD5PF2AqCCeEetjBX1jXhGpoakvAqPs88SHgwasMwq
         x37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683200689; x=1685792689;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=psZX5RvMka6EfTIT04LB484cGcwOW4uCNYm9T1PIx84=;
        b=HS8xgd0F/Oue3ooWbLreiRUiTHHQlyIH1sFjnk916nAYZeKn6o8MV6ruIrmC4HezDB
         FPJOCt6tnL7ELXP/DCr89CtZUK6DLHVXnXeWMaqXzh8T3B6J5sye6w7+mJ4tt85PCXGn
         08aS8PHD1scQ8C3x8Kc3tmW3+phQb1jmTC7gnlEdu/5PAQWX6qKVio+tQiGM4vAlxjVW
         jSclSZ4z2iTA4ehlivTj8R00NmgDB0x2K+FSHs4fHVpTLaD48azD4Cb+lPeTWmymEqpQ
         VG27OL9dCaqVwo7BXFLuV5Yych8LzRIG5lRJta8qEJ7YLFzOdzdq01BaFR501V4IajvR
         jTfg==
X-Gm-Message-State: AC+VfDzHJKyx72yDkR9lsU9ar+Yukq/0KYB/EQHzvcpQJwKX4dWOrhh0
        gxqbMkAOONROIxwgpwNtxtatMg==
X-Google-Smtp-Source: ACHHUZ4Fw1Wg6/JX8jXbyyKV8/ma71KYJfVhPrBKMLlDfSmgG4rh9xPaCEhRPT5TOFhNsfIgjxVwZg==
X-Received: by 2002:a17:907:9281:b0:95f:af3a:be8c with SMTP id bw1-20020a170907928100b0095faf3abe8cmr4084601ejc.18.1683200688778;
        Thu, 04 May 2023 04:44:48 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:cbf1:e7ef:fb81:e912? ([2a02:810d:15c0:828:cbf1:e7ef:fb81:e912])
        by smtp.gmail.com with ESMTPSA id hq32-20020a1709073f2000b0094f206b97e8sm18663216ejc.130.2023.05.04.04.44.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 04:44:48 -0700 (PDT)
Message-ID: <530ef711-a32a-fbf7-7bd0-2ddb4cb070f3@linaro.org>
Date:   Thu, 4 May 2023 13:44:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add max6639
Content-Language: en-US
To:     Naresh Solanki <naresh.solanki@9elements.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Marcello Sylvester Bauer <sylv@sylv.io>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230420111759.2687001-1-Naresh.Solanki@9elements.com>
 <76e57634-75dd-01e8-9c56-36ed7de17812@linaro.org>
 <c8d1b5db-318e-3401-0834-b89769831eca@9elements.com>
 <be129c4f-3ad7-c54b-936e-08b142608ebc@linaro.org>
 <88f9a008-2861-284c-76c4-7d416c107fbb@9elements.com>
 <bd45ea5d-e6e4-403a-e855-376e0f647f91@9elements.com>
 <20eb1d0e-0aa2-9d41-7ba5-2feb148748d0@linaro.org>
 <9d989c4c-7c9e-9e95-133f-03741d07198b@9elements.com>
 <80b60de0-dcb5-303f-8d13-f4b1cf7d8521@linaro.org>
 <45236017-22d2-f9f8-0069-77195e49221d@9elements.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <45236017-22d2-f9f8-0069-77195e49221d@9elements.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 04/05/2023 13:36, Naresh Solanki wrote:
> Hi Krzysztof,
> 
> On 04-05-2023 04:17 pm, Krzysztof Kozlowski wrote:
>> On 04/05/2023 11:47, Naresh Solanki wrote:
>>> Hi Krzysztof,
>>>
>>> On 03-05-2023 09:48 pm, Krzysztof Kozlowski wrote:
>>>> On 03/05/2023 10:26, Naresh Solanki wrote:
>>>>> Hi Krzysztof,
>>>>>
>>>>> On 24-04-2023 03:23 pm, Naresh Solanki wrote:
>>>>>> Hi Krzysztof,
>>>>>>
>>>>>> On 24-04-2023 03:12 pm, Krzysztof Kozlowski wrote:
>>>>>>> On 24/04/2023 11:18, Naresh Solanki wrote:
>>>>>>>
>>>>>>>>>> Changes in V2:
>>>>>>>>>> - Update subject
>>>>>>>>>> - Drop blank lines
>>>>>>>>>> ---
>>>>>>>>>>      .../bindings/hwmon/maxim,max6639.yaml         | 52
>>>>>>>>>> +++++++++++++++++++
>>>>>>>>>>      1 file changed, 52 insertions(+)
>>>>>>>>>>      create mode 100644
>>>>>>>>>> Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
>>>>>>>>>>
>>>>>>>>>> diff --git
>>>>>>>>>> a/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
>>>>>>>>>> b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
>>>>>>>>>> new file mode 100644
>>>>>>>>>> index 000000000000..1aaedfd7cee0
>>>>>>>>>> --- /dev/null
>>>>>>>>>> +++ b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
>>>>>>>>>> @@ -0,0 +1,52 @@
>>>>>>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>>>>>>> +%YAML 1.2
>>>>>>>>>> +---
>>>>>>>>>> +$id: http://devicetree.org/schemas/hwmon/maxim,max6639.yaml#
>>>>>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>>>>>> +
>>>>>>>>>> +title: Maxim max6639
>>>>>>>>>
>>>>>>>>> What is this device? fan controller?
>>>>>>>> Yes Fan controller.
>>>>>>>> Do you want me to update the title here as:
>>>>>>>> "Maxim MAC6639 2 channel fan controller & temperature monitor" ?
>>>>>>>
>>>>>>> Enough would be:
>>>>>>> Maxim MAX6639 Fan Controller
>>>>>> Ack
>>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>>>
>>>>>>>>>> +
>>>>>>>>>> +maintainers:
>>>>>>>>>> +  - Naresh Solanki <Naresh.Solanki@9elements.com>
>>>>>>>>>> +
>>>>>>>>>> +description: |
>>>>>>>>>> +  The MAX6639 is a 2-channel temperature monitor with dual,
>>>>>>>>>> automatic, PWM
>>>>>>>>>> +  fan-speed controller.  It monitors its own temperature and one
>>>>>>>>>> external
>>>>>>>>>> +  diode-connected transistor or the temperatures of two external
>>>>>>>>>> diode-connected
>>>>>>>>>> +  transistors, typically available in CPUs, FPGAs, or GPUs.
>>>>>>>>>> +
>>>>>>>>>> +  Datasheets:
>>>>>>>>>> +    https://datasheets.maximintegrated.com/en/ds/MAX6639-MAX6639F.pdf
>>>>>>>>>> +
>>>>>>>>>> +properties:
>>>>>>>>>> +  compatible:
>>>>>>>>>> +    enum:
>>>>>>>>>> +      - maxim,max6639
>>>>>>>>>> +
>>>>>>>>>> +  reg:
>>>>>>>>>> +    maxItems: 1
>>>>>>>>>> +
>>>>>>>>>> +  '#address-cells':
>>>>>>>>>> +    const: 1
>>>>>>>>>> +
>>>>>>>>>> +  '#size-cells':
>>>>>>>>>> +    const: 0
>>>>>>>>>
>>>>>>>>> Why do you need these two properties?
>>>>>>>> Ack. Will remove them.
>>>>>>>>>
>>>>>>>>> Anyway, the binding looks incomplete. Where are the supplies?
>>>>>>>>> Interrupts?
>>>>>>>> This patch just adds basic support to the existing platform driver.
>>>>>>>> Intention is to be able to call the driver from DT with basic
>>>>>>>> initialization from driver the existing driver.
>>>>>>>
>>>>>>> Bindings should be rather complete. Here the datasheet is accessible and
>>>>>>> few properties quite obvious, so I don't see a reason to skip them.
>>>>>> I agree with you. But currently the driver which is already merged
>>>>>> doesn't has it implemented.
>>>>>> And will be working on separate patch to include this later.
>>>>> Please let me know if this approach is acceptable, or if there are any
>>>>> other suggestions or concerns that you have.
>>>>
>>>> You are adding new bindings, so what does the driver has to do with it?
>>> The reason for adding these new bindings is to enable the use of the
>>> driver on my machine. Without the compatible string, it would not be
>>> possible to use the driver.
>>>
>>> Currently, the driver initializes the device with defaults, which is
>>> good enough for my application. Also, as you previously pointed out, it
>>> uses the optional 'fan-supply' which will be included in the next patch
>>> revision.
>>>
>>> I hope this clarifies my reasoning. Could you kindly confirm if we can
>>> proceed with this approach?
>>
>> No, we cannot, because we asked you to fix things there. Your entire
>> explanation about compatible and driver is not related to the comment
>> you received: bindings should be complete. You argue that bindings do
>> not have to be complete, because of something with driver. This is not
>> related. Bindings are not for driver.
> 
> I understand that complete bindings are important, but as the driver is 
> already merged and functional, my immediate goal is to enable its use on 
> my machine. I will work on a separate patch to include the interrupts in 
> both binding & driver.

I don't care about driver and did not comment about it. I don't
understand why do you bring it here all'n over.

Best regards,
Krzysztof

