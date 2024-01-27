Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691EB29425
	for <linux-hwmon@vger.kernel.org>; Sat, 27 Jan 2024 16:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706371947; cv=none; b=MmhCwymYO90AHBLJ9Tl5CFW4dL7PotlERQaHLGKeZ66y7n+OmI9RpZZWsl0RRWm/7Do5I079vVIGMtc2r9MiENS4+wNFTpWPsZfLqg8f/BXvvmy661lMC3q4dP3k01GhaWiw7kiJyHO4iE+Uf/b0m2T3s3PwSdwGewUiqQXy9K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706371947; c=relaxed/simple;
	bh=om0PX9VUIUHBc+cTVWtsgaN2lNH6nN7RkZxQ/0FBoPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LUusPV+Kvb3V+bDuWdJKttGYxJ8XI9/oLF0L4ZQ/xF50GDOkdqCMb/OOmy93kCMgoz64JsJJk8FFseG6cQfDgx3hTKOWneyy8TSbtJegoJQr52tHDAnFB3pQrM8FD+fjad/asoholiXur7KPzNEaASupka5Ro5ECXdHjZAHNbiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k+KwMckF; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k+KwMckF"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40e7065b692so20116285e9.3
        for <linux-hwmon@vger.kernel.org>; Sat, 27 Jan 2024 08:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706371943; x=1706976743; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FNtRbVsJK6HBPMxoSGWLfBIEJJ6efo46s85P0x2rz5I=;
        b=k+KwMckF417HkW17nW2pa+WWCN3dpRO4l3PB++3Md3VZBKSqui02ETdrXH1eD9pH3l
         oSeTV/AiIkfxjNNC+TREiv4G00h6AN/qCN6aqLO0BjaHOTkVxDjORwkH2MwAdUOqqmgb
         03jFA7Sd2rH5DiZ+ciZI5bpUrjX2nx6DDmw3x4CiaXGYzfebOfyW9EKAtHD8FqJOlHHh
         ojZOeR+o3/SaRX56YBY0BP2PUmgWAfVfUqzTJnOsoxFZt2HK9oSsOZ7RpEQSHjfnCjAt
         fRe9dJ6BaCAeLlexCcuKeZCcgJrEYTFtQPI1S4UBMRS8ejPKENnxDjZ0MwjxT/2Yae+i
         A1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706371943; x=1706976743;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FNtRbVsJK6HBPMxoSGWLfBIEJJ6efo46s85P0x2rz5I=;
        b=M2PWY2lZ3UlOUxg4NzpG3GqILTcYQLFilhAum4pBcMaN5in6J+gp9sfwJfu4II8gzX
         BoUDkac7N+WgNTF2lrANSFNUBhuinVLscYhYV5oWKe2lLhOOuTo5bYGbupXbZiG1Df40
         USDHSXGXQeWHceDw83ekRL4rpbB3rCal0lLFcblGmqank0Pv9uhf5erdE3haTjd33yPH
         pHUM0poO0QCrBUt7LEPs6yQMPuyDm0jg/aPS9yH7AlIdTPcRhVd7+JXIKUzurJrARihp
         u46LTrQPOISC6avkcLycQU+zcz1lCZ2ucP1tOZIVC17k+aV7cJRd1MRkOr9HpnEsmzU+
         42HQ==
X-Gm-Message-State: AOJu0Yx63h/P8zJcn8+DZhSwgUxnxUmALNN19UtYQnLHx46zcHCGwdTw
	lfEKnfrhRWcz1RTfW8zAIYLOYA3fI7sClTUgNAgzhjmkZkkdBsKo
X-Google-Smtp-Source: AGHT+IETvx6Ji79jz8QAEeo1zesJzerovp9khdy1XldmI6KUR5GbAJmG41pDHFfjBtqTHlbkRqMKRA==
X-Received: by 2002:a05:600c:35d1:b0:40e:6238:e9e8 with SMTP id r17-20020a05600c35d100b0040e6238e9e8mr1665351wmq.1.1706371943150;
        Sat, 27 Jan 2024 08:12:23 -0800 (PST)
Received: from ?IPV6:2a01:c23:b938:5400:11ba:857c:4df8:38b0? (dynamic-2a01-0c23-b938-5400-11ba-857c-4df8-38b0.c23.pool.telefonica.de. [2a01:c23:b938:5400:11ba:857c:4df8:38b0])
        by smtp.googlemail.com with ESMTPSA id h2-20020a05600016c200b003392c1f40acsm3816171wrf.28.2024.01.27.08.12.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jan 2024 08:12:22 -0800 (PST)
Message-ID: <02ab295e-0b2c-41b4-8376-569744b0ad3a@gmail.com>
Date: Sat, 27 Jan 2024 17:12:22 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: Remove I2C_CLASS_HWMON from drivers w/o detect()
 and address_list
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jean Delvare <jdelvare@suse.com>, Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
 Daniel Matyas <daniel.matyas@analog.com>
Cc: linux-hwmon@vger.kernel.org
References: <75747c6a-d414-4b07-8f66-5a5cdddc3c36@gmail.com>
 <a15701d4-d786-49b1-9ce2-894dff508679@roeck-us.net>
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <a15701d4-d786-49b1-9ce2-894dff508679@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.01.2024 17:01, Guenter Roeck wrote:
> On 1/27/24 07:02, Heiner Kallweit wrote:
>> Class-based I2C probing requires detect() and address_list to be
>> set in the I2C client driver, see checks in i2c_detect().
>> It's misleading to declare I2C_CLASS_HWMON support if this
>> precondition isn't met.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>   drivers/hwmon/adm1177.c       | 1 -
>>   drivers/hwmon/ds1621.c        | 1 -
>>   drivers/hwmon/ds620.c         | 1 -
>>   drivers/hwmon/ina209.c        | 1 -
>>   drivers/hwmon/ina238.c        | 1 -
>>   drivers/hwmon/max127.c        | 1 -
>>   drivers/hwmon/max31760.c      | 1 -
>>   drivers/hwmon/max31790.c      | 1 -
>>   drivers/hwmon/max31827.c      | 1 -
>>   drivers/hwmon/max6621.c       | 1 -
>>   drivers/hwmon/max6697.c       | 1 -
>>   drivers/hwmon/occ/p8_i2c.c    | 1 -
>>   drivers/hwmon/pmbus/ir36021.c | 1 -
>>   drivers/hwmon/powr1220.c      | 1 -
>>   drivers/hwmon/sbrmi.c         | 1 -
>>   drivers/hwmon/sbtsi_temp.c    | 1 -
>>   drivers/hwmon/w83773g.c       | 1 -
> 
> Follow-up question: You did not drop the class from drivers/hwmon/adt7410.c
> and drivers/hwmon/emc2305.c. Is that because of the address_list in those
> drivers ?
> 
Yes. If address_list is set, this shows a certain intention to support
I2C class-based probing. Then the question is whether adding the missing
detect() implementation may be the more appropriate action.

> As far as I can see, both address_list and I2C_CLASS_HWMON are useless
> in those drivers and could be dropped as well. Am I missing something ?
> 
> Thanks,
> Guenter
> 
Heiner

