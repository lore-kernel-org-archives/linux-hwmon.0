Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEFD4C956A
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Aug 2026 19:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786043707; cv=none; b=Wg3PYvvbb9K84Thhf1L07+KIKciwtS5d20NFg5q24QxYNZetRetDuBFZR7v/1v4EhQHPqN47SVKRRD73iz5ZN0rjgWX5qB+K23BmiMmZXzn43zZu2hgPrYhkPEJuide2tSs2Y7v4UV9O3p9kt0KgQ/MxsBNqWWA4CSe4TP316po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786043707; c=relaxed/simple;
	bh=533PHOLn335O4EA2B+kinGO2G4E4tpRwYZ/qB+8MrGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rVNY9eHQjpvO8x2OBkSo2Fm5t36Kbx7nXpIbluv5blbJR1SlJW8LEIUGDL4lnxJD6kGkl0nAS8rMSrcpFBsukY9yI1RubPEmkM0ekrBC/VW3crEtCxkQA2TUC+6stNEq647Kpp/4lDH7CI2oNh++H/Qi44TgZ+/EE9VNTV54Ic0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mh5UBzfa; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mh5UBzfa"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8486672f03cso3211504b3a.0
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Aug 2026 12:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786043702; x=1786648502; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sU3dRYYFiZApRIOVKW5KzGjLYxyQ5eHsT1TCj73gRnQ=;
        b=Mh5UBzfaD7z/5l32tZ5qL5v+22oP/8i6MqKQzHz5YBsOBPBvvqG1eVV6DX62IwwlJ0
         +MFYiMbygsq2qLdsKwNCs1ODIm81OIyvRDJPSTL/o11U/AwGFEK0+wJs62+GCdw5xFrr
         aLdqnVJjgZTYaFW8S34fIytjuf95VoxCNpB4ouY6EsM8ANtKHKeLNvIq47aJ/+WSyhkN
         DdiMj5KtdkgugiIpuZdfFnwxoPALLyFHj8RFacz1SmAf1xz2X04FzshkPTYX4HMMNkTd
         quV1jun1N6pjSCjGmXEGgvoBFqx1Kco7Uh1zImC8UKuU8OM9/hpvPZ9ER19ulMTN86fa
         HQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786043702; x=1786648502;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sU3dRYYFiZApRIOVKW5KzGjLYxyQ5eHsT1TCj73gRnQ=;
        b=AqsQ78iqyQ72vI+KMkzCMkFdjQFdEVWl/zgBwYTQVOb93RqapLika4GaBAzlJ18/iw
         00wOd5DGQokKvLLnp/cpm6lrXJPGsono50FN0FnjYm6iGdUP49NqFzg+qBMbCU19pdeA
         ukLK4OP6X4c3QTDcQB2lAkJxdCojpH6VGkZUJFo1vMgNgoy4QClXMPKWzhKLO7WecWHf
         Kvnnk5Ust/d5hpTP21qiIso0Zu6x3Xxbf/+w/7zMKKeG/1n2qNh8IM8fEFlT0xtWkchp
         /GzvUHcxk5Od8lCLWncxEOduoNT92G1ohp7rSt1yqizKJw2TpFFJh0QjO4GjIF8jnMwf
         rvgA==
X-Gm-Message-State: AOJu0YxZ1bXmAiTybLNLyDySsU9WffGl4X4+pIUFr+B1CKlD1Q8fuB5f
	yzD6nm5+PV7p30fzsdxp3vEePz1c/O4byqJWLzpT5mZtKfV1eHBfinovIeiv1Q==
X-Gm-Gg: AR+sD11t4Dy9ylekMlCpHJNf41d74qyCGqRLtp6RPetzN9SKmop+PsaL2rckInYi2Ob
	I6BG3C7w5aSTbdEyZNkVrOO2ewlHHdj4QNAoiFrC0wJcKiOHqkWw49J7KHQFccuCuTXa2QICFBG
	ERYNky/hQ6n/+8N5JHLcg93SrkasNG7wbl9QvJpA8vo73AW+nQPZkg7ph7S1SPc03GHm7nkpaBX
	ZyPJ5sQHx8T6CeKnOJgw/xDLguoDh/RpopmrsHDHD+cS2dfH4AAtqGPf0cExgiMQ5PzAN64175f
	823ILUksvHTx4OTlK34JEANJyF8+ar39peIu2PCx/ugX57j5gMj1MBt8hmLyT3rM2jiPwab+8Wx
	373xZCn5IQmJivZlJLRP0GetGjbvxZKJSdpiEiMlihe6ObSEX+DrNoLFVH81GaQ791NHvHpqFMT
	6UUkofRbxwXzXEQ3EPH2AD/FWdOgnMbp+LLJdIjwVaKPAZIH3fp/NX0Hv+jg8gD/sWwuLXTK4tH
	NuhCLb8usMyKs2Qup6385pjZHYdUfG62z8gPQ==
