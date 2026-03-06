Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8443836A039
	for <linux-hwmon@vger.kernel.org>; Fri,  6 Mar 2026 15:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772810558; cv=none; b=dbg/osicuxLtBGwMMKAb4x0TABd6BPpE6rxb9okoLl6LiZAPb9sR/4pQ3kHt0EdIIcCh51t4xa5pd80KQzJfe7yf8EGJ/zQE454lrGgvthArtnR2XlInSrUTm8R+nVfpgz+O6hRCfzny1tN8L40D0i1X3mdbuPSz7R6Fa2D0gQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772810558; c=relaxed/simple;
	bh=0xv0Q/rdY5Bj7nFpgeAx4X3SMt4Ttz/cplFAjBGlyFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GqfpEryE+07a+yjq+HQKjGtcykfqcekA0Ch9BzP+3UgR4/35B706LUd3ciKKsxCAXQt0BykVTjwWHqKJm/mrScFg71nFNE9ViFHqOKeGL3Ck113KOKRK09eZ/45suQcPtspKZxgI4wg1ZwKLOapXzI8Apx2uWFz52HRDdnsAgro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OPhU2z8J; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OPhU2z8J"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-124a635476fso11066994c88.0
        for <linux-hwmon@vger.kernel.org>; Fri, 06 Mar 2026 07:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772810551; x=1773415351; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6XDLuG2g5D0dtVulOb92ZhTkqEZkXM/BQ7MGxoQVFU=;
        b=OPhU2z8JTK37XDBt/RlqzKWB+4/xTZ4v3JWT9PVIKbspQRykLo5p9NRcox6Z3CLGMu
         WUxBY1BCFkKKW0/IXZpuWd3m8F9twCGcUyHurZNjOXN81vy5//j33iOOBvN1SU3i0+go
         I8c5WaYhSLUQXNsWNDus6cvy6YD2kVihUadnxWeYT2iBQxJLrTZjZKsPcoz7WzC/bTrA
         MYApsEJ+G+9U/kMS8i/al2/Kh5p9ju8voByQ56CgxW8qgHv811CQKw/7dks/dLLObvZe
         p4kxCn1qoou6ufRvdXG7yn5R3XcHd4yzJ6q79s2XO6xIcM3x/LyXl/buB2zBXT53ltQq
         SsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772810551; x=1773415351;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z6XDLuG2g5D0dtVulOb92ZhTkqEZkXM/BQ7MGxoQVFU=;
        b=FZtpS0gV27oj9TBnpH1q6bxU7N8JWo64QzIF4BaiA/XwHw/DYbryOGCbhH7EeHO1qJ
         mgJKs2lDWSLuiPBnoP1f2S4MfAreUHRCjXyrBl4z4qHGkF/rxMWN29XpB0SExhXm2i7C
         2Nofp2g7V4ZT1uTJOPPoIVWrSMCQhpO4CDKVGfwX2OxtBgrQUVc2ItLJs5mBpIyDyJeX
         wmS82YgiDmdPlp736XDQQlQYX9sZstCXUomFMBSWW5CtSgmI/JriYE7G3y11isECuIGh
         hbBzMrOEs9+CqGtjEqu9WMpetKMrSr0v2Mjojw9iBo9HaX3t1ftQawi+Ud4d1act8XVP
         SNCA==
X-Gm-Message-State: AOJu0Ywwmv1+H9d5EQl3SmrhKEsaekR0JxHlvCOQLarWdBoZH4T8vpTn
	eQ4eQS6dSfnpow5ZE2aYxmen7zP8FB40H7rXbpIazdPBiDRwIuCJsk9L
X-Gm-Gg: ATEYQzx6hTNrc0HRlPp3UdaBPYEKrKccUyRUgaDTg9HoyaoCsvJOe7ZkLC2D+5V5TXJ
	eisWOz1GgoP8dkjwGXFWZFf9VIJoQEn8fRvWhIAa6gecLTSnWE9kIZIN4INVRLoL7BU7LszKjsz
	/JGCZ/vaw0YVHn6b5vfmdmGgMxpGZNtU9Z4HywtrCn9GvYW7bOw8lNYi/cLOhpTPlqqiqVKFwqt
	fk56Z8ofd64NQqYCfZ4hUOW/dZT5svdNbnWnTA2hFGjmmcY/Jof9DSTJM/Mpbl02K0G7dHijU2Q
	Vua0pFHWZE/5eDsuw3hWBfVXZ270jNdj3CtX/cN7Tea1SzxlTFJ63/wT2bCoBuFayhr/mHk8WQb
	tKjzOjymZA/Uf2O9i9m95p2Wefi9LDfDVfqbt/9aUOm3nOodfjc6P7mOOBfZhoppJ8xf+SHgvZt
	phFlaRY8WjfZodKECLXboWRnWh7af66ekhmmilZfqQDnWuP++OJhZzQ7KQk5zhN6RuSzgyb93m
X-Received: by 2002:a05:7022:e28:b0:11b:9d52:9102 with SMTP id a92af1059eb24-128c2d9b28cmr1184560c88.6.1772810551074;
        Fri, 06 Mar 2026 07:22:31 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128c3f5a102sm1441985c88.13.2026.03.06.07.22.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 07:22:30 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b4629b96-2e5b-45b7-a72c-dc090a5c15b4@roeck-us.net>
Date: Fri, 6 Mar 2026 07:22:28 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (aspeed-g6-pwm-tach): fix driver data handling in
 probe/remove
To: Billy Tsai <billy_tsai@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20260306-pwm_fixes-v1-1-e8ede6fbaf47@aspeedtech.com>
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
In-Reply-To: <20260306-pwm_fixes-v1-1-e8ede6fbaf47@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/5/26 22:44, Billy Tsai wrote:
> Ensure proper association of driver data by setting and retrieving
> the platform device's driver data during probe and remove.
> 
> Fixes: 7e1449cd15d1 ("hwmon: (aspeed-g6-pwm-tacho): Support for ASPEED g6 PWM/Fan tach")
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>   drivers/hwmon/aspeed-g6-pwm-tach.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/aspeed-g6-pwm-tach.c b/drivers/hwmon/aspeed-g6-pwm-tach.c
> index 44e1ecba205d..0c03d272279a 100644
> --- a/drivers/hwmon/aspeed-g6-pwm-tach.c
> +++ b/drivers/hwmon/aspeed-g6-pwm-tach.c
> @@ -490,6 +490,7 @@ static int aspeed_pwm_tach_probe(struct platform_device *pdev)
>   	if (IS_ERR(chip))
>   		return PTR_ERR(chip);
>   
> +	platform_set_drvdata(pdev, chip);
>   	pwmchip_set_drvdata(chip, priv);
>   	chip->ops = &aspeed_pwm_ops;
>   
> @@ -519,7 +520,8 @@ static int aspeed_pwm_tach_probe(struct platform_device *pdev)
>   
>   static void aspeed_pwm_tach_remove(struct platform_device *pdev)
>   {
> -	struct aspeed_pwm_tach_data *priv = platform_get_drvdata(pdev);
> +	struct pwm_chip *chip = platform_get_drvdata(pdev);
> +	struct aspeed_pwm_tach_data *priv = aspeed_pwm_chip_to_data(chip);
>   
>   	reset_control_assert(priv->reset);
>   }
> 

The probe function registers aspeed_pwm_tach_reset_assert() with
devm_add_action_or_reset(). Why is the remove function needed in
the first place ? It seems redundant to me, and even buggy since
it asserts reset before its users (pwm and hwmon) are disabled/removed.

Thanks,
Guenter

