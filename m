Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBEB1925B3
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Jan 2025 18:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736447076; cv=none; b=m0aRCt/3AJaK+dqZwYAVTPkOOKc1ruVN92nKCOkxeuw2rLQH8nfwsmfN31NR6qXRnUMvwgMtXF9x1helguBJzV+ln1WwS+QjS97d6zVt2KHmBCDCTDW0JNvpNapZIMLp3Jn+9q/zdxcYBnAGCHtfKk7sxh7bExwsBXbMNByq3p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736447076; c=relaxed/simple;
	bh=tLiva/zQLV9Z/blAVGv4JVuKl1R7ok4T6hOwpkSktx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XfuRZqpAXhKV8jH3B7/1Bb147PHYyZzzRKl1VYgIgg6Ra615VbNOPA/9KCZ9l4mlTDMQWbFZh8LDaI4CabpKyCpnp+2Pd2lEGJbUi3XbqXxlu/S/PuynIk89MZd1+njNIHxY/2ZvGShulkjpqQrLetg1MMhp3ThseuNh4bUgBIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GjJEkXVh; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GjJEkXVh"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d3e9a88793so1862828a12.1
        for <linux-hwmon@vger.kernel.org>; Thu, 09 Jan 2025 10:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736447073; x=1737051873; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SmzMxmJ01X79jiFNwWxAnLYNX/j0ZR38E8ld+MW4zgM=;
        b=GjJEkXVhYfOicSoOaALNfeTfn56SCyX9r9Jc6+yvY3JW1jFe/zuzXMJWeMzs47oIZm
         2MBqt2fzq9NHVYE+8qDbgAty8rTLWBVJC95fhk7mVsc92Z2cgf4R/Q843hsa1LgznFrK
         FFxvHriibeHSnf570qmX+ZK96ZdqbceH1T25cgUBqL4N5ZsrBh3FgxeYPA9Fq13sADjy
         gRsnaXFjWrvNSSMLS6RNAzwbyUNDbK2mV5SUJLPJLExPacAu2pxdwH1469K20zTgG3kJ
         vhaj+usUqHIbKShS38oqMf4DGMxMfI2lBVwGyrwJZPqHQYRnwPzEQusgysp9OlRqT6Tz
         uz7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736447073; x=1737051873;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SmzMxmJ01X79jiFNwWxAnLYNX/j0ZR38E8ld+MW4zgM=;
        b=edssgjJd7Idnr50KYa6MDPb0anKZaWIV4CLOxa4JlihPZoe7x3SGE4Q4xnE3N9cysS
         tqx2/Uyn2y/xoFydWKQWzHQKdqeZ1ipVbtGx9P640NUnnIzdPzkbBPfgedZFzYIeswmW
         m5Ka5BKYGGqCYn9OMexS0B47+m3Lz6dS+/JU3HAUBHx0bbVjsSsvFB0FvNy4l9f9EQID
         qXjiiWudTFDA2ayel9EFS+l3l2eDjRk/p0RCrDeWP3Mu14Gq3I3Dn4xwL8LAPazsgCqj
         xS7xyHjOEgRR8wfOG1x69M4nPcGhWAYVR6guTSSa6cRyvRKfiEbA1CpNNQYl/H3yCQf7
         tm7w==
X-Forwarded-Encrypted: i=1; AJvYcCUCrB5Art/pwe1kN8fEq2SbgmI5bFRsshx0xzdZnO/7lrfYSPKFTLeWYquJBo2zbj1ZsLDmC5XTsQ93dg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw88uEbNlCXKTtHZg9c3coHWi2Ws4lDSLnz0ErLLbPooTBagHDY
	MjiLFBJ5Tqi+zuyn8H6UjXxGdcIhUVZ43NFo6mROzjdXvgvCTME7
