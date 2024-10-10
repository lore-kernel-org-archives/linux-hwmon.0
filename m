Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F96D1BD509
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Oct 2024 15:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728573273; cv=none; b=p+Cn6Ia08bFGesdzF/m77BLIjC+v7y3k5W5GH+etE/JrD24TrbgI4YdKxw45FPx2lYS4zCgPcI2cq4Kpmmn2A0OKNpio17tHha5Se3LhpICOpdXp+YEnuFrO4eCPuVHLgXe/6uhMRkqwZBpIaPgfXcJePJ0xmDE7USp8M7pJRh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728573273; c=relaxed/simple;
	bh=kWEZjQf/TGrVXKG7VJeYWpmc7XFp+O+hP2E3wGAb7ow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I8LFgOl6a0ivZ3ulRhmTwTk9yHTK07/EPOnsDnOL7ncpjACcuaokjbUXoubVvxiqYrkZRGxKhDLsYApZohM3f1wGFJZH0q9dvec+7ymFMzo4i69fdfuL/ijfmvRaDt0kcU2YvZJblP80M04AVMOW9mY3W7fntskcGUvhvYLTqps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RW9mzsyB; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RW9mzsyB"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a9982159d98so167566966b.1
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Oct 2024 08:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728573270; x=1729178070; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xsDOOHnrvnPmEw4+tvRO9I3UEkiSIAIXntOFOHhTarY=;
        b=RW9mzsyBoYA8yN5vMJ1frePVTsVYC4PmdZr91G/s+5iUky/wbu13OedsqaSB8dki3b
         2TlCotcRmE+XzTZQBOwdDKww6Ioy1Eabd3R8S2V+ffD84F0MZHUPaTjWQc0KS86zq6rB
         wce+q1urvTTlq8JArT1LBaPNiP90Jtuup+RzG++smD9gl4RYwSSL1tFr1m/qRtP1vtIM
         r6Ghjc1rQTrXaaM9zI7xioNRam3kb+hTr1d3NarvMnE6I5y+dsUTePjfSTukqooJlD8h
         5TMEI9XZRna2YVo64RUw2hK9DKHakN9bFKUmUJrr1VJV0ZsSOsL0K27i+YEQwtIXhnII
         zjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728573270; x=1729178070;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsDOOHnrvnPmEw4+tvRO9I3UEkiSIAIXntOFOHhTarY=;
        b=Yav8iT8rtMQq+kyxeEpN40mpzt00K/Z4o0nKCdSGGFXIcD+0Kg2/OEXZFcf/VCOB6H
         Kd8HByOzq7BuS16AqgM6D+fMXq+AGQWvBFRMrNWOpoYJBJqNR24xXjmDRTGOve4IllD2
         hGt+YzqHIHViXBoPG0yRF28f4XBt46dAYe8NRM7bwsb/cKZlAZZGV6PHQs1pQV0+ePrz
         5Tow6HCGNpwijs8t6CLRmTB8DkvwQkQJhwWEhJNmmbGepusxx/EGVE9yBuz4gzyVbhJw
         nuq7OaSleUepG9/n5FKgWQbqvLOtOLz1zH5l9UPJ9lattFQXNOA8kLWFmVPBxMfS2mD9
         7uQg==
X-Forwarded-Encrypted: i=1; AJvYcCULNOsSLLB0OBPVIekXcwOmyogItneAuI2b8+UPRs+We8+4MC/LH02RraiU2RNnoWruRRNRrGp2BQZudg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+ghGInsZmgAQdv0L0/z3Y1oN6uziB4vR36FXOu6pcpa/XyQOT
	HgfGvqdAUJ67+eFiVoRpC0wQ9jIwWlqKPnIEi9rauLlh+UQ1B8w9
X-Google-Smtp-Source: AGHT+IEnKxIrxAqO2yMslPQVUsLZu3CEkdqhcXEM8psyFKKxqQu8lQa8q2OwwTsXhO/wcBSH9bwImw==
X-Received: by 2002:a17:907:e267:b0:a7a:a892:8e05 with SMTP id a640c23a62f3a-a998d207690mr632663066b.33.1728573269978;
        Thu, 10 Oct 2024 08:14:29 -0700 (PDT)
