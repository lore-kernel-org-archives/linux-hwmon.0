Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E773806C5
	for <linux-hwmon@vger.kernel.org>; Sat,  2 May 2026 14:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777733119; cv=none; b=u0s7Wb2orINDyzSKzQTBlXpNnWzrUF0Zbjoxrlc8agWckHHaKcXh7/wAXiR7qPp6GRHngeA1SS1XgyYrAd5EfM0At/jI/pKn3P84g7JBJBrrO/H7EmHsmTVHstO+jRQBJsU7Oqxb4bPObXzeBrcoXZ6VkRa7oa08hzEve8kMiNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777733119; c=relaxed/simple;
	bh=iUtmapK7QV5nJmIfvVrcUOFHur8U2L6UftUm2xkVzI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HCohrKseOOah/epcnSF5yAQ2LZRs2qMZAADBzFWqPg0SmuRNOJevpx2+3IkachCeyBGDi00HyeXF8h3PSXx4qkCXvr8yUwS6ukQnBjuTCixAyM9VJBP6c63pNnP5b2gjYIg1f5wQlwq4ZSmL+yECyxioszY/Rr0+999izIt+sB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZ0e4ueQ; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZ0e4ueQ"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2f0ad52830cso230642eec.1
        for <linux-hwmon@vger.kernel.org>; Sat, 02 May 2026 07:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777733115; x=1778337915; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=FyNr5N1YI1qjFmBeSOebvm0biXvEYdfui3Rfp9RSI5o=;
        b=lZ0e4ueQ4cDVlCkhrSyaACr9JhF5gAEDDs0VmWs8FP6CHJuBsBC2aPeLXnWOrAksKt
         V1yWiyxrI1uhpnvtpS2U0IYeUoaTyEGad9vtpknTpSunlotp28Ro/30IWmOcIMoDMwzJ
         CLCqbA4rwB/2vHtzR/zjMyr28aaE2AK0U9D/uEZ4FKixDi0s2igQcCPhHi89TBEd63lB
         ubT89Ou9OIjQ02+iqjfM00z5eCu4ARrdLuqAu7aMtjOa4PaJrOfvqwpQYS/VYsyj41x3
         hu+jioHjdbESxFwDFW7e5VYsRG8qAqfGAiFnwSwjOSMX6IBMo8+8UxuzWM30v9mXYcNr
         cYCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777733115; x=1778337915;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FyNr5N1YI1qjFmBeSOebvm0biXvEYdfui3Rfp9RSI5o=;
        b=etYWV52wCi59cE1Zf4zDbUsD4FPYKmrtQxIpU8t9aUwCjWTuHVFnVseYGxVCx5ksMs
         SMdCskNWdiVi7gXHB/yq7At66w3bDVQz88SuD6QSxX71oT3/YADXuY2pYZog2qKS33N2
         oS1yYcLz5G5YCMwwPtkRF0UuzOKthsq9oeaBnAhqi6hMaWgQOcxJUGxgMTAfshapDKTK
         olOF+xGBD/QNdDyDegkTDH8HqoEh23A+lM+tt+zMZMj2yc9WovVGJtpenj20vohuT53C
         VRrFclePjJjkvsEmD4VZNKIcW/me1x+kn/2aKiFwhG4tVoECCIWL/PvZ8NaJLRz5w/JR
         /A3w==
X-Gm-Message-State: AOJu0YzXlU2YZiQHetZ1WsjSnW4+6Fd7xS3IXfFwv0dL9vpP/MnyBM+P
	bdd/WaJBlD2fNiNNovGojHO7mdL5nLQp9HNb4JzJHLZ5F4nmaIl0ie8T
X-Gm-Gg: AeBDieuxmIGdIRMkuFreffx69nk9UEDQhEA98FmEsXzvF0S2DDhl2kU2LuW05xUUWHq
	AdkHBuXtBk6YD1EqqrIPOz5nn6Efy7xknOkxqA4Gdb/I1U2pVx6lddBXGwFtqSqaSIX/OfHnH6p
	rJak6Q9F4Ho7IF0/YtoYW6z8PEX3+4NnIRhM6ybttirxZZBNMDYrMydmNPQKpdCmdyyxf2iBI9R
	jIUU/zcdMu8HN27JYd96D5JNZK+EFRvRjNViy7N9wp0JntrugrCSbvLYGllEWIqOwsqua6x3Fyv
	Y4CTfbjn4hqqhNLXLSQyyNhasV+dytpJWPFeg9wAJTLr+x3oBNGbpvHAY9Pp9urywhogAbWnnrr
	kqLK6468Fo0fcij+tM9UwYXGHmeaGD0El1WExucLJ2YbLGpmMUiGJDDeGK0taMCs45zCsEkFj9h
	WB+GOkbZsnOZGeJIBoIwCntP5Ls2zpoH24w7YDPCTceU36sPhA0AC3GiFUuGTumQKYtTOxaGuVe
	9Oqa+nJs/g=
