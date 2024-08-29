Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD361B6535
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 17:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724952519; cv=none; b=aj0ayqODAItUPXepySKBg4KKvrQ3804/1Oqr1EVJe6+/oW8IvZnrBZzOk8a0WX3UXT9VRCqC7m7Ubh1UqCn48tHVzVXWb0ko704ytbz1NO/hQylOAEVadqgygIeO6igE6o3gvExzprcIwIwj9EwjMwyWkQ82GkVri+Ucz0cnzcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724952519; c=relaxed/simple;
	bh=n5KZiRvxKmAEa7FprQL+OCcz0ooFhX2lqleMpuDEySs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ffqFLN6grC5gc1GNcAxapko959quxQcMxO5lXqnxbLZaILN2eJDZs4fyVUwyEwAeNS6VZW3yb3kmBqZdLHshtDjqCR6wN+cgzdkjm0s3oDyVTkUwSC76ecvPFkjvUYGz+kw354eLYLcF9PhHu5SPVgfsagBhqsCbfnHSqWdp3jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OKKvxviG; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OKKvxviG"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fc47abc040so7742675ad.0
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 10:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724952518; x=1725557318; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Z87W5O3lBqcqBJVBTmbzH5ICHlgf77OF8uoeggiliZU=;
        b=OKKvxviG1rfPQ+mwMeJPy564rx19dfwNK2T8j/qgw4VjjgNGOV4T3aVYMdS2Y/Ytpc
         jMVwwTJI0czbahs0P6qJ0CAXNgdPlQ+ED9KqAmqKa7cOpSXiIXExvbC+08JMh1fFgQt7
         0q7y1fT8gRIt+/ryk5w+9Enoaq9eAVa2LwWLgi++OcxStYyIewNz158wE2rW4ac+rux9
         vY/ZYmpz8JQZiZAwPZn8ByJxh2MzY3VdM8nQpId5DJL6EexEpMttRHG1f32GsQpeMYvY
         +iOJ+XwAa0y3spTc96eDmivqDSwtO73JZCdLgq+IYGYaHNSV27IFxszS/bWZkoFHNU/n
         Imbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724952518; x=1725557318;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z87W5O3lBqcqBJVBTmbzH5ICHlgf77OF8uoeggiliZU=;
        b=QDK6c8tDBbKikgB+QXlDC7EuO4BUG4pR4hjkFm9PzcW3wAIKSVWVVSbDASl4LVOEQA
         stJsd/UqFA7TbQErELe+6V9m2FZvhVd8bbLqAJLHMGzY3vXUopSuLci0TtmtCt6wEjoJ
         kO8tazRFx2anp/mwnbsKIvpKyCb3PZysTSCV15/qjiaTjkA3qc4vATPZbbnuxpXh3INr
         Vnv9/xGjgp3KVk0N54pi0RoUzCA8jEnF2IdHDY1Dpw3MFrZyHNFW+rZcRczoMm7AmHNG
         ATAvOuwXukOZaKhkpcYydsZ+IFbdQmqZMUx9Nln8iXebmZ1m5D8+xWYWVAkSbBj01p4Y
         SdWA==
X-Gm-Message-State: AOJu0YyzkLSkXdTnZyqkxfdaR2EVHznBPu4GQrmdWWBGPjSG9OaBklto
	zwEVbswP9t4kPhovsYnQ/L5D95/hMrugVN9pb0ny7ZMNRZYnTOmHpZ+j7g==
X-Google-Smtp-Source: AGHT+IHUtLvMSrKpzm/kS4nbw8Ourj+fI86S+ipkFcevJJhX6m0+3floQu2wSSucol6HMc9I76u22w==
X-Received: by 2002:a17:902:ec91:b0:1ff:6b6e:d2bb with SMTP id d9443c01a7336-2050c42d75dmr45096735ad.45.1724952517581;
        Thu, 29 Aug 2024 10:28:37 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20515549e37sm13871845ad.239.2024.08.29.10.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 10:28:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <695342d5-2512-468f-b2c1-5c429f0af617@roeck-us.net>
Date: Thu, 29 Aug 2024 10:28:35 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] hwmon: (ina2xx) Set alert latch when enabling
 alerts
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20240827153455.1344529-1-linux@roeck-us.net>
 <20240827153455.1344529-8-linux@roeck-us.net>
 <ZtCLvaC0Ls5zEovD@tzungbi-laptop>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ZtCLvaC0Ls5zEovD@tzungbi-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/29/24 07:54, Tzung-Bi Shih wrote:
> On Tue, Aug 27, 2024 at 08:34:51AM -0700, Guenter Roeck wrote:
>> @@ -440,7 +441,7 @@ static ssize_t ina226_alert_store(struct device *dev,
>>   	 */
>>   	mutex_lock(&data->config_lock);
>>   	ret = regmap_update_bits(regmap, INA226_MASK_ENABLE,
>> -				 INA226_ALERT_CONFIG_MASK, 0);
>> +				 INA226_ALERT_CONFIG_MASK | INA226_ALERT_LATCH_ENABLE, 0);
>>   	if (ret < 0)
>>   		goto abort;
>>   
>> @@ -451,8 +452,8 @@ static ssize_t ina226_alert_store(struct device *dev,
>>   
>>   	if (val != 0) {
>>   		ret = regmap_update_bits(regmap, INA226_MASK_ENABLE,
>> -					 INA226_ALERT_CONFIG_MASK,
>> -					 attr->index);
>> +					 INA226_ALERT_CONFIG_MASK | INA226_ALERT_LATCH_ENABLE,
>> +					 attr->index | INA226_ALERT_LATCH_ENABLE);
> 
> Does it really need to clear and set every time?  Could it set only once in
> ina2xx_probe() just like ina2xx_set_alert_polarity()?
> 

The idea was to clear any pending alerts when changing the monitored limit.
As it turns out (I checked with real chips), this is not necessary;
pending alerts are cleared if the mask is cleared/updated even if the latch
bit is set. I made the change as you suggested.

Thanks!

Guenter

