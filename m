Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED5C182B7;
	Sun,  7 Sep 2025 23:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757287937; cv=none; b=ARDoYbi3IeGad36kvtWzIR3HlPGwWekNJ+3vvd7QQJnOGR/ny2AWcC8a+2mbWT95gyfLiI4yOl2tVWlMD1KpNjXAq3hb841o4WdaOluCHAyditMzcwW9DHGC9CabXpjsFy9IAgt9QA+UcEoj3CbHALyp5UAo4MnyAqIm7N81ZN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757287937; c=relaxed/simple;
	bh=NIqUnB0qn/wA9AT/gE6qImqJhcFRcDqatIbSf0iLHu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ACUtOkA55aJxqw66pD6wqSJP2cTR/u5gGWbXmo2QmtFikCWzEwtp3y1VJygpz7kcCT7AU/yYTfv7IjeRSd8xUzalIz6ANExPUZp4sknYJWUVEfmvQYANi2PP5SdY68nLHqEUmXjFOkm4X4K/Z9mU1a/uf7uWpSKucMghkSvlJ34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5x08s3Z; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5x08s3Z"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b4f8bf49aeaso3412084a12.1;
        Sun, 07 Sep 2025 16:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757287934; x=1757892734; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=kULCfrFpUlXDLI6dVdic5Q9/aaLDo8BHSAjDzVuLn88=;
        b=i5x08s3ZBQnlg2UlhDyrWnZllsllHeeZnOQWWb6xm8P1cbDwsVhelb//5nHNZ+ZL1y
         rcGSlFgvyMNUIebv+bX+HLuaHpvrruSSoIHjvw//SQhlWxK4xqeL5hVB3QxsTcfB240g
         YIR0IShH3eWh9u9oBriUketuD7uveWmnfPFRV6A1k5GAaD5GITIxYGSQ4dcTi3Y69bWd
         8c8vyZWuELt6vf8MenZ33L3+1d9pLJfrfyKwmaOrCofJXYOaXt19oWZWs2JKpIOm7ZHH
         gon+Aj3WaJ2euhcN7ehDwPSJ2/SDoGnQ5y/YBnzSpUIoJNyhGNpPJxgg1i5Tctk5Zd3p
         J18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757287934; x=1757892734;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kULCfrFpUlXDLI6dVdic5Q9/aaLDo8BHSAjDzVuLn88=;
        b=NW+NEvHE7FUfPojr2GBEPEKMwKn/+Vfdu60ZMDWhfjOX4aKuQJfzCn88OgnilFa14Y
         7Du9xSWx4lvzDJ+bMVX8TkTHCVcWfLjJepQpwhHycXr6cS2jYaLtVRruaKbtyFimCoAI
         Yotn8eeUc8FgUy0NBG2ZNGfgN2ypUEqS/ncLPTbeIQVa7/bdqtIYvboeuw0MjxdJxStk
         xIq1DizLobLRUeZAKZnIrkFMXTVy2XQgO1bHHdAov8QuHrDf6ld9sLz19giS+boxIb9c
         ASTREdzOj966bwx3IqHJLNfK+yEUKDBtBzfY/QA0zATp3KBhY/O0EdZTcMBAriiIX8uj
         i0YQ==
X-Forwarded-Encrypted: i=1; AJvYcCVV6ktlcTSU1T2qd7RuvIUa1U6tOEwg3fisLwMObIi8OkwP2wEU7ZKcwJfND2tw74VPJ8MWsUt9n+W+@vger.kernel.org, AJvYcCWExHdPXQj6qCR5a9sjPdjhD3WawsPqH6gy4j9rCOKPwyVEF2VuKuD0+D+tNKN1vNcoI6hhMm8kC/JyoUE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHFEYlctDLc04nl8h1E2FzCmwgLw1Z81zCo+EVkEh88ywF+7vU
	UpNIxcNgeNyypbhdVs40izBA51x7J1GiF2YrZvPMX2PCKyP9b5zPGF1k
X-Gm-Gg: ASbGnctv20uEf7LRMBJCNzCgRn5MO/4Wv55JG/3eB/eebav2X4kIjtGcBdyrf9MPwdz
	6RDzrUrpok+1aOI+pjZtuf8qVK5n2qtds2egPhyPdhV2g0Su/iXfgcOP0jWfd6Ebm4MtYfyUDqS
	GEsFu2aNWWc+ghJXVEyyGl/emoMbSM7qg+A0xOH4R0n5sFeB/+9G07c/ZbSphQS0+5e2ToWPceb
	vspvD/QvdBN9f6aKr5qW3k/+/C7kAQaGFDWTb0t4hyGUEDubUJJPZy3ThuXu4Gc8+kanodcissd
	dvIjQCiLXuOVfWxK5f8/AlVMvD4Nyj6HZNcEL9vzDIXt0KXFAg0a1kujmqoXyCAyPiNY/k0vgJg
	mj2+5LzQAnreofc1Jq+1RYDxVqk3ThJdivTvbnOsfoD7W81zvrH4uSQ/ZtHWwp7xIC5jCGm2PBc
	lIhJGVCA==
