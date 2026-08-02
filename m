Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC783AE191
	for <linux-hwmon@vger.kernel.org>; Sun,  2 Aug 2026 14:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785681186; cv=none; b=jWp2y4YElGa8sLBSxK/cnfOEc3T0YdwWgHJYuR85zjXHzmrDqqtgMQl/2iFm5WXOHPdR2tjhYE8WgCPJnquqsJ0obvXqIIFlolzU6z8ZlnPrNUDGPD6t9S/XATopvVbFYU99Ws4DVJmoeA857wsZC0YpMiDRcm8zZb2AaM58ubc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785681186; c=relaxed/simple;
	bh=nN+rWgmPbo9Vf9AnRm/dRiZfUzPdThaavIJLG/s+Y58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VRDo9as7zKOne9SWGb6DXqseUbbDzcclrvmbZkXMr1FdiUtJ4QL1t8THXlBY7h55Im+PUsgaSlNx1wX8etKYGxIEtkQk+EhXy9kapLOcLj2NWGdudKYOWcAL1DJ6zazHBlUJ+7192j3tmbl3EQBwPJ+jYkNN5DJTrZgWl9uWMdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+v1PeXH; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+v1PeXH"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38759bcd877so2208074a91.2
        for <linux-hwmon@vger.kernel.org>; Sun, 02 Aug 2026 07:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785681184; x=1786285984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=41DGoZbXWYu1hxi3hs8Z8YcsIWCVDtDMnLMoUzZjqZc=;
        b=b+v1PeXHNe4M7yLk2NJ8arJ8yDlk/I9nOKFDF9BAYIj30O788fVJbh4svUC6VBI+6/
         Z/XK64qK0eoyXwHKLxyHR9AM7lrArQLNlzfPNwOZUFhy3oVNRa/ekaAyNE9ZBDBiO5pj
         W5avciBjbiW/8XD4YAR8xbNCT4eRcR5Su7Aq6u7byrr1U9ER/Uy1ukGw3ZLAOguJHZRa
         V6K7US7CknDCc5h/5vL57KbKZXAxIXoULkDZ5AcSEDNDqdmlAw3E4EShIKVyenWNjdzU
         hIHpu02v9cL3+9O/81MnKaMGFRVhVH4OsOjPVMaPG5izaPMH3osvqOl6E1e/ICtgX6uB
         6eZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785681184; x=1786285984;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=41DGoZbXWYu1hxi3hs8Z8YcsIWCVDtDMnLMoUzZjqZc=;
        b=aESezC2svr9UTZI50HdMeynw0rfXh/HgLCQDjSVOVklzwOKLS6CDa3/VUivATr13/L
         D/Xrl8qeMKyOQMA48oml1ZO+zG9KGXcm5nCQWMFJabQ3JR41zJo1uj2Ol/peooKg4PT2
         +gTfkD3HN+Kb17azOjrfY0Vx5DgdcLHpZ4sucNekswTW3zPBMWzvipwfuHBnV+HMeXDA
         T93ubZK9VrOKybVQHE6gphN6rxukW7Cop1TB8ctzIcQRlCv2QdVvMtr/AMMqcvHIsQs/
         q2VpBx8PFgVtLthMzNWUmrUpW/xnY4jybYR4BaunMfTn6GJF0xGXYDmLRX8Mn1gqlmxg
         qLvQ==
X-Gm-Message-State: AOJu0Yzccz37ia+09tAgCLn9Y8dUo3mGhaBLU28dcuwerqrC8Ha2YDJ8
	JOk7WiE20nin+JY31a0htQLxFJHbHkXr8A7gR8l+8MzH/NutbVx4Y9t2
