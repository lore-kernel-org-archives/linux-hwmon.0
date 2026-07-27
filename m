Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EECB38F934
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 15:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785165972; cv=none; b=SSNUfhKXmhFw2agpAmdEPA8sKqq0nPTxxkEbh0tIN/8UfvAjwFDjcXSOtmhocVHxHXrkXd0mVNqeB4LRqWXF87lVTwFFlz7hIkOwtP+m7C8in/q/bJX/STq+qswcVGIZTRH4wwCKT0y7KWYb0YgYKlGU1h3voogqrRhjuZW8NIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785165972; c=relaxed/simple;
	bh=jCX/t1yiKMFXFR/9W9FCANO4cwyalQDT1rIgMKro8pg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bU+WG8niKGYjLX6cozdXRYBTbpNQfS6PW9wipkoTGRaH/SjlqIGmXZr2c3be2tDs8eqob4IV+q/56fpDb4ot4j4f6Wz71APN5jdAxXmlzMfLWud4yWLEKflW0efrmTETO4LrBuCFkvcqXsJyMRNq+gZ8/puDgT8tgGRdXduMzq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ywu5svRP; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ywu5svRP"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cf52d15d88so28370405ad.2
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 08:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785165970; x=1785770770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MV+Z3ZWLjWlSqzF9OwMp08V406kpWl/9yom+vwodzic=;
        b=Ywu5svRPNRsof1smHdTeV6HK28GpZnH5OE9lsoVRJnnMQDAU2LT+2OOgLwG+M2Od/U
         1Z8J0Z1WDC8rJ0UwrvtO24jS/SrGoWOTeeGbLgIu/dxuNAlbY38VjPQqt1a1831A0Byz
         YjUhsxaqszJRj8h/BeZRfa23hfKEptSqYj1QHzq4IoQyGcIiICAAXD/R3o1ZUFRZtO9x
         X4ss84XwiG+jMLeuwDauGa4ox7vLGpLWrVLHRvAtfJ16VLU/n34ARpwtLv8kpxn2oC1H
         pI0WCdyEavl1wnVoFmmaVqVc9tXi1peTrN8ppkABbtyYUb8jWtjnHmqxhN4GC1o4rQQO
         NZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785165970; x=1785770770;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MV+Z3ZWLjWlSqzF9OwMp08V406kpWl/9yom+vwodzic=;
        b=G721qtHViL14rGHL6lwJJS7n+lsmNtxiV8O60fc0UycIe3N8V+t1GlmYumfGwu8GhI
         qJSVegt9G303iwcLd0ccJx/XbtakgmfLRmuVUTn/lPR/GJqyyCjSD1oIrjMo9SVEDITM
         tVmE0v4soYn0QL7WrC0AYAlmN2zEoXnoHpPvwTQ4SH0tjKL5HjxpqHUcXs1QNISZAN4A
         Q0Hk4/nSBYAA9a79anyqox5R1Db55EV9a+ki7O6BgKsZCwDydwTkYl23chaQttPEdO83
         Ws/Pz1Axl/zw3VeE1TouNyifjXySpTz9+TuLvMHGVr9vJcT9ul7XpP1Sf5CO1JQZyjXd
         L7BQ==
X-Forwarded-Encrypted: i=1; AHgh+RqXwmUPw+8P0A+P4uzFd3g59t/RvpwJikuseXCHsF92zdXsyow4oNH8rJquMs6lO2hYHySV6ft6RXBXUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YylU5S1ZEOH0TDQ9hPfzCfFNFqqHmnD3h06XUPayJy7K0h+6e4J
	jNUZFEmMpb+EBKu3JutErVpol+0AJ9NZAWCUkIEtJ3LnkEPCVRGQEDAQAk+Wfw==
