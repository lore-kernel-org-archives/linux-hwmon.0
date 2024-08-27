Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76795179A8
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Aug 2024 04:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724731365; cv=none; b=Z986cG6PqJD0z7DAFWwWLGg7ntlPBhJs4Ew7LAHZWcVo14XSZey0e1xQPuIrpu61XBgN9Ax/6hrBrwAPWR9AbhoEBADFEzbd3z1BWu9ZAVvFPJR1xUEJVQ4B+TYccHR59+vD8MeE2cBlsjOms6nL1yC9u4SsQvg+D2fapcLQxPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724731365; c=relaxed/simple;
	bh=Qo8HRZosBkIYXHIWaP2qBw9glZ88M6BpYJatZZl3Kw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mEU9vq/wmYyKDZmrkAWmopN+EL+zNfiILMzOnx0moAGNERZabmk/2lpiZ7GPkWmXlDFQ2mYfQrP+iuIOcp2nxgvfuh0ayjkl7GAqZH63YeOVuw61t5Hc5gyjO6dt+CYUSTVkcJPnij/Gvsw6ws3xkAKf3HHz8IEbVA5/1LA+dAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XRyds8hJ; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XRyds8hJ"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2025031eb60so43513865ad.3
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Aug 2024 21:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724731363; x=1725336163; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=sxj5XA4VQ98pERvtNk+jc+StB2E0pH7LOxlmKgsbWWg=;
        b=XRyds8hJ+dmc3fkpxeqpdlytXcQmA7xEmBF5PDw7KRqjsVsKdULspsZUoT5+1GDv3S
         NlnfE7XpKwH4T//b1CZnYNhNoTjti0XQvGVSU6tcyqC5GVl4aitr5+vmLgRQlBVRnDlE
         Yzn+KtnB6iM/OWvA8y2kH+WoAdT+Rdp18CSJ5BDka6MGJrMVlp207xjFDJ5VUxkbPiAe
         XVgIDJ+9fevmzl7RUOHtEDcKs+TphcOCjM3aCW9/kIEtAS/rgqyh5PQbxFfgriBZHeJ7
         J+uQd9M7bdGQur0ab18xD9vyhUoWRURcN9MksHUTup56TLd/kgZ0B/JaahFghLhVAUcB
         xl2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724731363; x=1725336163;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sxj5XA4VQ98pERvtNk+jc+StB2E0pH7LOxlmKgsbWWg=;
        b=KR4P4ecqs+jnu0PFFOR+k+NH2rQCgydshz8XRvWYjOcFC9kLJIGRW72VgFAjyNO6nc
         Rr1qQIthx1jk0/WVx4ux8YcMSwjdMRJS+JovpdD8bPXotwJV7wPqyerpNzvsD1bbPt9x
         IN+V3iwGWIlwPj9aQbfCo38d/r3Bv921lvyQ/UUOuR3j+28gxLuoFNq5x4SI/JNIgEB4
         PLWSvolXwzCN6P21fSiJUcxqWANTCOQosyivocbq62hUrZJ5P23NyaFApwZalbqLNSCg
         WmcdaojVhebvkemhVMdmTvWx57p/f3dK7YxaJpap1gU7bFByL6aPKUEV6v1FRrFhvcij
         mcRA==
X-Forwarded-Encrypted: i=1; AJvYcCXDfmYl+eFhgCI/Pl+7gHyGR5NYqk4KErTpVxn9wRWyywNbBRRdlxOhsTxyGySvXE0NDe4GObykLVsBJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi7MzkiyT5BYDv3r2nvqDPIpfoFSbHuY64Vqguqkfm106rRVTv
	Lp6k9p9qjGnsyeu63B9d5LAc5pEPcBkRbmTxDryzPEephuVrNhix
