Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B593410F1
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 01:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784595953; cv=none; b=eIM94U64zJO8weVnEvcmRkZUz6qjkpwZWssOUaNsHX7p92eKm68LsuTfB0qXMxV2bSy/8jwiAkKbkWh4wO9Ere2mEJ7eIP/ysqNoIwj3RualeNDu33rSthaZ8MrzG3JEfIxCea0n0mRm/W0k4G3tQ4yD6ybtnUvsS5vc7MUoEkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784595953; c=relaxed/simple;
	bh=U0D6nZ8gfwpMjdg12liNmjdw41QW3L3/wMMBpolMT8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oT/FfUIfgJIYocSujWau7lOkfaNMm3wHLhcDF+BFFt5RTiQRHB52cTZo4YL08m1EKs+WAPaIEMmHtAxR4mDvgAk0VzrIRjH/xVKLJUeBKvn9ShwUdffHiQ4wuw025uNKnnUzCFSqW16N8UBiQJ/Vh846PAmZJIi3svhav+jUv2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XQXrgNVw; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQXrgNVw"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ceb096e675so106725415ad.0
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 18:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784595951; x=1785200751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vxJokmGzxjcSVDm8vBuFGdiZIy7g8VJmra47cR07BqQ=;
        b=XQXrgNVwTO6nTodXVmjwBo/4dQ7EcGDR03Xm9PI1cPfP0LHkTjT/MHKHKZneJzFunb
         61uoc8NvIJfzFm/y0G+jHDyK86KKVehFJm62M1gED3gJfnDVbSlliUdkWOtHSrLCS2+a
         sXjpt5jl0I47oZ1wmLayNUu5Lw4Ru/NPrgfWrIcNZJdRZh/2u1jN2RtXWVg/TWkukmmt
         33T1wz3K+siAkm+tm+wf6nbkF9KSeSptjRGCqbK380V7pjp3U+/n3orbAflr/9Nto8zA
         wbuTxSetJHBRVC9I1mM9D8OvaISRVnv4K5GeaeuBWkii/JFggAd99UP2ccxbEPSNuPdM
         GhKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784595951; x=1785200751;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vxJokmGzxjcSVDm8vBuFGdiZIy7g8VJmra47cR07BqQ=;
        b=W7sryoJzcDoyrS4KOohJfcMZWI2CDTUeD1shwokrvFWCNQoYqsccNlSSzXD6PlzkBx
         H+Baizz84VOMZWy4U3wsd2Wzmq22+lp9xtssd2sdVLd8OCuOG9ErSSkNGZIuS4PiRT6P
         Hturf0nrizPzcwl/YBNKLTH8zo9HSIjZz9v9Yhi1LDR10heRIVGlyJOn8bUYU5/mWDSm
         NZm3vkLEl6WyIXBJ4nSUBhCgKDrZO00qdSUExecylxCn0YKalmhm21ywfwG7nFRn1weP
         z4oa0Wuw/gGHx7NDIZ8qAVh1wLMt6uCAKeqH97/zUUv1VBqre6SgBL4wm0auivbggMAR
         ZW6Q==
X-Gm-Message-State: AOJu0YwZLOaDgQfU33U9sIfMYAE+O61FgCg73k/szU99iVq32W9/a2RI
	86cneZxsrv5+D7Ff/VBrf6BxovMKwarDJ9F+1Wd2zNlMaJf2wt7XS2moTmginA==
X-Gm-Gg: AR+sD138asRw9JRRQswjFEc4lt8L/Wk2RLWSY/7+b3JwpCBMRvuv7OXpYOBQP5OelXF
	PAYzG8flaXalGCociuEHXGT0t8urq3F9moE1EitvaS2MU/f3+ou3VIt6EH+J8MrTFv2dj+SbOSS
	TjtEGtIsGSyvSzNL78L4W6cHzPirHO+0Z1fVIBxB1bC3j1rUUyGdV+AGrB8lV23zfAyH/Mi/fwy
	4J3Tz1ucymFatRs92BLF4b5tk/Lx8jm5iOqT3h57MV08gTz2oh6khg1y2Yu23Cnae1xKP1MMJwd
	HldtFndlDqRn8NI7g+brtljFFZrQ4W5d1URRbE9mNkos0kDqOOtJKtdOuQB7KWjlhBrPQ6h+ngk
	xTo/nh1Vh8CSyKzt5RRYLsnnB+z1fnov5obMfwtmnxZt6eZWV7osuXw52Wjr1uoz9aHg2SBQpGf
	DxUyNFlhFGlpWfRtHGisr4SElPb93a55P6ckckWITvvyKNFc3V5QM=
