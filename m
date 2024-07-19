Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9901FA5
	for <linux-hwmon@vger.kernel.org>; Fri, 19 Jul 2024 01:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721354110; cv=none; b=s2IE29EpKy1qYExTYrJ8Gzhfy8GD8UKcx2f+1EPi+RIOZNCF1me+T08HGJwzx4TTLaWuM7nR2IdxczdV6kO4ri46gjQ5VEa47uTAqKLM9xr6jtESf6XmJpM8YV/iBnzA5ZfOLtxGiDtqHKTFsSITSiN+OD36TZ/U36RAMMU2eMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721354110; c=relaxed/simple;
	bh=KXaROGIr6Quq0rdg/DqSUet+SmDHqfA38jPblBL1BBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H4FPf9yaJXOjNM9RK/047sbAx3rQO3Ms1GAnqZgw87D/GlIbEs9NZmrahKmZ28ThJbHyLmLIG7p/SGOoaemFxzQi6lxNX1np/utFv/aj/H/KBKnuwT82bssEt0iVMGDRRwyWWv4qt/U+PoXNhtMzjeumI9A3UU1jYjyScUqO1VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QWeNP8uh; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QWeNP8uh"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fc65329979so9817625ad.0
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Jul 2024 18:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721354108; x=1721958908; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=jD/m0HZC+julbbowlqu8Ik4CQU6DOzbV2YleEHS8/eg=;
        b=QWeNP8uhKn1FTgaPrevaEYF+ZIs5iSL0NYRI/pR0R51KPVHPX8GN8AbzrswK0MoYhk
         leohBowhf1Gvzbs6Dwd1BEBazcRHWZYQoBkiyUyDqxexLyv536f7fm2mVfihdYNnvQrM
         NSGIUaGboD4oLVNGNglqPlTTjdzwAW+GzcenXAy/+pMdpTpr97oVQRaEuMrRUbrhkfSQ
         8pQtaO2NDiYlWu7xBfYqKt8XuuJVsurzyvTW5e6oBZKFSNXRhqxjtTEBuLiHsO0yBHyJ
         phjNbwMsO/g1Ea6L+ztXG3gPqd2kgrDeM1WHjXT+DyrX63XNZF6V3OmIPOdPrwipVyVf
         YPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721354108; x=1721958908;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jD/m0HZC+julbbowlqu8Ik4CQU6DOzbV2YleEHS8/eg=;
        b=iJ4JSsvXOrB0Y2ZuUjlDisht1Crl1dtlR2mZ/lbpBgxhTxN/yZDygIal+wFcldDOZp
         0Pxcdzu33mAk83UqGevIJJx+QkSiJr3zYJQtcI3qNxv1nefK0UuLPXgIWnOdDXLKUD0n
         j0I8oZS3PI+ehg0w0W+PuA/2q2FVhgwnR3PCWKhve2xwuucWs91yIPguBpESUueHsF/t
         74wBasLer9h9NDM3M84J7To3Py/psJRAdUGAhM4qBuaVRTwcyFqfq2CF3kXcIb9XKL68
         RDTam7w5jwDzBOWXqUSU92GqS1eJGPxyyYtNpaL9LwlzdCEeXSNNk0WPWKmRWQElMOJP
         83JA==
X-Gm-Message-State: AOJu0YzdbtNZ3NjlcyqRAzYQDTSrhEBmtzdntOV9Va5AKB9i2w9d5+tE
	l6UR6Zd9W2emggQ9WEzifbkvrfGLG5mJ6eWczKnhEFJeufAhv3IT
X-Google-Smtp-Source: AGHT+IGjf7R3kAncBI0Yryb99H1hB5Ywsaa/nvHLhlnLPMRIWyWNw0/f11mtbwurY5FazzS2lx4Fog==
X-Received: by 2002:a17:903:2452:b0:1fb:1cc3:646d with SMTP id d9443c01a7336-1fc4e278e67mr59419655ad.29.1721354108207;
        Thu, 18 Jul 2024 18:55:08 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd64b5112csm2537725ad.1.2024.07.18.18.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 18:55:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e096acc8-e1b7-4e73-90e9-7a466cac0925@roeck-us.net>
