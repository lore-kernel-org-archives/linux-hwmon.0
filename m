Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E7A1DDC38
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 00:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785199890; cv=none; b=Otiqun4mc3t+SYlRfsHkVUDwzkeRbmlTAi8CbZCakIvKeNwqai85AIWdpsATQzv8pb0TsMNj/PU7vBCcKTRdj4z2Cm13F9le9Zff8wu7IajgCWpT/ika6w8+ltlpbYi7HMaYjzGkdr4s0aFvo/sbvbHqpf+4yX4kAtWfxPMa8Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785199890; c=relaxed/simple;
	bh=b1Ivrwj22FHzLcJZebe6x3otpghXibwnvFRqYvxUB3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lCnRT5EIq3hRrRT5zClf43eeGffVcLKL7Cjm1mkrID1HF0Ch0QuqJJhWyoZCY74u66II2E9l2bsmZmApn//sP02NfLC/+Vg45YNLaRpXK6KUTATn6oJIHfeazAEbNhBLA8H36coUQ56BC53Eu65c7O5Yx1dUS14o6DjXri16nlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hVrUf3uV; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hVrUf3uV"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cf52d15d88so33341365ad.2
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 17:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785199888; x=1785804688; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nam8l6axy2h78CqVoqZCfhqM8wwxiLPgIAvV15KVPWo=;
        b=hVrUf3uVrg/zpnkP9qEqFwGIxs3GnoZJdxVMBL8rotHK/87ojQhhp9R2/9DZPUXbV+
         3cyUcosukL3R2sezS9r8wY/R4g4fpZm6d7srM9aM03c1KDEXKrWOdQuOxuunZ6R/eBPY
         pVAUIX3WjFYKSL/kLB4eVNMhzPeFl480CenHlHKbFRyZespS4f3VBrJ6XJQRHyy9rreP
         QFyT1uFE9B+pGxLGIbHn51G3PVzR9xX1ImEKKVkmOAnqFYsg3AETh9qCassPx79OJc2e
         Vun9CB6omkmvH2a0cIz9YhrRap6EIdbF7vk01U9nhJg72aM4lMpftGGZykMl1LqWIufS
         4zsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785199888; x=1785804688;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Nam8l6axy2h78CqVoqZCfhqM8wwxiLPgIAvV15KVPWo=;
        b=q5MxoDF80oBCOvRa0fA5sBNBTBJgQ9iAViwy+lQSwz430fSuLEAAJXymfr8AdsJuXc
         /U0mnr85oI34Xu48vGKX3O9qMxKdxrLxzrQEqwbWQMSww2gjXwAcFdmCNqeOJT9KpmBU
         QVFRBBJcRG+MWDnwQAyCO6gzE/AxdVNwg8sWQkwMOFFvOhvR5GpTL7o9IwiK1FH9U7t4
         ytXyTbudv1MhrBrryFxxkXEIWuDMHJ5nAeFRKLrYhrRA+/WR038M+nzMfJIUv4qi/XBC
         LF01+eeRIq8Ach+e2cCg5la52CDbo7iBPHVoKzz3fpjHUvCjklBw6Q5KY8/U/ASc6rtZ
         EK2Q==
X-Gm-Message-State: AOJu0Yx8MDpGOAlfcrDpoV4g1pwl0OskCi5tL91g7oJScefCDhlCH5uJ
	PRsVxNrMdqSoJe3/5P4KgUZh0W/1px2I2+PJ9gvxlC8CY6yiHBOLyonm
