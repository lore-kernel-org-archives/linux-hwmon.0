Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866483469F4
	for <linux-hwmon@vger.kernel.org>; Mon, 13 Apr 2026 13:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776088294; cv=none; b=UO9dXSPY1Auh2WZ8TuzrwzEFgdTqhMu6g2x5yEjLmWmM9z6qeTFyevOvFj7zfykdyXlzzsRD/eWZgDS98uLH/0teZLDtwH9zYoEbcK/vXMU6nPERj46CT6h8nYoppgBz67NCBHS/m4GWX8Gx2B/YRsPNQz5J6dzSaWOwyKGz/2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776088294; c=relaxed/simple;
	bh=dOFRD4LjyXBhMI9i/FPHFGluRHwvw4LiuXsDbuZQiYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F5YNF5bFfSXfmp8wyhrZz8Iizn5lCcneZ6e0t3Q71x57MCQSb74Gi0lFyytdn/PXLV9osD6dJWw/GNptAaFb/hZ7fiFHRvwvUgj/XoaHT3ZEu51N+MnZIpVwIwnBz/70K6PubBfN6cxtpd3Sp4pe330jcwPC4tkXRpEElOKsY3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S6bV/hRQ; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S6bV/hRQ"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so2793606a91.0
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Apr 2026 06:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776088292; x=1776693092; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=f+faTN9vd/Ea2VF1vC4ZltVOC7htXKJ5sWse+LpSSEM=;
        b=S6bV/hRQzh+omh76S+clvHmxXqv9KCPYeVZFo3KEbNb0EpHZpKlw1evvzVo7mfVmtg
         Qx79SezqENtB0PF3wNZn8Z+GyzaTDXMPq2XNt5mbdwTVdhu0DF1FI2wv9ovd5TlA+77/
         9T8ZAi7acmhLMVabIAqNXtW2dc02iog/PUJ6UeCEoazwBFB0Hm8KSnD7TU0HQfWxj8CR
         efFKqIvrFrnhoDQW77xVuzZB/ehPlcDRCpUCcJn2FIanjjLU2DNqEH7CF6Mm/qXVVgtP
         4+7i6vy2f5oqFzAKCB+y8bVgRiSG5+BI5Ub8PqSA/KgK8sgPkzcOYclJmq8LPt8bFhSs
         YZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776088292; x=1776693092;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+faTN9vd/Ea2VF1vC4ZltVOC7htXKJ5sWse+LpSSEM=;
        b=pAiYWe1hb4/YAqOw9V9wJeswEtGzrcYD+l6bli9elkQpxMDdZFOWa0qRA4ekRhfWWv
         OAzKCY6uY0JBBMDaXnM3RZE77WaJvsMutSAq22lSZwfUnareB7jE0WwM5FZRitLbCDzc
         L3L0Jh17CeKCKldFuFhEnYUBt0snIAPB6SNlOvrCQE7c0inZQ9XQiTKBE0bR6j0a94RF
         D7DAXHr+72eravwJAUjpM1Q0hQx9bxVMjH9sRu9F8VDfxLerNwqmBISkmVS87HWHpsiO
         ohuSHr8+yV2uJBgdwV5XwBEzYDvkpW3o11IZ5L21ZVDUnwaYR69gJkjKCRYDQuprdFgI
         kGiw==
X-Gm-Message-State: AOJu0YwWQ4Id6jJlyIwKhPuCIPmOcaXB+fGY1uJNzHtIKN4wQg1pKFKC
	DyHf9TcG8BcXrHg+3eEe7mr9yyM3B/qAEoBh0j7GB0GqVyKIVmu3aIIM
X-Gm-Gg: AeBDieus0NnJscF0Q3KT4/FcgsHpDY79Jb3OZcIGovXrznlGODt3lk+exKzK4tA1z1a
	+RTNr/+N73ErdUFFoa7gvEMUAjqCFzZ3G0D7JC4WHS6BUvxK0NjUjzCbNANx8lrF/Gsb/argj0o
	L2f2JCc6GcaXtZf+Sbx7nTzt1RRx0J+lQ9uF4EgGS5DNZuyspJZKPvZNzANqOWn5AgT7OVAwsCh
	l1dFvMGlxNbgzo14sNEaL9SGSfYKxHHhawQZzP2VWY3mrgEugYJDgYBOcWvymG3XMKcyYyd55XF
	aDHEHNyoVLTS0ot2tdaxocDiEyOtnTc+QYSKPRkXTYwdu4BgKtuJ8BgVkMZqFDA57QFJhetiY+I
	ZiHpDhcAo2eAieWSug88uvT465Pb3s1nl0iO73J13x24i5lFXhf1eJpTy0WPgaGs5ZDFKALiew+
	aRwNI83jgOHwRoMfFZtTa+7iOrsPpbje1ZYhSABC03319JU34+/pSCWSbq/Fi2V7Ke91/TnnJD
X-Received: by 2002:a17:90b:3e81:b0:35f:b50e:defc with SMTP id 98e67ed59e1d1-35fb50ee113mr4320246a91.16.1776088291561;
        Mon, 13 Apr 2026 06:51:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b45c217ba6sm40979585ad.36.2026.04.13.06.51.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 06:51:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a899500e-cc92-45bf-b377-4b0680cdad60@roeck-us.net>
