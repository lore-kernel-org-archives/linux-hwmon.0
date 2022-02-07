Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA296C43219
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Feb 2022 01:06:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239804AbiBHBFT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 7 Feb 2022 20:05:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245636AbiBGXRK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 7 Feb 2022 18:17:10 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82885C061355;
        Mon,  7 Feb 2022 15:17:09 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id 4so18697393oil.11;
        Mon, 07 Feb 2022 15:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=TypSkgHClNw9laVafBd03ztbkjhilyidCbfBGVWWAyM=;
        b=gLksK20ghnNV76ORBpB0huHY6qnK9H0AMXd8Pob0+FUbavvWLxTgrC+nw4XM7/N3VJ
         QNTkHT3YfsxI8gYf6ne3m+sGXZ6seaWiZfNBJ/AO+BIDm96lV3cyKkyKthywmO60sQiU
         evnVhjLKQGJzKvWHUjz3Ah1LUEq7q0NcpWOTRxFR8VZb0tGZk6htmesSum4fFKbPAR1u
         Y+PhwmsBft3ztd0Kx/77aGvDsdKWulQMym6R8Zw3/c7KJWFI389xF22hZSvZjb9GSUcX
         Q/6eSAIwtzYXpf45/YYgQhpG4a1ZPMQ3BBagT87c6LmotH7dl2ZoSa0GGxTqf2UJR9jD
         x24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=TypSkgHClNw9laVafBd03ztbkjhilyidCbfBGVWWAyM=;
        b=KSu2oXzPQi7R4aFg+rB7SbXrD6XYVy2BsouCx8I70uj0Rmn3eLBM7gYN5MNiPYliXw
         AgZo35+PdPMhmbtcyBilz4LTVSK/LZsBQKtOgQ9AOTXW+NiQytOXP+bZBaemuWQq8fL8
         dWXHPootpkyv97T8sk6rAvDNtI8F0tuq50vQ36brLB7IAIg0WcnMdxbUvncJy9jEgk5l
         h16aDrx/Hz8tisUz+LuiP1+iQO+pB5dN0DSlwoQG9ltHECya6uJajZPDS5g/9t/R43la
         llUc0zhHFVfB2UzpSpkTXMT7fkSoowMC5h86lah2uiGK1fyRqzKdxF7Ks4sGgLF6nRsx
         K+Ww==
X-Gm-Message-State: AOAM5337uoGgg5WNLB8BvTAEVKAH2SLb1OToruvU4wITK+BH2KdKRR3R
        hJVngqsNm96U9iAu5H7GaWg8AdX2+DrJJg==
X-Google-Smtp-Source: ABdhPJw4BfJc80bEgjfrJqZfP4rCzZ1d2OWzW/BMN4K4gjDZXC3F1+CKyB4i8vKHnr/e7uAKXeOx1A==
X-Received: by 2002:a05:6808:d52:: with SMTP id w18mr608556oik.133.1644275828888;
        Mon, 07 Feb 2022 15:17:08 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l4sm4591002otq.50.2022.02.07.15.17.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Feb 2022 15:17:08 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d6c0649c-db38-49a0-56f5-432db39a99ab@roeck-us.net>
Date:   Mon, 7 Feb 2022 15:17:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To:     sylv <sylv@sylv.io>, Rob Herring <robh@kernel.org>
Cc:     linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Jean Delvare <jdelvare@suse.com>,
        Roland Stigge <stigge@antcom.de>, devicetree@vger.kernel.org
References: <cover.1643299570.git.sylv@sylv.io>
 <224e73b57101aa744244bd396a700d5365eb72ec.1643299570.git.sylv@sylv.io>
 <Yf23k5vrZ8CEAKda@robh.at.kernel.org>
 <b55f673b2ba25dbdfeafd4558f5cd2ba2ca0ee39.camel@sylv.io>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v4 3/4] dt-bindings: hwmon: Add binding for max6639
