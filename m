Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792509244;
	b=DXKJboNYkl20iaufA3V8U6m4awIgy0fW3ZuvvnLZ86tycpa16kMQBLitpNqCh8UyYS/S
	 NRKPGjmdhS8p9nTzwBuCBhzMc0Y+H6u31fROFjvgIoMuAWZ6dWdU9n7T7myyIOxZB8nDx
	 UwNWClguRY97fZ50nAyLvVoVZoOpJnf5FNSnJ15Prx6Z5vg70Hq6NOoHFxrRzgDuBplae
	 6LMf9rsQtkTvUr3UTwHuAbdpWzxZ6GmFUBHk0cLYLebo8m6QZ+vfjItIU+dZVFyHOt1L3
	 5RcQHas1VnXs7Ub4+6RbnvoNjX87YIJAFp9FH+/cwFE5+byuFho7Z4fL1j/nnlFOrBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792509244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=4zrIfO2j5f1V0AGayWITQAFNyhl7js8bpZF+l1m8f4U=;
	b=uHwx6gDvcYNjUlhKtzL/I9mdz58NEqg9Wp/eDTTBh3tiua5c3mgz215RCL27/EYwDcXr
	 pOOn3UJhpBkgG1qVlJcU6TZZvZTGeV/ptKWK7m3+D1I75/KzQstQ5UKuV+N633MLwIFGu
	 Dh8myHi1qBHVoF7raBuPscDn/49MlJ/xXNWmdRQ7gLjq4BmPPyby2HZfu0z6fTaZyIb9w
	 cTrDNkUrF4Doej6THDRzZ/ETbRO2rtgywfVGpLH8ss7FZztyndyeKKFDfLw09Ro0cDAyV
	 K4epkJpN0zWV2ac3PZCtny+zhQAi71sqnxBMchYKOf93d6ZzcM/CyvDsaP0lOP8dTAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Mep1HLEV;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0D460A2600
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 15:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B0D460A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Mep1HLEV
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso2013283a91.3
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 08:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792509243; x=1793114043; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4zrIfO2j5f1V0AGayWITQAFNyhl7js8bpZF+l1m8f4U=;
        b=Mep1HLEVIl9xVF2HMLTgkvOHjnBmwfBms7wzWTijsyCiiVnpuam6zgeyJ+xSGYSkJH
         N9arguJbSH/sF6o06PLe7WxfdSiROvJf9pvaG0/b7YuTM0c82wMr+LZLxbcOTebMnIOL
         SPMRXXLuX9Wlxgek+7y9i1bX+Mz2CgHTrP9gDjh5CdzseLXP2Oor5rPaUIcZcGzkBOgg
         6xExXc9ilXTeYijd3NMNxbIUrvf5KmiI4r8ieIC7KhHx3pXNjoz4sXWu05QD6N6eEGa8
         sbf8M72rtBSN0aOSaK1NwZZ3D1nxRmdMI2RNJHTbWf1KqtpQfChY+8j+58Jrf0u9PQrt
         QG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792509243; x=1793114043;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4zrIfO2j5f1V0AGayWITQAFNyhl7js8bpZF+l1m8f4U=;
        b=rdOZ8boTuXe2l/SCGOoOXa4dlSZ7NoHbw2bhYlsk3jFKt6bptr5Ec+aYDpDFi01bd0
         0O2q/0HGo2fg9gmqEHd8l8S5hs7jZOQ1u0BUJc0nWV8Etkg8RIsuDMbtP3FQqZ+ZjSoh
         avjNyuS/pwZA8M++ZIiE+KWG4R3Iz2YZg1FPttpFPOP7168noE/JZt4LCcroR09PUmEd
         fIF0EMnkuT7wjoeUNP0VMkfeabgfIpoHyvHmeYAqkXHQ0dmZDsGTwocL+8gsWvuc09Jd
         Tj8tjoSPmkeOhjwQJbI5VPZ3/FgMEu/VKycZg3GNnAhCzbDzW1Ka4LdSotdphP4yzlW1
         smZw==
X-Gm-Message-State: AFq9FYLZAVFtPWa2zcxBSFk+6Yce5eFhWHar+K+ooYKvbOXUeOQWWV/H
	8FQHHQuaNY3x/iXl6vD+1bPvLmPplf2TR3rF9rnSzJ5jo1lDAAW+GQnw
