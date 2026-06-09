Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359DA407CDC
	for <linux-hwmon@vger.kernel.org>; Tue,  9 Jun 2026 12:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781009764; cv=none; b=rMJoLEHZp7VOWALwxjcBry1BhUO8r5GIdHwU95nFHP0wuirFaPFOvsC5c8uiYi0iLo5Qd/tlySjkLicGCCRIK3dSWxbnWVNMxv9BG5cRuKkzzuWJdANrRze61/CfPx0Sj5YpDfhFQaRO+mDQ/bqxFCMPL9glUOPitDO4HQ1jkiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781009764; c=relaxed/simple;
	bh=jxFHhMrA7cT4OQhAjjGP+coknNZz/PyhxcDuiGcOgRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ipbLYfkzo9gBAZDPCo9voyN/60s1kmTMkM6iDaqOBU/38zyDMv/AoiXH1ZDcIYhK+2UATMopVK/I0F4ap+SfEM/lQtnsdaEojRuRo03YB8HJsnQuQAxQLYQgpvY2uJL9p+/eqsB5uAyzeWRf34TMycmLAkvRr7g30+EPLqm6/U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rcr6FKei; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rcr6FKei"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-842848fd613so4503636b3a.3
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Jun 2026 05:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781009763; x=1781614563; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=OPsd5p+bgGWj9idOjFXHdxR+Xw6jiD+Pwhu8ahFJY28=;
        b=rcr6FKei2JQZQgqSMmJSCiIjo/H8JAjjZJdU6S7nAEnYAuLpkZMVbt/Ix2RlU44Xvw
         uBp07V5TYoHJhfMDLBHO7QOoxRG/MPfYZIkdGOzS8eziVcgJoqim0s/NXK+tmiOuz96N
         1ZvQpFHHBJzsdXzkEn0Pp4EfHJCg/woVZV+q7MEkdMIiU4ayM8N0kz7UNFnAmn8LvbFd
         ZQbUSXAFdVw8GD3uNk5G+5W2Nws83VomolrGUfmqTvO3Mh/h8l0mChiBucWHJNPLg9EH
         wNZoDvNLyHHI0zZkqKZ5/SZ2aAX6krPSX1IaSRfKQmf09V1zqbL3xFg5IaRo43VZXBYc
         yCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781009763; x=1781614563;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OPsd5p+bgGWj9idOjFXHdxR+Xw6jiD+Pwhu8ahFJY28=;
        b=Smq5b15L2Ker0Q4E8STQKGZZA63UaEr6IcPHhKnKJNmEJNqnWwiHlBJkqUaKq6Zfrl
         yM06l7pHnQGr6XfQDBDOCqQoJSZE5C679B/GS/nR4jfRg7jAMW1MBdmLr1O5Qvcahpiq
         RFGdpf+zps5frzsQmVQfkWSlu4c7BNJPkmXQq549wz5bxzhvP/P6MC2sjhWMl1M154b2
         gJS9jBvXaFvFiBhNCkn8ha3TL6EA4HSI5QbipfVVNhZ1EpEQlNhI9XDJPZs+BVc+jHP0
         a3V1SnnsmIRBhH7SCarIv19ucuUcf6hJxL/Ni9vBri1CgvGaFpE+uAdk/ZWV7BCnLhPp
         0fdg==
X-Gm-Message-State: AOJu0YxXqGDDchLbHQqWsIhVdKVS5A5SLmplR6JCrtWANwThkQZI8Rxu
	tnHc9myfzyvnrbHF59A6u1Rto6T9lLAYBOm9D/S0bI62zEVRZEay4V9D
X-Gm-Gg: Acq92OGEW5cgDQYpiH7ijfcghZ+c2OLPuOHfNfUZibCY3Q4aqK802ypy/0bsYLY7h+u
	29auZy6P5knlXaN8OXEJimCW3GxPR2T4l0GC2mWJxILq50pVEQL4a7EazBWa8VOuB8MGcLES9Aj
	FdXavOMYy8hO7kYIV4gj9bKHBP+TAtv19miXf8UIHSZhhYIYSGK7E3yTvkWxV+4ME0aeJGPQJrA
	NquQk1xMsDPJZyD/eBeWjWryy0SNiH30WoDf4jvVkA2IdtvFAv+YjTLlAogf2ks1f38sYOJ8xgV
	l5F/RbeMJdSn4r6+J9LpY/8AkNzNhSylnq2gBKBYIh1Pr1gEfvQivxUPmy5Zy7Up9qzrmlnnMsD
	AeBAbQRGviBoXjsXZbXkZnyOfpHqRDL4YC0N9PI8iIG/weC5NHXbUeV3CI75aajOel89VzGaw9V
	0TP9MsxrPsTDupiWxGwOP+RcNQ8+g17MVYGMhKq51o6Y1qS7XdfI76d1QuV3WFCgnK7w7cCUl4T
	VWvBEnQ8uM=
X-Received: by 2002:a05:6a00:3e1e:b0:82d:556b:7a01 with SMTP id d2e1a72fcca58-8430a6731a4mr3004260b3a.16.1781009762535;
        Tue, 09 Jun 2026 05:56:02 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282379db0sm20259163b3a.24.2026.06.09.05.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 05:56:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <35577504-76cf-4dd3-8f98-5fde03fc0a1f@roeck-us.net>
Date: Tue, 9 Jun 2026 05:56:00 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: add a driver for the temp/voltage sensor on
 PolarFire SoC
To: Conor Dooley <conor@kernel.org>
Cc: linux-hwmon@vger.kernel.org, Lars Randers <lranders@mail.dk>,
 Conor Dooley <conor.dooley@microchip.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Daire McNamara <daire.mcnamara@microchip.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Valentina.FernandezAlanis@microchip.com
References: <20260603-ongoing-brunette-51e35be6d93e@spud>
 <fd92d7c9-9594-47b9-bd84-a6bd5ebae66d@roeck-us.net>
 <20260609-estrogen-entangled-da00ac932481@spud>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260609-estrogen-entangled-da00ac932481@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/9/26 02:43, Conor Dooley wrote:
> On Mon, Jun 08, 2026 at 10:03:48AM -0700, Guenter Roeck wrote:
>> On 6/3/26 06:19, Conor Dooley wrote:
>>> From: Lars Randers <lranders@mail.dk>
>>>
>>> Add a driver for the temperature and voltage sensors on PolarFire SoC.
>>> The temperature reports how hot the die is, and the voltages are the
>>> SoC's 1.05, 1.8 and 2.5 volt rails respectively.
>>>
>>> The hardware supports alarms in theory, but there is an erratum that
>>> prevents clearing them once triggered, so no support is added for them.
>>>
>>> The hardware measures voltage with 16 bits, of which 1 is a sign bit and
>>> the remainder holds the voltage as a fixed point integer value. It's
>>> improbable that the hardware will work if the voltages are negative, so
>>> the driver ignores the sign bits.
>>>
>>> There's no dt support etc here because this is the child of a simple-mfd
>>> syscon.
>>>
>>> Signed-off-by: Lars Randers <lranders@mail.dk>
>>> Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>
>> Comments inline.
> 
> Cheers.
> 
...
>>
>> If regmap never returns errors this needs to be documented in the driver.
> 
> It's an mmio regmap via a syscon, it evaluates to readl()/writel() so
> there's nothing that can fail /and/ return an error.
> I mean, I can add if (ret) return ret, there's not a clean place to put
> a comment about it I don't think.
> 

No, there is no need to add dummy error checks.  Just add a comment
either at the top of the driver or maybe even better where the regmap
is initialized and explain the above.

Guenter

