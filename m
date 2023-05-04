Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE065C77B7C
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 May 2023 09:47:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230430AbjEDJrd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 May 2023 05:47:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbjEDJrb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 May 2023 05:47:31 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDBB04C15
        for <linux-hwmon@vger.kernel.org>; Thu,  4 May 2023 02:47:29 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1aad55244b7so1489395ad.2
        for <linux-hwmon@vger.kernel.org>; Thu, 04 May 2023 02:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1683193649; x=1685785649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6qubOiERHGS1J8v+Zq6pOuw2BSBtjZ1nMOAjNz3GrsI=;
        b=dK9tDu74Ul9fYi1mNmYCrKtHmZwx8DyEgBxplBiB0zir8cqs0JYavDhu+vIgpt2Yd4
         sCfLiMpEZRje8q3QW3xHfQIEh59yWw6MrC5+UQkYm91Ds5EgjSF/n7stSk54JOIwY+j6
         N0xLB+TZfkMtbvYNmlRNE7HvnygLAZG0n+YFvoT9+iMyWUTBlK0+KAky7JjfTbyENjZP
         4gwj+nNcGUfdSSMhqT3gTcbP+t8vX8f2XI2frf58Kgy8WN7xhJM3mWR/piJTuc31ZHrR
         Ptl1o5HYXnZWWuCwco6AqBThLV9emd2f1eWF/X7zbdewXl0YiXFTuIvS3kgBeR5kpn1c
         Oa4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683193649; x=1685785649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6qubOiERHGS1J8v+Zq6pOuw2BSBtjZ1nMOAjNz3GrsI=;
        b=QAXPFjzpL7UU8aBt14ljmVRAqNLPs5VfiQOon/PiXX4Dr8ZbOzqdP3DUaZzrX0LD1z
         0TOhwgkdUUi+JGWK6tkYadYp/uTZmZSpoqTcEYroT3mqJrynF+t1phctKe0RfkVD8PoX
         Jdl6k5JkEB/EubwvkNkhI1AEMFqRzkNXaW7ko0Tf0rVLQMZLb+min6rxp0UxbEtpYvsM
         bqAF7VpOGqxX5fg9qH+k+sb0AcTOHUF19/ggeonvRW6Ynx06R7VA7UHiueF/1L4LIFXZ
         /HjkgRkqhnvfneb2bdQ96t0zW7q/u4sdpnNCY1C2dVKN5lY9FdHdlcxK8A9wHpJuiABr
         JKCQ==
X-Gm-Message-State: AC+VfDyIi0h/hggDOwAfgtqAqyWUclq1GGKAJjN9TNaWvOva6xZoS6rS
        +cgyqGzBsFhtBNuKFJfNTcv43Q==
X-Google-Smtp-Source: ACHHUZ6iEVsItcif2MdnXxApAxCiKf/L4w9eOy/hb41erQyuoaYb0bFGdtRl0ARCFrBbGdX9CG6GQQ==
X-Received: by 2002:a17:902:be09:b0:1ab:1b9d:50bf with SMTP id r9-20020a170902be0900b001ab1b9d50bfmr3096948pls.64.1683193649403;
        Thu, 04 May 2023 02:47:29 -0700 (PDT)
Received: from ?IPV6:2405:201:d02f:d855:461d:14be:2cce:b776? ([2405:201:d02f:d855:461d:14be:2cce:b776])
        by smtp.gmail.com with ESMTPSA id z2-20020a170902708200b001a19196af48sm23075222plk.64.2023.05.04.02.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 02:47:29 -0700 (PDT)
Message-ID: <9d989c4c-7c9e-9e95-133f-03741d07198b@9elements.com>
Date:   Thu, 4 May 2023 15:17:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add max6639
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
Content-Language: en-US
From:   Naresh Solanki <naresh.solanki@9elements.com>
In-Reply-To: <20eb1d0e-0aa2-9d41-7ba5-2feb148748d0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Krzysztof,

