Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52795274FD0
	for <linux-hwmon@vger.kernel.org>; Sat,  2 May 2026 18:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777745436; cv=none; b=j5o/EdB8pV5JX1ilJzsDFE/phqJ6MIG+8I2Xe8VIUlVk/WNbWE3F6836wtJyau1RDK3QJJoEOE/1mR5hCH2EuPmUxe+lyY62aXfLU1ncqfQQhZDgNGVGmbwvFbGxDh/EjAnm7PKvTn0eC1LdU3TLeV9Y2CmYQz40se1nDUx7lyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777745436; c=relaxed/simple;
	bh=4ynpTmcO2/8Ndoe4alF94sDVfH+Ru9xIlfJxTG3uVq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LQ75hScrR4bWOygLJokvoKbnqG9Vja5PTe7FF0CDA8UTg3OdRquSQQkk+wGsU1/ew+JBILQYerQGaImt5ijd4eZIkOKNEo0TDQzUwqTm0gXX6ACbETYB6dLySY3qvbBCtMlJqCtz1aoIWyLYHgy4mwx/ZfcpunwCLQam5Xl87hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s/Wy2aBN; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s/Wy2aBN"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12c637089ccso5268686c88.1
        for <linux-hwmon@vger.kernel.org>; Sat, 02 May 2026 11:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777745434; x=1778350234; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=/niTl4cpNBtNuaUq+Ba8yg8H83ZwDA1TcLFQH9shT2c=;
        b=s/Wy2aBNZ6tgSwlELReUHdlC7LBSRmbp74OrIgSYa55sEFQaIp9aynBFYFJkiaUsJ7
         sVo2g38lTLUnjQUjONjXl3N0v5Q+voQH8zCCUjZ2gx9vN0FjceCYw9/OhCfwjYmtiw6D
         pPuwGyKxP6SZCoPZLVnNBDeEwEmxgRB93ktUzwAakFMUFhQQG8171mq71+DvMeqRcBFX
         njnwNlcsGw5jhLPvI/+gepkAhl5EzpkVJIsYY54GPTBguMPP249bdtOxqCUW37HdqZBb
         ip7d2zpI9+SCXcKNJIfvK9x+XlkLCot5t3Et6KckfZ5rgsTm9BqlDCpdjGYniTH4MO9A
         7OCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777745434; x=1778350234;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/niTl4cpNBtNuaUq+Ba8yg8H83ZwDA1TcLFQH9shT2c=;
        b=rSTNfpeyP+K2lWS7CW3aFIF+CUOH8WFY9fStuqgrjs+pZL/wqRLmyE5XKNUy14Y86W
         Pienh+FhbSMk73N1nf1uyM8RrXTUc4INI5tUZ6nVkZtbd2HjUTSNG7hD2mdLBywb8VBc
         Rbz1m2ZPGeFFQLpAeK+HXEXCbzcHGAyfoxBkggM2zhns0Ldw1pXNnKvkEwjuiNtwaysU
         mDRSakm/2aeyeiSDSJEAxA1c+9y/taaj3nUeNCqzHvC1EWu8qR2VIeChwuLnrb4rBMzg
         WxnL/NHfiLeLxqEEJZmMfSeuBn5XB/zu9eAWpB5VeBiYU6eGUftEbaJg7HQowhIyRjqz
         cAGA==
X-Gm-Message-State: AOJu0YwMmIt54rRfgdrcalV3Tb45DUq/9jMm6bLm50/nLQ2PYBvB/icB
	979uX1p9vor2iO+i4X7vMS/RLo5M8q3LFyJFCmLEc24chNH8IlxFBrtp
X-Gm-Gg: AeBDiev1IADy7EnmFZeGDS3VLcV4uj9qCXV0h7JNhd2TOlN0d3g0do563exL0sfVaC0
	F/SYga3VAYomSFE1cbnxEFk6G38Ri+mhNN7s0MR9+8OvMePMnIj3kaB1d10iw3mdUDz9HN6sKJ4
	ivf/4vpmnd44oSYiNeDx4yG24x05eIRs5y5vdmhVueoEsA/V3WK8t59Rd51z+KjHG2olyUBgvFK
	gIbX4qecHRWatm/EkajedEIXj46lqUjts7roIv8rW1oCw5lutrxgrbJvnDAxqHbmdaAChXgmQx9
	7+htswNRB5arq+5j3hZLuH3CfXESSyz/ODAzybJRH3v33Q9/f5vWLuSdIi7sQ+efy3QtQP0SCgq
	WnBcPOeF13OFlUyLko79feqN7GGmEUQsUsWxsJpxWiVeJJhJj3rMHvWaRWQln4mIHfGx50N5t49
	fGAd51eFMlxVpEYCYH827Ak8p1EGj8urhnxxlHfOhFIA1uVWseX/SKoLE5twojJcChU5WC+vaGC
	CN9uj5c8/xZMmeb+CzJww==
X-Received: by 2002:a05:7022:21a:b0:12d:c039:65d1 with SMTP id a92af1059eb24-12dfd7b7ee9mr2099869c88.1.1777745434332;
        Sat, 02 May 2026 11:10:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df8424ef1sm10584721c88.9.2026.05.02.11.10.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2026 11:10:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b5db06e6-1310-435a-b2a6-03cdc2096b36@roeck-us.net>
Date: Sat, 2 May 2026 11:10:31 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: AW: [PATCH 1/2] dt-bindings: hwmon: lm75: Add
 lm75,alert-polarity-active-high property
To: markus.stockhausen@gmx.de
Cc: linux-hwmon@vger.kernel.org
References: <20260501120518.3085501-2-markus.stockhausen@gmx.de>
 <20260501122419.8B1A3C2BCB4@smtp.kernel.org>
 <007701dcda5a$542a1c70$fc7e5550$@gmx.de>
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
In-Reply-To: <007701dcda5a$542a1c70$fc7e5550$@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/2/26 10:37, markus.stockhausen@gmx.de wrote:
>> Von: sashiko-bot@kernel.org <sashiko-bot@kernel.org>
>> Gesendet: Freitag, 1. Mai 2026 14:24
>> An: Markus Stockhausen <markus.stockhausen@gmx.de>
>> Cc: linux-hwmon@vger.kernel.org
>> Betreff: Re: [PATCH 1/2] dt-bindings: hwmon: lm75: Add lm75,alert-polarity-active-high property
>> ...
>>> +  lm75,alert-polarity-active-high:
>>
>> Does this property use an unregistered vendor prefix?
> 
> Coming back to this before resending the "real" series ...
> 
> Looking around I'm pretty sure that "alert-polarity-active-high" should be ok.
> But what prefix do you prefer for that property?
> 

Good question. Normally it would be the vendor prefix, but that is difficult
since the driver supports chips from many vendors. "lm75" as prefix is
definitely wrong. I would suggest to try "ti,alert-polarity-active-high"
since that is pre-existing and applies to some of the supported sensors
and see if DT maintainers accept it.

Thanks,
Guenter

