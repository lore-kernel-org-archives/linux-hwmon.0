Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF0E51475A
	for <linux-hwmon@vger.kernel.org>; Wed,  9 Sep 2026 14:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788962558; cv=none; b=uURGf7yca3paQJO36QBnaJWqJ6OZx28UH3D23XrlJF/HHn1GmcFttjz8QP2FrTaQQVm3wqdzWc9X7mkVY4X6eBHrvoJBgkPS0AZMCdl7F/gKHWLHorLnDC/SWaQBvFgDou8nG8YuxLJy5NXgSqi/jlxbWCLlutZoOKkMGkd2mIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788962558; c=relaxed/simple;
	bh=oTQA/u5WVoIHtXN93V20rEZ+Jsp9YoaRz/o2IZhZzQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s+Xa5bZq9lL1oXgFy/iJZA5uGqZBkyMMZ91ZYIgr5/iBy/0M+QBjMYQepngt3jyZBoPlWSClz+7F7mWqtQaNFr7iVWmirSFI2y19q+JhCZl6Ixd9L7f1mSFH+FElf5EAkqVIYBkHsA53TYdUhubwe93dWyxtdz0K5FZmO10BgmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vt4Awhjk; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vt4Awhjk"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469b2e1d7so960890b3a.0
        for <linux-hwmon@vger.kernel.org>; Wed, 09 Sep 2026 07:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788962555; x=1789567355; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tfhDxzxhEppQkaRSXbedJYD+T6DJ5diIcVflCkpMk9o=;
        b=Vt4AwhjkJlSojoKJKKHiluUKvMekMw06B3pAeVYhNH0Tz4rtymUVjL0+pBzg8NsQuE
         VJE6XeqA328aCOobJnOSp1lbpXHqQVuX+VjQBQcAqHXz/G6Yw4WnKkhQO5v1xtwzVKOp
         zmmgRaiFJxowjbu45HdIUujSlTnoY65wtehSuRW52s46F0Pve2Zj6IevGVYisMiQVBLx
         9EpX8Ope8faHatspqkmkKJteqDS81Idy9dgq37pmDcsB9xHz2rKp55mN6aQsrVgPJ2/v
         AUdNun8khWNmughzYs7uXkISVWzZSycoQPZXJt+D2Rsc2XI4yTK+8MBMnikFFrCLJAg+
         U79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788962555; x=1789567355;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tfhDxzxhEppQkaRSXbedJYD+T6DJ5diIcVflCkpMk9o=;
        b=sWTaqpY1V4jiB0hfuCTRcKMk2deIJWC56w1MkH1pZou4elyQsufOvd7D3o3vh5SSUo
         glpWD6jCiM3fiGlzlQYBU8YT4YHHNqEUHfaU3B5wPIJJ+t+U9oYdls9pvOa7rprN9HZg
         yrq0+4q+zyfTDu2t3IdmxzyYwqdDycpjvA6d3e8jTSZd4Reoce4DWhKUrjyd9D+N4OuW
         QPWDzo2MagYz6W+GV57WX5YXyUY/NxquerNeVwsnJdG9hXwlBdp5tgyiad4TbdZiebeu
         gsbs4nYGKBIGdCaTUsqr/BON9kleW9Pn8uAuVFAhGz7k/mZbfRUNivNwa5jYYzTJG4WV
         Vy8w==
X-Forwarded-Encrypted: i=1; AKwUvBwU02pl0fLNZWGES9Gxq56etgvweMIjykZIgXthmB+dRFWej+KDVp6xvqbF8zpEPiI3b+UNf1hmPLih4g==@vger.kernel.org
X-Gm-Message-State: AFuF++laXv4dBKUr90EzBPMJdCHATDP5r/GB0lqHL7cWbjO1oTRLA/qT
	jrioJ1vOgxuRUFSpMgWqhidFyy2uia6Uy+gFOxTbDmT7qlkpu8S97Oyp
