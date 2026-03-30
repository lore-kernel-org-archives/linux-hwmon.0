Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBB3375F69
	for <linux-hwmon@vger.kernel.org>; Mon, 30 Mar 2026 16:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886456; cv=none; b=E66cQTLs6lricfXwdyM6Z2U+AhPYI5LJkZOj5Ae0QSVW+BtA7Mt6S8zN9BnWbpWljneZhhUsIEGQ5n05FYMHawM1RLTf+fwzYTL32hmRXetcCnVSRTF3Pnn1RAHeOsMdVT8NYnqONaoN8dxKSmlLyc7P+efbIdDPsodoWJEqb0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886456; c=relaxed/simple;
	bh=LNZcLcyaESCNa/ERcf8t0QYKBjEpfVGGh7f8a07D+c4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g6XGgoGtXyaGDbUCXA1IoKa20k7FswlVp2d7UPv6WGp72SGslk/bUvuTbMcg//qXYRxBw8CNJ8b9PWd/zNPBt/MJtf7F69fqIEOED6cXjJVKb6QHZRMzZ87yFBXiCw9zoxjwe/GylBPf1UJBwESUGhHJcrAbAfpsH1SVX/i48MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ko8StfhW; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ko8StfhW"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-829a27414a3so2758378b3a.3
        for <linux-hwmon@vger.kernel.org>; Mon, 30 Mar 2026 09:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774886453; x=1775491253; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=wpVAuzUFa0WB0ZNz5sJm2wNE73LaP5n0AkrtCatZ+9M=;
        b=Ko8StfhW6cWAzfH1t0mt3myOdiBJt7yIS6nrgkb5/wknBnBlhraIrgxdwbtGkGm6jb
         0d/5IbArrS+nPw9/9n+umx+SwQE+MrY0Vb2hZbL/votfuDN/dbtQwHLPXp6TNRHX2DPN
         03CN0Apq2ylY/BFmzdE6Nffp7k00phfeX4DqekL3oQ3aBv0WsEj/QwJBBTMlrbk+hmYo
         cSkOyb4ty5ijDdzhQeo9UdqLzej8JRbdcKsM9LjEIY4wWNak0eqN6etEh7kl6tcFko6z
         q45Ae1fStkjbPGAmxKdE3yZKp/PMssqUqREqcs63tPkkIWJNyYKnKL95EJYo1zNaga5s
         ipBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774886453; x=1775491253;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wpVAuzUFa0WB0ZNz5sJm2wNE73LaP5n0AkrtCatZ+9M=;
        b=JDIFRFj2yGSOiZtffDVfOIXK6zNEL83vCOsr3FxD+pPBoBhLUTRtrSFM3gT8bKamG0
         qhyrxbf0m5RvF7hnOxfE9b8vC9q2sa4HnXNeDi2qVxfLBJ2gyNgQcEGg4NLqOeQ4QO+o
         hhNhjbnsLOFimu0RHRey01sChoTm91slXJ1ObWhWfy8kBeoagpTQf6qovLW/gojLCfDl
         5SZ7ZORQ8i2rrZqydUKwx2XKhc9I/ZsEYGGZBtfk5Kh7oBEfsEP70D3x03OZ3Ih26Zkk
         nAlVnmTh5QP5Tem+3Bde29KoeYvmagFvNixBWgqV9y1N6THUr32VzvBQcFqpyXgoAx5U
         SLuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqLshi/rAN6zu1fTLdK++JDyZYEw2RjdGYlfWGX0RytqusZgDFXiaS0GFv3r8RaXPkpA24lWZbyR57SA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGOv1U2GBuCzjQwunhSd4K2lE4WhrbvSDsD6zEM1HLvpDIftpC
	4lb598B+o1CtgzniBbL1qZ3syQG/vV9qAbs7JOqeOCQ48ct0Pxdk3almFa3LIg==
X-Gm-Gg: ATEYQzy20Z4WGHAHHzQ9WMpLoUwkmJ6S8D7lNWToWAmRFHdV4P9ezzHmuITpXc5geq3
	1inqt5mabG6QJfkHt8JAPrZQs1tLgwcgHwRTZcriP/ncnLgz3vPQeIjvhk1ewWNKX7d5ZeKLCEB
	OCdz1bkHIr0y/YN7cAY1SL4SE87x1jeed8SaHaz4a4s/b9o5YvtOl1LIubPgze4Ob6p2EVPZ+Fy
	5IBiUrZacY4R6yfZLwLezAX9e4IDcr1h9E4AhUoNbAfqYRgLT7LZO5Z1baWh0JjV7ZYF80lTjT7
	MJPr2zL2AF3CrpYt8zofElgCXIWG8I12jxir45Hm7DUjZN3Az1tQvTdrOT7M/kcQijymuyFPCLJ
	WByYeS9KDFnQ9xAz3j15pFUVh6bNW7d/jr9nCQeWElvuE3GL3K10JcFmfFK/NUcdp+ko3ckJppS
	JBmLUQ2vof+uhvA0b4F76Oj2PX1ulUsgOV04QSgkg10xqldVkSghbe6iMQmxij1kWoY026sCwa
