Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006AD25F7B9
	for <linux-hwmon@vger.kernel.org>; Sat, 21 Mar 2026 05:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774071075; cv=none; b=AqR3KLpNMUq9F8s7NbmpxZvlVZk1PI9a+7aV6hTkMpDNLLsA+4F7yD6ZTCBF/Kh8uYAdMLHnWN3HBIsl2JFRgCaAKCnrjOoZn4uS52Qwu8gEZP+X+3aNeuyDMzpoE6u/dN2ac5bzkgIXJqYu4euBLux/6dIb3+vkSw/2m53KiYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774071075; c=relaxed/simple;
	bh=w3JRrlGu2JsHTB/i6sCCZIWZB/QnZRqiXess9hq3AAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f1dvOmNQOzYXAg+eVKZwDPoK99vjVaiHwdi1zRITT7hyxxRpZopKVEFu6hkh0c7c2NVfdGVjp4DTxaYHPHrhDayaqc9czynmNcCYxpTI38/GaPdRNmLJVxOmjWG+vjPJLbHnd75SjqnG3mvWsTobo2NNQ19KNIGn4yJAiUV5SMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZflLkOn7; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZflLkOn7"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ad9516a653so11851335ad.0
        for <linux-hwmon@vger.kernel.org>; Fri, 20 Mar 2026 22:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774071073; x=1774675873; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=BoVXlGWRO09GtLD36F3zO0hCP6Sr86IE2tXEhCaAAY0=;
        b=ZflLkOn7WNKneWAuL6uJalWSlfPRb9MD7TfN6J0XZ4lNArepsBoEWKgsa9yf3VsTWD
         EMjYnRZ10aT4NwETcchYLZ46ylLZkux/xIGivYulTcxiHMuO2RbI09pddXCTwvC3ucJ9
         AW79og6hSexKChnb+4UIiAduwdarcgdxTK1dlFKo35+JtFylbnlUPWTWYpUN0kBt3dSq
         XG/qSGxjpNsb6b6Gy7NnHu1zMkhHog1GQ1Ctu0GIpqlStkKgoIhs6/N8Rf4XRcVOZbF/
         OlRDE7V+JNd3dKwanCTPUGhxZoE1RWtFO7nMk6YGmOuA1r1VQ2zW8OWNBhyTAMUV1rLc
         iGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774071073; x=1774675873;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BoVXlGWRO09GtLD36F3zO0hCP6Sr86IE2tXEhCaAAY0=;
        b=TXA8RaZ/NH7bleLjdfZKB2oOFfsanhQs2OPqLJ0j42g0ss++vpi9FeEEDkzORoEp6L
         eb5E+6wWlxdktorRchIvNXs7OoP+zGi2KZsKcYM1DarwttFH4Lz1oH6lj4vI5gPK2PKn
         ksTJDC15WvqOHncCj/psuSzthrdN7BDyggIX3vDuUzIsBxuMS8DMUHTlyTiep0QpzrbE
         MLTXaQVlaHOvTvscQtqQwzyHRrFDBElJBvN+VGjcorOasxjxbgPYUbS23YaIg6GI/fV2
         MxTGRJWaz7ao22FcVimmWrZi+jA5Co2EPCAAPNYVslpiixh5hwTGd9oUNPI+o/I/tb5E
         C0SQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7oY6EbxqF09QlD0Jg7BGO6KJzE09+TQuPt+34XWx50g7zMTMyrutrKPo7+ih2ABo1bl6tu4enIjwITw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz05hSMWFKdH0PBj2TdLoYmqNNj5H2vUBpAu5R0HQgB3B4Fyugz
	ALRem/QqdTF45fOXjN7Kaa99hY10JFT0Jv3z4wjqMzEcvG3itPhJFcKP