Date: Mon, 13 Apr 2026 06:51:29 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] hwmon: (yogafan) Massive hardware expansion and
 structural refactoring
To: sashiko@lists.linux.dev, Sergio Melas <sergiomelas@gmail.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260413060931.31091-2-sergiomelas@gmail.com>
 <20260413063835.2C331C116C6@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260413063835.2C331C116C6@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/12/26 23:38, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 3 potential issue(s):
> - [Medium] The driver's anti-spam polling protection fails to prevent rapid ACPI reads, exposing the Embedded Controller (EC) to the exact polling spam it claims to prevent.
> - [Medium] The DMI quirk table relies on short, non-unique strings without matching the system vendor, risking unintended driver binding on non-Lenovo hardware.
> - [Medium] The `const` qualifier was removed from all hardware profile structures, directly contradicting the documented security architecture.
> --
> 

Those are genuine concerns as far as I can see. Please address.

Thanks,
Guenter

> commit 4e3a104ba986fdf8eb4e1dff6e4429669d7cf376
> Author: Sergio Melas <sergiomelas@gmail.com>
> 
> hwmon: (yogafan) Massive hardware expansion and structural refactoring
> 
> This commit expands support for Lenovo consumer laptops in the yogafan driver,
> replacing the pilot implementation with a 7-series Hardware Abstraction Layer.
> It introduces discrete-step EC estimation, DMI quirk-based multi-path ACPI
> discovery, and implements physics-based RLLag filter dynamics.
> 
>> diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
>> --- a/drivers/hwmon/yogafan.c
>> +++ b/drivers/hwmon/yogafan.c
> [ ... ]
>> +/* 1.1 Single-Fan Continuous */
>> +
>> +/* Reference Model: Yoga 14cACN (d=50mm) - Baseline inertia (Reference J) */
>> +static struct yogafan_config yoga_continuous_8bit_cfg = {
>> +	.multiplier = 100, .fan_count = 1, .n_max = 0,
>> +	.r_max = 5500, .tau_ms = 1000, .slew_time_s = 4, .stop_threshold = 50,
>> +	.paths = { "\\_SB.PCI0.LPC0.EC0.FANS", "\\_SB.PCI0.LPC0.EC0.FAN0" }
>>   };
> 
> Does removing the const qualifier from these hardware profiles contradict the
> security architecture outlined in the documentation?
> 
> The documentation explicitly claims adherence to IEC 62443 by using read-only
> section (.rodata) placement via "static const" to prevent runtime tampering.
> Because these structures are no longer const, they will be placed in writable
> memory (.data).
> 
> [ ... ]
>> +	/* 2. Get hardware data only for INPUT requests */
>>   	status = acpi_evaluate_integer(data->active_handles[channel], NULL, NULL, &raw_acpi);
>>   	if (ACPI_FAILURE(status))
>>   		return -EIO;
>>   
>> -	apply_rllag_filter(data, channel, (long)raw_acpi * data->multiplier);
>> -	*val = data->filtered_val[channel];
>> +	/* 3. Calculate raw RPM based on architecture */
>> +	if (cfg->n_max > 0)
>> +		/* Use s64 promotion to prevent overflow during multiplication before division */
>> +		rpm_raw = (long)div64_s64((s64)data->device_max_rpm * raw_acpi, cfg->n_max);
>> +	else
>> +		rpm_raw = (long)raw_acpi * cfg->multiplier;
>> +
>> +	/* 4. Apply filter only for real speed readings */
>> +	apply_rllag_filter(data, channel, rpm_raw);
> 
> Does this actually prevent rapid polling to the Embedded Controller (EC)?
> 
> The commit documentation mentions a Cybersecurity Gating mechanism to ignore
> polling spam faster than 100ms. However, acpi_evaluate_integer() is
> unconditionally called here in yoga_fan_read() before invoking
> apply_rllag_filter().
> 
> Since apply_rllag_filter() checks the time delta and drops the reading if it
> is too fast, the EC is still queried on every sysfs read and the result is
> simply discarded. Should the time check happen before acpi_evaluate_integer()
> to truly protect the EC?
> 
> [ ... ]
>> -static const struct dmi_system_id yogafan_quirks[] = {
>> +static const struct dmi_system_id yogafan_quirks[] = {
>> +/* --- 1. YOGA SERIES --- */
>> +	{
>> +		.ident = "Lenovo Yoga Pro 9i (83DN)",
>> +		.matches = { DMI_MATCH(DMI_PRODUCT_NAME, "83DN") },
>> +		.driver_data = &legion_high_perf_cfg, /* 16" Chassis - High Inertia */
>> +	},
> 
> Could matching on short strings like "83DN" without the system vendor
> constraint risk binding to non-Lenovo hardware?
> 
> The previous implementation included DMI_MATCH(DMI_SYS_VENDOR, "LENOVO").
> Without it, these short product name identifiers might collide with hardware
> from other manufacturers. If an unrelated system matches the string and uses
> a common ACPI path like \_SB.PCI0.LPC0.EC0.FAN0, the driver might bind and
> interact with the EC unintentionally.
> 

