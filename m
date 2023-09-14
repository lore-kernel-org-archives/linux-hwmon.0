Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 942B9EDE982
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Sep 2023 05:43:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234864AbjINFoA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 14 Sep 2023 01:44:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234895AbjINFn7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 14 Sep 2023 01:43:59 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23CB4CE
        for <linux-hwmon@vger.kernel.org>; Wed, 13 Sep 2023 22:43:55 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-403004a96a4so5845775e9.3
        for <linux-hwmon@vger.kernel.org>; Wed, 13 Sep 2023 22:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694670233; x=1695275033; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gboc+yTSlTpqo4O2hT0cAj0WNACoksBEekqcz7Hl4Y0=;
        b=qj/foAC6JHM58o+shEjt5deuS1KouDYNa66h/L+Hp/4Rl+MkS77NG9jwg7M6byduLw
         CetU5Jvm+5EshWFqJm+5ZtBsP1znN0aE5Ll6yGcoTAv2T5h4NY7lgeq7Sk7EFzCoKcsD
         T74mCJGRCP2tKrS0u+OAhd0EhXRvYR09lrAQ5ZSEWLbwl6zcv/Cqqew9Iyk7j+t9EOGK
         2Oahcp0itVZXqM4uqD11vJKj9Q+h+hU9SQFYXfDNMA7ka4mMnZIA5EZKr70c5+HD5bJl
         UR/iDwPSpboJtLpLZoHMsTGVE9n3snQYZGfhUdtKDQqaNkEL5elX8RhE55n3MFpgR/fW
         6niA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694670233; x=1695275033;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gboc+yTSlTpqo4O2hT0cAj0WNACoksBEekqcz7Hl4Y0=;
        b=MCFioJ1f7elsxkSx/QiC+qRXq0sarVROxh5ZPk5/3NZMOCaPwfOAHWkZBR8HVmno41
         kRifJQhFlS8Ri01ex9SkxSe4+MrdEKXC508DnWWFe418sYfEIHsmvfP3TdEXkFXQqBuF
         fUqJYC06SP6GX9EEwcpqws3f4PaH/vxBkkiMuCx2MCTzHeZEvNxmJZwNfmvKerjsjyoJ
         bwZS7/Zfr1URzWc/8RIrkFdejokYyrAT/jT7al4TiaNLCn6jF6rKu7GU+e47wHiYEkhB
         AbVTK0NnNldc56GARrWvGONoqvk0WWpJ9Q5nPr6+YdYxRzJOH+DcDhjPJqIq7wJQUNTD
         ql/g==
X-Gm-Message-State: AOJu0Yx05DP/EeZIBcThGDf5KFj006NNEsIE8TOSXgNQZn5jtefZPvb3
        2VoKho3K3ZrdHtaNfLD7JkDk9Q==
X-Google-Smtp-Source: AGHT+IHhTwruxbWAJnFseDhN3IBL74tiH5GdBHD333uhU9mBS+pwEm+niM0SFeeTRHH3WUdznGqUtQ==
X-Received: by 2002:a5d:444c:0:b0:318:7bc:122e with SMTP id x12-20020a5d444c000000b0031807bc122emr3500282wrr.23.1694670233432;
        Wed, 13 Sep 2023 22:43:53 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id k8-20020a5d4288000000b00317a29af4b2sm709967wrq.68.2023.09.13.22.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 22:43:52 -0700 (PDT)
Message-ID: <c3ad0911-72eb-9054-a0b5-397ecdae3205@linaro.org>
Date:   Thu, 14 Sep 2023 07:43:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 2/4] dt-bindings: hwmon: Added new properties to the
 devicetree
