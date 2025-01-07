Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A6E1F2C50;
	Tue,  7 Jan 2025 15:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736262137; cv=none; b=nNCmLlcccyxA07LTvZ2wDTAxpLU9MFfzA1UG8B/9qTdy/ymV4Npaz9aw5898NBNzlnxEI4oo7gFHJPTSXIrcKIP+D9NFa60Kr92UtF3FlCPYESiU8lRyG4qC3ENt6YNyt1tSqQHFhT8WeOpc/78YDvO2EyfcaYuzMvqAyuPnixg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736262137; c=relaxed/simple;
	bh=K7lWefrhqcbXariEB00jpkbQuw5pJgG3bwTuNG7pFc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K78vxqwoSq+2KiMlIa7ibgkKHr2sMUd2JOwgn2CjL3KSLQKaxslO850wWYu4z17+Zpez6tgb0WQyr6ZXaz5vZJmqSgMmFLqyKzUBEeMboUhFrVqyJqqKVSgwfiyuZtmUnBDznaAVtu2WQqoRChOA6guOdde/e9afCtH0ceEN3KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7ze1gCd; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7ze1gCd"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-215770613dbso172078595ad.2;
        Tue, 07 Jan 2025 07:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736262134; x=1736866934; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=P2drCtN7TTkOhP05Dq8XewxqmwRh+ddtaQW+s8snyjg=;
        b=d7ze1gCdHMLpiinYcC07GJqzaad2GspFYmTpNPUuKeJmF9IiUao/3f5pHExyEIJg6s
         +qWOsBrTgErlDmsT8vls7iTzNMkMVsBKDJiIhcszlmFh/UGqx/wr/RYgYuP4sZMh+cue
         +FPa+QTuQMF12VLVMXTZ1DCoHLASAeFzjk+lQU17IX0LIRvReWj00bzbEgDYVQnffr5A
         2GaJpd8O+K3PIv8rTQ4GfqOWmsjIClk5jRYy2bHkFvMcSO/shwnI6TFgowwGkjhvX/SH
         wxHw36amnOJ2mAtnIvc34WkEywRCnyPFKq3y6PiZ8t7QUnwY+T2b8St6CEHOaQ06V1Ya
         Y4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736262134; x=1736866934;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P2drCtN7TTkOhP05Dq8XewxqmwRh+ddtaQW+s8snyjg=;
        b=PDdQbNijsj4AYVSe/MRePcbprsUmsSwkRyTRgpvPhggNNh5qSrCJQMyCjkJugCW3SJ
         pRu4axOJwbHj2VEgGEC7Lz8vD0zFGci2/NAhT9cB8aIF2GTVFBHcX9ieqvLbUKKmJHXN
         wd2ac85UWiX8a6ohFU545/yNAAGGZz6DKAjVPX7dz+S4nTcth5t69Ks9yq0PWyLJ5Obg
         56bn0aazQdkTM726myzx/OqS5JkKE1oAW0kK286/731iiLryHtpq8HiYyvDVeOBBszDK
         tnuoiWCkPOWA1NQuwpH0q0VUruHzR+DRUw5OrLiVD/+3SB3vadzSQRy8c2UGxqj7NyHe
         5Ggw==
X-Forwarded-Encrypted: i=1; AJvYcCWII2xHSI55CocB+xS1ST1rxLHhjYBaxVSk76vY3UZrZYSj5o7QxRsxakKVEPtK8dect/S3F4fqrNtS4Wtk@vger.kernel.org, AJvYcCWU2fzWh+oo4M1GxCvYmohYr6fYfGEMiCS1CN6dXAbHcIE775EX1h9joWgvnTyXlR6FhNFZoIQahQSmiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1LCVOkvhM2+GTp+idz6SxVxR3bEf+l2e+6bm2siXVvGT3KQeP
	2ibjJHZHYaPs1zkMKmo959oeTy/KVxeoyGrMv0CZ7B6EJeeyd4mryLQidA==
X-Gm-Gg: ASbGncvy/Yq950RjHqCbN5wqbs0a1TU/M7aaNuTDyIpHbfu80LYY5CbefUnnkQRJDK1
	+sihuqIRO/+NA/gmN+8Ny07/3BW7VQ0ObmGoo2+2KrEfVg23Pgs9Z52u2XRMZD2L89+h8jyhWYm
	i3TitC+4LO4L7IR6Ncfgm8CvzfyBghofDYOSp80zAu719g8UL2PvVBbDnfXtiUNMIu4mY3SijLO
	J4F85BLXM/JUv5ogwcFF5/Op+9zzOIMkDg/jsQRFTvMSGrI5+S+EBTd6WQardz7WjO4AecUbmP3
	O1fZb0/dJN0p1f95ZKbhV8hU63oxSg==
