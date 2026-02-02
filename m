Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA4E376BD0
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Feb 2026 15:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770045534; cv=none; b=cucYSFzM5QFMcLXMxLTeZQAC25ZMNoZF9ho2Eu1gxcY0wIkMMKnSgme3Ry87MwEDsCQQGnpCdvn4j8xgSNDt6JhRYEptJKlqKI0cG2x+weSpN1Rfet3s3D8jRHJh4LoyN5+Sxhvy5WydZATU6rEYtL9i1lWfpCYeG3oePz2s8ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770045534; c=relaxed/simple;
	bh=+zjYskbMXQnNft8MzUReBiuObT6dy/7vTEvHmUyjvOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SakNUIniVRRnSBHLyoTKHgrvMzkutFP5+DSJm8dWdPDK3WmIBvjFlOwDp5Z61wnVSqQxmkiujwO7TGCq215U6lvP5YPOI055DsWYyQN/+vlVpGWN4Bb5Zw8Rbq2M62a+ZtkbGn6Y3SY5bFLxCMhS/NDvrBqDah2iUjDjDJyVmnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ToBMxOku; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ToBMxOku"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2b704f08e73so2408929eec.1
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Feb 2026 07:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770045531; x=1770650331; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=LDCiY8TG5eNaEr/sCWKc9Mka+bVdBZQpMlZxy/9XJA8=;
        b=ToBMxOkuVzGfBrX5nWH2p37x/3mhnhtyqsGympfGfzf9SIICPX6yGfAQuG9OcTAULu
         2goEmrzZTx6b5327A55uKhWzthC0m8Es8hsLJiZNr52mumt8rATpzuNthK9AuwuUo4yY
         Rgrrnqz+K0YRQC5Wbg6SGF66enzUgatwAgLnGcbERVzA0SIT+BuPVG1+4w1rjvtybuSe
         629QoObirAqMY02dB3uYhxGEXCoUkl1uFFQLSDBvnjCbD3vhMim6WEkQ6+48NiFbn1JI
         ngT1wq7V7RJ14hT3dU36BwmQmD1VMIk3WERh1XK0KBqi42lE20L/DVNTF3h4zX83Jj/R
         BfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770045531; x=1770650331;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LDCiY8TG5eNaEr/sCWKc9Mka+bVdBZQpMlZxy/9XJA8=;
        b=h0YFnlwrTooMdxZggj8EpTy5KIxfi6RwY+0nLNNROSYPhwEpbLzVqWb/R/Cnhb+QeD
         g60bX4K/iY48OWg9itz8vM1vU/s63I2hWVV2sVEm440p/w0z8cbHFoDARxKyAF5j7GRx
         sJVmAzUUYYpukJgrpNR6SCkCwaI7opsxcQ3dRkyOAGukCIFsHrG3SawB1ThzZ8J16Hs6
         RxdQCdBffm34DjkOOjFQ1IJ9TmyTzOXoagkXwpcPx40mWRj5d0W5800IfL9G0TT9jpQf
         N17JY+0+CopTLvoUYhu9SaVBslPErsLh2s+flXeol8B4CbHIczxMiYYXzNuMm3TcdntT
         Rxzw==
X-Forwarded-Encrypted: i=1; AJvYcCXyInv8t3/n6Pi00JPtV53TlhjZtgTQYfkrSaZDJLYi9C75l/GpixDYS9phmkew1d3XEKmGLZ9bzM1dtg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYb+17ZDGyiv6LQMtEU1fXIphr0Gg8BvQJZKxtMYj6tIannnw7
	Mtp1ng/R47sjB+YvKXt4T2QAfrqogvIjZDTbro9CtiyJj+4ZsuAQDSVw
X-Gm-Gg: AZuq6aK1F7pJuGxnJkiFJql3okUBTjbUvHP/ARr4Us1UAqlfpgU+hr3bnwoIAgTg3k8
	8atRa7YkF/RGkZ8mnk9YE7rPfskmMot0wFBGofJF0AWci5dGxnJgHOK93ctPqO3zhkiEJ9+Foue
	sR0MJj8qdhfshn4b1zJQsB9MIFsTERBSIkpL7yyGCoTCBpzORCYEXvI7PqBQ0uYQ65x94dDmPjU
	GQ4LnguRyzr2TML3Lwyuj+msX/4uTBPB9wtoA1PhCfD2/fqHvFgdMmZdM6k259EKd4ucCUwg0yt
	0yoZruLLM9MP9UqdcovXAlWDnOcBaTcax5S4dhOkXFx6t7duvfDnNemcUFi6JSAlmcu48riM9Ai
	/znSb+5Vos1GwopLYmvk9Y8mPEFh8HdWA0CAO+9LQ54s7U/4ZefsZoYCI0VZ6pQlwjHVHnwOK4r
	QFsDKA7DhUfw+jMGw3SVPpnQ9HHbS6O/VSWm6ZQ64t2einHF8mO3+uXP0RYJrt
