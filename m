Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71C21B5EA2
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Aug 2024 15:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725031975; cv=none; b=d3Jn+QphfLh6U0Ncyf1nT5FkGZFU0yIFJQSzVucooYwa62ydp3s0C4Arw4hsKhOb1bVcIrJUNb7NFpRKwUPSmptXrfahdjIhDj8ZumoLoEhe3ejZAq5ISYVWptU8OjHZ/vKZAO++jMrwK7eq3IM1Flms+HXpHeKxtS4AtAPuP18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725031975; c=relaxed/simple;
	bh=jlfm0e0N8OpEJJOWD2ohXQo8P5hK/qhcjbae7DjoYD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QYVyODQQBAKXPiEVVg2Fagwzxu/Xtqqnwf2oZWCUkEPVfje9NEkpB+qT2ISmlYwfkEK/2dddUdpRUSL5d1fm+AMt2B6cYkd7jfKoqiWAFVEv1MCfwsJj1gZ7dRvC/RqRVxschM8p/giaWYFg3LrHumnvzbFQwo8uoygsxMYPhw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NSyWZGad; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NSyWZGad"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-714187df604so1903072b3a.1
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Aug 2024 08:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725031973; x=1725636773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=RJB6+kQg+XuVjWnh6snh5elB0KOqqKsgKhECqidIO6I=;
        b=NSyWZGadxkNv6cbxvG4ORiAcjuBX3TA8tvAg25thUqzzATbPUeIgDrYqH2XHLGFB2j
         2Szj/J/bg71AUzmqZrUzG2Rfc84RhCRRs5OWM3THUBrSr3IZkSr64HtM4L+mSop05er1
         K4SQy9aO66km2KDoFqezVopy65ttCN0z6ejyO1awv4Gp7VVKaTQFPxHHOq7qP/ghcTt9
         qDv9nXzlfPgToy9z4l1xbtILuajSEbW0XmAUemMmYd228VlE2ZNGtNd8m3oVnNDMJdH5
         naTal15rxNC9+YpGA0zaw73m1C15drlIhHdkYw/18sCW1Nau6wdVYXIJFJktprcnhKtP
         zHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725031973; x=1725636773;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJB6+kQg+XuVjWnh6snh5elB0KOqqKsgKhECqidIO6I=;
        b=KUejA2ujrJtCxaPhBMD+Ni2NmkzgeF4EHDPMqQj0UN6s2tIx8weRwt729KS1CGvnKt
         qYzKY5MQID0Gql4C9zazn10zPmryprnLLwboJ5hjADK9AQMc6VQNsk2e2m29JTqwWwdH
         kM/S1NyWbj5DIzxvRgKAtYYW8OLkORP9NRyYEbt0WSVCx1TmpRPaMcEGbLIgHE+X2z9l
         DuUN8C+nRr5n87z/6sOQSJZF2yyWV3kAif3bcywsUGB2TzwY//Wn7w3tL1LIVBLVMnfC
         G1NV5gNX67WekRQMUesohERPRt59gfwGoNMiXzHYNRJbBxz20XjMhMPhO4IfOQjgmdXW
         LcUA==
X-Gm-Message-State: AOJu0YzAyAqOG0ScgpxYSQuGBXu1ctz6AGccGZBSa2oRUYmRKkQmTlo4
	TlONHeRK3gcBSpnyBBF0DwNfglZkRXqblHa3CXOSW8VJ8aoIEgo7A6DKQg==
X-Google-Smtp-Source: AGHT+IEBIu3bcrw/WP9ChIOCjeE9wDhWCnXAzIs6b3x93ZwTzpitPLGDmSJFFwKo7j2QP29zuLObng==
X-Received: by 2002:a05:6a21:e8a:b0:1cc:b09f:4776 with SMTP id adf61e73a8af0-1ccee5b7d35mr3919002637.0.1725031972777;
        Fri, 30 Aug 2024 08:32:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e569e0edsm2903692b3a.137.2024.08.30.08.32.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 08:32:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <086b55b2-42ab-4cfd-a7aa-31c484ffbd92@roeck-us.net>
Date: Fri, 30 Aug 2024 08:32:50 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/14] hwmon: (ina2xx) Convert to use with_info hwmon
 API
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20240830010554.1462861-1-linux@roeck-us.net>
 <20240830010554.1462861-12-linux@roeck-us.net>
 <ZtG7VaILKoZUHTkC@tzungbi-laptop>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ZtG7VaILKoZUHTkC@tzungbi-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/30/24 05:30, Tzung-Bi Shih wrote:
> On Thu, Aug 29, 2024 at 06:05:51PM -0700, Guenter Roeck wrote:
>> +static int ina2xx_chip_read(struct device *dev, u32 attr, long *val)
>>   {
>> -	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
>>   	struct ina2xx_data *data = dev_get_drvdata(dev);
>> -	unsigned int mask;
>> -	int alarm = 0;
>> +	u32 regval;
>>   	int ret;
>>   
>> -	ret = regmap_read_bypassed(data->regmap, INA226_MASK_ENABLE, &mask);
>> +	switch (attr) {
>> +	case hwmon_chip_update_interval:
>> +		ret = regmap_read(data->regmap, INA2XX_CONFIG, &regval);
>> +		if (ret)
>> +			return ret;
>> +
>> +		*val = ina226_reg_to_interval(regval);
>> +		break;
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +	return 0;
> 
> ......(1)
> 
>> +static int ina2xx_power_read(struct device *dev, u32 attr, long *val)
>> +{
>> +	struct ina2xx_data *data = dev_get_drvdata(dev);
>> +
>> +	switch (attr) {
>> +	case hwmon_power_input:
>> +		return ina2xx_read_init(dev, INA2XX_POWER, val);
>> +	case hwmon_power_crit:
>> +		return ina226_alert_limit_read(data, INA226_POWER_OVER_LIMIT_MASK,
>> +					       INA2XX_POWER, val);
>> +	case hwmon_power_crit_alarm:
>> +		return ina226_alert_read(data->regmap, INA226_POWER_OVER_LIMIT_MASK, val);
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
> 
> ......(2)
> 
> Just noticed a nit: there are some *_read() and *_write() functions mainly
> contain a switch-case block.  Some of them returns 0 at the end of the function
> (1); some of them don't (2).  (1) should be unreachable, however, I'm not sure
> whether some checkers might complain about case (2).
> 
Checkers are fine with it as long as each case statement returns. They actually
complain about unreachable code if there is a return statement at the end.

I've tried to return directly from a case statement if the return value from
a call is also the return value from the function. This is to avoid code such as
		ret = func(...);
		break;
...
	return ret;

or, worse,
		ret = func(...)
		if (ret)
			return ret;
		break;
...
	return 0;

and instead use
		return func(...);
directly.

On the other side, if there is some code to execute after a function call

		ret = func();
		if (ret)
			return ret;
		do_something;
		break;
...
	return 0;

I tend to use return values and break statements. Maybe that doesn't always
work out. I'll keep it in mind for the future.

> In either cases, it would be great if make them consistent.
> 
> With that,
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

Thanks a lot for this and all the other reviews!

Guenter

