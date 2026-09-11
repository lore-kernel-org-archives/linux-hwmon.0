Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFE1349AE0
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Sep 2026 14:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136218; cv=none; b=e2PL4ulIHEtui7uQjb/pwnjaP5nEd/V09/H6euX0Lga9bCv7nG4uyf3AmyukgwTZfZfPMioAuOckE2hmJICsbH/M/yGRWPAiIcMJRSOgLxAryJ46eUUvQeBawbt3E/ZvkbWetYt3pbePnp3Hy2HZr9Q/M7/KccPtzWDpCD9QUS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136218; c=relaxed/simple;
	bh=kiSWLP1eNUSGPQCliihnmIyxoN3d5qoP3JCsIs56mXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q1JwzYBXxR8AGrTkgivpLubW8zvPVr5OX+/aNJ/TNcJt7oETcPQYB3U//+Y/PD31/oqAD6NfJX3DZ1+e1hIWjdSA4+gte5pFckbwCRTX66SCKSm7kOWts6TPPDsOFFL3DmCu8mA6BLjSnv3M0NHh305k28ZrVMGkShe5jp/TCpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HmF3VblH; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HmF3VblH"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-7fc4034841cso801174a34.3
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Sep 2026 07:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789136215; x=1789741015; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lzESgw1FhZRMEULjQ2VIw5gEjh8pVkl3QN7J61DD380=;
        b=HmF3VblHaC4zJXItNF73llXT0CvDp1FE+GXBRvqNqN/I6Enyxw6S9jx74JNGQXp4Ai
         rgb7TIY6WMaYFtvSqlatz8Z0WSwsoER7s79oW6b4ZSBo6EZ97fCWyfFHOH4ZGfej/fMz
         s8SxW0bwkkCfUg83j7xme3AtWFHQke6jghST7XxxlPR88OsSlPD2R0xtnQXu3um6Xr6s
         vogtmgDAcaHoR8Xo10+BlHyfkORTlqwE6XKgj0u3pgNduhVgB/xTmg/pqcn2nk5fy/Se
         /txsrP/062jtdGaHCjC85EOLp+X6v5RrqpvMseG4d4D/8cAjx1Wc2QQTNgViUOXltj8B
         WOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136215; x=1789741015;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lzESgw1FhZRMEULjQ2VIw5gEjh8pVkl3QN7J61DD380=;
        b=m0Uk3ILimO5tZ0OUnnTVNndh/aebhd06TknBgfLdeiHYbAE+evmodfxBwNDJ/DodoJ
         kLD9U8XmKt8lpisp0Goo30eEb9S486NmuP0Uj6U2LsgyjT8WVjTcIrsNhP17YhhPcqoL
         BZV6XTyqvFsEHh+A3YDwRHmO9S8BJ1IyipiFfugLLHt3tFqW53fP5KfoSpTEsv6mcvLH
         Z2Ggc0UKofePJRJQcpX7INPMOTg8Gz5iYS+Rz7TBHBVYx7F5Gz5RCvTuX9S6EWa29hIA
         GxPEsUz+n3AY7WWrwg4vcMqf5SN1PAkbNPs0di7GbTDQWDOn/Lg8V14nNAEjA+Ly3ep5
         fERg==
X-Forwarded-Encrypted: i=1; AKwUvBw/3FT8SSX/ap+8CWoqoan1m2oXQwo5GyqXAkyzTLsNX/60pbYKYXwbc+tPXvO8nv1uQ7VzvPrlAnTmfw==@vger.kernel.org
X-Gm-Message-State: AFuF++nI38ICkbkSB8f4kFcUlp8oIZfvzJ4O4PPJsWhDq7boW0zk235y
	rEtunJH8IDwS8ATSP5LGBRc8IjiKeZkb97RXhZNh6mOSDHhwn5T585Iy
