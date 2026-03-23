Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5329C3AD513
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Mar 2026 14:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276389; cv=none; b=i/KG0lb4FkDBQ6WBEn1fcRp+5NPrIHWqHoWvxKAPH50FeBqry50wVZsruh8UfScbdBTfZ+hoEHQB5BKCBjbivGA4LDJi7cINwHFnLNtbgRFX0ky9vUewxvit83M6PrqJCAkLR+TZyxXlxHN1nWYTauoej/0YSBfjhJItMG+/urw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276389; c=relaxed/simple;
	bh=FUWZG338Lvqw+ZHMyYOjy0LBZ3vZYoG/uj35Q/vhN94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YH90av/fmN+MiEs80CF+ZM9A6DCUKT67j/S6G3Q2syyBExScbemw3VMjcPh09ug6pOivuvGyI+cJOAa3Z/kKLuZ45M5WXonvqIBYeBRYzbiFg4foiQBU7KitCYev54MByiSmBsQbkbQsRApHYHdo6B/6334FrNmPlXO/BvUa0Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=amahc5fH; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="amahc5fH"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1279eced0b9so3908298c88.0
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Mar 2026 07:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774276387; x=1774881187; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=iNYejPjdBPqYLtoCLQEnNEXgxoTT0I9CZ1Nfe3G/xyM=;
        b=amahc5fHDmJqnb7n4fNt74zuTEtzDFexr1hIg5HPXWOSt5Mjb5YLEynkH++s8TsUOc
         VK678SjLda3kPMG7XflF4l4tayrbGrgOwxCiH9zab63CaTspNKguizmg8B4c9mG0/4pR
         QfK8thS+vA6IHv4lmWBcBsKDAcXHmHOa4OiCqcAQK+sTXCO+HgorMyK8Im88ZlL5kzO9
         W/CL89OVc3FFNpaWR6FmvJggbAjRJQrdxfegAp14olgL7KoV0Yu3qNjxAuro9hmdXNlS
         F8t+qE9HYrbrSdJKEABGERj9vcjseo6u/ak7ou9RsIZVW/spWGYGqgS2FU9B4c7a1eyo
         f6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774276387; x=1774881187;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iNYejPjdBPqYLtoCLQEnNEXgxoTT0I9CZ1Nfe3G/xyM=;
        b=tWLnb6gMYpP/onf57NUgYM2FTcR2HN3lAeycrpnwrkxcc25eaF5Xzkn0L2a+5T2alM
         s+hdCC7xq2jRrhZmM0FKusLZyqodG10FwQUC5oRpetzMs7un3KVl+n+oRAspvJSe4yfF
         KewPznrjQeUbDOO8j7rYibGaTI4ihe/ZXrYeYbOQSCvF6NFp03+zK2s3LgCxlbsJwicP
         /tdPHz4Vrto4gxP8xi0BXikNiROJeiudRskjadsfWIUBRPljRSGPH+Dwo+J/TARZodVl
         cGNQj9i3GcQZ/mgP1Bb2kvpzkIEUjEey99SJx+EsliBnRVwoCULyI/otRoloX/HMH8vD
         J0MA==
X-Forwarded-Encrypted: i=1; AJvYcCUICPDfuRtdSP84NzGXX5kEF0/OpMWTgRpWSq/14vKScyS5ZTRPpESvbCrxPybeFUzpL9WM3tP30hxMTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFS1B0HS88U8SR0Rrx6yUjqWC9qXs0dpn4KnVqzFkzPp6bk/ez
	pbkKP8xW/wKWr+YW1x16Ux1uNHkCLWdqPFn1eukXonFS+BbIVL2H9xJm