X-Received: by 2002:a05:7300:6c2b:b0:2ed:a64:a457 with SMTP id 5a478bee46e88-2efb9c85886mr1618540eec.20.1777733115325;
        Sat, 02 May 2026 07:45:15 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee38e71cedsm10308108eec.9.2026.05.02.07.45.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2026 07:45:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8928c046-69fa-4578-9a7d-87b98fc7c5a2@roeck-us.net>
Date: Sat, 2 May 2026 07:45:12 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hwmon: (lm75) Fix AS6200 setup and alarm handling
To: sashiko@lists.linux.dev, Markus Stockhausen <markus.stockhausen@gmx.de>
Cc: linux-hwmon@vger.kernel.org
References: <20260502094524.3358193-2-markus.stockhausen@gmx.de>
 <20260502101009.DFDF8C19425@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260502101009.DFDF8C19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/2/26 03:10, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The updated set_mask of 0x10C0 is byte-swapped over I2C and will force the sensor into single-shot mode instead of the intended continuous mode.
> - [High] The new alarm reporting logic is mathematically inverted, violating the hwmon ABI by returning 0 during an active alarm.
> --
> 
> commit bef39cd430ab022cea5921c7c9e935e0fe939e92
> Author: Markus Stockhausen <markus.stockhausen@gmx.de>
> 
> hwmon: (lm75) Fix AS6200 setup and alarm handling
> 
> This commit attempts to fix the AS6200 initialization by changing the set
> mask to enable continuous conversion mode. It also modifies the alarm
> handling logic with the intention of correctly reporting alarms regardless
> of the configured polarity.
> 
>> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
>> index f1a1e5b888f6..4fd4288ae502 100644
>> --- a/drivers/hwmon/lm75.c
>> +++ b/drivers/hwmon/lm75.c
>> @@ -137,7 +137,7 @@ static const struct lm75_params device_params[] = {
>>   	},
>>   	[as6200] = {
>>   		.config_reg_16bits = true,
>> -		.set_mask = 0x94C0,	/* 8 sample/s, 4 CF, positive polarity */
>> +		.set_mask = 0x10C0,	/* 8 sample/s, 4 CF */
> 
> The intent described in the commit message is to clear bit 15 to disable
> single-shot mode. However, won't this new mask still force the sensor into
> single-shot mode over the wire?
> 
> The LM75 driver writes LM75_REG_CONF using i2c_smbus_write_word_data(),
> which transmits data in little-endian order. The AS6200 is a big-endian I2C
> sensor. When 0x10C0 is transmitted, the lower byte (0xC0) is sent first and
> interpreted by the device as the MSB. Since 0xC0 is 11000000 in binary,
> bit 15 remains set to 1.
> 

... except for the config register, which is little endian, and the first
byte sent to the chip is the LSB. No idea how to tell that to the agent.

Either case, I ended up ordering an evaluation board for as6200 and samples
for TMP112, so we'll see how this works for real once I get that.

> [ ... ]
> 
>> @@ -416,7 +416,7 @@ static int lm75_read(struct device *dev, enum hwmon_sensor_types type,
>>   			switch (data->kind) {
>>   			case as6200:
>>   			case tmp112:
>> -				*val = (regval >> 13) & 0x1;
>> +				*val = !!(regval & BIT(13)) ^ !!(regval & BIT(2));
> 
> Does this logic correctly map to the hwmon ABI, which expects a value of 1
> during an active alarm?
> 
> According to the sensor datasheets, the AL bit reflects the ALERT pin
> directly.
> 
> If POL=0 (active low), the pin is low on alarm (AL=0), so 0 ^ 0 = 0.
> If POL=1 (active high), the pin is high on alarm (AL=1), so 1 ^ 1 = 0.
> 
> In both cases, it appears this expression evaluates to 0 during an active
> alarm and 1 during normal operation, inverting the expected hwmon behavior.
> 

I had another look at the datasheet. Turns out the agent is correct. The
bits must be _different_ for the alarm to be active. So this has to be
something like
	!!(regval & BIT(13)) != !!(regval & BIT(2));

Sorry for that.

> Additionally, does hardcoding BIT(13) and BIT(2) solidify an underlying
> I2C byte-swapping behavior directly into the logic rather than fixing the
> root cause?
> 
We can live with that.

Thanks,
Guenter

