Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59AD366DD0
	for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 16:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768235427; cv=none; b=TdavVphFqtwIFWn3aYx8V+t2dJqsPmvHr1JkliRyZ3o7rG25enwT6gzfTMG+RItMbdBMcUH4VrkBXCPHXLaYrD3EFgObswmd/jKssJXByWV8DUkMk5tLJVwOyqIwASbfdFQc0lfdhRQdOIIx17VyrSAbUOC1HPTwA0D4TUwgSGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768235427; c=relaxed/simple;
	bh=2QK/PbgnUhPWpYYLL+1aspuybQodX2kfFIQlbIU+7iI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KhKDdI2VvAJLAJYpHn25onBHJlK9PXhotVVM4ekUbDcP954yo9fFudt4tdcnjJv2v3b7/qwBTTSjQ53xEUZJ2f/j5cfImnXxMbO52GAachtwoJTAmoKx4NgxjJHcPvpb8GpXsW4/cJiWe6fAqhPpOspQnI7Rmz6eB9iirYZOyiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mf7Ywx6a; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mf7Ywx6a"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-121b14d0089so7167577c88.0
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 08:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768235425; x=1768840225; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=GJR6FkeU+NIvLcCVeWrzPvoeuR5k+SY6j8y5pnp86Mk=;
        b=Mf7Ywx6aje0kGJ+0+mbe+02HV6JEPwDNMDy868MDzI2xXCbfUSv3V+JuuM4YusBWV/
         IxkPJ3+iAukfQZX52zHOmLCMu8/4k1SUgWGEftRHsFDFUwGKCztZW7UNUZBdWsdtbvc2
         xbjq8V73Zj7LKqDhi+FG8KsqP9eswuoxxOkbJg6lOIIhfIa4zwvKA+2vAZRbgFhSgZp2
         tcyTU/DF3tx5ZeoKmqun2h1iDesKPqnF8quRsGab4wR0RLh6YRJ4+FS0Gk3XtOhwZ0Gm
         2FV/dBxsNczzfmfVzJIDF7JuZ0HeVQ+mnKz/bBydMQvMIfbRj7NoMHbgz2v8iszYmM4d
         m9EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768235425; x=1768840225;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GJR6FkeU+NIvLcCVeWrzPvoeuR5k+SY6j8y5pnp86Mk=;
        b=cIEc09LOlfxyv9Do53Y/5nGXUsa9bWinL9F+7/9KxToUzwW0Q5WQ4orwvjycl3HaoZ
         QcJ8R3CJSqGP7568w4iz5YgVpf5H5jB9hcfzxbtciWUx3j1gpfL4quHB9Ug4hDGSKhn5
         cw4fHrIdeEjPmSrcoBC4jMDs94mPtgbb+/vN9PhuSedUutBvCPoPvJJRzQ/VByPu94v6
         yiHVsrL3Riw6zdiBsimmrNed5YYP36tUgveE7rg5/g1SmIL1teWyA+w1MQA69gYvE5Rw
         oAJLIjEf3WFkkDcdVFOV5nx/0mEgpwppweIUbYigitr+F3IYUC3LNblwWACWub1pEDgn
         MJwA==
X-Gm-Message-State: AOJu0Yyz7bzdBjtJBEayyTnbpAadbBgO4tdyvPJePNB0xMIFbkyTAdUc
	LH4vFn/QlTuXQ06BK947VB2un+bxtwpfHkd22BwkYTvlcMw2ffzlBaEe0R85WQ==
X-Gm-Gg: AY/fxX68B5wHVO6OA+vpkkV0qL8w/9Eh+cFVMSiK+Qw2qFAQHSb1tcrWm6NjMqCs1h2
	LCiBZcDIxyS4UDNMT6ckos1I60HRtbAldmprD9D9QXOmVgFgNP0xVb4a0F0LAhEjcih70K7AzE4
	prnZUYE4YnJq00AE3sRK9+0iun1ntjbYlDXDZL9rupcd6f3Y0ZNkXFwZwIoCJ4DwFG7MmVjCWkG
	vSawOHjDmyqWDrwqwwe4avXcJKfuhtGrpITwOIq77Gw4YRvXf1/C7PSLVo0c/kcUbMQ1Xtj9CNn
	ik4o2aNK8q2Kah2VftMVMOrjmjU3L6OZyK23oUco7lS51gRVFg5YT8iKh/uLXSRjnGdT6TV7WZ3
	ylbLG8YRlXPCtcmlCWJuBnbn8OP2eAVwEmgVmaXaDJns8EM2i4+otNKTtps5AbKPftHAP7H+hEb
	IRRT1YaHFZ3qCSg/Hk0g+/y5wCp0JnrkKXNAfAbylk/uZgrDZtCmxAOZkA3ZV9
X-Google-Smtp-Source: AGHT+IGZfs7xnqFUO3j8+WxV8cTfbgGIZvTc9ixEcqLVmeP4190nRGm/nG84VoKQfXB5sFjLWoWbBg==
X-Received: by 2002:a05:7022:220d:b0:11b:ceee:a46d with SMTP id a92af1059eb24-121f8b0e113mr14147318c88.15.1768235424837;
        Mon, 12 Jan 2026 08:30:24 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f248c246sm25278859c88.11.2026.01.12.08.30.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 08:30:24 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c36306c5-2426-4a9c-9abd-9f3cdab17ed5@roeck-us.net>
Date: Mon, 12 Jan 2026 08:30:22 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hwmon: spd5118: Do not fail resume on temporary I2C
 errors
To: Tinsae Tadesse <tinsaetadesse2015@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260110172003.13969-1-tinsaetadesse2015@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260110172003.13969-1-tinsaetadesse2015@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/10/26 09:19, Tinsae Tadesse wrote:
> SPD5118 DDR5 temperature sensors may be temporarily unavailable
> during s2idle resume. Ignore temporary -ENXIO and -EIO errors during resume and allow
> register synchronization to be retried later.
> 
> Signed-off-by: Tinsae Tadesse <tinsaetadesse2015@gmail.com>
> ---
>   drivers/hwmon/spd5118.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
> index 5da44571b6a0..ec9f14f6e0df 100644
> --- a/drivers/hwmon/spd5118.c
> +++ b/drivers/hwmon/spd5118.c
> @@ -512,9 +512,15 @@ static int spd5118_resume(struct device *dev)
>   {
>   	struct spd5118_data *data = dev_get_drvdata(dev);
>   	struct regmap *regmap = data->regmap;
> +	int ret;
>   
>   	regcache_cache_only(regmap, false);
> -	return regcache_sync(regmap);
> +	ret = regcache_sync(regmap);
> +	if(ret == -ENXIO || ret == -EIO) {
> +		dev_warn(dev, "SPD hub not responding on resume (%d), deferring init\n", ret);
> +		return 0;
> +	}
> +	return ret;
>   }
>   
>   static DEFINE_SIMPLE_DEV_PM_OPS(spd5118_pm_ops, spd5118_suspend, spd5118_resume);


Based on the subsequent exchange, this is not the appropriate solution.
The problem is that the i2c controller suspends too early. It should suspend
later instead. Alternatively, this driver should suspend early, but it does
not look like respective PM operations are available.

I would suggest to try replacing DEFINE_SIMPLE_DEV_PM_OPS() in drivers/i2c/busses/i2c-i801.c
with SET_LATE_SYSTEM_SLEEP_PM_OPS() or similar.

Guenter

