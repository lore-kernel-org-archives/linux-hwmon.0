Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D556265621
	for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 14:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768228930; cv=none; b=VcFx410ya2oKhFllKs21yxzVdGc/mhZabCF+hfCMgcsGlcoaOwk6sKvd8Z8wPegcWT1ES8pcdsrFX1MvvENjrqePgMhagwY7D5SDXCyoTX0hzCvDp32XO7uYI2E4aFabZD61QcqNKXbWB0NGzCQXoPxXxgCEHT2AxBgQK3p6Yg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768228930; c=relaxed/simple;
	bh=fK2Ki09fbieovhg3wA49lpkO1BbokAOA+JaFOrc6Qr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VE/UqYhKd8aLgZLgmIWhSRGf4+Yww1SqtztcBL19Cr9WpcNr0b/2jEbxQqCXUwjPi8Gk8BTaeEOqXNhWQ3SGHirIiMRJwKGMphQyur83LnuQQsY07H2s4yAPy2jfS7QN03XCfxFzhAyYDqBCzcO23uTUOHhtX09wqpNUqUpDiDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9Bj+EbR; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9Bj+EbR"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2b0ea1edf11so16202381eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 06:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768228928; x=1768833728; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=KilMonPm3SwKScHm2oCFOBnIU+JHGno8pTgOBwnHQN0=;
        b=F9Bj+EbR2B6y1SU6r7JCHZNWaufH5MpYxBq8FAF/jIEKw3pLA8G0Q9/Puk3pHYFCC8
         uda8MFZYUwTEo10lACLGCoNMmCYtaU5buapQKFS9ws7JQ4m3Zw8cgdHr8J4ikGKil3G8
         Z9VYhzpAeSS9WOSWSSWCNd920fSIsWDhdWrRZlCMKLAoZmsBAHn64Cbyb7xWi95JQ6KF
         Gi/auTMRbIeQSfSaQSp5FYa4UY5HQe1rwVoJhgEL4gH5Ohn9MTWA0PN91WFRloHW3SsE
         GHQtP7C1h3OINpE5t3L9IvY1RQ3EhupW33RPsfYUkyE2X1ogZmbr4TT3d4PxHW7AlDQX
         hZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768228928; x=1768833728;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KilMonPm3SwKScHm2oCFOBnIU+JHGno8pTgOBwnHQN0=;
        b=lMii6Fqg/aLWXLopTzT+XfsBaymy87BZ4HT46vTqDQftsXIpQvymFQHTM4E9m1teb8
         /QcKzoPe2TuIWNym6OM0j5Tc39rPWh25kuI7iQelBu4WkBumKtHVKZYgS9Mbcz5aaf1M
         lXqaBs75MRgKSP0VL8PJDHh56IQ/yaC9s03q/iTVId3wUQ5BCHNAl+EVdiVBZY+vwBpP
         OLPd2AIB4MX4EWgwcXdN6r78emEQJwiAzwuYDdgl0Z8DJXs24thFHLM5F38ngOh64c6Q
         uRNOjYmLTN7Cwg7UqS5guyfWnRjyow1GXO00Iwy6PJrIa3hh1emy3c1NKucdK47QfBUj
         DG8Q==
X-Gm-Message-State: AOJu0YyAN2DBCnFOKD+Rq3fquJhEA7d0ZwoyA6sKjXLiCmNu5n9WxZNV
	E/9OQVZSyYbCL/tjj5sm107B+0b3HqaN0Cmn2lCQf2zPzb0NhtXrVtI8
X-Gm-Gg: AY/fxX4XSlEuCCcGyKhkUM001O0jGaZkDOweX01eY28IAxlUBmD5ZhiKZ8yWSnp9Tco
	R14kdlvJjuHX9BbXno/bZRbIAL6UxehuJ69OUVCtruqj4FM+O8iqgdhp5yzCs7P+UvcWqmZ9yVn
	QTYvqFnIM/pGug8fZgaUAiCZVjnfLuS3MQR5IDQiIaF+kNYtxNSBOxkFYCQpseVRzDSF8E0loZD
	zfkMDXGhKNxiFNgtSNxvpXNz1R5UgdAcef3w8nV1vHlWy8va9AtW8DhDedOn+7Pt92zYkedGk58
	82odC7cb/NMl4yy1O4SwaykAfb3evoW1Yvx8uJ/MWm0PXkUQc913vnmHxOtxE3XQjRXRdjf1GhJ
	XjFg985QVccSzw3k/8PeW+BKwnoCdkaJe5+OF6LuJ+EQTh5xH4Q+nntvkq+k2BMm+Mwl3+Fl7NK
	WDR8Ke6h2EJOLb9YjHfuebEzKFA4fkCVLcLwqrTJvO0EzIa/SEnkqfzIuDZ5eV
