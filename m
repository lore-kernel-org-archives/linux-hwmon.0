Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022711E47CF
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Oct 2024 14:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728570667; cv=none; b=WxWLtL3938GcO7yKJduLGkKKubYbqTXOWICtEa8sKOMEMD75QP5flMHB09EsAQPUd4tAor6s5ii1xjb62R8wmCL0zsxFfBoA6NasPIqfwO4lv8SmIgNVOHkv/2SvoDTJwsM/Q+B4HGRKwH7+Hn3knQQQ4d3PwPFNtKSynq8/c88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728570667; c=relaxed/simple;
	bh=6RZ30993yrcGX3s7lrx2iVkXHjzZtBpKgLA6s+QPAEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s+VABECLF6FTxt0+uHoTGyN9sVf2slZHCQij7XwNNf0S3dQ0IJCdFTqa88Iob7+J/osUl2sMWz8/RrZF+e4qqiBU7nfCnYPl9gpNGKiHAT3Kgy5fKb2alqdU+Il+AahP7cdK58GR5TzXYXPVMUkswv8UAE5ME4vCFicbL7m70DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UK1zk5I8; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UK1zk5I8"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71e01eff831so753896b3a.2
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Oct 2024 07:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728570665; x=1729175465; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=lbcwhTjq0zUkEZP71WqzBxBc8co+U7kKAIOL1jiCzYQ=;
        b=UK1zk5I8VX7xyySFyVA4RWUViKH3Wqnpd6HaMHSHS+/ieGGv4Xg7z6tBUCDsM4yeZ7
         FYkImBfNXxLRp31GEvE0IvEYCs3XThmvZsOenwUFkMwMHMyin0qapfPrAasmgARbDAt3
         yozZhXUyTmqNNxlnwC1X60wRK2sfbp0U1lcoJ52v00PyKnERj/VBsxCEGa7+zz4jOpGJ
         UdKWsMW/ZbaTxHUlBHN02MPdV4sZYe6HGsgmfzdI5X0ItsAD1Fxsn4WYZ0rMuxsEqbdu
         X4DCe7okLPxqrhHxdCg8KCq5EFpkq9xFvcyl4paHx46SHm5+OhoCc2Bc7FJiYfj8As+R
         gSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728570665; x=1729175465;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lbcwhTjq0zUkEZP71WqzBxBc8co+U7kKAIOL1jiCzYQ=;
        b=oIBTXEjZJyG1mM9ndwmZiTmG7Ef0XAXK2FRUFEoncW/Zn1VPgcgbMk6Y1t+jWvmPp9
         yWjSjMNRq7e84Oyo1DlsnUC6B+faaowe0ujQkt9QFynlCSB1EyIBEWyYSDrxYZB3rzjW
         azF4HLkpcDK/x9IvkBcmSjAAlItTYXycSQojrbzvuillbefWv6una3eBForn6ZlbaYjj
         p7W13MB/RWYD+QBOL/97SOhKj4zsjmBOjR5aWuE94raTLH6knHW0Ah0LHAKj28L/j6lx
         YXV0W7t7BJwXpVkFi/6ulRAUtbLaqgIOozsQC02iP486Tyuo0aZzHYU6V4X1wZs6FC7o
         TX+A==
X-Forwarded-Encrypted: i=1; AJvYcCWJppBZRvPgB/syoiBVweVfxw+gqMoGTZOAgEG02US683mGqMlvXBG03OunvHuvWbtcdJMTO5cVHg4qcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDSWkG/3jmZQwxDqSf0yW5DfO+EQK3dXyde+FgsqJoi/3WfIb8
	7uFDvs2TrewS9+p058zZypqyIwikkpJY4ILFYqwKjH68WGPTn8XY
X-Google-Smtp-Source: AGHT+IEUDWQeCFcoFctIdqqQr+8vLe+JYwcoE1t6w2nGkYpNES0SFKodVnGTR8wLn4GNxJehjdoHWA==
X-Received: by 2002:a05:6a00:2190:b0:71d:fe64:e3fa with SMTP id d2e1a72fcca58-71e1dbb7f78mr10810494b3a.19.1728570665114;
        Thu, 10 Oct 2024 07:31:05 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e2ab109e4sm1081811b3a.206.2024.10.10.07.31.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 07:31:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <fd460fb6-0193-4be2-a820-1b0d713452d5@roeck-us.net>
