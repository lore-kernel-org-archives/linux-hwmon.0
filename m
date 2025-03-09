Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14FB1DF27F
	for <linux-hwmon@vger.kernel.org>; Sun,  9 Mar 2025 15:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741533776; cv=none; b=AVg1fuub54pBDKXCg5//OZ3u/bPN0Bvip4D3IDQ2H2RD/TxxJbm9pqdF0EJzUYoyNSvGYQy/I6/l59XBoPmzADRXrnQClBPMzniT6AB3k8snMrEVaB/VXIOFFCxEnj4pjilDmU5SzjFwf4EW0POQqWpWDR6XkIQnwd0OoCVOukE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741533776; c=relaxed/simple;
	bh=UzuOtGndFFbDerug9VsJWd1dpG7ip0k15Mc/FfvRZfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TdKCKqlJzQZCU5YgtpbMSVQgfP4mn4Dvv1vptTuNVgTut5wHWAaXQTB1xr+JvNhjtchA3A014Anzx0o1xwNCcR2TIFm/GvxvTPt9M4o0YkDkXexWXN3xTz7k+mIx23AEBG1XdkIKUZ95dV5iyuxLCh4S+qXts3BmlSdylXfHv+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fOH5jU9e; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fOH5jU9e"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22334203781so80547555ad.0
        for <linux-hwmon@vger.kernel.org>; Sun, 09 Mar 2025 08:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741533774; x=1742138574; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=IjHIuZiBKVP9KJlrHc0VTnsxL6AvaRmPqA2IGSJcxos=;
        b=fOH5jU9eKNmch7k7WeQPvzWPEMbKX2pT2LbVie73svpAHWMXQtPhHPu9hNi5UuxE6x
         TEiFzGMrfaTvVbgcey1vG70c7IXSmGfqih0Ay+plY/hkD71UwtRS97BwQ2s0TC0QSzf3
         p0yBpvojv37UO5Dr2W/HgBrbS5PVzc3RyAnHFxKD4BbT0aurfxP70f84NVaqnk6Rmk1F
         RDRgSyqAx2dQg4JYwZmQeHaaA1YH7Dky92BOrhS1FFBSzNg74V7Vk9lqiQuFjCnROpiq
         94CU5jZqrVQE7Nx4Z6bkqXqkW1SS0Kd4KBIb1QKoHhl4UTGm/BM8P1GZzGKWq2fqavbE
         jMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741533774; x=1742138574;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IjHIuZiBKVP9KJlrHc0VTnsxL6AvaRmPqA2IGSJcxos=;
        b=R3iRMuLFtLWfLdVZg8gxK5JjOEdleD4vDd9C/qR+0/WuQiLFbyyfmgyaZlb+GMCEES
         NIhkEAtWuA+BFjytvk0QulM8YGGSHJFLQtfi44fiN6KpMCd6ixbJl2WkNWdsTXo4qb5P
         zZJQhXH0UoYGKNSzv++/v3idP0Nk1yj1YrXE2xXlfgWHqvFUZGvo5peu29+5ee19MY0Y
         MuzmE2kcjC1sVUwK0dtYZandMv5nLoKj5IYObEHVbU6kEXFaJAx1eEtV/7B0m9plQfSk
         3fxYS9LYLjsU/XL3a3Hb46GfpHQfA+rYsSUtW3+fvyfYsjZgs0v6XYe6P4u+2ppwXyEv
         dhCw==
X-Gm-Message-State: AOJu0YznuisZgNax17sbvq6dm61IVso/KG6iiq70EcX4JwSO9CPZkURc
	KQI1R0DsxM8PAQEQ2GZcowua9Lg3GXl/rEisrcxX2sQv/e0ftqOJ
X-Gm-Gg: ASbGnctmHROvrNLpDmZGd8VEvEotrOfsFv2dpxxYlT+eagTBVsDbLa4GeKkPQlgwZ/8
	t8FlkuYjS+LjkYEOK+7BWl3f3LkAreNSJlNm4bvfFa/+eLo+BeD4MZtlM1T/ZCeQkSceRXxeTkJ
	voBwMA1q3JsCal5yX56PqVlWfSdEIGv7I4mYkVD1ipDU1pPZ2eXIsitKgcko9XdMdRsvD4ixPQQ
	N4sXhHgJ2+V23RiCjvVU+/Q6uYr0D7/rB4/bwA+wlth/1FlqgrvnbkeVU7d59hBROGXiyufRcSJ
	xanknw+Y2ehR4FJBPzTML5MOVMYlhazvm2ih9N/UE5u6CJWfT2GrvUKe3kjyRAa8lFnM8RyXfev
	7oevVVYQtWk1wHqqo9w==
