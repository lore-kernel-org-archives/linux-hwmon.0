Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC9F34DCC4
	for <linux-hwmon@vger.kernel.org>; Fri, 16 Jan 2026 06:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768544685; cv=none; b=DXJwchbU7CabCHf8ryRXpzRPh0UdJ3LVBrWlJQXpvxsWIBlhwGbXBkFR192upib94O17qqD/naWgLJ7H2y8n3e2tbs7MgQ/6pbsNIejnJIHtbb6Q08NMJmAsmvr4XfJnTkoZnYCjM1Nc4F4WqCkSgbrZ5twZUEndcb74dkdNJvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768544685; c=relaxed/simple;
	bh=dv99jy1AxC6m8gi7Y11or4/z6BHQMZw1mpON34cvDW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DZnwsBPOApmplBPBjaaCrLsBzfvsMmyYC27LKBbKiaZIZ5p2vN7Dq95iQ27hR4z7TBIPiEeLKc2S2Dbu38cEGYZmsPMiHv6bTTKyuEdv/hqaotJEVsbPC0UZY46kt7KLfLyf55nBmjQQZYZWeciNf8wOFg4yPgQFR8DhWKz96fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HEIhDVod; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HEIhDVod"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2b0ea1edf11so403955eec.0
        for <linux-hwmon@vger.kernel.org>; Thu, 15 Jan 2026 22:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768544683; x=1769149483; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=nVGIie6AarXFU7qbhP4pdPRIt209CVV4v5qZm8/x28o=;
        b=HEIhDVodlipTluSGh7U7rnxXJ36wckcXvxHBhPKANpMb5gIbGdRMiWfu+H1gwIQsXe
         +BYojtHftbVJobuqIETLWWPty0zoAmsedrP0Httr2yR8xlHwB0ycAaQ1a3t8TSSAzbgN
         IJV4Jmoy1/ZZMqmnnzhnMSlUUGxo9DduXkwgQWFF9kiL929qFAGkIt6rfeeQbG/E9uj3
         X+DBYo8Ht8cfNL6Hy+nt5pGE7TbBeJEdbor2aXBeDu+/017qsl+IPunsyfGqqtlRKHOs
         AdfB1rba391wcDSn7LCoXVXGJ1UznVpyHQ7oYVmpqFcJsCtQP3vJjPsz+7ZBYGViG6GB
         rmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768544683; x=1769149483;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nVGIie6AarXFU7qbhP4pdPRIt209CVV4v5qZm8/x28o=;
        b=EFFWaZW8ywS2UtDRIUdfT5F44R3RLu6u5PqM8JaEOtBtiy+X+zmPQB9pA5fUsGKzNG
         aIkkEkVVeWlOC1f8ib5Z0MgTG/xPtnHANk5h7n/8umcDgt1n9OPaBcQ7oFA+wtrPRmRg
         5iiVQfZh/RbsPKa+HpfG9MBrr1Z9WKHKay4RmqbIcLwpTa06dySmM05KKw7mkLXaIzTJ
         uoL/vwH7QC4Lkl/O9yzhRTQS0W/7d/YRVklIjUAswZJoTS2SIGvme7sJ0fZ4K6tuSw8K
         Yuv676rL30Az8MKJu67W4nM/XDxM1lpao2oi53YUvC8izrNIkYMbsQbLFCpGMroVh4NQ
         6ygQ==
X-Gm-Message-State: AOJu0YxqrGFstwHbEAowpYoqSAYmGuRFEIparVHBv2BjzJ4Ye98laLF3
	LZK+/2r5FY5OnjdkxlQPpr5+I3iMskcZuzPavWtqty9xcrvd4/0v5Zoy
X-Gm-Gg: AY/fxX7pCqQgvwsWBU4dzGYMDakulV63PqoLvWoPnECavTe/ce1vbJ8F4DtNfPmPty4
	En2J9ArhrpRXr9H5kHidC477AP+pfSQM4gaoOQZvy5F1HaRO9wn0fkeGOG59NB/BwXq7+6n0e+q
	k5tGdkmgu3L5UEwYZJf0ikVaegIHN/UZtIebJI/N2J5Rxu0+ESDoYwXx13QkgQ9IZw5NE4toh5l
	PJ0pfwhNq01kSJPIpB03f5IRLk6JT1X3zvQGnP0nUZ77MnAVjdWVTStJEKihQkbJoYcES9ZMQyS
	43FcnOBaA4WCZ7eseP38VpGf/nVTgf2TnMvIhGxg96CQfZ/TpcJDNPhrbY7wdCwsy24DJ1lYvr9
	VDR2/XcAUzXmot9wCq5U7aqlC4GoU/YgL3jxyojwtO9yaVmh5bkFX07R+ZgFuqSALkHPl4/1nbR
	Og2uhorbq0uvZdGqFxDJmzb3CebtWLQvTqd9JKv/68vSwpdIArAAIPc/GD4XB2
X-Received: by 2002:a05:7301:1687:b0:2b0:4902:c0a3 with SMTP id 5a478bee46e88-2b6b5002fb8mr1698725eec.20.1768544683178;
        Thu, 15 Jan 2026 22:24:43 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b34c0e22sm1288205eec.6.2026.01.15.22.24.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 22:24:42 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <39b48803-e236-4acc-84e9-18162770f9ae@roeck-us.net>
