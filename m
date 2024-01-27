Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3875025615
	for <linux-hwmon@vger.kernel.org>; Sat, 27 Jan 2024 17:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706377695; cv=none; b=d8mH35NQkqroWLZRzkmRxUD9zR7nJAfgRUQIIOJ6VKqJi9slxZ2892GWpxWEfCUodGJkn9MlvF4wsAKR/oNfso2N6oA5VZgqq2YcuGG6QNbj1Igv+bqFO+RXKSycWWnsmrw2MDOEUDcwNnLch6aAU6J0snXKhFuU3doaOUOXcZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706377695; c=relaxed/simple;
	bh=kCyXs9HQHCTn861GQasyj9sH4dZsxbY2n9BrAASxr24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jPUYnnZ1lGvK8DfuhrwlE61AGCqSWTv33nKaWWD61kFUigJwDD+DKURvSLXoVH/n89ajUECQ0ZV+O5GE/rFH2An98QVFe7Ga+f5nxFR0s8ACuHHeA0n8MbUY04hXUeqSNqT8hug+xvAsuVTxvBb9rMEdZ5loupIKxGihKcZNw1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BtTK3V8/; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtTK3V8/"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-29026523507so1406163a91.0
        for <linux-hwmon@vger.kernel.org>; Sat, 27 Jan 2024 09:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706377693; x=1706982493; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=xh72azyJ9boZ5v+hZPH/pzm0wlm8lTL9+TTT+38u0RA=;
        b=BtTK3V8/OGTvLKzeV9GmtEqoomp6vcNEs8NXvpk0IJZ+KK1BCcRx8wKidENFtVrZSx
         twoZYYLvyxjjnzjauzcJE4sEH8OuhKE8kBvx/3SlXIXJm7jT+knSyPsqw0t9sx4BTx7/
         m93XPIMmcqq5MQPrPmu6YNof+SMwQW2Tz59vAQ5Hw1mhaWXh0buW23rU7biF0+4mC+qz
         E2Z5Ems00ycseywd3mVFpDR3oo6PvfrkUtuyKxsT04QlCtgw2HcvslJyK2HXhWG7mtWU
         Iqp1a09V9P5Heqdu8PyD77QCO1tVODSsN0ISS3+gjDBiaChfN3gS1Vy6I0T55TDxXtMA
         hdnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706377693; x=1706982493;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xh72azyJ9boZ5v+hZPH/pzm0wlm8lTL9+TTT+38u0RA=;
        b=Q26W+AeT9nI828FzMSAkJafF2EugZHbr5UTINdo9jloNnHWQcNRLA+fa9LUHXl3x8k
         ZUPlfEKEDQoCTzaLsCKWC8hqiYIn4eBBHwba7CSTxsfs7lIMc8af84u2nOeUs+OJHTOG
         pS0QVW0L1Tmek4EqCDGD8/wn6eP/qw3aovA2z5TQA859qFupntHgXbRXYsvzQQpfo8Ku
         1wCdrriWPqmpRxiy1Svet2c339J+WUQQjyj01gC/HEsj2kCwr30Ckw4dTZbMLj5syM4Z
         5Yu1f2Nt/LqA7PQXI9hdVTlGIQ3eAI9vqcY5qS8ybMS2juH7rcksN8MUP9nr1KctMdiL
         3nIA==
X-Gm-Message-State: AOJu0YynXGjmcvFC/c5ICcB9K9ry73zr64eY1u0cMGfPvTTtiaNChorB
	XkLzr+2qL4Jma6c6ZeeZiSGjWi+jH0GjG4iqwdnAB2IphsLY6OPK
X-Google-Smtp-Source: AGHT+IHZfSVr5kMd/sjsXI+LhsAy9tMoQBMQMdCbobZAw0MwMxLE0+giChpQG1TaHJ+0xaZ5ZcI5AA==
X-Received: by 2002:a17:90a:4411:b0:290:6874:bbca with SMTP id s17-20020a17090a441100b002906874bbcamr1241627pjg.90.1706377693511;
        Sat, 27 Jan 2024 09:48:13 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id sh9-20020a17090b524900b0028c5585fb41sm3122660pjb.45.2024.01.27.09.48.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jan 2024 09:48:12 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <66828d51-fe41-4b86-93e1-5ea82005d7ef@roeck-us.net>
