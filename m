Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBA53043CF
	for <linux-hwmon@vger.kernel.org>; Sun,  3 May 2026 19:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777835210; cv=none; b=hKNIwv5haRKRrjq3tW771eQCHKzVB/p4twr56WBdMabhwqvSlMvRLmrZbDFftGr9XEFa+XCjm/5RqNsuHsTg7lSKISuk4SRFwJD+xIg+ldVe4EvlP+uVIROK2Cxm5i2sbJDS4XHGAFugFQjLRcbNKi8uSn/7LgdjFOVXiDTHhbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777835210; c=relaxed/simple;
	bh=0B60y2qvx4+XQ9VT6ZUsckD8QN/DX+O38rCAwjIziBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WGC8k4FHSRmxsMNkhajnC+ZEpfqNFoxsL0grpg1DemINnUyoMjwffTcm5oLt9hL4uQnGjnFkzwdtZQuMgXhLFuwIHbbtA0HcSJ+bxPXwEbmZALMfsOzRAd+syttsVxASp5fG6oDzoajwgmUmAN64QMZYbcD7MZ6EgMz0FQa/dEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RhMOssfr; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhMOssfr"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82fbdd60b64so2448033b3a.3
        for <linux-hwmon@vger.kernel.org>; Sun, 03 May 2026 12:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777835209; x=1778440009; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=aYI69VkKb46E86EGHCz5JQrt83BRbU6+MA3R48V95bs=;
        b=RhMOssfrDInqVTe0IqQ/s9BVoVMxyTbYjuDS1bbRaEBRv21a8+N9LV5fQpOJmgimZR
         S0cMd0hlzbRmcAhpoDpQcn29KTNG7UZZHahzDFHqbWq1GQk1lF7GFGU1DeQecweKr8Mz
         KLfafSyFywFIe/wZkDgT0c5ZrAtiOU73EMJwwMyGKD9/67Is1aQBQ20LqywveNqAOUz8
         TNn+FVkC+YoG3iD/wKtVuQickr++Ro91uBqk/ej1V9ArqSblaT4ZIHePhtPPUpE5hfwn
         bSLQNHMIcM2fovBCJje8Z4Y9/75aRb6zHSnraON7XAbLGmrx0n5m0Axe1z9DDA33Oy03
         iBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777835209; x=1778440009;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aYI69VkKb46E86EGHCz5JQrt83BRbU6+MA3R48V95bs=;
        b=tOMLRdxCSsTNnDL2H/M4+n7UO8OYl+dpem+KA1HnD6nJDGHqJOOqMwD2no0G41svgn
         erBL+KZCJLAfCW35pg/uh1Y0HmNSsWqhWzwUgcL9PFg8JRWjYBSkY1AEOO9HOCfE/qvh
         pw3zWjon7DQHpqsP5ZTEKt+lRAAUlBDvotBSp9+fFYYX44rE3tA5bDRLctvQyTPjRzsO
         jQgrXrPg6KgrSv00M1ICMCgCKW9m8u4iq42HxVkUpsrlF6zf+vsmdEwdM0b5WAonTO6o
         Ad6re1bxt7L6Q77yyTgTmcvn4JRyMIm2dUexuq2bbi3YSgAfpaDjObKvgLpQMTd2zD4V
         +B8Q==
X-Gm-Message-State: AOJu0YytxTsSckp/SxF0jRzWiMXVjAGlIWIOsDX8NMDW3DDZwCEuLOZs
	CCk+UexQ9IKWIMMStpgSZcMsm1hINjkO+BY+VrV/5OoRrFsfTNKasPG/
X-Gm-Gg: AeBDiev2anFEJjxmqGcjTLIbyku9owOK7+gIg+hXwrMlvvSlUfkpfI4x8E3eu4RcNDz
	lzUIwIcdj3syraK15VgWsVQpwBWDn8zLX1YtRCKScyZnDMYpLQb3cAwsVhqPo0CJ8DS/9NxON2K
	CmYQhPCFs5IkuK+FNLzvmwpbjJslvrqFK3NBgxEP3UWedr85fv94h8e3bMbChu24AusxCbexUV2
	CrmJVz/ZDdYNH/nlawhmlKjoqk6iazH56WJT7Hk8yx+s3nD4JuEKFpW+gT2qEeUN+awtx9HfDJY
	jWmNMkNOHVSoF+LNUK/t1n/4b8+5+wN5KaiOViz4eDjGOt2aC7O12iv/Wue+fn2o3/i25HtO5fp
	iIFDSfrpINloXdobdLC6owokfpVTrMIiLmgpV0F8ikHFLt5ohoddqD15R5ejc5Fq7BpkuQiO6nf
	tqzt8Oj4xXYn9DlPpntdJVibiEHh3FffWh5bnNC3tAFWkK1A3DGrOcsheSyc1yjt6VsFnyR5rQe
	QgMCW9MKZ8=
