Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6EA2EC09F
	for <linux-hwmon@vger.kernel.org>; Fri, 24 Jul 2026 13:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784898940; cv=none; b=CpvjiBFPkwhzr7wlltzBgJZ4st8C3k40BJkEf6yDVB7rCY5OpgqhbFLjY/NDym1f1Xx5CeeQ6ebvRs63HiufYtxkiw+6fXSaRsWPqlRLPihBB/l2IMWG9i9d8xS5jdn0fdqpKuCAcpcSYllOEfEPkZlou4mU9dadkeiJEjEIVsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784898940; c=relaxed/simple;
	bh=zN02l9wsONJF0xp56emJt602spK7CI9T5fHICpGtv9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ecGeoZDyh9pMLZXod94bUGiOSG7IJMzU1THtmY7VNqyDXhNCkUv9va5y/ZyTzWUcNdPfklpaGsTAHn79cT6J1PvS4CHgGbK5en/bKlM52QUNjomp5Z3aQrVAB5F9Fjhx/NoWd79jeHeAL23XIfrlh///dPFiyfP/Blobd1hukUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mq9OapMK; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mq9OapMK"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso303265a91.1
        for <linux-hwmon@vger.kernel.org>; Fri, 24 Jul 2026 06:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784898938; x=1785503738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lw2GFuJUfu9OTUa+lzPk++Vy8wm0NltxAfjufIsFhwQ=;
        b=mq9OapMKP1eSM5INulqiNC8x4uS9Eft8L0EM3TpMsI3MT0pNFp1m0hLqeF0KsORlJE
         dsV79m0xyBkFgz8PtDLByNZw5cuCsL8Bj+WUpcg8gPQE1QIxu4eOQGn2mPIItxQpBXZ9
         aN+MmH2rXb0rBujkJmn4dgU/+R90hguTTa9SQwKs73LX6yGg9Bj/ZS6qJfJdzVdiE+n6
         nlhEvFLoDcekoN4j7h8iBqQRG+I4Ekdxrna/3LB+oyklW/xD48Vasvk0oLTTFTkTwWum
         LEHtrk2y3D1d8Y/4PeFaqEERSBfiEAKKtjCNUyHLpHhW1T/waAz2JiRRebWJpmseZ+cI
         gi7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784898938; x=1785503738;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Lw2GFuJUfu9OTUa+lzPk++Vy8wm0NltxAfjufIsFhwQ=;
        b=okc5dpilJEcnFR0Zq4uX1AMJ0iR3vtnLOaC4fsFDwrvEVjW5JodTlkBfQGY3+Qjwws
         5FSl/tbMcBIZX293iecX+GjZNLJ/eNL9M/3aewqdGGBXa0yn1ZiU8wb/Joxybo5VtFSv
         LqzyCIXB0gZk+sxPb8FKfcxEHGQ8/juTA1q620CosozfciK/6XYAgalHKtPcbUay4eU0
         vbXhgNuXNqHXoToiiBPpozkTnjxZLwLEnMIHTeqH8f7Budxuv1VEh1xLgijsWXG42Wkx
         OFm+ffXiooNIACOLYILR5Do/14n86PuHqg0/muQAurJyweej8Q4+A4SSob4hRI9c+fG2
         F7pA==
X-Gm-Message-State: AOJu0YyiROwFw4GWjFJaW+7khEE37dagonRiQwY/Wccy10QIT9QHko12
	tSSjBWohRhhWjl7P9Q6BtDbot/EUWrn5Bm6+atCDOwpGRKCXlaXAxS51
X-Gm-Gg: AR+sD10eWnPiKg4v0ng13n/INjct7OHzRwC14vNM7Z9QMMs+1qWPJhUubuTBKIfx42/
	rUq6AtUkKJQyVRt7EiXPmWBXfKrUgDxzNSjuBPAVzZr1WNS0dOHE/FP1/PCd0CCoRxHAIz9le6n
	dy8B5mVrhg1c4e7mTS7mCwnPtRCn+vw5DfEdbWzPjW8AT62Udq/j3Ky4NY852ODFfDWgBVhUtwT
	Ltv6FqoBG9kkkLBVYet/nMhRcpi+2eb3ZCt1Y6Cm3KBr20xaG5JWmnPF0OSYFZCXvgIA/ZxclBZ
	QnMtCz4Oe2zcQop392ZDFfA3RiLxRScgP03vqFgLF01AUGcq9Jzi92G4yCeGIqV8TZ29JGHRGMM
	9pbcbJOCkdzQzALTWNzwZVvJbwQD+85xTIzBBVkMi8VMBvAcPcEo7msohWYVZXeIZ4EpfsUcXdG
	JCkxp0JcxY6RrFa1DKC71GFBG2Z8d2JgPhmt3o9mzOwGVbtx0cF797soHrYa/bFA==
