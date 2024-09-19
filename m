Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9771991B6
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Sep 2024 14:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726756558; cv=none; b=eRHFRXChYR7HLNJbBw7eRzW6rVM++Phs/xUxda1fN+BEea9PVowRmYJ8J9cH46iVqfM7J9/CRKrkHdJXPOnA6j3SpBNjPUgeA7s5a/tq4mTYRR+EBCrwFMT5TKMzpJHjwjYGbb7micxnQhfGWBMkB763VkBxSOAD3zCg29VUPtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726756558; c=relaxed/simple;
	bh=p11BI7l6Np8tgNKK5ZsYGnr0j4rhnswzio1sJqHEF04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qzvo2NBVsBZKpatKXPHxnx6/cjiWa3CNEE9fRrhCH1rUd5zckd9pTcc+zrLVKMLJgTW1OjbHrJbzyGEPVX+4ap0DCkQ1l4a/Y1ZLSitur/ljPvMJEjXqt2V08meTG2rQDAVduMTWTIofKiP9NRqw5uP5oF58KqoN7Ubos9BdNwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fZgEQ2l5; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZgEQ2l5"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1fee6435a34so9582425ad.0
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Sep 2024 07:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726756556; x=1727361356; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=HbxBZn/g93ngmV/ieG9Z6K98/c/fxgzb38MZYRoVnCE=;
        b=fZgEQ2l5WUS9YLQ39jfCh1k8lb71raonbe/mMg8r1TgmjwmP3ZkfIQ/MzMqCY/d9IA
         dFTc+Pvo7SILYsl8Tn4hlzMWNOr8nb+ig/IbuNclo5HSV0SRmIyFrXgAaFUNIcphcJEr
         VTFRhMIVEz227bCXh0BEK8Suq21kk8nlJ25qLfKjzpWAQ1gc8rSq4SyhyywJeu5LEnrk
         3AuPmGCz+3EnolKVl3w3J3uU/aMDv774FGIYQBsCtTIZDVP2QW7zx5t+Dk/PgYC1XKaO
         FpTB81cAFzNbyXWnLD7EzA8o2X1BUcnHK3Gq3PjPFt9Z0tDDViN64ysP6ppaHCJUj2w0
         T0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726756556; x=1727361356;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HbxBZn/g93ngmV/ieG9Z6K98/c/fxgzb38MZYRoVnCE=;
        b=SO1XfT4bQeeXoeqqYGakwIndBMDwB9UT4NZGf4sfevZ2sbGgI1C00aXGigZ4HBmUrG
         NWFM5eIHXQ1X7b1j2/koIj5PjY4CZxndyxw4kw1Soyho134TZFPo5WBeRiNd/vtYbL8q
         W6JTLmdgbNonRhAP6t8i+n7H49c0iiQFG+GSYY+4Qg0LblC7pID/uKckvoYgRiyCIhox
         OsF+3dgmBMYclxcYmPLPF2jOv/baIPX/CkMvKHqmKS6SPoOw1IwzO3S/XY7O001Jxja4
         J5C5cCS1dkN0HMuo52KEdy5gmq3Fj/5Kpf9a/1LZPXbgKjNrSYgkS8cbop1avz/rxxph
         xDdw==
X-Gm-Message-State: AOJu0Yy4FzAcSJcbtI/JMXHMT2gDhEJDfXjpu7aUcw7Fk3w6TvYYyXCT
	i06NUOEunoSs4NHfsHhc3UVp+AOkH97QtpI3HK2MN7MlGz/0RrqETZwYUQ==
X-Google-Smtp-Source: AGHT+IGaO/7N4fP9PbhyzYPQHbUsaZj5WPRHxsz7MlibXZmM8b93lPfPav4p3SdTEUckTRwPbBzSHw==
X-Received: by 2002:a17:902:dacc:b0:206:96ad:e824 with SMTP id d9443c01a7336-2076e3f8978mr463162965ad.45.1726756555797;
        Thu, 19 Sep 2024 07:35:55 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946d19b5sm80528085ad.179.2024.09.19.07.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Sep 2024 07:35:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <cc5d57ff-8c64-4bfe-a2e1-cdec6e4056f1@roeck-us.net>
Date: Thu, 19 Sep 2024 07:35:53 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hwmon: (ina2xx) Add support for has_alerts
 configuration flag
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20240913003145.1931634-1-linux@roeck-us.net>
 <ZuvhJHxfkycgUVN0@google.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ZuvhJHxfkycgUVN0@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/19/24 01:30, Tzung-Bi Shih wrote:
> On Thu, Sep 12, 2024 at 05:31:44PM -0700, Guenter Roeck wrote:
>> Add configuration flag indicating if the chip supports alerts and limits
>> to prepare for adding INA260 support.
>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> 
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
> 
>> @@ -155,6 +156,7 @@ static const struct ina2xx_config ina2xx_config[] = {
>>   		.bus_voltage_shift = 3,
>>   		.bus_voltage_lsb = 4000,
>>   		.power_lsb_factor = 20,
>> +		.has_alerts = false,
> 
> No strong preference: or just don't set it.

In situations like this I prefer to explicitly set the value to indicate that
it wasn't forgotten.

Thanks a lot for the reviews!

Guenter