X-Received: by 2002:a05:6a20:e290:b0:398:71b6:33aa with SMTP id adf61e73a8af0-39c87bc0f52mr13801393637.64.1774886453083;
        Mon, 30 Mar 2026 09:00:53 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76916cf861sm7325614a12.12.2026.03.30.09.00.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 09:00:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <cbd0f2b0-cf23-4e4c-9fb8-f0094d7b723b@roeck-us.net>
Date: Mon, 30 Mar 2026 09:00:49 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/2] hwmon: add support for MCP998X
To: Victor.Duicu@microchip.com
Cc: corbet@lwn.net, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 robh@kernel.org, linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
 linux-doc@vger.kernel.org, conor+dt@kernel.org, Marius.Cristea@microchip.com
References: <20260217-add-mcp9982-hwmon-v10-0-5e0aaae6f289@microchip.com>
 <20260217-add-mcp9982-hwmon-v10-2-5e0aaae6f289@microchip.com>
 <ccda48d0-3b10-4c3c-a632-6f70b54436fb@roeck-us.net>
 <2d3955f5b906018fd7670ed5b8d37eaffa0ec207.camel@microchip.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <2d3955f5b906018fd7670ed5b8d37eaffa0ec207.camel@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/30/26 05:01, Victor.Duicu@microchip.com wrote:
> Hi Guenter,
> 
> ...
> 
>>> +     }
>>> +
>>> +     switch (type) {
>>> +     case hwmon_temp:
>>> +             switch (attr) {
>>> +             case hwmon_temp_input:
>>> +                     /* Block reading from addresses 0x00->0x09 is
>>> not allowed. */
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
>>
>> Reading the 11-bit temperature value involves two separate 8-bit
>> register reads.
>> If the chip updates the temperature between these two reads, the
>> resulting value
>> may be torn. While some chips latch the low byte upon reading the
>> high byte,
>> the driver does not explicitly rely on or document this behavior, and
>> it's safer
>> to use regmap_bulk_read if supported, or at least ensure the correct
>> order and
>> atomicity if possible.
>>
>> Note: Maybe the low temperature is latched, but there is no
>> indication in the
>> datasheet that this would be the case. Even if it is, the code above
>> is
>> inefficient.
> 
> The low temperature register is latched. In the documentation at
> page 32 it is described that when reading the high byte register,
> the value from the low byte register is copied into a 'shadow'
> register. In this way it is guaranteed that when we read the low byte,
> it will correspond to the high byte.
> 
> Regarding the bulk read, the chip has a number of design quirks and
> because of that different commands are supported only on some
> particular memory regions.
> 
> According to the documentation page 26, the only areas of memory that
> support SMBus block read are 80h->89h(temperature memory block) and
> 90h->97h(status memory block). In order to block read the temperatures,
> the area of memory targeted has to be the temperature memory block. In
> this context the read operation uses SMBus protocol and the first value
> returned will be the number of addresses that can be read (in our
> particular case a max value of 10 bytes).
> 
> In v8 of the driver
> https://lore.kernel.org/all/20251120071248.3767-1-victor.duicu@microchip.com/
> ,
> the temperature values were read with regmap_bulk_read(). In that
> version, regmap_bulk_read() was also used to read the temperature
> limits, without returning count (this is an undocumented feature of the
> chip and because of that we could assume is not supported).
> In order to avoid this behaviour and avoid mixing the SMBus and I2C
> protocols all block readings were removed.
> 
> In the hopes of bypassing a long chain of replies, I tested the
> behaviour of the chip with different read instructions.
> Regmap_bulk_read() when applied to the temperature memory block
> (80h->89h) returns count and the high and low bytes. When it is applied
> to the 00h->09h memory, it uses I2C. It returns one temperature byte,
> but all other bytes are returned as 0xFF. The chip behaves as if
> it is at the last register location in the temperature block while the
> host continues to ACK.(behaviour described at page 26).
> If we set use_single_read in regmap_config and apply regmap_bulk_read()
> to the 00h->09h register area the high and low temperature bytes are
> read successfully without count.
> 
> Regmap_multi_reg_read() reads a number of registers one by one. When
> applied to the 00h->09h area, I2C is used and it returns only the high
> and low temperature bytes. When applied to the temperature memory block
> (80h->89h), because it is not a bulk function, returns the count till
> the end of the temperature memory block (aka SMBus count).
> 
> I2c_smbus_read_block_data() when applied to the temperature block (80h-
> 89h) returns the count, the driver replies with an NACK and the
> communication is stopped. In our case, the board we are using to test
> the driver has an AT91 adapter and supports
> I2C_FUNC_SMBUS_READ_BLOCK_DATA. It seems that the I2C driver for AT91
> does not modify the buff length of the message, leaving it 1.
> 
> I2c_smbus_read_i2c_block_data() when applied to the temperature block
> (80h-89h) returns count and the temperature values.
> 
> If you are of the opinion that block reading the temperatures is worth
> introducing (even in case we need to skip count) then I can add it, but
> we should come to an agreement on which function to use.
> Please let me know your thoughts.
> 

It is your chip, so I'll let you decide. Please include all the above
as comments into the code.

Thanks,
Guenter


