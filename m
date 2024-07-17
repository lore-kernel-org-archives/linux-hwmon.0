Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C41181313
	for <linux-hwmon@vger.kernel.org>; Wed, 17 Jul 2024 14:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721227035; cv=none; b=TAlab4Fc+9RjxylZdOjVcDSeTeE5sw5p6TZ45Y4+XGCCSIRXYqvqjv9qlWMQcyW0QJxmI9VZGxZPAscOKXPxqlVeLZmOPESQdVlZqXNLb4KA3FZcuSZvAnC6Hqyc66KKGiDMnDA+f3E7PLdIKgmJdDK+o8+IQRVbl3lWFTkoiDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721227035; c=relaxed/simple;
	bh=0ZjwxX3yIBKO6pluZrBxwCKd8Hx46ACgdTx2RrokriY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YPbdQlMOcICiQbviKw4Cd2e8Fo8bJdfVyp+x3bExt//Xxqug7K66XUyB9KNaQBjbqa5YUkLkjpfoI9yxTvhwf8BaKG8i5RuISt9n1+jMgIP/FbMr9o9ALLK5y25Dk5RRsER1o5Kop7CoDugRKNiIgbZdtyJKi6gfuUhmBDqfnik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=imYWm0I+; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="imYWm0I+"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1fbda48631cso6647475ad.0
        for <linux-hwmon@vger.kernel.org>; Wed, 17 Jul 2024 07:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721227033; x=1721831833; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=+lSgHeSjSPl/fPTi6N+qdo7sKz38u6MbH3ebLOYp8C4=;
        b=imYWm0I++Y0rslCDwM8Rw9hGnMDt0WfIEqHA73SOwMOlS7wYGEFkFnl0LUKxVYfqht
         sSmxMRnBD0//+TqP9titJ38U8qVdZeL4snZMjWWKtA3K1HCvpIzQHv7Rod+zb9Jranuj
         7KLtv86aZzFCvhSKxxN0bhVMlDsjqVkA9yX73n5YEOlD1Nj6tknLo+LSwJK4bA5xUAG2
         8m7LVsMTmdfSBVyI8P5pA2oihCfYapAjAByuyc4bwY27ppZQvFp2V5WtEyERix7r8bEJ
         qPM79xFhtuxrzuQZI/j2IL7xc/yWMqK/hOgu6Uf2Mmui0I3OX/PRUcHaPkNy1WlFLcw/
         BBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721227033; x=1721831833;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+lSgHeSjSPl/fPTi6N+qdo7sKz38u6MbH3ebLOYp8C4=;
        b=MqI1ZXbcFHKbxImaq5kh0pVOiA83rcrA19oaMLt+p27dXAlulOzGPZ71GUKMhhiSjy
         ne7EXhqlh3319D8zsirOvc+1a9KAc/eeDcEWi9h7qptH4vF3NDfNPsi6n/pNUXLvwevV
         EarNTqcHz7lAp3JCzFXhGraKrF74N0R3T7QyJX8aqaACRJVwmY4qJBBwu9i+K+Q2ibf2
         rFfrk2sb1AxgpgY+SBQt/tnkeN6UMjB48sZwC86HBxLtkmRa8WSsP5xvYl9iF27z6aSV
         /ryyuZ7YkIuxbogAa6cQnxAiAspYh/uxErb/WxKmNttsZWSJ/9K1rfg8QG0an00VgEsV
         IXmw==
X-Gm-Message-State: AOJu0YzUYk0rpR35uW/JCt/2nqFeGSGkBxpdmGe3xxLAZBM4HwPNCGHl
	6aijVs3AsEZjSDtWS6WR5VbDSSq0sQ3OvqWrrWgqea+qtDo9BOhs
X-Google-Smtp-Source: AGHT+IF6tKM053s866xGQuoKbitCYwu5FzodllCL97NH7SnxPqpYtbf/s+DhTcGXUqzdfi50C0sN9A==
X-Received: by 2002:a17:903:11cf:b0:1fb:8924:dfae with SMTP id d9443c01a7336-1fc3e5dedf1mr89063045ad.1.1721227033231;
        Wed, 17 Jul 2024 07:37:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bc53fc6sm75900475ad.294.2024.07.17.07.37.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 07:37:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4b195103-5f8a-4251-8612-7ec51f07bd2d@roeck-us.net>
Date: Wed, 17 Jul 2024 07:37:10 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] hwmon: (tmp464) Use multi-byte regmap operations
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20240716230050.2049534-1-linux@roeck-us.net>
 <20240716230050.2049534-5-linux@roeck-us.net>
 <ZpfIqtrclTDsTy0x@tzungbi-laptop>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ZpfIqtrclTDsTy0x@tzungbi-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/17/24 06:35, Tzung-Bi Shih wrote:
> On Tue, Jul 16, 2024 at 04:00:48PM -0700, Guenter Roeck wrote:
>> @@ -147,11 +147,11 @@ static int tmp464_temp_read(struct device *dev, u32 attr, int channel, long *val
>>   {
> [...]
>> -	mutex_lock(&data->update_lock);
>> -
>>   	switch (attr) {
>>   	case hwmon_temp_max_alarm:
>>   		err = regmap_read(regmap, TMP464_THERM_STATUS_REG, &regval);
>> @@ -172,26 +172,27 @@ static int tmp464_temp_read(struct device *dev, u32 attr, int channel, long *val
>>   		 * complete. That means we have to cache the value internally
>>   		 * for one measurement cycle and report the cached value.
>>   		 */
>> +		mutex_lock(&data->update_lock);
>>   		if (!data->valid || time_after(jiffies, data->last_updated +
>>   					       msecs_to_jiffies(data->update_interval))) {
>>   			err = regmap_read(regmap, TMP464_REMOTE_OPEN_REG, &regval);
>>   			if (err < 0)
>> -				break;
>> +				goto unlock;
>>   			data->open_reg = regval;
>>   			data->last_updated = jiffies;
>>   			data->valid = true;
>>   		}
>>   		*val = !!(data->open_reg & BIT(channel + 7));
>> +unlock:
>> +		mutex_unlock(&data->update_lock);
>>   		break;
> 
> I think the function can entirely drop the mutex.  Only [1] needs it.
> 

It is needed to protect updating open_reg. Otherwise a second process
could enter the code and read the register again, which would then return
different (cleared) values. As result open_reg might contain the temporarily
"cleared" values.

Process 1			Process 2
err = regmap_read();
data->open_reg = regval;
				err = regmap_read();
				data->open_reg = regval;
data->last_updated = jiffies;
...

Thanks,
Guenter

