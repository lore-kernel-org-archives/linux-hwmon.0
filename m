Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBB02DF13F
	for <linux-hwmon@vger.kernel.org>; Wed, 17 Jun 2026 13:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781704207; cv=none; b=mLY6XYQjj//vTYPMqe19+hijqPwXlfGU9wRJanLfbZi/Tsqj9e1FsIMUXkFCDEFDCAzMrr9KjwyFMJgmz1G+C1lYSTLNSZbVHfiAx+S+ApI0kE0W5jozKGE/GEH8eMJWxTShg6ispqvqAKbalsQhf5asIQLyqXAZsaUp9oJT1R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781704207; c=relaxed/simple;
	bh=qpznpDvTavb86eld76Rk9ajBvLIAutQFKvl0Rmx4Jzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g5ddoC+mPFqr51KUIdVOUnO8z8DefBa1l0oJB60Fm86+XYW93JQ3MGoXy3ITI6Wi7bgCoBzi3A9ZEdpz2pOl0N6Wofsm0TzPEPSo8zBnHQ6BAukKI+Dd9z+yoID6TfU4PrMa18TeVZiebIphKvNyecBhsLHukfLh0LpfM+09Pjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dq9YRoVu; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dq9YRoVu"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8419ab3a297so2596032b3a.2
        for <linux-hwmon@vger.kernel.org>; Wed, 17 Jun 2026 06:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781704205; x=1782309005; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=v8p3qTBw4ely1JdACaWOk7zKQbPvRPDs6QhiejnidQw=;
        b=dq9YRoVue2GGAEB3h9p2el7RJIPAeQRhATG31R5UCGgkjKMTwSb6it2g70yDoOGyJp
         aDKDcOAUPdcz/heK2jP+KTo2p1Jjj8eq85nSoi3fWO8IbiLhgFtFSdcYDFxrztYEz9nA
         ebqEcbNmYnlO3GtH2sRHjET1dFeytFttXh4s1MO4QuiAYmrrT5TCoeMgnzdu92cfwJVo
         /ua0iJStoGHKQya5NhuuKoOFKTYQOp1Qn5x1UDw64LKJE3awh8etJR+2FMTkBWbLUFy6
         S96zzjmX47MUta23a5TLOrO6cbe5dQHsiWdgrgkz+we53kdkBdQMOLVH1pcYDEyr6KZJ
         3r8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781704205; x=1782309005;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8p3qTBw4ely1JdACaWOk7zKQbPvRPDs6QhiejnidQw=;
        b=sX9C85WnAMc0hgcPxZ+6LCeaKsPycDbyoxB5yotaaSi/dgCNqifu2s1QCrUyBJihyo
         OMjRN2xCYru6nU80a3NgHYZeuAlSr8C62n9urr9ZFdUT8caAOpAr8OnBZRqkqcQ7oYwe
         eetFO1dMXXMGiwxChl5WHDS7klI0UwqHPbYzNI/CcZtTrbsEAaCM/BQBKD50fpYV0mxn
         rRG3+NxEcv9Sx39gy+oRM9zDLgtWx3PHwhir8/Lq8icMf9rd12c5KLRD4z7eZJElnBep
         AvGRr6wwbgrDEFwuG72BGxDKmfKOH93SJMRy1ZkBrHm+rJIsKAZadiqHmPvYFKVPoP4K
         Jsaw==
X-Forwarded-Encrypted: i=1; AFNElJ982azLsY1Pzm/4odCrTTRaf3gssRbELWnudhuKDgX8E0eIKtmR80R13yFMkWxJExHJpdrfrw6bYm6oDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIMl0sCMQ2uskmivifTbD3Ph1puPy30V7ropQhKSYvjRqgQxN1
	UoQLviKRDM3RyOan1u6xZjd1VZKRbnqBgoHqClbSkamT73jWd34kpo3p
