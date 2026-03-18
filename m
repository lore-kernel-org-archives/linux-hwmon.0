Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD0530FC26
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Mar 2026 18:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773858098; cv=none; b=opB5KnrbOAJO3FOJf3L04c5VBrwvhid3x5+yEw8uJsPywI/Lp2hY+RQqf8cf/fTGgU+nE9+AO1P63UKgfluyTk5jz79Cnd6ubNVEI0QR6eXupsRQt7y8XT8X+LHJ/KamMC0qxSFpzbRNIVwEtYteO1n5gIjZ56NdrSZm42sGF8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773858098; c=relaxed/simple;
	bh=O9aUudT/I45zyuk+KCoPv+MDpAIZri8HrxV2F6qNGqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cDhQloIhbrxhiqZAYT4cMfaIbBbuUXXYfbGpWf8o65gIkJ92lnvWB1eTvBI+TjN0o67LFtYTQ1bpBZQwV0cNrQYWqY/kuoehXhHim8fryUfZ0MRNqPfG9Qa/1zn7zCWRoRUfSmZb9zyJtY3pgpkS5SmjdplyBsxrFIooNWL4yQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUOuISMq; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUOuISMq"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c70ea5e9e9dso67080a12.1
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Mar 2026 11:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773858096; x=1774462896; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=qmVudDTwducIxNsOxT44PAC6F6SmR16XNISSEHDX0B8=;
        b=UUOuISMqnudnh1jNDvNyxG7rXxcjU8fn+rtfkFxZ9VyIM/SIrUUP37NMtL5+VwvzfB
         6l7ynb3mq2mUpabDrVb4JALK9ol8hsyL9Zkz1Q46gqvD8MRsg/UyyohEovBisOjU4Bry
         49ZiKNkUt010mEiynS2iOehXSmSnF7FbZgMWVvmFaNunzV6FC1vSgS6o9YGGSyQy330g
         txALneLAStfJeKpd+ntNkz7oqRHylJQhnNwaCEgXPn/wjDP/3FHnKSyTRt1CebuVEmx5
         UyTFghGR4f0M2sNtVcluoaXgZ0L4E8xvOBYpJxNucT/mlx2W7A1/HYxu6Bfxu+W5JXSg
         e/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773858096; x=1774462896;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qmVudDTwducIxNsOxT44PAC6F6SmR16XNISSEHDX0B8=;
        b=DrzUooJQ0Fnkgd3mEF/7iTwKsjP/+RZI7a+qttXuZ3M5yxshupRGL4wJhlr7ZxS/2f
         LIwZOcWBELo6VNNcPxF+z+6/EhI/pnFonlA2R9/OS7isB3nnfaoHZ+qtrwO+8cgOUauV
         6zBtbYyX203+V5UqOzyABO5HhC6R5YQLFFEWixoW+A4dCtKe6DNJoo7HXobPwzZ44IuF
         wwKEG6f1so4eTEMwFYEF2hi8GSml1FP3+4SNVen5f3BVRL6WdgKQVnK76Z1EWEuS1ykg
         ln8FsATmREnUGjD87elZ+Q56TGmaVV64zcWV/vz/K2k6ZqFHAfEpPDFd/gNso3E3ZZ3Z
         JGJw==
X-Gm-Message-State: AOJu0Yzzrglu28COaX9ONEAsEQElQqr98howLk1CVb0M08mchhMR+AZo
	fkJB+NXbTBVjfjt4p1vl8o7nNXSA6Ej2l9v497Vr4lkLWFozp88aAGqeX6nxaw==
