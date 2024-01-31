Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620AC5672;
	Wed, 31 Jan 2024 00:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706659324; cv=none; b=mxkZSE/WjhR4hLZldzmwjgwGqgYho583+oB88Qh54Z5mZkaChcDjJYYaddfmpEJXk7oEf8NBZK6zOcuJeAIgKa0W1Cd1BaPGEEDuLgOn2wbmNIvzWcmv1yWB0Txc3qqdpzqTjFY0KcTRRVZhWXSqMmnJvl9bB61wm0kxHex0+eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706659324; c=relaxed/simple;
	bh=knC81I1QJ2jBQMjLOt4XmkE8NCpfqqX5dHUkwIggcRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cqBY7onXZ46ua1aPOquvERmX8jzX2IrPuExIDQDHtg/cYtauFPdYIp5GGLjM5I3zURhN3zxHWVZzglUCv0UUtgnuevymWDMonud0xcm2tjnpn47GlIQ0turMLUrRVEgplNT9OaEHSK+Car+Ncab1PShT3CTqaUwYif4jSfANiZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pn/W66Ks; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pn/W66Ks"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-59a31c14100so1646134eaf.0;
        Tue, 30 Jan 2024 16:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706659321; x=1707264121; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=VLaLxAB03xnVbGCO0bKks+/Ah2am+rf1vzk0CltS9lc=;
        b=Pn/W66KsL2ZYnxvNyU1mJe50ij+wkBBX7npqVBZch4dXPK4tQbH4IiNbA0XOwhLPGO
         WZpG720XcVR5i6wyQiO1O/C0Iwbj40CGwH/vMrg/pfNQnb0Cn6eNQKr3139zqK7heC4t
         tiNcHxaK6eecjtc7iZ7Om8xwtsJeD0I6sfYTkxb8GD7e4+Srez1sXDcXGWHFkN4UTfd9
         r7kYAKe2WOmx3SMUjXDZ6hs0Q/qHOlvYzQHjHDxoxoHBtSsix+FQ7JmissTRpg1B+lAJ
         YpARR/HWfLGsDDBQMrTMLYIJxj816d0bX0hJUXbDq3bsp0gxo61UP8zQorw4aPSaP8dC
         +jTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706659321; x=1707264121;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VLaLxAB03xnVbGCO0bKks+/Ah2am+rf1vzk0CltS9lc=;
        b=nAappvDi98sxJEv9OzqTSmTsyNqUxbdGdgyLqHhnhzZ0PK+5IP/7eraZzPjotNggNQ
         0ZMCPPEGPBDBNWYmzz6pcGsVSQV/PsrBvFZ8xN3LgpqjKz4TZc5NlHDTJRjxdRw9Eyc2
         UohCYEtvB6hwZfwkl3pEZwFt9LYI7Ptgy5VyIlfKaVsMgMo2apb1uXbtPLNC3NJLqV96
         FT4MKkxmyOweLETMu4PYUszdxMzNBU9z5MTNsqs1991a+tfj1adtZ6hoOe0zcXaIaMjO
         U8wpmft+12ZmZ1bOT6r5zN9ECTIyjf7OkBCbZvpNVtE4bxRlnm9x06SzcOIrNvnqInO0
         mRdg==
X-Gm-Message-State: AOJu0YwqOciQq/wQDUh1CdLLojQmQGqDjWrOyZCoc75r28wxC7fGSs8y
	ltRmuMlkvBUt2V8/aU2W6qC3vcrCcWsJz5k0hTaN8SylNYOLDZhZ
X-Google-Smtp-Source: AGHT+IEHAhB8ffD7q0MDTlZ/6gOfjGBLf+9A9hqyJQ9Qtz2ReS9pn8cbpfdrtmB5xpsUflIEwVLXlw==
X-Received: by 2002:a05:6358:7e84:b0:178:7fc9:3991 with SMTP id o4-20020a0563587e8400b001787fc93991mr4014368rwn.23.1706659321222;
        Tue, 30 Jan 2024 16:02:01 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y10-20020aa793ca000000b006cbe1bb5e3asm8397562pff.138.2024.01.30.16.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 16:02:00 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <82529995-02e5-40fa-9fb9-7a363509ae3a@roeck-us.net>