X-Google-Smtp-Source: AGHT+IGqZdvsa9qrrk41pbgJyCnLU/uTvWHuK5mZbC2na/11qasONszSEAtMuEMRkW1aJ5z+6iCrFQ==
X-Received: by 2002:a05:7300:7253:b0:2a4:75f1:fb27 with SMTP id 5a478bee46e88-2b17d2ecae7mr18616908eec.25.1768228927519;
        Mon, 12 Jan 2026 06:42:07 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707b2256sm15071735eec.25.2026.01.12.06.42.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 06:42:06 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5e223091-9748-46c5-8e99-a894655f8bc8@roeck-us.net>
Date: Mon, 12 Jan 2026 06:42:04 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] hwmon: spd5118: Avoid hardware access during suspend
 and resume
To: Tinsae Tadesse <tinsaetadesse2015@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260110172003.13969-1-tinsaetadesse2015@gmail.com>
 <20260110172003.13969-3-tinsaetadesse2015@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260110172003.13969-3-tinsaetadesse2015@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/10/26 09:19, Tinsae Tadesse wrote:
> The SPD5118 hub may be inaccessible during suspend/resume.
> Avoid updating/writing hardware in PM callbacks by switching the regmap
> to cache-only mode during suspend and deferring synchronization
> until first access.
> 
> This prevents the below I2C errors and async resume failures.
> 
> spd5118 ...: Failed to write b = 0: -6
> spd5118 ...: PM: dpm_run_callback(): spd5118_resume returns -6
> spd5118 ...: PM: failed to resume async: error -6
> 
> Signed-off-by: Tinsae Tadesse <tinsaetadesse2015@gmail.com>
> ---
>   drivers/hwmon/spd5118.c | 36 ++++++++++--------------------------
>   1 file changed, 10 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
> index 63f798991363..a8afde7f47b2 100644
> --- a/drivers/hwmon/spd5118.c
> +++ b/drivers/hwmon/spd5118.c
> @@ -494,25 +494,12 @@ static const struct regmap_config spd5118_regmap16_config = {
>   static int spd5118_suspend(struct device *dev)
>   {
>   	struct spd5118_data *data = dev_get_drvdata(dev);
> -	struct regmap *regmap = data->regmap;
> -	u32 regval;
> -	int err;
>   
>   	/*
> -	 * Make sure the configuration register in the regmap cache is current
> -	 * before bypassing it.
> +	 * The SPD5118 hub may be inaccessible; avoid hardware access.
>   	 */
> -	err = regmap_read(regmap, SPD5118_REG_TEMP_CONFIG, &regval);
> -	if (err < 0)
> -		return err;
> -

There was a reason for this code. If the register was never read,
the regmap cache will not contain the correct and expected values.

> -	regcache_cache_bypass(regmap, true);
> -	regmap_update_bits(regmap, SPD5118_REG_TEMP_CONFIG, SPD5118_TS_DISABLE,
> -			   SPD5118_TS_DISABLE);

The point of this code was to disable the sensors during suspend.
Leaving the sensors enabled defeats the purpose of the suspend function.

Something is seriously broken in the system configuration if the i2c
controller suspends early, before the devices connected to it had a chance
to suspend. Maybe that should be fixed instead ?

> -	regcache_cache_bypass(regmap, false);
> -
> -	regcache_cache_only(regmap, true);
> -	regcache_mark_dirty(regmap);
> +	regcache_cache_only(data->regmap, true);
> +	regcache_mark_dirty(data->regmap);

It seems you dislike local variables. That is not a reason for removing them.

Guenter

>   
>   	return 0;
>   }
> @@ -520,16 +507,13 @@ static int spd5118_suspend(struct device *dev)
>   static int spd5118_resume(struct device *dev)
>   {
>   	struct spd5118_data *data = dev_get_drvdata(dev);
> -	struct regmap *regmap = data->regmap;
> -	int ret;
> -
> -	regcache_cache_only(regmap, false);
> -	ret = regcache_sync(regmap);
> -	if(ret == -ENXIO || ret == -EIO) {
> -		dev_warn(dev, "SPD hub not responding on resume (%d), deferring init\n", ret);
> -		return 0;
> -	}
> -	return ret;
> +	
> +	/*
> +	 * Re-enable hardware access; sync is deferred until first read.
> +	 */
> +	regcache_cache_only(data->regmap, false);
> +	
> +	return 0;
>   }
>   
>   static DEFINE_SIMPLE_DEV_PM_OPS(spd5118_pm_ops, spd5118_suspend, spd5118_resume);