X-Received: by 2002:a05:6a00:c81:b0:845:cdc1:a803 with SMTP id d2e1a72fcca58-84f2dfc4763mr19157372b3a.11.1786043702350;
        Thu, 06 Aug 2026 12:15:02 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bca643sm1947290b3a.61.2026.08.06.12.15.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 12:15:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <722edf04-04d5-4ca6-b4c4-980f81742ae3@roeck-us.net>
Date: Thu, 6 Aug 2026 12:15:00 -0700
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
 <910065e6-8b47-4a40-9c4f-9dc4f41c1825@roeck-us.net>
 <20260806202818.5d919e3b@posteo.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260806202818.5d919e3b@posteo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/6/26 11:28, Wilken Gottwalt wrote:
> On Thu, 6 Aug 2026 11:04:50 -0700
> Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> On 8/6/26 09:42, Wilken Gottwalt wrote:
>>> On Thu, 6 Aug 2026 09:28:34 -0700
>>> Guenter Roeck <linux@roeck-us.net> wrote:
>>>
>>>> On 8/6/26 08:56, Wilken Gottwalt wrote:
>>>> ...
>>>>>>>> +	s64 result = mant * scale;
>>>>>>>
>>>>>>> Uhm, this is a 32bit multiplicaiton, actully a C gotcha I explain the beginners
>>>>>>> in our company. https://godbolt.org/z/eM6TbGG5E
>>>>>>>
>>>>>>
>>>>>> It is, but that is ok and intentional: both mant and exp are guaranteed to be
>>>>>> no larger than s16, meaning the result is never larger than s32 and will never
>>>>>> overflow.
>>>>>>
>>>>>>>> -	return (exp >= 0) ? (result << exp) : (result >> -exp);
>>>>>>>> +	if (exp >= 0)
>>>>>>>> +		result *= (int)(1UL << exp);
>>>>>>
>>>>>> This is the calculation that can overflow, making it necessary for result to be s64.
>>>>>
>>>>> Yeah, it was just funny to see in the wild. It made my day. :D
>>>>>
>>>>
>>>> Guess I lost you there. Do you want me to change it ? I could add a comment, or just
>>>> type cast mant to s64. Please let me know.
>>>
>>> No no, it is fine. I just was surprised to see that famous gotcha. But I guess
>>> some AIs may jump on it, ignoring the context. Changing it maybe would prevent
>>> noise in the future. It is like that famous mathematical "iff" term, which is
>>
>> FWIW, one could argue that it is often misused in the Linux kernel.
> 
> I actually don't know. I'm one of the people who considered it a typo. :D
> 
>>> used in some places of the kernel. A lot of non-native English speakers report
>>> that as a typo. Ahh... just ignore my gibberish.
>>>
>>
>> Actually, any reasonable AI should be able to find that this isn't a problem
>> given the constraints. Sashiko didn't flag it, and if it did I'd have submitted
>> a prompt update. Sashiko is explicitly directed to check for over- and underflows
>> in hwmon patches because it happens so often, so I am (reasonably ;-) sure that it
>> would flag it if there was a problem.
> 
> Yeah, a reasonable AI... So, I guess we will find out in the future.
> 
>> If you are ok with the patch, any chance for a Tested-by/Acked-by/Reviewed-by ?
> 
> Sorry, I did not test it yet, but I will tomorrow.
> 
> Hmm, I really wonder if something will actually change. I never encountered odd
> values. Well, except for the really obvious ones. Picking every value one by one
> results in every value being from a different sample. I think internally the MCU
> samples with about 1000 Hz. But getting that right would be some serious work.
> 

You probably won't see a difference. This is about the possibility of encountering
issues, after all, not about something that is actually seen (unless you can manage
to run the system in freezing temperatures ...). All we can do here is to ensure that
there is no subtle regression under normal operation.

In the I2C world I have test scripts which can simulate borderline conditions (such
as negative temperatures), but for USB that would require something more sophisticated
than the i2c-stub driver.

Guenter