X-Gm-Gg: AYBFou3tuRfUv4qKFE85507ENOfMG8cMlQzVApdmnn6KxDbAT/zdozAX0+DiB38O7L4
	oFookEWq+4aRafkgvyzt7l35hfkJCAjUOV1zppQc49hp8KXpXT9H3lVnackwkG0/8uWKU68q8cf
	bC1+7jFtzKK/I+mjSARrazH591I9OqqU4c3BKgEdefklqhkggh2PfnXFAoj0FMTgdOM8XViN4tz
	hGmx40vqxmXD0xJxIUwHEccBpfs2wpv6AdgKkx3air5Pgz6hLW7Vs/4NmDUgDJF7BpguDqK7zGh
	Q6cSlxGge3gWcljOHb5RFE/D/Q+dTPL5sReVdqSsO6q/IZG6eAEpurimjj1ocx6cyFchKMDb5S4
	CHERZW+2YUe3f1hHwmAZsdQUkhHFCBvMPvmoGcd2AWoS7hWXp9ax9IUVdUF9dE7wMWFt7Fs9gNW
	Muv18cv+jmiaaYKbJ2fiY9A1pYUjqHKS3jMcBBkF+hJC2RmL8zU5AyhFTeJ0GJ6kX0IHSkaPIqC
	4stAJwHop9JsFBzT+pYwaa1ru+uMGgMFXhI7yMa7fSYjWtw
X-Received: by 2002:a17:90b:1dc3:b0:3ac:9e76:aa76 with SMTP id 98e67ed59e1d1-3aceefb0116mr10395555a91.13.1792509242546;
        Tue, 20 Oct 2026 08:14:02 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad80214aefsm54820a91.3.2026.10.20.08.14.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 08:14:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <62872394-e64e-4ed1-9d73-ccae1336d7bd@roeck-us.net>
Date: Tue, 20 Oct 2026 08:13:59 -0700
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hwmon: (pmbus/ltc2978) Add support for LT7175 and
 LT7176P
To: Christopher de Guzman <christopher.deguzman@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20261020-upstream-lt7175-lt7176p-v1-0-86b9b728b95d@analog.com>
 <20261020-upstream-lt7175-lt7176p-v1-2-86b9b728b95d@analog.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261020-upstream-lt7175-lt7176p-v1-2-86b9b728b95d@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/26 04:45, Christopher de Guzman wrote:
