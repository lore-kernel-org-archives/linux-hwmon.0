Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3B5C77B78
	for <linux-hwmon@archiver.kernel.org>; Wed,  3 May 2023 16:18:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbjECQSl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 3 May 2023 12:18:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjECQSg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 3 May 2023 12:18:36 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73B3EF5
        for <linux-hwmon@vger.kernel.org>; Wed,  3 May 2023 09:18:34 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5083bd8e226so8372708a12.3
        for <linux-hwmon@vger.kernel.org>; Wed, 03 May 2023 09:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683130713; x=1685722713;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Aan+1nXbt0jfOhD5Ja5iMTYpmi8Pt1ECMfi2iv1VeQ=;
        b=gXBiF7En2VrfDtBHTZZ++RcIziw1n4WPIy9B5dSvtTFmQDqBSCYvUAAiBUYQb/0fdl
         Myj5Gmp9pWY7w3nqgJoXlJua/D7lCPS/Iu2mNZY0SNSkvjbXYcf7ugS417S/43TEhRFX
         anNGqZGmCMKlvSwP4v1vDoo7SJlrWfnvKjV10paXIkswmcuGTxQqlWEDRUICOKQp+Nh5
         OzkZMDTYP73470zGL45CmV8EYPlUHSpoichcICj1SxtE33cxdwhVAsKJ2cQG5TQQIDVO
         iN2x+5RJgxfy+YiFmFEOpKE6iTLA92x60XGcvUYhMn2EtkzNlwDpS0cPSDkNr8UHWCnl
         oXgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683130713; x=1685722713;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Aan+1nXbt0jfOhD5Ja5iMTYpmi8Pt1ECMfi2iv1VeQ=;
        b=gTiRIi+fEpnmtC8cwtbqwErsh0oF2ZIjNMD2VBQ8peq65Ulv4jL1ZI2g4N7KKRj9Hl
         FkMyXaSZgY6DIBByB6txHlua+Z5QBGxn6tfJS4K3y2sXtfEJJzwi27cDplSGneGam0s5
         Fu73MRku9HxFrCTr9COzo8RsyBYr8qRmaBcjE1lvrlH9s0Hhy1DSRGz5MQFbRC5Ev2cx
         zi07Q4bidkgpWtzJbkFC1mT3SD6Tph4+9XhqFOLiwdfHZg1dD7t0foVJf8VIvswlhPrc
         weqadmIaiwEGRtRvkD28PdK+oHM0qxLknXmTo5wrefgGvWdjumRdi6gHzPSKIl61dVur
         qCsQ==
X-Gm-Message-State: AC+VfDyAlQ0lDeg6zyWHJvHUkhXm3+Y5LaydC/fr4nSPWTHIHkLmCPc+
        d6QhKZdhyIjhKEhSibD1nyoblg==
X-Google-Smtp-Source: ACHHUZ6LmTTQu4gGi+AtIGCA4HB4MOYccg0kMPqHGZGgaW6d/6TXsmKRpjiBwFjG/T6Ot/HnM6fkww==
X-Received: by 2002:aa7:c849:0:b0:502:2494:b8fc with SMTP id g9-20020aa7c849000000b005022494b8fcmr11029297edt.7.1683130712901;
        Wed, 03 May 2023 09:18:32 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:db42:e3d0:c55a:8cf1? ([2a02:810d:15c0:828:db42:e3d0:c55a:8cf1])
        by smtp.gmail.com with ESMTPSA id bm11-20020a0564020b0b00b00506987c5c71sm859910edb.70.2023.05.03.09.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 09:18:32 -0700 (PDT)
Message-ID: <20eb1d0e-0aa2-9d41-7ba5-2feb148748d0@linaro.org>
Date:   Wed, 3 May 2023 18:18:31 +0200
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <bd45ea5d-e6e4-403a-e855-376e0f647f91@9elements.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 03/05/2023 10:26, Naresh Solanki wrote:
> Hi Krzysztof,
> 
> On 24-04-2023 03:23 pm, Naresh Solanki wrote:
>> Hi Krzysztof,
>>
>> On 24-04-2023 03:12 pm, Krzysztof Kozlowski wrote:
>>> On 24/04/2023 11:18, Naresh Solanki wrote:
>>>
>>>>>> Changes in V2:
>>>>>> - Update subject
>>>>>> - Drop blank lines
>>>>>> ---
>>>>>>    .../bindings/hwmon/maxim,max6639.yaml         | 52 
>>>>>> +++++++++++++++++++
>>>>>>    1 file changed, 52 insertions(+)
>>>>>>    create mode 100644 
>>>>>> Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
>>>>>>
>>>>>> diff --git 
>>>>>> a/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml 
>>>>>> b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
>>>>>> new file mode 100644
>>>>>> index 000000000000..1aaedfd7cee0
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
>>>>>> @@ -0,0 +1,52 @@
>>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>>> +%YAML 1.2
>>>>>> +---
>>>>>> +$id: http://devicetree.org/schemas/hwmon/maxim,max6639.yaml#
>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>> +
>>>>>> +title: Maxim max6639
>>>>>
>>>>> What is this device? fan controller?
>>>> Yes Fan controller.
>>>> Do you want me to update the title here as:
>>>> "Maxim MAC6639 2 channel fan controller & temperature monitor" ?
>>>
>>> Enough would be:
>>> Maxim MAX6639 Fan Controller
>> Ack
>>>
>>>
>>>>
>>>>>
>>>>>> +
>>>>>> +maintainers:
>>>>>> +  - Naresh Solanki <Naresh.Solanki@9elements.com>
>>>>>> +
>>>>>> +description: |
>>>>>> +  The MAX6639 is a 2-channel temperature monitor with dual, 
>>>>>> automatic, PWM
>>>>>> +  fan-speed controller.  It monitors its own temperature and one 
>>>>>> external
>>>>>> +  diode-connected transistor or the temperatures of two external 
>>>>>> diode-connected
>>>>>> +  transistors, typically available in CPUs, FPGAs, or GPUs.
>>>>>> +
>>>>>> +  Datasheets:
>>>>>> +    https://datasheets.maximintegrated.com/en/ds/MAX6639-MAX6639F.pdf
>>>>>> +
>>>>>> +properties:
>>>>>> +  compatible:
>>>>>> +    enum:
>>>>>> +      - maxim,max6639
>>>>>> +
>>>>>> +  reg:
>>>>>> +    maxItems: 1
>>>>>> +
>>>>>> +  '#address-cells':
>>>>>> +    const: 1
>>>>>> +
>>>>>> +  '#size-cells':
>>>>>> +    const: 0
>>>>>
>>>>> Why do you need these two properties?
>>>> Ack. Will remove them.
>>>>>
>>>>> Anyway, the binding looks incomplete. Where are the supplies? 
>>>>> Interrupts?
>>>> This patch just adds basic support to the existing platform driver.
>>>> Intention is to be able to call the driver from DT with basic
>>>> initialization from driver the existing driver.
>>>
>>> Bindings should be rather complete. Here the datasheet is accessible and
>>> few properties quite obvious, so I don't see a reason to skip them.
>> I agree with you. But currently the driver which is already merged 
>> doesn't has it implemented.
>> And will be working on separate patch to include this later.
> Please let me know if this approach is acceptable, or if there are any 
> other suggestions or concerns that you have.

You are adding new bindings, so what does the driver has to do with it?

Best regards,
Krzysztof

