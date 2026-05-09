Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38798834
	for <linux-hwmon@vger.kernel.org>; Sat,  9 May 2026 11:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778326749; cv=none; b=O4ja4LdwqdMpJzARcI1B5tzxSQ0D6Njx9nFehn/hZMMt9olMwb9S6WhdtzOuUT0ZbuXLw4Ow++iZATSFw6uJE3Hzc7twi/f7dBhVGFgSrvjjlVdW9Ql5dMfdvvyPqXco7M24JtcEpKOtMzWvRiRe+rNObJC1J/K6Te2d2Zk/nvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778326749; c=relaxed/simple;
	bh=m6GI3/CF5QCQb8cC7a70K+idHTvtpf3gdRgyDzjofuE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JdPeiVL48Zco1iMAf1gy2bW0IEui2Q6hpzr7UilbxUMBYtuXw1vk0xlF0mItffAtF9Mp2rkPuWXFp4w077r4iMxBsaWFwR+pdhENHlQ32RZd7j6Lacc5IrDtI0ylTyzoANInydgBcNe9OD813227iOK8lC3de6Y+QdeJOJRzVsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gvQFECsj; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gvQFECsj"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8383fb7143aso1341061b3a.3
        for <linux-hwmon@vger.kernel.org>; Sat, 09 May 2026 04:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778326747; x=1778931547; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Lca8ezAMURn07GR9svW8aDhXArqxCzYQMB4RbUco7w0=;
        b=gvQFECsj9FPfCpwyr0+alq+bao1oHQ62KzsDw0MCUtanEjup789MNlcaDLbMnXICZt
         nR/fr/joBsSu7hv7RSAvyrWbWp6Xgf415RrrddUpM5p4eEavzMyZitYB/uEPtz9Mp+4c
         1Y199iTwxl/J/Nc63ebFnQLGCTxlfdF/Fn4cXhJyCtCt9Mln/m79VEFUdQeLHekDiTkX
         BkhaqR2vvWnObrv/HTyMp9VyqsigQDKCkEHRKp5HJpT+pRcyfgLdH6hwTE1DEy/hlSnf
         ZOs8lYgMTT+c/5+YOyeQvHExnKXI4i5B4Amv7tUSLmhKZe7dM8edZr5+/dMFv71UvxaL
         wSuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778326747; x=1778931547;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lca8ezAMURn07GR9svW8aDhXArqxCzYQMB4RbUco7w0=;
        b=Fnfe6ojScPi+TQGnXxlP5y0ncqec20x0dlRVC6GW9uH2a5ycIbi0wD4nSpZ0ge8PZo
         tIEXTbtSY2uxYLlcKiY/TYPwW+7Jv5knJPWa7fdDOi5a9JD7CkS/8c4H/r5/gO84sN24
         7ue4M78+VMPVZkkLgZlfCMRgiAwmkevkbhK881BLnCsOq4rPJYT28+bLhP/DsiWrxq4u
         jLKoB8csiEgSIjss1mRGMCVTSrF4FYb72K3Rt4PlT35FgvA2247bJYKFLd5HCUcZIbPO
         DRwMA+qNVXF8bAlSJln0nIJrsdkHy4AGo/4Wky2u49zFt26In5Zfd6y3BTaiRjA+oYQk
         wNoA==
X-Gm-Message-State: AOJu0YyAc5vGv6uzMxpCppCcjkI42MbNPexpbQ34/YU4ndtJCSPUFnc1
	9/db2Ck6DEHnVqBRPGBNUAlCmRCfxwW8QzK/1VY/FOeLT28kdVZ49aa6u2yXPQ==
X-Gm-Gg: Acq92OGEPeC7iFc2v9/x04i6J+6AaLY6mVuSR96rLDUQO8ZPyI+7vdegfVQsaX3gxMl
	eCBNpgCG8oTQOKPAhpPmVIeyJwYWw/uZchQ07McuD0Ze97tgxeL631aC1BgJtWT2PxwtTSfrldV
	IDuv2u+q5JcrTydi14crpmuyn/3RdSHr0K+agjWcrxhm/MsGkk3p2FvVLVepEUnNss5lxL2Z7pS
	N5HJgztDc8f6x42sxU5e71KI0w1hNdsCrJyNjSgfHvDkce9DBaf8j/vtvLWtJHnPnta9pes0Q7O
	fqmUqjZqPkOjugwjGt73/5jwBVUzIbNt3Nyz7bHVS3PLxWP5SO3p4pFkI9Y/H6RipxxdvvhJB+F
	gi1vcrCp55uA3xeXjL3cvIgYj4jw61szPi34gOTeiPmnw/IqFbkCbC06O2/nqi0SoXa5YoATf/9
	sDaNrQjYo8BRDkEM7SUvuq6cStvJEK56T+luJutmv17qV1f6GEdMDNaRyW8rOOxaAg4x17LHZ2p
	D2E3pmzzFY=
X-Received: by 2002:a05:6a00:f09:b0:82f:5576:2853 with SMTP id d2e1a72fcca58-83e3b2da63dmr1968284b3a.30.1778326746837;
        Sat, 09 May 2026 04:39:06 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d35b3bsm13857847b3a.24.2026.05.09.04.39.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 May 2026 04:39:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e5ea765f-3249-449d-940e-d9bc6d5ec623@roeck-us.net>
Date: Sat, 9 May 2026 04:39:04 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (tmp102) Change mode to read label property
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260509112417.51164-1-flaviu.nistor@gmail.com>
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
In-Reply-To: <20260509112417.51164-1-flaviu.nistor@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/9/26 04:24, Flaviu Nistor wrote:
> Replace of_property_read_string() with the preferred
> device_property_read_string() in the probe function to
> read the device label property, improving the driver
> compatibility since this method is not limited to
> Device Tree only.
> 

The subject of this patch is completely off ...
"change mode" - what does this even mean ?

> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
> ---
>   drivers/hwmon/tmp102.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
> index 3aa1a3fbeaa9..a89cc49798f5 100644
> --- a/drivers/hwmon/tmp102.c
> +++ b/drivers/hwmon/tmp102.c
> @@ -313,7 +313,7 @@ static int tmp102_probe(struct i2c_client *client)
>   	if (!tmp102)
>   		return -ENOMEM;
>   
> -	of_property_read_string(dev->of_node, "label", &tmp102->label);
> +	device_property_read_string(dev, "label", &tmp102->label);
>   

Changing this also requires changing include files.
Instead of including linux/of.h, you'll need to include
linux/mod_devicetable.h and linux/property.h.

Thanks,
Guenter

