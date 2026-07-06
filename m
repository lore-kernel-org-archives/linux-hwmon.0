Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22533F4105
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Jul 2026 16:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783355616; cv=none; b=l4TtIkUSrxl1SNY7d9eToqu/0mFhRLsAhoe8XoTQzAEG4aK7ieITZ48eKl/KBTho61di14ahw0+rHTlW8ZWLsDinTYHrPwDReaRKuxL77la3m1V0uHoxxnXx+8NdAW0qQ36YwoygQImMJxMVVLLJK2577wJc39VkdbpmW+zR5+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783355616; c=relaxed/simple;
	bh=6NMmYy62ZFXZlbxjQZjcsrKWVKzo16auoFFByfnuD1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JxSG1fgHSee2BPr7af8Uo8LqYC8rUyVr7UlEE8UTYjGGfWVB+XCI67fTKH0gUifNI3pFtcamE5gWx2DqB2+quYCM9TOok9GBj3OnXPEcGzSpXdRLCVNWKVUDNh7R7QdXQnoS/YtVS5xlVqteYYQAFGV2wm5366OjAL2xXJFxpr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/nx5YcL; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/nx5YcL"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cca24023edso16254595ad.1
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Jul 2026 09:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783355614; x=1783960414; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=rxxY2BfHIcCLRUYump74eH/fMlKZQi/IR8VG2OQVFJ4=;
        b=X/nx5YcL4mtmhlQ/O2jbueNc0xl8UGKK6rlU7Z+w+MJtGVz/q/WVtFUW8qkV00LdVw
         mVNfImcOHK65jIqUp+kxUuX5lrP+S56fPA0nmnfM3iqcSYFQLJXuv3qY61aoqVgk1i5I
         nu1EMq5W5xXCIS6k/Dl+BNAwQU2GxI3+7pagGt8W3Mhs+5CNTQ/34Pf/VKIJLSKTWfqP
         z0zJXj4n3WwxzxQzjm7AdEsrMr+Fis/EYLgvHu1UVRSGhvubIBilQXBx13NPAdfaVAxI
         uida0+Ehu6w8WNSb0+P7BbX9ijWWpN+Ype/8Sqz1FLlmrJP8L6aaPE/EMkqUDieRL87A
         4/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783355614; x=1783960414;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rxxY2BfHIcCLRUYump74eH/fMlKZQi/IR8VG2OQVFJ4=;
        b=PSqf+2KztBrx24zzr0sjKImBfhsDQwmTQOt0wJCN1mCLywcY3FeH5dlQti0IompMjY
         ZtGemnMmJ12TYTMFrVDw9cvoymAwmhqRQVvZqIMpakfHm3+vpOPDCDniJfD0LINSHfPM
         Jtair9+YBUEXIXCPbbEusUfwrzRsWD2kpJRTB573AfK6NEzGAk4bniE073GJkMlM7dNZ
         W6H2W/QHyYAhmh0krry/sqQpBbK4PuSCMu6FLUIMuzdH6JZNSwVv5yGJcAKpPLci07nS
         FguQlTwgRLbgKU+u5xtK0LMrXwa5e9P/tVQv/wCA8amRTmcncZJs+I+vRjFGfxDMrGK+
         HVrw==
X-Forwarded-Encrypted: i=1; AHgh+RoQZgnxoy5yv87XTgSmm3mCxuAiI2LJjthsfCsUpffD+UxOc1SltMHvVJNCBYwyh6lwcEKGE+sf0jeFGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyW3kI1GtCOAC9qcNBCcZ87V46YDAe4DjDrceMp+9W7eCg3hk82
	rHxUSsdIc7OVpQiwaDVYy10+IMWeS24qRudeWeoLXrulbYZmV+MeX4XQ
X-Gm-Gg: AfdE7cllSeksZkUpIqDt7UJk9bk3X9EzskNI8en23rl1ZLdwvaN8tg/t3oBkgsfcd7h
	Uf2dajh3aI+HjG1XdOyGaII6fiyymipU4+ZSyxeLNNodmFSmwE8E8hh3JICtovmmoF5cB8xi3Zi
	NyEhbdV36sO1N0+QgErXf0ViohkU0VwR78i70VzuVo6Nos0srypx/0c7PXDsOxuU00lLRNHilvp
	2ERvfZB3TAjBCeYmdVK9yUxfHfyHvr7M6WCSYAZA8y8/5lGXxQ701lxqWTiibgvuzASO8EfYR8Z
	/CUsURn9e4JIYRNX2gvbKOOrZYaPjt/FPygrGnXjRbIcqsfiyE6exKJTKfv2aeqvPUSpfysmd69
	3G1Eu3zOTQ44xh+CHHcGVltQiWhMdVmqbYZMHNl4RBn6+DNTV3pqVka+K+ZhlRFCGTBkNOAM79Q
	PKDt5JmusCauHXFdgwRWV1EgfN9eaoR1Up3wOWWackg4HWhLLclmRR+y2iPlPlcO9mjUsn5WZg
X-Received: by 2002:a17:902:d2cf:b0:2cc:6329:b7ba with SMTP id d9443c01a7336-2ccbe615a2emr14691785ad.16.1783355614326;
        Mon, 06 Jul 2026 09:33:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25f87sm54027575ad.3.2026.07.06.09.33.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 09:33:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <65ebf21f-5a23-43b5-b10c-684fe421b0dc@roeck-us.net>
Date: Mon, 6 Jul 2026 09:33:32 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: hwmon: (pmbus/max20830): add
 enable-gpios property and complete examples
To: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <20260706-dev-max20830c-v2-0-37761e89bb5f@analog.com>
 <20260706-dev-max20830c-v2-1-37761e89bb5f@analog.com>
 <20260706-neat-perky-malamute-7518b7@quoll>
 <PH0PR03MB6351C4B212D2CCBA3F1BF113F1F12@PH0PR03MB6351.namprd03.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <PH0PR03MB6351C4B212D2CCBA3F1BF113F1F12@PH0PR03MB6351.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/6/26 00:13, Torreno, Alexis Czezar wrote:
> 
>> On Mon, Jul 06, 2026 at 10:08:41AM +0800, Alexis Czezar Torreno wrote:
>>> Adding an entry for the MAX20830 EN (enable) pin. This pin exist but
>>> was not included before. Also edited examples entry to be more complete.
>>>
>>> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
>>> ---
>>>   .../devicetree/bindings/hwmon/pmbus/adi,max20830.yaml         | 11
>> +++++++++++
>>>   1 file changed, 11 insertions(+)
>>>
>>
>> How did you address previous feedback?
>>
> 
> Regarding the enable pin, I added this since I know bindings like being complete
> and saw that I didn't add it the first time I submitted max20830.
> I added driver code for the gpio but learned that it wasn't really a use case so
> I simply dropped the patch for it.
> 

I guess I am completely missing the point here. I can not imagine a situation
where one would want to connect the enable pin to a driver-controlled GPIO pin,
or why would one connect the chip's PGOOD output pin to a GPIO input pin
and connect that back to the driver.

I think we will need guidance from devicetree maintainers explaining what
"complete" means in such a context to avoid having to repeat this discussion
for every driver going forward.

Thanks,
Guenter