X-Gm-Gg: Acq92OGt74EVZg0Vx+Oc3hQuoLdFD4YYjcqeGx6PWWJx0asLU0tQSi4PluWHq/9G+6V
	e668lFbqzir0YNPD93nfR2DcbgorGT2vqLJKmB5mr82IkQ6yKk+bwil1ZV6+pycO/CrrBVxLs83
	3WkCeJeYw2jIVs0ZXOHjeKLzUmjX/YbEzjzVm2a8F//dAR1DETI5BWMxEmGnW5rJU+UuVgZ53ra
	YfMS2vknRWnQwONa1IkIL6B7gLoCNPUrhnz0vkkUwigb34D9wDEcmsk9XCZwXFbYTORS/WX4CH1
	mLvCw/IrQO9DvSntrzaG/FM9obx9tpaRiGDpq2sB5QK9y5NYO32rtMXPGPN0p3QdaAFfgY4NnrL
	tkeyemmZefItrT/H0rVFel7ZQz9ligeLdMpkFT9DS4HWT5x0llrBoNAraxGK3r/htQsSzKmSWlV
	0QhQCLUULV0AAlKe9Tx89UDkaCt+/iMNPij0EqYMgRxtNejOvtGPscqfhXfrt0XQ==
X-Received: by 2002:a05:6a00:198d:b0:841:edb9:4ea2 with SMTP id d2e1a72fcca58-8452458ea48mr3799218b3a.32.1781704204722;
        Wed, 17 Jun 2026 06:50:04 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434accdca8sm20204102b3a.18.2026.06.17.06.50.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 06:50:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <751cd5eb-104f-4445-a6d2-8119ad5d5660@roeck-us.net>
Date: Wed, 17 Jun 2026 06:50:02 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] hwmon: adm1275: Support ROHM BD12780
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Wensheng Wang <wenswang@yeah.net>,
 Ashish Yadav <ashish.yadav@infineon.com>,
 Kim Seer Paller <kimseer.paller@analog.com>,
 Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Yuxi Wang <Yuxi.Wang@monolithicpower.com>,
 Charles Hsu <hsu.yungteng@gmail.com>, ChiShih Tsai <tomtsai764@gmail.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <cover.1781591132.git.mazziesaccount@gmail.com>
 <c92f1356fbf967dee3130f2eb0da08eb84800d47.1781591132.git.mazziesaccount@gmail.com>
 <67bec6ae-4f21-441a-8c5e-b56bd1a2ab84@roeck-us.net>
 <46b3f680-91a9-4a2a-a197-8f0ca5e38b90@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <46b3f680-91a9-4a2a-a197-8f0ca5e38b90@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/16/26 22:48, Matti Vaittinen wrote:
