Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A0A3E8C78
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 15:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773935577; cv=none; b=PDxaS/flPJriH3cYra/Ayn/LEuotbjNr2KIO0ROxDk4AUqx2OdlkCpax5/C4C+/GSw8F5NRSCv2yRX1Qmm4QcslkqaFfhfKkbYkl925zrmkJMtvigRYKkkXOauE3b5kw7tMwRHRbwd3C/q2km9jiGHxvrRdt6nrh3YLjdcvDeLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773935577; c=relaxed/simple;
	bh=IT/s5VKLjYTCg7i0Xr82AeLxC1hHDWELGucUDsq959s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S6KQTBniOiOJ0AR0F8SLKxwfXZyZckM4wdttZsxTjS/eYW4PMSL6Dbq/a9n1Cy5p8P+b3zzOMi4KYEC8x9hihUQ6DtI1wrPUVLq9KfmdWiDhnSO1NbsYC2TOGy5Sb6zJhIFGcSPnCjliejlWewfDDVZtl8QnFeTLR+2dqiNby38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DybeF4Uw; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DybeF4Uw"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b04fc8851cso10201695ad.0
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 08:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773935575; x=1774540375; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=i9z69/Cx6EsWFci3JfA2BtA2ZBRfiZMB8gO4oaevv4o=;
        b=DybeF4UwGSrO0MhrFIxZSnbHk0iMF4w2gz0AfQTgIneNr8fUuGpedPzW0YJDkIfGg/
         tF+br0uHlIZTMqYXQmfx9IHXeOX6bkG9/LFnqiofW9SLoTKLNmLCQeM1LmreE1y06pjg
         NnI/veREaEcI+JZw2Jk9pUnZmXCJi+36ORoq+/D6HGxFhu/M9E4Xxh9yl8HuK6E8TNCT
         76xXg3KbpM5/XglpsXYthZXcVulEmIArgtYydZpsiau8nWeW1XC+nmY95BDp6rF6iBTA
         h4vtiEbqjjyTXRFP6l+spFLYEeP6wK90OBu1tz3vry3n/QiVTahlAErQstTuaTWVqJXO
         WEog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773935575; x=1774540375;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i9z69/Cx6EsWFci3JfA2BtA2ZBRfiZMB8gO4oaevv4o=;
        b=eQ/mO0yAAaDhPtVpCFswYoXr3+N8RSvVOhwNittxr8VyEqjyPS2rFrr3e87MfoP7vd
         64OFmz5x9AplFPntndQILgrmfWwvZQ+aVH7XexHrx6cXawCuWVBLko6MEpXPAGkfQ1RT
         Ek+Yu8CobpLzhM1TTrUxgQwnpqD8gLENX0akahybjei/qKpJ2zthqvf2CCS45WwI1ZD4
         reh22Zg5ygr/Odr/im6Z6ds6oJ4FvOO7r3S0yo75b+8IV8Qk362O5giRyn59eEtvjgZd
         ERFgp+bZmvQqKLef0U1fBmp93Io4Dnojp1mwLuSRAy93lpgDZpnWqBG6Gs7Nfiu65faK
         wV/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVykdYqCx2qaCLtDshygMB9r8WYet32q5i2dqv5MAi5EbopdVb/CyRhyrNELXyezJ+XDU4FODkb/YvQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxAwW+TwY2WzYsZWhZzGlrLWab4NuwsSEAi3wkoxIfChp3Tz6L
	dqa8Q/jyjf/bmJGraVKAgJOkNz/6TqXFmMwYHvdpyjMDeltPUg9423EaqwQC4A==
X-Gm-Gg: ATEYQzyQq+xiK7Cvd33XRQjVDa194kjX9cR2ZTRv0Njnt9QbJxhFjhqYEkA8h/r/CPE
	Yd8646H6DQZb6WC6oAibJLqKA3nQNpSZ0m2+DlhLi1FySceFdMSFsxmQMlOOFp3MFyonqPMdm6p
	ihTjY3NSsNMdna5RW8c+EcZESIKTj6wL5KKSVZLWFtk8eOQ9MI4+XKY350XumOIhWAhLukK98+a
	PMKet6/lkJ8QKDlgM/LOo7NvZwOqvZjLouNBK+IjvJ7EzZuQ5x1fTidUw/mARSyyoU3vR9dTdzB
	s/piL7Ob2aNZbFKaMqYqF09pEhGr7+7cvxI3hfKU4PzJEcCTSxO5S80PK2VNYC+VPpx4NfLZuke
	CM/uqctVnCCmrkotmfCz7jJzfz1XRBAvqfJKbl295PeO+emv02X296pUuvIHXQyCBHuTRo7k9wv
	dnS599JmtmV4Vzk9BKGAziXH3TaQ2X1bCfhX6QyeDbhhQUgBbPFZH1GvMhIXxiCC4MKReKqiPqa
	HDZAaeNz2Q=
