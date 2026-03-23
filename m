Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC823B0ACB
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Mar 2026 15:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774279632; cv=none; b=i529lX5KPNcZobpDZAXksDrlg8EJoQzoGDZ7eD9ffx11gtYlZdtjuJkvwCmZqOp4GuV0M4KYv3F4wSFJQAp63MILBjatHcy9zj3wmnkbx0/Xd7n8r9C07kih0N+h0Ky59PnTpTHH9ncJYdAgHNd69A+0orwIZtXFB5DByfABmEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774279632; c=relaxed/simple;
	bh=aotX8Y0OB5iUl6M5+m/EYZdBeHI3Be7C4ZhRAvf6Wn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vq//gRGbV0laA8ant16dkas6raDB0DldLjGe/W/xhKo8jMVGDksrvVWMJJbWlYzYgL7bsLS70sZtWchR4w1KIvQdn9OXaHN0j5TT4G2HvdQU8rY5bKgVXjGnLbWWxkgR1MRkzSE0JyrrCVgbIzKTjiWTit3Lydkgvfy7Wb0IGJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYFliupL; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYFliupL"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2addb31945aso31806005ad.1
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Mar 2026 08:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774279630; x=1774884430; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=5NoeMR8U45GnsnIDfTDvWItVyG2eNxjWxI4CR2iFJ84=;
        b=hYFliupL2C7IcQtJXPKn2iiEOMB9U8lMdLQU3F5EdmNDZWLPGGmB1XYASiqMvMMHIp
         kbyeo8tmR7FjbAfybUEeNaxe/wN8Hw5rhlHgEQzaL8BdbGB2FUr/jPNJr391sM9nCKCC
         2ltg9ZQ5PqjZJ8/Y0SLuvNlOO5s93RTodP7nTsjthZz9QwICXOXJsNysw1r3l5lPWwZl
         zrx/ct444591Xtmdiqq1l86y0rqJii5DYvjgHzjbBEuEdI6JbPaoN6GgbvJGM4YoZl5H
         NJGPz9WNK66ATEphMjzdfgmC6UA9zUinB4Fn7u86H85mQ9e+wV1XiP/aZ5SU5qCuRw9U
         HELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774279630; x=1774884430;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5NoeMR8U45GnsnIDfTDvWItVyG2eNxjWxI4CR2iFJ84=;
        b=EBkGB3l6qdErDHNCNWOKFtc9l2r3BWjkYcWnfRQp4QsedFqVJKs0oNw+xu+JMgLS9n
         pDU3yXeo4So/+BSBkSB7cHF3rk/UaGl4pUmH4YMx4JYkzvlJZlEnpesPa9+SqndEhy0V
         IEazukAbnqg8cQ1WFVTHJfLvpRWUfQ3p3Eg2DtPNaHakheoe/cvCqkZLytOa9S2jhbmi
         kgaYcTai8kY48n3fclDp7qQfKmqxf3Msci2F6pOXGaO22ArNoDMqayLbwpWdZWI53lqY
         d6i8ib4VxGmh3MHLlmR6u48tBie+0dmGwmOHllBT4uXNrZJrwoB8YmmYdzeKFKDuZp98
         9y0Q==
X-Forwarded-Encrypted: i=1; AJvYcCW97+BmDP2TGEhjqrQC8fOFCgSRYGFi2KMoBRlCytEtNfz/a0py6iG5KkKBFoWTK2ThZHHjo4ZpAnX7HA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxODIGOvEuW/k+qkEQ5K78quHbys8OvVgBY3B4K4TFcoGibEQS8
	KpC9g9OjwIAeeAXWzmTYWObV6Y4ZCxD6VedIbBiSj5wlVrDNVO2MTjLl
X-Gm-Gg: ATEYQzwn7smHDnOUbyKMjKndjkqK0shKesK9deO5aqAytBGuJ+8LGZRczF8h/6VHiN3
	UK/ctmDUFR33qsGJ4i4IQ/Sra08yE9TRIEebwxGwN/fbQGsBQxifmvBGcRCk4lEi8QmiR9LIp/k
	WTNc/+K7DcsknNv5o5E2dY6J2JdMevTy3+DeAJV0KykXMlw4Qs31fF1wYVo9UR0VxIqZ7fuDTyZ
	jesHhLNrhEs/8LEO44EoXJ+e9NLLX3QZt7L0mBUGPB1VQXIzape/9+swtGcGzF0vAk1ErAyG/ay
	mn/u1a2s+T9+KszW0b/+aQTMT5qRAfBWykWcZij7UivWiscKLZRjh/G1BcAGSiIIHYXD+/2rNGH
	yXv8IfDTtA0fBLS14dV52S6Ytla8VN7zQhIEsql/7b7h9sMwcMjU4uGkUBWJf0ZNrdm6nJokxl9
	ZH6bPYQ6Ey1R5fiULSxYmUBJhuF2jrE86x9L9M7KeANDJxjZxpisZ7mPt/JPgotbKiKf41CWy3
