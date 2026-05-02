Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230203845CD
	for <linux-hwmon@vger.kernel.org>; Sat,  2 May 2026 16:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777740217; cv=none; b=ZfmyODIkFO0L4OI7lF9zaVD7bO82SR8djQiAA+aHRbfgAHo6C5Ky6gs9Sztl2/m6TH3XYnM3SGFgk117YLzcIzl3jrtGqr2YevZzjw5Fdp9nZ8XxaDQVoke9ynLOTkHZfUut5RReNCdiVhQDV+2kalRS0MpYqQTwsoxf/BvgePs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777740217; c=relaxed/simple;
	bh=eU2W+QBaJscU1JZXn/8gMqfqkkbCpD5Lh71qSITbbBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eMmLQyDWqVr7QYFnkg1wgrToMVqnXJb4t62vlcy9IonKqur1D9g5oymUE+2kbT/GpRt62YI1+n1OzMp8omdFxPs+U8pOBzzrEx36e9Vp7Mmi4sc62mXES6uk87dtvkBfJske0oLQ3g643VRUcakO6GnAFTERkiHfNYHkMicLWGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FIB7cJj9; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FIB7cJj9"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12c45281a06so4414570c88.1
        for <linux-hwmon@vger.kernel.org>; Sat, 02 May 2026 09:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777740215; x=1778345015; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=rJAvfJpV1fB53OjMJYuf7C1FJhyAiiYFszvx8mK36BE=;
        b=FIB7cJj9KCiQtrvIAL751Q8xfAX7vP1hfzgkHpEDJxIg2ZjcwYuYCTv9FwFUAuQ+2k
         +PoZ+g4FDCJebqHHA72D6fYcG0qrQmKOjo5i7WlcBYHIdxS1mFzy0LCaKHqwg8BKmOWi
         s6dvXpEQKfURpd5yVdYaVs/vzZ8mleuwmZe7DSJyjO72OGS2WvYvXXiAin/fYGlrlYKQ
         nYpz2XxvBHGKZJEia+GkFLtFUrvNfxHlZKURukBDNy0tuFrYU0dNByi7NmBUCjfa8meu
         VYT1HaKhwslPige1p1/RLKLW1xKmz7MTW/uEYYehd5ty5cqWMFOPSKc/wafA2JoaK9MC
         w/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777740215; x=1778345015;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJAvfJpV1fB53OjMJYuf7C1FJhyAiiYFszvx8mK36BE=;
        b=Ag7BPz2Gamu2AoSoYF1cbjPY12nbSLbu9AQSu3OdSPJ4JgNBNIliPMycJ5SeRjpaFe
         ts1Qq8bHuiJpeI1pOU0nSGj7ihB25OrRpwWn2xmI3hXoz2CBxwozal/Ag4GkAzMxIvbk
         iyYP7Of3qKr66hxSpUULPXm2LRrGhhziXxf7lBOEUWL9mupSu3LnXxh9l+m0BB/Ea9o3
         yqbU9jUybSviGwBmDn7qvnKTlAg2lGDWorzDxq6wcTBOJdm8MaQDch8nruKHLNzP5SKU
         oWgBjJ6/v/L0KEd/XGdfVk+Un2k+MEDX8lLP2bvYb8ENMY1ue7fzDRLvRDUcrGi8TA7t
         EiCg==
X-Gm-Message-State: AOJu0YxWw21Unwa4DlzVOIzgErcLbxl1Vmb0H+LknR2LWMFhZ98iBVNk
	+ExcbIK4gSr5CnWaAzs396WBaP7orD0gfzUfoXZcl2wX7KbTDjutGxgL
X-Gm-Gg: AeBDieu0k/zV/kzQcMf8HVDB2fv/PpKc35xqVPVub7bMPnXSJPTzRkJc7VbgR58csv8
	oZINA93K+sZHbZAhrxePCZ9ksDlkN9MVxX/xRWjwD6tWa3sp2hEo8G1wmN6rVu4ABTqV0Ql3UwN
	vyW5fdDIKDgOBzbLLbCknB0nRnO5i/rFjCP7EvyIuAWwdZRz8YJx5PFmVwcpb/AwqfuN/XYlHVn
	tfyaB+rUEqJfzb/dCwLc3N50MznoO6FRUAPbS2nNice9hSulUMCKoOJtX+0U2nnqRmH3UVf/cV4
	Od48mobYO2XmTJeXIBiQknK1Vcvp38KdiqgyyTHV4NmAbcOlG1ve6s64nRTm5oyNPH128L8l4pm
	NY781Sx8apwV/TqB2UHijZzpYqUz/eNSSH6suXVv0kcUtTgqqqiUT/47tQhJ5OkGRp0WU2R8POd
	rjb1XDyDsyC5eIpQL/x8QXZJZbp2wV07bUsXee6b7yyLjLTMdeLmKJwhkLO54D05ukRIGaNNPOv
	DDQ0Ec21ksaXlg8uUTdYQ==
