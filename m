Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B1F31986C
	for <linux-hwmon@vger.kernel.org>; Sat, 27 Jun 2026 15:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782573747; cv=none; b=oWxb92AtqYtiDnNRsTcUQmBAzy7t09yZz74W6sZgiV2JEgK4Wo7GN/6lm235uzpIKxTxTww/pCKTTyjXzrD0jVbxiZKOjvTJmiG42MiJ+H60WJU6/UmDi8bz6e+omHK8tC3hozZh25g7ls4RMdt6g+78wSHamFbowmgwFCyfYhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782573747; c=relaxed/simple;
	bh=OPEK2H+PmwIJ0IMivte3OMo6b+xtx+fjt0d4Hduh/5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y8Dn6ZT5mKmBO9suYbpCjAWhcjZyfd8NSPn71gqQUd+YC3NKd2GCh9No+ITruBERBQY3ITDgbQj41HQtvDUSA5mkEEWvESX99toA6vJ730HxZ1LOevAXJMCWuksY3KXoyBVqYySPjwl6aQXxXDDT4vHAyTg6ga/ixIVqSKz7nEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hVzWIrl6; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hVzWIrl6"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-37fdee9276fso116401a91.3
        for <linux-hwmon@vger.kernel.org>; Sat, 27 Jun 2026 08:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782573745; x=1783178545; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=pnQjWKMFwLC77m+WvDUa6BprMW/i4oXO0GR4Z2ElrcU=;
        b=hVzWIrl6be7EFsBLtahvW1VtWZAEbkLY/NMiWoF9ByLj3vU0aFsxvzgki8mriJev3q
         w3o5P1BXoPkewjCX52dzM5zx2BaIl492fDPbiiwhc3JbVQie8XzYsoEA178HYIWZMe3i
         ow8sJDjl349EbS9BvnnpdgV3ZzaKM5aqz+MlLnz5MqjR+wO0CAl5yKD0+iDy/J3ori21
         4hb4ZKcJJC76gLPL5vasclLbL5oiNopMQBqVGfNI3zbm9WnFVdbMOslAujj1CJf3ha+J
         bwSdY+uBlTyfVCeLyFv+u/KnTtcHZkEMpH9z5L0drC6qGYyAPYkC/nurq/6aYouYsldp
         g2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782573745; x=1783178545;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pnQjWKMFwLC77m+WvDUa6BprMW/i4oXO0GR4Z2ElrcU=;
        b=DIKgH+55GAPcAOdBHOkjo+7y6alyhD1QQk1V4G+jQoNMApCiGQLR/o+Nbkcxx7nAbJ
         nGGZZYWM63Y6b7BzdjouTo31VNJ3JPqsGScY8OdiAFlu47njNh812jOoNzcUtM2eLWDN
         pptgZd903xpRxdB7yonPESqqLAu4pqQnCp9EiGUn6the6MOi3i75VJi3HVoSkr3q8bMz
         pKtvylXe7DXRimYS8Rc64py3vhnTz+IdYFEF5YWIf7y+Ew0G2UeTx0OA05x7g4HROkgS
         gsmyi+rJQxX9lPsW54CL4IQG2TdJMxP4pXC5m2b3kRcIORcwL0LXqPTi5PB/biKM2dzH
         ARdw==
X-Gm-Message-State: AOJu0YyLTL0ssxQ7mFwI5sr8srhf2JIRBiWgjbywdhg4t7zJLHlDtz+Z
	O1qzJTU1MB43UiUGhIWwMcZhYBUOEHbV/XQNY29iL7upMI0oc1Z6f/sE
X-Gm-Gg: AfdE7cl3yrIgidSCYFZ1LbTbN2yqh4uKDk4+C/jS9dIGFci6K7vxaKaHM1Gg2UkfcEb
	KIbGPOnFY6CfNtptqi4BpOjw8UYelyD5hBTLgDPpPPUNDY3kMnbZS0FHw3WcpTq8jgxHm5mWkxy
	8S3R81350jUWB0/WeAvdhyRc7yTNdGmDLsHTt7yPNxcmWQhs4aZv3QDUaXY5w/A6rEmVZvfGFVl
	9EhrEX+ACNCr9gC+S73Vff+a4SFXgSfkjWE6FWDLRhaIkxP1YfqsJeunLhUxG1+AHQuUwkTY8eR
	r0ELljNVhSldHmb7/sgWoZz31hIyVTPIBtDoQdSfpi0hvUttiZBKgN9vLg5Av3c5iF7/S7qcvTd
	tG4prYul7PZS22G2cSDtLWISH4SeRp0VC/EZHoEji+8ePYuIEVqjcDdyNxvsRPURv52nQ8UnDLZ
	NEmAmjG/D/5rUk+dMPT/hQbnJCCqX4CStBN3Sx2vWv7bGdYuHImwP12RkRSo/OvQ==
X-Received: by 2002:a17:90a:f94e:b0:37f:a94e:10b0 with SMTP id 98e67ed59e1d1-37fa94e130fmr3630944a91.24.1782573744562;
        Sat, 27 Jun 2026 08:22:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e130b6e09sm1917858a91.2.2026.06.27.08.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jun 2026 08:22:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b93e6a6a-6766-460d-9a4c-e1286df8b5b6@roeck-us.net>
Date: Sat, 27 Jun 2026 08:22:21 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] hwmon: (yogafan) Add support for Lenovo Yoga/Legion
 fan monitoring
To: sashiko-reviews@lists.linux.dev, Sergio Melas <sergiomelas@gmail.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260627084039.47158-1-sergiomelas@gmail.com>
 <20260627084934.A75111F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260627084934.A75111F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/27/26 01:49, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Unprivileged Denial of Service of the RLLag telemetry filter via fast polling (shared state pollution).