X-Google-Smtp-Source: AGHT+IHlGOIi3wtsWCFow00y04cNqikvrd5AemXxPvLQ0w6lFg29yRk6QTplzDj3y2zBFZnI0ma2Cg==
X-Received: by 2002:a17:902:db09:b0:1fc:6a13:a39f with SMTP id d9443c01a7336-2039e48a2eemr167532585ad.25.1724731362672;
        Mon, 26 Aug 2024 21:02:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203859ef177sm74689925ad.243.2024.08.26.21.02.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 21:02:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6fae9326-808a-433e-bd12-f7776158980a@roeck-us.net>
Date: Mon, 26 Aug 2024 21:02:40 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: pwmfan: do not force disable pwm controller
To: mailinflist1@johanneskirchmair.de, linux-hwmon@vger.kernel.org
Cc: groeck7@gmail.com, Johannes Kirchmair <johannes.kirchmair@skidata.com>
References: <20240819070649.333505-1-mailinflist1@johanneskirchmair.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240819070649.333505-1-mailinflist1@johanneskirchmair.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/19/24 00:06, mailinflist1@johanneskirchmair.de wrote:
> From: Johannes Kirchmair <johannes.kirchmair@skidata.com>
> 
> The pwm1_enable attribute of the pwmfan driver influences the mode of
> operation, especially in case of a requested pwm1 duty cycle of zero.
> Especially setting pwm1_enable to two, should keep the pwm controller
> enabled even if the duty cycle is set to zero [1].
> 
> This is not the case at the moment, as the pwm controller is disabled
> always if pwm1 is set to zero.
> 
> This commit tries to fix this behavior.
> 
> [1] https://docs.kernel.org/hwmon/pwm-fan.html
> 
> Signed-off-by: Johannes Kirchmair <johannes.kirchmair@skidata.com>

I do not accept patches without change log.

Guenter

> ---
>   drivers/hwmon/pwm-fan.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> index a1712649b07e..c434db4656e7 100644
> --- a/drivers/hwmon/pwm-fan.c
> +++ b/drivers/hwmon/pwm-fan.c
> @@ -167,7 +167,7 @@ static int pwm_fan_power_on(struct pwm_fan_ctx *ctx)
>   	return ret;
>   }
>   
> -static int pwm_fan_power_off(struct pwm_fan_ctx *ctx)
> +static int pwm_fan_power_off(struct pwm_fan_ctx *ctx, bool force_disable)
>   {
>   	struct pwm_state *state = &ctx->pwm_state;
>   	bool enable_regulator = false;
> @@ -180,7 +180,8 @@ static int pwm_fan_power_off(struct pwm_fan_ctx *ctx)
>   				    state,
>   				    &enable_regulator);
>   
> -	state->enabled = false;
> +	if (force_disable)
> +		state->enabled = false;
>   	state->duty_cycle = 0;
>   	ret = pwm_apply_might_sleep(ctx->pwm, state);
>   	if (ret) {
> @@ -213,7 +214,7 @@ static int  __set_pwm(struct pwm_fan_ctx *ctx, unsigned long pwm)
>   			return ret;
>   		ret = pwm_fan_power_on(ctx);
>   	} else {
> -		ret = pwm_fan_power_off(ctx);
> +		ret = pwm_fan_power_off(ctx, false);
>   	}
>   	if (!ret)
>   		ctx->pwm_value = pwm;
> @@ -468,7 +469,7 @@ static void pwm_fan_cleanup(void *__ctx)
>   	del_timer_sync(&ctx->rpm_timer);
>   	/* Switch off everything */
>   	ctx->enable_mode = pwm_disable_reg_disable;
> -	pwm_fan_power_off(ctx);
> +	pwm_fan_power_off(ctx, true);
>   }
>   
>   static int pwm_fan_probe(struct platform_device *pdev)
> @@ -661,7 +662,7 @@ static int pwm_fan_suspend(struct device *dev)
>   {
>   	struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
>   
> -	return pwm_fan_power_off(ctx);
> +	return pwm_fan_power_off(ctx, true);
>   }
>   
>   static int pwm_fan_resume(struct device *dev)