X-Gm-Gg: AYBFou0YMSefsKKRqvEYBvXbeFzuGdJNXNyT+ubXyBzq9nd2szINeW4/csZ9gvs+O5o
	YSRqePJuYy6XqOR46Sq6ianNmw+C3FvQjtlN95YVI3KFG1ezruyAjpeGEyZHwcAwb9NZjNZf41g
	v6PVkWyFzcwVhNRreRlkwYwLRbs7mZeStrIecnb0N70jxobuYzMcxjEnrtbZL9YLxKO3/FlEWHs
	NhCSJrKC8OhWCv1Gv2+uBZFy08H6Uv8DKVI899pwvBO1U/IvhmF1rC42xdGxMJxftWaEc4F7TrG
	cbfz50uR3cP7Z7WWj4D2+6C72HZ5GYgLT6WSSQ535q1+hBaCd1FJ7ZyMCzHLIt8QR49A7XXOjA8
	QZqt4QER4QiShlgbTvb6CpcKKX7wEo1eBOOcdJUKJ1pF4eJPJuY35h30IwxH2x3Wu20Iud5af8f
	IBT404VKTxfIQ9wHlmQZ090+OKbVI4S9S+9wj6CGnkcb6VhkEeNFT87si96Qxn9mN7WPsHfOh7T
	53+JgLQVRnlb426fu7cD1KrOvMXMSxGonqUWfEukidgkFfo
X-Received: by 2002:a05:6820:1845:b0:6b7:46fa:1699 with SMTP id 006d021491bc7-6c0bc7c3857mr3255417eaf.46.1789136215533;
        Fri, 11 Sep 2026 07:16:55 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b348cbsm6930530c88.3.2026.09.11.07.16.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 07:16:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <49109bf9-7765-45c5-bd28-4a3d9ceb2636@roeck-us.net>