Content-Language: en-US
To:     "Matyas, Daniel" <Daniel.Matyas@analog.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <20230913152135.457892-1-daniel.matyas@analog.com>
 <20230913152135.457892-3-daniel.matyas@analog.com>
 <177ef05b-0cca-be25-afad-ac518d9f6473@linaro.org>
 <PH0PR03MB67716A8AA5139C407BB0712989F0A@PH0PR03MB6771.namprd03.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <PH0PR03MB67716A8AA5139C407BB0712989F0A@PH0PR03MB6771.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 13/09/2023 17:48, Matyas, Daniel wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Wednesday, September 13, 2023 6:41 PM
>> To: Matyas, Daniel <Daniel.Matyas@analog.com>
>> Cc: Jean Delvare <jdelvare@suse.com>; Guenter Roeck <linux@roeck-
>> us.net>; Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
>> <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley
>> <conor+dt@kernel.org>; Jonathan Corbet <corbet@lwn.net>; linux-
>> hwmon@vger.kernel.org; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org; linux-doc@vger.kernel.org
>> Subject: Re: [PATCH 2/4] dt-bindings: hwmon: Added new properties to
>> the devicetree
>>
>> [External]
>>
>> On 13/09/2023 17:21, Daniel Matyas wrote:
>>
>> Subject: not much improved. I am sorry, but you are not adding new
>> properties to entire devicetree of entire world. You are actually not
>> adding anything to any devicetree, because these are bindings (which is
>> obvious, as said by prefix).
>>
>> You got comments on this.
>>
>>> These attributes are:
>>> 	- adi,comp-int - boolean property
>>> 	- adi,alrm-pol - can be 0, 1 (if not present, default value)
>>> 	- adi,flt-q - can be 1, 2, 4, 8 (if not present, default value)
>>> 	- adi,timeout-enable - boolean property
>>
>> Don't repeat what the code does. Explain why you are adding it, what is
>> the purpose.
>>
>>>
>>> These modify the corresponding bits in the configuration register.
>>>
>>> Signed-off-by: Daniel Matyas <daniel.matyas@analog.com>
>>> ---
>>>  .../bindings/hwmon/adi,max31827.yaml          | 35
>> +++++++++++++++++++
>>>  1 file changed, 35 insertions(+)
>>>
>>> diff --git
>> a/Documentation/devicetree/bindings/hwmon/adi,max31827.yaml
>>> b/Documentation/devicetree/bindings/hwmon/adi,max31827.yaml
>>> index 2dc8b07b4d3b..6bde71bdb8dd 100644
>>> --- a/Documentation/devicetree/bindings/hwmon/adi,max31827.yaml
>>> +++
>> b/Documentation/devicetree/bindings/hwmon/adi,max31827.yaml
>>> @@ -32,6 +32,37 @@ properties:
>>>        Must have values in the interval (1.6V; 3.6V) in order for the device
>> to
>>>        function correctly.
>>>
>>> +  adi,comp-int:
>>> +    description:
>>> +      If present interrupt mode is used. If not present comparator mode
>> is used
>>> +      (default).
>>
>> Why this is a property of hardware?
>>
>>> +    type: boolean
>>> +
>>> +  adi,alrm-pol:
>>> +    description:
>>> +      Sets the alarms active state.
>>> +            - 0 = active low
>>> +            - 1 = active high
>>> +      For max31827 and max31828 the default alarm polarity is low. For
>> max31829
>>> +      it is high.
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    enum: [0, 1]
>>> +
>>> +  adi,flt-q:
>>> +    description:
>>> +      Select how many consecutive temperature faults must occur
>> before
>>> +      overtemperature or undertemperature faults are indicated in the
>>> +      corresponding status bits.
>>> +      For max31827 default fault queue is 1. For max31828 and max31829
>> it is 4.
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    enum: [1, 2, 4, 8]
>>> +
>>> +  adi,timeout-enable:
>>> +    description:
>>> +      Enables timeout. Bus timeout resets the I2C-compatible interface
>> when SCL
>>> +      is low for more than 30ms (nominal).
>>
>> Why this is a property of hardware?

Code is okay, after Guenter's explanation. However please fix the
subject and improve the commit msg.

Best regards,
Krzysztof

