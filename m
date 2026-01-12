Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE94A3126C2
	for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 19:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768245087; cv=none; b=tCeF8mKBQny88x7n5noKBChQI0ijs3ygeINL7u0lqpinQIh7q8WFXa9XqlHZtP1g/Nwtu+26IU4cSY1JYtXjr00jHKx7QSZw183aVtI5EJx79lgQFwT1dzTub5cdl24mJhNVxPelojVl/hPrCoYnCYFfAatAHKcoF0TL7NOR88w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768245087; c=relaxed/simple;
	bh=/Twa0pIo0dvXowp8gV2tknTOwwcVr5fgJLKjI0DWCxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=klCxADsMO06KWtM2l6C/WMu1Hq2qU1EGCz4GFgR6hrcMljTAFdhTTjC8TDLDP+MzyyA3EH4bAMYwVHdEMKfK5bOBo7hdflZ8Mhhdp9rSbGwFPEeNXckeAZuP0c4Q7wf9UNrEzQMNO9wKY6IG5y6cQDQCc20GMYSFXCMPKc1tBGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFQYx2ri; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFQYx2ri"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1220154725fso2667214c88.0
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 11:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768245085; x=1768849885; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=hqg6CF6Vamho0+8dHx5KQNFNzfqeMveqQWak/lrZkcc=;
        b=KFQYx2rizcFbCANWQpkkAKpO52tn6ZkLI4BwmbAOW8jRC+1DmpBrrJupsfgk2wD/x8
         RpeMy1H0qPL9UYp1NmdNafYzjM1Oup3BLZ0dLl+DdnKoJWc09L8SQoN0i+b5nhgiEikD
         wK4EGKZg1jLMlvMnJJBuI2Sk7RxDr86JSi9fr19gDbIPOrjxY52XjpA9nF1zftfYjbJH
         /X3PqVBbtRaHDIw6AaAb2QgQbWnHrtswuIwy0Q2MZK4eYyCV4kVFPMZ6CoEtZSfGPOGa
         SMrfOsnbQSv0XKW0nzBloZcaHiJfwXAuxIHfBzqD1c8BE2cP7pIhk8I1P1PcyEMRNHYW
         k4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768245085; x=1768849885;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqg6CF6Vamho0+8dHx5KQNFNzfqeMveqQWak/lrZkcc=;
        b=KWXi1HGESHOZZNb2275nsAX7nwbF+pIEsa3sBdAJA5vNMT3QT5LMQh7U7SOW2vADqa
         YzTVYjTwq1RKBcTmQPguDKkpKaz07dC93+dIGhQyH0hSmu1SMcvsEwGGhe+UbrVUXNWb
         NpnQ9Dvc0/+T48zc/HBYabRgan9T0977zjcNCEEArE35MX8bTh8b6XZQRCCnPJvlNgWy
         j+5CPEZ81wKk4XPniULncOPzf/295TfGwstNkqwTjg5GkD8pf8ASPBV48DRCANAhoqMB
         Bpciu2l4GtxMg0hC/Ek6OkPgtz0GvBCSHfc8ERJjJtnZkGokGWZFeopiOM4HqxE9iXyB
         fkHw==
X-Gm-Message-State: AOJu0Yyzjiln9vRVggLUTtrbe6aAH0wfuDI34OUdLSmY0e6mZqllxqU9
	BMIKv2rYkXJnMjQlkKBbdoXsyt1UbNe+81V8tGLFR2UMKVCSidPyRkFE
X-Gm-Gg: AY/fxX4+/wURK6RBuzlsR9y3c69HC5tVXssu7a7wXp3LWJsOaFF5POwQ5lHaorAwaQa
	XShUjh7ZqL4HFIzLpU88B6DT0nXbQcX32KgMC2whe8uGzeuZ+QrH9uFXROcsbq7CICK3t1XdIUs
	/5Sj01A+IT3VuK2Af2d5kr1kJrOFagxAPWZ8ypCy+BcCxjIVTBvln5sZBr5OmZopU/BvOHTT+3q
	iQoBlt+s6TFNGheBlVdi42azHmwggFUstNBBbFG80yLzM9NdssQ38SYVvk/kRGg/K8oR0wWGCKw
	aO7HWC91XEDBcKojrtuEnYnXMZKFmO40nbFRbBXE7vn3nBQz/CINPFUkmLAnJmFdx1YVNw6reJx
	q1CAB9QgiKzPCG38F2f5EIXK0JaRmvtDQusqtCS0dqGO8eVCzPNEEM5dcDCMlUIHvivFTqG4crv
	dgt/CiakROk1EWY4s5UMi/EKo2ll8hQXNyPQq1Bwun7YrFp8CwxdXlM1qdXZIjDVqOmpW2ZuI=
X-Received: by 2002:a05:7022:1b03:b0:11b:a738:65b2 with SMTP id a92af1059eb24-1232b58e8eamr277852c88.5.1768245084802;
        Mon, 12 Jan 2026 11:11:24 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f24346b5sm26256054c88.3.2026.01.12.11.11.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 11:11:24 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0724f25e-64b4-46c8-8def-2dca1b335d24@roeck-us.net>
Date: Mon, 12 Jan 2026 11:11:22 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hwmon: spd5118: Do not fail resume on temporary I2C
 errors
