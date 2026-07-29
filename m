Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7373CEB92
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 16:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785342377; cv=none; b=iOPs2cLzh6Uz9+QWNAX7eeGplFeNUl+qPhU6PcZiPVBVQXQF+h+sD0mzCAK3u5/Z5ZDh1ejVQYBcRMQpg0GpHW+lO3kmBBnfG4ZQxZVzbC5XX/+zro4vjc3qFgB0v6J22+wFaUSCiOta6BXYZr5FgWk1Gwmarux3T5teMxZ8Gjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785342377; c=relaxed/simple;
	bh=95g2Up5/imKiObVCxkbw85lGqHoF9oj1780LHUtvc2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rk3b2EAhym3qkZRxYIrpSrc4RPV2m5pmBtnO9uXUD18Z8Jk8wd7LgSxze4LblR3NRDdxJoK7JbWlGqlt5kE7wDqLSrXGw0qD92O7YuUK2+SO0tz2AHm0jWP/vV+0bkl7uhQnhq70vLVyF8L57Bsj39P6EfC6W2PBVAlbILaubV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ff2brwF+; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ff2brwF+"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-381b831d535so1355719a91.0
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 09:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785342373; x=1785947173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w0QKfFF6SybzHh4NHRd13vYkPnBaPdyFedjE+mfxuW0=;
        b=ff2brwF+d3jIUJ1NLcrXa1vnRnngUmV3jtCBcGLidqBqEJk6jpstSFXusYxdspr++r
         S1PAUnRad1i7TFkkhDnZEEHdoKfi89QQ9WXYWaUoNyc/GrswTrDqVBRiFQVY1n0RX/Zt
         o9UAKTwQVSeV5SIhz3IcS2wmHQDJ4BgOWl/2Yn7musb01bpiZOk39RwzOwNVHO2Fk3uH
         CrNC0roUnXaronrvYBUqS/MD8wAJwP3s99lIxIHrfqGEHmWDWszgQS0S7N6o7snT+NlL
         /SkbmuzEVDNMLkiPB9+/GF1ChAQeP0Te1c2HxCrCQwFrxQgvNL3nOUPpxHR/HlemdoIO
         bnqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785342373; x=1785947173;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w0QKfFF6SybzHh4NHRd13vYkPnBaPdyFedjE+mfxuW0=;
        b=VUYzwYVRWSz60qIAIoc4MiKmquXDd5TYbhTIhp1Wlap4l2PBUnRRHl+PF+elbxs5mP
         b54wBjiWwThjhGm+srqHpH9/MIRfUTOEIiNoaOAgVXhuJyWXGqZU+GvcYc1tH1wScFSK
         J5x6CzLo1dcBAQfdgT9IAT9+zNlsde2UqRSszppm1WzURoJ7FLl5Gp/Bf+w9j7rbmhw1
         cZ1tN5dr3wa3bBFqzhHZd5OYq+eALyEKhlenTnObQ/BPAKkiVQnkS3hyiuJ5PBViFRi8
         gSaASlDBtILc2e0ZZS1NmmfsraUQxAv4RiTtqrVijlQomM4QMKYWxbqmfQBsztUBqvIv
         aLig==
X-Forwarded-Encrypted: i=1; AHgh+RqkX0vf92lWBBT7Cc2WHJ9Khj5sTE3AvDpPFAOfDnDLJH/AKFuw2SE2kb3pQKCU4X6AGJvvdRNxD4Sg8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLLpg+wAdWr/E4xvNwgPqdkgvNE2+iWQAiN/GNg4HvZz1iSpP8
	STn4togzkHpaK3K6qEs2RqSuV82HdhlzRaERbcIbCUEhPfpONULWajVM
X-Gm-Gg: AR+sD134NOXp4Y4CogaJD8tvnXr7sdneO4yXCbwTH+rfZ7FuljuoS3BiUVuQSL9HoNx
	l5jhMEfCdWLPNV3VlYnaWtbSHdvE7rBOxMzYUIQjleBt2gXD7BA/jOV9wdRIJsAG50l6RjJtPdw
	8TKUmbTTq8Idu4z6P9oxSJtslPE/T539pPIGkftFO5xLryRT0dFffDXsIiObbhm6r7yRmbxTyzq
	6llePTrtfbAq6R9KmyjxwD00RU3HS7pK2jVTJ+Kq+XeDjBwIYo4aifjZ5hF2L3QNUNZhpz18xfg
	KRUW3W5OQjUFzPIXKdywfrpeT4y5fbDtHn/RrtXR77zRXmgX4nNitguWwY+vNhqKnUgvCZb0owm
	fbU3Yav13+BI1axPfMppkEhx4KF4hzhbgTskglh19rz5yB7QKEMpKL7FWI8VLrH+73gUPzZToKv
	2g16UvBb11i2pKKSMkzDDVE07c1O/S/5UMsRTlUzP+IqY2iBFkPwVgzsQJPfb41GKyyenU0rDLP
	nm2/WjPzSEaVq+MnO3xkf7X5c8EfLZtPePJlg==
