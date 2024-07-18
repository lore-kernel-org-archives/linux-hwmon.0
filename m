Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38205144D37
	for <linux-hwmon@vger.kernel.org>; Thu, 18 Jul 2024 17:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721324913; cv=none; b=BpeC+g9iPkcAAGKxhQ5Nmh8Z4tIcRB2oReg91LGpWoZZF5UQptGAOrQkdshqohllYbjrLJ7TjONnMdr2JmhDRd5z28mLmQLlDA/Okz1xQYV26kgqPJUVhIpkQbBjys7nPWBT5q+wXfmUrRCNRchF2K68m47l17ecJuph5Wsz8TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721324913; c=relaxed/simple;
	bh=EZcOO7e/WBIy4H6FZj/9ev6aT2b/k/q6okZx5SPMFdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W/1npTrOG9XyvqCgzfsHOuOegyJ1kDvxxkeD10ek6j5Y921ihuXp3G2p9ts63n0j/EHEYIHRpWlYBGFRwE/wvzhHilj41yN4sk9d4yMEemQ3/ausvKRfLfmAMx717AwLtxBuYLZreDCIAutWeeBeitv8iT0ApnmS+Uin0xS03hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZcwutB/I; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZcwutB/I"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3d9e13ef9aaso674456b6e.1
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Jul 2024 10:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721324911; x=1721929711; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=eHT6UXb1LawupmQPr2SQOYCUmB/vIHI4StVj44kt1BM=;
        b=ZcwutB/IUVlC32kjEX1jRrRErgxIdkbnL9ahOAeExp1vYd9RSIsxoqLBjd++CzWLS4
         XPxJ5xpSV1MXbWLn8lvz//QSo1+xQl12+/k7Vy0zRUcbg+lPzO0hhEKS4bRTDY5DQYY3
         sA5vETdrHK0mJPpGes5LfiiyfgziDjAcy46iD2iJnBbtAfBcViErIeK33fDvUnsSKxcp
         pgXQLVYoI4EhT4HxeBJp2xzRRoS7qyfHq/c+YxFHxOIkiiBbdpkzHDVvXSbDuRyI/CoE
         klRatEYDtuRiq+EqRjG+jdUgkuZd4oUFhbl2fTJyaSabt19HTdluN0CkxYxDWfmk2Qyw
         Wocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721324911; x=1721929711;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHT6UXb1LawupmQPr2SQOYCUmB/vIHI4StVj44kt1BM=;
        b=WTsO/ccqC4bk5P/dvIlKxe8k9ArZEH8MJsvul/8czd42gxrQmBV2FPpPh9Y9AYKqDz
         5o2liXiDp4E0MqkS4Q1rq/fZMLV1snQSCd6N3ZDNuk9WUzHcT44sAGpChh5jhOy/ykev
         jsKJY5q3aMepzpsJNsO8dGUb6S6d8P66QQIzNLmv/AmXiJ7v+JN272LYcz2Bn/hkG8qx
         +64C0ytozJcu/zgn37pM59rwuyCpF3hQ17I3cUOCPLXqZBNVwC4iCUTdbkXpTM3r7R3n
         ECa88GH418tlKPjo1A4ZbUDTtr169CMwFXh4l9VJQXHs7FVkAxLVQyYGgdhSg/ht0GCV
         2X+w==
X-Gm-Message-State: AOJu0YxNe1wEXHsGi42crGHH6YMwmqRcEuIZf7ClBARKnAFf1gKrmuFn
	Ube9fXb+DD+dTPQR/DDlx2kfuLpFYOeqfkeupf+ejaDH84BBH03u
X-Google-Smtp-Source: AGHT+IEa5Wdw78WNPq/+2M8iL02bHLL8dLusrUXsytl+USYhx60+XMT6ySdKWum71A45W1VZAi7k3w==
X-Received: by 2002:a05:6808:3099:b0:3d9:33e9:e339 with SMTP id 5614622812f47-3dad1f11f2fmr6292563b6e.9.1721324911131;
        Thu, 18 Jul 2024 10:48:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70cfc6e083esm100848b3a.7.2024.07.18.10.48.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 10:48:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c241f1cf-7388-4021-86c3-45fce9df9e0f@roeck-us.net>
Date: Thu, 18 Jul 2024 10:48:29 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] hwmon: (lm95234) Use find_closest to find matching
 update interval
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20240718033935.205185-1-linux@roeck-us.net>
 <20240718033935.205185-3-linux@roeck-us.net>
 <ZplFW4rL5qhxbT0M@tzungbi-laptop>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ZplFW4rL5qhxbT0M@tzungbi-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/18/24 09:39, Tzung-Bi Shih wrote:
> On Wed, Jul 17, 2024 at 08:39:31PM -0700, Guenter Roeck wrote:
>> @@ -471,10 +472,7 @@ static ssize_t update_interval_store(struct device *dev,
>>   	if (ret < 0)
>>   		return ret;
>>   
>> -	for (regval = 0; regval < 3; regval++) {
>> -		if (val <= update_intervals[regval])
>> -			break;
>> -	}
>> +	regval = find_closest(val, update_intervals, ARRAY_SIZE(update_intervals));
> 
> The behavior changed.
> 
> static u16 update_intervals[] = { 143, 364, 1000, 2500 };
> 
> If val = 144,
> * Originally, regval = 1.
> * After applying the patch, regval = 0.
> 


Yes, find_closest() rounds the value instead of using the lower match.
That was intentional. I'll add an explicit note to the commit message.

Thanks,
Guenter