X-Received: by 2002:a17:902:d2d2:b0:2ca:d7a0:1312 with SMTP id d9443c01a7336-2cf34961d82mr197230145ad.25.1784595951017;
        Mon, 20 Jul 2026 18:05:51 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3471513bsm64399125ad.57.2026.07.20.18.05.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 18:05:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b0442a31-deda-413a-955e-1ab8c99b2033@roeck-us.net>
Date: Mon, 20 Jul 2026 18:05:48 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] hwmon: (pmbus/max20830): add VOUT feedback
 resistor scaling support
To: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>,
 "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "robh@kernel.org" <robh@kernel.org>
References: <20260720-dev-max20830c-v3-0-9d06d27d6da3@analog.com>
 <20260720-dev-max20830c-v3-2-9d06d27d6da3@analog.com>
 <20260720032550.A4F891F000E9@smtp.kernel.org>
 <PH0PR03MB635109584F166EBD4A5510B4F1C22@PH0PR03MB6351.namprd03.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <PH0PR03MB635109584F166EBD4A5510B4F1C22@PH0PR03MB6351.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/20/26 17:44, Torreno, Alexis Czezar wrote:
> 
> 
>> -----Original Message-----
>> From: sashiko-bot@kernel.org <sashiko-bot@kernel.org>
>> Sent: Monday, July 20, 2026 11:26 AM
>> To: Torreno, Alexis Czezar <AlexisCzezar.Torreno@analog.com>
>> Cc: linux-hwmon@vger.kernel.org; conor+dt@kernel.org;
>> devicetree@vger.kernel.org; robh@kernel.org
>> Subject: Re: [PATCH v3 2/4] hwmon: (pmbus/max20830): add VOUT feedback
>> resistor scaling support
>>
>> [External]
>>
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to
>> consider:
>> - [Medium] The voltage divider scaling calculation suffers from a 32-bit addition
>> overflow and an unsafe 64-bit to 32-bit signed integer truncation before
>> clamping.
>> --
>>
>> --- Patch [2]: [PATCH v3 2/4] hwmon: (pmbus/max20830): add VOUT feedback
>> resistor scaling support --- commit
>> ac88893286286c633f117369db91c2cffd163afd
>> Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
>>
>> hwmon: (pmbus/max20830): add VOUT feedback resistor scaling support
>>
>> This commit implements support for external voltage divider scaling using the
>> adi,vout-rfb1-ohms and adi,vout-rfb2-ohms device tree properties. The driver
>> reads these values and applies the scaling formula to the raw VOUT reading.
>>
>>> diff --git a/drivers/hwmon/pmbus/max20830.c
>>> b/drivers/hwmon/pmbus/max20830.c index cb2c23672166d..7a5e67bd33c0a
>>> 100644
>>> --- a/drivers/hwmon/pmbus/max20830.c
>>> +++ b/drivers/hwmon/pmbus/max20830.c
>>
>> [ ... ]
>>
>>> +static int max20830_read_word_data(struct i2c_client *client, int page,
>>> +				   int phase, int reg)
>>> +{
>>> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
>>> +	const struct max20830_data *data = container_of(info, struct
>> max20830_data, info);
>>> +	int ret;
>>> +
>>> +	switch (reg) {
>>> +	case PMBUS_READ_VOUT:
>>> +		ret = pmbus_read_word_data(client, page, phase, reg);
>>> +		if (ret < 0)
>>> +			return ret;
>>> +
>>> +		/* Apply voltage divider scaling if resistors are non-zero */
>>> +		if (data->vout_rfb1 && data->vout_rfb2) {
>>> +			ret = DIV_ROUND_CLOSEST_ULL((u64)ret * (data-
>>> vout_rfb1 +
>>> +						    data->vout_rfb2), data-
>>> vout_rfb2);
>>> +			ret = clamp_val(ret, 0, 0xFFFF);
>>
>> [Severity: Medium]
>> Can this calculation suffer from a 32-bit addition overflow and an unsafe 64-bit
>> to 32-bit signed integer truncation?
>>
>> If data->vout_rfb1 and data->vout_rfb2 sum to more than 2^32 - 1, the 32-bit
>> addition will wrap around before the 64-bit multiplication.
>>
>> Additionally, since ret is a signed 32-bit integer, if the 64-bit result returned
>> from DIV_ROUND_CLOSEST_ULL exceeds 2^31 - 1, the assignment to ret will
>> overflow into a negative integer. The clamp_val() macro will then evaluate this
>> negative number and incorrectly clamp it to 0 instead of 0xFFFF.
>>
> 
> Although technically correct, is sashiko a bit paranoid?
> Feedback resistors won't typically reach those values.
> 

It does what it is asked to do, which for hwmon drivers is to explicitly check
for over- and underflows because those happen surprisingly often in hwmon
drivers. There is a reason why more than 50 patches in drivers/hwmon
have either "overflow" or "underflow" in the subject line.

Guenter