X-Gm-Gg: AR+sD12BP33QMNwS6MbNgLvXF5u8ZWePkBq7rybljoU4fXMpH8ZGkYT50GJai+4COCH
	TkTaVnkmaKWYptuHclqnWzxhZLSBXYQDCCJ85hh663eYZqvJpNn8WIAYR9udVWkqZJoWz6pc6O5
	w2cynH0R6RRcf9VWGGI0eXmWtr+f0GU9DYQUKRGRaUBkBgKewv/8jzvhcVjayRvmgoznxcxjf3N
	+mEK7ts06bzkKD+yZtwc8k9zKmMLsfaX1InRcWRc1BcHEylfMWh01w8SlNJSJbMidg16fH+HtP7
	eC2LlL5waVvkJATp/u/1/P7GIRry+umQOoEklNk6I4G+tMX6iQCI9xnUXAdECgIiS1rj1QiIP+U
	LJgunti29ggKs7vIpAph0H8M2q/mnabI1ce9Oj3K6K3TXrgsfSAnVTJbfWZfpRci0jj/8R4ONTU
	WbLP35qT5GGeoslJ8/C1HUFoZiHOSrKQES8GEYqoeugATyEdvq46GQUHm7t1H4eZ5TdIRVwTUk1
	ZFgo6vd/+fHC9wHq8ndQgzayHHLcyOBTlYWHQ==
X-Received: by 2002:a17:903:3b8e:b0:2bf:7b62:a038 with SMTP id d9443c01a7336-2d015ac543dmr2437515ad.9.1785199888270;
        Mon, 27 Jul 2026 17:51:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bbda1sm42349005ad.53.2026.07.27.17.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 17:51:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <206f2070-35d8-4b77-96ef-3e9c4edd582d@roeck-us.net>
Date: Mon, 27 Jul 2026 17:51:26 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [hwmon PATCH v2 6/8] hwmon: (adt7470) Use cached PWM frequency
 value
To: sashiko-reviews@lists.linux.dev,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260727-adt7470_fixes-v2-0-598e38a46ba6@gmail.com>
 <20260727-adt7470_fixes-v2-6-598e38a46ba6@gmail.com>
 <20260728003605.958621F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260728003605.958621F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/27/26 17:36, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] A partial register write failure in pwm1_freq_set leaves the cached pwm_freq permanently out of sync with the actual hardware state.
> --
> 

I don't know a good way of fixing this. If this error condition really
happens, the chip is in bad shape either case. Trying to write the old
value into the first register might fail as well, and then what ?

Ok to leave it alone.

Guenter

> --- Patch [6]: [hwmon PATCH v2 6/8] hwmon: (adt7470) Use cached PWM frequency value ---
> commit 3b9b6b91fb202f2983f66278540c1017bb53f4e6
> Author: Luiz Angelo Daros de Luca <luizluca@gmail.com>
> 
> hwmon: (adt7470) Use cached PWM frequency value
> 
> This commit updates the ADT7470 driver to use a cached PWM frequency
> value instead of querying the hardware on each read. The cache is
> initialized during probe and updated after a successful write operation
> to prevent exposing negative error codes through sysfs if a read fails.
> 
>> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
>> index c6fc7d38d698c..1fbca4869b7b6 100644
>> --- a/drivers/hwmon/adt7470.c
>> +++ b/drivers/hwmon/adt7470.c
> 
> [ ... ]
> 
>> @@ -832,6 +835,10 @@ static int pwm1_freq_set(struct device *dev, long freq)
>>   	err = regmap_update_bits(data->regmap, ADT7470_REG_CFG_2,
>>   				 ADT7470_FREQ_MASK,
>>   				 index << ADT7470_FREQ_SHIFT);
>> +	if (err < 0)
>> +		goto out;
>> +
>> +	data->pwm_freq = closest_freq;
>>   out:
>>   	mutex_unlock(&data->lock);
> 
> [Severity: Medium]
> Does this leave the cached pwm_freq out of sync with the hardware if the
> second register write fails?
> 
> If regmap_update_bits() fails for ADT7470_REG_CFG_2, the function aborts
> and jumps to out without updating data->pwm_freq. However, the first
> register (ADT7470_REG_CFG) may have already been updated successfully right
> above this snippet.
> 
> Because adt7470_pwm_read() now relies solely on this cache instead of
> reading the hardware, sysfs reads will permanently return the old frequency
> value even though the hardware might be operating in a mixed frequency
> state.
> 