X-Gm-Gg: AYBFou133ZDqbuz9zzqVoaTAghcuV8iwShhMHsPrC3U9lx7Fw55TXw3ixVyI2knpqEu
	S+cr0qjJf2ZGLP0cwbVxLDAtfZUjHGnovTcRHXRxkabF8MNZm72PbzDQQLZXDMtCVb+s3xwhTg6
	0ltZ2hafjg+PMetdIjUk2xCfGZp3plJSKdbGIb7r8SGlu+aCCtYKovHatuyZsfQigr+hDVBBNsL
	7Sx/ZeCnZltWbCwW8/f8NwG92GBTDrCXTTyxMHvx9yDFYs7jIwa4XkUFNn0W8E9DQNIRjUPdvll
	Fpr6MUb51MT5fsZ6/HH/pWQxUyKWhbjs/vRJo9blGxq2mpzTIRWV6JLns5KH+Os4xg5WirlaP0b
	MTI0UXol4JOWI5FGBKOEQdxQs4j7KcCwsBis3hhnxgHyqIldIUIsQMYp/qru0zYqLGgO0+8i7js
	9kKWYMZNQLO8f5UXvpM9Lv9TYw9R7RJNP3Lfe9CJj82IXGTHBZ5hQiRt8Xv15ip38HgwKugdGfX
	WDfAqTKXKzWl+dkjQEGA8p0FmHiiDxOhCHQy/jReVU5Na1+
X-Received: by 2002:aa7:888a:0:b0:847:7ffd:ce35 with SMTP id d2e1a72fcca58-86840e84ae6mr7213858b3a.8.1788962554733;
        Wed, 09 Sep 2026 07:02:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8614c699735sm7049960b3a.0.2026.09.09.07.02.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 07:02:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3a941922-8728-456a-8e2a-7fa008dd5155@roeck-us.net>
Date: Wed, 9 Sep 2026 07:02:32 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] hwmon: (lm75) Add support for Nuvoton NCT7715
To: Sheng-Yuan Huang <hsyemail2@gmail.com>, linux-hwmon@vger.kernel.org
Cc: Sheng-Yuan Huang <syhuang3@nuvoton.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Jean Delvare <jdelvare@suse.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260907080831.11281-1-syhuang3@nuvoton.com>
 <c1f812d6-9938-494f-ae37-e250434a25f7@roeck-us.net>
 <CACW=pY4mpuC1+Z21egn3jJY6jtMhMx1PFFbM+Rcy6giuzXpJ1Q@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CACW=pY4mpuC1+Z21egn3jJY6jtMhMx1PFFbM+Rcy6giuzXpJ1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/9/26 00:10, Sheng-Yuan Huang wrote:
> Thank you for the review. I may have misunderstood which conversion
> you are referring to, so I would like to clarify both parts.
> 
> If this refers to the NCT7715_CONFIG_* masks, they use the logical bit
> positions of the 16-bit configuration register defined by the
> NCT7715 specification. They are not pre-swapped for the SMBus word
> byte order.
> 
> If this refers to the I2C accessors, the NCT7715 transfers its 16-bit
> configuration register MSB first. The lm75 regmap bus uses
> reg_read/reg_write callbacks. In this path, regmap passes the logical
> register value to the callbacks, and i2c_smbus_*_word_swapped()
> performs the conversion between that value and the SMBus word byte
> order.
> 
> I verified this on hardware by changing update_interval. i2cget shows
> 0xe060, 0xa060, 0x6060, and 0x2060 for 125, 250, 1000, and 4000 ms,
> respectively. After accounting for the SMBus word byte order, these
> are logical values 0x60e0, 0x60a0, 0x6060, and 0x6020. In each case,
> only the NCT7715 conversion-rate field, bits [7:6], is changed.
> 

Sure, it works, because your code converts the bytes twice, as I said.
That doesn't make those conversions necessary.

Other chips also use 16-bit config registers. Just use the same approach.

Also, please do not top-post.

Thanks,
Guenter

