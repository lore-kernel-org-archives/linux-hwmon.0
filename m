Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE7F385D81
	for <linux-hwmon@vger.kernel.org>; Sat, 23 May 2026 13:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779542864; cv=none; b=IqywK4GRlA0x2M6Vz3E+vF7AyWZUarf/94b0ZUPuczy78E5Nza1pO0j1W94WH0ln/WfiSILyV2c6SzVVBxywmIpf1AKD1XqdTzMqukjscHb5b/VV53u+l+NOevo+Ke4q6m91amWGh3tPjIHLhXH75tG7zuwy8lMl8T+b7IbLS0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779542864; c=relaxed/simple;
	bh=g1gBUbPtcSqTkL+3avMM5tCJfJORfueUXMTX1uJTBx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tj5o/dMrfATgbZdHT67EIfjgm1E/rzFX1fKEO/9jBKGUDo2lq4roLFFxO5wag+f+08fFFPZEv61R/66HgVeQ3YQbq1M2mJPlg8/9lXTnApaaJIqv7637dajDEPYaB9F7QtCWSVTfpDPrweoDK1JSww6nFiTl7T1IUQK3agHoUKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CYGfakcX; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CYGfakcX"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82fbdd60b64so6917351b3a.3
        for <linux-hwmon@vger.kernel.org>; Sat, 23 May 2026 06:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779542862; x=1780147662; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=v0orZyohJ22FZsdiMg1zqHmw8fWkBbihvBgEUA5cYKI=;
        b=CYGfakcX5QJ6Sisab06IKbR4+2UeP+sc1c2j9EkCN3XtE6+0Y18TzKX556bohZ99xG
         B1KFiCE7bexM85BVslP5wbItNTYbyNDEK7stiqEtldquqrFdIJ1GKOMvid1GVJ1CZ3e2
         Moe2EZY6dG0hrcdzAp5sC6pVvsgLYT4HfkjiLATwZQL5YGz4JWNaf3CGxVErOMvnpRX6
         QUeWf3PF3eeM/N6a5YxwJLXM19ZG+5UjzsZvklLwUPEAohAUz7g5PPYKLPiPxGkYIXwT
         ARvF0poraUjsxLQu46vWIdD7JF+/DZgSsXxP9g3lAAkgW1Q/3sCbM0sfuyGL6AcIIRYO
         DYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779542862; x=1780147662;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v0orZyohJ22FZsdiMg1zqHmw8fWkBbihvBgEUA5cYKI=;
        b=D6S5vlmhQ+BtA0QpZZlWCAuvPqHgUYcaQwP1p7IdqENYH0U8mgpGj1uD4Ri4vj6nw6
         YRGfEO+0PpxRdSYUPP+QjcG73p0AKRPl/El/9euMslMXHfyKGFmhjieVPn87nzvWwkud
         qIOPLUmxQub4pwaWD9/34EAHpmHiXR2kTe0xoXrcuyZVufUExkEqdOruoo20s4beqjoP
         uzS9ZAeypqw1L2Pxn4XvhZrXFkTwUQWh6szfN9Sb0+ODrIU/XNlhUT7CmGXLjcRXcHZW
         iuIocgtAA5/VZtfm/o/eUC1jLaX8276wWaEU7qNdCNA4aG4AR8KsrBhpzHjoEph7WU5H
         rFNQ==
X-Forwarded-Encrypted: i=1; AFNElJ/gkizTgOPTZbQ50o8zRBV7Rm16S4Q9OUQcQDRyQrvog/CFU3+Ez3+B9VzjNz7E+PhwIudlqfy7STYxfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuPnCTJAJ7BjrnBpAb0Yy/mjq4Av2OiwNKuAKVNE6pYbUJZpVp
	tLPNcF2OlGv58DfQAKgdP7voWykxbmuC3huU5qE2sAqVEOJmhLwNYztZhroSbYzQ
X-Gm-Gg: Acq92OEq99bUapduUS5+ahrokF2w1RW8IlmnqR0h7HbSo57V/2YqxGQB71V0FWVFRvX
	AP/TPWHv6exW/JXACw4TIeiKzt/BUJBiGUyN2hh/h604/0vQX6+dQqbnINEjJN+JrjxBlRMBdPF
	QSyt0aCe3ObmqpSz7Ng1oP5Ccw9BDJaEmwTEHLSCbWbrOJpX3r0ejTV+nzrHPy71RdpR3WYlBdD
	9f14eWckYf4JAqy3VB8U3W0XuVZwuu+lChZ5HWBYZP3VlsO+4AcbMBUc55O/uo8ss6n4VnjJAkE
	bh5Pij5Z0H+03ZH+RQF+ss0s2Ij5IzEj4vrzTrTZ5bNzpdbhmXC8tXFBBuPv289I/VDY7c59CjI
	rnsKnWuVHnGc0U2StTCdyfmn5ixfxfdswQWtwabuiEaV8T8a1+TdnhRN7uNpvLc2miySdUHQo93
	temL2dgu8CAIUS7DNwX8R1Gbh1GI2CYFcL181klHcjHa/MQAXve45IwWkG11bEtEyFMBQv7HUu