X-Received: by 2002:a17:902:e88e:b0:2b0:5cb3:e4bc with SMTP id d9443c01a7336-2b06e3528bamr69375555ad.16.1773935575259;
        Thu, 19 Mar 2026 08:52:55 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e61c4dfsm61241845ad.70.2026.03.19.08.52.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 08:52:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c25f34cb-6069-42c4-a7af-bca27c6a411f@roeck-us.net>
Date: Thu, 19 Mar 2026 08:52:52 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Weird Dell SMM bug since 6.18
To: Guy Boldon <gb@guyboldon.com>, linux-hwmon@vger.kernel.org
Cc: W_Armin@gmx.de, jan.claussen10@web.de
References: <b476fdf2-1ce6-46ca-8c98-13e0ae1613b3@web.de>
 <97b6c751-0115-4d00-b212-352f37e5914d@roeck-us.net>
 <DH1W16PFES8U.3MBLJIJPV48JQ@web.de>
 <f9bcdb69-6ad7-409a-afc3-bb5f277ef0ba@gmx.de>
 <02d1330f-1439-4291-bbb2-289122eedd7c@roeck-us.net>
 <DH4H9QQI4OQ9.30PQ935ZJERT0@web.de>
 <62d86acf-6a3f-4bb2-9d81-cf47bd1461e9@roeck-us.net>
 <fd277150-af4b-4bd5-af7e-868c9678eb1e@gmx.de>
 <20260319094944.239871-1-gb@guyboldon.com>
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
In-Reply-To: <20260319094944.239871-1-gb@guyboldon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 3/19/26 02:49, Guy Boldon wrote:
> From: gb@guyboldon.com
> 
> Hi, I'm the CoolerControl maintainer, a few notes from the userspace side.
> 
Thanks a lot for the feedback.

> On Mon, Mar 16, 2026 at 17:55:01 -0700, Guenter Roeck wrote:
>> Not really. -ENODATA seems to be the correct response if the current pwm
>> value is not readable. Returning 0 or any other number would be misleading
>> and trigger other problems (such as some userspace code believing that it
>> can write the value back with no impact, which would be worse).
> 
> For context: thinkpad_acpi has long returned 255 as a dummy value for pwmX
> when in auto mode (pwmX_enable=2), since it similarly cannot retrieve the

That driver is located outside drivers/hwmon/ and thus not in hwmon subsystem
control. Such drivers often implement functionality / attributes which would
not be acceptable in drivers/hwmon/. Non-standard functionality of such drivers
is often fiercely defended by driver authors, so I gave up even trying.

> real PWM value during BIOS control. This was likely motivated by fancontrol
> compatibility, which AFAIR requires a readable pwmX. CoolerControl reads pwmX to
> confirm a channel is functional and to track data values over time, hence why we
> need it readable. We can however adapt our handling for -ENODATA.
> 

hwmon drivers exist since the beginning of Linux. You'll find _lots_ of
inconsistencies across different drivers.

The use of -ENODATA in hwmon to report that a value is not available is
relatively new and isn't even fully documented in the sysfs ABI (admittedly
a major oversight). The major driver for its use is that it more accurately
reflects reality as reported by the "sensors" command if an attribute value
is not available (sensors reports "N/A" instead of an error message if it
gets an -ENODATA error).

> On the write concern: several drivers I'm familiar with (e.g. nct67xx, it87,
> thinkpad_acpi) do not implicitly switch to manual mode on a pwmX write.
> Writing pwmX having no effect when pwmX_enable != 1 is expected, normal
> behavior from our perspective.

It always depends on the chip in question. For some chips, it is actually
necessary or at least desirable to write the pwm value before switching to
manual mode since otherwise the chip might behave erratically. That does not
mean it makes sense or is even possible for all chips. Anyway, the problem
here is (potentially) writing back a value which isn't based on real data.
The question is also what to report when _reading_ a value, not how to handle
writing it.

> 
> On Tue, Mar 17, 2026 at 02:29:39 +0100, Armin Wolf wrote:
>> I suspect that the successful reads happen after the pwmX attribute has
>> been set manually using "cat". The driver will enter manual fan control
>> mode automatically in such a case to keep compatibility with legacy
>> userspace applications.
> 
> That makes sense. Might be worth noting in the docs either way.
> 
> As a related point: gpd_fan returns -EOPNOTSUPP rather than -ENODATA
> when in auto mode, and documents that behavior in the kernel docs. The

Please feel free to submit a patch to fix that.

> inconsistency between drivers, different errors for the same condition,
> means userspace ends up needing per-driver handling for the same use case.
> Not ideal, but at least documentation helps.
> 

I can only repeat what I said above: hwmon drivers exist since the beginning
of Linux. You'll find _lots_ of inconsistencies across different drivers.

The best we can do is to find a means to improve consistency, but as you
can see here even that is difficult because different people will have
different opinions on how that consistency should look like. Error response
will vary, as will attribute visibility.

If you would like to get actively involved, please feel free to submit patches
improving the documentation (Documentation/hwmon/sysfs-interface.rst,
Documentation/ABI/testing/sysfs-class-hwmon, and or driver specific
documentation) as well as driver patches to help improve consistency across
drivers.

Thanks,
Guenter

