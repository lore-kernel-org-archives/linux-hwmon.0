Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC008145356
	for <linux-hwmon@vger.kernel.org>; Thu, 18 Jul 2024 17:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721325203; cv=none; b=CLpHP3612HfQdvClqQQRuqeuzVCMKLSNkM75dpKQAcW5pgHo+F+O1/1yHE7hDkPxJHye5hWbcvhnOJ4iLGE3rPmUDMe0Eqf0yZeDMmR6LrMAU0rmtKeSrL+2fzXfZpx6DTSic7wHGarBRlFWJ8bP0cGPC4GBtFHFhn77pvdev0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721325203; c=relaxed/simple;
	bh=paTbNKZJGro4RySBnk9HvNxki1VTTZrSnPn5kpoyluk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=VgUsJ0vG7sGUGLWWeLUj3cQ3YEr7sYFViEz/2eoo+nFO0DUdLm/OLq4vvn2qJfor0KXjeYtKML+KUo9QTa3tu7nTZI1Z825KbrzXzfz5I47rIO7/PFdRney8Ib+QlPCCxX/z3Xg9eeRrxkNby3Cn2vGQ0qhECKRiyhPYQhHjyWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LWl9AJVO; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LWl9AJVO"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2610623f445so125918fac.1
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Jul 2024 10:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721325201; x=1721930001; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=EE9nWcNix9FCTfTIAOR1X7h3QmspAGvjshdTH46s9MY=;
        b=LWl9AJVOVWSHFEwbe0idw7nBcVdHCE10H6EbrGEH1W4Hfdn/03hr0Jx89/HdOq8djG
         B9hXH87nq16Yrgcw20PyoiW3Qd8lWnmLbAZ+wwt3V6CF5TFA4TOznXjgCc39kYxdo+fR
         ySOYzCMdn3UsDVqt4j1I3frhCaiar+sjrAqV+rOYoyARp5FCM4p50rmlq5oLisiNyWiW
         Ye35aDFPqW+TFO13Ij4K0G+0bNGxsugP6WKvpnM+GSJ+ci4nhFqNMdv1kieQWDOIcFaq
         Rvm+EwWSJCKeSvwyPOJfdM4axugxHiTV+hdVhvW1ukRHIFmlG2G8S/5b/6azX/H5+X6H
         Ma8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721325201; x=1721930001;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EE9nWcNix9FCTfTIAOR1X7h3QmspAGvjshdTH46s9MY=;
        b=mWXXhx4q1MNaNjectzc0AwfEXNkAJ1+9w0Lgw3GPJxsEODCply3JCdmRGbrizLyrFH
         hsl52dPid5znVqy2FT7yWpUqqF/YWZNp1vSZpvqlE1xQf2rmlJnKpcx7ZUGaJZBlCpg7
         n1jFYec6verD6vDOXRrInQzBSLLOLVwxeUzOy8gDh/tugYqfSYrFnea95vl3DbNPUALW
         CHDWE2DJQhauVDPM7nCKt9omk/IoZgXQD2Bq4G/3dmQw/lZjAj/dhMBicXqJWRQ9g0XE
         m0C3sRQe1Ay32LOE2b5x/NNxE3vgd1I6E5MCBhoG7rlnVGqe+bo5D17cuVt56yMEmBeT
         AHGw==
X-Gm-Message-State: AOJu0YwPUybFhG9SON+TRDta7jzONKw7+9zPTFKiGWVJlCA8ca4g3gMy
	wpIAj6SH1Xs4ltG75g+iZlO0KHOXJex8F+w+mQTUhczFhOsfwdS5Nby43Q==
X-Google-Smtp-Source: AGHT+IH6I1+a0IISyAAITCacj5cWT0K5ukSQa9PWVwp/yKcyanu9edaMmSO7n5j09rvJ57uN69H4bg==
X-Received: by 2002:a05:6870:f626:b0:25e:14e9:10c9 with SMTP id 586e51a60fabf-260d915c0c3mr4353618fac.6.1721325200934;
        Thu, 18 Jul 2024 10:53:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70cfc72fbadsm104611b3a.90.2024.07.18.10.53.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 10:53:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1242332a-b979-4284-9af4-1b76c9fb41ef@roeck-us.net>
Date: Thu, 18 Jul 2024 10:53:19 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] hwmon: (lm95234) Use find_closest to find matching
 update interval
From: Guenter Roeck <linux@roeck-us.net>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20240718033935.205185-1-linux@roeck-us.net>
 <20240718033935.205185-3-linux@roeck-us.net>
 <ZplFW4rL5qhxbT0M@tzungbi-laptop>
 <c241f1cf-7388-4021-86c3-45fce9df9e0f@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <c241f1cf-7388-4021-86c3-45fce9df9e0f@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/18/24 10:48, Guenter Roeck wrote:
> On 7/18/24 09:39, Tzung-Bi Shih wrote:
>> On Wed, Jul 17, 2024 at 08:39:31PM -0700, Guenter Roeck wrote:
>>> @@ -471,10 +472,7 @@ static ssize_t update_interval_store(struct device *dev,
>>>       if (ret < 0)
>>>           return ret;
>>> -    for (regval = 0; regval < 3; regval++) {
>>> -        if (val <= update_intervals[regval])
>>> -            break;
>>> -    }
>>> +    regval = find_closest(val, update_intervals, ARRAY_SIZE(update_intervals));
>>
>> The behavior changed.
>>
>> static u16 update_intervals[] = { 143, 364, 1000, 2500 };
>>
>> If val = 144,
>> * Originally, regval = 1.
>> * After applying the patch, regval = 0.
>>
> 
> 
> Yes, find_closest() rounds the value instead of using the lower match.
> That was intentional. I'll add an explicit note to the commit message.
> 

I added this to the commit message:

     Since find_closest() uses rounding to find the best match, the resulting
     update interval will now reflect the update interval that is closest to
     the requested value, not the value that is lower or equal to the requested
     value.

Thanks,
Guenter

