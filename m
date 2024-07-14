Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B9D21A0B
	for <linux-hwmon@vger.kernel.org>; Sun, 14 Jul 2024 12:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720960727; cv=none; b=oSEBrmN65IPCy95sFmbjHgGmyU6iMS+iRxgxhjau39pqRMd5DmffjKZ3ZbeWsiOkfqfFT2sF6oUsxR3wC4hqEQM9s1Ll6gACnKMJUquZypePwRxAvo/S3tfwBCu+ZzGezwUjQl2/ExnmCkKf6t5QDAaluSO7CVnravnqrasOlSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720960727; c=relaxed/simple;
	bh=o74WG0qJUCezT2twvKBfoicP5aCXV1A3sLtRXXcy4PY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PqnHm4ZdJ+Hx15fkurIA7Qx0RPfB8fyKQzeNgr74nlEIBtgvh/Az9Sg5JSacSJK26+LEY/LarWsSzdtYqpBqaM0qYhoxvl4M5K3dcjl1St4f714AVR6Q7PetZC9Ld687xiJe0t8eysq4WPETjM/UXrhmVTl/vAi8ln3+k8dMaRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ObVzi/72; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ObVzi/72"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7044c085338so2135746a34.2
        for <linux-hwmon@vger.kernel.org>; Sun, 14 Jul 2024 05:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720960725; x=1721565525; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=UM9SCBGM4H0B4lrZjrkyEmqCRHsAbI/IH0HQ2d4+w7c=;
        b=ObVzi/72I3lUabXepwQA5yaftaMk0G94psHhJx4fU5GbVeYNJ1xyZnyu+eERc2ZoTW
         rnvQQtaSWc8LIxdyhTuQ4tMGnnMWkBSPAw+SA0tLoUiQ6rQ+VUBsp8AKpG0KemlOj/kY
         XtDCoE+NhoKNkBDekjgJLLO3RfBILuWIh7mf0ARrqshkWeiKnpVjbpb0Oa0qoSkZTaq4
         XV0xU5AbDtziCOtaXQLX91sNKyIzeLxpTm1OzBHNSfw+x7teCxoBLrAbIYMy+TLx9uA5
         96DeYGQS/e5nTXPw8L9tYSZ5dkOZPOt1ns/uEMtRj8i7URTgG2Lh6sdP8RvBfHIse4nT
         RYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720960725; x=1721565525;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UM9SCBGM4H0B4lrZjrkyEmqCRHsAbI/IH0HQ2d4+w7c=;
        b=wItXJBXUJPO3OB4tTMzF/fmPWrUzYDnQH3IkwdakMABS8c8kS1Bg5QuSSMYQV8ffbT
         Oo9IcNWhn39j7da7s0Ku6UN/4gSajIYsC0v+citHwYh5+COF8FfSTs2S8hb9lU/oQ1VW
         hkEbz7/qgS13NFHvsiSyn5dU2OVftgS0srphI5S9BUFyK8XQkhkMBelJXZWz9M9w7FkL
         K9Xv4ezbbY3jXWEgqsM8H/6t7NjJp1tilLMlv/RnBIcewtBZVClwnGJmLWJF0gIZJ8WQ
         5mQhM4bCm+U9qD83/vfwspu8ISerIe8gFSs5LPy/xHHgzkMgn2l4/TeaShfC0CeeaPdY
         Ev8A==
X-Gm-Message-State: AOJu0YzfVG+gYep0U2KGd/3rI3/lBlk/RG+maEpAnGUpqO/rON1yLHLU
	kJ8C6xe1VbtNj5bbS2kbmyNp25jySMIQHreCGXdv9PK01sMqJUU3LZ7hQw==
X-Google-Smtp-Source: AGHT+IG2Cne5Q7hPuU58K0NUeLhau5g6/NcyNhwMXUw2zOdvf9Kx4/aEqo0raibgqGpvFuHaJwf1rg==
X-Received: by 2002:a05:6830:2090:b0:708:b2bd:74d with SMTP id 46e09a7af769-708b2bd07camr10507314a34.18.1720960724970;
        Sun, 14 Jul 2024 05:38:44 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7ec7d040sm2541447b3a.119.2024.07.14.05.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jul 2024 05:38:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3a959b04-7ffc-4e6a-a79d-e21742050167@roeck-us.net>
Date: Sun, 14 Jul 2024 05:38:43 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: Remove obsolete adm1021 and max6642 drivers
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20240712173548.3556699-1-linux@roeck-us.net>
 <ZpKbxZf6TOqid1cP@tzungbi-laptop>
 <e263f50e-ffc7-4208-b1a5-960be94569dd@roeck-us.net>
 <ZpN47C2Zey-eX1o6@tzungbi-laptop>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ZpN47C2Zey-eX1o6@tzungbi-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/14/24 00:06, Tzung-Bi Shih wrote:
> On Sat, Jul 13, 2024 at 11:53:00AM -0700, Guenter Roeck wrote:
>> On 7/13/24 08:22, Tzung-Bi Shih wrote:
>>> On Fri, Jul 12, 2024 at 10:35:48AM -0700, Guenter Roeck wrote:
>>>> diff --git a/drivers/hwmon/adm1021.c b/drivers/hwmon/adm1021.c
>>> [...]
>>>> -static const struct i2c_device_id adm1021_id[] = {
>>>> -	{ "adm1021", adm1021 },
>>>> -	{ "adm1023", adm1023 },
>>>> -	{ "max1617", max1617 },
>>>> -	{ "max1617a", max1617a },
>>>
>>> The device ID "max1617a" only in Documentation/hwmon/lm90.rst but not in
>>> drivers/hwmon/lm90.c which results in max1617a is no longer supported after
>>> applying the patch.
>>>
>>
>> Thanks for noticing. It is an oversight, really. The chip is the same.
>> max1617a is even mentioned in the lm90 documentation.
>> The chip is detected and supported as "max1617" in the lm90 driver.
>> Here are the notes from that driver.
>>
>>   * Note: Multiple chips with different markings labeled as
>>   * "MAX1617" (no "A") were observed to report manufacturer ID
>>   * 0x4d and device ID 0x01. It is unknown if other variants of
>>   * MAX1617/MAX617A with different behavior exist. The detection
>>   * code below works for those chips.
> 
> Ack.
> 
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
> 
>> Either case, all configurations enabling the adm1021 driver also enable the
>> lm90 driver, and that in turn prevents the adm1021 driver from being built.
>> Effectively that means that the adm1021 driver hasn't been built for a long
>> time.
> 
> Curious about how this happens: is there a way for telling build system that
> we prefer lm90 to adm1021?
> 

This was

config SENSORS_ADM1021
         tristate "Analog Devices ADM1021 and compatibles"
         depends on I2C
         depends on SENSORS_LM90=n
         ^^^^^^^^^^^^^^^^^^^^^^^^^

Thanks,
Guenter

