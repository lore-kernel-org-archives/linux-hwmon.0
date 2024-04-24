Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9D915DBD3;
	Wed, 24 Apr 2024 14:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713967840; cv=none; b=HTxUZL7acVdqauXQKgsrOpZlijL8abfANHVgDFkK/yVILMv518UKHtzb6uU3NcZOg2ujXOsNrFGLfgnMr0bCBPNG7/XL7w5sOowkzjLg2BkHyPI4TKMGV9occLeSKKW9hVM5iB7JceRUBvHZxoSkcuhcc9AXwdX0GwvF12i0Ad8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713967840; c=relaxed/simple;
	bh=mIuyvzjM/zLZ2qxR32BueDm/sFzMWkiGrkkiP/nbYeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UxSyp6XF0vPRDORTehvBX0EMWX0QKcGWYibGjkqM/FJHm8+46w00dGVfDt5l9JSDGgqi9mXmyRbFsONuy6aH3NG/dxZOBGEXbTTE98nR7GwOuJKDrwspw05+45ZPqbkyagpmdtZ3HqQBFYH9MugQoJNynHirGGiqqyvQjSEn+/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qon5xeFp; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qon5xeFp"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6ed112c64beso6057777b3a.1;
        Wed, 24 Apr 2024 07:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713967836; x=1714572636; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ir7o5MgLD+ZdSuKdZV5IZOaKuz3t4fLOBPu6WuGlN9Y=;
        b=Qon5xeFpLpxojknrRW1C/OuD5kae5ZXJzC5ch2/KMF7z3s/Y/VuaBA2awjYTf3Cri2
         7ECCa5CpfXdcLRHYINc8/YgCmEMmH3fObO0xU2/P1kSnMlKjOmAmwPQmQX6Q1sTyaaG1
         TznYs/pt5x/ZQ/mcmcVi7YTAnmmzcbLa0pqpu3Uu51+3DFGoD0jMsYavrFsHszOwjQrc
         n97Yk5gYf57ApcEx4v6zugr3ty1M6IY10foUkAAKv7S1MQBdelTmQBJH3sdOF0ZBwWOK
         7lO56/lNG4EnB85RVH2PQCsNCF3pLrOku1ldHhxaScNN8mHt+H+zIK85v22Uc3qm0nfX
         4ibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713967836; x=1714572636;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ir7o5MgLD+ZdSuKdZV5IZOaKuz3t4fLOBPu6WuGlN9Y=;
        b=V6QER/LrHjxwEXj8TRT/hjPL8rxgAsYMnRKKSbrSzgzJoEMJzFOnz8T9x8HWF4rbH+
         SM9irHPnmfJ8rwlaYtb5r/V2vWxlT6IE6pjaYT5KU4nm2EhN3miX9OlHncZQl8nY2No9
         3wKxKC+bkE+azo01A6J2T2WQs202FTm+A+YQf0IFjOxafKO6/AeLi2WzrNbYxB/ayuHu
         vKEG6/kd7F1YIrhMKFhTbO2DnkfLp/bts3fQumxqcArKOft23t+2uwFKfCxTrRzPc+W8
         leaNoDcXjGT+jHTFFuy9LS70BrAqLMgtbrRBUhgPjlh5bADGoOJrz7+/6OvLqaXIIZ1j
         JuHg==
X-Forwarded-Encrypted: i=1; AJvYcCWHcVaqcRZ5ZP77XZ5qRPAdPdHApVBHBoDoP3qJviV/nQbIW5fKmhXLoITrhUnFem9xz8j/BxCFfPQ8X/dO+lwNFQE4HpM/6xF5QT7LMmMUVX0aNmDX5/YGP9BklLokP0x2qot+wYEr
X-Gm-Message-State: AOJu0Ywb3AGGrxTxUwhaoHM+CgIPB5ojB2hYJmEHiWff9PP4impc3HBT
	5t5ktLN/KsWsToqNNzRmP//SXmSZ/OYkXFdivkpNqydnO325W+ss+DY6/w==
X-Google-Smtp-Source: AGHT+IHOqD05KCYP1P9MpaZ6fWFXUFdBulaK4iYd8v2Q0doVogV4KpWagUCSL7ABHj/Eh1noUld+iQ==
X-Received: by 2002:a05:6a00:240d:b0:6eb:40:6bff with SMTP id z13-20020a056a00240d00b006eb00406bffmr2739688pfh.14.1713967835575;
        Wed, 24 Apr 2024 07:10:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id kr3-20020a056a004b4300b006ed26aa0ae6sm11453076pfb.54.2024.04.24.07.10.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 07:10:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <677423ba-b63d-4408-9823-7387862f1ae9@roeck-us.net>
Date: Wed, 24 Apr 2024 07:10:33 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: (pwm-fan): support target-pwm property to set
 default PWM value
To: Peter Korsgaard <peter@korsgaard.com>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240424090453.2292185-1-peter@korsgaard.com>
 <20240424090453.2292185-2-peter@korsgaard.com>
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
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240424090453.2292185-2-peter@korsgaard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/24/24 02:04, Peter Korsgaard wrote:
> For some use cases defaulting the PWM to full fan speed is not ideal
> (noise, power consumption, ..), so support an optional target-pwm
> property (0..255) to override the default PWM value.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>   drivers/hwmon/pwm-fan.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> index b67bc9e833c0..ebdefbd5789c 100644
> --- a/drivers/hwmon/pwm-fan.c
> +++ b/drivers/hwmon/pwm-fan.c
> @@ -482,6 +482,7 @@ static int pwm_fan_probe(struct platform_device *pdev)
>   	const struct hwmon_channel_info **channels;
>   	u32 *fan_channel_config;
>   	int channel_count = 1;	/* We always have a PWM channel. */
> +	u32 target_pwm = MAX_PWM;
>   	int i;
>   
>   	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> @@ -527,11 +528,17 @@ static int pwm_fan_probe(struct platform_device *pdev)
>   
>   	ctx->enable_mode = pwm_disable_reg_enable;
>   
> +	of_property_read_u32(dev->of_node, "target-pwm", &target_pwm);
> +	if (target_pwm > (u32)MAX_PWM) {
> +		dev_err(dev, "Invalid target-pwm: %u > %d\n", target_pwm, MAX_PWM);
> +		return -EINVAL;
> +	}
> +
>   	/*
> -	 * Set duty cycle to maximum allowed and enable PWM output as well as
> +	 * Set duty cycle to target and enable PWM output as well as
>   	 * the regulator. In case of error nothing is changed
>   	 */
> -	ret = set_pwm(ctx, MAX_PWM);
> +	ret = set_pwm(ctx, target_pwm);
>   	if (ret) {
>   		dev_err(dev, "Failed to configure PWM: %d\n", ret);
>   		return ret;

A much better name would be default-pwm for the property name.
target-pwm is misleading and doesn't really make sense because
there is no "target", just a value that is being set.

Guenter