To: Armin Wolf <W_Armin@gmx.de>, Tinsae Tadesse <tinsaetadesse2015@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260110172003.13969-1-tinsaetadesse2015@gmail.com>
 <d08f3edd-f5bd-4e6b-b174-e768d42df281@gmx.de>
 <6da5b1c1-bbe5-40a8-8363-3213265fe848@roeck-us.net>
 <a43a785a-2b43-4588-8fbf-5eaec398acb9@gmx.de>
 <43ea9f60-aa92-4c2f-b263-6a952a837a19@roeck-us.net>
 <2469185c-a1f9-42dd-a03f-5755c3d5ac09@gmx.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <2469185c-a1f9-42dd-a03f-5755c3d5ac09@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/12/26 10:22, Armin Wolf wrote:
> Am 12.01.26 um 19:17 schrieb Guenter Roeck:
> 
>> On 1/12/26 09:46, Armin Wolf wrote:
>>> Am 12.01.26 um 17:36 schrieb Guenter Roeck:
>>>
>>>> On 1/10/26 14:27, Armin Wolf wrote:
>>>>> Am 10.01.26 um 18:19 schrieb Tinsae Tadesse:
>>>>>
>>>>>> SPD5118 DDR5 temperature sensors may be temporarily unavailable
>>>>>> during s2idle resume. Ignore temporary -ENXIO and -EIO errors during resume and allow
>>>>>> register synchronization to be retried later.
>>>>>
>>>>> Hi,
>>>>>
>>>>> do you know if the error is caused by the SPD5118 device itself or by the underlying
>>>>> i2c controller? Please also share the output of "acpidump" and the name of the i2c
>>>>> controller used to communicate with the SPD5118.
>>>>>
>>>>>> Signed-off-by: Tinsae Tadesse <tinsaetadesse2015@gmail.com>
>>>>>> ---
>>>>>>   drivers/hwmon/spd5118.c | 8 +++++++-
>>>>>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
>>>>>> index 5da44571b6a0..ec9f14f6e0df 100644
>>>>>> --- a/drivers/hwmon/spd5118.c
>>>>>> +++ b/drivers/hwmon/spd5118.c
>>>>>> @@ -512,9 +512,15 @@ static int spd5118_resume(struct device *dev)
>>>>>>   {
>>>>>>       struct spd5118_data *data = dev_get_drvdata(dev);
>>>>>>       struct regmap *regmap = data->regmap;
>>>>>> +    int ret;
>>>>>>       regcache_cache_only(regmap, false);
>>>>>> -    return regcache_sync(regmap);
>>>>>> +    ret = regcache_sync(regmap);
>>>>>> +    if(ret == -ENXIO || ret == -EIO) {
>>>>>> +        dev_warn(dev, "SPD hub not responding on resume (%d), deferring init\n", ret);
>>>>>> +        return 0;
>>>>>> +    }
>>>>>
>>>>> The specification says that the SPD5118 might take up to 10ms to initialize its i2c interface
>>>>> after power on. Can you test if simply waiting for 10ms before syncing the regcache solves this
>>>>> issue?
>>>>>
>>>>
>>>> It seems to be highly unlikely that this code executes within 10ms of powering on the memory.
>>>>
>>>> Guenter
>>>>
>>> AFAIK the 10ms are associated with the VDDIO supply, the VDDSPD main supply is different from that.
>>> I just want to test if this device disables VDDIO during suspend-to-idle.
>>>
>>> I have another theory: if the SPD5118 somehow looses power, we might still need to manually put the
>>> device into 16-bit address mode using standard 8-bit i2c commands.
>>>
>>
>> Uh, no, we can not do that. I tried. Changing the access mode causes bad hiccups at least
>> with some boards. They interpret that as a memory configuration change, and the next warm
>> reboot will end up in the BIOS. Then, after the RAM configuration is updated, a cold reboot
>> will again detect a configuration change and BIOS will be entered again.
>>
>> That does make me wonder how the problem shows up in the first place, since the BIOS
>> usually does access the SPD5118 during resume, at least on my systems with DDR5. Granted,
>> those are with AMD CPUs, but I would assume that Intel BIOS versions are not different.
>>
>> Guenter
>>
> During suspend-to-idle the RAM stays active, so the firmware does not really need to access the SPD device.
> I meant that if the SPD device is configured during boot to operate in 16-bit mode and looses power during
> suspend-to-idle, the firmware might not reconfigure the SPD to continue operate in 16-bit mode after resume.
> 

This would be a severe BIOS/Firmware problem. I'd really want to see evidence that
restoring SPD5118_REG_I2C_LEGACY_MODE is necessary on resume before touching that
register. Even then I'd want to see evidence that touching it doesn't cause
problems on a variety of boards before actually doing it. After all, we would not
know if the register was reconfigured by the firmware for some reason, or if the
chip lost power and the firmware didn't handle it.

Having said that, even if there is evidence that the chip can lose power and end up
in the wrong mode on resume, I'd rather check for that condition, issue a WARN_ONCE(),
and disable the driver instead of touching its configuration.

Sorry, but from my experience SPD5118 access in general is quite fragile, and not
touching its configuration was the only way I could find to make it work reliably.

Guenter

