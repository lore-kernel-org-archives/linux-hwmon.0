Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B47B501F30
	for <linux-hwmon@vger.kernel.org>; Mon,  7 Sep 2026 15:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788795003; cv=none; b=XvJjNLOb43PkNIn+l8h7J+AECJwY1e3ZXoaXg1tJYK2KvY4tOocVAznC9WH02ANPdwIKpuUoZJWFNZa0FZG6lrAzn90/I3SBf3VnHgZInw91ceVuGFu6P6g6QFJXpxecKVjrGzo5PyGoUMXbYzZaiKAAxG2oHm8Qulz2yHFj/NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788795003; c=relaxed/simple;
	bh=S70lRGwL7IJR7LYJ6faHRYveVr1c9Y1/m0rz30L8M/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ipbwNA/kct8Y9KxxKUEAr9go4+8UcwICfDcFqaQESB2MmDJ7FM+SWqsdpEUkEKJgShbdxJr+P/fOOrNqHwvrmwcQHSrLsqfx0XKQEGoYked20SisNddFSOsISm3iW4Nhj47B8Xi2g1Dz4nOpydCmMYOmp9Uvr5e88HOeL2qiL/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fpN6ag9/; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fpN6ag9/"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso4683328a91.2
        for <linux-hwmon@vger.kernel.org>; Mon, 07 Sep 2026 08:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788795000; x=1789399800; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a7aV+7HzRQUKnINoH9ptDij7dLbWnd0yAUJ70qIKlwg=;
        b=fpN6ag9/r4D/PojmZlNuRMxKJJc7BwlG7ihR6TFAJxEhl1TvzznB9tgF7K1/BfVrb6
         gd7Bxd2k/GnpvaOUw66O/3hp9Sf2qw2ee9sJW348MnjSIJIHzi5ZhMZzKROpgtEyHDo7
         vPwfc4zetxh5AXIIBKs3ovkdhoEHB2CCC67My9qnIDUkgHmLpWMRf/5kjXQSFcHKJFM4
         ANAjFjayVYSL2n2ovkZs7/lzJH2E4VgaKmrvJBo/FunrYuC2b5OuJqjyV+gk2+f0fAs3
         1KD+t8PcormbrEjgJCLK/fSjh0Lt8VP4EYkeESiOlbX83b6O8fUFR89w4it/n5MkScWh
         TwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788795000; x=1789399800;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a7aV+7HzRQUKnINoH9ptDij7dLbWnd0yAUJ70qIKlwg=;
        b=hUBBUDtMPilxxjriFx1tha/zFrzH5CD4VPs0S/kxd6SN1KqSzwmToaK61es0mvkunf
         2B7ui8DcB9eQe4ljMARoBVMbqYCOtvlb1y4Ee0HlNkTdS+0qzpK8cy9mVhlN5T2fKyJt
         SJmszQFVoPttVDl18/BZ5vJJx4X2/2eCt7GkX0F4+xjbd7pmWMttH0mYzil5W3qIcsGo
         MSkr6sGpFpToDCiLjT0O3zGmfhHJShkeo6fNrdrmkuZ4b/3HQ4pAVDOMwzBjw8Ocnu4s
         YEjd+6vf3Q4hWtj0vifmcYAyLjptIDooSWT22g627avjcoHltPkzEebPG4p31niB1nXi
         HDig==
X-Forwarded-Encrypted: i=1; AKwUvBzGsfQ74F4/gPahPjvrvoln2A4RuFEDP70l1zWogeMO9Q+rCWJjSDHt/RoVng4WgAbLwrA09VkIyKR4ng==@vger.kernel.org
X-Gm-Message-State: AFuF++nMeO76noWAzPL2U1aj430rAbThb6NXmcbV/GnaH4O8yYi9jYY3
	j8QxXAzqcPv4qb8yi8WA+WCZigkH2eSvzfWzYh4xN2k9oqk9NHDxi/d+
