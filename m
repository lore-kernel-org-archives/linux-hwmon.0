Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9CD47532F
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 15:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789400440; cv=none; b=jemV4WDNGbiYwjKjcxA+Xu2VxGxlfqO4z80RFFNE4ciZP9QozJ50ZN7a7pm82j80Sdwp9ygnwwrH6L0K4NHXMLzO9Rzen2Qin12nA/O1fS+sRUtETezmVPyn9OXQJBM2mv85uhHqzAeSRYUD7mh12VEzHnzNzeGSICXaJHkPFiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789400440; c=relaxed/simple;
	bh=y4gyk5bvbT/WyDOci1LnlzfvK22JUP3pNNSmvEXqp7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q/2cuF/bHieIKyMumcmuEymja40zKzt/nPpWaEqVPRLofYBkHDlwZtLQzkNvFZ36JlDmv4moJhwqEKi7LXl7BmlL6ZX59Hc8o0y9i79xH2PLz9ZPOn0Z1m/vnd1yCq5WAqn/OKZYaWo2Os30YTIcW8/+jdtTRDTcBJC+vNjfuA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LKNTBP9G; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LKNTBP9G"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2db858d60e0so30316085ad.0
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 08:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789400437; x=1790005237; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/JX6uMBQ4W2bKRW3iJ+++fXL4T52MMNAs5QF0F3Amtw=;
        b=LKNTBP9Gn8nKazgDM8QO0YRXYFp38ywMtm1JvhfDnT+zcgcK04pmy6DWTo119mT5VH
         J0v1kropcN0obRePM2JP2iweT0zmYFMd1vNhEIebrNtjG26xSbFQQYvHI07ZtHz4C/Ic
         QEWncjk1ezroZTj7ZqVMKfbFLeuNNeEiUI0++XA5OQiYMfXj6Zzw6oz3vMViHclNX8O4
         pUviCtw359VJfK3SbtAARm5GPhM+iDzyU7lj4AvhI3NbV5yDHgvLPc1JJYLvOhu7abF4
         fOa4izWjWcy4SxI2e7GOZYVbY2CUEjip1xJcKvMEnEDmu94aw3i8s8BCqdFMAfNrlp/6
         7ANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789400437; x=1790005237;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/JX6uMBQ4W2bKRW3iJ+++fXL4T52MMNAs5QF0F3Amtw=;
        b=W18Gp9sRGbRYEzsFGQJDzm2pq+trDCkRsdfthp0B+A/cFp/vVtfNcSQhL820bh2HU2
         05bRFiVtfqfTD+mf3Od71I+yKcCPwq+caXijRkBonWpPy/RjjHpTHpd0oxBlRhyJYATb
         /LvZZ/zg3cQJJVi9pvLIUc+GiovlIxMlmVAOurDoQszelNe4WLIifG6O4ageNa077vYu
         UZCNvWm3jSEqbnHngLOH4515wKjEiOF6EFDYcnDEdM40Q3RCwEEbyrlO0sg32oOFP65r
         WBXW9VgqjzSWmodWoJ19ArVQ8YGhgytAwQdrVnuCElSMeZWdALEFn4OSKUWEbYmjhimv
         73sg==
X-Forwarded-Encrypted: i=1; AKwUvByvcDmxE1BARSR4Xv9O82s/NT1tMaWsByfFJwI2P49heKkDZ/Xzdob0P2cO6UHTYoSDJLRovUNqvgTTfg==@vger.kernel.org
X-Gm-Message-State: AFuF++nu+bkzQZ4qAUQquDi+uYOHLbdbOseRhD/XatX+dPlpre1pLjGK
	4ggMbwMggjHg+M7Do/5pOYanJteCzBHtjNGfBWdifDM1IXEL6Uwe0qoc
