Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3EA42EEA3
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 22:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783722513; cv=none; b=DkAldABVr6XbPblJqJ/Rjdsn96Cf5Pxteuv3Uhr/CkNA5BZ0s70CAMvkVgxl03Rtu3sdt7X7QA6MV7gcfBZYOJ4+e34mm+XhNelkhzxawqy0+jd2w1lvksTDKZy0+481TkhOmTXykATdvrAJ0lUfgUotoLzaISwvvQlvgELTrLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783722513; c=relaxed/simple;
	bh=svmb+7rt7imrD2VEUwN6O3W2we7K5TY6IZWgFL0tdCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T3doNLXMfaGkxChis+1oA2XMUjUOXzWt13hQBJkmtFB/EPVgH2chlTbhHkDLJgUGBw/fZRW8TStylNPSi8DA+9GMSqRM8NKBqbSZ5khPf43KbOILpfaDSfEavRk2SOZ8iOb4ObNRU7l1WWBMeVXu5FUv/5L92b4St/CRL956cmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fH12kioT; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fH12kioT"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cabc0a1ab6so17572525ad.0
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 15:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783722511; x=1784327311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WVQ/YMCPXeyk+itfO0lbGj+Jkh4QxhhTc0UMK5Rk60=;
        b=fH12kioTupjeo1CMddh4U6OYIYrctYrahIjssRCgAmZOjaEReOzYT2d/rkrCIXoGn2
         cAZ0onDxdnnvUzU7lodEAfXkOsNf+NNb2KNPoOvkdTL1OmNKDrH8AcYyt8EEGaOXWiIu
         wIbBS4NUdXEsFEmhw8hcbXCLOgK7eCylH+0gTHsdd3ImgH344a9LpDjnd0FDjxJl76mo
         pYWVhthkli8q1TNgNdOmrz6ZpKFYJQrmjhQKK+HQVgwrSsm75Xg/aBYXrYmItScOVdKf
         EZA+TTxoXUomdJLoRWrexwrQL0d6LOw9kQnRMkGwMys8CIGOWLAXuJ2Kdu1sJcuoLDsi
         4eug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783722511; x=1784327311;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/WVQ/YMCPXeyk+itfO0lbGj+Jkh4QxhhTc0UMK5Rk60=;
        b=eyPVhdbf31JUTkq7V+uci86cmxa3brI3i9SWNP6+C4PkcUCU6J43Pv1bMopWBSRvFm
         oW4+jpmFTZkblJ4R1c03Pctjm7/PBQZSLKDm3H4M5pnckIIaUMS6RnjanvcQCBRMbq18
         G46LqbS3cx+zRKLcBlY8FTRpJygb5T47eo4n0WDOB27VXgvoC6gW5GFVJ7Z0k7lRi/vT
         QD0zEbJsNwoDydObcgKSnWKkq1bHteszBitHMLcT1q0zG6roJQXylojq8UMWRS8GMKEA
         OqtLewfmv4ZZAmIyb/RwGOR5O7qrF+PgvALesvGO6R1P72dN5DrBzGn1O7DGNZtBFDOY
         67aA==
X-Gm-Message-State: AOJu0YzbrWNWg9OVhRlRjMmA5mIDcIR9L/K0+vFGgWhioEL73MuOiRvh
	12cGGpCoNI8dwvdV8/hFJLaammt/bOAuhbPli3bzhoEySHRXsjdor9dCXEmMrw==
X-Gm-Gg: AfdE7cn6YJQL+i84pi9lUFqjz7tqjgiS7MYyfO8HLmVPKLYXNnpiIizBSvoDfJTHQOS
	wqSsT9pK+DdyczDGvj2b0PI2BvgYfciZYSoS0H4eTjRGOUR08bF2OzG+0WhuA/cN0CO1WGnRwwW
	w0KH9h5DDlQr9d0Gjf2sEe5mAm+d1qwE+9HnrUnTtWv2vuhQjl2DphdZez54yuczBjs90XZQVxd
	gelBa18v6R7y+wctVt1T00qWqaIiNalNs0TwpG31fWtBQeFr05uJ8+mexR7VSvO3DgigrSij2IG
	jS1eW0mzxGQDtc9FWHJruCE2reys3wUp7vsz79BjASENvZ3xgbHYFLAK4Ou9PMP6ucb8pF1OEMF
	DEx11h4FtiEIMpaSCpym6S2c4gioac8dAncMmkF0wAAtm6Gch+3GJNQSp9yZmpOfKEsdaTOWN7+
	K9/RTclp1uhhR8nssf3cg5vaf0J7B5sGerNzB7CYwuxc7RAidt6FiRzvcHCfMn9MGB3aL3vFHK
