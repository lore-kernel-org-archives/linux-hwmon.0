Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33231303CA0
	for <linux-hwmon@vger.kernel.org>; Wed, 26 Nov 2025 15:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764171907; cv=none; b=F3bFvmnnVRXaOHdjUbldpM3Eq5lMcP9ByfqPaBUt/A0mBGLz6l1rSi8lrGULsEFiioIQTfD2+towaPkFyB4yoCuYS1cEh7ElSyQg0dLOGWk5MiToEL9WrgAr08luPJp+ATR7f0ZiMiPUeBVU/cSb0nj4lHpYKlmgG9vxkH1Vmmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764171907; c=relaxed/simple;
	bh=/Z+r7IB9MjkaVzM9LGSZ+LuTnwiJEaJlODiWc3QOdWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kksLMrMaoyXwQSK06aHp9J52MXmxTllh1hwCcwFyjQwYoeqU5rFnlY9To4zo6Md1r0GSU20zl/bR+G7knC1degmPJ+O8TrVBLEPNDrQpuaXijJ4rYlRqgmy+ORm/BveLbKo4TUIhb2pX+4Km8NMdIhpEkQTBY448BJ+01oWDe+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ze0NCoZs; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ze0NCoZs"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b9f1d0126e6so470021a12.1
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Nov 2025 07:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764171904; x=1764776704; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=wFsRGdeN4OA4/dLsV/CJjEiI3afskvMujNE/U+D52Wk=;
        b=Ze0NCoZswelyD3nQ3msOKOEBE2o7dsKNtGvauqt2NPMKRCjwwlYCx7cAp9TH7G2mUb
         yiCNv/FelWzXj5eLOWFRXmf6PDq/sRyHKILbxLWtP7mOxcCdjYRYp0W1v3ZsDEs9yh7L
         c2fuXNFcQFMjzNTl6vfW8SHJIw2jXPzOTZ3Hmgq/Msh4qzMYOiDfWLuzwgDGg6cEdX48
         10EjU6D+3bL1NOpWNujrPmx1K4EN5bv//FLaUkMflF3I1DItYYfDWWLu1Dc31RycxS7W
         aFXEV0blW+OpEFEnF9CBu8iGw173fokOdjzh4Y/Y81FwVJuZLA18dDpedgqX/p6hkr3e
         0Pog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764171904; x=1764776704;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wFsRGdeN4OA4/dLsV/CJjEiI3afskvMujNE/U+D52Wk=;
        b=NqqpHeir2RPIqewmOHfjRUj3pFHJ0skWSxMqrjLExfoJB1LnKFlG9B7Ih7C80DOpXn
         UxDmwbqBUICH0GBBExVMjc2dSqDhxxWzR6McrZlUv/mEF2PH8EyZucBPi11vJ8ymgpYo
         B5vvMsjSdwJC2SJqmbcWrwlrkRid8JR98q/1cCsbApemXvZD1OHsnOnsCSisM554sWFN
         Tv1hwTC2T3oy50NckzxwATMyNVARN9uHim932Wt4Vc98At397Mndmd/k3LC55XmhE8xn
         2m7o3SMWeAGeemH5XZ6puGf+8mf2FqfGwQl3/ihuJ75ZuZmavI2+3J76dwMvH21rDIXp
         yRxA==
X-Gm-Message-State: AOJu0YyYDu1LkjALLjkbztyjznRP9xVilY4Ke05C1aHeEEBsyU2XUTG6
	JDTRTjCg2NiqLORATJFS474N0Hz4qYaHscV8aDLtRjQD4D+Xus0pnysM
X-Gm-Gg: ASbGnctFIlWafvbyPrmuHcOyDbN+2tcD6KHHy75hdaiuoX/XC98FDAvjsLtdCgCOzlC
	29eWXdoSSygwxSNc1sQ6Ub1izFQwJd3MN1isyRk164qR5XUAe2U7U5r/Q0Jq3UcuaJanaqAlOgj
	Ya4ul5UunaPX+wyJe8u9bTqb8l51ly2RW/z+3OyHLNXqec2w+0VV+7xltteGcuk4P/eQOV5zbPa
	bxOFiAr9xH7nhsmvaaZi3vtfA3hDr5hk55XsuciHHk8F4gQXzwLNDRPiiytRhqzXlDf+nkrpstu
	qLL3finAqqZaQv6KiKVuOZSTWUAfdMhHcPUQvrvTbQSJKvM6KFpR5FOY1ikzx4OSrkvQ7wV91KV
	luCk0RLm2ZzeDBbAiIWqkIVJuMW9pAPyT1Jvk//o2F+90Km3VBZUBcB/gOmIVwlX88O/uxttpyq
	gaHGMEmD4HwSHKAMS38JIfJTwpcdOGjk0ZScvrRSfn/H4awzX6TLf7uxS7TO0=
X-Google-Smtp-Source: AGHT+IGTVuPnrT66Ja9jQsi3WOADYBAzr0Zyovxmir/lzSD4+hF8LcQ6iALLuMqRzjCrLfZl1Nox4g==
X-Received: by 2002:a17:90a:e7c7:b0:340:6b6f:4bbf with SMTP id 98e67ed59e1d1-347298dacdcmr24201029a91.18.1764171904250;
        Wed, 26 Nov 2025 07:45:04 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a59444csm3031079a91.8.2025.11.26.07.45.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 07:45:03 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d89fad76-999a-4486-ae77-cb2b17c29bc2@roeck-us.net>
Date: Wed, 26 Nov 2025 07:45:02 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: sy7636a: Fix regulator_enable resource leak on
 error path
To: Haotian Zhang <vulab@iscas.ac.cn>,
 Alistair Francis <alistair@alistair23.me>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251126105445.1810-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251126105445.1810-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/25 02:54, Haotian Zhang wrote:
> In sy7636a_sensor_probe(), regulator_enable() is called but if
> devm_hwmon_device_register_with_info() fails, the function returns
> without calling regulator_disable(), leaving the regulator enabled
> and leaking the reference count.
> 
> Add regulator_disable() call in the error path to properly disable
> the regulator.
> 
> Fixes: de34a4053250 ("hwmon: sy7636a: Add temperature driver for sy7636a")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>   drivers/hwmon/sy7636a-hwmon.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwmon/sy7636a-hwmon.c b/drivers/hwmon/sy7636a-hwmon.c
> index ed110884786b..b8e598a616ad 100644
> --- a/drivers/hwmon/sy7636a-hwmon.c
> +++ b/drivers/hwmon/sy7636a-hwmon.c
> @@ -88,6 +88,7 @@ static int sy7636a_sensor_probe(struct platform_device *pdev)
>   	if (IS_ERR(hwmon_dev)) {
>   		err = PTR_ERR(hwmon_dev);
>   		dev_err(&pdev->dev, "Unable to register hwmon device, returned %d\n", err);
> +		regulator_disable(regulator);

I would suggest to use devm_regulator_get_enable() instead of devm_regulator_get()
instead. That also solves the problem that regulator_disable() is not called when
the driver is removed.

Thanks,
Guenter

