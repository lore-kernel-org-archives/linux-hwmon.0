Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2716339AFC
	for <linux-hwmon@vger.kernel.org>; Tue,  9 Jan 2024 15:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WZqIkWSp"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40d8902da73so29131455e9.2
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Jan 2024 07:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704813452; x=1705418252; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q+t2MvDTifDUi046AjiTt/a3s6JOV3dbN3004LwRA8c=;
        b=WZqIkWSpQtw2fQoXD7iCA0qkfWlrsH9OoVzLk3PQCxh9rorYyYxlDC1o0/vGD8pDQj
         QtzrNo0J1Bz4+Lvv/Klq70fGzoJnmNEnssguGW/L71rZzkvlJTmduP+ec3x0i6wetrz0
         QvSN0EPTZuWn5Td6rIg2iD8Nmhgrw84KpaqIAV3y/bsnv3vGeBJZQ9IrfZ2NJ7J6g/wy
         GfenAXgXkWxt5KYjuquLITNntwVN0JALbJvowwig+Sz5dNCwBEpRA5L0I31L0bty5Twe
         /e9jvc8U2wmpyDC96cPO2LamiHMlS0TRfqRaEXszC8kSdTKdtx+16FT8Zz4sOPUFQOMs
         rnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704813452; x=1705418252;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+t2MvDTifDUi046AjiTt/a3s6JOV3dbN3004LwRA8c=;
        b=uUFPO7ZbzzweFi2SAlNl6dUsNBw9H3wrjs9Kb6pPokL0/vbLhtMhAxnBiM9fG2GB8i
         sIShk2YT7wAGvsaGl4aNqqIUiVYyLoguerRn5DaLRULFcLHzRAvUE/AX67Z9bjfnSw8d
         uqrfczcXb4+FRzNAnMvvo0Ci/XTKMfADP/zQ7ACHCIg01PNUiEcHv42eHtxkSO5kQrQw
         bhehmmkV8/FsE+9cMMgaZ8nmSFcXJbkccALyLCnhXSQVbJtNVquZ3QvGl91c8RSO9fa3
         HqTHJWkyvwBRp+Y5LBGTHfEDKQY/Zo2UkNGOuTpRMVq2vmGIjvXgOlig3CK/Pk/3sdcs
         4f3w==
X-Gm-Message-State: AOJu0Yw7dUaR5T6OQcCoKfqk/hf66S7N1yJZUQ6d+0Th0UtK5i4vWxzD
	xAcDC8B9+kGrQYY1pI0Ji9ubYwZJPn01jk8G79SbqH3w9TE=
X-Google-Smtp-Source: AGHT+IGf1g6r6RaoAkMuA3L3zOCJfcDNTT0RrTZbyuKfaEXIFqaTEcsV1rItOBV02ReIYQYFNCviMg==
X-Received: by 2002:a5d:6243:0:b0:337:5a22:ee0a with SMTP id m3-20020a5d6243000000b003375a22ee0amr725967wrv.71.1704813452414;
        Tue, 09 Jan 2024 07:17:32 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id h16-20020a05600004d000b003367ff4aadasm2653977wri.31.2024.01.09.07.17.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 07:17:31 -0800 (PST)
Message-ID: <4024d6c8-503f-42da-928a-589f2025188f@linaro.org>
Date: Tue, 9 Jan 2024 16:17:30 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Add support for LTC4282
Content-Language: en-US
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 Nuno Sa <nuno.sa@analog.com>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
References: <20231218-b4-ltc4282-support-v4-0-4fc51f7d04f0@analog.com>
 <09d0ecb0460aafb3f45d3d17b1b40605d7d28b2a.camel@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <09d0ecb0460aafb3f45d3d17b1b40605d7d28b2a.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/01/2024 13:19, Nuno Sá wrote:
> On Mon, 2023-12-18 at 17:29 +0100, Nuno Sa wrote:
>> v1:
>>  *
>> https://lore.kernel.org/linux-hwmon/20231110151905.1659873-1-nuno.sa@analog.com/
>>
>> v2:
>>  *
>> https://lore.kernel.org/linux-hwmon/20231124-ltc4282-support-v2-0-952bf926f83c@analog.com
>>
>> v3:
>>  *
>> https://lore.kernel.org/r/20231205-ltc4282-support-v3-0-e0877b281bc2@analog.com
>>
>> Changes in v4:
>> - Patch 1:
>>  * New patch. Support fault attributes in voltage channels.
>> - Patch 2:
>>  * Add default values for gpios and divider properties;
>>  * Add adi,gpio3-monitor-enable property.
>> - Patch 3:
>>  - Docs:
>>   * Document that fault logs are also cleared when writing in reset_history
>>     attributes;
>>   * Document debugfs entries;
>>   * Add new in0_fault attributes and remove dropped ones.
>>  - Driver:
>>   * Add hwmon_in_fault attribute to report FET failures in VSOURCE;
>>   * Clear fault logs in reset_history;
>>   * Constify 'ltc4282_out_rates';
>>   * Add missing error check in ltc4282_cache_history();
>>   * Removed unused functions;
>>   * Renamed clk provider name so it's unique per device;
>>   * Support new adi,gpio3-monitor-enable property;
>>   * Dropped power1_good, fet_bad_fault, fet_short_fault, fault_logs_reset
>>     custom attributes. Note that only power1_good was really dropped.
>>     The other ones are supported in standard ABI.
>>   * Renamed debugfs directory for ltc4282-hwmonX;
>>   * Added in0 prefix to FET fault logs so it's clear they affect VSOURCE;
>>   * Fix in_range() condition (false means error);
>>   * Fix reset_history attributes. We should not write 0 in the lowest
>>     value. Write the theoretical max value in there. For vsource/vdd,
>>     also do it during device setup (or we would end up with 0).
>>   * Directly store the chip vdd instead of vin_mode in our device
>>     structure. Easier to handle reset_history;
>>   * Moved the vin_mode enum to reduce it's scope.
>>
>> As mentioned in v3 discussion, clearing the power bad fault log has no
>> effect but I'm still doing it for consistency and because we also allow
>> to read it in debugfs (so better allow to clear it as well)
>>
>> ---
>> Nuno Sa (3):
>>       dt-bindings: hwmon: Add LTC4282 bindings
>>       hwmon: add fault attribute for voltage channels
>>       hwmon: ltc4282: add support for the LTC4282 chip
>>
>>  Documentation/ABI/testing/sysfs-class-hwmon        |    9 +
>>  .../devicetree/bindings/hwmon/adi,ltc4282.yaml     |  159 ++
>>  Documentation/hwmon/index.rst                      |    1 +
>>  Documentation/hwmon/ltc4282.rst                    |  133 ++
>>  MAINTAINERS                                        |    8 +
>>  drivers/hwmon/Kconfig                              |   11 +
>>  drivers/hwmon/Makefile                             |    1 +
>>  drivers/hwmon/hwmon.c                              |    1 +
>>  drivers/hwmon/ltc4282.c                            | 1784
>> ++++++++++++++++++++
>>  include/linux/hwmon.h                              |    2 +
>>  10 files changed, 2109 insertions(+)
>>
>> Thanks!
>> - Nuno Sá
>>
> 
> Hi Guenter,
> 
> Just pinging this one. Not sure if you missed this one or just low priority in
> your queue :)

Merge window is open. Is it a critical fix? Does not look like, so don't
ping, it's pointless and only adds unnecessary traffic.

Best regards,
Krzysztof