X-Gm-Gg: ATEYQzydl0PDP+pU4UFL7ZogflNOg3R0d1hIotMmgC3cwfgUNEyo6OHziUPi6GK6klI
	b5ZDE7/DtXL+bgRO51IYLH+yjfKo++QTxA1vNgklU4o1H6sPVPJ1R0pXwPkk86MeavQxTaig5SH
	X4r0/kfgcYbSwpbkslro2VBzEQsRCt//JoDxh37EKgNP6umznY0NVClETyMwcSxAy6Nn8kwk14d
	duYwTnW/5seQ8OfCIi+rcNfqAKFAkE09zUnsXnvDrvzJBZ4IKem80PzgMbDc2vkC61GZV64mz5h
	UWiF0zaShR6SnzDkdykwoE9aRfyPBBRT9Nc+B1NMbRwIAh2hWEqafz/D4tMDQ7+fCk4GP3Qops+
	e36sCffBq9PKfrfwcXaBj1m/+OGdB+KdjlVE3kL1RJrK11Zm86HQCtmSx009z5LbXNX7JTBsDwk
	toIS7Ag/txXaMElo3pKBWM1Cvfxm0XhbYa1do/tQhVvWb7O7p95mge1wluAnXhLP/nqCHEmtJDQ
	nWX1KwoS1I=
X-Received: by 2002:a17:903:94e:b0:2ae:826f:2c50 with SMTP id d9443c01a7336-2b0826e2f0emr45450355ad.12.1774071073322;
        Fri, 20 Mar 2026 22:31:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08352a17asm39899525ad.24.2026.03.20.22.31.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 22:31:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8e7d851e-0ee8-46c1-a5ce-4235926e8cf9@roeck-us.net>
Date: Fri, 20 Mar 2026 22:31:11 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] hwmon: (pmbus) add missing mutex_lock in regulator
 ops
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sanman Pradhan <psanman@juniper.net>
References: <20260321005206.6350-1-sanman.pradhan@hpe.com>
 <20260321005206.6350-2-sanman.pradhan@hpe.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260321005206.6350-2-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/20/26 17:52, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> The regulator voltage operations pmbus_regulator_get_voltage(),
> pmbus_regulator_set_voltage(), and pmbus_regulator_list_voltage()
> call PMBus access helpers without holding update_lock. These helpers
> perform multi-step PMBus transactions involving shared core state such
> as page selection and transaction timing. Without serialization, a
> concurrent PMBus access can interleave with those operations and cause
> reads from or writes to the wrong rail.
> 
> For set_voltage(), this is particularly dangerous because the
> VOUT_COMMAND write could be directed to the wrong regulator output.
> 
> Add mutex_lock/unlock around the affected regulator voltage paths,
> following the pattern already used by other PMBus regulator operations
> such as _pmbus_regulator_on_off() and pmbus_regulator_get_status().
> 
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>
> ---
> v5:
> - New patch in the series. Adds the missing update_lock mutex to the
>    three regulator voltage ops that were missing serialization.
> ---
>   drivers/hwmon/pmbus/pmbus_core.c | 46 ++++++++++++++++++++++++--------
>   1 file changed, 35 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 4d7634ee61484..3dad455448d05 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -3181,7 +3181,9 @@ static int pmbus_regulator_get_voltage(struct regulator_dev *rdev)
>   		.convert = true,
>   	};
>   
> +	mutex_lock(&data->update_lock);
>   	s.data = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_READ_VOUT);
> +	mutex_unlock(&data->update_lock);

I guess that would have been too easy. Here is the AI review feedback:

https://sashiko.dev/#/patchset/20260321005206.6350-1-sanman.pradhan%40hpe.com

Apparently this causes a lock recursion. We'll have to make sure
that regulator_notifier_call_chain() is called outside the pmbus lock.

The only way I can imagine this to work would be with a worker.
Instead of calling pmbus_regulator_notify() directly from
pmbus_fault_handler(), we could store pending events in struct
pmbus_data (one event per page) and trigger a worker. The worker
would then walk through the event list and call pmbus_regulator_notify()
outside the lock for each pending event.

Of course it isn't that simple because the list of events can be updated
while the worker is running, but that should be solvable.

Either case, I am not sure if we want  / need to handle this with the
current patch series. The other patches look ok and should be ready to apply.
WDYT ?

Thanks,
Guenter