X-Gm-Gg: AYBFou2tVn0m12mMWKiifQUyMz6zpADHh9C5h6dhWSqgBNHc8AuUKTvpc4dMa5bsOa8
	L1cbrgcAjb15mj7KfCpr9GyJfaRknX3nubRz4gwwgLvmcO87aC84rY+jhZ9kZyUnuFDlY2/mQG3
	aAA33lqslE2mdybCBHwoDYBpt4nhR4mqyRNkcZGibZK6H81XZm8S95EPJzE2+GKV7BKwlRnuzty
	GdwLM66YiUBNJQJs3KOWIi3gqFZ2isYCcgIlvgmoYKuhPBUfRLIylW9rDXMpxqCQ05WYDqTr4UX
	s1V4dDPcgbGHZ9m5sOd09g6dQrCa1wKaqn5r/WTcKbOiizsug/CUwB2dsJwoYyCbmpRD1WACz38
	n7yUwJInjO94iHbXx23Jk5ONwtnLX1AN71S7dkgX7u+qr1Wips6dMdmowZk6jOisNZW6x1YWH56
	DysG/V5xng3RQd11bJyC67MDKEM838eD4ey8IYZRCeoaFZvyF0Lm9rbzVMIWYSH+IS9/TPwAX8X
	MLYvXbFiUmafuZjewm0OGUZFaWZLjcX4gp4LIbtRLz180If
X-Received: by 2002:a17:902:e950:b0:2dd:3d1a:6958 with SMTP id d9443c01a7336-2dd6c5f4ef5mr65457375ad.6.1789400437072;
        Mon, 14 Sep 2026 08:40:37 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd561e2af6sm30022435ad.70.2026.09.14.08.40.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 08:40:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <44026532-e454-458a-847a-9e66e7ddc3ad@roeck-us.net>
Date: Mon, 14 Sep 2026 08:40:34 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (gpio-fan) fix use-after-free of alarm_work on
 unbind
To: Cong Nguyen <congnt264@gmail.com>
Cc: Simon Guinot <sguinot@lacie.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260914115448.2039438-1-congnt264@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260914115448.2039438-1-congnt264@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/26 04:54, Cong Nguyen wrote:
> fan_alarm_irq_handler() schedules alarm_work, but nothing ever cancels
> it. free_irq() (via devm) only waits for an in-progress IRQ handler,
> not queued work -- a pending alarm_work can run after fan_data is
> devm-freed, dereferencing it in fan_alarm_notify().
> 
> Cancel it via a devm action registered before devm_request_irq(), so
> teardown frees the IRQ first, then cancels whatever's already queued.
> 
> Fixes: d6fe1360f42e ("hwmon: add generic GPIO fan driver")
> Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/r/20260830152150.27F5F1F000E9@smtp.kernel.org
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-4
> Signed-off-by: Cong Nguyen <congnt264@gmail.com>
> ---
>   drivers/hwmon/gpio-fan.c | 20 +++++++++++++++++++-
>   1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
> index 084828e1e281..b1b57bb63a33 100644
> --- a/drivers/hwmon/gpio-fan.c
> +++ b/drivers/hwmon/gpio-fan.c
> @@ -81,9 +81,16 @@ static ssize_t fan1_alarm_show(struct device *dev,
>   
>   static DEVICE_ATTR_RO(fan1_alarm);
>   
> +static void gpio_fan_cancel_alarm_work(void *data)
> +{
> +	struct gpio_fan_data *fan_data = data;
> +
> +	cancel_work_sync(&fan_data->alarm_work);

I think this still leaves a window on teardown, if an interrupt happens after
the work was canceled. I would suggest to use disable_work_sync() instead.

Thanks,
Guenter
> +}
> +
>   static int fan_alarm_init(struct gpio_fan_data *fan_data)
>   {
> -	int alarm_irq;
> +	int alarm_irq, err;
>   	struct device *dev = fan_data->dev;
>   
>   	/*
> @@ -95,6 +102,17 @@ static int fan_alarm_init(struct gpio_fan_data *fan_data)
>   		return 0;
>   
>   	INIT_WORK(&fan_data->alarm_work, fan_alarm_notify);
> +
> +	/*
> +	 * Register before devm_request_irq() below: LIFO teardown must free
> +	 * the IRQ (stopping new schedule_work() calls) before this cancels
> +	 * whatever alarm_work is already queued or running.
> +	 */
> +	err = devm_add_action_or_reset(dev, gpio_fan_cancel_alarm_work,
> +					fan_data);
> +	if (err)
> +		return err;
> +
>   	irq_set_irq_type(alarm_irq, IRQ_TYPE_EDGE_BOTH);
>   	return devm_request_irq(dev, alarm_irq, fan_alarm_irq_handler,
>   				IRQF_SHARED, "GPIO fan alarm", fan_data);

