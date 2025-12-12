Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED96D2E9EC9
	for <linux-hwmon@vger.kernel.org>; Fri, 12 Dec 2025 17:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765560668; cv=none; b=OMgQ9sj6NAyMXAB+V0ONZGnsiDK5e4m9CYSDLjizpDqOqoeOsg/e2ovCI4U1dOakH/xtgM+SAOKCI4t4Yv6vxqrUZC1s2YORlwCEwFDfiIm1IvgHMj/qOSi3FrTXcfYWAHEJDpZ+kgUvWhF4evdSQeL/SuBEEVFmcQZWWyp/qpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765560668; c=relaxed/simple;
	bh=hKit+/0T5gZExjaMYxLiuooY89XVDrrPzVdV8YJ8W1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IhCUABgnH8RgkMeIcWfDIiuvMgUOgOpUaZLC7iPGUQBSt8GkYkJzSnD/NxoHmwwbgvZ0v9/yFbMjc/QSDiyUE/TVcf69Mg0vBt1dRKBsy2e5L+KJGznBsyGG0cJ0gLG5KNSG1PMBELoeuKYaF7VASMFGxPSrrDAKQ+5jVLMff8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SKVU0PHs; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SKVU0PHs"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-297dd95ffe4so14412195ad.3
        for <linux-hwmon@vger.kernel.org>; Fri, 12 Dec 2025 09:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765560666; x=1766165466; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=bfaOhU/eGTckWkAOHZE/zAxVwRnQrMOfr2k/Ftj96Z0=;
        b=SKVU0PHsQfADOcqUgiulb5BATbOYkeBXrRs5Od7o4t7JJf53cZ4flhkasg/5qIVlSX
         +3CR29yLMQNmsRKJ8VpdIeI9ZBfjVl7W/4xbRnyy4gogIUEJfSLa5dxcUJGkiK4YNTZP
         /O/RUIL8tuMYQfb5Wkstp0bZddUo9wGAcMQ7ZIxZ98Xx6t3OzUEydBZ6bPL6LvW9fvq/
         R4MhxZ/ZxNL3J7hxNw3F5O5X9aZY5viBcA6ySqOkVdvVIq03fR1pL2jIOhTWXT/MI1CG
         KNRCtF5dbFzoz6ipO8D8w4Fq0DTqLRDhDRLlwlZP/vn0laEB1I8DQyBfyIaPu1KUKg5h
         u3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765560666; x=1766165466;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bfaOhU/eGTckWkAOHZE/zAxVwRnQrMOfr2k/Ftj96Z0=;
        b=EbONHSH//tSSxBytjI9iqL5fbRIONvT+QC1MeBJS87cdKze4bJyt1PZbOI47V3rOAJ
         s7EVwhrcg9fs/bgB/Sb7JSsGXpzAMN/ZTWi8a+DsXsXtlN/SCTEDHCxzX9gBTJKtoi2t
         E4USMQ9Ldv6MWSOoXxwad4xE0PJwIQlAgxMonN58r9SoZzxyMdbGV7Pk7b0tXdBx2V/c
         NQOfdUaIgmqq6N9uIi0ln+7H/LYSgk6ufvLU3LmvofpwJYLQTVBeKqGSOM0gQLwIxk1Z
         hA4OgxGs7QqXwD0v3/KXLR4KIrhOu+TZrNZff9lkNnN7jiQ1E1GNFMLBhtk8N/yFJP/N
         caGg==
X-Forwarded-Encrypted: i=1; AJvYcCUmwpNDovfSexEXHqNBO0WLfvIzOQOk2MuUhhwiAKn37Dyx4EJ0WeSr8H+nTs/uZMaoNLwKEAGlKR9Bnw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg2mjEGRmSPiicK1otn63kXwx+821KYFceqXQRWn95iiB5/fxR
	wW9/38aPAtq82n1S8/N1S39WUkI0Q4mIJHCAZr2x+SJ9zEQSgYV5CsB4
