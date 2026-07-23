Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5D139CD1B
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Jul 2026 23:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784850667; cv=none; b=rGm3wpIrmFxnCVyVlgFcAfjRqM2srLk5Mo0HZSf6t09wgZASRFL6cOsfu1tRBhW0I+jX5NhosvrePPAfHS+Mwgsfh1y/fMlVmYuBellHjj2gOOWcRnbBR5v9KlWHDBK/56wOBKdhY+1dNqSaOCrNnijz9NU9Lr2YQRf9Yi2g4qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784850667; c=relaxed/simple;
	bh=2NpNj1I/8k9Dbk+4itc+Kvs9cBZd3GEUm+iXe7qGG2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cQVXkLNP+3c08MU3kQ/C5hw372kFB9nFYlKznkAWjCCLOMDul8qpLmDNMwblzmMr8sT5c4zpSFE9TUQd0oEhZEare+FVmnXQq0sDTD74fmZm/CxBPoS2gqtwNyNo6OS/m+7Zuu2KV/tQeEyhdsroithuaehqI8cqS9LAnmHKfJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aarM0Ucm; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aarM0Ucm"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3811f512167so1138496a91.3
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Jul 2026 16:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784850666; x=1785455466; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Y9UZb26tOhCUzfbsCf3d/6C2pLTN7nkoQjAUsAbxjI=;
        b=aarM0Ucm8KHk9+R1GYWEDAmp4zPbfCelVlVQNcO0Sqa3PgA5eX4VAZD/SdZ0Q5L3J8
         vkRXiShu2f6UISWqcN+JN26hyR2sO9P6YELoCPdoU3l4sOM7LKLzwHLp5IV/cJS9pVzM
         dDBuMEtQpkVJR3HkWtfr87W/H2TFaTz0lsKeASCTgdYwKYCAlrsfT1sZThp7XUcqZ5mg
         nwub6LTxIdvyEbNavzhHiA8xiy5JSNRQldk2+/noEkmf9kTnFNCTxY8T95DO/cinVpJ3
         12ZmMoH4DNue4ESPzuF/NOKzwWANyaOtWBqEpuWdpA2BnUeylOZPMPLiepBw4c9p7KPu
         IlBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784850666; x=1785455466;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2Y9UZb26tOhCUzfbsCf3d/6C2pLTN7nkoQjAUsAbxjI=;
        b=TFx5yg/WMtf8s/WPY1XWetVlCSRTR2KQfwdBINrqkYZPqZW/8rZyPBgODb6TOtYxIq
         jABhGhMpdRlZuz8yFYUQRGvyMqNKzlL2KrqYYlsN/CQiFBcFfiw9gx64UZdzsuXV6rml
         QCZDdmTsPO1NQ4QCwMpv0SFepLO4IcV8W08mCwiIzNoxTkr2IKGqQb9g6qIbGGt2dI3u
         kOvu6a1LtsUDf7OS6OtDWwbowTUmJgZ2OZxQ9X6myWgXaAovflfkItuYFfSoFfNLukve
         jxSAotzjkzvbtdza/LihmFyNqtyS8NUJV9gDlxFnU/iEc+F4X/DxKJXN5dJQq+Bn0ETn
         ujig==
X-Gm-Message-State: AOJu0YybQ7qC1MyI8KVXiKyGAbB46QnjieRvIcTeusT4k44ZFxj3Lcwt
	gXOeycDXjnTnt+8YBbvlFfQHThaiGQMeo1or5PO1GZ86xUHnmIwc1JEM
X-Gm-Gg: AR+sD12+eTEDL0Lhw+PHSdHuFBvY6qmML6OBvqPpVZuidE2xyJxRzvH/EZ1i76SiUA2
	IaeO05JP8Wd/1E9mfvY+UYG4V62KqyMqysEF4P+uhnQPa3DoKDKlY7Re3PVo9NQ8qWliHaxhc27
	ZN3tB1HKwg5gU3WsPkC566QGr904nxzUjwnNxESYZqDZdA3GIPCFpdu0kVfuFDp12+Nuh/acVHl
	xIfwujdDj/tlDcP0+ASE24Fsf3hOwx7XNCEw4bfJD3DoLgi3yVlVBOEx/ZvIWryka/4aqVIU2yt
	G6Mot1OnhRv8C3eOBIE47jYaeu3H0Xh5J8YQOLw8V6IXjWohYjW1PFc2upi76qcCIPKYE/i9wG5
	wi6wie0fHWH3ybnNJ0DVM2OmF5+dPCnOa3qVNDQOGKYp21uj2s1C/gOtZNfuqL9UXBnmtXQo2ga
	7KDQoh+WirD9DHuyXRCMMjTlbnrxacmZadmwTKt2E9waFXcnR4kF6dfpcPXklbMw==
X-Received: by 2002:a17:90b:314a:b0:38e:712a:bb38 with SMTP id 98e67ed59e1d1-38ec65ed982mr5206469a91.24.1784850666080;
        Thu, 23 Jul 2026 16:51:06 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13002f39sm20123333c88.1.2026.07.23.16.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 16:51:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f691a121-3604-4db1-b3e5-3be27cbfbb2a@roeck-us.net>
Date: Thu, 23 Jul 2026 16:51:03 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hwmon: (pmbus/vt7505) Add driver for Analog
 Devices MAX16545/MAX16550 and Volterra VT7505
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>,
 "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sanman Pradhan <psanman@juniper.net>
References: <20260723164249.199442-1-sanman.pradhan@hpe.com>
 <20260723164249.199442-3-sanman.pradhan@hpe.com>
 <20260723170031.6C04A1F000E9@smtp.kernel.org>
 <20260723213009.220862-1-sanman.pradhan@hpe.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260723213009.220862-1-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/23/26 14:30, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> On Thu, Jul 23, 2026 at 17:00:21 +0000, sashiko-bot@kernel.org wrote:
>>> +static const struct i2c_device_id vt7505_id[] = {
>>> +	{ "max16545", vt7505 },
>>> +	{ "max16550", max16550 },
>>> +	{ "vt7505", vt7505 },
>>> +	{ }
>>> +};
>>
>> [Severity: Low]
>> Could these array entries be updated to use named (designated) initializers?
>> The I2C subsystem guidelines recommend using named initializers for arrays of
>> type struct i2c_device_id to maintain uniformity and prevent field
>> misalignment.
> 
> Thanks for the suggestion. I think the current initialization is valid
> across existing drivers for i2c_device_id.
> 

No, it isn't acceptable anymore. Existing drivers are all in the process
of being converted.

Guenter