> Thanks for taking the time to review this! Feedback is appreciated :)
> 
> On 16/06/2026 17:13, Guenter Roeck wrote:
>> On 6/15/26 23:36, Matti Vaittinen wrote:
>>> From: Matti Vaittinen <mazziesaccount@gmail.com>
>>>
>>> ROHM BD12780 and BD12780A are hot-swap controllers. They are largely
>>> similar to Analog Devices ADM1278. Besides the ID registers and some
>>> added functionality, the BD12780 and BD12780A mark PMON_CONFIG bits
>>> [15:14] as reserved. Hence TSFILT setting must be omitted on these ICs.
>>>
>>> The BD12780 has 3 pins usable for configuring the I2C address. The
>>> BD12780A lists the ADDR3-pin as "not connect".
>>>
>>> Support ROHM BD12780 and BD12780A controllers.
>>>
>>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>> ---
>>>   drivers/hwmon/pmbus/Kconfig   |  2 +-
>>>   drivers/hwmon/pmbus/adm1275.c | 46 +++++++++++++++++++++++++++++------
>>>   2 files changed, 39 insertions(+), 9 deletions(-)
>>>
> 
> // snip
> 
>>> @@ -487,6 +489,21 @@ static const struct i2c_device_id adm1275_id[] = {
>>>       { "adm1281", adm1281 },
>>>       { "adm1293", adm1293 },
>>>       { "adm1294", adm1294 },
>>> +    /*
>>> +     * The BD12780a is functionally identical to BD12780(*). Even the pmbus ID
>>> +     * register contents are same. When instantiated from the DT, it is required
>>> +     * to have the bd12780 as a fall-back. We still need the bd12780a ID here,
>>> +     * because the i2c_device_id is created from the first compatible, not from
>>> +     * the fall-back entry.
>>> +     * (*)Until proven to differ. I prefer having own compatible for these
>>> +     * variants for that day. Please note that even though the probe is called
>>> +     * based on the 'bd12780a' -entry, the ID is picked at probe based on the
>>> +     * pmbus register contents and not by DT entry. Thus, if the bd12780 and
>>> +     * bd12780a are found to require different handling, then this needs to be
>>> +     * changed, or bd12780a is handled as bd12780.
>>> +     */
>>> +    { "bd12780", bd12780 },
>>> +    { "bd12780a", /* driver data unused, see --^ */ },
>>
>> We don't usually do that. There are various A/B/C variants for many chips,
>> and we just use the base name unless a difference is warranted. Either this
>> is needed, and driver data is needed as well, or it isn't. If it is not needed,
>> it should be dropped.
> 
> At the moment the only difference I know is reduced amount of I2C slave addresses. This shouldn't be visible to this driver.
> 
> My problem is that I don't know for sure if we later notice something that requires differentiating. Thus I would like to have different DT compatibles (or other source of I2C IDs if those are used to instantiate the driver). If we don't do this, then we have problems if we later find out that these ICs require different handling as users because we can't differentiate these ICs if they are described with same compatible/I2C ID.
> 
> The "fun" thing is that both variants have exactly same MFR_MODEL and MFR_REVISION register contents. Thus, these ICs can't be differentiated by reading PMBus registers.
> 
> This is also why the driver data entry gets unused. The existing probe mechanism in this driver, scans the names in this ID list and compares it to the PMBus MFR_MODEL, and then picks-up the driver data to use. Now because BD12780 and BD12780A both have same MFR_MODEL, the scan in probe will always pick the same driver data entry, no matter what ID was matched by bus code. That's why I added the comment here.
> 
> If I drop the { "bd12780a", /* driver data unused, see --^ */ } -entry from the ID list and add the of_device_ids, then I think this problem is solved for the DT-platforms. As far as I understand, this would still cause any non DT platform to describe both variants as "bd12780", making it impossible to later differentiate ICs in the driver, right? I can do this, but for me it feels a bit like asking for problems...
> 
> My thinking was to have different IDs for these variants so hardware description could have different IDs for different ICs. Then, if we later need to differentiate these ICs, we still have an option to change the probe to trust the i2c_get_match_data() when PMBus indicates the bd12780.
> 
> This however is some extra complexity, and I would like to add it to the probe only if it really is required.
> 
> But yeah, having an ID entry in the list and driver data not used even when the matching IC is found, is unusual and would have caught me off guard. Hence I added the (long) comment.
> 

It is unusual and unnecessary. If for whatever reason it turns out to be necessary
later to have a separate ID, add it then. Again, there are lots of chips with A/B/C
variants. We only add separate entries for them if/when needed just for "in case".

>>
>>>       { "mc09c", sq24905c },
>>>       { }
>>>   };
> 
> // snip
> 
>>> @@ -712,7 +732,16 @@ static int adm1275_probe(struct i2c_client *client)
>>>           break;
>>>       case adm1278:
>>>       case adm1281:
>>> +    case bd12780:
>>>       case sq24905c:
>>> +    {
>>> +        u16 defconfig;
>>> +
>>> +        if (data->id == bd12780)
>>> +            defconfig = BD12780_PMON_DEFCONFIG;
>>> +        else
>>> +            defconfig = ADM1278_PMON_DEFCONFIG;
>>> +
>>
>> Please add a separate case statement for the new chip
>> and do not overload existing chip data.
> 
> I originally did just that. I, however, was not happy with this as it resulted quite long own case this IC, which is almost identical to this other (adm1278, adm1281, sq24905c) case. I wanted the code to shout that the DB12780 is indeed (almost) identical to the adm1278. But yeah, I agree, having "if (foo)" in "switch (foo)" case can get confusing.
> 
Better that than embedded if statements. At some point it would
probably make sense to rework the driver to use per-chip configuration
data, similar to other drivers such as lm90. But that would be a separate
effort. Until then, please keep per-chip configuration in separate case
statements.

Thanks,
Guenter