X-Gm-Gg: ASbGncs16MAb2FTUidR97Rr62zmstMQnsUWtEO20RmaON/xG8z+tRufbnLX/LKfLgtV
	htUDVebVcDX8XQVwyWdoYli0/dYO4CptM1hynq1UhBhG2Y+B5oCqUw0iai8aRxkN4wQTvnhH2eS
	QSl//6ZQCJ86Bb5uDqj/x/f/HNoS3yTanxF4tEcWEAahdzYbSzM38LVM3073b+S3o1WT4A+Xg7o
	MHXXAwe6akdseX34bA0eIfkMZCP44b02Qc1UmglqoefocFbEXRsHzd0isPrwgEkVo2YCVcxSDz1
	8Dd+V7HLeFDn4t7DSUBUbi0PlDuZ7HGmf72gdJ703X0EbFwdzhQQYxec5vOxU0ebsYQayoCJ2ZO
	tbnGXYFysCKHjQLwtOu8Va7vsWcGQVFmZe6R2094JAoc6gsAR
X-Google-Smtp-Source: AGHT+IHfILjqR52u+AGPtc6dIttISzE1BEmu5h4uurV/mkEkgWOtkK2kZ7egB7q4yCfbb1PKMF3/Sw==
X-Received: by 2002:a17:906:4fcf:b0:aab:cdbd:595a with SMTP id a640c23a62f3a-ab2ab66cee5mr655697566b.3.1736447072736;
        Thu, 09 Jan 2025 10:24:32 -0800 (PST)
Received: from ?IPV6:2a02:3100:ac5c:5700:44f4:3326:ed45:6e1e? (dynamic-2a02-3100-ac5c-5700-44f4-3326-ed45-6e1e.310.pool.telefonica.de. [2a02:3100:ac5c:5700:44f4:3326:ed45:6e1e])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ab2c9647299sm94958666b.177.2025.01.09.10.24.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 10:24:31 -0800 (PST)
Message-ID: <9a237886-ba5a-44b2-a607-e2677c17063e@gmail.com>
Date: Thu, 9 Jan 2025 19:24:32 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (core) Use device name as a fallback in
 devm_hwmon_device_register_with_info
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <1cb1c77b-177f-4b03-9fcc-9c892391e654@gmail.com>
 <51d9548f-3182-40b2-a832-b1c4afd117ad@roeck-us.net>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <51d9548f-3182-40b2-a832-b1c4afd117ad@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.01.2025 19:00, Guenter Roeck wrote:
> On Thu, Jan 09, 2025 at 06:03:17PM +0100, Heiner Kallweit wrote:
>> A number of network PHY drivers use the following code:
>>
>> name = devm_hwmon_sanitize_name(dev, dev_name(dev));
>> if (IS_ERR(name))
>> 	return PTR_ERR(name);
>> devm_hwmon_device_register_with_info(dev, name, ..);
>>
>> Make this a generic fallback option and use the device name if no name
>> is provided to devm_hwmon_device_register_with_info(). This would allow
>> to simplify the affected drivers.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/hwmon/hwmon.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
>> index 685d4ce8d..1fd3d94e1 100644
>> --- a/drivers/hwmon/hwmon.c
>> +++ b/drivers/hwmon/hwmon.c
>> @@ -1170,6 +1170,11 @@ devm_hwmon_device_register_with_info(struct device *dev, const char *name,
>>  	if (!dev)
>>  		return ERR_PTR(-EINVAL);
>>  
>> +	if (!name)
>> +		name = devm_hwmon_sanitize_name(dev, dev_name(dev));
>> +	if (IS_ERR(name))
>> +		return ERR_CAST(name);
>> +
> 
> That introduces an undiscussed change: It handles an ERR_PTR()
> passed as name parameter, not just NULL. Why would that be warranted ?
> It may not look like much, but it introduces an inconsistency: Other
> pointers (dev, chip) are not checked against ERR_PTR(). It is also not
> immediately obvious to me why the driver would want to check if the
> passed name is an ER_PTR().
> 
If a caller would pass an ERRPTR as name, we'd be in trouble in
__hwmon_device_register(), when the following code is executed:
if (name && (!strlen(name) || strpbrk(name, "-* \t\n")))

By doing the IS_ERR() check outside the if(!name) clause we get
a little bit more of argument checking for free, at least with
no code overhead.

If that's not wanted I can also move the check into the
if(!name) clause.

> Guenter
> 

Heiner