Date: Thu, 10 Oct 2024 07:31:02 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] hwmon: Add and use helper hwmon_visible_0444
To: Heiner Kallweit <hkallweit1@gmail.com>, Tim Harvey
 <tharvey@gateworks.com>, Jean Delvare <jdelvare@suse.com>,
 Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
 Jonas Malaco <jonas@protocubo.io>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, Florian Fainelli <florian.fainelli@broadcom.com>,
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
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <fa07443e-4ca7-4bd3-b027-c16a1a60edc4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/9/24 22:44, Heiner Kallweit wrote:
> On 10.10.2024 00:19, Guenter Roeck wrote:
>> On 10/9/24 13:02, Heiner Kallweit wrote:
>>> Several drivers simply return 0444 in their is_visible callback.
>>> Add a helper in hwmon core for this use case to avoid code duplication.
>>>
>>> There are more drivers outside drivers/hwmon which would benefit
>>> from this helper as well.
>>>
>>> Heiner Kallweit (9):
>>>     hwmon: Add helper hwmon_visible_0444
>>>     hwmon: i5500_temp: Use new helper hwmon_visible_0444
>>>     hwmon: surface_fan: Use new helper hwmon_visible_0444
>>>     hwmon: sl28cpld: Use new helper hwmon_visible_0444
>>>     hwmon: gsc: Use new helper hwmon_visible_0444
>>>     hwmon: powerz: Use new helper hwmon_visible_0444
>>>     hwmon: raspberrypi: Use new helper hwmon_visible_0444
>>>     hwmon: intel-m10-bmc: Use new helper hwmon_visible_0444
>>>     hwmon: nzxt-kraken2: Use new helper hwmon_visible_0444
>>>
>>>    drivers/hwmon/gsc-hwmon.c           |  9 +--------
>>>    drivers/hwmon/hwmon.c               |  7 +++++++
>>>    drivers/hwmon/i5500_temp.c          |  8 +-------
>>>    drivers/hwmon/intel-m10-bmc-hwmon.c |  9 +--------
>>>    drivers/hwmon/nzxt-kraken2.c        |  9 +--------
>>>    drivers/hwmon/powerz.c              |  8 +-------
>>>    drivers/hwmon/raspberrypi-hwmon.c   |  8 +-------
>>>    drivers/hwmon/sl28cpld-hwmon.c      |  9 +--------
>>>    drivers/hwmon/surface_fan.c         | 10 +---------
>>>    include/linux/hwmon.h               |  2 ++
>>>    10 files changed, 17 insertions(+), 62 deletions(-)
>>>
>>
>> I really don't want to add such hwmon-specific but at the same time
>> generic helpers. If such a helper is made available in the core kernel,
>> I'll be happy to accept patches using it, but otherwise please refrain
>> from submitting such patch series.
>>
> What would you consider a suited place, drivers/base or fs/sysfs or lib or .. ?
> For enum hwmon_sensor_types we have to include linux/hwmon.h. None of these
> places has any hwmon code, and I would expect concerns if generic core code
> includes subsystem headers.
> 

"There are more drivers outside drivers/hwmon which would benefit
from this helper as well" very clearly suggests that the function
is not hwmon specific. Yet, obviously it is if it requires a hwmon
include file.

If this is hwmon specific, I'll want to see a different solution.
Instead of calling an exported function, hwmon drivers should set the
is_visible callback to a defined value, such as HWMON_VISIBLE_0444.
This could be an ERR_PTR() which is converted by the hwmon core.
This lets us add, for example, HWMON_VISIBLE_0644, and it avoids the
notion that the function could be called by non-hwmon drivers
(and the notion that it is a function in the first place). Instead
of calling the callback directly, the hwmon core would then have a
helper function which evaluates the pointer and either returns
a constant or calls the callback.

Guenter