Received: from ?IPV6:2a02:3100:ac3e:8500:f101:eb49:ef42:3d5f? (dynamic-2a02-3100-ac3e-8500-f101-eb49-ef42-3d5f.310.pool.telefonica.de. [2a02:3100:ac3e:8500:f101:eb49:ef42:3d5f])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a99a80efb5bsm100519566b.192.2024.10.10.08.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 08:14:29 -0700 (PDT)
Message-ID: <85184790-532b-46c2-9b67-2eb8d74a53f2@gmail.com>
Date: Thu, 10 Oct 2024 17:14:29 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] hwmon: Add and use helper hwmon_visible_0444
To: Guenter Roeck <linux@roeck-us.net>, Tim Harvey <tharvey@gateworks.com>,
 Jean Delvare <jdelvare@suse.com>, Xu Yilun <yilun.xu@intel.com>,
 Tom Rix <trix@redhat.com>, Jonas Malaco <jonas@protocubo.io>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Michael Walle <mwalle@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>,
 Ivor Wanders <ivor@iwanders.net>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 linux-rpi-kernel@lists.infradead.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <3aecbfc5-e11b-4425-9c6b-88dac2d32945@gmail.com>
 <5ae4e8b9-1442-4764-9a16-db08d099a1e6@roeck-us.net>
 <fa07443e-4ca7-4bd3-b027-c16a1a60edc4@gmail.com>
 <fd460fb6-0193-4be2-a820-1b0d713452d5@roeck-us.net>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <fd460fb6-0193-4be2-a820-1b0d713452d5@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.10.2024 16:31, Guenter Roeck wrote:
> On 10/9/24 22:44, Heiner Kallweit wrote:
>> On 10.10.2024 00:19, Guenter Roeck wrote:
>>> On 10/9/24 13:02, Heiner Kallweit wrote:
>>>> Several drivers simply return 0444 in their is_visible callback.
>>>> Add a helper in hwmon core for this use case to avoid code duplication.
>>>>
>>>> There are more drivers outside drivers/hwmon which would benefit
>>>> from this helper as well.
>>>>
>>>> Heiner Kallweit (9):
>>>>     hwmon: Add helper hwmon_visible_0444
>>>>     hwmon: i5500_temp: Use new helper hwmon_visible_0444
>>>>     hwmon: surface_fan: Use new helper hwmon_visible_0444
>>>>     hwmon: sl28cpld: Use new helper hwmon_visible_0444
>>>>     hwmon: gsc: Use new helper hwmon_visible_0444
>>>>     hwmon: powerz: Use new helper hwmon_visible_0444
>>>>     hwmon: raspberrypi: Use new helper hwmon_visible_0444
>>>>     hwmon: intel-m10-bmc: Use new helper hwmon_visible_0444
>>>>     hwmon: nzxt-kraken2: Use new helper hwmon_visible_0444
>>>>
>>>>    drivers/hwmon/gsc-hwmon.c           |  9 +--------
>>>>    drivers/hwmon/hwmon.c               |  7 +++++++
>>>>    drivers/hwmon/i5500_temp.c          |  8 +-------
>>>>    drivers/hwmon/intel-m10-bmc-hwmon.c |  9 +--------
>>>>    drivers/hwmon/nzxt-kraken2.c        |  9 +--------
>>>>    drivers/hwmon/powerz.c              |  8 +-------
>>>>    drivers/hwmon/raspberrypi-hwmon.c   |  8 +-------
>>>>    drivers/hwmon/sl28cpld-hwmon.c      |  9 +--------
>>>>    drivers/hwmon/surface_fan.c         | 10 +---------
>>>>    include/linux/hwmon.h               |  2 ++
>>>>    10 files changed, 17 insertions(+), 62 deletions(-)
>>>>
>>>
>>> I really don't want to add such hwmon-specific but at the same time
>>> generic helpers. If such a helper is made available in the core kernel,
>>> I'll be happy to accept patches using it, but otherwise please refrain
>>> from submitting such patch series.
>>>
>> What would you consider a suited place, drivers/base or fs/sysfs or lib or .. ?
>> For enum hwmon_sensor_types we have to include linux/hwmon.h. None of these
>> places has any hwmon code, and I would expect concerns if generic core code
>> includes subsystem headers.
>>
> 
> "There are more drivers outside drivers/hwmon which would benefit
> from this helper as well" very clearly suggests that the function
> is not hwmon specific. Yet, obviously it is if it requires a hwmon
> include file.
> 
What I was referring to is device drivers in other subsystems which
expose e.g. thermal sensor data via hwmon API.

> If this is hwmon specific, I'll want to see a different solution.
> Instead of calling an exported function, hwmon drivers should set the
> is_visible callback to a defined value, such as HWMON_VISIBLE_0444.
> This could be an ERR_PTR() which is converted by the hwmon core.
> This lets us add, for example, HWMON_VISIBLE_0644, and it avoids the
> notion that the function could be called by non-hwmon drivers
> (and the notion that it is a function in the first place). Instead
> of calling the callback directly, the hwmon core would then have a
> helper function which evaluates the pointer and either returns
> a constant or calls the callback.
> 
What goes in the same direction, but may be better/cleaner:
We could add an umode_t parameter to struct hwmon_ops, and if it's
non-zero then hwmon core interprets it as static visibility instead
of calling is_visible().

> Guenter
> 
Heiner