X-Received: by 2002:a05:7022:6286:b0:12b:f8d6:d4bc with SMTP id a92af1059eb24-12dfd8199a7mr1653231c88.34.1777740215187;
        Sat, 02 May 2026 09:43:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df82a141asm9510094c88.8.2026.05.02.09.43.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2026 09:43:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <695ce7e5-3bdf-4487-82c0-811d2ad4bdc4@roeck-us.net>
Date: Sat, 2 May 2026 09:43:33 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] hwmon: (lm75) Fix AS6200 setup and alarm handling
To: sashiko@lists.linux.dev, Markus Stockhausen <markus.stockhausen@gmx.de>
Cc: linux-hwmon@vger.kernel.org
References: <20260502160533.3527619-2-markus.stockhausen@gmx.de>
 <20260502162839.71710C19425@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260502162839.71710C19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/2/26 09:28, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The patch attempts to disable Single Shot mode but fails due to a misunderstanding of the sensor's endianness, leaving the device in the wrong mode.
> - [High] The patch's new alarm logic uses `!=` to compare the alarm and polarity bits, which inverts the output and violates the hwmon sysfs ABI.
> --
> 
> commit ce15170fb232a37df75ee23f58c0868809e4b7cb
> Author: Markus Stockhausen <markus.stockhausen@gmx.de>
> 
> hwmon: (lm75) Fix AS6200 setup and alarm handling
> 
> This commit attempts to fix the AS6200 initialization by changing the
> configuration mask to drive the sensor in continuous mode and active-low
> setup. It also adjusts the alarm handling logic to compare the alarm bit
> against the polarity bit to correctly report active alarms.
> 
>> - Change the set_mask to 0x10c0 to reflect the current active-low
>>    setup properly and to drive the sensor in continous mode. This
>>    takes into account that the config register is little endian and
>>    the first byte sent to the chip is the LSB.
> 
> The lm75-compatible 16-bit sensors generally use a big-endian format where
> the msb is sent first.
> 
>> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
>> --- a/drivers/hwmon/lm75.c
>> +++ b/drivers/hwmon/lm75.c
>> @@ -137,7 +137,7 @@ static const struct lm75_params device_params[] = {
>>   	},
>>   	[as6200] = {
>>   		.config_reg_16bits = true,
>> -		.set_mask = 0x94C0,	/* 8 sample/s, 4 CF, positive polarity */
>> +		.set_mask = 0x10C0,	/* 8 sample/s, 4 CF */
> 
> If the i2c transfer sends the lsb of 0x10C0 first, the first byte sent
> is 0xC0.
> 
> When 0xC0 is interpreted by the chip as the msb, it sets bits 15 and 14.
> Since bit 15 controls Single Shot mode, does this unintentionally keep
> the device in Single Shot mode instead of enabling continuous mode?
> 

We know about that. Keep as is. If it turns out to be wrong after I get
the eval boards / samples, I'll submit a fix.

> [ ... ]
> 
>> @@ -416,7 +416,7 @@ static int lm75_read(struct device *dev, enum hwmon_sensor_types type,
>>   			switch (data->kind) {
>>   			case as6200:
>>   			case tmp112:
>> -				*val = (regval >> 13) & 0x1;
>> +				*val = !!(regval & BIT(13)) != !!(regval & BIT(2));
> 
> Does this comparison invert the expected hwmon alarm abi?
> 
> The hwmon abi expects the alarm attribute to return 1 when an alarm
> is active and 0 otherwise. The alarm bit (13) reflects the physical state
> of the alert pin.
> 
> If the setup is active-low (polarity bit 2 is 0) and an alarm triggers,
> the pin is pulled low so bit 13 becomes 0. The expression 0 != 0 evaluates
> to 0.
> 
> During normal operation, the pin is high (1), and 1 != 0 evaluates to 1.
> 
> Should this use == instead to ensure the attribute returns 1 when the
> alarm condition is active?
> 

Sigh. This chip is so confusing. Yes, it needs to be "==". Sorry again.

Otherwise looks good, but please remember to provide change logs.

Thanks,
Guenter