> Add support for LT7175/LT7175-1 and LT7176P/LT7176P-1 PMBus buck
> regulators. These parts share the LT7170 family MFR_SPECIAL_ID
> (0x1C1D masked to 0x1C10) and use the same PMBus register layout,
> so they reuse the existing lt7170/lt7171 probe path. Variants are
> distinguished by reading the PMBUS_IC_DEVICE_ID ASCII string.
> 
> Signed-off-by: Christopher de Guzman <christopher.deguzman@analog.com>
> ---
>   drivers/hwmon/pmbus/Kconfig   |  6 +++---
>   drivers/hwmon/pmbus/ltc2978.c | 28 +++++++++++++++++++++++++++-
>   2 files changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index fd6641316454..63fb4d5dd87d 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -306,9 +306,9 @@ config SENSORS_LTC2978_REGULATOR
>   	depends on SENSORS_LTC2978 && REGULATOR
>   	help
>   	  If you say yes here you get regulator support for Linear Technology
> -	  LT7170, LT7171, LTC3880, LTC3883, LTC3884, LTC3886, LTC3887, LTC3889,
> -	  LTC7841, LTC7880, LTM4644, LTM4673, LTM4675, LTM4676, LTM4677,
> -	  LTM4678, LTM4680, LTM4686, and LTM4700.
> +	  LT7170, LT7171, LT7175, LT7176P, LTC3880, LTC3883, LTC3884, LTC3886,
> +	  LTC3887, LTC3889, LTC7841, LTC7880, LTM4644, LTM4673, LTM4675, LTM4676,
> +	  LTM4677, LTM4678, LTM4680, LTM4686, and LTM4700.
>   
>   config SENSORS_LTC3815
>   	tristate "Linear Technologies LTC3815"
> diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
> index aea7b6c93e74..a42cdc1fe124 100644
> --- a/drivers/hwmon/pmbus/ltc2978.c
> +++ b/drivers/hwmon/pmbus/ltc2978.c
> @@ -23,7 +23,7 @@ enum chips {
>   	/* Managers */
>   	ltc2972, ltc2974, ltc2975, ltc2977, ltc2978, ltc2979, ltc2980,
>   	/* Controllers */
> -	lt7170, lt7171, ltc3880, ltc3882, ltc3883, ltc3884, ltc3886, ltc3887,
> +	lt7170, lt7171, lt7175, lt7176p, ltc3880, ltc3882, ltc3883, ltc3884, ltc3886, ltc3887,
>   	ltc3889, ltc7132, ltc7841, ltc7880,
>   	/* Modules */
>   	ltm2987, ltm4664, ltm4673, ltm4675, ltm4676, ltm4677, ltm4678, ltm4680,
> @@ -540,6 +540,10 @@ static int ltc2978_write_word_data(struct i2c_client *client, int page,
>   static const struct i2c_device_id ltc2978_id[] = {
>   	{ .name = "lt7170", .driver_data = lt7170 },
>   	{ .name = "lt7171", .driver_data = lt7171 },
> +	{ .name = "lt7175", .driver_data = lt7175 },
> +	{ .name = "lt7175-1", .driver_data = lt7175 },
> +	{ .name = "lt7176p", .driver_data = lt7176p },
> +	{ .name = "lt7176p-1", .driver_data = lt7176p },

We don't usually add -x variants unless really needed.
Let's not start this here.

>   	{ .name = "ltc2972", .driver_data = ltc2972 },
>   	{ .name = "ltc2974", .driver_data = ltc2974 },
>   	{ .name = "ltc2975", .driver_data = ltc2975 },
> @@ -645,6 +649,10 @@ static int ltc2978_get_id(struct i2c_client *client)
>   			return lt7170;
>   		if (!strncmp(buf, "LT7171", 6))
>   			return lt7171;
> +		if (!strncmp(buf, "LT7175", 6))
> +			return lt7175;
> +		if (!strncmp(buf, "LT7176P", 7))
> +			return lt7176p;

Sashiko has a point. It may be better to start using
the same approach used for chips with no chip ID, which would
be something like

		for (id = &ltc2978_id[0]; strlen(id->name); id++) {
                         if (ret >= strlen(id->name) &&
			    !strncasecmp(id->name, buf, strlen(id->name)))
                                 return (int)id->driver_data;
                 }

>   
>   		return -ENODEV;
>   	}
> @@ -774,6 +782,20 @@ static int ltc2978_probe(struct i2c_client *client)
>   		  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
>   		  | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
>   		break;
> +	case lt7175:
> +	case lt7176p:
> +		data->features |= FEAT_CLEAR_PEAKS | FEAT_NEEDS_POLLING;
> +		info->read_word_data = ltc3883_read_word_data;
> +		info->pages = LTC3883_NUM_PAGES;
> +		info->format[PSC_VOLTAGE_IN] = ieee754;
> +		info->format[PSC_VOLTAGE_OUT] = ieee754;
> +		info->format[PSC_CURRENT_OUT] = ieee754;
> +		info->format[PSC_TEMPERATURE] = ieee754;
> +		info->func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
> +		  | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
> +		  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
> +		  | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;

Unless I am missing something, this is identical to lt7170 / lt71751.
No need to duplicate the code, just add the case statements.

> +		break;
>   	case ltc2972:
>   		info->read_word_data = ltc2975_read_word_data;
>   		info->pages = LTC2972_NUM_PAGES;
> @@ -962,6 +984,10 @@ static int ltc2978_probe(struct i2c_client *client)
>   static const struct of_device_id ltc2978_of_match[] = {
>   	{ .compatible = "lltc,lt7170" },
>   	{ .compatible = "lltc,lt7171" },
> +	{ .compatible = "lltc,lt7175" },
> +	{ .compatible = "lltc,lt7175-1" },
> +	{ .compatible = "lltc,lt7176p" },
> +	{ .compatible = "lltc,lt7176p-1" },

Same as above. Please do not add -1 variants.

Thanks,
Guenter

>   	{ .compatible = "lltc,ltc2972" },
>   	{ .compatible = "lltc,ltc2974" },
>   	{ .compatible = "lltc,ltc2975" },
> 

