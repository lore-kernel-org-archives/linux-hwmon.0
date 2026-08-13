Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1DA400994
	for <linux-hwmon@vger.kernel.org>; Thu, 13 Aug 2026 19:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786650853; cv=none; b=kQjj6XTHCbD5u6aUyjhF19UVpcVHaA88aqCiKOLsq1Xy8QqwUalt+IDAp/9GPi7kurAmCJyswttX0mlLnlEczs3iMi7i476BcmeGT/kr4Z+fZWgEkwx1CQsttyTSOKYc2Dahsg2f4/Acrmwf3q20acELdiFNv6roVmACHKayf8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786650853; c=relaxed/simple;
	bh=F856Rukz+ioT6Q0HkVPR7BGPAbkpuGMhzeZwYdeD0BQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZLrFkTywecy5RUYrbw35CVZ5fCBfwzHZF4BXa9iQ8eksj2vKjekhu2wAUKEWSwCvwqFQEHp5mNVGiLTROpc/SvsWfmIlro2mQZpLtb7+vATrIZQvWaMX98Y/p0OsyY6KZF4FPs6mYJ8iSajG5ZDCXwpDyguWdE6d8BMrEvNiWPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IW0JUgRt; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IW0JUgRt"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38dd55ad76cso170061a91.1
        for <linux-hwmon@vger.kernel.org>; Thu, 13 Aug 2026 12:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786650851; x=1787255651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uKmSTai87s9kQqSZVPLs1GZ5QTK0E8hu1xg93kgENIs=;
        b=IW0JUgRtTfZFHQyGw/jDIu7uHb7ThwxXFgopctjoALsQSZARGXZgDwLbccGCZW7Iju
         U7+fUP07Mo7uFc1g4NjIGiG450JaW67A96N2eN9F8NapRidOzccORpiNjVgfy7XujpqE
         9zdxM4GymxGfM+c8yk1OYgTSEws+5a8EbRAm2qkInr2xro0AMOUAp3mTRwcMyMI34cv6
         vbxseP4uwyd1X8O3E0G3LCksNT63dpYZeknc+ROASUNwEFrzyztMVDHAiYwU1Z/nY2W+
         G2Khl4PxEPt+WUY2dPXnj63/+gfg3t2wAPnp6PwO1tdQ2PsFaSGquflgO/V+IzvCvcPm
         Fm3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786650851; x=1787255651;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uKmSTai87s9kQqSZVPLs1GZ5QTK0E8hu1xg93kgENIs=;
        b=YD5cW9FK49ZG1BTPKSc45mZAAT3rz1dP00G6Qan49sYJieMAnYCawPWjfMAzN2HIj5
         paDBIcKc79dyIqstCB/U+Ny0ImKFT50pyajzh2YuGafwIxuttced8QreqwbRiGBnig/e
         mlPz3eOx2Z8Y6mSotnTpFex3Iw+efMuYuKjOL5rAoVUsM/dEn8Yg/ugnrDlpdEFnUncs
         KkG/Aa8NG+1d1R9gp32cGLAqOFG7lIbQsDKmcCvpz8nfXwBSBNwfOSF3k5LZnCXQWoCw
         1vYeDN8Z2pZbUvGB+OgQfL8/sEmE2ZM2DAMDl2DHPcb9KbnPOabSg87vnXHTg07+7dH3
         DIpw==
X-Gm-Message-State: AOJu0YwnoCGTeL2hBnp6M66/uDVQ6cPg+E2p7Bl6P1Q2nhj0kgr4mWzr
	uejHFtiVxGiNg6B8+mukoo+D/XsgKJlncEuzOoYsVXpnM/gbyzp96C3URGawyA==
X-Gm-Gg: AR+sD12KhdqiFO0SnlHwY83PcN36t8XxayHpzZQ3IQTyW+iRE2+BUoe2NRqy5EDh2BF
	6kg0BMZuar7jYDR14oBBYaqYkVWMDBeV54a00ZimIY1FRHOx6x9o7mL5rSFew36aOF/uaLDE1Jp
	9NhelW52ttvuWbuGbFruE30Py5pcITtzIhTmDddud4WVQk7GnD1rD277poCTVwIqgNk8Y1F45M5
	lKMxmNyLOQ+UYpgoYZoiLXcJe7d9Ape3St22vvS6lyIR+Vqgn+FBl+7f5SgPdIj5CflykOwQX34
	yAwjndIiq8hWsaceG98BqRMEtdMTFu3a3BH319dAkCxUP8eKUGmkEgBAvTeVF5WnBvulwnyd262
	N2ydsKzvSpUEBBZcoEwDBTz/cGhTkZcGEf14mOcQKlQPdG5KN/xT/0w/q5MsVYMkXSbfrQ8uPbR
	ULDCOLqV68mBGmYNV5hvB68lrqAwavyHCkXSF1GRhNdwSq/FJiJ7c+VBp4gEt+Uf75HZyXgn4AX
	qNARZhs1dPbZ6q+BgxWNzhTmP9K2gYH7CJGIA==
X-Received: by 2002:a17:90b:54c3:b0:387:d9cc:7dc3 with SMTP id 98e67ed59e1d1-3931f61cca5mr4734446a91.21.1786650851308;
        Thu, 13 Aug 2026 12:54:11 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1413889d914sm1075552c88.13.2026.08.13.12.54.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 12:54:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1e09730a-b7c9-4113-b551-7a6e24c669c2@roeck-us.net>