X-Received: by 2002:a17:903:2449:b0:2b0:686a:d470 with SMTP id d9443c01a7336-2b082724c4fmr136696995ad.23.1774279630185;
        Mon, 23 Mar 2026 08:27:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083549cc7sm118306985ad.29.2026.03.23.08.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 08:27:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <821aafb4-d1a8-4611-addc-5bff4f1e187e@roeck-us.net>
Date: Mon, 23 Mar 2026 08:27:08 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] dt-bindings: hwmon: Document the LTC4283 Swap
 Controller
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>, nuno.sa@analog.com
Cc: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>
References: <20260314-ltc4283-support-v7-0-1cda48e93802@analog.com>
 <20260314-ltc4283-support-v7-1-1cda48e93802@analog.com>
 <c395fad0-ca24-448a-a77f-ddac1cd9f809@roeck-us.net>
 <77cd7e879a10df791d9d5eb1f16f1654e9904199.camel@gmail.com>
 <453dbd6c-c68d-4977-8418-a898008b0fe7@roeck-us.net>
 <63baaa6ea6ce7a8534046fea3d9f14fdb26f87a3.camel@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <63baaa6ea6ce7a8534046fea3d9f14fdb26f87a3.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/23/26 08:17, Nuno Sá wrote:
> On Mon, 2026-03-23 at 07:33 -0700, Guenter Roeck wrote:
>> [ ...]
>>>>> +  adi,pgio1-func:
>>>>> +    description: Configures the function of the PGIO1 pin.
>>>>> +    $ref: /schemas/types.yaml#/definitions/string
>>>>> +    enum: [inverted_power_good, power_good, gpio]
>>>>> +    default: inverted_power_good
>>>>> +
>>>>> +  adi,pgio2-func:
>>>>> +    description: Configures the function of the PGIO2 pin.
>>>>> +    $ref: /schemas/types.yaml#/definitions/string
>>>>> +    enum: [inverted_power_good, power_good, gpio, active_current_limiting]
>>>>> +    default: inverted_power_good
>>>>> +
>>>>> +  adi,pgio3-func:
>>>>> +    description: Configures the function of the PGIO3 pin.
>>>>> +    $ref: /schemas/types.yaml#/definitions/string
>>>>> +    enum: [inverted_power_good_input, power_good_input, gpio]
>>>>> +    default: inverted_power_good_input
>>>>> +
>>>>> +  adi,pgio4-func:
>>>>> +    description: Configures the function of the PGIO4 pin.
>>>>> +    $ref: /schemas/types.yaml#/definitions/string
>>>>> +    enum: [inverted_external_fault, external_fault, gpio]
>>>>> +    default: inverted_external_fault
>>>>> +
>>>>> +  adi,gpio-on-adio1:
>>>>> +    description: If set, the ADIO1 pin is used as a GPIO.
>>>>> +    type: boolean
>>>>> +
>>>>> +  adi,gpio-on-adio2:
>>>>> +    description: If set, the ADIO2 pin is used as a GPIO.
>>>>> +    type: boolean
>>>>> +
>>>>> +  adi,gpio-on-adio3:
>>>>> +    description: If set, the ADIO3 pin is used as a GPIO.
>>>>> +    type: boolean
>>>>> +
>>>>> +  adi,gpio-on-adio4:
>>>>> +    description: If set, the ADIO4 pin is used as a GPIO.
>>>>> +    type: boolean
>>>>
>>>> Does this dependency block force a redundant specification of adi,pgio4-func?
>>>> The default for adi,pgio4-func is inverted_external_fault, which means the
>>>> default hardware state already supports external fault features.
>>>> If a device tree legitimately omits adi,pgio4-func to rely on that default,
>>>> will it fail schema validation here since the dependencies keyword strictly
>>>> checks for the literal presence of properties without injecting defaults?
>>>
>>> Fair point. I guess it will fail but the alternative is to not have any constrain at all so
>>> maybe worth it to be explicit in here?
>>>
>>
>> I don't claim to understand how to define devicetree properties, but
>>
>> adi,pgio4-func = <"gpio">
>>
>> and
>>
>> adi,gpio-on-adio4;
>>
>> seem to be equivalent to me, and omitting the first property (because
> 
> Not exactly. ADIO4 and PGIO4 are different pins and can be both configured
> as GPIOs. ADIO is a boolean because they are either monitored by the ADC (default)
> or configured as GPIOs. PGIOs can have additional configurations and hence the
> enum.
> 

Ah, I didn't realize the small "A" vs. "G" difference (and apparently
I don't understand what the AI is complaining about ;-). Sorry for the noise.

Guenter