X-Gm-Gg: AYBFou0FAxw1aSIK7kEbXXB2+1vzMu1hBdQ1FGZXJ/WMIF1urMn7CSkuk/R10Y7wN4N
	BS8OS4+jKsexJ/D+suGY4u2iw5vBktEJobv01LrhupO0Bc7aYFslVqblXJA/QSxRRjLjuB0jCo0
	JjHazjqpRgnHiC5I9Ttnohob026X1OqETHAvSPWp/Q9QsfEKYiQBXVSHaUsQqCrfoKd4eBzZvtj
	OFXmQqlR74hS2OVe3jKt5H2tcBFvjq/C3e0rpQoMBFkC9bC9aWcvdD8t+Ue5OcuwkzxmMWtiOIi
	jEn1xM/L5j2O53WTmIJuXsMrMYRFm7Iagb/8TMGgDvjAAPA3Njrf2ayxbybqoi1kPkhIPdxHIi3
	AkyaQuDHbbFRLt9wlegWczEscRt9OAyF2zJ8sRaYGvXcshRIZxiSkV9sKJ6KF8FtqH99YI7dmiO
	MZK1U2AJH5rRv3Jnkoi3cmKZ4uu6nXpoiBTLh4honH4pE2unTy+T86ye4WytPq8prPpQndvycBT
	5ji2sHDutF/ApJfaU7yiAj408mFLIlZyEPWdA==
X-Received: by 2002:a17:90b:544b:b0:38a:c3f:3b87 with SMTP id 98e67ed59e1d1-39b261e3b72mr35111626a91.12.1788795000428;
        Mon, 07 Sep 2026 08:30:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a62be87sm25099360eec.6.2026.09.07.08.29.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 08:29:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c1f812d6-9938-494f-ae37-e250434a25f7@roeck-us.net>
Date: Mon, 7 Sep 2026 08:29:57 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] hwmon: (lm75) Add support for Nuvoton NCT7715
To: hsyemail2@gmail.com, linux-hwmon@vger.kernel.org
Cc: Sheng-Yuan Huang <syhuang3@nuvoton.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Jean Delvare <jdelvare@suse.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260907080831.11281-1-syhuang3@nuvoton.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260907080831.11281-1-syhuang3@nuvoton.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/7/26 01:08, hsyemail2@gmail.com wrote:
> From: Sheng-Yuan Huang <syhuang3@nuvoton.com>
> 
> The Nuvoton NCT7715 is compatible with the LM75 temperature and
> limit register layout, but its 16-bit configuration register is
> transmitted most-significant byte first. Add support for the NCT7715,
> including byte-swapped SMBus accesses for its configuration register.
> 
> Handle its conversion-rate field and shutdown bit separately, since
> their bit positions differ from the standard LM75 layout.
> 
I don't think so. See below.

> Signed-off-by: Sheng-Yuan Huang <syhuang3@nuvoton.com>
> ---
>   .../devicetree/bindings/hwmon/lm75.yaml       |  1 +
>   Documentation/hwmon/lm75.rst                  |  6 ++
>   drivers/hwmon/lm75.c                          | 57 ++++++++++++++++++-
>   3 files changed, 62 insertions(+), 2 deletions(-)
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
> index 2d2d752aeac9..0b55f6b7c68d 100644
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
> +#define NCT7715_CONFIG_RESOLUTION_12_BIT	GENMASK(14, 13)
> +#define NCT7715_CONFIG_SHUTDOWN			BIT(8)
> +#define NCT7715_CONFIG_CONVERSION_RATE_MASK	GENMASK(7, 6)
> +#define NCT7715_CONFIG_EXTENDED_MODE		BIT(4)
> +#define NCT7715_CONFIG_RATE_0_25HZ		0
> +#define NCT7715_CONFIG_RATE_1HZ			BIT(6)
> +#define NCT7715_CONFIG_RATE_4HZ			BIT(7)
> +#define NCT7715_CONFIG_RATE_8HZ			GENMASK(7, 6)
> +
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
> @@ -609,6 +644,8 @@ static int lm75_i2c_reg_read(void *context, unsigned int reg, unsigned int *val)
>   	if (reg == LM75_REG_CONF) {
>   		if (!data->params->config_reg_16bits)
>   			ret = i2c_smbus_read_byte_data(client, LM75_REG_CONF);
> +		else if (data->kind == nct7715)
> +			ret = i2c_smbus_read_word_swapped(client, LM75_REG_CONF);
>   		else
>   			ret = i2c_smbus_read_word_data(client, LM75_REG_CONF);
>   	} else {
> @@ -628,8 +665,11 @@ static int lm75_i2c_reg_write(void *context, unsigned int reg, unsigned int val)
>   	if (reg == PCT2075_REG_IDLE ||
>   	    (reg == LM75_REG_CONF && !data->params->config_reg_16bits))
>   		return i2c_smbus_write_byte_data(client, reg, val);
> -	else if (reg == LM75_REG_CONF)
> +	else if (reg == LM75_REG_CONF) {
> +		if (data->kind == nct7715)
> +			return i2c_smbus_write_word_swapped(client, reg, val);

This code is double swapping. The calling code swaps (bit settings),
regmap calls this function, where the word is swapped again.

Guenter

