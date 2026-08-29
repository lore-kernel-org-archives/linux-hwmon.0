Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D603D88E1
	for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 17:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788023118; cv=none; b=WxnqcHwJPwbImklYjHO4l9NloJD5ZNgjly8AG6agff9eQn5O44D1Wfe7PYF1aD5XSrCxyMwaIFHjBJ75R1k9pIsVgWMwJOc5Ma6VyeTKY+8MnqfkOdAolS5DWGhdiXmy6yj7EjJta7ARzFFhsbY/JBZ0t7j/3zObMlV4daMoNXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788023118; c=relaxed/simple;
	bh=awt/n+oNORYB2YhDK5rTQcAxY6y1IVVts1XEDrCgSzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mMGPGkzt1nIvG8gomOSK8eoHlQnaIB2qOjq4mJ6EKv6Bw6GWtLmZSKiwnbedtspWCwRboL1nIzSCsv2w94tGCthr/rm8wc6ArBa+jSocr6h89oppbPS5vIz+/z24zVvKliLxFBdJNTnV2mgMzOmjo1yDAQOy6+BKNxk7KVnJZEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STYysfgl; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STYysfgl"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d71ae3455aso31349685ad.1
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 10:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788023117; x=1788627917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ln2KbbtEjRGd/LI6Li0KRF+ySsS1VE0IamdH6+rdBvI=;
        b=STYysfgl/OOy37S3XS5JkKuWIWM05EP6PzrVWz+xqrfRFVta+bOCcA/FUgGjmA7OgZ
         JYXt1Ht5kma7EYTDabLqi6u2JeBL8ytzeHuWskUbKvg7FYqH9+e0mXKZ9m4oYE+06H8H
         nBIR8lXBXMCtPHTcq6VEonFFwOvlYMsjRweIBaPePgexMkKFlO6xiIECvCOV7sXwulgj
         TJKalVbRDMBsPhkffXE0mjO/poIa2ylrFeuTZlhPtOZoB58UEu9slqXOuewsEvM02Fs+
         GvMvm7F7ghFx7WN4RRa8ftukFPGMxF+LDp9gePziiKLHSV+Mi6jECbkCQ/LolRoJNJ82
         ICNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788023117; x=1788627917;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ln2KbbtEjRGd/LI6Li0KRF+ySsS1VE0IamdH6+rdBvI=;
        b=AeOJ+1GPN03JlYlv+VgKT5ZZYYaiEqCkcYyauHrY6uDl6daIIni1Ag44kwvvBXqEh6
         0RD0u5p5R+NmnW8/DVczHe66ILz8JRfs5JS6K08nb9qdU4RtEj0X54pwWcRttrPdIa4X
         bkdFi5I+8qIDaYuxtcPBgF0c3qLkBiZmaSFFKf7m0K52ckJrYrxjh+ypM9inwJC7sUYC
         coO5jcheYRTB16n4pkwTzm5QoNfdGQu0X8KRUvHjehNWxOrmiWPxATfOe1g03LfXfaIY
         wRehSnTlILTqNwcMeuwU0+ZHgeIsbbBcjsLIDg2lONMbhC6hi6FIJOo2tJaGtsK84iDT
         0pqg==
X-Forwarded-Encrypted: i=1; AKwUvBz+yguk8mYU2T8s0d5flFdvWbxa9PEr8HxIiSxVbRo5zip2FJfd3j82lsM+EzxxsExwizvMl+0ZkV6/xQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lbV/l66D1VuAqhXKHjxt1Qftuzbqvc7KaG4L/QVSdTh+mkjZ+o
	ecOMF5n6oPJDi9e0Ws1Tt0TxWEYfBlz0jCfsiDOX14PVYdpi1b4fpja0Qh+uvA==
X-Gm-Gg: AYBFou0aQBYFfhITTitbDH80dnsEaa75ylFzJksWnyRgsQAdfWmEs/FH8PPBLERJDjM
	pBSpGpVYhAaRBEvPlJvjpCMr6cFWa3+qqOdlJz2q0ZprN/r+kb3SuaskGPGgTQjbEDPjmUy8jZS
	WMHNDSbRfBf8hlyu0++zbC90e+CI88jAc7S9Sddg2vkWapiUPdANtcZ5YHQSRQRCfn6kHv2VyAr
	nawyD5Q+o+aRkZyWDGi4p6DrhDFWXlCA4Ny7xn+DXna7lp+30+nILNzins9k7cmggwhFu3eZUQS
	UGthQqkJUS3BZHY+TkmSO99wWWAHgvgLWUcVtkkKmcTFG3GL2AgJqvnPk64a0nOdwymPJaXVTir
	eIjYoLjMf9bZsCOVFjGihpP/q6MOUnvyVqmHiK1d6YXT4jA/FbN3b6iJTyA0iHZOBQNuPC4y3v+
	fcF+Kcnw2pZhiLP1WoZFgAEEeRhq1VtTO9aKgXaaQbcye/g1LNho8+AlpyoukQsjZ0tNrLnoNAQ
	tXqssXgF/tZsEBTXEqEGB4Ixg8XXS8YdM4k2g==