X-Received: by 2002:a05:6a21:6e91:b0:3b3:fdb0:2288 with SMTP id adf61e73a8af0-3c10fec70a6mr844708637.0.1783722510605;
        Fri, 10 Jul 2026 15:28:30 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174839f89sm44439618eec.10.2026.07.10.15.28.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 15:28:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7b427ff8-3183-44e3-b2df-2f50ee5c0069@roeck-us.net>
Date: Fri, 10 Jul 2026 15:28:28 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] hwmon: (applesmc) Convert to
 hwmon_device_register_with_info
To: Armin Wolf <W_Armin@gmx.de>, Shih-Yuan Lee <fourdollars@debian.org>,
 Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260710123236.10508-1-fourdollars@debian.org>
 <20260710123236.10508-2-fourdollars@debian.org>
 <99c83d9e-129a-4db1-b0bc-dba75c07708e@roeck-us.net>
 <5fff5c16-691d-4009-add6-1a38aec3a4b1@gmx.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <5fff5c16-691d-4009-add6-1a38aec3a4b1@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/10/26 14:10, Armin Wolf wrote:
> Am 10.07.26 um 16:01 schrieb Guenter Roeck:
> 
>> On 7/10/26 05:32, Shih-Yuan Lee wrote:
>>> The legacy hwmon_device_register() function is deprecated and triggers a
>>> warning in dmesg during driver initialization:
>>>
>>> [   24.706091] applesmc: key=620 fan=0 temp=37 index=36 acc=0 lux=2 kbd=0
>>> [   24.706270] applesmc applesmc.768: hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
>>>
>>> To silence this warning, convert the driver to use the modern
>>> hwmon_device_register_with_info() API.
>>>
>>> Because the driver creates all its sysfs attributes dynamically on the platform
>>> device, we define a minimal struct hwmon_chip_info with a single temperature
>>> channel and implement a visibility callback that returns 0 (hidden) for it.
>>> This satisfies the new API requirements while keeping all existing sysfs paths
>>> and attributes completely unchanged, ensuring backwards compatibility.
>>>
>>
>> Novel, but that would completely defeat the purpose of the new API.
>> NACK.
>>
>> Guenter 
> 
> Agree, this deprecation warning should not be silenced by using cheap tricks.
> 
> Lee, i think instead of abusing the hwmon_device_register_with_info() to emulate the
> behavior of the old API, i suggest that you use the new API to replace these two calls
> to applesmc_create_nodes():
> 
> ret = applesmc_create_nodes(fan_group, smcreg.fan_count);
> if (ret)
>          goto out_info;
> 
> ret = applesmc_create_nodes(temp_group, smcreg.index_count);
> if (ret)
>          oto out_fans;
> 
> Basically, you need to dynamically allocate a struct hwmon_channel_info each for the fan
> and temperature sensors. Then you basically use the new API to create the standard attributes
> for you, while the non-standard attributes are still created manually and passed using the
> extra_groups parameter.
> 
> The non-standard attributes are:
> - fanX_safe
> - fanX_output (should be renamed to fanX_target to comply with the standard sysfs ABI)
> - fanX_manual (should be renamed to pwmX_enable to comply with the standard sysfs ABI)
> 
> This changes are not exactly trivial and should be tested on real hardware. You should
> only attempt this if you have access to a compatible device for testing.
> 

Exactly. Other drivers, such as the asus-ec-sensors driver, use the same approach.

Thanks,
Guenter