> - [Medium] Silent bypass of WMI Coexistence Guard due to Kconfig mismatch (`IS_REACHABLE` misuse).
> --
> 
> commit db32fd276d89299ba906703e55172f8ec3415249
> Author: Sergio Melas <sergiomelas@gmail.com>
> 
> hwmon: (yogafan) Add support for Lenovo Yoga/Legion fan monitoring
> 
> This driver provides fan speed monitoring for Lenovo Yoga, Legion, and
> IdeaPad laptops by interfacing with the Embedded Controller (EC) via ACPI.
> It implements a Rate-Limited Lag filter to smooth out low-resolution sampling
> in the embedded controller.
> 

Your patch is very obviously AI generated, and on top of that you did not
even look at its output.
- The patch description does not describe what the patch is actually doing
- The patch adds lots of unnecessary white-space changes
- The patch adds unnecessary include files (hwmon-sysfs.h)
- The patch adds non-standard tags such as "cite_start"
- Some of the changes are bogus (see Sashiko report)
- ... ok, I stopped there

I asked Google search: "What is cite_start about ?" and it tells me:

"The cite_start tag is a raw backend processing artifact that Gemini's AI model
  uses to track the origin of factual statements. When a frontend interface fails
  to properly render these into clickable hyperlinks or numbers, the raw text
  leaks into the final output.
"

Interesting. Then I started a session with Gemini 3.1 Pro and gave it the
following instructions:

"The patch in 'index.html' modifies a driver in the checked out Linux kernel.
  Analyze it, drop all white-space changes, split the patch into multiple patches
  following Linux kernel development guidelines (one logical change per patch),
  write appropriate patch descriptions, and apply the resulting patches to the
  checked out Linux kernel.
"

It splits the patch into 5 separate patches, each with appropriate description.
It didn't drop cite_start or the unnecessary additional include file (I didn't
ask it to _review_ the code, after all), but it was a start. I don't know what
model you are using, but I would suggest to start over and do something similar.

Guenter

>> diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
>> index 605cc928f21f3..7d66d563ec236 100644
>> --- a/drivers/hwmon/yogafan.c
>> +++ b/drivers/hwmon/yogafan.c
> 
> [ ... ]
> 
>> @@ -50,48 +62,109 @@ struct yoga_fan_data {
>>   static void apply_rllag_filter(struct yoga_fan_data *data, int idx, long raw_rpm)
>>   {
>>   	ktime_t now = ktime_get_boottime();
>> -	s64 dt_ms = ktime_to_ms(ktime_sub(now, data->last_sample[idx]));
>> +	s64 raw_dt_ms;
>>   	long delta, step, limit, alpha;
>>   	s64 temp_num;
>> +	u32 dt_ms;
> 
> [ ... ]
> 
>> -	if (data->last_sample[idx] == 0 || dt_ms > MAX_SAMPLING) {
>> +	/* 3. Auto-Reset Logic: Snap to hardware value after long gaps (>5s) */
>> +	/*   Ref: [TAG: INIT_STATE, STALE_DATA_THRESHOLD] */
>> +	raw_dt_ms = ktime_to_ms(ktime_sub(now, data->last_sample[idx]));
>> +
>> +	if (data->last_sample[idx] == 0 || raw_dt_ms < MIN_SAMPLING || raw_dt_ms > MAX_SAMPLING) {
>>   		data->filtered_val[idx] = raw_rpm;
>>   		data->last_sample[idx] = now;
>>   		return;
>>   	}
> 
> [Severity: High]
> Does combining the MIN_SAMPLING check into this auto-reset block create an
> unintended bypass of the filter?
> 
> If an unprivileged user queries the fanX_input sysfs attribute faster than
> MIN_SAMPLING (100ms), raw_dt_ms < MIN_SAMPLING evaluates to true.
> 
> Because this block sets data->last_sample[idx] = now, the time delta never
> accumulates to exceed 100ms on continuous fast polling. This seems to snap
> filtered_val to raw_rpm repeatedly, entirely defeating the filter's smoothing
> logic.
> 
> [ ... ]
> 
>> @@ -206,6 +298,17 @@ static int yoga_fan_probe(struct platform_device *pdev)
>>   	struct device *hwmon_dev;
>>   	int i;
>>   
>> +	/* Check for WMI interfaces that handle fan/thermal management. */
>> +	/*  If present, we yield to the WMI driver to prevent double-reporting. */
>> +#if IS_REACHABLE(CONFIG_ACPI_WMI)
>> +	if (wmi_has_guid(LENOVO_WMI_OTHER_MODE_GUID) &&
>> +	    wmi_has_guid(LENOVO_CAPABILITY_DATA_00_GUID) &&
>> +	    wmi_has_guid(LENOVO_FAN_TEST_DATA_GUID)) {
>> +		dev_info(&pdev->dev, "Lenovo WMI management interface detected; yielding to WMI driver\n");
>> +		return -ENODEV;
>> +	}
>> +#endif
> 
> [Severity: Medium]
> Is IS_REACHABLE the correct macro to use here for the WMI coexistence guard?
> 
> If the driver is built-in (CONFIG_YOGAFAN=y) but ACPI WMI is built as a
> module (CONFIG_ACPI_WMI=m), IS_REACHABLE(CONFIG_ACPI_WMI) will evaluate to
> false.
> 
> This silently compiles out the guard, which could lead to hardware race
> conditions between this driver and the WMI driver once the module loads.
> 
> Would it be safer to use IS_ENABLED() alongside a Kconfig dependency like
> depends on ACPI_WMI || ACPI_WMI=n?
> 
> [ ... ]
> 

