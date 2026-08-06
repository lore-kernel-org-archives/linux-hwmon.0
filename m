Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D373D377AAF
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Aug 2026 18:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786039495; cv=none; b=sO1YkQV/vE/HuRb8avyTNiqkTwTmsQ5GVlDz3VASRVQYTfqEwJ7hen5/5Hr9vzDACp98JKLjZ5myvf5M7rF2XitM0a+6UVwD6v1KREmB825CSRCT67gogU3Q+bOqL/bo3mS5XcEluAjOAQZr5kUqtzyjZEBPqSL9y3Wsztkcdgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786039495; c=relaxed/simple;
	bh=UhW3pa4NzJ3feQNyuMfbnNBLa8NvyGWIQvrXEbCR2bo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ELhJ9oqFzmG9uJAf7J2HHHRA33c+TiE96g7SkAXwHkKf2qXvdnKwbREPsf7OB6DNRSi4BhxEeKqz0Ix1fHlIjc6Smf24AuQdL5qsMqrzINNOqnCMsVEIuKASB1YS9aQLltvH+b/GH7ghsMcpv2RyI/nmBJguO5thEvAqUwj2h3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OmqePFB8; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OmqePFB8"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c9ef3e1337fso1892422a12.2
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Aug 2026 11:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786039493; x=1786644293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fOZ78BeuEe7FmzqjRXmjPpoyZSBFB91KO2t9G3S5g3M=;
        b=OmqePFB8ruDoGWX4/xBRupdLW3gN+3uZXkso0xPEzs2LOcd5PMBUq/G/EVbqrDYYwi
         ML3is3RmmaOQt/QGPF7mTvEr62rx4qzW/QCGytHYUZAtSnzDcLu5k/QTrADjokXEAWdZ
         9VneV58zFdtfX6Dual/V8saIbEXtoNkmPjTY0572+pgEg+n7vrfy0MDpfi9sCUF+oOH9
         MQP0WIuxf3tkDgI3AUXIvZCb9E9Vd9inFNIAlfZ/vJ2E/4qSVDNlvJAWUxpOv7L1Iroh
         e1Zp/XNMGj4mHEy72mi4NoYoYjprtOzX4tN2AMtEn6TVkv6aeh/yEASRNsqdAJuz6Xnj
         ATSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786039493; x=1786644293;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fOZ78BeuEe7FmzqjRXmjPpoyZSBFB91KO2t9G3S5g3M=;
        b=IIrTInLu2QRQMaOcSkj8pVjTTMvbrWEOMCEdPuTTzvP3nZNJJCQtvFp5rPZBqqhP1H
         dDviREMbVVP3q6GimEia1JGS2jqPVl8iYssvn1pSL8MrORpzwFD2GOGVq7t81ul2zs1D
         AdFTAYiHo9npnaVxL33f5i2vSGlUzvePMwmr4f3XyK58HBMxN1YfSB30Urd8VMjlCYFx
         2wKkLF1uY4kHhxE3jpsPvFQsQapsRByYJ+pqjr2Bs9Qnw+uKejZI4BJtE3jNPziZaOni
         XFqyjZRhk7KlnSBke/a98sNJrZ7hIu8WefvFSpuqB56ZqSAtE9UHplOOkJe5EVylM9yx
         OwEA==
X-Gm-Message-State: AOJu0Yy4TBrQM1kNN07TbKZ8kPljYJrfZ8dDci5PhfdZaRghEnOQVacR
	jAmDC+onyxO/swMa3RNszKwL34eCCWiCvV56A37eYw7hOMfcVdjZfDSN5D1aVA==