Date: Fri, 11 Sep 2026 07:16:52 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: (lm75) Add support for Nuvoton NCT7715
To: hsyemail2@gmail.com, linux-hwmon@vger.kernel.org
Cc: Sheng-Yuan Huang <syhuang3@nuvoton.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Jean Delvare <jdelvare@suse.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260911072654.15722-1-syhuang3@nuvoton.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260911072654.15722-1-syhuang3@nuvoton.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/11/26 00:26, hsyemail2@gmail.com wrote:
> From: Sheng-Yuan Huang <syhuang3@nuvoton.com>
> 
> The Nuvoton NCT7715 is compatible with the LM75 temperature and
> limit register layout. Add support for the NCT7715, including its
> 16-bit configuration register.
> 
> Handle its conversion-rate field and shutdown bit separately, since
> their bit positions differ from the standard LM75 layout.
> 
> Signed-off-by: Sheng-Yuan Huang <syhuang3@nuvoton.com>
> ---
> v2:
> - Use the standard SMBus word representation for the NCT7715
>    configuration register, removing the NCT7715-specific byte swapping
>    and updating its configuration masks accordingly.
> 
>   .../devicetree/bindings/hwmon/lm75.yaml       |  1 +
>   Documentation/hwmon/lm75.rst                  |  6 +++
>   drivers/hwmon/lm75.c                          | 52 ++++++++++++++++++-
>   3 files changed, 57 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/lm75.yaml b/Documentation/devicetree/bindings/hwmon/lm75.yaml
> index b48bf3fd721f..832a8c5d83e9 100644
> --- a/Documentation/devicetree/bindings/hwmon/lm75.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/lm75.yaml
> @@ -31,6 +31,7 @@ properties:
>         - nxp,p3t1750
>         - nxp,p3t1755
>         - nxp,pct2075
> +      - nuvoton,nct7715
>         - st,stds75
>         - st,stlm75
>         - microchip,tcn75
> diff --git a/Documentation/hwmon/lm75.rst b/Documentation/hwmon/lm75.rst
> index ca46754e028b..fac0b8f29ddc 100644
> --- a/Documentation/hwmon/lm75.rst
> +++ b/Documentation/hwmon/lm75.rst
> @@ -150,6 +150,12 @@ Supported chips:
>   
>                  https://ams.com/documents/20143/36005/AS6200_DS000449_4-00.pdf
>   
> +  * Nuvoton NCT7715
> +
> +    Prefix: 'nct7715'
> +
> +    Addresses scanned: none
> +
>   Author: Frodo Looijaard <frodol@dds.nl>
>   
>   Description
> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
> index 2d2d752aeac9..ad7128629e56 100644
> --- a/drivers/hwmon/lm75.c
> +++ b/drivers/hwmon/lm75.c
> @@ -39,6 +39,7 @@ enum lm75_type {		/* keep sorted in alphabetical order */
>   	max6626,
>   	max31725,
>   	mcp980x,
> +	nct7715,
>   	p3t1750,
>   	p3t1755,
>   	pct2075,
> @@ -107,6 +108,15 @@ static const unsigned short normal_i2c[] = { 0x48, 0x49, 0x4a, 0x4b, 0x4c,
>   #define LM75_REG_MAX		0x03
>   #define PCT2075_REG_IDLE	0x04
>   
> +#define NCT7715_CONFIG_RESOLUTION_12_BIT	GENMASK(6, 5)
> +#define NCT7715_CONFIG_SHUTDOWN			BIT(0)

Same as LM75_SHUTDOWN, and thus unnecessary.

> +#define NCT7715_CONFIG_CONVERSION_RATE_MASK	GENMASK(15, 14)
> +#define NCT7715_CONFIG_EXTENDED_MODE		BIT(12)
> +#define NCT7715_CONFIG_RATE_0_25HZ		0
> +#define NCT7715_CONFIG_RATE_1HZ			BIT(14)
> +#define NCT7715_CONFIG_RATE_4HZ			BIT(15)
> +#define NCT7715_CONFIG_RATE_8HZ			GENMASK(15, 14)
> +

This matches the bit settings of TMP112, meaning the code working for TMP112
works here just fine.

>   struct lm75_data {
>   	const char *label;
>   	struct regmap			*regmap;
> @@ -122,6 +132,10 @@ struct lm75_data {
>   /*-----------------------------------------------------------------------*/
>   
>   static const u8 lm75_sample_set_masks[] = { 0 << 5, 1 << 5, 2 << 5, 3 << 5 };
> +static const u16 nct7715_sample_set_masks[] = {
> +	NCT7715_CONFIG_RATE_8HZ, NCT7715_CONFIG_RATE_4HZ,
> +	NCT7715_CONFIG_RATE_1HZ, NCT7715_CONFIG_RATE_0_25HZ
> +};
>   
>   #define LM75_ALERT_POLARITY_HIGH_8_BIT	(BIT(2))
>   #define LM75_ALERT_POLARITY_HIGH_16_BIT	(BIT(2) << 8)
> @@ -259,6 +273,15 @@ static const struct lm75_params device_params[] = {
>   		.sample_times = (unsigned int []){ 30, 60, 120, 240 },
>   		.resolutions = (u8 []) {9, 10, 11, 12 },
>   	},
> +	[nct7715] = {
> +		.config_reg_16bits = true,
> +		.set_mask = NCT7715_CONFIG_RESOLUTION_12_BIT,
> +		.clr_mask = NCT7715_CONFIG_EXTENDED_MODE,

We don't use chip specific defines for any of the other chips,
so don't do it here either.

> +		.default_resolution = 12,
> +		.default_sample_time = 250,
> +		.num_sample_times = 4,
> +		.sample_times = (unsigned int []){ 125, 250, 1000, 4000 },
> +	},
>   	[tmp100] = {
>   		.set_mask = 3 << 5,	/* 12-bit mode */
>   		.clr_mask = 1 << 7,	/* not one-shot mode */
> @@ -354,6 +377,11 @@ static inline long lm75_reg_to_mc(s16 temp, u8 resolution)
>   static inline int lm75_write_config(struct lm75_data *data, u16 set_mask,
>   				    u16 clr_mask)
>   {
> +	if (data->kind == nct7715)
> +		return regmap_update_bits(data->regmap, LM75_REG_CONF,
> +					  clr_mask | set_mask | NCT7715_CONFIG_SHUTDOWN,

NCT7715_CONFIG_SHUTDOWN == LM75_SHUTDOWN, so this conditional
is unnecessary. There are several similar instances of unnecessary duplication
in the code. Please drop all that. The chip appears to be a clone of tmp112,
and there is no reason to handle this chip differently. If you want to use
a different sample time default, fine, but that does not warrant the extra code.

I'll stop the review here. Please drop all the extra code.

Regarding Sashiko's feedback: It doesn't understand that the byte order
is swapped in the regmap write function. THis is a false positive.

Thanks,
Guenter

> +					  set_mask);
> +
>   	return regmap_update_bits(data->regmap, LM75_REG_CONF,
>   				  clr_mask | set_mask | LM75_SHUTDOWN, set_mask);
>   }
> @@ -486,6 +514,13 @@ static int lm75_update_interval(struct device *dev, long val)
>   		if (data->params->resolutions)
>   			data->resolution = data->params->resolutions[index];
>   		break;
> +	case nct7715:
> +		err = lm75_write_config(data, nct7715_sample_set_masks[index],
> +					NCT7715_CONFIG_CONVERSION_RATE_MASK);
> +		if (err)
> +			return err;
> +		data->sample_time = data->params->sample_times[index];
> +		break;
>   	case tmp112:
>   	case as6200:
>   		err = regmap_update_bits(data->regmap, LM75_REG_CONF,
> @@ -770,7 +805,7 @@ static int lm75_generic_probe(struct device *dev, const char *name,
>   	data->orig_conf = status;
>   
>   	/* Enforce polarity active-low (default) or active-high (devicetree) */
> -	if (!data->params->config_reg_16bits)
> +	if (!data->params->config_reg_16bits || data->kind == nct7715)
>   		pol_mask = LM75_ALERT_POLARITY_HIGH_8_BIT;
>   	else
>   		pol_mask = LM75_ALERT_POLARITY_HIGH_16_BIT;
> @@ -848,6 +883,7 @@ static const struct i2c_device_id lm75_i2c_ids[] = {
>   	{ .name = "max31725", .driver_data = max31725 },
>   	{ .name = "max31726", .driver_data = max31725 },
>   	{ .name = "mcp980x", .driver_data = mcp980x },
> +	{ .name = "nct7715", .driver_data = nct7715 },
>   	{ .name = "p3t1750", .driver_data = p3t1750 },
>   	{ .name = "p3t1755", .driver_data = p3t1755 },
>   	{ .name = "pct2075", .driver_data = pct2075 },
> @@ -972,6 +1008,10 @@ static const struct of_device_id lm75_of_match[] = {
>   		.compatible = "nxp,pct2075",
>   		.data = (void *)pct2075
>   	},
> +	{
> +		.compatible = "nuvoton,nct7715",
> +		.data = (void *)nct7715
> +	},
>   	{
>   		.compatible = "st,stds75",
>   		.data = (void *)stds75
> @@ -1129,13 +1169,21 @@ static int lm75_suspend(struct device *dev)
>   {
>   	struct lm75_data *data = dev_get_drvdata(dev);
>   
> -	return regmap_update_bits(data->regmap, LM75_REG_CONF, LM75_SHUTDOWN, LM75_SHUTDOWN);
> +	if (data->kind == nct7715)
> +		return regmap_update_bits(data->regmap, LM75_REG_CONF,
> +					  NCT7715_CONFIG_SHUTDOWN,
> +					  NCT7715_CONFIG_SHUTDOWN);
> +	return regmap_update_bits(data->regmap, LM75_REG_CONF,
> +				  LM75_SHUTDOWN, LM75_SHUTDOWN);
>   }
>   
>   static int lm75_resume(struct device *dev)
>   {
>   	struct lm75_data *data = dev_get_drvdata(dev);
>   
> +	if (data->kind == nct7715)
> +		return regmap_update_bits(data->regmap, LM75_REG_CONF,
> +					  NCT7715_CONFIG_SHUTDOWN, 0);
>   	return regmap_update_bits(data->regmap, LM75_REG_CONF, LM75_SHUTDOWN, 0);
>   }
>   