Date: Thu, 15 Jan 2026 22:24:41 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hwmon: spd5118: Do not fail resume on temporary I2C
 errors
To: TINSAE TADESSE <tinsaetadesse2015@gmail.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 linux-kernel@vger.kernel.org
References: <20260110172003.13969-1-tinsaetadesse2015@gmail.com>
 <c36306c5-2426-4a9c-9abd-9f3cdab17ed5@roeck-us.net>
 <CAJ12PfNkde6__QQXMiyBbEoHMbY3efmtsqgbyiKBtBmyfpX5Jw@mail.gmail.com>
 <2740c3ab-7cb0-4931-81a2-30b85e8615f9@roeck-us.net>
 <CAJ12PfP+Dbxd5fFAx-zAaJQ0B53Z1nXAiPbkmivk6smKajf1=Q@mail.gmail.com>
 <e994308a-389a-4d67-9ec9-39a5f0d3f4b6@roeck-us.net>
 <CAJ12PfMC_Potx9aNxaJJ3y=sX=rzyhm-6LJ8Z8OjUyDxiDUNsA@mail.gmail.com>
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
In-Reply-To: <CAJ12PfMC_Potx9aNxaJJ3y=sX=rzyhm-6LJ8Z8OjUyDxiDUNsA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/15/26 05:50, TINSAE TADESSE wrote:
> On Wed, Jan 14, 2026 at 5:23 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 1/14/26 05:07, TINSAE TADESSE wrote:
>> ...
>>>>> Hi Guenter,
>>>>>
>>>>> I tested changing the i801 SMBus controller to use
>>>>> SET_LATE_SYSTEM_SLEEP_PM_OPS() instead of
>>>>> DEFINE_SIMPLE_DEV_PM_OPS() as a diagnostic experiment. With this
>>>>> change, spd5118 resume failures (-ENXIO)
>>>>> still persist, suggesting PM ordering alone is insufficient and other
>>>>> firmware interactions are involved.
>>>>
>>>> How about the problem in the suspend function ? Is that also still seen ?
>>>>
>>>> Also, the subject talks about -EIO. Is that still seen ?
>>>>
>>>> Either case, can you enable debug logs for the i801 driver ?
>>>> It should generate log entries when it reports errors.
>>>>
>>>> Thanks,
>>>> Guenter
>>>>
>>>
>>> Hi Guenter,
>>>
>>> Thank you for the questions. To clarify:
>>>
>> Please do not drop mailing lists from replies.
>>
>>> 1) I have not observed any failures in the suspend path. The suspend
>>> callback completes successfully, and
>>> I have not seen I2C errors or warnings during suspend at any point.
>>
>> Sorry, I seem to be missing something.
>>
>> In that case, what is the point of patch 3/3 of your series which
>> removes hardware accesses from the suspend function ?
>>
>>> 2) I have also not observed -EIO in my testing. The error consistently
>>> reported on resume and subsequent hwmon access is -ENXIO.
>>> Earlier references to -EIO were based on assumptions rather than
>>> observed logs, and I should have been clearer about that.
>>>
>>
>> Thanks for the clarification.
>>
>> Guenter
>>
>>> I am enabling debug logging for the i801 driver to collect more
>>> concrete evidence of controller state during resume.
>>
> 
> Hi Guenter,
> 
>> Sorry, I seem to be missing something.
>>
>> In that case, what is the point of patch 3/3 of your series which
>> removes hardware accesses from the suspend function ?
> 
> You are right to question this, and I agree that it needs clarification.
> 
> Patch 3/3 was originally proposed under the assumption that the resume failures
> were caused by spd5118 performing I2C transactions while the
> controller was not yet available,
> and that removing hardware accesses from the suspend path might
> mitigate the issue.
> At that point, I assumed the problem was limited to the resume callback.
> 
> After enabling detailed i801 debug logging and testing with
> SET_LATE_SYSTEM_SLEEP_PM_OPS() in the i801 driver,
> it became clear that this assumption was incorrect. The controller
> itself reports "i801_smbus: No response"
> both during suspend and immediately after resume, and spd5118 merely
> propagates the resulting -ENXIO.

Outch, that really hurts, because it means that something is seriously
broken in both the suspend and resume path. The device _must_ be accessible
in the suspend path. Otherwise there is no guarantee that the device is
accessible for normal (pre-suspend) operation. After all, someone could
run a script reading sysfs attributes in a tight loop continuously,
or the thermal subsystem could try to access the chip. That would suddenly
start to fail if something in the device access path starts to be suspended
while the underlying hardware is still believed to be operational.

I could imagine some hack/quirk for the resume path, such as delaying resume
for some period of time for affected hardware, but I have no idea what to
do on the suspend side. We can not just drop device writes during suspend
because some broken hardware/firmware does not let us actually access
(and thus suspend) the hardware anymore by the time the suspend function
is called.

Guenter

> This indicates that the issue is not caused by spd5118 suspend/resume
> behavior, but by the unavailability of the
> SMBus controller due to platform or firmware interactions during
> s2idle transitions.
> 
> Given this, I agree that patch 3/3 does not address the root cause and
> does not provide a justified improvement.
> I am therefore fine with dropping it.
> 
> Thank you for pointing this out.
> 

