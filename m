Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0FC3D47C1
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 12:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778933655; cv=none; b=jF/NgnfA9WIiEJhHz7s9SA7hGy5EcRffWT5ZAIzUd8ghOzabmEAdl4J/mR9qNgPYwlqEpT04/1CpEsInUBvDzVl9EV683cl9odION4I3BoyXzpe+cGFDKXL/7KoMNsIRkior7AkL3BK7vvMnpklsEcKX/qXJ+VdCU+EPFxGWqQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778933655; c=relaxed/simple;
	bh=NXstNpsh57964jU5eVuSN4GcLNqI+VymMcfVvCPW3uE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sx27s0xt7O1oFtK+Uzi+5lQ1T2MIf1s5wDE6SGMOuoUF+02fLFh0cT8L4sxIk0E7GUA4NjyERHJIh+xlOmN2vpEm07Id8rpWc3db0KRp/f3J/fj4qLW09+wpKAVnXC1lBwLdrLbpo5Q6XiSKPznsu5MaO/wmsiCNMdJrcI6qay8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bqxgAJtC; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bqxgAJtC"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12c1a170a50so770480c88.0
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 05:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778933653; x=1779538453; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=WfRu3W9UXERmyIjiKGpcfMwX45w5ccCYkQKnR4ynbas=;
        b=bqxgAJtCf6Y3RCCyoby+0//QYS+KBNBHauMtiig3GsYrhJHeonSIIu+HUmpoRJKEmh
         3O+8NQ/KbzSQ0qMzuyGJJILP6yXXHIF7JGxWFLrXvIvZG6I2AgOeVsIJ3/Qpt1yoHKfH
         4Kn0sVGucwReDotRBYTbc1eBlqHqkmKf0llzwuU4GkbjfZtCNnfVoAqR7BNDmY1C2iHx
         gkHa4ZRABVQowgcWbV9HWCeyesKED+Uz3Yg8YBkZcKiEkVRyF92pTVkhpKgFcMOJjFej
         1LjKCE8nTVkjy2yiyiE8v48lXAC+xEfGjA8qOFpG2yQmPCSUqhPvPuq/XsvqQgNyeDwA
         yGtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778933653; x=1779538453;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WfRu3W9UXERmyIjiKGpcfMwX45w5ccCYkQKnR4ynbas=;
        b=GcdFukkM7ZfvfSU0gOjDy+DtS/FSqwz5VoSUm83lIe7IVE1w/oPJzWMBNBagI+hqol
         eklbDTwX7vkLqm6xsxsea+W6IvONclqNsBQk/pGgBhP1CncvrgAzgsq4iKwXjWdgvL1N
         8Li22c06hNNvBsYt8G4xiSNk3QlzH1xzUFhlGjeVi1SNEN9GDhmMvYXlzJh/FvR3QCnV
         Eoc3fl2xX1BBqaVkfi24ZRhnXWVa86Q3f1IL3JxehAIkY/sxITIojpm15WwZH4y/lJWf
         dP/pBKUBYLkQ/Gb1TJ2wGiBaodMotf46Y72HQScHRAls53p6N3jVJaBXUfUl82loIzEZ
         WxZQ==
X-Gm-Message-State: AOJu0YyRIQsVuTaQuOFSQ9hE44+8HC2331KIn84xqj8B5P2qs+O3O3Xs
	5wZE1g2udTyiShaBOvZ6MV2s09c360A2GAb/Upmi2M8XSIxEgRhkOEpwaLFY32zI
X-Gm-Gg: Acq92OH7qAZNIJQRwvAHXB+KQjDk/XkxRWM+zVYCL7aJVRjMv+OHWgv59nS4rgV+Pf0
	zH1NEJzWFqXE04wWLaPEl7oxZgFDCXDdc3zZ0NIZL1aYJIaSXFI+3aeaw8/A4s54qXEmtSgnf6/
	1pEjhPKRXsmG4BE995sY0dKvlwYJYGmBib77ye9mUX4T7NiM/ZFwzeqA7VUP2JpIUsZU2OOOlQe
	n1TeikNZvlIl3cfbwl2Zxws1GxWMTHVd29CqQy4i135Zan0qCMroeq0Fqf0sOs4lruqGhO/X+ts
	f/lB/DqkVfNb2aYPYHTixCD4Z0Hc3Mb/3xNs/HxKSP3LxcdpLw7Jsd7mt4y4con7qsqaUqH2Z6T
	0QfOXuBcfvVN2tWxlOCbqfjv/g5Amwp1YFp1DtSCfww6z66URv234HMuWEnNrf9WDBSwSkmQFfW
	lqp4cyJkv/AMCjEhcLEOAK+jUEZAcfa9zc/+786jvtyvGmesnuRxjX0B6/duiALLXxA1kGzoQH4
	xtUhS/zuOI=
X-Received: by 2002:a05:7022:128c:b0:12c:6e85:505c with SMTP id a92af1059eb24-1350440a9cbmr3283254c88.4.1778933653130;
        Sat, 16 May 2026 05:14:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc3490bcsm11753600c88.15.2026.05.16.05.14.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 05:14:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <94f708bc-f78a-41bc-974a-b54604fae1e1@roeck-us.net>
Date: Sat, 16 May 2026 05:14:11 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (lm75) Add explicit header include
To: Krzysztof Kozlowski <krzk@kernel.org>, sashiko-reviews@lists.linux.dev,
 Flaviu Nistor <flaviu.nistor@gmail.com>,
 Roman Gushchin <roman.gushchin@linux.dev>
Cc: linux-hwmon@vger.kernel.org
References: <20260516075708.6682-1-flaviu.nistor@gmail.com>
 <20260516080647.4C31AC19425@smtp.kernel.org>
 <3f20b310-fd59-46d7-ad1f-201c755b690a@kernel.org>
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
In-Reply-To: <3f20b310-fd59-46d7-ad1f-201c755b690a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/16/26 01:14, Krzysztof Kozlowski wrote:
> On 16/05/2026 10:06, sashiko-bot@kernel.org wrote:
>>> Since device_property_read_string() is used in the
>>> probe function add explicit include for
>>> linux/mod_devicetable.h and linux/property.h rather
>>> than having implicit inclusions.
>>> Header linux/of.h can be removed and also of_match_ptr()
>>> improving non-Device Tree compatibility of the driver.
>>>
>>> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
>>
>> Reviewed-by: Sashiko <sashiko-bot@kernel.org>
>>
> 
> NAK, fake tag.
> 

Until and unless there is an official policy that explicitly states
that AI agents MUST NOT provide Reviewed-by: tags, I will ignore your
NAKs on patches submitted in my scope of responsibility. Please point
to the policy, not to your opinion about review feedback from AI agents.

Thanks,
Guenter

