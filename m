Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36EE7640C
	for <linux-hwmon@vger.kernel.org>; Thu,  8 Feb 2024 14:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707401961; cv=none; b=GIfYuZVLstLIhogqfWRkpL5+EH5AB4nqHH1GXScB4ZNqqMh3AxjLfF5ecWz93zELngpSwpqXw1R6kyucqjB8/mrMcefLzI/Cv70hiy0LABvpFt1m+Ehzf23MFepu+vWBefQ9Vi8rM2mGvkoSVbBg2oJaMmfKabeQ7LLIOzJsK1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707401961; c=relaxed/simple;
	bh=K2j0Eae2ptK6Yqn7/Fi+WlDc64nNiqEWYBqbGpNF48w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uRaxfVd9YISGw4vKQKUn7BWFDCiVxdJXYD5uo9HMp10ondXrVeDiAMjTX7gBz4qL5JbE5zfOFbyncTcNVt/H3xzoJnEHiafU9GiO/6UrT1r7jKoQxZ+DA8n1FQrD7RxVxsFE2GlPd1ZNwLH6qbGi0zl1XenwcbiwbAy++F1/m8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5bHwqOz; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A5bHwqOz"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5d8b887bb0cso1410060a12.2
        for <linux-hwmon@vger.kernel.org>; Thu, 08 Feb 2024 06:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707401959; x=1708006759; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=RjGA1GO6uzECI3HIYgkv4QEkEvVEPB1LYdE94BolCVs=;
        b=A5bHwqOzrjtPh4bSncNMu5QAyr5yX0/3fZuKFU4fZh+95KAJw07WqP18rDdaI+5St2
         N+F69yLgwBVbvtFXaxMzkUzcSk1AR7YL/+UDr9R8/Xq9M2+S5NYh0FP4zJh0HW3dE5ee
         +sNtH3LHUACS8NJOHFsxtVXsyZKYLgX/vIzbQreDuC1BlJvchm2ULwXftcDoQKhsItrL
         78l1OvWvEMf0TnhLszC7Kr/d1msiGyty/LcAICTyqeXXFK1kZd7SDVBUQsTzS5oNKM5a
         R9qmTQt/cJyAwpr07oluxM28WmwzkKDI0QjstkntUx9OZ4ndWJNiQH/yB8wUfPPtJChT
         Csdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707401959; x=1708006759;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RjGA1GO6uzECI3HIYgkv4QEkEvVEPB1LYdE94BolCVs=;
        b=BnlATmI4XLiAo7zsctCARB7FOUb6Ir3FaWENmsSzUs2vbvoJHa43yKyCc2Gr53f/4S
         kIKcwSznAzNZDzLm0aUnWtM5PjGfE5NfptC/zj3TS8h0hjCtFdeEwgoKc+QCVPm4qwEX
         Xj3A3ExIGk+f7DNX3gIwzeKwJZav5bsdyfW/3YmH9tB0T4BSJJTSD83KSIwcBaf9zWGz
         nJA28J4BHtSD/WWcRTL+PUO3SmAYVPUu1UhtzBwW06RD8qr5UkZ6aEW6TkLqvOX5THDE
         glAjEp18WDxenSw5pPwXLg5V9CL7hYzFm4MysOgcODg1P4+5Zgy/RkkteSOH9q8DeL6H
         eB7A==
X-Gm-Message-State: AOJu0YzuHXsAsW2fujtagLhmyy8W2qgzAxfBc3d7Ft0qd5KWTKIAIyxY
	9z1xcsu8ewZKc53cI34jZeCGIxSvioJIm6xgH5NPDDJqJ5aXSjAj
X-Google-Smtp-Source: AGHT+IEe1v+EAOEMTAeJWIlnplHsqGqgGj1PeCdbz5Nx6U9aDEz1eYWOZkWqxNGfx8n2FhjcmdQWJg==
X-Received: by 2002:a05:6a20:d39a:b0:19e:3006:5dc5 with SMTP id iq26-20020a056a20d39a00b0019e30065dc5mr10068246pzb.3.1707401958888;
        Thu, 08 Feb 2024 06:19:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXPFmR85qbVtPf90UuE2/nLp6s3fblmBQfeNZV5IIO54mpcGgSgR5RR9tTQ4iFVII1arzMEvwrWkoyDRjkg5FPL1Fd8i+bwwg9K+Jz40n+YYrKi6cR7a98ExzfRxQ==
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l4-20020a170902eb0400b001d8a5c08277sm3400967plb.260.2024.02.08.06.19.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Feb 2024 06:19:18 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4d4e37d8-3011-4d60-b805-adcdb31ae57f@roeck-us.net>
Date: Thu, 8 Feb 2024 06:19:17 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] hwmon: ltc4282: add support for the LTC4282 chip
Content-Language: en-US
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org
References: <b6fb236a-c3c1-4c5c-94bd-1f68b5aeac41@moroto.mountain>
 <53e0e2c7bb9cafb4efa3748ecf3ec765c262db83.camel@gmail.com>
 <c2c5b8b0-d3db-4212-8311-ee54119389c4@roeck-us.net>
 <9151c5df901325aed61e87019a5a1cffc46cf579.camel@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <9151c5df901325aed61e87019a5a1cffc46cf579.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/8/24 00:12, Nuno Sá wrote:
> On Wed, 2024-02-07 at 08:49 -0800, Guenter Roeck wrote:
>> On 2/7/24 02:19, Nuno Sá wrote:
>>> Hi Dan,
>>>
>>> On Wed, 2024-02-07 at 12:51 +0300, Dan Carpenter wrote:
>>>> Hello Nuno Sa,
>>>>
>>>> The patch 848a5019ded5: "hwmon: ltc4282: add support for the LTC4282
>>>> chip" from Jan 29, 2024 (linux-next), leads to the following Smatch
>>>> static checker warning:
>>>>
>>>> 	drivers/hwmon/ltc4282.c:732 ltc4282_write_voltage_byte_cached()
>>>> 	warn: no lower bound on 'val' rl='s64min-4294967294'
>>>>
>>>> drivers/hwmon/ltc4282.c
>>>>       723 static int ltc4282_write_voltage_byte_cached(const struct
>>>> ltc4282_state *st,
>>>>       724                                              u32 reg, u32 fs,
>>>> long
>>>> val,
>>>>       725                                              u32 *cache_raw)
>>>>       726 {
>>>>       727         u32 in;
>>>>       728
>>>>       729         if (val >= fs)
>>>>       730                 in = U8_MAX;
>>>>       731         else
>>>> --> 732                 in = DIV_ROUND_CLOSEST(val * U8_MAX, fs);
>>>
>>> Yeah, I guess we should likely clamp it between 0 and fs
>>>
>>
>> 	val = clamp_val(val, 0, fs);
>> 	in = DIV_ROUND_CLOSEST(val * U8_MAX, fs);
>>
>> maybe.
>>
>> Should I fix that inline or do you want to send a follow-up patch ?
>>
>> Guenter
>>
>>
> 
> Whatever makes your life easier... I can send a patch if that is your
> preference.
> 

I updated the original patch.

Thanks,
Guenter