X-Gm-Gg: ATEYQzz69dijNWNAw8c4YuKR+Ot+VhBoHvWA6upXzM940KTyd5KE3lCInMI74eux1tq
	KVYBMCYaVa6gLhOrZHHO+Arr1D14h0XkPHjjaYF1qRMUimUXtLFmi2v1OuOqEi+hFhaRx6T/m26
	/au+kOv6jHjkMLZhU3H3Ao1JdSMuCWdNUlcX4HdLhcObYQTiGzpyMrjZJtucM04zyGMj7jCDXAi
	FRYCdnouhEtMMCBidDIHDUsdPfjDaNS/MGujjAyMpinsFW7vaMN0I8UE9PQTWODRZkIHP95fv88
	fsCleCB1an1xySU8VkWHxmg8T7OZ7jT6Bk5DrfOj5vam5Ky7+WTpBu10kUGRJxfarQpzRWlVXZb
	LiO8+NeBYO/BnNGLTN8qkLozvP1H6LvHRFTAJzDbYARt950CQ0dHgaoT3KpahjnA5ogZbhz/xLm
	nSHaeCuAeL84m97W8lpI59XPfiL9sULUFHPykK8zKLMtKridvZdGVjuyIXp3olgEwXvCkK8r3W
X-Received: by 2002:a05:6a20:d485:b0:394:a026:4c48 with SMTP id adf61e73a8af0-39b99f29518mr4174839637.41.1773858096048;
        Wed, 18 Mar 2026 11:21:36 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e0b31fasm3252840a12.5.2026.03.18.11.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 11:21:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ba6bc890-b6b1-4035-872f-0b15281eaa05@roeck-us.net>
Date: Wed, 18 Mar 2026 11:21:34 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (yogafan) V3.0 Universal refactor and RLLag filter
To: Sergio Melas <sergiomelas@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260318172518.91336-1-sergiomelas@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260318172518.91336-1-sergiomelas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/18/26 10:25, Sergio Melas wrote:
> - Refactor driver to V3.0 Universal Platform Mode for cross-model compatibility.
> - Add support for dual-fan ACPI paths (FANS, FA2S, FANX) for Legion/Yoga series.
> - Implement 100ms (10Hz) background heartbeat for constant-frequency sampling.
> - Implement RLLag (Rate Limited Lag) filter to stabilize jumpy EC RPM data.
> - Use 10-bit fixed-point integer math to avoid forbidden SSE/floating-point registers.
> - Integrate DSTS ACPI modifications to ensure sensor stability during S3 sleep cycles.
> - Provide full documentation for KDE 6 Plasma Sensor compatibility and scaling.
> 

That is an odd subject line and description for a new driver.

> Signed-off-by: Sergio Melas <sergiomelas@gmail.com>
> ---
>   drivers/hwmon/yoga_fan.c | 222 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 222 insertions(+)
>   create mode 100644 drivers/hwmon/yoga_fan.c
> 
No Makefile update, no Kconfig update, no documentation.

Am I missing something ?

Some more (hight level) comments inline. This is not a complete
review.

Guenter