X-Gm-Gg: AR+sD12OeH8P2yGtR3ICL5i3/4LplcsKVUElGSMtAfVxdicmY/oozRyS0yfBGqWwoOk
	sv1o/K0bkr7CYvCE3IRBtLfLFxVU8JOZadF9+M0cExbam+GE65aXF4C28ytrgqblyi+AF1zD7YI
	uLLyupbe5ewESM9cf8qsIx0zXGAZrHNEnbvZ7a+3/F3+4YE7fQ0+Zl82Dl2UwuZ5lRLqknlAMSO
	hSw7QMM2U4PzmrnBD1ynFn+XTstdW2Wq04nUru5spYk3J9emoBtAMDjjid3vNdAivPhykSWcevb
	Oxnz+H1J77EHM3auz7kwAkvHFVEeQjBH7syj7Mqsq6hDA8DjS0SIOtUJuCcbNXcJG9b3JcgOClt
	9Hut7nS7V4RpneL7ubGoJ6WpEhryqm2VUWgNRjMg7UqOV4kIdrLMFa+84bxWiC/IzE4mtN1wkir
	K8H+MZ3t22NeWM5I1m+Hy+KCZAvRW5DoTLzd0o3k1d6618HGcasrY=
X-Received: by 2002:a17:903:b90:b0:2ce:e747:c5d4 with SMTP id d9443c01a7336-2cfde885dd2mr80256105ad.46.1785165970563;
        Mon, 27 Jul 2026 08:26:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e3a55sm38046635ad.28.2026.07.27.08.26.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 08:26:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9ceefa73-fa96-4cb6-ba96-191364c9b8b1@roeck-us.net>
Date: Mon, 27 Jul 2026 08:26:08 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] hwmon: (emc1403) Convert to use OF bindings
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260721095935.439174-1-clamor95@gmail.com>
 <20260721095935.439174-3-clamor95@gmail.com> <amGz2YZogakb5XAv@monoceros>
 <CAPVz0n3WKw74zg0HmBBOo8Z7JV_pku-DjsgKF_74B8EdD5cXgA@mail.gmail.com>
 <1d7b6ff4-4ea6-41c4-b59c-25e14fdd8b53@roeck-us.net>
 <CAPVz0n1dwo13swmV8HCFfKEujT0HT5cktS_uqznK86eK3ZUGGg@mail.gmail.com>
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
In-Reply-To: <CAPVz0n1dwo13swmV8HCFfKEujT0HT5cktS_uqznK86eK3ZUGGg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/27/26 01:14, Svyatoslav Ryhel wrote:
> сб, 25 лип. 2026 р. о 17:23 Guenter Roeck <linux@roeck-us.net> пише:
>>
>> On 7/25/26 06:24, Svyatoslav Ryhel wrote:
>>> чт, 23 лип. 2026 р. о 09:28 Uwe Kleine-König
>>> <u.kleine-koenig@baylibre.com> пише:
>>>>
>>>> Hello,
>>>>
>>>> On Tue, Jul 21, 2026 at 12:59:34PM +0300, Svyatoslav Ryhel wrote:
>>>>> From: Jonas Schwöbel <jonasschwoebel@yahoo.de>
>>>>>
>>>>> Add OF match compatible table to be able to use this driver with Device
>>>>> Trees.
>>>>>
>>>>> Signed-off-by: Jonas Schwöbel <jonasschwoebel@yahoo.de>
>>>>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>>>>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>>>
>>>> Please put your S-o-b line last.
>>>>
>>>
>>> If S-o-b's should be chronological, then this order is correct.
>>> Guenter added his reviewed-by after I have added my signed-off-by.
>>>
>>
>> That refers to S-o-B, not to Reviewed-by: trailers.
>>
>> Do we really have to argue about something like this ?
> 
> I am not arguing, looking for answers.
> 
>> Do I have to mandate the order of non-SoB trailers for this subsystem ?
>>
> 
> That actually may be a decent idea. In you have this stated strictly
> for subsystem or have a consensus on kernel level then you can just
> point a link to a documentation. Might simplify your maintainer work
> ;)
> 

Up to now there used to be a common consensus, and it didn't seem necessary
to specifically mandate anything but the Signed-off-by: order. Unfortunately,
we live in a time where everyone deems it necessary to question everything.
That doesn't just include the order of trailers. I even get buggy patches
where the authors argue that "but this other driver has the same bug, so it
should be ok to introduce it here as well".

No, I am not going to explicitly mandate the order of trailers. If I'd do
that, people would just find something else to argue about. I'll keep doing
what I have always been doing: The more pointless arguments, the lower my
review priority.

Guenter