Date: Tue, 30 Jan 2024 16:01:58 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v4 0/3] Add support for LTC4282
Content-Language: en-US
To: Nuno Sa <nuno.sa@analog.com>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20240129-b4-ltc4282-support-v4-0-fe75798164cc@analog.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240129-b4-ltc4282-support-v4-0-fe75798164cc@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/29/24 08:13, Nuno Sa wrote:
> v1:
>   * https://lore.kernel.org/linux-hwmon/20231110151905.1659873-1-nuno.sa@analog.com/
> 
> v2:
>   * https://lore.kernel.org/linux-hwmon/20231124-ltc4282-support-v2-0-952bf926f83c@analog.com
> 
> v3:
>   * https://lore.kernel.org/r/20231205-ltc4282-support-v3-0-e0877b281bc2@analog.com
> 
> Changes in v4:
> - Patch 1:
>   * New patch. Support fault attributes in voltage channels.
> - Patch 2:
>   * Add default values for gpios and divider properties;
>   * Add adi,gpio3-monitor-enable property.
> - Patch 3:
>   - Docs:
>    * Document that fault logs are also cleared when writing in reset_history
>      attributes;
>    * Document debugfs entries;
>    * Add new in0_fault attributes and remove dropped ones.
>   - Driver:
>    * Add hwmon_in_fault attribute to report FET failures in VSOURCE;
>    * Clear fault logs in reset_history;
>    * Constify 'ltc4282_out_rates';
>    * Add missing error check in ltc4282_cache_history();
>    * Removed unused functions;
>    * Renamed clk provider name so it's unique per device;
>    * Support new adi,gpio3-monitor-enable property;
>    * Dropped power1_good, fet_bad_fault, fet_short_fault, fault_logs_reset
>      custom attributes. Note that only power1_good was really dropped.
>      The other ones are supported in standard ABI.
>    * Renamed debugfs directory for ltc4282-hwmonX;
>    * Added in0 prefix to FET fault logs so it's clear they affect VSOURCE;
>    * Fix in_range() condition (false means error);
>    * Fix reset_history attributes. We should not write 0 in the lowest
>      value. Write the theoretical max value in there. For vsource/vdd,
>      also do it during device setup (or we would end up with 0).
>    * Directly store the chip vdd instead of vin_mode in our device
>      structure. Easier to handle reset_history;
>    * Moved the vin_mode enum to reduce it's scope.
> 
> As mentioned in v3 discussion, clearing the power bad fault log has no
> effect but I'm still doing it for consistency and because we also allow
> to read it in debugfs (so better allow to clear it as well)
> 
> I've also added Conor's reviewed-by tag while resending.
> 
> ---
> Nuno Sa (3):
>        dt-bindings: hwmon: Add LTC4282 bindings
>        hwmon: add fault attribute for voltage channels
>        hwmon: ltc4282: add support for the LTC4282 chip
> 
>   Documentation/ABI/testing/sysfs-class-hwmon        |    9 +
>   .../devicetree/bindings/hwmon/adi,ltc4282.yaml     |  159 ++
>   Documentation/hwmon/index.rst                      |    1 +
>   Documentation/hwmon/ltc4282.rst                    |  133 ++
>   MAINTAINERS                                        |    8 +
>   drivers/hwmon/Kconfig                              |   11 +
>   drivers/hwmon/Makefile                             |    1 +
>   drivers/hwmon/hwmon.c                              |    1 +
>   drivers/hwmon/ltc4282.c                            | 1784 ++++++++++++++++++++
>   include/linux/hwmon.h                              |    2 +
>   10 files changed, 2109 insertions(+)
> ---
> base-commit: 909d8d33f8b4664c9b6c7fd585114921af77fc2b
> change-id: 20231218-b4-ltc4282-support-2a08a85465c6
> --

Series applied.

Thanks,
Guenter