X-Gm-Gg: AR+sD13f+Neqw+WeJYbW3VKJfOcFBkNbQmYTWoYjJiPfBM4xNWYh8TRdgjFKfhX5gnc
	ZD50ZxMxvEd70MFqT4chj7yLMexsZJG8nw5IKavFEX+Mi80oNoLN+xrMIATnhMxLH1hO5m8PDBr
	2EquJ9yIDPwAm3sx7OPafWHJvstIWHVQEuxnYZk28yOa+0TWeH9+sDIVVO8OfDil9dPIfXEnbvI
	FZfo683aFoQ8q0T/uq3uM3fhWdXP//foaWdSaQGVPVi4KDF/+9EGP56uk3tOjmv3Zu/dWMzgE5z
	7UHuTlEl1k+4LFPGCDbzRqOyu8q5dKSWOs3CsVnn2c2Vh4Tb6a7nxmb+Im6gogrlA3cmtQ62Q8u
	wvl3zIJWXv4OdXNekPjeibbtg5VTWHNGL8U5Ue6XU7/cgxK7yHF/bNr/zXG+ka4RAmA3L9VGrgV
	7LhNTUR1GH9RlfmN/RHx5UZUtz+CqaRR+JkwL0ncPEZMdL/pBh1hINu26Z2fP/CiUGU24EyQBQC
	NmyzrPgTxMs03Y85Gsmu9R7mty1oZvJ3Y3whw==
X-Received: by 2002:a05:6a20:6a03:b0:3c3:9993:d5c3 with SMTP id adf61e73a8af0-3cb85de7fb6mr19157206637.9.1786039492950;
        Thu, 06 Aug 2026 11:04:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867a68fdsm53416094eec.25.2026.08.06.11.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 11:04:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <910065e6-8b47-4a40-9c4f-9dc4f41c1825@roeck-us.net>
Date: Thu, 6 Aug 2026 11:04:50 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: (corsair-psu) Fix linear11 calculation
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>,
 Sashiko <sashiko-bot@kernel.org>
References: <20260804034811.2385506-1-linux@roeck-us.net>
 <20260806173411.6be71067@posteo.net>
 <deb3db39-e8da-40d2-af9e-bdaf73b9bf3c@roeck-us.net>
 <20260806175645.5e50b70c@posteo.net>
 <f4077f39-0427-4bb9-8b6c-ddba3f492765@roeck-us.net>
 <20260806184233.44124904@posteo.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260806184233.44124904@posteo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/6/26 09:42, Wilken Gottwalt wrote:
> On Thu, 6 Aug 2026 09:28:34 -0700
> Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> On 8/6/26 08:56, Wilken Gottwalt wrote:
>> ...
>>>>>> +	s64 result = mant * scale;
>>>>>
>>>>> Uhm, this is a 32bit multiplicaiton, actully a C gotcha I explain the beginners
>>>>> in our company. https://godbolt.org/z/eM6TbGG5E
>>>>>
>>>>
>>>> It is, but that is ok and intentional: both mant and exp are guaranteed to be
>>>> no larger than s16, meaning the result is never larger than s32 and will never
>>>> overflow.
>>>>
>>>>>> -	return (exp >= 0) ? (result << exp) : (result >> -exp);
>>>>>> +	if (exp >= 0)
>>>>>> +		result *= (int)(1UL << exp);
>>>>
>>>> This is the calculation that can overflow, making it necessary for result to be s64.
>>>
>>> Yeah, it was just funny to see in the wild. It made my day. :D
>>>
>>
>> Guess I lost you there. Do you want me to change it ? I could add a comment, or just
>> type cast mant to s64. Please let me know.
> 
> No no, it is fine. I just was surprised to see that famous gotcha. But I guess
> some AIs may jump on it, ignoring the context. Changing it maybe would prevent
> noise in the future. It is like that famous mathematical "iff" term, which is

FWIW, one could argue that it is often misused in the Linux kernel.

> used in some places of the kernel. A lot of non-native English speakers report
> that as a typo. Ahh... just ignore my gibberish.
> 

Actually, any reasonable AI should be able to find that this isn't a problem
given the constraints. Sashiko didn't flag it, and if it did I'd have submitted
a prompt update. Sashiko is explicitly directed to check for over- and underflows
in hwmon patches because it happens so often, so I am (reasonably ;-) sure that it
would flag it if there was a problem.

If you are ok with the patch, any chance for a Tested-by/Acked-by/Reviewed-by ?

Thanks,
Guenter

