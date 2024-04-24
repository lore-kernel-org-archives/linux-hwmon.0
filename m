Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2497E15E1F5;
	Wed, 24 Apr 2024 14:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713967937; cv=none; b=fMrRy7gSkaGq3/rApT0b/FXQM5wdWy4vRxBKeRaB8uVXpHw+ynE4XFC1myjo86FVC9Ibc/wHSDyL08RlOnF6DP5ZEwBsWGpmUHgzYcdPu97toc5+enZPde21r4QGlEd2shJhOi2NDjCXZt9qjAnQZ0+7hhjlhFPvjP//5Rt+JqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713967937; c=relaxed/simple;
	bh=BkoSw4tGuar7CXsLZT7eKEGFqwiIddvRL9J3/8CekEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iaojPhbx7Vs+aPFA+jbG2thYlK2hRu2Gqo/o6fTk9gMy59UGQHk3BupLCCHkJDDZuspyTxNlzQnn9u35ciMCxp/DiiaQsDX/nP8DVFJZkmeozjPj/uGkTpKMdkZRFxzazZu0cAxXpfqrOEOnEGsXiULBXGf1TZTAAlNFWykvdNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ifBkrygN; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifBkrygN"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1e3f17c6491so55946815ad.2;
        Wed, 24 Apr 2024 07:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713967935; x=1714572735; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=lsll10wHk4U4Q7zcObMGDIonOVp1PFgzxwRb4AuAL2k=;
        b=ifBkrygNtB3HFBnjw2huZ2aYc/Vpd8irdiolu+asTJ2+Z+Y/a8s3dc2Dj9fmePnBHY
         UNX9Co3uE32DFAn1faziOI9DN3UbLEgk/6ZdMRDNsYMggmoWN8vOaQuCN8oYEgJ3Hm9A
         ffBMDjBKp4K29I4ytu+OmJIksDRt8If9f7u8OETNePRyJ8bHg+hvxUXnmt9NyKxnVSyn
         Pfg+3noyQybizU5LhKN2qvhbfCRksoaznB/AiaYiOAorsdygwQiBebR1HZsR5DiPhJq5
         QIpoAwcHbwnSpBzItUUuHlXXdP73ly5YXJf9m0woJlEt7jDO2rc2hP6M/BUpQlEDO4Hk
         ukbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713967935; x=1714572735;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lsll10wHk4U4Q7zcObMGDIonOVp1PFgzxwRb4AuAL2k=;
        b=WFSGEXwUnVn6dHJjHMhtH1HApPvsjHsNyxLKGJOW0Tl3YXIA5n+FhY4zL70nUeNCPE
         P9UPU+uC56dcGU0lmm++aG/Ve9BpnV/q5EZrs6g5NKW4j0xlldRcdjqOKt+79Kgimm4a
         AtcO/Lpdg6StMNU/aecJVmi5ooI0PO5ItDDEKExpbmVDlvTTgAKDZk5kfPGlgJJM5jNK
         xfjMVXgeTF+fXNYTHkusa3QQ0YWeGNhm7yHkUZBilBK9MECxHUyprLuuZ+E76phzOb+s
         RuHVfUWjYFmC9kJ28vO0FZHK4mJu+CdeAXcymkV6g13MYKFj+P3kEN3+ubs+WRyDfVGf
         xcww==
X-Forwarded-Encrypted: i=1; AJvYcCWLoAX0qzganTwMRuG5CmGSiJQYcPU4jOrUO+Qi575X9VGj6x5GEGv6/lKlTwbPwNC9JhKjOUwKkLvqUC7urcymtf05KHyRPryCrZzqWl4Asf4/ASC3a15U7r/D8Hbkk1yM9sXvWc1d
X-Gm-Message-State: AOJu0YwlxDWuijJNzqZxcvCGUWoekjs+R2w/LFxBenUUIXJwmT9L0f3p
	0LvTm0ru97Qoj9KGnUewqp6eREydsuBirpbyDceZ4FEl2VbNBdP3eelMQw==
X-Google-Smtp-Source: AGHT+IFWdPVchjkqrgW4fxVWp1t9FnmxxyuZwv9cRN3HitesqbC5e4SQlaKRLnOYbZSOyzqR16QSXQ==
X-Received: by 2002:a17:903:1209:b0:1e4:471f:2fa1 with SMTP id l9-20020a170903120900b001e4471f2fa1mr2676949plh.24.1713967935268;
        Wed, 24 Apr 2024 07:12:15 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y24-20020a1709027c9800b001e0d62e077esm11970291pll.247.2024.04.24.07.12.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 07:12:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <05e5e502-f135-4fa6-b457-cdcb7b246282@roeck-us.net>
Date: Wed, 24 Apr 2024 07:12:13 -0700
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
 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
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

Unnecessary type cast.

Guenter

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