Date: Thu, 18 Jul 2024 18:55:06 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] hwmon: (lm95234) Convert to with_info hwmon API
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20240718033935.205185-1-linux@roeck-us.net>
 <20240718033935.205185-5-linux@roeck-us.net>
 <ZplFeHMIKjHPiwTc@tzungbi-laptop>
 <89c18e08-3a98-4c33-bca4-ea5acba9f6f2@roeck-us.net>
 <Zpm44KVimCVZWhrq@google.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Zpm44KVimCVZWhrq@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/18/24 17:52, Tzung-Bi Shih wrote:
> On Thu, Jul 18, 2024 at 10:47:55AM -0700, Guenter Roeck wrote:
>> On 7/18/24 09:40, Tzung-Bi Shih wrote:
>>> On Wed, Jul 17, 2024 at 08:39:33PM -0700, Guenter Roeck wrote:
>>>> +static int lm95234_temp_write(struct device *dev, u32 attr, int channel, long val)
>>>>    {
>>> [...]
>>>> +	case hwmon_temp_max:
>>>> +		val = clamp_val(val, 0, channel ? 255000 : 127000);
>>>
>>> Perhaps I am misunderstanding, but this looks weird to me.  By applying
>>> the patch, the maximum values are:
>>>
>>> static SENSOR_DEVICE_ATTR_RW(temp1_max, tcrit1, 0); -> 127000
>>> static SENSOR_DEVICE_ATTR_RW(temp2_max, tcrit2, 0); -> 255000
>>> static SENSOR_DEVICE_ATTR_RW(temp3_max, tcrit2, 1); -> 255000
>>> static SENSOR_DEVICE_ATTR_RW(temp4_max, tcrit1, 3); -> 255000
>>> static SENSOR_DEVICE_ATTR_RW(temp5_max, tcrit1, 4); -> 255000
>>>
>>>
>>> However, it was originally:
>>>
>>> static ssize_t tcrit1_store(struct device *dev, struct device_attribute *attr,
>>> 	        const char *buf, size_t count)
>>> {
>>> [...]
>>>       val = DIV_ROUND_CLOSEST(clamp_val(val, 0, 255000), 1000);
>>>
>>> static ssize_t tcrit2_store(struct device *dev, struct device_attribute *attr,
>>> 	        const char *buf, size_t count)
>>> {
>>> [...]
>>>       val = DIV_ROUND_CLOSEST(clamp_val(val, 0, (index ? 255 : 127) * 1000),
>>> 		    1000);
>>>
>>> static SENSOR_DEVICE_ATTR_RW(temp1_max, tcrit1, 0); -> 255000
>>> static SENSOR_DEVICE_ATTR_RW(temp2_max, tcrit2, 0); -> 127000
>>> static SENSOR_DEVICE_ATTR_RW(temp3_max, tcrit2, 1); -> 255000
>>> static SENSOR_DEVICE_ATTR_RW(temp4_max, tcrit1, 3); -> 255000
>>> static SENSOR_DEVICE_ATTR_RW(temp5_max, tcrit1, 4); -> 255000
>>>
>>>> +		val = DIV_ROUND_CLOSEST(val, 1000);
>>>> +		return regmap_write(regmap, lm95234_crit_reg(channel), val);
>>>
>>
>> That is indeed a bug. Here is the fix:
>>
>> diff --git a/drivers/hwmon/lm95234.c b/drivers/hwmon/lm95234.c
>> index c3c68c196479..7da6c8f07332 100644
>> --- a/drivers/hwmon/lm95234.c
>> +++ b/drivers/hwmon/lm95234.c
>> @@ -150,7 +150,7 @@ static int lm95234_temp_write(struct device *dev, u32 attr, int channel, long va
>>                  val = DIV_ROUND_CLOSEST(clamp_val(val, -64000, 63500), 500);
>>                  return regmap_write(regmap, LM95234_REG_OFFSET(channel - 1), val);
>>          case hwmon_temp_max:
>> -               val = clamp_val(val, 0, channel ? 255000 : 127000);
>> +               val = clamp_val(val, 0, channel == 1 ? 127000 : 255000);
>>                  val = DIV_ROUND_CLOSEST(val, 1000);
>>                  return regmap_write(regmap, lm95234_crit_reg(channel), val);
>>          case hwmon_temp_max_hyst:
> 
> With that,
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
> 
Thanks a lot for the reviews!

Guenter

