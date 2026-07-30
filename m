Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E8B3769F5
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 15:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785424654; cv=none; b=MxASCelcqh+Mk3AxfUqRcGwdcxO/joo0BI0fnJ1oovIM55WXKmQBjoXnpG6UcQ/9XrjVZKSZkOO4+OdzCbelgjujQBG4rl+u9pvkpX70ARyPQnxHvsWyUIcHkMOsmrNyMQ1/Bb+jH76LfkJo2a3aN4GzwOaroIO4fRC3VeLBIMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785424654; c=relaxed/simple;
	bh=/tmLYh3mf9l6G0ZCyOuo7Psg6GSm8tsRf5oCW1AHMC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZNgloiyvYoZ3pDq1R7QykYhpQz+PzV5rlNhacqJfyPqvVLodNcZw0AFfle9OeR5cqShI6RLvtlaZI3x1Qkf0ZOsawKSkFfvZOVp103Q8OPrcksnlz/wJQIAhLaAal/VhszmfFqJOG2qlcH8JP7ZGQZqo/6xqZ3xfeHSq7i8VzI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cZxc83Mz; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZxc83Mz"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so2274202a91.0
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 08:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785424652; x=1786029452; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o7Nf7T9c7X544T/agor4qYZ5LZRNgnGl7LJPSJPQukk=;
        b=cZxc83MzPfDMKuMeYtVyNxarrSAD3pqx+ANkr0yjdaGvNNQjaptwkSX53ZhKIcQ5rZ
         hEvXVGch1wspMJZnl88YPa9D7n5i4M27fHvfL+ly1dyGOrF/fDCBw9/S12nrofOzavVp
         LBGaTs6kDcCrj2jQXC3Rs9DMb3cw1HD/cgIcKkvu3bjTaFMYQ9IOP3TvpKSa3XOQda76
         xHX3SXZbLDpECxvlG+Y9qlzyzQZhIxlLxPnebO+tqs+XrBUCtbtbf2o+z/G5pdQUQRNX
         NpV01P8jg7U6uhIq2d1X8BjK0hluZBcs7KW/aDJeHWwnx6++Zl0leu14q2MHhWZfdTk7
         AtPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785424652; x=1786029452;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o7Nf7T9c7X544T/agor4qYZ5LZRNgnGl7LJPSJPQukk=;
        b=JhFQV2W6Pbkdt7bPXfmZJs+PEen/qjGUWBleP7WHC1GyQDqB5cMIRDOt4ZnaD2mk6L
         hTIEeaurs4TQMugdfYQ8OSo/t7oY/nQb9I6vyOSe0wSRtLYmAttXnWDOBUUVnbdxa8hF
         /AlL40Hdh58iksyglpeFGR0teRWwx/JAu07gj2NA6koVBFrfNdRoVC+nUX0mfSvjKgMI
         SxBgru6b/5D3HhpDXKwTsbQ4qAj/9cYeNdgLLnH1sHJobnmjkWyIqh3MwCQHPd3u6b9T
         I/hM0Kd3T0N/jDsscCa32uh+OJmDAEQpRHDOoiIlrL2FShhY5GAmWR5DOm+Ecac8LcjW
         1N1A==
X-Gm-Message-State: AOJu0YzC9+RJgf7OhYDNa5rGhjJLgs3ECJIZV+FLfMZaaLEZLyo9vwUB
	cEzAscDvPVX1dt1Bq6G5w5FOhvx+ibSXPdicx2kjF/GjRVa1S7MiGcUm
X-Gm-Gg: AR+sD13n3ot06NGqma0bHFoIuKWMVLbPYiyfnxPOsJZUjeGy2SM1T8S/0D6GujlgwTL
	d8oVWLmy8PXSLX7tZfhvbl1I74Z1e/rZs692HJcekySbrGsCdkj7CIVL4un3E28v09f7xHHEIf0
	eWs9gBf3y9tKsGMnzKgV76EEbuUIeK994FeX0OyLoXptizhCcRIOvY7On60lPmlXwtdjgQPge86
	zNwIRj3u4I0hoLp9iHmElAJ/ANZ8ZV5CeMtGc5ZJTzKMP6C89kANTBw+E75hD8vGrvIGpSbGoO4
	LO6V3bc8UttJcLjsUIqGldpn7+VwCI4wtP4c9Qz47WXLUBEB7ZS5Am/jmI2O026KPGOEreUUCqj
	a0oLhcDmOijKdR/3wg9uAyJ0zCSMO3qpq6rCMLzBuLWOU+MdV94zzhGHW/PMU+yoO051PoAlkQD
	iSasPb4iXLN6Nhw3iOqXlTy1ctTKU6Z0gWBjeKmSvbAiJoGPEfdGJ8ebevMy0Xl+AwuAr+SWSrS
	vELJJ4nwWPJj8b+odjMuh4ez6Jy/yr0rHA4NQ==
