Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4616B3E8340
	for <linux-hwmon@vger.kernel.org>; Fri, 31 Jul 2026 14:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785508465; cv=none; b=qvxNhog6LsTSz+CBF6JwGP8n7pxq+WVoE4OBundEWSBGw2Q9nbEYYQl3KguxRNeuIgrK1so7uKiSasBHW6IvVJh0jvl6RnT3hapA1oO9rWxgSIsWjaXXPCrH/8wOIFGjAAYeqf90WtSwwBpQAAt7mWzNes5yqZSKwKQNtU/qPqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785508465; c=relaxed/simple;
	bh=7DXtPTZgZEXkVJrQbzX6jObdrrWldwLOX/i7gxI5He4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WT9f1eiaXxjZnHxZxsMk0DphqakkHc6t9vTylsPVoTQnNOJI45B9dBJkNFLhPeCzWQ6LQhJ6UlFr15P/RjalBAI4yjBTmfPh22NhSKIi7KObyo1P9mluvSjHPguoBG8+s225D8DkMi0Typ/SqJmbgg1fLKyKLFVIOhbAJjcnP9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IRRxel0j; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IRRxel0j"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84861fc51f5so689701b3a.1
        for <linux-hwmon@vger.kernel.org>; Fri, 31 Jul 2026 07:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785508463; x=1786113263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ytVkAIVtL+RJ1AVImHIqBrTd7Inxbj+j08EnvjqWHM0=;
        b=IRRxel0jRTAIhNVLZxgWgOYgFKvPwPEKSUxQ59eNT0inHIIO3sze24ndYt6b41DUU8
         8lGgSsn4L/GQbwKzn1qAFnCYVx/oqI6Q6ic1zp7WOq22QeG2ezNwGUgbUzbrP3EFTwjg
         GXD+Kfv0gym12ShAd2Dy+wRTJVhWsivsmzLXB/n/6WjE74PiO02ELFQwiYlvZf1kNHW6
         K6P2RoFnfI97+PKhNoOD+TU6TgHUn1uLmdIzENv/lSCwFKj1l5cuxqkmLPNFAjBT8dYU
         hDg2/ER3SgLyu1874rTVzttLTss5doTUBJnwE4yCj02TlbqYxwp5h0XM6qW5g3nKW5tp
         9wyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508463; x=1786113263;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ytVkAIVtL+RJ1AVImHIqBrTd7Inxbj+j08EnvjqWHM0=;
        b=pCtow7AXqXQYg6QEPqHyKVRyDyU6nyWaNFWrOHhRF2Le53kTKI8jXt9tai9PWBnwk9
         6/ID167y2bPJ17wQyLD3Gfs2Cvd/wheqOfNXizVJ/+lovF5pBnr0WlsZtiyxqun1521g
         lt79S7oW622wfarKUyD3gfezcTQ3msLLq9Gy0YkPBj2ThWf9Frnor0V2dNwrGo5zFWOp
         FHcmidx8UjmkpyKLM5mUKJgRfHl6UoypNFw3fPkVlOeb9SsUsL3rddZWKxhg4tVluYNP
         cZqVHyCHknl6MXiDVA9GX/XnqoC+odzMCfClD4pR09kE2KHLBm59ts8fX4CFIT+/8+qs
         mx4A==
X-Gm-Message-State: AOJu0YxMkGyAIgtRXZiDxgveRXnFVC9KqYPam/4bHAwXO69AgDNXvjHX
	NWk/YgGsWJgPicPVAb5TBmOR9+rU0kJjtQKSi2S4jSlu8lxewCELIjsochfdLw==
X-Gm-Gg: AR+sD13rpmpVA2E23tRYqS8zmuTDLxkyMEaWACFYMOvUCDXiwnhf3ZPCuWwGyg40sbS
	xDdpNfofvNat5dR0C7gjjSGFqoaP2Hhy8LHaqlnbyGfzD+/9cdTCPPFrQB18gifpxgkRRs+An8l
	WVptY50L5hmaK88l9nAuytw7JC6GOAdE/YSyWDoH4ZRwNB6kIIDFMmA9tMNgyaajpeA0irmDOHC
	GHGoFfhDEb6veVsADkmzBiw/sQYJjCjbBBDhFKFbXsGRImO8s4lh72p1HVRA92BggvASm+gLssJ
	Rew4mCU+x1o2ZiM1IUWpCXmfZD/4ZAnUz7P5UGUpiKahLDft1+azHdS/2M97+L1eYX0TGosrTxn
	1bJg8HdjviK7y9Zl+rZQHNBBvBIFUFi20yoUGUk7KJtjNBAK/OtzhkHZdn9JxXzDdRuWb5EfWQj
	RjooLKA1Z0g2D4N+GoVCVfiWhdFglcv/PTxp4f+vyucu+02EP63HyQ8sKhaag2ozPwjunCjkKDb
	P0p8k6zDCT0OkczURQNotx/VWkqnOkHX2pToA==
X-Received: by 2002:a05:6a00:2a0d:b0:848:65f3:23c1 with SMTP id d2e1a72fcca58-84ed71b65b6mr1851445b3a.69.1785508463425;
        Fri, 31 Jul 2026 07:34:23 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc29eba2sm532271b3a.32.2026.07.31.07.34.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 07:34:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <59f69e92-3795-447d-b4e8-a30851ef647a@roeck-us.net>
Date: Fri, 31 Jul 2026 07:34:21 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] hwmon: (ina2xx) Decouple in0 and curr1 alarms
To: Jared Kangas <jkangas@redhat.com>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260729-upstream-ina2xx-in0-curr1-alarms-v1-0-349f7b2f1df8@redhat.com>
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
In-Reply-To: <20260729-upstream-ina2xx-in0-curr1-alarms-v1-0-349f7b2f1df8@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/29/26 08:42, Jared Kangas wrote:
> The in0 and curr1 alarms in the ina2xx driver are both based on shunt
> voltage in the hardware, which causes unexpected behavior when reading
> the two inputs' alarms:
> 
> 1. Both alarms may read back 1, even though only one is set.
> 
> 2. The "active" alarm may read back 0 even if the limit was reached due
>     to the use of alert latching. If the inactive alarm is read, it
>     clears the active alarm, and the alarm may not be set before the next
>     read:
> 
>          # echo 1800 >curr1_lcrit
>          # head {in0,curr1}_lcrit_alarm
>          ==> in0_lcrit_alarm <==
>          1
> 
>          ==> curr1_lcrit_alarm <==
>          0
> 
> To address this, track the active alarm's type in the driver, and when
> reading alarms, return early without polling the hardware if the alarm
> being read is inactive.
> 
> Some prep work is done in patches 1-3 to simplify the fix in patch 4.
> 
> Signed-off-by: Jared Kangas <jkangas@redhat.com>

Please fix the issues reported by Sashiko (or explain why they don't apply).

Thanks,
Guenter