X-Google-Smtp-Source: AGHT+IFPbDEHTRD4G57c7xjubCoXFTpqJ7HrqNLS6rkdbX2D29kgWX6eGvSEJkRIx4DgF7JbiPtWDw==
X-Received: by 2002:a17:902:f641:b0:240:a889:554d with SMTP id d9443c01a7336-251731155a7mr76095915ad.45.1757287934141;
        Sun, 07 Sep 2025 16:32:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25549ac1e1dsm18350615ad.24.2025.09.07.16.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Sep 2025 16:32:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2edbf532-f567-4807-b7e0-0063d8af0c33@roeck-us.net>
Date: Sun, 7 Sep 2025 16:32:12 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/17] hwmon: (ina238) Various improvements and added chip
 support
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Cc: Christian Kahr <christian.kahr@sie.at>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20250905204159.2618403-1-linux@roeck-us.net>
 <62ad677d-ecca-4819-904a-7052675300cb@alliedtelesis.co.nz>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <62ad677d-ecca-4819-904a-7052675300cb@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Chris,

On 9/7/25 16:00, Chris Packham wrote:
> Hi Guenter,
> 
> On 06/09/2025 08:41, Guenter Roeck wrote:
>> Add support for INA700 and INA780 to the ina238 driver.
>>
>> To prepare for this, implement various improvements.
>>
>> - Update documention and Kconfig entry to list all supported chips.
>>
>> - Drop platform data support. The driver supports device properties,
>>     and there are no in-tree platform data users.
>>
>> - Stop checking the attribute value when writing the power_max attribute
>>     as unnecessary.
>>
>> - Simplify temperature calculations. Instead of shift and lsb, only
>>     require the resulution and use it to calculate temperatures.
>>
>> - Pre-calculate voltage, current, power and energy LSB. The values don't
>>     change during runtime and can therefore be pre-calculated. Also use the
>>     equations provided in the dataasheets to calculate power and energy
>>     LSB from the current LSB instead of calculating it from scratch.
>>
>> - Use ROUND_CLOSEST operations instead of divide operations to reduce
>>     rounding errors.
>>
>> - Improve current dynamic range by matching shunt voltage and current
>>     register values. With that, the dynamic range is always the full 16 bit
>>     provided by the ADC.
>>
>> - Stop using the shunt voltage register. With shunt and current register
>>     values now always matching, it is unnecessary to read both.
>>
>> - Provide current limits from shunt voltage limit registers. After all,
>>     there is no difference for the ADC, so the shunt voltage limits translate
>>     into current limits.
>>
>> - Order chip information alphabetically. No functional change, it just
>>     simplifies adding support for new chips.
>>
>> - Add 64-bit energy attribute support to the hwmon core.
>>
>> - Use the hwmon core to report 64-bit energy values.
>>
>> - Add support for active-high alert polarity
>>
>> - Limit shunt and calibration register writes to chips requiring/supporting
>>     it.
>>
>> - Add support for INA700 and INA780. Both chips have internal shunt
>>     resistors and do not explicitly report the shunt voltage.
>>
>> This patch series was inspired by Chris Packham's initial patch set of a
>> new INA780 driver, by his subsequent patch set adding support for that chip
>> to the ina238 driver, and by Christian Kahr's submission of a new INA700
>> driver.
>>
>> The series was tested with INA228, INA237, INA238, and INA780 evaluation
>> boards as well as with unit test code.
>>
>> ----------------------------------------------------------------
>> Guenter Roeck (17):
>>         hwmon: (ina238) Drop platform data support
>>         hwmon: (ina238) Update documentation and Kconfig entry
>>         hwmon: (ina238) Drop pointless power attribute check on attribute writes
>>         hwmon: (ina238) Rework and simplify temperature calculations
>>         hwmon: (ina238) Pre-calculate current, power, and energy LSB
>>         hwmon: (ina238) Simplify voltage register accesses
>>         hwmon: (ina238) Improve current dynamic range
>>         hwmon: (ina238) Stop using the shunt voltage register
>>         hwmon: (ina238) Add support for current limits
>>         hwmon: (ina238) Order chip information alphabetically
>>         hwmon: Introduce 64-bit energy attribute support
>>         hwmon: (ina238) Use the energy64 attribute type to report the energy
>>         hwmon: (ina238) Support active-high alert polarity
>>         hwmon: (ina238) Only configure calibration and shunt registers if needed
>>         hwmon: (ina238) Add support for INA780
>>         dt-bindings: hwmon: ti,ina2xx: Add INA700
>>         hwmon: (ina238) Add support for INA700
>>
>>    .../devicetree/bindings/hwmon/ti,ina2xx.yaml       |   4 +
>>    Documentation/hwmon/hwmon-kernel-api.rst           |   3 +
>>    Documentation/hwmon/ina238.rst                     |  64 ++-
>>    drivers/hwmon/Kconfig                              |   9 +-
>>    drivers/hwmon/hwmon.c                              |  16 +-
>>    drivers/hwmon/ina238.c                             | 583 +++++++++++----------
>>    include/linux/hwmon.h                              |   1 +
>>    include/trace/events/hwmon.h                       |  10 +-
>>    8 files changed, 382 insertions(+), 308 deletions(-)
> 
> For the series
> 
> Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz> # INA780

Thanks a lot, appreciate it!

Guenter