X-Gm-Gg: AY/fxX6y4EJWbt2qkkR2OhRHQERKVIW92LqV0/rYx7NL7M2Kl92PnRoyjkonlnq5KgA
	Z0V9eYSFdJ9oVcWZsLVv9jWF5MNzn0CpOR/bEgHH3Rm14JMaV8Ogj5iF8nFNDDiKace7xspDjlM
	FAm2Oo9+mwMImqDuYFSOFuwXXzIpi0cj9dC084Hxoig699hepssS1sNuSiFAWE133zYXqeAyeyq
	j3ZAw1q3HfpKx3OhVi/TI1HQvnb1ElSFKiLUZRvqxnlZA6jaYYe+PCAaTdaaJytqjJyPU1PljGm
	Nq0oOKd8rhk6IK2JQbdHGSbU1ldFOmuulDIR9EeBgcC3uySTrexCNO1sYhv+jsOi6KSqO7ZYnNt
	rpttREIZnCruAPYTTJBkTXWMHQOEop6ubiiVr9GiPpLslWHccOwkyGQWYG8VFrt8cfsEIvf/CvO
	nKQ/pLYCXAb3tOzbosChaNlkqOdrJb/hcMKwgmGgYhAkM4/JJP4KWJRJ8+DqE=
X-Google-Smtp-Source: AGHT+IERii8VwTDBGjEktZiFxNixZNxDB5hsG1gFWNwNX2BO2DNqBUBrmdpc4/vBEItTmIHvzZXz7w==
X-Received: by 2002:a17:902:ef02:b0:2a0:8f6f:1a0d with SMTP id d9443c01a7336-2a08f6f1cf3mr256605ad.61.1765560666113;
        Fri, 12 Dec 2025 09:31:06 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea040382sm59851035ad.77.2025.12.12.09.31.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Dec 2025 09:31:05 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d1765251-7787-4224-b8ad-ad16faf55181@roeck-us.net>
Date: Fri, 12 Dec 2025 09:31:04 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>, nuno.sa@analog.com,
 linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
References: <20251204-ltc4283-support-v4-0-db0197fd7984@analog.com>
 <20251204-ltc4283-support-v4-2-db0197fd7984@analog.com>
 <144d50f7-398c-4b10-bd21-a6d0c6c7b4c8@roeck-us.net>
 <67209860ae2ff5626b7eaa50f2dd4b496eaa06d3.camel@gmail.com>
 <ee7b7dcf-7756-4ffc-8a2c-e2cf33aac725@roeck-us.net>
 <f530e0c818048bb3ce5c3505a35c1ef99acdf9f1.camel@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <f530e0c818048bb3ce5c3505a35c1ef99acdf9f1.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/12/25 08:55, Nuno Sá wrote:
> On Fri, 2025-12-12 at 08:46 -0800, Guenter Roeck wrote:
>> On 12/12/25 08:34, Nuno Sá wrote:
>>> On Sat, 2025-12-06 at 10:40 -0800, Guenter Roeck wrote:
>>>> On 12/4/25 08:15, Nuno Sá via B4 Relay wrote:
>>>>> From: Nuno Sá <nuno.sa@analog.com>
>>>>>
>>>>> Support the LTC4283 How Swap Controller. The device features programmable
>>>>> current limit with foldback and independently adjustable inrush current to
>>>>> optimize the MOSFET safe operating area (SOA). The SOA timer limits MOSFET
>>>>> temperature rise for reliable protection against overstresses.
>>>>>
>>>>> An I2C interface and onboard ADC allow monitoring of board current,
>>>>> voltage, power, energy, and fault status.
>>>>>
>>>>> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
>>>>
>>>> I finally found the time to write module test code for the driver.
>>>>
>>>
>>> Thanks!
>>>
>>>> Some early feedback:
>>>>
>>>> - The driver must work with non-devicetree systems and without device
>>>>      property support. Select defaults where necessary.
>>>
>>> I'll double check that... But one thing that already comes to mind is rsense? Rsense
>>
>> Yes.
>>
>>> is the main design choice for a thing like this. Not sure we can decide on a meaningful
>>> default for it? I believe we have the same situation for ltc4282.c
>>>
>>
>> Agreed, but that doesn't make it better (and I don't have a unit test for that chip).
>> Default would be your call. I usually go for 1 mOhm.
>>
>> If you have access to it, can you send me a register dump for LTC4282 ?
> 
> I'm doing home office these days and I'm not sure I brought that chip with me. If I have
> it, I'll do it!
> 

No problem. I'd order an evaluation board, but that costs more than $200 which is a bit
too high for my liking ;-).

Thanks,
Guenter

