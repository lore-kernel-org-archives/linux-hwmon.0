Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3AF282F3A
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 14:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783694478; cv=none; b=F7/hmucTyl7kSLnGXIXbpM93BDGo8TXvfiI2oWvt2OUxMtksVdfJijR6G9VBS3BRgePI7U5qXPvfYEawRUJcbxeuU9asKseI6JNnSSC2IHhURwEy2Cr7BEmYDiRva51H5qSOElNojhXiV/NItd7sS8u+olXCowBU6/zkbKKmV50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783694478; c=relaxed/simple;
	bh=p8c/arKa90Z4dNGGxUlJWXFwV/KbP/DasoQgKhBPRSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xs810XHOPkDEBImpir6lBFqZkVUiDOlZzWuT7CAUexb7sE7rZMo3OyW7RbnWjcAloBlbpM3Kij8KkXJti5P3TgfucXQp8m/aiR+aF17iCwJ+02F/V1nTP47yKK0AtIkUluJkvpfKsc3yRNoNN5L3PxitCBybFN/FM/D9sBjP/oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SOQldiul; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SOQldiul"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-446f87b6de1so384996fac.3
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 07:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783694475; x=1784299275; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EQbC/idj+KWiHJ76OYqOrWBCaq0CRuQ9zf9be54q7bc=;
        b=SOQldiulT5ur/SWG83vEiROeqCGwbj9rXGJmZM+jnmoMZFJzTVkbp4nDRl7589R3LM
         /rGaItOL1ehxPhNPR3kXLliwC747SC2qRh2rrVyWpMpR1YY62KfcihSXhBP4c0MkGk5z
         8kXfq7C7XBYll1h0MQg2ke8PdyUnLt4B113GpNiTTy3hcFlc7XE0s3k1vbAWMhlJ3b0C
         28/DbAPhWQ59cdHHowoYs2GhsLBujKzxAAQDVFBawX/1qTGkNU3MUEI4djFmnUJJ5s4z
         RZRNnO7arAjcrlczvrUKMqoZCA0FiBndSDbcwW7ELp8rny0Jnd+6KmJTd0k6ujl1JGLI
         j+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783694475; x=1784299275;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EQbC/idj+KWiHJ76OYqOrWBCaq0CRuQ9zf9be54q7bc=;
        b=SOAJJyGD47vOdbjRTu92cDE4Wqh3iIM4cyS8jnRHVb/Qiy6Udn4XS6IoSCpDI3C6hT
         G57QIaQE4e1uOzWO0dGWfbGBFzcfYzaUI0yRlxRR6RlMNI0BSnv444FnjC/fwPkz7Jkv
         p9Q6bYj864V6WPjYZxCOAbcbOzFpuvu4byHMFmiizTetJIk3i2/SfRr/CNtB+ScoQJOk
         z0ymh65Gq9MhUjh/DNDjIommIgSFK2WKEH1ipeIFhRV5iiuX3dQ8Cs6uQvqsgKV3ZZ0F
         zVf3HAPt6ygG0+KUvAmU4yzGy4xmfRQfRtiJ8YV30DUPvtMdX460b1yU758iI7YAUHfO
         ZWeg==
X-Forwarded-Encrypted: i=1; AFNElJ/IrFJa3OTdOoz2USPVyBBXYy156xo4LpMAn7C5TPVWrMGVGZ9Auj+H5pe8an6y1ueFSaF7OJwecHteqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxK2GZyWibXpdrESIEHNGnCxaZ4WafiAH5N3TI5c1GNZElYfYjm
	5GfN97/ra7dgxi2mTyAF6xT9puweCHfYRFyVnUudgk/s+pzIIEaVhDNO