X-Gm-Gg: ATEYQzwWVjfrdii74SauzfP0vWFOstvJoDTQ1Fkqu5IP1xqrIYDBeeOEaZ6z38qWKjY
	fJMa4FSWSUKgAeht5emYH+lrub8ruksRa6dd5iOgMOtFfzg+CA4x0QPgtz/2I8m8B6CxIisssq2
	9OeTyKYM+EP84AuSKmg8gbEI5HVPz8kbQzIg16FucBWgQw6eB+n1RAYBYYb1J0mWtaawV/Tj6jZ
	dWr7BJw/0U/3bOcHCR1Q0KNC87IedhIzPYuRBzJdeC5R2pk34WRggeu67Cgq8UlZOGnMQ0TjO+b
	dNPWmSavV/MaduLKtuqRYwXkmqhVDbGcgnAc48hTyD+jCoZOpoPOYBxREbvdkiGp1TP51HcVHih
	lAS7tipL33dbIyH47fHre2Jnmqd6jcqHtEEpguwSlaR3m31WOCj7w1P5m+3Za/kMDtuKF3vy7sl
	k2WYqhy52o3E9lBxs8p6UtUbxPE9qMxbHiAub/8IdTlthdVPzbhB4Dz3W8jE/0zwWHrNHHiuKt
X-Received: by 2002:a05:7022:e29:b0:128:d20a:2f40 with SMTP id a92af1059eb24-12a7267d0c0mr5552465c88.8.1774276387345;
        Mon, 23 Mar 2026 07:33:07 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a7330d1c5sm8887677c88.0.2026.03.23.07.33.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 07:33:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <453dbd6c-c68d-4977-8418-a898008b0fe7@roeck-us.net>
Date: Mon, 23 Mar 2026 07:33:05 -0700
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
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <77cd7e879a10df791d9d5eb1f16f1654e9904199.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

[ ...]
>>> +  adi,pgio1-func:
>>> +    description: Configures the function of the PGIO1 pin.
>>> +    $ref: /schemas/types.yaml#/definitions/string
>>> +    enum: [inverted_power_good, power_good, gpio]
>>> +    default: inverted_power_good
>>> +
>>> +  adi,pgio2-func:
>>> +    description: Configures the function of the PGIO2 pin.
>>> +    $ref: /schemas/types.yaml#/definitions/string
>>> +    enum: [inverted_power_good, power_good, gpio, active_current_limiting]
>>> +    default: inverted_power_good
>>> +
>>> +  adi,pgio3-func:
>>> +    description: Configures the function of the PGIO3 pin.
>>> +    $ref: /schemas/types.yaml#/definitions/string
>>> +    enum: [inverted_power_good_input, power_good_input, gpio]
>>> +    default: inverted_power_good_input
>>> +
>>> +  adi,pgio4-func:
>>> +    description: Configures the function of the PGIO4 pin.
>>> +    $ref: /schemas/types.yaml#/definitions/string
>>> +    enum: [inverted_external_fault, external_fault, gpio]
>>> +    default: inverted_external_fault
>>> +
>>> +  adi,gpio-on-adio1:
>>> +    description: If set, the ADIO1 pin is used as a GPIO.
>>> +    type: boolean
>>> +
>>> +  adi,gpio-on-adio2:
>>> +    description: If set, the ADIO2 pin is used as a GPIO.
>>> +    type: boolean
>>> +
>>> +  adi,gpio-on-adio3:
>>> +    description: If set, the ADIO3 pin is used as a GPIO.
>>> +    type: boolean
>>> +
>>> +  adi,gpio-on-adio4:
>>> +    description: If set, the ADIO4 pin is used as a GPIO.
>>> +    type: boolean
>>
>> Does this dependency block force a redundant specification of adi,pgio4-func?
>> The default for adi,pgio4-func is inverted_external_fault, which means the
>> default hardware state already supports external fault features.
>> If a device tree legitimately omits adi,pgio4-func to rely on that default,
>> will it fail schema validation here since the dependencies keyword strictly
>> checks for the literal presence of properties without injecting defaults?
> 
> Fair point. I guess it will fail but the alternative is to not have any constrain at all so
> maybe worth it to be explicit in here?
> 

I don't claim to understand how to define devicetree properties, but

adi,pgio4-func = <"gpio">

and

adi,gpio-on-adio4;

seem to be equivalent to me, and omitting the first property (because
it defaults to inverted_external_fault) would cause the second to fail.
So either both would be necessary or none. If that is correct, what is
the point of having the adi,gpio-on-adio4 property in the first place ?

In other words, what is the difference between
	adi,pgio4-func = <"gpio">;
	adi,gpio-on-adio4;

and
	adi,pgio4-func = <"gpio">;
(with no boolean property) ?

Thanks,
Guenter