X-Received: by 2002:a05:6a00:3004:b0:82f:721f:10ea with SMTP id d2e1a72fcca58-8415f17de74mr7614071b3a.18.1779542862553;
        Sat, 23 May 2026 06:27:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ff71c4sm5576354b3a.55.2026.05.23.06.27.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 May 2026 06:27:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ac052c47-45cd-4081-967c-6f649e422571@roeck-us.net>
Date: Sat, 23 May 2026 06:27:40 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] hwmon: (pmbus/tps25990): Rework TPS25990 direct
 conversion handling
To: sashiko-reviews@lists.linux.dev, Stoyan Bogdanov <sbogdanov@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20260522082349.2749970-3-sbogdanov@baylibre.com>
 <20260522091252.9E5C01F00A3D@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260522091252.9E5C01F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/22/26 02:12, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> 
> New issues:
> - [Critical] The custom conversion functions incorrectly retrieve I2C client data, leading to severe type confusion and out-of-bounds heap reads.
> - [High] Replacing ratio-based math with direct conversion helpers inside `read_word_data` and `write_word_data` introduces a double-conversion bug that completely corrupts sysfs output and configuration limits.
> - [High] Calling `pmbus_reg2data_direct_calc()` directly with negative `R` coefficients and small register values leads to a total loss of precision due to premature integer division.
> - [High] The patch silently drops the correct translation ratios for the Over-Current Fault Limit (`PMBUS_IIN_OC_FAULT_LIMIT`) and bypasses dynamic resistor scaling.
> - [Low] Spelling mistakes in the newly introduced `tps25990_parameters` enum comments.
> 
> Pre-existing issues:
> - [High] When setting fault limits, an integer underflow on low user inputs leads to an unsigned wrap-around, causing `clamp_val()` to clamp to the maximum limit instead of the minimum limit, dangerously defeating hardware protection.
> --
> 
> commit 11131ea034ce953233470df60e4f6a1c34cca609
> Author: Stoyan Bogdanov <sbogdanov@baylibre.com>
> Date:   Fri May 22 08:23:37 2026 +0000
> 
>      hwmon: (pmbus/tps25990): Rework TPS25990 direct conversion handling
>      
>      Rework the existing implementation of direct format conversion for
>      TPS25990 non-standard parameters to improve code reusability and
>      integration with the PMBus direct conversion helpers.
> 
>> diff --git a/drivers/hwmon/pmbus/tps25990.c b/drivers/hwmon/pmbus/tps25990.c
>> index 05c6288ecafcc..1e252844217b8 100644
>> --- a/drivers/hwmon/pmbus/tps25990.c
>> +++ b/drivers/hwmon/pmbus/tps25990.c
> 
> [ ... ]
> 
>> +enum tps25990_parameters {
>> +	TPS25990_VIN_OVF = 0, /* VIN over volatage fault */
>> +	TPS25990_IIN_OCF, /* IIN Over currect fault */
> 
> [Severity: Low]
> This isn't a bug, but there are minor typos in the comments: volatage and
> currect.
> 
>> +	TPS25990_DIRECT_VALUES_COUNT,
>> +};
> 
> [ ... ]
> 
>> +static s64 tps25990_reg2data_direct(struct i2c_client *client, int param, s32 raw)
>> +{
>> +	struct pmbus_driver_info *info = i2c_get_clientdata(client);
>> +	struct tps25990_data *data = container_of(info, struct tps25990_data, info);
> 
> [Severity: Critical]
> Does this correctly retrieve the driver info?
> 
> Looking at pmbus_do_probe(), i2c_get_clientdata(client) is set to a
> struct pmbus_data * object, not a struct pmbus_driver_info * object.
> 
> Using container_of() on the wrong type calculates a 0 offset, but improperly
> casts the pmbus_data object into a struct tps25990_data pointer, causing the
> subsequent read of info_local to fetch completely out-of-bounds heap memory.
> 
> Should this use pmbus_get_driver_info(client) instead?
> 

Did you even test this code ?

Guenter

>> +	struct tps25990_local_direct_value *info_local = &data->info_local;
>> +	s64 b, val;
>> +	s32 m, R;
>> +
>> +	val = (s16)raw;
>> +	m = info_local->m[param];
>> +	b = info_local->b[param];
>> +	R = info_local->R[param];
>> +
>> +	return pmbus_reg2data_direct_calc(val, b, m, R);
> 
> [Severity: High]
> Can this result in a total loss of precision due to integer division?
> 
> For TPS25990_VIN_OVF, R is -4 and the raw register value is a small 4-bit
> integer (0 to 15). The generic pmbus_reg2data_direct_calc() handles negative
> R by dividing the input by 10 for each R:
> 
> pmbus_core.c:pmbus_reg2data_direct_calc() {
>      ...
>      while (R < 0) {
>          val = div_s64(val + 5LL, 10L);
>          R++;
>      }
>      ...
> }
> 
> Dividing a small value like 15 by 10000 via integer division would truncate
> it to 0, permanently destroying the underlying data. Does this need
> pre-scaling before the calculation loop?
> 
> [ ... ]
> 
>> @@ -184,9 +230,7 @@ static int tps25990_read_word_data(struct i2c_client *client,
>>   		ret = pmbus_read_word_data(client, page, phase, reg);
>>   		if (ret < 0)
>>   			break;
>> -		ret = DIV_ROUND_CLOSEST(ret * TPS25990_VIN_OVF_NUM,
>> -					TPS25990_VIN_OVF_DIV);
>> -		ret += TPS25990_VIN_OVF_OFF;
>> +		ret = tps25990_reg2data_direct(client, TPS25990_VIN_OVF, ret);
> 
> [Severity: High]
> Does this introduce a double-conversion bug?
> 
> The driver's .read_word_data hook is expected to convert between the
> chip-specific raw register value and the standard PMBus raw format (Y_std).
> The PMBus core then converts Y_std to physical units.
> 
> By calling pmbus_reg2data_direct_calc() directly here, does it return the
> physical value (e.g. milliVolts) rather than Y_std, causing the PMBus core
> to apply its standard conversion a second time to an already converted value?
> 
> [ ... ]
> 
>> @@ -246,17 +288,13 @@ static int tps25990_write_word_data(struct i2c_client *client,
>>   		break;
>>   
>>   	case PMBUS_VIN_OV_FAULT_LIMIT:
>> -		value -= TPS25990_VIN_OVF_OFF;
>> -		value = DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_VIN_OVF_DIV,
>> -					  TPS25990_VIN_OVF_NUM);
>> +		value = tps25990_data2reg_direct(client, TPS25990_VIN_OVF, value);
>>   		value = clamp_val(value, 0, 0xf);
> 
> [Severity: High]
> This is a pre-existing issue, but does this lead to an integer underflow
> that defeats hardware protection?
> 
> The value parameter in tps25990_write_word_data() is an unsigned u16. If a
> sufficiently low limit (like 0) is converted, the mathematical result could
> be negative. This would wrap around the unsigned u16 to a large value
> (e.g., 65530).
> 
> Since clamp_val() compares using the type of the passed variable, it would see
> the wrapped value as much greater than 15 and incorrectly clamp it to the
> maximum hardware limit (0xf) instead of the minimum limit.
> 
>>   		ret = pmbus_write_word_data(client, page, reg, value);
>>   		break;
>>   
>>   	case PMBUS_IIN_OC_FAULT_LIMIT:
>> -		value -= TPS25990_IIN_OCF_OFF;
>> -		value = DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_IIN_OCF_DIV,
>> -					  TPS25990_IIN_OCF_NUM);
>> +		value = tps25990_data2reg_direct(client, TPS25990_IIN_OCF, value);
> 
> [Severity: High]
> Are we losing the dynamic resistor scaling here?
> 
> The original code mapped TPS25990_VIREF to the standard Y_std format,
> allowing the PMBus core to dynamically convert it using the PSC_CURRENT_IN
> coefficients, which are adjusted in tps25990_probe() based on the
> ti,rimon-micro-ohms property.
> 
> The new tps25990_data2reg_direct() call uses static coefficients from
> tps25990_local_info which are never updated by the rimon logic. Will this
> break the over-current limits for boards using a non-default rimon
> configuration?
> 
>>   		value = clamp_val(value, 0, 0x3f);
>>   		ret = pmbus_write_byte_data(client, page, TPS25990_VIREF, value);
>>   		break;
> 

