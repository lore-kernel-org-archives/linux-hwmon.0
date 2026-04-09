Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FEF3D47C5
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Apr 2026 14:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775744110; cv=none; b=naVCdRf5FO0067UrtDsInvHBFWXsndf3H55syR+w09ibgK2p0RGQM/FHvgiGZlV7ZOFSoP7peqlTokFpoQtBek3+9deY786s7rNG2qwRmOKhY0wqqTeIPiQHsvXnm5JKf8UbZ24iYlo+9p2MqGqYx+9sYzpk2jgDQdyRc94e1lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775744110; c=relaxed/simple;
	bh=cOmuJKdGks3qIAz06CSbEDwAkdYwsaltVuq/sgXPbuw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YDBlmEdYoSb/vuyCm95JLRx/u/kDSnpJadnQUAyEOEBEG+gfIohUkcoCTJPWDrzjGp4sBlqeWMFRcsFjp/MmwxnSIHAvC42W+bWgzDk1hmGFveJ3MT+92xnWAz7FlD5oHTaazhYufFJdQc5zKP40c++76t/KoZ+tLOlQweQ9m28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I+zvvvi9; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+zvvvi9"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2ce22328930so1196051eec.0
        for <linux-hwmon@vger.kernel.org>; Thu, 09 Apr 2026 07:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775744108; x=1776348908; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Uw3Bxpm9JhxpGRVl5K5MuSpTdjyE3ZHgEFlkPeF+uCQ=;
        b=I+zvvvi9PmuxfNz9IY/mdkXCqUFpFFaX0XfHGw6n9EANYcmz4xkrM/LBvVkYftvfE0
         VhZ1f1pM/O2DjPjQxj814vDyvCOTi3DA0V/19owdTc5GKB4pGqdpIGjKa5ehBQI6/jb4
         i2hECaJczbyVwPJqojT4oZmMGzw/ADrbHHDvZ/MttCXSxsyGDT9mx3Ifu7UD1BbiBRSP
         fV19G8/nqcPQjywgjH5xq5zzofvzcsKqF2uK/BB2pNSm2nz6lvlKeB4Oomri5s9KwYQl
         4EGmb0Nufmg7BAfDnXeYwFoVxmz7J/JFFgeBPIxLdim84qyV9Nz3mbnXiWGRXZvKGzC4
         WVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775744108; x=1776348908;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uw3Bxpm9JhxpGRVl5K5MuSpTdjyE3ZHgEFlkPeF+uCQ=;
        b=ip2uyVwbiGa4Nwlhl9Zok50ztwy44YFFsZEuFmEoBwBlOl+QF0fqurI7BAjf8TRaLj
         O46eRxNTVd/tgBAx9dmIFBWvAJyShbUjumfiuV9tWiWyFVI4KsZCfu9ZTtPjELcYALd1
         X4V1GonmxNJysAtMld/kRzSlZaQp6918ZQJDriREuZNjUxEyFKUsYjwAhvmEdZxv1s8p
         kOWj8HMQ9QDB6nYR0Tn/onwKSSFB4pB0jnmjKTQVC6vislRrd4NPNo/3hI1qddNpf4qa
         9P9L+uvofvoHDDNseLDSjlB8gr/4l9fFtA0LJHi3/YKdwbq4GMTXzfTzkDgKllOYTmMX
         G3uQ==
X-Gm-Message-State: AOJu0YzlGU9lSul0yawrkT9MxWKZbCzacEalfG17R1BNs3MYOR6CTLxU
	RoiOZc/XVYyIvBSR1N9SZ544r9XxdR0EY7+n0Nhceu5CRipLseMvDtvx
X-Gm-Gg: AeBDieuIW0oJZa2kJPYqggDO0cJIxPprEmn7M0qjVO5XqdkSfCldq4bvh3rFwNjwJ5D
	Ht2z6gRGgFb6GasXWb1s0iTg6fYWlubqGeoySewnRGToK/9if2vOZtyg4RAjgud35PS4BEkqz+d
	dnpPbC/S/P6J1yohVOADI6pLc4X4nSU3fHreoAYd9fA8pvEcKzYI33T52OV9haWOQ4qe03cTxRJ
	hiJO0ulkZExRKh4AdLY4LNxcVb30GNHg1ZMgaVCxcTY4VF/WUDGk9nFVIIF7HM1oggsSl4Qsego
	Ms/qFe/1YAutmVotl1sWbuaUml4oPSjIOAmd/tgYYxpmkCeip3ZIhHM5YZySly9ItoNaKhCV0AP
	XvirOUK/H3h1lFcQL0LM2C9Fdd9pDwDwgz/G1mPfmqFvpXsKbZ9hy8pVi4FXYaGjNKROGkuASPl
	LoU1684AcdYpubip0XHM75E0PEpOSsq7/l9xpAQsof3mQGh6mtomUZUv/V0+Vledv98yIgw76f+
	K5brFA46qs=
X-Received: by 2002:a05:7301:d1b:b0:2c6:7f49:a87a with SMTP id 5a478bee46e88-2cbf9df273amr14717920eec.9.1775744108242;
        Thu, 09 Apr 2026 07:15:08 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cee97ff4e8sm17096747eec.25.2026.04.09.07.15.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 07:15:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <03aa8948-102e-4f98-96e0-70f07e2c3c4b@roeck-us.net>
Date: Thu, 9 Apr 2026 07:15:06 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/13] hwmon: spd5118: Add I3C support
To: sashiko@lists.linux.dev, Akhil R <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260409105747.48158-13-akhilrajeev@nvidia.com>
 <20260409123649.83A30C4CEF7@smtp.kernel.org>
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
In-Reply-To: <20260409123649.83A30C4CEF7@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/9/26 05:36, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 1 potential issue(s):
> - [Low] Unmet Kconfig dependencies and build failures when CONFIG_I3C=m and CONFIG_I2C=n.
> --
> 
> commit f34d2926473bc2c3d9a64dd532178bd0f77d003d
> Author: Akhil R <akhilrajeev@nvidia.com>
> 
> hwmon: spd5118: Add I3C support
> 
> This commit adds I3C support to the SPD5118 driver, introducing a regmap
> config and an I3C probe function, matching via OF.
> 
>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>> index fb847ab40ab4f..d1c660d2e2c10 100644
>> --- a/drivers/hwmon/Kconfig
>> +++ b/drivers/hwmon/Kconfig
>> @@ -2298,12 +2298,15 @@ config SENSORS_INA3221
>>   
>>   config SENSORS_SPD5118
>>   	tristate "SPD5118 Compliant Temperature Sensors"
>> -	depends on I2C
>> +	depends on I3C_OR_I2C
>>   	select REGMAP_I2C
> 
> Will this cause an unmet dependency warning? If CONFIG_I3C=m and
> CONFIG_I2C=n, the dependency on I3C_OR_I2C is satisfied, but REGMAP_I2C
> is unconditionally selected without its dependency on I2C being met.
> 

That can't happen since I3C selects I2C, so ignore this feedback.

Guenter