X-Google-Smtp-Source: AGHT+IH5wWDZYUEMdWkjbelSdrE2VSC/ucrvKSNIr+1QAsA50xeaEBxEadavv6pUhp3o3rduZMpdDw==
X-Received: by 2002:a05:6a21:670b:b0:1dc:7907:6d67 with SMTP id adf61e73a8af0-1e5e081c8d0mr105300907637.40.1736262133896;
        Tue, 07 Jan 2025 07:02:13 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad90c107sm33497904b3a.179.2025.01.07.07.02.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 07:02:12 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4f707f3f-8929-4453-8b18-285594b5f99d@roeck-us.net>
Date: Tue, 7 Jan 2025 07:02:09 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hwmon:(ina238)Add support for SQ52206
To: Wenliang Yan <wenliang202407@163.com>
Cc: conor+dt@kernel.org, corbet@lwn.net, jdelvare@suse.com,
 krzk+dt@kernel.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh@kernel.org
References: <fac339de-9c01-4556-a172-e5b30233e5d1@roeck-us.net>
 <20250107124359.24221-1-wenliang202407@163.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250107124359.24221-1-wenliang202407@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/7/25 04:43, Wenliang Yan wrote:
...
>>> -#define INA238_REGISTERS		0x11
>>> +#define INA238_MAX_REGISTERS		0x20
>>
>> Why this change ?
>>
> 
> The maximum register address for SQ52206 is 0x20.
> 

That isn't what I referred to. Th value change is ok.
The question was why change INA238_REGISTERS to INA238_MAX_REGISTERS.
That is a personal preference change. I strongly discourage such
changes because if I accept them someone else may come tomorrow
and change the name again to match their preference.

>>> -#define INA238_FIXED_SHUNT		20000
>>> +#define INA238_FIXED_SHUNT			20000
>>
>> Why this change ?
>>
> 
> Also refer to the chip manual provided in the website above.
> 

The value didn't change. The indentation changed without reason.

>>>    
>>>    static int ina238_read_reg24(const struct i2c_client *client, u8 reg, u32 *val)
>>> @@ -197,10 +239,10 @@ static int ina238_read_in(struct device *dev, u32 attr, int channel,
>>>    		regval = (s16)regval;
>>>    		if (channel == 0)
>>>    			/* gain of 1 -> LSB / 4 */
>>> -			*val = (regval * INA238_SHUNT_VOLTAGE_LSB) /
>>> -			       (1000 * (4 - data->gain + 1));
>>> +			*val = (regval * INA238_SHUNT_VOLTAGE_LSB) *
>>> +					data->gain / (1000 * 4);
>>
>> Why this change ?
>>
> 
> Because INA238 only has two gains of 1 and 4, the previous formula can
> be used, but SQ52206 has a gain of 2, so I changed the formula
> 
Ok.

>>>    		else
>>> -			*val = (regval * INA238_BUS_VOLTAGE_LSB) / 1000;
>>> +			*val = (regval * data->config->bus_voltage_lsb) / 1000;
>>>    		break;
>>>    	case hwmon_in_max_alarm:
>>>    	case hwmon_in_min_alarm:
>>> @@ -225,8 +267,8 @@ static int ina238_write_in(struct device *dev, u32 attr, int channel,
>>>    	case 0:
>>>    		/* signed value, clamp to max range +/-163 mV */
>>>    		regval = clamp_val(val, -163, 163);
>>> -		regval = (regval * 1000 * (4 - data->gain + 1)) /
>>> -			 INA238_SHUNT_VOLTAGE_LSB;
>>> +		regval = (regval * 1000 * 4) /
>>> +			 INA238_SHUNT_VOLTAGE_LSB * data->gain;
>>
>> Why this change ?
>>
> 
> Consistent with the reason described in the previous article.
> 
Ok.

>>>    	data->regmap = devm_regmap_init_i2c(client, &ina238_regmap_config);
>>> @@ -564,48 +673,15 @@ static int ina238_probe(struct i2c_client *client)
>>>    	/* load shunt gain value */
>>>    	if (device_property_read_u32(dev, "ti,shunt-gain", &data->gain) < 0)
>>>    		data->gain = 4; /* Default of ADCRANGE = 0 */
>>> -	if (data->gain != 1 && data->gain != 4) {
>>> +	if (data->gain != 1 && data->gain != 2 && data->gain != 4) {
>>
>> Chip independent changes should be in separate patch(es).
>>
> 
> SQ52206 has a gain of 2.
> 
Ok.


Thanks,
Guenter

