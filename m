Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6BC37996C
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Jul 2026 00:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784678429; cv=none; b=ojX6USIcboIBW4XGJpoebi/U9nzCppJllFiAKOgDxSH85ILqCqzy96Tk/iOxGKD8l1PzejbOX3QeuMEKaq0QLDpk3xLk3eAGJOmpmbVIWHgwYag/lBi5tw15hKHt5KDD6wSAAq9GD9GKJzvJU/PVvlwf3Hw0uSqwb9nwBCm8D28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784678429; c=relaxed/simple;
	bh=57SqYvInkYDKYWO5zuktJ3i7LRpvI+nkX9lqI7GzSTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s99Y50CNyT0rFzqwzC+3rYiqrtF1/MNOESY8PFDzgjUFHj+OpT6bdx+SYIpXuOQKD4W5xUhdeS6rELi1UUTOfhgarNkHNdzq8I1/7fuXsjpjB5Jql0O5ICHpu7uKVLRdIX+Z3wkBZSonykeGB8MIeQluTKDQzOlTOH6Ui2UAjeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cLfvqPDZ; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cLfvqPDZ"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8485ef63b68so11630830b3a.1
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 17:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784678426; x=1785283226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TfD1WJrnD93D/tERtpxD/SCKB4+Ih78t8LlR0dT8WBQ=;
        b=cLfvqPDZXeXFxGxjYsOrukcIRDV63KuhZeR1yfrWmQ34sRgIsQRUwlkYCUpBPi3OCC
         fIiMSK6AUkowxJ8Gg0eYUu8GjxXOACaaf0y6/DjSRqII+PACieLFAm3jPp7F1kTzFqBC
         dBiM9QqLD2Y3u6zDNkvt4ysjszczxSlbaVtiIj76GwWilnMnp2k2VTp+19YkrSoFv9ms
         pY+NkUzeHeRZGchxrvDL49Uc887PadiWPRB7gV0lAy7XcqbTSeDhVKuTsg/WEXsou8fH
         Uf6SlLFnJKK1KBd03j/dZNWxHy9FKmniA8z9P19rBPHRRrLn/KNoFphxqyy6akj+ZMVn
         fz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784678426; x=1785283226;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TfD1WJrnD93D/tERtpxD/SCKB4+Ih78t8LlR0dT8WBQ=;
        b=fjhf0f09F0I9hXzSKa0hulgJSnKfUEvBKmKI/PO+6jq9ihYZaZC40HH8Js7J4ka1+Z
         2SzhrrWqujqehETwP8lL2ex/hh9LsT5L+kxbwqf47DLAjdt2/slUNaloh45Eg6JIXhtk
         Lyj1Q5FfUA7wCjLXM+mRJQaibsDtFkNjklbZm7cRuI43WxnsaOeU35zrQCu0N9Hf0NY6
         E7NMZkjPRYh/7e0YoB3x8RRlzlnAFxwzSd5k0tgVrKKU8Kn3s8+suLon6S8Jj3/ixh/1
         5QOC1SzRMsAGH6BbeOCqsCl/T4chr3LBZV3Y9Ke5TdOEX1zci/KB8NwxHjrcR0RZZasX
         YMAQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr6Zb2+qZcoVVCdA/Cc/0j5vRpk/oKQyJ5wgAx8wD75L20/LMewrTF77DIxpKaPa7GIkLa7Vvs+bwsYow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu/nbb6mNIZNyt7x+obLufBehUjSPrMI81piUV1/EWv9iimhkX
	rMqcJSc/eK2h0lTGWidvuoyYlErcZEHyb3w4+QqsU65Wuy0qPYIavr0+
X-Gm-Gg: AR+sD131l0Mtb08YJl88slI8hUoGaxJDKhqBT5B0V9i76wHDhZOsr/9L0XEGwD4BAFo
	IuCXWS5c8+niXhNPrfcKqozXT6KlD2WCzZzN6mW6HGBvi4Bd05vGjlHi6M2/Isc91209PKXVLoj
	3kGzgZY+fOe9pUhkAS4pvEpczvmeh0X1fm+DrJH9lsJKNecF5Ww3nuoFZAtQulJqee4Yy/eMHEd
	mWyeceiD31Vrz0ZwkGMGqMi32zDulV6qmdM5CKhiWQu1hv9S/ZXXQb783pp/FGKvluPLsvk1YE4
	LZgQ/iKi+OVLNHITmyVDYQ7VZiGLFlPescdZHuW/btV87lRrusZdPURNL1eyKGuYvK9c3hqW/KG
	0UKPHJiy6MpgaBrAecYebavgOWWCSSRGtjiLEUxoeekf7heL+Y3Nzw64obHRoPzu/Jb1WGJAtvB
	Npx+kiA9xDy6zacpjUEJ7vNpfh3EZq6OvTMm7SuBzuVMWB9CCUS1w=