Date: Thu, 13 Aug 2026 12:54:06 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] hwmon: Add Qualcomm PMIC BCL driver
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
 Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
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
 <66979a1d-d92c-43b2-892d-cd73b6585509@roeck-us.net>
 <dcb8ee4d-7c01-4de3-8c01-528beaae16bb@oss.qualcomm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <dcb8ee4d-7c01-4de3-8c01-528beaae16bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/13/26 12:27, Manaf Meethalavalappu Pallikunhi wrote:
> Hi Guenter,
> 
> 
> On 7/30/2026 8:47 PM, Guenter Roeck wrote:
>> On 7/30/26 04:48, Daniel Lezcano wrote:
>>> On 7/24/26 02:04, Guenter Roeck wrote:
>>>> On 7/23/26 12:16, Manaf Meethalavalappu Pallikunhi wrote:
>>>>> Hi Guenter,
>>>>>
>>>>> On 7/23/2026 12:29 AM, Guenter Roeck wrote:
>>>>>> On 7/22/26 11:19, Manaf Meethalavalappu Pallikunhi wrote:
>>>>>>> Hi Guenter,
>>>>>>>
>>>>>>> On 7/22/2026 11:16 PM, Guenter Roeck wrote:
>>>>>>>> On 7/22/26 10:38, Manaf Meethalavalappu Pallikunhi wrote:
>>>>>>>> ...
>>>>>>>>>>
>>>>>>>>>> I am curious: Why not use static initialization and use the is_visible
>>>>>>>>>> function to determine if an attribute is visible or not ?
>>>>>>>>>
>>>>>>>>> ACK. There is already a comment in v1 suggesting the use of dynamic allocation based on the available attributes rather than static initialization. The intent is to avoid having to perform enable flag checks in multiple places.
>>>>>>>>> . >
>>>>>>>>
>>>>>>>> You lost me, sorry. There is only a single is_visible function,
>>>>>>>> and its intent is exactly to handle situations where some sensors
>>>>>>>> are not always available.
>>>>>>>>
>>>>>>>> What would be those "multiple places" ?
>>>>>>>
>>>>>>> Understood, thanks for the clarification. I'll revert to static attribute initialization in the next revision and use is_visible() to control attribute visibility where needed.
>>>>>>>
>>>>>>>>
>>>>>>>>>>  From the earlier exchange I had the impression that there is a large
>>>>>>>>>> number of current and voltage channels, but it looks like there is only
>>>>>>>>>> one each. That doesn't really warrant or need all this dynamic code
>>>>>>>>>
>>>>>>>>> Yes, this hardware only supports one or two channels (voltage and current). What we discussed earlier was that each channel can have up to three threshold alarms (warning, critical, and emergency). However, the hwmon framework currently supports only two limit alarms for these sensor types. I have not added support for the third alarm threshold in this series to keep the initial driver support aligned with the existing hwmon capabilities. Once the basic driver support is accepted, I can queue a follow-up series to add support for the third limit alarm.
>>>>>>>>>
>>>>>>>>
>>>>>>>> What does that have to do with attribute visibility ?
>>>>>>>
>>>>>>> I was only clarifying that the channel count has always been small (maximum of two channels) and has not changed since v1. The earlier discussion was primarily around the limit alarm attributes. That said, you're right that this is unrelated to attribute visibility.
>>>>>>>
>>>>>>
>>>>>> Feel free to use (and test)
>>>>>> https://lore.kernel.org/linux-hwmon/20260722185749.2313572-1- linux@roeck-us.net/T/#u
>>>>>
>>>>> Thanks for working on this. I'll use that change as the base, rebase my series on top of it, and add support for the third alarm level.
>>>>> By the way, for the voltage channel, the hardware monitors undervoltage conditions and provides three threshold levels. At the moment, I am mapping:
>>>>>
>>>>> LVL0 → min
>>>>> LVL1 → lcrit
>>>>>
>>>>> For LVL2, would it be possible to introduce a corresponding low- voltage emergency threshold, such as lemergency (or another more appropriate name), to represent the third alarm level for voltage sensors ?
>>>>>
>>>>
>>>> We can, but I really have no idea how to name it. lcrit is bad enough,
>>>> but lemergency is even worse (or at least I think so). "lemerg" would
>>>> be almost as bad, but at least it would kind of match "lcrit".
>>>> I tried to ask Google AI, but it didn't give me any useful ideas.
>>>> Any other suggestions or ideas ?
>>>
>>> 'lfatal' ?
>>> After thinking about it, I'll stick with "lemergency", reason being that
>> it matches
>>      crit -> lcrit
>>      emergency -> lemergency
> 
> I pulled in your patch [1] and extended the implementation to add lemergency support for the in sensor type. I validated the third-limit alarm support for both in and curr sensors.
> 
> The resulting sysfs interface now looks as follows:
> 
> /sys/class/hwmon/hwmon1# ls
> curr1_crit curr1_emergency_alarm curr1_max device in0_lcrit in0_lemergency in0_min name power uevent
> curr1_crit_alarm curr1_input curr1_max_alarm in0_input in0_lcrit_alarm in0_lemergency_alarm in0_min_alarm of_node subsystem
> 
> [1] https://lore.kernel.org/all/20260722192547.619281F000E9@smtp.kernel.org/
> 
> Could you please update your series to add lemergency support for the
> in sensor type as well ?
> 

Sure.

Thanks,
Guenter