X-Gm-Gg: AfdE7cmL9GvJPpKvW5kOs1Ulzu3BulANlqyeDZmkYSbzpk8u+wsi/OF6Is0fWc/6V4u
	athmHjAD0U5mVco5VieP4PpQkPaBlyMh25OKhmEVtd6ElFAL75LQnmSnORUn2pS4X8dsF+V2r9m
	qjnYj2eCK3Tow1YRXr1w5NHQNgxheUIXgGmg74oj3lkUV43hkOTZD5P3L4oOZhfCS3NTdAFoOpr
	1RKZP1m5StLLKpGdc4X7SKx4Chasvtc1O4AowJSfWKxMOUNiOV1pAmPjoyf/PXBr6c4cmxDWdpn
	RmaHJnnsXHMXTsqDpZmFhJSb/6zN/1gIzBYftVZA9VHRkQCP5p1gFKZ4hBBU+jsQO8nD6pGzP61
	Uu9mAKeoAZroof5JhKQEv8CB8yFzQ7xLoQPbsBqVJsCu4YpVgb3Z5/JtnpBfHmImiAfaW46ZBA6
	pQ437gNZ/mVFZ27dFWwox612/71nze7Pi6IRUEtdEs3BBdU72AzLqYnyJ/Y7OdPA==
X-Received: by 2002:a05:6871:68b:b0:42f:d09d:1fc9 with SMTP id 586e51a60fabf-45163c73427mr7267499fac.32.1783694475320;
        Fri, 10 Jul 2026 07:41:15 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451c248101esm2164251fac.3.2026.07.10.07.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 07:41:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6c26aa82-2efe-4493-8992-b6d2c5889fe5@roeck-us.net>
Date: Fri, 10 Jul 2026 07:41:12 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: hwmon: (pmbus/max20830): add
 enable-gpios property and complete examples
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
 <65ebf21f-5a23-43b5-b10c-684fe421b0dc@roeck-us.net>
 <20260710-acrid-enchanted-prawn-5de949@quoll>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260710-acrid-enchanted-prawn-5de949@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/10/26 03:13, Krzysztof Kozlowski wrote:
> On Mon, Jul 06, 2026 at 09:33:32AM -0700, Guenter Roeck wrote:
>> On 7/6/26 00:13, Torreno, Alexis Czezar wrote:
>>>
>>>> On Mon, Jul 06, 2026 at 10:08:41AM +0800, Alexis Czezar Torreno wrote:
>>>>> Adding an entry for the MAX20830 EN (enable) pin. This pin exist but
>>>>> was not included before. Also edited examples entry to be more complete.
>>>>>
>>>>> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
>>>>> ---
>>>>>    .../devicetree/bindings/hwmon/pmbus/adi,max20830.yaml         | 11
>>>> +++++++++++
>>>>>    1 file changed, 11 insertions(+)
>>>>>
>>>>
>>>> How did you address previous feedback?
>>>>
>>>
>>> Regarding the enable pin, I added this since I know bindings like being complete
>>> and saw that I didn't add it the first time I submitted max20830.
>>> I added driver code for the gpio but learned that it wasn't really a use case so
>>> I simply dropped the patch for it.
>>>
>>
>> I guess I am completely missing the point here. I can not imagine a situation
>> where one would want to connect the enable pin to a driver-controlled GPIO pin,
>> or why would one connect the chip's PGOOD output pin to a GPIO input pin
>> and connect that back to the driver.
>>
>> I think we will need guidance from devicetree maintainers explaining what
>> "complete" means in such a context to avoid having to repeat this discussion
>> for every driver going forward.
> 
> I think complete means all reasonable hardware resources/properties,
> regardless whether current OS implementation uses them or not. That's
> why if there is enable-gpios which is not used by Linux but could be in
> the future, then it should be documented.
> 
> However if you claim that enable-gpios will absolutely NEVER be used by
> Linux or bootloader or any other DT bindings user (*BSD, Barebox, U-boot
> etc), then I would skip it, just like we do not describe many other
> parts which simply have no use for the software.
> 
> IOW, DTS is description of non-discoverable hardware for the software.
> We do not describe hardware for the sake of description, to mirror
> schematics. That's not the goal. The goal is to make some software
> happy, even if this is a future software implementation.
> 
> What is the case here - I rely on your guidance whether enable-gpios can
> EVER be used by software. If there is a chance, then IMO property could
> stay.
> 

Unfortunately, as it turns out, some of the chips handled by this driver
do _not_ implement software-override for the enable pin (or at least so I
am told; the chip datasheets are not public). Given that, we will have
to support the enable pin property.

Sorry, I was not aware of this detail.

Guenter

