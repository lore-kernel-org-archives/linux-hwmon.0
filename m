Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B0A2777F3
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 15:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778946706; cv=none; b=L/BesOvJunJnA6SrgfT+C+hu31bp7wsBfelwj6Ku3WWBRpjYU1oEkndK7cJkDpp1BWJx3K2gBdNnH5KGBShFa5AP1v9KJap3rYjLeDGOXQgwX2TI9L7uM4i2CepXK9LjXdUtZJfXntH0l5fcODMwzGcnpLhXG0c617fApHWUd3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778946706; c=relaxed/simple;
	bh=nO1iPAHL++UmR2y3CU/E0GVxto24i+BZ0kPWySFj0m8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=df7W+Ce1BTcyojMGTCK/hu0e9Kc5yx56tSFSyeXMNOgXuCLZj1FkwD52NxlY+q6TwcFvRurrMWKMXTHXRi3OYSqJUS8fuoQ6EfV0I+gp2M7+ZwO1xPMPkb/vTHilgy3Ux4BkVvfUbJRPrqqDVlMRsnPUufcK9TLs/kMbdOxJOD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n6YUiqjW; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n6YUiqjW"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2adff872068so3908545ad.1
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 08:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778946705; x=1779551505; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=2IUc5k1iXS35LL71ghjiDI4fOzIuLreckHEqQfAipz0=;
        b=n6YUiqjWb1MxwmLtVelVKFOYZ92vFQm9SkPa3bilVnnddVAnbsi352T++qyTNrLArr
         VwFP+zD+QzvW1tO+ySIcH5R0r/4cld5OGNw4e1NU/qste+vmTvPQNZ/yqhgxKUFwJTMZ
         ExM8lYXFTowxFviZiQ3KdeWj7vELlU5jglmdlX2nY0Pu/poUfvouVggICZi/rPjrmPX0
         onWGYQXnTnHWNX3oYdxyKXWwXH8N5G72Zl0x5zP1jZbp7HAd8NWzUVXiBsElHEmA7JlP
         8f8Y+9vTLYQMeXWHVfzRbrVrKjNOFbpRwuwMn2Tp1ZNygVFCUVgd0saOBqa7Ed+7GmhG
         L7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778946705; x=1779551505;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2IUc5k1iXS35LL71ghjiDI4fOzIuLreckHEqQfAipz0=;
        b=FbTxenu8zi+09xnKBEjLnSKgLJH6rkCX+FFr2dr9ycCBjuH0ablFK2Zk6/+1mt58Pt
         KtWWxDZhV4kfwQI/O2APpieZJRzF/Nw/2CQJSuR6G+HUk8DGhqCTUeRKDIaiRkQy0cgV
         yajT/WFv4p77lm1S3B7VNAcWv6bu8fizxjZ8wyp0zW8vvJG1gK9mc7OOdGP1WaQHDz6U
         /P1+QYRC9ATfg5Y0a3WcYOMRzFg/JQJLsausagONA3szPb9DPFMVRf04/xVZI2OFQawR
         FLMF1l1IsYtIiwXl1xMYrInsolBIBsRt78gK1m6AlMNtyPkol7Fr+qkh3GR42rzEtX8b
         iT8g==
X-Gm-Message-State: AOJu0YwFZTRl2T3NHSOvUSnzGpE0ehhfebbWC2KwnM1p7U6b81rlkO+O
	BU3ek21SxEY8ehPlJAo2z3BKdSiutgd2DxBUM0se18Pva5xrfCroRWud
X-Gm-Gg: Acq92OEjlsH9OgL/4ccoXLgRv6RkY6iWmpQOSiuWCOUqaR8dSC5QS/9Z2SJpHKIAc+q
	J1td8XDmTyI1SyMxldG1l5mOiG/qquUbOVO1qX/snsqZzMyLVqrvYz4KsNnbSQJebTiw05AcOc7
	6fo/E9bzlfT4MO50V17wLHqN97OWyWKffrryPhk1iAGXEwt3XIGVEMfm9jALQVg47/+1ULu+cyb
	8YmnFqe11T/cy78ORNqKQuUMKWlpOqrn0DPf26GGMtQ/Gz4OJiR4ydj0a5k8mFbAvlhHZzKTK9s
	xJvijnVXFSNHB9ANJF2AbFVgCpltN3fAchb+AYc9t67OkRVJ8VAfaHUXRmiZ0CUQftjq0VBA3T0
	jJA3D1giKoOETJZ/yBjAH+78KBekVYyuzhaMWiFTc3Oh7ngNAuDiKInFqSi2jmCVT7J5AiXlNhn
	8ad7cskrs2e9SgGYTLn+6IBcI5LlDaxDMz16X5ZLqQN49p6uXU72OjdkQ8pjcJWCOSyR+sG3rxb
	3lZArFl/ik=
X-Received: by 2002:a17:903:3884:b0:2bd:b585:55f5 with SMTP id d9443c01a7336-2bdb585571amr17474795ad.8.1778946704682;
        Sat, 16 May 2026 08:51:44 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd60275sm88717315ad.7.2026.05.16.08.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 08:51:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <fd38d9d9-d755-425a-bb1e-100606ce62b0@roeck-us.net>
Date: Sat, 16 May 2026 08:51:43 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] hwmon: (pmbus/adm1266) seed timestamp from the
 real-time clock
To: sashiko-reviews@lists.linux.dev,
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
References: <20260515-adm1266-fixes-v1-1-1c1ea1349cfe@nexthop.ai>
 <20260515222808.8E97CC2BCB0@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260515222808.8E97CC2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/15/26 15:28, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Fetching wall-clock time during device probe yields an uninitialized value, defeating the purpose of the patch.
> - [Medium] Switching from monotonic time to wall-clock time introduces a Year 2038 silent truncation bug.
> --
> 
> commit a6888c73c1a25c1329fffa916ee8e1654b5eaa1a
> Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> 
> hwmon: (pmbus/adm1266) seed timestamp from the real-time clock
> 
> This commit switches the adm1266 driver to use ktime_get_real_seconds()
> instead of ktime_get_seconds() to seed the chip's SET_RTC register.
> The intention is to provide wall-clock time for blackbox records.
> 
>> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
>> index d90f8f80be8e0..a86666c73a5e9 100644
>> --- a/drivers/hwmon/pmbus/adm1266.c
>> +++ b/drivers/hwmon/pmbus/adm1266.c
>> @@ -432,7 +432,7 @@ static int adm1266_set_rtc(struct adm1266_data *data)
>>   	char write_buf[6];
>>   	int i;
>>   
>> -	kt = ktime_get_seconds();
>> +	kt = ktime_get_real_seconds();
> 
> Since adm1266_set_rtc() is called during device probe, will the wall-clock
> time be initialized at this point?
> 
> During early boot, before the system timekeeper is synchronized with a
> hardware RTC or NTP, ktime_get_real_seconds() might return a near-zero
> value. Would this effectively behave like a monotonic timestamp and
> silently defeat the purpose of the patch?
> 

Possibly, but I'd like to see actual evidence of that. ktime_get_real_seconds()
is used throughout the kernel by various drivers, including security code.
I didn't find any indication of handling the situation described above.
Given that, since the patch is a real improvement, I applied it as-is.
We can discuss improvements if it turns out to be insufficient.

Thanks,
Guenter