On 03-05-2023 09:48 pm, Krzysztof Kozlowski wrote:
> On 03/05/2023 10:26, Naresh Solanki wrote:
>> Hi Krzysztof,
>>
>> On 24-04-2023 03:23 pm, Naresh Solanki wrote:
>>> Hi Krzysztof,
>>>
>>> On 24-04-2023 03:12 pm, Krzysztof Kozlowski wrote:
>>>> On 24/04/2023 11:18, Naresh Solanki wrote:
>>>>
>>>>>>> Changes in V2:
>>>>>>> - Update subject
>>>>>>> - Drop blank lines
>>>>>>> ---
>>>>>>>     .../bindings/hwmon/maxim,max6639.yaml         | 52
>>>>>>> +++++++++++++++++++
>>>>>>>     1 file changed, 52 insertions(+)
>>>>>>>     create mode 100644
>>>>>>> Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
>>>>>>>
>>>>>>> diff --git
>>>>>>> a/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
>>>>>>> b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
>>>>>>> new file mode 100644
>>>>>>> index 000000000000..1aaedfd7cee0
>>>>>>> --- /dev/null
>>>>>>> +++ b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
>>>>>>> @@ -0,0 +1,52 @@
>>>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>>>> +%YAML 1.2
>>>>>>> +---
>>>>>>> +$id: http://devicetree.org/schemas/hwmon/maxim,max6639.yaml#
>>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>>> +
>>>>>>> +title: Maxim max6639
>>>>>>
>>>>>> What is this device? fan controller?
>>>>> Yes Fan controller.
>>>>> Do you want me to update the title here as:
>>>>> "Maxim MAC6639 2 channel fan controller & temperature monitor" ?
>>>>
>>>> Enough would be:
>>>> Maxim MAX6639 Fan Controller
>>> Ack
>>>>
>>>>
>>>>>
>>>>>>
>>>>>>> +
>>>>>>> +maintainers:
>>>>>>> +  - Naresh Solanki <Naresh.Solanki@9elements.com>
>>>>>>> +
>>>>>>> +description: |
>>>>>>> +  The MAX6639 is a 2-channel temperature monitor with dual,
>>>>>>> automatic, PWM
>>>>>>> +  fan-speed controller.  It monitors its own temperature and one
>>>>>>> external
>>>>>>> +  diode-connected transistor or the temperatures of two external
>>>>>>> diode-connected
>>>>>>> +  transistors, typically available in CPUs, FPGAs, or GPUs.
>>>>>>> +
>>>>>>> +  Datasheets:
>>>>>>> +    https://datasheets.maximintegrated.com/en/ds/MAX6639-MAX6639F.pdf
>>>>>>> +
>>>>>>> +properties:
>>>>>>> +  compatible:
>>>>>>> +    enum:
>>>>>>> +      - maxim,max6639
>>>>>>> +
>>>>>>> +  reg:
>>>>>>> +    maxItems: 1
>>>>>>> +
>>>>>>> +  '#address-cells':
>>>>>>> +    const: 1
>>>>>>> +
>>>>>>> +  '#size-cells':
>>>>>>> +    const: 0
>>>>>>
>>>>>> Why do you need these two properties?
>>>>> Ack. Will remove them.
>>>>>>
>>>>>> Anyway, the binding looks incomplete. Where are the supplies?
>>>>>> Interrupts?
>>>>> This patch just adds basic support to the existing platform driver.
>>>>> Intention is to be able to call the driver from DT with basic
>>>>> initialization from driver the existing driver.
>>>>
>>>> Bindings should be rather complete. Here the datasheet is accessible and
>>>> few properties quite obvious, so I don't see a reason to skip them.
>>> I agree with you. But currently the driver which is already merged
>>> doesn't has it implemented.
>>> And will be working on separate patch to include this later.
>> Please let me know if this approach is acceptable, or if there are any
>> other suggestions or concerns that you have.
> 
> You are adding new bindings, so what does the driver has to do with it?
The reason for adding these new bindings is to enable the use of the 
driver on my machine. Without the compatible string, it would not be 
possible to use the driver.

Currently, the driver initializes the device with defaults, which is 
good enough for my application. Also, as you previously pointed out, it 
uses the optional 'fan-supply' which will be included in the next patch 
revision.

I hope this clarifies my reasoning. Could you kindly confirm if we can 
proceed with this approach?

Best Regards,
~Naresh

> 
> Best regards,
> Krzysztof
> 