X-Gm-Gg: AR+sD13LF2Lfhl5Fqgd8xE89oeH76fn+gOFD6Fhteg+rZZhI2leeQfJd/icQJRCVrpj
	ekcGna05hIYtJF0eqi1g17VCuSc3cA7gtbiXpaw9heR5OEOK6zn2D25sORTaQapm9kwi9HiB554
	0lUQ6LsIfNvvl+RGEyiF7sMruarM8PGlqm5dl0mQbzJK3wIouZ7tpWus2OQTC53TniBiMuW/Qni
	LW3E0MQvZHGufpaLpeQy4EqZwEqQbHgL6rOhdFL70w1EvtGx4y/xd180awyjbVdCV6F8eQsKxcw
	5lWWOWFWHYbYmEOUcGZvxqJUmEFvUBKZiH77Q5rcqNed/zFUuvDt6ALxc7IiqjpgB8CeUvtJxj/
	xDLdUtR6KmcbONa+sIvBQ4zO59ttIwHYQ79bkT5VEp/nkdaCTWQsEv5H5tulSEjkGaowHGU8wq2
	PtegfDSsv9vtF94/G4YyUwyfjrihnsygBl47dPBgFkrk34a/6ldR/bqMYxkPR7tS9sodxQJqqUQ
	/2a6G1JJTKj5gyYuX9F9x3xxUyLiK9MO+xNSQ==
X-Received: by 2002:a17:90b:580d:b0:38f:c911:5436 with SMTP id 98e67ed59e1d1-38fc911545fmr3940101a91.41.1785681184250;
        Sun, 02 Aug 2026 07:33:04 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2ce5ca2sm1566389a91.4.2026.08.02.07.33.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 07:33:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0ba65a90-b2b5-4d2e-b35f-5f2a6c914fad@roeck-us.net>
Date: Sun, 2 Aug 2026 07:33:01 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH] hwmon: (pmbus) Fix type confusion in notification
 logic
To: Vincent Jardin <vjardin@free.fr>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20260723211336.3046042-1-linux@roeck-us.net>
 <am9RrapJinQ-eKDF@L30177.local>
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
In-Reply-To: <am9RrapJinQ-eKDF@L30177.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/2/26 07:18, Vincent Jardin wrote:
> Hi Guenter,
> 
>> However, data->group.attrs can contain other types like struct
>> pmbus_samples_reg or struct pmbus_sensor, which only embed a base
>> struct device_attribute.
>>
>> If da is a struct pmbus_samples_reg, dev_attr is the last member. Casting
>> it to struct sensor_device_attribute and reading the index field appears
>> to access memory past the end of the allocation, which might trigger a
>> slab-out-of-bounds read.
>>
>> Additionally, if da is a struct pmbus_sensor, casting it causes the index
>> field to overlap with the page, phase, and reg fields. Could this produce
>> a garbage mask on little-endian systems that spuriously matches the target
>> reg, page, and flags during an alert?
>>
>> Fix the problem by using struct sensor_device_attr in struct pmbus_sensor
>> and struct pmbus_label. Since those attributes never trigger a
>> notification, set the value of attr->index to -1 for them. Use this value
>> to distinguish from boolean attributes which _can_ trigger a notification
>> and use the index field to encode mask, page, and register values.
>>
>> Fixes: f469bde9afd1 ("hwmon: (pmbus/core) Notify hwmon events")
>> Cc: Vincent Jardin <vjardin@free.fr>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>> RFT: Build-tested only
> 
> I tested on my board today but I did cherry pick the the 5 commits from:
>    https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/log/?h=hwmon-next
> 	hwmon: (pmbus) Fix type confusion in notification logic <-- this RFT
> 	hwmon: (pmbus/mpq8646) Gate the writes
> 	hwmon: (pmbus) Add MPQ8646 driver
> 	dt-bindings: hwmon: pmbus: add MPS MPQ8646
> 	hwmon: (pmbus/core) export pmbus_check_and_notify_faults()
> 
> Beside testing it with the attributes and boolean alarms of the MPQ8646, I did
> test it with the board's PSU that is another PMBUus device and exposes some attributes
> and boolean alarms too.
> 
> Both were OK.
> 
> Tested-by: Vincent Jardin <vjardin@free.fr>
> 
Thanks a lot!

Guenter