X-Received: by 2002:a05:6a00:aa8c:b0:823:1c5f:1c43 with SMTP id d2e1a72fcca58-8352d2b63dbmr6574196b3a.36.1777835208714;
        Sun, 03 May 2026 12:06:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b5b921sm10478298b3a.54.2026.05.03.12.06.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 May 2026 12:06:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <486ff558-d1c3-46a0-8688-50a5d318d967@roeck-us.net>
Date: Sun, 3 May 2026 12:06:47 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: (lm75) Support active-high alert polarity
To: sashiko@lists.linux.dev, Markus Stockhausen <markus.stockhausen@gmx.de>
Cc: linux-hwmon@vger.kernel.org
References: <20260502190408.3577731-3-markus.stockhausen@gmx.de>
 <20260502193627.3F9C4C19425@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260502193627.3F9C4C19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/2/26 12:36, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] The alert polarity configuration is silently ignored by the hardware because the new polarity bit is omitted from the register update mask.
> - [High] For devices with 16-bit configuration registers, the polarity bit is incorrectly shifted into the wrong byte, modifying a reserved hardware bit instead of the polarity bit.
> - [Low] The patch directly uses the Device Tree specific `of_property_read_bool()` API instead of the firmware-agnostic `device_property_read_bool()`.
> --
> 
> commit 80ab4767c4e330cd441a8b4dcd804fcd1dec493b
> Author: Markus Stockhausen <markus.stockhausen@gmx.de>
> 
> hwmon: (lm75) Support active-high alert polarity
> 
> LM75 devices supported by this driver support configurable active-high
> alert polarity. This is already documented in the devicetree description.
> Add support for it to the driver.
> 
>> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
>> index f1a1e5b888f6..d5a14a3b2820 100644
>> --- a/drivers/hwmon/lm75.c
>> +++ b/drivers/hwmon/lm75.c
>> @@ -123,7 +123,9 @@ struct lm75_data {
>>   
>>   static const u8 lm75_sample_set_masks[] = { 0 << 5, 1 << 5, 2 << 5, 3 << 5 };
>>   
>> -#define LM75_SAMPLE_CLEAR_MASK	(3 << 5)
>> +#define LM75_ALERT_POLARITY_HIGH_8_BIT	(BIT(2))
>> +#define LM75_ALERT_POLARITY_HIGH_16_BIT	(BIT(2) << 8)
> 
> Does this shift target the correct byte for 16-bit registers?
> 
> Because the hardware typically expects the first transmitted byte to be the
> most significant byte of its configuration register (which contains the POL bit
> at bit 2), and i2c_smbus_write_word_data() transmits the least significant
> byte first, the POL bit might need to remain in the LSB of the logical value
> (BIT(2)).
> 
> By shifting it by 8 bits, does this target the MSB of the value, which maps
> to the LSB of the hardware register, potentially modifying a reserved bit
> instead of the polarity?
> 
Ignore.

>> +#define LM75_SAMPLE_CLEAR_MASK		(3 << 5)
>>   
> 
> [ ... ]
> 
>> @@ -762,8 +765,15 @@ static int lm75_generic_probe(struct device *dev, const char *name,
>>   		return err;
>>   	data->orig_conf = status;
>>   
>> -	err = lm75_write_config(data, data->params->set_mask,
>> -				data->params->clr_mask);
>> +	set_mask = data->params->set_mask;
>> +	if (of_property_read_bool(dev->of_node, "ti,alert-polarity-active-high")) {
> 
> Could we use device_property_read_bool() here instead?
> 
> The probe function already uses device_property_read_string() to read the label
> property earlier. Hardcoding the Device Tree specific API here breaks
> consistency and prevents the active-high polarity feature from working on
> systems using ACPI or software nodes.
> 
Please use device_property_read_bool().

>> +		if (!data->params->config_reg_16bits)
>> +			set_mask |= LM75_ALERT_POLARITY_HIGH_8_BIT;
>> +		else
>> +			set_mask |= LM75_ALERT_POLARITY_HIGH_16_BIT;
>> +	}
>> +
>> +	err = lm75_write_config(data, set_mask, data->params->clr_mask);
> 
> Are we missing an update to the clear mask?
> 
> When we pass data->params->clr_mask into lm75_write_config():
> 
> drivers/hwmon/lm75.c:lm75_write_config() {
> 	return regmap_update_bits(data->regmap, LM75_REG_CONF,
> 				  clr_mask | LM75_SHUTDOWN, set_mask);
> }
> 
> The regmap_update_bits() function uses clr_mask | LM75_SHUTDOWN as the mask
> of bits to modify. Since the newly added polarity bit isn't included in the
> mask, is the alert polarity configuration silently ignored by the hardware?
> 
> If the device tree configures the interrupt controller for an active-high
> signal but the sensor remains in its default active-low state, could this
> lead to an unhandled interrupt storm?
> 
You'll have to pass the bit in clr_mask if the property is not set
for consistency.

Thanks,
Guenter