> Guenter Roeck <linux@roeck-us.net> 於 2026年9月7日週一 下午11:30寫道：
>>
>> On 9/7/26 01:08, hsyemail2@gmail.com wrote:
>>> From: Sheng-Yuan Huang <syhuang3@nuvoton.com>
>>>
>>> The Nuvoton NCT7715 is compatible with the LM75 temperature and
>>> limit register layout, but its 16-bit configuration register is
>>> transmitted most-significant byte first. Add support for the NCT7715,
>>> including byte-swapped SMBus accesses for its configuration register.
>>>
>>> Handle its conversion-rate field and shutdown bit separately, since
>>> their bit positions differ from the standard LM75 layout.
>>>
>> I don't think so. See below.
>>
>>> Signed-off-by: Sheng-Yuan Huang <syhuang3@nuvoton.com>
>>> ---
>>>    .../devicetree/bindings/hwmon/lm75.yaml       |  1 +
>>>    Documentation/hwmon/lm75.rst                  |  6 ++
>>>    drivers/hwmon/lm75.c                          | 57 ++++++++++++++++++-
>>>    3 files changed, 62 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/hwmon/lm75.yaml b/Documentation/devicetree/bindings/hwmon/lm75.yaml
>>> index b48bf3fd721f..832a8c5d83e9 100644
>>> --- a/Documentation/devicetree/bindings/hwmon/lm75.yaml
>>> +++ b/Documentation/devicetree/bindings/hwmon/lm75.yaml
>>> @@ -31,6 +31,7 @@ properties:
>>>          - nxp,p3t1750
>>>          - nxp,p3t1755
>>>          - nxp,pct2075
>>> +      - nuvoton,nct7715
>>>          - st,stds75
>>>          - st,stlm75
>>>          - microchip,tcn75
>>> diff --git a/Documentation/hwmon/lm75.rst b/Documentation/hwmon/lm75.rst
>>> index ca46754e028b..fac0b8f29ddc 100644
>>> --- a/Documentation/hwmon/lm75.rst
>>> +++ b/Documentation/hwmon/lm75.rst
>>> @@ -150,6 +150,12 @@ Supported chips:
>>>
>>>                   https://ams.com/documents/20143/36005/AS6200_DS000449_4-00.pdf
>>>
>>> +  * Nuvoton NCT7715
>>> +
>>> +    Prefix: 'nct7715'
>>> +
>>> +    Addresses scanned: none
>>> +
>>>    Author: Frodo Looijaard <frodol@dds.nl>
>>>
>>>    Description
>>> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
>>> index 2d2d752aeac9..0b55f6b7c68d 100644
>>> --- a/drivers/hwmon/lm75.c
>>> +++ b/drivers/hwmon/lm75.c
>>> @@ -39,6 +39,7 @@ enum lm75_type {            /* keep sorted in alphabetical order */
>>>        max6626,
>>>        max31725,
>>>        mcp980x,
>>> +     nct7715,
>>>        p3t1750,
>>>        p3t1755,
>>>        pct2075,
>>> @@ -107,6 +108,15 @@ static const unsigned short normal_i2c[] = { 0x48, 0x49, 0x4a, 0x4b, 0x4c,
>>>    #define LM75_REG_MAX                0x03
>>>    #define PCT2075_REG_IDLE    0x04
>>>
>>> +#define NCT7715_CONFIG_RESOLUTION_12_BIT     GENMASK(14, 13)
>>> +#define NCT7715_CONFIG_SHUTDOWN                      BIT(8)
>>> +#define NCT7715_CONFIG_CONVERSION_RATE_MASK  GENMASK(7, 6)
>>> +#define NCT7715_CONFIG_EXTENDED_MODE         BIT(4)
>>> +#define NCT7715_CONFIG_RATE_0_25HZ           0
>>> +#define NCT7715_CONFIG_RATE_1HZ                      BIT(6)
>>> +#define NCT7715_CONFIG_RATE_4HZ                      BIT(7)
>>> +#define NCT7715_CONFIG_RATE_8HZ                      GENMASK(7, 6)
>>> +
>>>    struct lm75_data {
>>>        const char *label;
>>>        struct regmap                   *regmap;
>>> @@ -122,6 +132,10 @@ struct lm75_data {
>>>    /*-----------------------------------------------------------------------*/
>>>
>>>    static const u8 lm75_sample_set_masks[] = { 0 << 5, 1 << 5, 2 << 5, 3 << 5 };
>>> +static const u16 nct7715_sample_set_masks[] = {
>>> +     NCT7715_CONFIG_RATE_8HZ, NCT7715_CONFIG_RATE_4HZ,
>>> +     NCT7715_CONFIG_RATE_1HZ, NCT7715_CONFIG_RATE_0_25HZ
>>> +};
>>>
>>>    #define LM75_ALERT_POLARITY_HIGH_8_BIT      (BIT(2))
>>>    #define LM75_ALERT_POLARITY_HIGH_16_BIT     (BIT(2) << 8)
>>> @@ -259,6 +273,15 @@ static const struct lm75_params device_params[] = {
>>>                .sample_times = (unsigned int []){ 30, 60, 120, 240 },
>>>                .resolutions = (u8 []) {9, 10, 11, 12 },
>>>        },
>>> +     [nct7715] = {
>>> +             .config_reg_16bits = true,
>>> +             .set_mask = NCT7715_CONFIG_RESOLUTION_12_BIT,
>>> +             .clr_mask = NCT7715_CONFIG_EXTENDED_MODE,
>>> +             .default_resolution = 12,
>>> +             .default_sample_time = 250,
>>> +             .num_sample_times = 4,
>>> +             .sample_times = (unsigned int []){ 125, 250, 1000, 4000 },
>>> +     },
>>>        [tmp100] = {
>>>                .set_mask = 3 << 5,     /* 12-bit mode */
>>>                .clr_mask = 1 << 7,     /* not one-shot mode */
>>> @@ -354,6 +377,11 @@ static inline long lm75_reg_to_mc(s16 temp, u8 resolution)
>>>    static inline int lm75_write_config(struct lm75_data *data, u16 set_mask,
>>>                                    u16 clr_mask)
>>>    {
>>> +     if (data->kind == nct7715)
>>> +             return regmap_update_bits(data->regmap, LM75_REG_CONF,
>>> +                                       clr_mask | set_mask | NCT7715_CONFIG_SHUTDOWN,
>>> +                                       set_mask);
>>> +
>>>        return regmap_update_bits(data->regmap, LM75_REG_CONF,
>>>                                  clr_mask | set_mask | LM75_SHUTDOWN, set_mask);
>>>    }
>>> @@ -486,6 +514,13 @@ static int lm75_update_interval(struct device *dev, long val)
>>>                if (data->params->resolutions)
>>>                        data->resolution = data->params->resolutions[index];
>>>                break;
>>> +     case nct7715:
>>> +             err = lm75_write_config(data, nct7715_sample_set_masks[index],
>>> +                                     NCT7715_CONFIG_CONVERSION_RATE_MASK);
>>> +             if (err)
>>> +                     return err;
>>> +             data->sample_time = data->params->sample_times[index];
>>> +             break;
>>>        case tmp112:
>>>        case as6200:
>>>                err = regmap_update_bits(data->regmap, LM75_REG_CONF,
>>> @@ -609,6 +644,8 @@ static int lm75_i2c_reg_read(void *context, unsigned int reg, unsigned int *val)
>>>        if (reg == LM75_REG_CONF) {
>>>                if (!data->params->config_reg_16bits)
>>>                        ret = i2c_smbus_read_byte_data(client, LM75_REG_CONF);
>>> +             else if (data->kind == nct7715)
>>> +                     ret = i2c_smbus_read_word_swapped(client, LM75_REG_CONF);
>>>                else
>>>                        ret = i2c_smbus_read_word_data(client, LM75_REG_CONF);
>>>        } else {
>>> @@ -628,8 +665,11 @@ static int lm75_i2c_reg_write(void *context, unsigned int reg, unsigned int val)
>>>        if (reg == PCT2075_REG_IDLE ||
>>>            (reg == LM75_REG_CONF && !data->params->config_reg_16bits))
>>>                return i2c_smbus_write_byte_data(client, reg, val);
>>> -     else if (reg == LM75_REG_CONF)
>>> +     else if (reg == LM75_REG_CONF) {
>>> +             if (data->kind == nct7715)
>>> +                     return i2c_smbus_write_word_swapped(client, reg, val);
>>
>> This code is double swapping. The calling code swaps (bit settings),
>> regmap calls this function, where the word is swapped again.
>>
>> Guenter
>>

