Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E95E54652
	for <linux-hwmon@vger.kernel.org>; Sun,  9 Aug 2026 02:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786243556; cv=none; b=Wts99UR2hrfeEVdxrbvkLSL71A/WoYtdI6S0XsXR5fjGxACKHDBAgnsa4KyKJzkO5EFCHXRk4RJUq2IE4NxN6AvemoBLEs8JtDsG5Fg7iSdOq/sop6qM0dCQ6S0KOWcIOr84yMmCUtgCZyu7zJnAzWHrAMAMDGK1GeulPEQhFV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786243556; c=relaxed/simple;
	bh=hg3ZzrtKoG+GiBZfq2v4X5oOr5YcvnxhzIUDC3gyFzg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=arcO94+NirT8HgmF2vrg174fC/brjwQCflRQFOzerO99a8MA5RF4AVeMvjQLVfpEMKLn8Y7ARCj1i8wZbYG4mt5jiOpPTDkHl0i976WQBeC1zDy4x44dkE3dNlVNtAuz7l/yP4m18psbkICh4x59sGoQXFrvMwAp40hlGcwM/XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rMisSpcU; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rMisSpcU"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-848643382fcso665589b3a.1
        for <linux-hwmon@vger.kernel.org>; Sat, 08 Aug 2026 19:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786243552; x=1786848352; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9wS19GJ2gIXBu9UaH6V34iLZopXz04zq2DGfg1pQX9Q=;
        b=rMisSpcU+01YlJz+X957dN1YdABQoeGERWkjwrLdxOsQ6wl8lxUv3lqF7UaxPwBL2z
         0rDCis3zBjGof+tJo5crcEn6BFEjQvDt5/JNdyjhN8NAEzChP6Wo+Kk1h+tyj8Kk0ppn
         ee9DkrssnApYPTT+4k/mn4ROix/j56axsJ/iLXlxAvG46gy5iY+PuEx1WTxxZejfAfr/
         D6DQORhkwR9oHIQ1N6nLfpkf0aq0obT7MF8noKMq2P4/4fyIxTKv0OhE34WXvQBGEDk2
         Ll1Egn/hBZZju7KZI4+kPtX92hlchJfGsBPo2GmlHdHJdzIZpKQdAo6KzWDHuvXyDEwZ
         GeHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786243552; x=1786848352;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9wS19GJ2gIXBu9UaH6V34iLZopXz04zq2DGfg1pQX9Q=;
        b=D/yOA5chX41sPeh7ldKeZ5SEm/0pB1UmPK2Q2xKh8g8G+pAzKVSmVBtNVLIcYOCPig
         qFBQMkJx512QSSBbDqfkex7fHYPWfp3sqblRVZr2vIsLNyX2P5631byhNAS3eKkicAyM
         y4pLPlQGgkHgYkxL4Xndk0KmgOLySaoMhr2lL6ojsDUQCe9w2iAdehILlQY0qQKtkLkX
         cLanaip6HjpGUOMtYUUMxQtZclzzwnkuqtq2xovfT74z4e7Rj68SmtBFGMNH4nV65UXE
         NUz7nkLKOXU2edeOAG5zKPWzeHFrde5U0QnEoovEcKwRLc9GEWXoLPRQ5ip4sG372GBT
         2h/A==
X-Forwarded-Encrypted: i=1; AHgh+Rr2UDZ5aTfmjxpVmHS6y49x9HcO9shuY5lQeeqZkyHjeZSm/9fSbukXP7D6C0HRFulMkjspK0tHp4ILAg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx06On7t8ZpnlG0EKKE3w50et7d8+NuAJW0R8aCdxGlkbfU/VNk
	HrvxKY/MS10JgpyHfhDLBNzWVSevn7bt9OHxrWtmAY1lBay7n32OfqRC
X-Gm-Gg: AR+sD10j9BPhx7Hb1xq8ucpais2sKQ9jnbTW1E7NWMTZenYL9Kha2WpoArsFYd0l+1t
	knsf8w/i8dewadtEYqX6Rw5YUYkdwkvM48LQ5pKXSqgUFpn84zZt7yysw0vq7ux2YRV2cdzRh2P
	92i48tK0NA7nssZUCxpeKPxalqJ3vqpYFFtmHSa0+UU1PlbXi9//zE6LHCXtPlVgRDqexMyuNrs
	u/GtvCEzQAD0mUCh891TCobMDxTPorn3Ej06gRXb5Z/w8KOhTpDk5/dnT4gwplIA9kTBpRHspGI
	Cfjux3ug6SD63z+Tv8Z+lVU2R+3XZCvmgTw2IU4w+V59UvxkCtGUmGjW63LEJb76Gs+VS3wytj5
	HnlAgPbczeLMa6265GSbvahfwvxBAIlH4MND8OhH9/B5wDLApP1+dDnUakkS1Vqc4yUqz72OgIy
	IIwRQpa+NY5M+wWG9j8UYGGeUOluT6poye7pPXEYv/Hc5wXb5fQvPWzQT5xYS25KcP+B3kPURWx
	OBkXXzQD4Gav10Zrrw3LtLfRrKhIB6TPJuLMEA=
X-Received: by 2002:aa7:88cd:0:b0:84a:2e5f:d697 with SMTP id d2e1a72fcca58-84f2e12cd51mr31312721b3a.33.1786243552395;
        Sat, 08 Aug 2026 19:45:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a55f304sm2412753b3a.49.2026.08.08.19.45.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Aug 2026 19:45:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6022de1c-1345-4f16-939f-480c3313143a@roeck-us.net>
Date: Sat, 8 Aug 2026 19:45:49 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (max6621) fix negative temperature offset and crit
 readings