Date: Sat, 27 Jan 2024 09:48:11 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: Remove I2C_CLASS_HWMON from drivers w/o detect()
 and address_list
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org
References: <75747c6a-d414-4b07-8f66-5a5cdddc3c36@gmail.com>
 <a15701d4-d786-49b1-9ce2-894dff508679@roeck-us.net>
 <02ab295e-0b2c-41b4-8376-569744b0ad3a@gmail.com>
 <e13f467e-d452-48f5-9bee-2e675ac8157f@roeck-us.net>
 <8140e7dd-179f-4a4f-bac1-f67930b0f05d@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <8140e7dd-179f-4a4f-bac1-f67930b0f05d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/27/24 09:07, Heiner Kallweit wrote:
> On 27.01.2024 17:37, Guenter Roeck wrote:
>> On 1/27/24 08:12, Heiner Kallweit wrote:
>>> On 27.01.2024 17:01, Guenter Roeck wrote:
>>>> On 1/27/24 07:02, Heiner Kallweit wrote:
>>>>> Class-based I2C probing requires detect() and address_list to be
>>>>> set in the I2C client driver, see checks in i2c_detect().
>>>>> It's misleading to declare I2C_CLASS_HWMON support if this
>>>>> precondition isn't met.
>>>>>
>>>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>>>> ---
>>>>>     drivers/hwmon/adm1177.c       | 1 -
>>>>>     drivers/hwmon/ds1621.c        | 1 -
>>>>>     drivers/hwmon/ds620.c         | 1 -
>>>>>     drivers/hwmon/ina209.c        | 1 -
>>>>>     drivers/hwmon/ina238.c        | 1 -
>>>>>     drivers/hwmon/max127.c        | 1 -
>>>>>     drivers/hwmon/max31760.c      | 1 -
>>>>>     drivers/hwmon/max31790.c      | 1 -
>>>>>     drivers/hwmon/max31827.c      | 1 -
>>>>>     drivers/hwmon/max6621.c       | 1 -
>>>>>     drivers/hwmon/max6697.c       | 1 -
>>>>>     drivers/hwmon/occ/p8_i2c.c    | 1 -
>>>>>     drivers/hwmon/pmbus/ir36021.c | 1 -
>>>>>     drivers/hwmon/powr1220.c      | 1 -
>>>>>     drivers/hwmon/sbrmi.c         | 1 -
>>>>>     drivers/hwmon/sbtsi_temp.c    | 1 -
>>>>>     drivers/hwmon/w83773g.c       | 1 -
>>>>
>>>> Follow-up question: You did not drop the class from drivers/hwmon/adt7410.c
>>>> and drivers/hwmon/emc2305.c. Is that because of the address_list in those
>>>> drivers ?
>>>>
>>> Yes. If address_list is set, this shows a certain intention to support
>>> I2C class-based probing. Then the question is whether adding the missing
>>> detect() implementation may be the more appropriate action.
>>>
>>
>> My understanding is that class based auto-detection is in the process of
>> being phased out. With that in mind, it would not make much sense to add
>> it to existing drivers. Anyone trying to add it now would have to explain
>> why it is suddenly needed but wasn't needed before. I think that train
>> has left the station.
>>
> Good, then I'll send a patch for these two drivers too.
> 
>> On top of that, at least for adt7410/adt7420, I don't see a reliable means
>> to auto-detect those chips. Trying to do so for a 10+ year old driver would
>> only add (lots of) risk for little if any gain.
>>
>> Those two drivers actually claim in their documentation that the address
>> ranges would be scanned. That should be dropped as well since it does not match
>> reality.
>>
> For emc2305 that's right. Documentation/hwmon/adt7410.rst however states
> "Addresses scanned: None", so here I wouldn't see a need for a change.
> 

Ah, yes. You are correct. I thought I saw it for both. No idea what I looked at.

Thanks,
Guenter