X-Google-Smtp-Source: AGHT+IFPzDYBtIFqYwUvcCVHi6EcFfaxQn3QXIQ3tFSJb64cIiLrAzx5JCds8UXHIgB8bZAHgFvQZg==
X-Received: by 2002:a05:6a00:2d05:b0:736:4d05:2e35 with SMTP id d2e1a72fcca58-736bbf31871mr10296627b3a.3.1741533773900;
        Sun, 09 Mar 2025 08:22:53 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73699da011asm6442526b3a.84.2025.03.09.08.22.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Mar 2025 08:22:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <27859459-2640-4e33-93af-dd9c2ca0f16d@roeck-us.net>
Date: Sun, 9 Mar 2025 08:22:52 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: Add KEBA battery monitoring controller support
To: Gerhard Engleder <gerhard@engleder-embedded.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com,
 Gerhard Engleder <eg@keba.com>
References: <20250308212346.51316-1-gerhard@engleder-embedded.com>
 <f684a381-2eab-4c7b-8173-f8d8634bd237@t-8ch.de>
 <f534db33-3464-4d75-ae73-c1a3a63e3c3c@engleder-embedded.com>
 <054c5313-8b54-4afd-9457-26b89a4a7bab@t-8ch.de>
 <f65dd656-2195-4686-b2e7-bdd5df47ede5@engleder-embedded.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <f65dd656-2195-4686-b2e7-bdd5df47ede5@engleder-embedded.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/9/25 01:16, Gerhard Engleder wrote:
> On 09.03.25 09:23, Thomas Weißschuh wrote:
>> On 2025-03-09 08:38:06+0100, Gerhard Engleder wrote:
>>> On 08.03.25 23:23, Thomas Weißschuh wrote:
>>>> On 2025-03-08 22:23:46+0100, Gerhard Engleder wrote:
>>
>> <snip>
>>
>>>>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>>>>> index 4cbaba15d86e..ec396252cc18 100644
>>>>> --- a/drivers/hwmon/Kconfig
>>>>> +++ b/drivers/hwmon/Kconfig
>>>>> @@ -335,6 +335,18 @@ config SENSORS_K10TEMP
>>>>>          This driver can also be built as a module. If so, the module
>>>>>          will be called k10temp.
>>>>> +config SENSORS_KBATT
>>>>> +    tristate "KEBA battery controller support"
>>>>> +    depends on HAS_IOMEM
>>>>> +    depends on KEBA_CP500 || COMPILE_TEST
>>>>
>>>> KEBA_CP500 already has a COMPILE_TEST variant.
>>>> Duplicating it here looks unnecessary.
>>>> Then the HAS_IOMEM and AUXILIARY_BUS references can go away.
>>>
>>> With COMPILE_TEST here the driver can be compile tested individually.
>>> Is this property not worth it? But I can change it if needed.
>>
>> COMPILE_TEST is meant to break dependencies on concrete platforms.
>> KEBA_CP500 itself is not a platform dependency.
>> The platform dependencies of KERBA_CP500 are already broken through
>> COMPILE_TEST.
> 
> Ok, I will change it.
> 

FWIW, all those COMPILE_TEST dependencies are pointless:

drivers/i2c/busses/Kconfig:     depends on KEBA_CP500 || COMPILE_TEST
drivers/misc/keba/Kconfig:      depends on KEBA_CP500 || COMPILE_TEST
drivers/spi/Kconfig:    depends on KEBA_CP500 || COMPILE_TEST

On top of that, both SPI_KSPI2 and I2C_KEBA select AUXILIARY_BUS
which is equally pointless because KEBA_CP500 already does that.
I2C_KEBA depends on HAS_IOMEM but I2C itself already depends on it.

It is also ... odd ... that KEBA_CP500 depends on I2C. So it isn't
possible to enable any of its sub-devices without also enabling I2C.
It is not immediately obvious why this would be necessary.

Guenter

