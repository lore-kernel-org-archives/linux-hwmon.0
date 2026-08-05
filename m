Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9D723D7DF
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 02:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785898127; cv=none; b=n77dDfJ2qXE/oyVh2QVIR91Qr5xeDPuoaUR2ZBJofqxZnr4S5eU00VVqD9LEHjQFg/6VSmBmoftx97udKTuIq1QchNWL62hGG/YpP9rRacpbXJCLVCQR6NXTw1YfzrhA6vc8VE5kB2lmC8ICHoNvVEHQwvi+NjzFT8/VFJEdufY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785898127; c=relaxed/simple;
	bh=fZu55mQG1hEBZEU/7+pUi+8i3Od5zkPYha49Wn5qbZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M9AEcnTACcRGiqrQRHwToNopkXASufIVfz8OEMMhnQOPAYqcT8oAd4ehi/V6EnWtA6mjtVUj4a2JPki5O42TTdNUMRSAw6UhojSD7RznzzYrrImuD4IAUNPEKaiYDoOYo79Zhwz976gsqcycZ2uXYlIAQmdDsgWagU0oJ0gMa2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bzKVzd6r; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bzKVzd6r"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38f0f132f56so1286605a91.0
        for <linux-hwmon@vger.kernel.org>; Tue, 04 Aug 2026 19:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785898125; x=1786502925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mJZwSOXrLvWwROQMCHaOkyoHPUutO+R50dzAEp3qkxc=;
        b=bzKVzd6r/R/KxMH3rRt0QURwG9pmlTqFdtdWs2/jQDnn5G/wkbI8nyCbgW98DI0v27
         BEC1KkC+W6JK2j/01LfzzgO4YrQC0jqMGI8jYxH0DinVCMbUjAn+oPy05uYmWToa29oj
         tJ4KcP2OX06qZT5rDovVFe0/JNzw3+zaxtlTzSKHLQePVATRFGnZEmUZKFxW0NItcomg
         wlUWl3e3RozZYCNH2LoNolX0AzD+Xg4+HzmieagzklawNr30yoZT+FVRmIoiEnjnV1op
         2mKyVmt3b+YrT4GREinNa/srTFMlCsRsYywan7KW5Df21XiNuGKITyezJnsiOeoCMWgi
         6FUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785898125; x=1786502925;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mJZwSOXrLvWwROQMCHaOkyoHPUutO+R50dzAEp3qkxc=;
        b=LlxnPMC6NTvtNnzw9DyppvmKY5HU69tmzryFxP8BfyqX2hW9xqNWMaCCtVCwclI0MC
         Qj8u3XUib+SJgShkCwYCWvw3RPgCHv38V9zcaY8pnJghBeBVY4rS6raBBxG/WTz77Y2B
         urmFNfqSA6O/RTjgEu2aSXrJK+N8lkBEHkVIT7QaRuMGJp5kzZOPhvtR3x8K9E+nUxrT
         UPxbnqh5/aXcLpjuG8uoTMxXTp1su5nbVeU93znBUHobfhDx7ahNPnRR5dZCz0z4Iw+d
         UnnXaBG8JEgWllohr0wYxqhx0rw7p6r0E1ty5wr6lXg0v8d4OyIc0LXsvxMLuRecG16D
         eNOA==
X-Gm-Message-State: AOJu0YwlRcE8qo5f/ysGziPI5ZSfd/2cseBqUY0hbwywfBf+HuI6nc7u
	w17T2wy9z3VA3rQGrI8iFp8ufxi1Zxt789f9r8iSwAFsvQ1+H80UgYCC
X-Gm-Gg: AR+sD136ho+7CIQf0vxB9S/LtBYuyOLvEMl0RlsvigtoeP+sIDdnkUdnYHU+B6nBQQd
	MyCzsdd1U3HCKgepGjF7iqNkoRCkAy3zOL2D4gBr5NqTuFa1jkNyIa54Z4cD3PNB4aWm6yWAwLK
	GFhggdTwKFGFz8FrrMMBGZ29M9Q4G9GySb0ZotBePAe7InJEPMYeIdrY6ImIUiHI4GCUuC/kCrE
	mk3vwxIjJH65xjrvbemmL7km5niuk46EhVCmz2cklm4pypI+MF5JJJLgL3wDTvQ7Y2/9FAoBc1h
	EzbHzB5hhwoNwQcs+I6nAoKpxGEZPD2bAnrU8jxHXgesOeGj2hULXrR+GFvdVsQ02bdRTCOVTRx
	oFT5d8+Z7GpSZtbW+FOF2XGPrAueXBwL9GPR0XZ4sbVMKRDOKiDYDGQyUDwkR9Uc/nI6+Lz+OWW
	lRAJRtkiYpQ3B7J8mCHobaHvm88WtuubE7ksMATgVrhAh45o0Lq4SEc2OQ31Xr+N/NVw5xbLVGZ
	kZVLYgnska4QghnfP5TqpAj3rYdJBSXFWMl1g==
X-Received: by 2002:a17:90b:2801:b0:385:3ab:fecb with SMTP id 98e67ed59e1d1-3903c552b41mr1368378a91.4.1785898125250;
        Tue, 04 Aug 2026 19:48:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fede7ad70sm2792763a91.15.2026.08.04.19.48.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 19:48:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <35a6924f-48ea-4d29-ac22-53d2b6350b58@roeck-us.net>
Date: Tue, 4 Aug 2026 19:48:43 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (ads7828) Properly handle -EPROBE_DEFER from
 devm_regulator_get_optional()
To: Qingshuang Fu <fffsqian@163.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Sam Povilus <kernel.development@povil.us>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Qingshuang Fu <fuqingshuang@kylinos.cn>
References: <20260805020506.958722-1-fffsqian@163.com>
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
In-Reply-To: <20260805020506.958722-1-fffsqian@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/4/26 19:05, Qingshuang Fu wrote:
> From: Qingshuang Fu <fuqingshuang@kylinos.cn>
> 
> When devm_regulator_get_optional() returns -EPROBE_DEFER, the driver
> currently ignores the error and incorrectly falls back to internal VREF,
> even if an external vref is defined in device tree.
> 
> This could lead to conflicting voltage sources on the VREF pin and
> inaccurate ADC readings.
> 
> Check for -EPROBE_DEFER explicitly and return it to trigger probe deferral.
> Treat other errors (such as -ENODEV) as "no external vref" and use internal
> reference.
> 

Only -ENODEV means "no external vref". All other errors should trigger an error return.

Guenter


> Fixes: a8ddfea09566 ("hwmon: (ads7828) Accept optional parameters from device tree")
> Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
> ---
>   drivers/hwmon/ads7828.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hwmon/ads7828.c b/drivers/hwmon/ads7828.c
> index 149cfcec78dc..1c4a04cb023c 100644
> --- a/drivers/hwmon/ads7828.c
> +++ b/drivers/hwmon/ads7828.c
> @@ -133,6 +133,8 @@ static int ads7828_probe(struct i2c_client *client)
>   			    vref_mv > ADS7828_EXT_VREF_MV_MAX)
>   				return -EINVAL;
>   			ext_vref = true;
> +		} else if (PTR_ERR(reg) == -EPROBE_DEFER) {
> +			return PTR_ERR(reg);
>   		}
>   	}
>   
> 
> base-commit: c21bb4193868a8de71fc4693fa741e195fdf5d86