X-Received: by 2002:a17:90b:5205:b0:38e:6f90:eabd with SMTP id 98e67ed59e1d1-38f6a3d599fmr8698559a91.5.1785342372800;
        Wed, 29 Jul 2026 09:26:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72735084sm10770491c88.12.2026.07.29.09.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 09:26:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8cccd303-1af3-4bc6-afda-2ebf33c41958@roeck-us.net>
Date: Wed, 29 Jul 2026 09:26:11 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: (cros_ec) Handle temperature conversion
 overflows
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260728-cros_ec-hwmon-overflow-v2-1-d24e24d0792b@weissschuh.net>
 <0fbf7f69-bb90-4209-b9d5-258759711496@roeck-us.net>
 <63f9c782-3e4e-468e-a31f-901d1e2ff40b@t-8ch.de>
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
In-Reply-To: <63f9c782-3e4e-468e-a31f-901d1e2ff40b@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/29/26 08:40, Thomas Weißschuh wrote:
> On 2026-07-28 08:02:28-0700, Guenter Roeck wrote:
>> On 7/28/26 03:17, Thomas Weißschuh wrote:
>>> The calculations converting between the different temperature units can
>>> overflow on 32-bit systems, resulting in incorrect data.
>>>
>>> Detect these overflows and handle them.
>>>
>>> The code is written in a way that there is a single conversion function
>>> and the compiler can recognize when overflows are impossible (on 64-bit
>>> and in cros_ec_hwmon_temp_to_millicelsius()). If the compiler detects
>>> this, it will optimize away the overflow checks.
>>>
>>> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
>>> ---
>>> Changes in v2:
>>> - Drop already applied patch 1.
>>> - Also handle overflow of u32 -> long.
>>> - Clarify commit message wrt compiler optimizations.
>>> - Use __always_inline over __flatten to allow the compiler to optimize
>>>     away more unnecessary overflow checks.
>>> - Link to v1: https://patch.msgid.link/20260630-cros_ec-hwmon-overflow-v1-0-3d2ecd3eb0f2@weissschuh.net
>>> ---
>>>    drivers/hwmon/cros_ec_hwmon.c | 31 ++++++++++++++++++++++++++-----
>>>    1 file changed, 26 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
>>> index 1337b646e022..004a8180b665 100644
>>> --- a/drivers/hwmon/cros_ec_hwmon.c
>>> +++ b/drivers/hwmon/cros_ec_hwmon.c
>>> @@ -5,11 +5,13 @@
>>>     *  Copyright (C) 2024 Thomas Weißschuh <linux@weissschuh.net>
>>>     */
>>> +#include <linux/build_bug.h>
>>>    #include <linux/cleanup.h>
>>>    #include <linux/device.h>
>>>    #include <linux/hwmon.h>
>>>    #include <linux/math.h>
>>>    #include <linux/module.h>
>>> +#include <linux/overflow.h>
>>>    #include <linux/platform_device.h>
>>>    #include <linux/platform_data/cros_ec_commands.h>
>>>    #include <linux/platform_data/cros_ec_proto.h>
>>> @@ -151,14 +153,28 @@ static bool cros_ec_hwmon_is_error_temp(u8 temp)
>>>    /* This differs slightly from the variant in units.h to avoid rounding inconsistencies. */
>>>    #define CROS_EC_HWMON_ABSOLUTE_ZERO_MILLICELSIUS (-273000)
>>> -static long cros_ec_hwmon_kelvin_to_millicelsius(long t)
>>> +static __always_inline bool cros_ec_hwmon_kelvin_to_millicelsius_overflow(long t, long *ret)
>>>    {
>>> -	return t * MILLIDEGREE_PER_DEGREE + CROS_EC_HWMON_ABSOLUTE_ZERO_MILLICELSIUS;
>>> +	if (check_mul_overflow(t, MILLIDEGREE_PER_DEGREE, ret))
>>> +		return true;
>>> +
>>> +	if (check_add_overflow(*ret, CROS_EC_HWMON_ABSOLUTE_ZERO_MILLICELSIUS, ret))
>>> +		return true;
>>> +
>>> +	return false;
>>
>> 	return check_add_overflow(*ret, CROS_EC_HWMON_ABSOLUTE_ZERO_MILLICELSIUS, ret);
>>>    }
>>>    static long cros_ec_hwmon_temp_to_millicelsius(u8 temp)
>>
>> The maximum value of "temp" is 255.
>>
>>>    {
>>> -	return cros_ec_hwmon_kelvin_to_millicelsius((((long)temp) + EC_TEMP_SENSOR_OFFSET));
>>
>> 255 + 200 = 455.
>> 455 * 1000 = 455000 (not even counting the conversion from kelvin to C).
>>
>> How could this ever overflow ?
> 
> It will never overflow. And the compiler knows this and optimizes away
> all the overflow checks. Otherwise the build would straight up fail to
> the BUILD_BUG()s below.
> 
> The idea was that not everyone reading this code needs to do the
> calculations and double-check.
> 

No, sorry. You accomplished the opposite: You made me re-check the calculations
because it was obvious to me that there can be no overflow. So you wasted
my time. I am absolutely opposed to unnecessary checks, even if they are compiled
away.

Guenter

