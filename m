Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EC6364046
	for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 16:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768235735; cv=none; b=kkb8/CCaBaZSncE5i+huJEkLefBYYskYJlgIxSihUN5SI//MMlxxLlO0hnOmMArj/4wWZ5g4AsCRN/kn1+KW5zG9dJLlmHH4+qkwyZiD7yNKsM1BDR31WBzIB7uTVwwdex4as4zgmD6w8OC+wgnJ9YwVTwxbdVe8kH1aBpF6I5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768235735; c=relaxed/simple;
	bh=EULBpZPqTesUAKKLe/3GTkwUA0kpMiJ6TPjeQ4cKh68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m4SgY9STodrwfVGsArWRKTuvLU9l3Za8p5gGd3h0rq0r6HK7wjOnRaPAsSKudo2fCfxLB+CKfhwsYLpiRSJ+wFHektZP/vtSo+Sphm+QxjFn56E5aR1X7BVrIYfd3e0bNohllEus+54Fqbs97/LjpUKT5tlDRjpS7P9sBbzWZYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j1wY7IbH; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j1wY7IbH"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2b04fcfc0daso6628624eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 08:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768235734; x=1768840534; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=G5shNgt4nDm3qFmwiIEa3CR3VNo0cvgqutKlqWLUuLo=;
        b=j1wY7IbHqmREdksBncsxcNJWJJ68jarj6wCIrZBZgYJ7YTtxjh9aS5h1VTxC9YS1l9
         5rpbib4oZIoVVLV8J7DeTiDzp3vxGfSfUkZj78A+Hj+CFD9dlEWduFOvEfKt9v9efZ2e
         zVmf51fGW5UJO2j08B7yc1AkkirCvY/M+TpX+l1n47q5ebQRBEZAGXc8DshwYHd2Fz3N
         9bn/9bYgdniZSvbJIdx8zppHN0GgHRHC7R6D/WSjK/nvusfDzxAmJ/Fm3ZIEeDzX4HxT
         j82ZiHmPODLM1AgONfnoNEVuAUki68x17vt5/zDXGOtaIGIzMGBBq4DW0O4D++ZZ1NCs
         x/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768235734; x=1768840534;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G5shNgt4nDm3qFmwiIEa3CR3VNo0cvgqutKlqWLUuLo=;
        b=hSY8hfX+/xyvn0YoHU/05y5DGk5lNRLWbR4MUVMTvrtN60QqshJycHYpaVSOA8g6cd
         54eyUmuQG8WkFyQcFhUPNQYG18aZVJYiCzFT5PszD//N8ZCVa5lgtnRXKB7yAbRQqghe
         vU100/p18gWjj5h9Q4nO+Yi4sK9foxapHEK9h/aiEt/Zrd1YyWJKa5yQkIObzyeJtOhm
         WUGXJXYKLI1TNFcuRdhzAG7IQO144rrzQu/YINXYpgg91VQl4qHnTMd1Jg9tY/9iIRps
         sEiTc7poNUr4Jy4/ZhPpVuJAx09FuqjzGXoRtAwbqccfm5YvVBglQfMafBeAhpXACY1o
         l8Lw==
X-Gm-Message-State: AOJu0YyUEmswZZjdJe/9UurqTw6UotdOJAIo92v4bxynK0HpTgurWDWj
	jTwPYe7ABoMR2biZa88WHltdll7RxWsOPwj4nND9hoZDscNKn8d7HdE5
X-Gm-Gg: AY/fxX7N3EsATik5PNqGMwLrrcQeuoUdiYpioayCTvv58jtrLfEQNWDSg1iNi8Avfs2
	GO78TVdxcU/hEoc38eeNU/4XHhPoX6CGTs5rnF+Ef4ova3aJXTokW6iOsohTdA4v+SAjOKK6L0d
	za3DpvGYW+aWTsQYLGDgXBxM/SBrivlGgBcO4h6YRbR/ZyMDkfgqIgJeeSYiIl8xw+nCEAcnNvd
	m/3+7GC1CWJi/LkA3hVtPH3CSdNVFGVKxwxNHjdqIZ5ap2GZy6BTU+6dv4O04ZfbIXvZ6uqtZvN
	3NqWoexVGllNwS3e99ir1dMawPEqf7HLoat7tpOlhwwiPe8VJmqhS26hk2SvJuPFUp7vjsv19kR
	ICjDzTONgEiyfJcTXvsNHITh1POegoNTB5KqUdD4h7Xfsaz/YJEvl5fhUfazFxHju+f3dCUFQCq
	EVzoPjp/zJ2HJKhqBStEeSPkOUB3JWRpmTgB9heGtpfAu4qaQMtPhq7uD/XMyQ
X-Google-Smtp-Source: AGHT+IFKB2+I/myQd1fOGXHbJDWZP/Kag2FDPafE4GbzUcG1IPLFcwU7Qv47y3mUK8I45RIzNOaOoA==
X-Received: by 2002:a05:7301:fc07:b0:2ae:5af4:7d65 with SMTP id 5a478bee46e88-2b17d3211d7mr12676004eec.31.1768235733485;
        Mon, 12 Jan 2026 08:35:33 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b17078d9b1sm17536837eec.18.2026.01.12.08.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 08:35:33 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <01af44b5-8a07-4ebc-b58b-13672b545c8b@roeck-us.net>
Date: Mon, 12 Jan 2026 08:35:31 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hwmon: spd5118: Retry temperature reads after
 temporary I2C errors
To: Tinsae Tadesse <tinsaetadesse2015@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260110172003.13969-1-tinsaetadesse2015@gmail.com>
 <20260110172003.13969-2-tinsaetadesse2015@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260110172003.13969-2-tinsaetadesse2015@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/10/26 09:19, Tinsae Tadesse wrote:
> After suspend/resume, the SPD5118 hub or the underlying I2C adapter
> may not be immediately available, causing register reads to fail.
> 
> Attempt a single regcache re-synchronization and retry the read to
> allow recovery.
> 
> Signed-off-by: Tinsae Tadesse <tinsaetadesse2015@gmail.com>
> ---
>   drivers/hwmon/spd5118.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
> index ec9f14f6e0df..63f798991363 100644
> --- a/drivers/hwmon/spd5118.c
> +++ b/drivers/hwmon/spd5118.c
> @@ -101,6 +101,7 @@ static int spd5118_read_temp(struct regmap *regmap, u32 attr, long *val)
>   	int reg, err;
>   	u8 regval[2];
>   	u16 temp;
> +	bool retried = false;
>   
>   	switch (attr) {
>   	case hwmon_temp_input:
> @@ -122,9 +123,17 @@ static int spd5118_read_temp(struct regmap *regmap, u32 attr, long *val)
>   		return -EOPNOTSUPP;
>   	}
>   
> +retry:
>   	err = regmap_bulk_read(regmap, reg, regval, 2);
> -	if (err)
> +	if (err) {
> +		if (!retried && (err == -ENXIO || err == -EIO)) {
> +			retried = true;
> +			regcache_mark_dirty(regmap);
> +			if (!regcache_sync(regmap))
> +				goto retry;
> +		}
>   		return err;
> +	}
>   
>   	temp = (regval[1] << 8) | regval[0];
>   


Wrong solution. This affects all accesses, not just the first access after
resume. regmap_bulk_read() can fail for any reason, not just because the
system just returned from resume. The above code just assumes that the failure
is due to a bad resume based on the returned error code. That may be the case
for the i801 controller driver, but even that would be just by chance.

Guenter