> diff --git a/drivers/hwmon/yoga_fan.c b/drivers/hwmon/yoga_fan.c
> new file mode 100644
> index 000000000..5a9ae631c
> --- /dev/null
> +++ b/drivers/hwmon/yoga_fan.c
> @@ -0,0 +1,222 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/**
> + * yoga_fan.c - Lenovo Yoga/Legion Fan Hardware Monitoring Driver
> + *
> + * Copyright (C) 2021-2026 Sergio Melas <sergiomelas@gmail.com>
> + *
> + * This driver provides fan speed monitoring for modern Lenovo Yoga, Legion,
> + * and IdeaPad laptops by interfacing with the Embedded Controller (EC)
> + * via ACPI. It registers a platform device to ensure compatibility with
> + * modern HWMON consumers like KDE Plasma 6.
> + *
> + * Supported Models:
> + * - Lenovo Yoga 7 / 14c series (Ryzen/Intel)
> + * - Lenovo Legion 5 / 7 / Pro series (Dual-fan support)
> + * - Lenovo Yoga Slim 7 / Pro / Carbon / Nano
> + * - Lenovo IdeaPad 5 / ThinkBook series
> + *
> + * Implementation Details:
> + * - Fixed static HWMON channel definition for kernel 6.0+ compatibility.

This patch implements a new driver and thus can not fix anything.

> + * - Implements a 100ms background worker to ensure RLLag filter consistency.
> + * - RLLag Formula: x(t) = x(t-dt) + clamp(step, -limit, limit)
> + * where step = (input - x) * alpha

That doesn't explain why this is needed. Running a background task is expensive.

> + */
> +
> +
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/hwmon.h>
> +#include <linux/acpi.h>
> +#include <linux/platform_device.h>
> +#include <linux/dmi.h>
> +#include <linux/workqueue.h>
> +#include <linux/mutex.h>
> +
> +#define DRVNAME "yogafan"
> +#define MAX_FANS 2
> +
> +/* --- RLLAG CONFIGURATION --- */
> +#define TS_MS            100
> +#define TAU_MS           1000
> +#define MAX_SPEED_RPM_S  500
> +
> +#define ALPHA_SCALED ((TS_MS * 1024) / (TAU_MS + TS_MS))
> +#define STEP_LIMIT ((MAX_SPEED_RPM_S * TS_MS) / 1000)
> +
> +struct yoga_fan_data {
> +	const char *active_paths[MAX_FANS];
> +	long filtered_val[MAX_FANS];
> +	struct delayed_work heartbeat;
> +	struct mutex lock;

The hardware monitoring subsystem supports synchronization which should be
relied on.

> +	int fan_count;
> +};
> +
> +static void yoga_fan_worker(struct work_struct *work)
> +{
> +	struct yoga_fan_data *data = container_of(work, struct yoga_fan_data, heartbeat.work);
> +	unsigned long long raw_acpi;
> +	long rpm, delta, lag_step;
> +	int i;
> +
> +	mutex_lock(&data->lock);
> +	for (i = 0; i < data->fan_count; i++) {
> +		if (ACPI_SUCCESS(acpi_evaluate_integer(NULL, (char *)data->active_paths[i], NULL, &raw_acpi))) {
> +			rpm = (raw_acpi > 0 && raw_acpi <= 255) ? ((long)raw_acpi * 100) : (long)raw_acpi;
> +
> +			delta = rpm - data->filtered_val[i];
> +			lag_step = (delta * ALPHA_SCALED) >> 10;
> +
> +			if (lag_step > (long)STEP_LIMIT)
> +				lag_step = (long)STEP_LIMIT;
> +			else if (lag_step < -(long)STEP_LIMIT)
> +				lag_step = -(long)STEP_LIMIT;
> +
> +			data->filtered_val[i] += lag_step;
> +
> +			if (data->filtered_val[i] < 50)
> +				data->filtered_val[i] = 0;
> +		}

This will need some explanation. Why is this worker needed, what exactly does it do,
and why not just read the current fan speed from ACPI when requested ?

> +	}
> +	mutex_unlock(&data->lock);
> +
> +	schedule_delayed_work(&data->heartbeat, msecs_to_jiffies(TS_MS));
> +}
> +
> +static int yoga_fan_read(struct device *dev, enum hwmon_sensor_types type,
> +			 u32 attr, int channel, long *val)
> +{
> +	struct yoga_fan_data *data = dev_get_drvdata(dev);
> +
> +	if (type != hwmon_fan || attr != hwmon_fan_input)
> +		return -EOPNOTSUPP;
> +
> +	if (channel >= data->fan_count)
> +		return -EINVAL;
> +
> +	mutex_lock(&data->lock);
> +	*val = data->filtered_val[channel];
> +	mutex_unlock(&data->lock);
> +
> +	return 0;
> +}
> +
> +static umode_t yoga_fan_is_visible(const void *data, enum hwmon_sensor_types type,
> +				   u32 attr, int channel)
> +{
> +	const struct yoga_fan_data *fan_data = data;
> +
> +	if (type == hwmon_fan && channel < fan_data->fan_count)
> +		return 0444;
> +
> +	return 0;
> +}
> +
> +static const struct hwmon_ops yoga_fan_hwmon_ops = {
> +	.is_visible = yoga_fan_is_visible,
> +	.read = yoga_fan_read,
> +};
> +
> +static const struct hwmon_channel_info *yoga_fan_info[] = {
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info yoga_fan_chip_info = {
> +	.ops = &yoga_fan_hwmon_ops,
> +	.info = yoga_fan_info,
> +};
> +
> +static int yoga_fan_probe(struct platform_device *pdev)
> +{
> +	struct yoga_fan_data *data;
> +	struct device *hwmon_dev;
> +	acpi_handle handle;
> +	unsigned long long init_raw;
> +	int i;
> +	static const char * const fan_paths[] = {
> +		"\\_SB.PCI0.LPC0.EC0.FANS", "\\_SB.PCI0.LPC0.EC0.FA2S",
> +		"\\_SB.PCI0.LPC0.EC0.FAN0", "\\_SB.PCI0.LPC.EC.FAN0",
> +		"\\_SB.PCI0.LPC0.EC.FAN0"
> +	};
> +
> +	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	mutex_init(&data->lock);
> +
> +	for (i = 0; i < ARRAY_SIZE(fan_paths); i++) {
> +		if (ACPI_SUCCESS(acpi_get_handle(NULL, (char *)fan_paths[i], &handle))) {
> +			data->active_paths[data->fan_count] = fan_paths[i];
> +
> +			if (ACPI_SUCCESS(acpi_evaluate_integer(NULL, (char *)data->active_paths[data->fan_count], NULL, &init_raw)))
> +				data->filtered_val[data->fan_count] = (init_raw > 0 && init_raw <= 255) ? ((long)init_raw * 100) : (long)init_raw;
> +
> +			data->fan_count++;
> +			if (data->fan_count >= MAX_FANS)
> +				break;

Can this happen in practice ? If so, why limit the number of supported fans to 2 ?

> +		}
> +	}
> +
> +	if (data->fan_count == 0)
> +		return -ENODEV;
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev, DRVNAME,
> +							 data, &yoga_fan_chip_info, NULL);
> +
> +	INIT_DELAYED_WORK(&data->heartbeat, yoga_fan_worker);
> +	schedule_delayed_work(&data->heartbeat, msecs_to_jiffies(TS_MS));
> +

This doesn't stop the delayed worker on driver removal, which I am sure would
have interesting consequences.

> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static struct platform_driver yoga_fan_driver = {
> +	.driver = { .name = DRVNAME },
> +	.probe = yoga_fan_probe,
> +};
> +
> +static struct platform_device *yoga_fan_device;
> +
> +static const struct dmi_system_id yoga_dmi_table[] __initconst = {
> +	{ .ident = "Lenovo", .matches = { DMI_MATCH(DMI_SYS_VENDOR, "LENOVO") } },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(dmi, yoga_dmi_table);
> +
> +static int __init yoga_fan_init(void)
> +{
> +	int ret;
> +
> +	if (!dmi_check_system(yoga_dmi_table))
> +		return -ENODEV;
> +
> +	ret = platform_driver_register(&yoga_fan_driver);
> +	if (ret)
> +		return ret;
> +
> +	yoga_fan_device = platform_device_register_simple(DRVNAME, 0, NULL, 0);
> +	if (IS_ERR(yoga_fan_device)) {
> +		platform_driver_unregister(&yoga_fan_driver);
> +		return PTR_ERR(yoga_fan_device);
> +	}
> +
> +	return 0;
> +}
> +
> +static void __exit yoga_fan_exit(void)
> +{
> +	struct yoga_fan_data *data = platform_get_drvdata(yoga_fan_device);
> +
> +	if (data)
> +		cancel_delayed_work_sync(&data->heartbeat);
> +
> +	platform_device_unregister(yoga_fan_device);
> +	platform_driver_unregister(&yoga_fan_driver);
> +}
> +
> +module_init(yoga_fan_init);
> +module_exit(yoga_fan_exit);
> +
> +MODULE_AUTHOR("Sergio Melas <sergiomelas@gmail.com>");
> +MODULE_DESCRIPTION("Universal Lenovo Fan Driver v3.0.0");
> +MODULE_LICENSE("GPL v2");