X-Received: by 2002:a05:7300:8b24:b0:2b7:c00a:f733 with SMTP id 5a478bee46e88-2b7c923a06bmr4612479eec.5.1770045529575;
        Mon, 02 Feb 2026 07:18:49 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1adef97sm19943163eec.29.2026.02.02.07.18.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 07:18:48 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c5e1aaeb-d832-44ac-ba19-77f162b4f31d@roeck-us.net>
Date: Mon, 2 Feb 2026 07:18:47 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] hwmon: add support for MCP998X
To: Victor.Duicu@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, corbet@lwn.net
Cc: Marius.Cristea@microchip.com, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260127151823.9728-1-victor.duicu@microchip.com>
 <20260127151823.9728-3-victor.duicu@microchip.com>
 <491bd9ec-d6b7-4f1a-877b-67ffbc658ba8@roeck-us.net>
 <da5b2f992a430d30efb558502aec7dc6f6769b0d.camel@microchip.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <da5b2f992a430d30efb558502aec7dc6f6769b0d.camel@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/2/26 00:15, Victor.Duicu@microchip.com wrote:
> Hi Guenter,
> 
> 
>>> +static int mcp9982_read_limit(struct mcp9982_priv *priv, u8
>>> address, long *val)
>>> +{
>>> +     unsigned int limit, reg_high, reg_low;
>>> +     int ret;
>>> +
>>> +     switch (address) {
>>> +     case MCP9982_INTERNAL_HIGH_LIMIT_ADDR:
>>> +     case MCP9982_INTERNAL_LOW_LIMIT_ADDR:
>>> +     case MCP9982_THERM_LIMIT_ADDR(0):
>>> +     case MCP9982_THERM_LIMIT_ADDR(1):
>>> +     case MCP9982_THERM_LIMIT_ADDR(2):
>>> +     case MCP9982_THERM_LIMIT_ADDR(3):
>>> +     case MCP9982_THERM_LIMIT_ADDR(4):
>>> +             ret = regmap_read(priv->regmap, address, &limit);
>>> +             if (ret)
>>> +                     return ret;
>>> +
>>> +             *val = limit & 0xFF;
>>> +             *val = (*val - MCP9982_OFFSET) * 1000;
>>> +
>>> +             return 0;
>>> +     case MCP9982_EXT_HIGH_LIMIT_ADDR(1):
>>> +     case MCP9982_EXT_HIGH_LIMIT_ADDR(2):
>>> +     case MCP9982_EXT_HIGH_LIMIT_ADDR(3):
>>> +     case MCP9982_EXT_HIGH_LIMIT_ADDR(4):
>>> +     case MCP9982_EXT_LOW_LIMIT_ADDR(1):
>>> +     case MCP9982_EXT_LOW_LIMIT_ADDR(2):
>>> +     case MCP9982_EXT_LOW_LIMIT_ADDR(3):
>>> +     case MCP9982_EXT_LOW_LIMIT_ADDR(4):
>>> +             /*
>>> +              * The register address determines whether a single
>>> byte or
>>> +              * multiple byte (block) operation is run. For a
>>> single byte
>>> +              * operation, the MSB of the register address is set
>>> to "0".
>>> +              * For a multiple byte operation, it is set to "1".
>>> The addresses
>>> +              * quoted in the register map and throughout the data
>>> sheet assume
>>> +              * single byte operation. For multiple byte
>>> operations, the user
>>> +              * must set the MSB of each register address to "1".
>>> +              */
>>> +             ret = regmap_read(priv->regmap, address, &reg_high);
>>> +             if (ret)
>>> +                     return ret;
>>> +
>>> +             ret = regmap_read(priv->regmap, address + 1,
>>> &reg_low);
>>> +             if (ret)
>>> +                     return ret;
>>> +
>> Consider using regmap_bulk_read().
> 
>    The MCP998X family is designed so that block reading is allowed only
> on the dedicated temperature and memory blocks. Reading from
> those memory areas uses the SMBus protocol, which returns count
> and the data. From any other memory region, reading only one byte
> is allowed. This behavior is described in the documentation at page 26.
> 
>    In V2 patch, block reading was used in this function, however this
> was an exploit. After reading one byte the chip returns NACK to finish
> the read, that will force the Linux driver to issue another 1 byte read
> for the second byte, which will return the value and stop.
>    For the addresses 0x00 to 0x09 (temperature registers) the chip will
> not return NACK after the first byte, it will just go to sleep and
> return invalid data 0xff. That was a design choice to be backwards
> compatible with older parts.
> 
This warrants a comment in the code. Others won't know and might send
a patch to "fix" the code.

> ...
> 
>>>
>>> +             switch (attr) {
>>> +             case hwmon_temp_input:
>>> +                     /*
>>> +                      * The chips support block reading only on
>>> the temperature and
>>> +                      * status memory blocks. The driver uses only
>>> individual read commands.
>>> +                      */
>>> +                     ret = regmap_read(priv->regmap,
>>> MCP9982_HIGH_BYTE_ADDR(channel), &reg_high);
>>> +                     if (ret)
>>> +                             return ret;
>>> +
>>> +                     ret = regmap_read(priv->regmap,
>>> MCP9982_HIGH_BYTE_ADDR(channel) + 1,
>>> +                                       &reg_low);
>>> +                     if (ret)
>>> +                             return ret;
>>> +
>>
>> Consider using regmap_bulk_read().
> 
>    In V2 patch, block reading was used to read the temperatures from the
> dedicated memory. However, the operation would use SMBus protocol
> and return count alongside the data.
> 
>    Regmap_bulk_read() in this context uses SMBus protocol, while in the
> context of reading the temperature limits uses I2C protocol(and is an
> invalid request).
> 
>    In order to avoid having one function with multiple behaviors and
> to keep the driver more generic all block reads were removed.
> 
As above.

> 
>>> +                     *val = ((reg_high << 8) + reg_low) >> 5;
>>> +                     *val = (*val - (MCP9982_OFFSET << 3)) * 125;
>>> +
>>> +                     return 0;
>>> +             case hwmon_temp_max:
>>> +                     if (channel)
>>> +                             addr =
>>> MCP9982_EXT_HIGH_LIMIT_ADDR(channel);
>>> +                     else
>>> +                             addr =
>>> MCP9982_INTERNAL_HIGH_LIMIT_ADDR;
>>> +
>>> +                     return mcp9982_read_limit(priv, addr, val);
>>> +             case hwmon_temp_max_alarm:
>>> +                     *val = regmap_test_bits(priv->regmap,
>>> MCP9982_HIGH_LIMIT_STATUS_ADDR,
>>> +                                             BIT(channel));
>>> +                     if (*val < 0)
>>> +                             return *val;
>>> +
>>> +                     return 0;
>>> +             case hwmon_temp_max_hyst:
>>> +                     if (channel)
>>> +                             addr =
>>> MCP9982_EXT_HIGH_LIMIT_ADDR(channel);
>>> +                     else
>>> +                             addr =
>>> MCP9982_INTERNAL_HIGH_LIMIT_ADDR;
>>> +                     ret = mcp9982_read_limit(priv, addr, val);
>>> +                     if (ret)
>>> +                             return ret;
>>> +
>>> +                     ret = regmap_read(priv->regmap,
>>> MCP9982_HYS_ADDR, &hyst);
>>> +                     if (ret)
>>> +                             return ret;
>>> +
>>> +                     *val -= (hyst & 0xFF) * 1000;
>>
>> What is the mask for ? The chip registers are 8 bit wide.
>>
>>> +                     *val = clamp_val(*val, -64000, 191875);
>>
>> Clamping on reads is highly unusual. Why is this needed ?
> 
>    There are instances when the hysteresis limit could be outside
> the range of temperatures.
> 
>    For example, if the high limit is set to -45000 and the hysteresis
> is set to 20000, the high limit hysteresis is -65000 which is outside
> the range of supported temperatures.
> 
>    The hysteresis is set related to the critical temperature (that is
> higher then the "high limit") but it will be applied also to the "high
> temperature". In this case the hysteresis is valid for critical but it
> will be out of range for the "high temp".
> 
"Supported" is irrelevant. Question is what is written into and reported by
the chip. It may be "out of range", but the value is still written into
the chip. So the question is: How does the chip react to the "out of range"
values ? I suspect that it technically still works, even if the value is not
officially supported. That should be reflected in the reported values.
More specifically, if setting the hysteresis in your example to 19000
instead of 20000 triggers a different response from the chip, that needs
to be reflected in the reported values.

Guenter