X-Received: by 2002:a17:90b:1dc5:b0:36b:77b9:5c8c with SMTP id 98e67ed59e1d1-38ec651c6d2mr7652113a91.17.1784898937701;
        Fri, 24 Jul 2026 06:15:37 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm42746637c88.15.2026.07.24.06.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 06:15:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <668b28b1-875f-4fdd-b367-b09edef95367@roeck-us.net>
Date: Fri, 24 Jul 2026 06:15:35 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hwmon: (pmbus/vt7505) Add driver for Analog
 Devices MAX16545/MAX16550 and Volterra VT7505
To: Krzysztof Kozlowski <krzk@kernel.org>,
 "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sanman Pradhan <psanman@juniper.net>, Georgi Vlaev <gvlaev@juniper.net>,
 Dhruva Devineni <ddevineni@juniper.net>, Debjit Ghosh <dghosh@juniper.net>,
 Jawahar Balaji Thirumalaisamy <jawaharb@juniper.net>,
 Avadhut Naik <avadhutn@juniper.net>,
 Santhanakrishnan Balraj <sbalraj@juniper.net>, Brian Mak <makb@juniper.net>
References: <20260723164249.199442-1-sanman.pradhan@hpe.com>
 <20260723164249.199442-3-sanman.pradhan@hpe.com>
 <20260724-skink-of-unmistakable-novelty-d97d95@quoll>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260724-skink-of-unmistakable-novelty-d97d95@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/24/26 02:03, Krzysztof Kozlowski wrote:
> On Thu, Jul 23, 2026 at 04:43:59PM +0000, Pradhan, Sanman wrote:
>> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
>> index 080d366809f3..daa4b49bc90f 100644
>> --- a/drivers/hwmon/pmbus/Makefile
>> +++ b/drivers/hwmon/pmbus/Makefile
>> @@ -75,6 +75,7 @@ obj-$(CONFIG_SENSORS_TPS53679)	+= tps53679.o
>>   obj-$(CONFIG_SENSORS_TPS546D24)	+= tps546d24.o
>>   obj-$(CONFIG_SENSORS_UCD9000)	+= ucd9000.o
>>   obj-$(CONFIG_SENSORS_UCD9200)	+= ucd9200.o
>> +obj-$(CONFIG_SENSORS_VT7505)	+= vt7505.o
>>   obj-$(CONFIG_SENSORS_XDP710)	+= xdp710.o
>>   obj-$(CONFIG_SENSORS_XDP720)	+= xdp720.o
>>   obj-$(CONFIG_SENSORS_XDPE122)	+= xdpe12284.o
>> diff --git a/drivers/hwmon/pmbus/vt7505.c b/drivers/hwmon/pmbus/vt7505.c
>> new file mode 100644
>> index 000000000000..a96abf75b1aa
>> --- /dev/null
>> +++ b/drivers/hwmon/pmbus/vt7505.c
>> @@ -0,0 +1,274 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Hardware monitoring driver for Analog Devices MAX16545/MAX16550 and
>> + * Volterra VT7505 PMBus controllers.
>> + *
>> + * SPDX-FileCopyrightText: Copyright Hewlett Packard Enterprise Development LP
> 
> Tag is accepted but discouraged. Use standard copyright header.
> 
> ...
> 
> 
>> +#define VT7505_MFR_PEAK_VIN		0xd1
>> +#define VT7505_MFR_PEAK_IOUT		0xd2
>> +#define VT7505_MFR_PEAK_PIN		0xd3
>> +#define VT7505_MFR_PEAK_TEMP		0xd4
>> +#define VT7505_MFR_CLEAR_PEAKS		0xd5
>> +#define VT7505_MFR_PEAK_VOUT		0xfd
>> +
>> +#define VT7505_RLOAD_DEFAULT		4750
>> +
>> +enum chips { max16550, vt7505 };
> 
> You must adjust to upstream kernel style and such constants/defines are

No, you must not.

> UPPER CASE (I know there are antipatterns in existing drivers, though).
> 

Not in the hardware monitoring subsystem, where the chips enumeration is
and always has been traditionally lower case.

Guenter