To: =?UTF-8?B?Tmd1eeG7hW4gQ8O0bmc=?= <congnt264@gmail.com>
Cc: Vadim Pasternak <vadimp@mellanox.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260808083718.2612205-1-congnt264@gmail.com>
 <2651758d-e588-4c2e-aa1d-13772e09874b@roeck-us.net>
 <CAJpJ=Gvh=M9_Fq8g7sCCWYz=d+9VS1m4zbwZFbnKJ+-YdQtneQ@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAJpJ=Gvh=M9_Fq8g7sCCWYz=d+9VS1m4zbwZFbnKJ+-YdQtneQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/8/26 08:54, Nguyễn Công wrote:
> On Sat, Aug 8, 2026 at 9:48 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 8/8/26 01:37, Cong Nguyen wrote:
>>> max6621_read() reads the temperature input, offset and critical alert
>>> registers into a u32 and assigns them to the output without sign
>>> extension. The device reports these values in two's complement (the
>>> driver comment and the write path, which clamps to
>>> MAX6621_TEMP_INPUT_MIN == -127000 and encodes negatives, both rely on
>>> this), so negative values are misreported as large positive numbers:
>>>
>>>     - temp_offset: *val = (regval >> MAX6621_REG_TEMP_SHIFT) * 1000, an
>>>       unsigned shift, so e.g. a -10 degrees C offset (register 0xfd80)
>>>       reads back as ~+1014000 millidegrees.
>>>     - temp_crit: *val = regval * 1000, so a negative critical threshold
>>>       reads back as a large positive value.
>>>     - temp_input used an s8 intermediate, which is correct for the
>>>       -127..127 range but reports the documented +128 degrees C maximum as
>>>       -128 degrees C.
>>>
>>
>> This problem does not exist. The AI is hallucinating a bit. There is no mention
>> of +128 degrees C in the datasheet.
>>
>> The problem here is that MAX6621_TEMP_INPUT_MIN (-127) and MAX6621_TEMP_INPUT_MAX (128)
>> are wrong. That should be -128 and (+)127. I guess the AI doesn't see that.
>>
>>> The registers are 16-bit (the driver's own PECI error codes occupy
>>> 0x8000-0x80ff), so sign-extend from bit 15 before scaling. This fixes
>>> all three reads and drops the now-unused s8 intermediate.
>>>
>>
>> The PECI error code reference is just confusing AI slop and completely irrelevant
>> for the patch.
>>
>>> Fixes: 92b64580f14b ("hwmon: (max6621) Add support for Maxim MAX6621 temperature sensor")
>>> Cc: stable@vger.kernel.org
>>> Assisted-by: Claude:claude-opus-4
>>> Signed-off-by: Cong Nguyen <congnt264@gmail.com>
>>> ---
>>>    drivers/hwmon/max6621.c | 11 +++++------
>>>    1 file changed, 5 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/hwmon/max6621.c b/drivers/hwmon/max6621.c
>>> index a7066f3a0bb4..03ac3eb5a594 100644
>>> --- a/drivers/hwmon/max6621.c
>>> +++ b/drivers/hwmon/max6621.c
>>> @@ -204,7 +204,6 @@ max6621_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>>>        struct max6621_data *data = dev_get_drvdata(dev);
>>>        u32 regval;
>>>        int reg;
>>> -     s8 temp;
>>>        int ret;
>>>
>>>        switch (type) {
>>> @@ -225,8 +224,8 @@ max6621_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>>>                         * The temperature is given in two's complement and 8
>>>                         * bits is used for the register conversion.
>>>                         */
>>> -                     temp = (regval >> MAX6621_REG_TEMP_SHIFT);
>>> -                     *val = temp * 1000L;
>>> +                     *val = (sign_extend32(regval, 15) >>
>>> +                             MAX6621_REG_TEMP_SHIFT) * 1000L;
>>
>>                          *val = ((s16)regval >> MAX6621_REG_TEMP_SHIFT) * 1000L;
>>
>> However, as mentioned above, this is not a problem in the first place
>> but AI not understanding the code and the real problem..
>>
>> Guenter
>>
>>>
>>>                        break;
>>>                case hwmon_temp_offset:
>>> @@ -239,8 +238,8 @@ max6621_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>>>                        if (ret)
>>>                                return ret;
>>>
>>> -                     *val = (regval >> MAX6621_REG_TEMP_SHIFT) *
>>> -                            1000L;
>>> +                     *val = (sign_extend32(regval, 15) >>
>>> +                             MAX6621_REG_TEMP_SHIFT) * 1000L;
>>>
>>>                        break;
>>>                case hwmon_temp_crit:
>>> @@ -254,7 +253,7 @@ max6621_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>>>                        if (ret)
>>>                                return ret;
>>>
>>> -                     *val = regval * 1000L;
>>> +                     *val = sign_extend32(regval, 15) * 1000L;
>>>
>>>                        break;
>>>                case hwmon_temp_crit_alarm:
>>
> 
> You're right - temp_input is fine (the s8 already sign-extends -128..127),
> and the +128/PECI reasoning was wrong. Sorry for the noise.
> 
> Agreed the real bug is the clamp range: MAX6621_TEMP_INPUT_MIN/MAX should be
> -128000/127000. Would you like me to send a v2 for that, or would you rather
> just fix it directly?
> 
> If a v2 is useful: temp_offset/temp_crit also don't use the s8 - they scale a
> raw u32 - so a negative offset round-trips wrong (write -10 degC -> mc2reg
> 0xfd80 -> reads back 1014000). I can fold a (s16) fix for those in too, if you
> agree it's a real issue.
> 
It should be two patches: One fixing the range, the other fixing the negative
temperature values in _offset and _crit.

Thanks,
Guenter