X-Received: by 2002:a17:903:8d0:b0:2d7:4cd4:5a7f with SMTP id d9443c01a7336-2d74def6351mr288967185ad.12.1788023116608;
        Sat, 29 Aug 2026 10:05:16 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7be607sm17361289eec.10.2026.08.29.10.05.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Aug 2026 10:05:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <89971e52-a88c-49bd-a0a6-17e48820974d@roeck-us.net>
Date: Sat, 29 Aug 2026 10:05:13 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] hwmon: (starfive-fan-tach) Add fan tach driver for
 StarFive JHB100
To: sashiko-reviews@lists.linux.dev,
 Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20260824030234.9321-1-changhuang.liang@starfivetech.com>
 <20260824030234.9321-3-changhuang.liang@starfivetech.com>
 <20260824032750.0749D1F000E9@smtp.kernel.org>
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
In-Reply-To: <20260824032750.0749D1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/23/26 20:27, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Missing explicit initialization of interrupt and channel enable registers during probe
> --
> 
> --- Patch [2]: [PATCH v3 2/2] hwmon: (starfive-fan-tach) Add fan tach driver for StarFive JHB100 ---
> commit ea266a681c03cda9faa04f08b171c20f1e003841
> Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> 
> hwmon: (starfive-fan-tach) Add fan tach driver for StarFive JHB100
> 
> This commit adds a new driver for the fan tachometer controller found on the
> StarFive JHB100 SoC. It provides support for up to 16 independent fan
> tachometer inputs and reports fan speed in RPM through the hwmon sysfs
> interface.
> 
>> diff --git a/drivers/hwmon/starfive-fan-tach.c b/drivers/hwmon/starfive-fan-tach.c
>> new file mode 100644
>> index 0000000000000..7f56ecc87c1c8
>> --- /dev/null
>> +++ b/drivers/hwmon/starfive-fan-tach.c
> [ ... ]
>> +static int starfive_fan_tach_probe(struct platform_device *pdev)
>> +{
> [ ... ]
>> +	ret = reset_control_deassert(priv->rst);
>> +	if (ret) {
>> +		clk_disable_unprepare(priv->clk);
>> +		return dev_err_probe(dev, ret, "Failed to deassert reset\n");
>> +	}
>> +
>> +	ret = devm_add_action_or_reset(dev, starfive_fan_tach_disable, priv);
>> +	if (ret)
>> +		return ret;
>> +
>> +	writel(STARFIVE_FAN_TACH_STALL_INT_MASK | STARFIVE_FAN_TACH_SLOW_INT_MASK,
>> +	       priv->regs + STARFIVE_FAN_TACH_STATUS);
>> +	writel(priv->clk_rate / STARFIVE_FAN_DEFAULT_MEASURE_RATIO,
>> +	       priv->regs + STARFIVE_FAN_TACH_MEASURE_TIME);
> 
> [Severity: Medium]
> Could this code be susceptible to an interrupt storm if the bootloader leaves
> the FAN-TACH controller enabled with unmasked interrupts?
> 
> Since the driver only deasserts the reset line during probe (and does not
> assert it first), the hardware state might be retained from before the kernel
> booted. Any read-modify-write operations on STARFIVE_FAN_TACH_INT_EN and
> STARFIVE_FAN_TACH_CH_EN later in the driver would then preserve these stray
> bits.
> 
> Once devm_request_irq() is called, any unexpected unmasked interrupts will
> trigger. If the interrupt condition is continuous (e.g., a disconnected or
> stalled fan), the ISR will clear the STATUS bit, but the hardware will
> immediately re-assert it. Because the driver's ISR does not mask unexpected
> interrupts in INT_EN (it only signals completions if armed_stall or
> armed_slow are set), wouldn't this lead to an interrupt storm?
> 
> Should the interrupt and channel enable registers be explicitly initialized
> to 0 before requesting the IRQ to ensure a known safe hardware state?
> 
Please either implement as suggested or explain why it is not needed.
In that case, please add a comment into the code explaining the reason.

Thanks,
Guenter