In-Reply-To: <b55f673b2ba25dbdfeafd4558f5cd2ba2ca0ee39.camel@sylv.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2/7/22 02:03, sylv wrote:
> On Fri, 2022-02-04 at 17:32 -0600, Rob Herring wrote:
>> On Thu, Jan 27, 2022 at 05:17:29PM +0100, Marcello Sylvester Bauer
>> wrote:
>>> Add Devicetree binding documentation for Maxim MAX6639 temperature
>>> monitor with PWM fan-speed controller.
>>>
>>> The devicetree documentation for the SD3078 device tree.
>>>
>>> Signed-off-by: Marcello Sylvester Bauer <sylv@sylv.io>
>>> ---
>>>   .../bindings/hwmon/maxim,max6639.yaml         | 112
>>> ++++++++++++++++++
>>>   1 file changed, 112 insertions(+)
>>>   create mode 100644
>>> Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
>>> b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
>>> new file mode 100644
>>> index 000000000000..570e9fe07503
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
>>> @@ -0,0 +1,112 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +
>>> +$id: http://devicetree.org/schemas/hwmon/maxim,max6639.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Maxim max6639
>>> +
>>> +maintainers:
>>> +  - Roland Stigge <stigge@antcom.de>
>>> +
>>> +description: |
>>> +  The MAX6639 is a 2-channel temperature monitor with dual,
>>> automatic, PWM
>>> +  fan-speed controller.  It monitors its own temperature and one
>>> external
>>> +  diode-connected transistor or the temperatures of two external
>>> diode-connected
>>> +  transistors, typically available in CPUs, FPGAs, or GPUs.
>>> +
>>> +  Datasheets:
>>> +
>>> https://datasheets.maximintegrated.com/en/ds/MAX6639-MAX6639F.pdf
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - maxim,max6639
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  '#address-cells':
>>> +    const: 1
>>> +
>>> +  '#size-cells':
>>> +    const: 0
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - "channel@0"
>>> +  - "channel@1"
>>> +
>>> +additionalProperties: false
>>> +
>>> +patternProperties:
>>> +  "^channel@[0-1]$":
>>
>> fan@...
> 
> Makes sense. Looks like i have to adapt the driver code too.
> 
>>
>>> +    type: object
>>> +    description: |
>>> +      Represents the two fans and their specific configuration.
>>> +
>>> +    properties:
>>> +      reg:
>>> +        description: |
>>> +          The fan number.
>>> +        items:
>>> +          minimum: 0
>>> +          maximum: 1
>>> +
>>> +      pwm-polarity:
>>
>> See PWM_POLARITY_INVERTED
>>
> 
> Indeed, Thanks.
> 
>>
>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>> +        enum: [0, 1]
>>> +        default: 1
>>> +        description:
>>> +          PWM output is low at 100% duty cycle when this bit is
>>> set to zero. PWM
>>> +          output is high at 100% duty cycle when this bit is set
>>> to 1.
>>> +
>>> +      pulses-per-revolution:
>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>> +        enum: [1, 2, 3, 4]
>>> +        default: 2
>>> +        description:
>>> +          Value specifying the number of pulses per revolution of
>>> the controlled
>>> +          FAN.
>>> +
>>> +      rpm-max:
>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>> +        enum: [2000, 4000, 8000, 16000]
>>> +        default: 4000
>>> +        description:
>>> +          Scales the tachometer counter by setting the maximum
>>> (full-scale) value
>>> +          of the RPM range.
>>
>> Why do you need to know the max? I don't recall needing this for
>> other
>> fan controller bindings.
> 
> This information is required for setting the internal clock of the
> tachometer. (See: page 8 table 3). However, we could make it a vendor
> specific property. In this case i would rather call it "maxim,rpm-
> range", since this is how it is referred to.
> 

The maximum fan speed is a common property of fan controllers.
Exceeding the configured value would typically generate an alarm.
The same applies to minimum fan speed. As an example, ADT7470
supports both minimum and maximum fan speed and generates an alarm
if the fan speed is too low and if it is too high.

At some point we will need properties for both the minimum and for
the maximum fan speed. Seems to me we might as well define it now.

Guenter