X-Received: by 2002:a05:6a00:32c4:b0:847:80f5:c616 with SMTP id d2e1a72fcca58-84c292a0f00mr20522474b3a.10.1784678425951;
        Tue, 21 Jul 2026 17:00:25 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175a29aesm390443b3a.41.2026.07.21.17.00.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 17:00:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <635a0d22-8565-4c62-94d5-2cbaff308558@roeck-us.net>
Date: Tue, 21 Jul 2026 17:00:23 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v7] platform/x86: panasonic-laptop: add fan speed mode
 for newer models
To: Alex Yeo <alexyeo362@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
 Kenneth Chan <kenneth.t.chan@gmail.com>, Hans de Goede <hansg@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-hwmon@vger.kernel.org
References: <b557e1f6-2072-496f-8eaa-d2899d1bded4@linux.intel.com>
 <20260718185704.3466-1-alexyeo362@gmail.com>
 <fcf57a96-b2ad-c7d5-0d6d-6d760b915195@linux.intel.com>
 <531e3c48-bb61-4741-8fe7-a2dbc213eb1e@roeck-us.net>
 <84b521b8-112b-4fed-ab82-e1e16d770e66@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <84b521b8-112b-4fed-ab82-e1e16d770e66@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/21/26 16:22, Alex Yeo wrote:
> 
> 
> On 2026/07/20 10:41 PM, Guenter Roeck wrote:
>> On 7/20/26 06:46, Ilpo Järvinen wrote:
>>> On Sun, 19 Jul 2026, Alex Yeo wrote:
>>
>> ...
>>
>>>> diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/ platform/x86/panasonic-laptop.c
>>>> index b83113c26f88..2d67188de2a9 100644
>>>> --- a/drivers/platform/x86/panasonic-laptop.c
>>>> +++ b/drivers/platform/x86/panasonic-laptop.c
>>>> @@ -119,6 +119,9 @@
>>>>    *        - v0.1  start from toshiba_acpi driver written by John Belmonte
>>>>    */
>>>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>>>> +
>>>> +#include <linux/printk.h>
>>>>   #include <linux/acpi.h>
>>>>   #include <linux/backlight.h>
>>>>   #include <linux/bits.h>
>>>> @@ -136,6 +139,14 @@
>>>>   #include <linux/types.h>
>>>>   #include <linux/uaccess.h>
>>>>   #include <acpi/video.h>
>>>> +#include <linux/sysfs.h>
>>>> +#include <linux/hwmon.h>
>>>> +#include <linux/hwmon-sysfs.h>
>>
>> FWIW, I don't see why this is needed.
> 
> If you mean linux/hwmon-sysfs.h, I agree.
> I will remove that in v8.
> 
> For the other includes:
> 
>  >>> +#include <linux/sysfs.h>
> this was previously missing
> 
>  >>> +#include <linux/hwmon.h>
> used this for registering the fan as a PWM fan on hwmon.
> 
>>
>>>>   struct pcc_acpi {
>> ...
>>>> +    /*
>>>> +     * This mutex ensures that the hwmon and thermal functions
>>>> +     * for fan operations do not conflict as the PWM fan is
>>>> +     * exposed to both.
>>>> +     */
>>>> +    struct mutex            pwm_fan_lock;
>>
>> Maybe ask why this additional lock is used instead of relying on
>> (for hwmon attributes) and using (for thermal) the hwmon subsystem
>> lock.
>>
> 
> Both the hwmon and thermal devices share the same control path
> (pcc_pwm_fan_speed_read and pcc_pwm_fan_speed_set). To prevent them from
> executing concurrently and interleaving, I added pwm_fan_lock to serialize access.
> 
> Reading and writing fan speed requires a multi-step ACPI transaction (e.g., checking/setting manual mode first before accessing or setting fan speed). This is because I rely on querying ACPI for the current state instead of keeping state cached in the driver. Because of this, the mutex is placed in the outer hwmon and thermal callbacks rather than inside the low-level ACPI helper functions.
> 
> If there's a more appropriate way to synchronize this across both interfaces (e.g. use hwmon_lock in place of a driver level mutex), I'd be interested to hear it.
> 

I for my part would like to understand why hwmon_lock() / hwmon_unlock()
(or the hwmon_lock guard) are not sufficient. You suggest above that they
are not sufficient and that you need the additional pwm_fan_lock, but you
don't really explain the reason. You do explain that you need to lock the
thermal access functions, and I agree, but you do not explain why the hwmon
subsystem lock functions can not be used. It would be important to
understand why that is the case because those functions exist for exactly
that purpose. If they are insufficient, it is important to understand why
that is the case.

Thanks,
Guenter