X-Received: by 2002:a17:90b:164f:b0:38e:76f8:fcc6 with SMTP id 98e67ed59e1d1-38fa7f545d0mr362212a91.32.1785424651858;
        Thu, 30 Jul 2026 08:17:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9aee9958sm589230a91.1.2026.07.30.08.17.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 08:17:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <66979a1d-d92c-43b2-892d-cd73b6585509@roeck-us.net>
Date: Thu, 30 Jul 2026 08:17:29 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] hwmon: Add Qualcomm PMIC BCL driver
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
 Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
 <20260722-qcom-bcl-hwmon-v2-2-febe2805e17b@oss.qualcomm.com>
 <373bd00e-bfcd-4f6c-b64e-a707af01417c@roeck-us.net>
 <cdc0fb5c-d277-40b4-8b00-c73eb881c062@oss.qualcomm.com>
 <4f2d9c51-1059-489c-a469-562ec52015da@roeck-us.net>
 <24a0ac2f-792e-4296-949c-047d9ce1c1f3@oss.qualcomm.com>
 <3635cd34-4c11-40fe-a9ff-48b752fb5150@roeck-us.net>
 <c1db2ca4-ad1c-440f-bff8-eb7660af8021@oss.qualcomm.com>
 <df2f8d63-4972-4b59-883f-0a919e7cb409@roeck-us.net>
 <5861906e-2969-4849-b9ec-ff6c7df65dad@oss.qualcomm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <5861906e-2969-4849-b9ec-ff6c7df65dad@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/30/26 04:48, Daniel Lezcano wrote:
> On 7/24/26 02:04, Guenter Roeck wrote:
>> On 7/23/26 12:16, Manaf Meethalavalappu Pallikunhi wrote:
>>> Hi Guenter,
>>>
>>> On 7/23/2026 12:29 AM, Guenter Roeck wrote:
>>>> On 7/22/26 11:19, Manaf Meethalavalappu Pallikunhi wrote:
>>>>> Hi Guenter,
>>>>>
>>>>> On 7/22/2026 11:16 PM, Guenter Roeck wrote:
>>>>>> On 7/22/26 10:38, Manaf Meethalavalappu Pallikunhi wrote:
>>>>>> ...
>>>>>>>>
>>>>>>>> I am curious: Why not use static initialization and use the is_visible
>>>>>>>> function to determine if an attribute is visible or not ?
>>>>>>>
>>>>>>> ACK. There is already a comment in v1 suggesting the use of dynamic allocation based on the available attributes rather than static initialization. The intent is to avoid having to perform enable flag checks in multiple places.
>>>>>>> . >
>>>>>>
>>>>>> You lost me, sorry. There is only a single is_visible function,
>>>>>> and its intent is exactly to handle situations where some sensors
>>>>>> are not always available.
>>>>>>
>>>>>> What would be those "multiple places" ?
>>>>>
>>>>> Understood, thanks for the clarification. I'll revert to static attribute initialization in the next revision and use is_visible() to control attribute visibility where needed.
>>>>>
>>>>>>
>>>>>>>>  From the earlier exchange I had the impression that there is a large
>>>>>>>> number of current and voltage channels, but it looks like there is only
>>>>>>>> one each. That doesn't really warrant or need all this dynamic code
>>>>>>>
>>>>>>> Yes, this hardware only supports one or two channels (voltage and current). What we discussed earlier was that each channel can have up to three threshold alarms (warning, critical, and emergency). However, the hwmon framework currently supports only two limit alarms for these sensor types. I have not added support for the third alarm threshold in this series to keep the initial driver support aligned with the existing hwmon capabilities. Once the basic driver support is accepted, I can queue a follow-up series to add support for the third limit alarm.
>>>>>>>
>>>>>>
>>>>>> What does that have to do with attribute visibility ?
>>>>>
>>>>> I was only clarifying that the channel count has always been small (maximum of two channels) and has not changed since v1. The earlier discussion was primarily around the limit alarm attributes. That said, you're right that this is unrelated to attribute visibility.
>>>>>
>>>>
>>>> Feel free to use (and test)
>>>> https://lore.kernel.org/linux-hwmon/20260722185749.2313572-1- linux@roeck-us.net/T/#u
>>>
>>> Thanks for working on this. I'll use that change as the base, rebase my series on top of it, and add support for the third alarm level.
>>> By the way, for the voltage channel, the hardware monitors undervoltage conditions and provides three threshold levels. At the moment, I am mapping:
>>>
>>> LVL0 → min
>>> LVL1 → lcrit
>>>
>>> For LVL2, would it be possible to introduce a corresponding low- voltage emergency threshold, such as lemergency (or another more appropriate name), to represent the third alarm level for voltage sensors ?
>>>
>>
>> We can, but I really have no idea how to name it. lcrit is bad enough,
>> but lemergency is even worse (or at least I think so). "lemerg" would
>> be almost as bad, but at least it would kind of match "lcrit".
>> I tried to ask Google AI, but it didn't give me any useful ideas.
>> Any other suggestions or ideas ?
> 
> 'lfatal' ?
> After thinking about it, I'll stick with "lemergency", reason being that
it matches
	crit -> lcrit
	emergency -> lemergency

Guenter

