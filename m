Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4561D32D0DE
	for <linux-hwmon@vger.kernel.org>; Fri,  6 Mar 2026 16:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772813587; cv=none; b=JncOD/rFeWmmBZacxovZb7i+pmBnBEshFKVh1/SUo7nXnFMmuf8toNxTzlYOsc1t1w8UsN3/XLzRhxHQ4nW0D1u2KvBROQt+PtC0ciF6R9RH7FUuuxpw1VqZcxjSHIzQqdHFuST9OT1SQ//stEVxYtBlgGkgHEGfNkfJX++0N38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772813587; c=relaxed/simple;
	bh=GbHZvMrlDjk98tFLySxmu7d7hM4MTcgCQPURO46KJPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQCEjqxWF7PdSlXHkFA0XstHf+Z2YYBb5SeKh4DuD/Fal5IEz6ue07CFjo4nttduNL2baSxXxTbVTeRiAFFl5tTATtIOyFCkEQbE/bYAb4iiwdJ58FCfmFwlvskB0cc2ePc54DPY7itjjhx9d1lYbkr203UM66NfeB+7JrVO2x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WcJ4ELEf; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WcJ4ELEf"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2be1ab1fa7dso534696eec.0
        for <linux-hwmon@vger.kernel.org>; Fri, 06 Mar 2026 08:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772813584; x=1773418384; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ExyNVSWsZEiPhZCTeAKx/MrxZrOY+AoCmCT2YcRTRo=;
        b=WcJ4ELEfu5j/mE0YjraLcHB+98yCpJoKbx+g8pRRZKw6ifhjvGWDZwVhUwAHnCq6Pp
         T6VMjZCl9AFwb7ZqHd7jFYhz+Uj7z60SzlzyuKxv+JTUXpcGmGK9WMXmha3l4fg2Hnmg
         R4RN99bLTJ6uR2dEclau1N7hk74ULzrVbWQd1qTm67Kizm28UpiUnUh+RG+BazEyI0zP
         frqfrzrBqYt/Ey9OEB6ELMw+AMOIn08U5A5BrJ2tIXMe6HXijO7UdqNCSusnkzjBQMKh
         q6uk3H+y0xV5n7gaqnAJUnxgBluACxN7nIgBep/ZKWEHW1XcGyTL4f9bklRqZzuZ8nEG
         3ikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772813584; x=1773418384;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2ExyNVSWsZEiPhZCTeAKx/MrxZrOY+AoCmCT2YcRTRo=;
        b=wMhZlJoN9RwPmm9cA3tTs6U+kcdNKCq4xCDLF3gHq7X/iaI2PbW3bmpXDzI9fSpcS+
         yNSUyINZj5DZGmFwjB5pWUGcE8MLHcw4toYEQsFqR0rK9PUYtS6LYBOksIgAXz83LI1I
         NDhoYSdla0Wna7B4iWsOsXeyDiz03biAKC0AbflCXcVsANap3hkB6BrWC8IEaMklxOkB
         qx0Eqwb83lXWbQIxPL4ogMfHA/9LWsCK7Ng7vuXWNNhumTop+T3h5oAQb/aq1s8bnsrk
         uh5mvBdB+/sAdZHh6V0KGYRb5K9zNJyc2sbNUvA63GGo/wh2+QyDlGOtjXzOfeQRCRbD
         9Q7w==
X-Forwarded-Encrypted: i=1; AJvYcCV1Tb8//JKTgzisEsh09cEBsaXoUoAPrSfXpOfjLVqd/m/skkC7I8deqR+Yt+Sa58GQqJkl53weH/aEXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxM7WRSvQuETxZTmR6F9reNnGtL6KGuqySdDaP/mALj9rT+M9z
	kEoQvMJTa7bTWlF7oU5+4/vlM1JAqbUvby8Oz9am7p1h3huO/NxkmpuH
X-Gm-Gg: ATEYQzzEQKV+sAri5G+p34KOOKzMpkkIrP8CCSySlizhW/VQbd/RKL6MIjsKYuJAro/
	M9oF135qs7VJjTVyG94tPcD+bXtnpmOXsGHthhyfC/ln5K5+UTknHFc6F0X8M3jfhRVNGSvC83s
	baUH4tk30uyZLy9IJOFiLyyUQ36tturNsLqlHkccHtQ6w54Y8d428K5pk3HN+EYj5rr7gex9Ylj
	vrp10AL2IVknqqvt2woH6nTfJ96xpjbeFT8LwVmBTKsrWUCHa4iiO3fhFkGhIwKsMNM9yUN/rYV
	1JpH2sJwuF9F+eKdOVVtwuwUqNK1wD+tuRx0kIGfxWS1O1Rt7jSIHxl2LsRD1xcB/jrzAl5ZW0r
	10bKIqgOwiuugaQp5oWIQ74/QL6CGBsZxlosXBE4HFT1yBoW31Xq3GuZbLib8lP8wQxCTIajAL1
	3GIgSEpMD5FiRtErUmxrS0m7p/UpikOOSJ4xXK
X-Received: by 2002:a05:7300:320a:b0:2b7:fdb6:ccf2 with SMTP id 5a478bee46e88-2be4de99574mr1150793eec.13.1772813584166;
        Fri, 06 Mar 2026 08:13:04 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f94823esm1578036eec.20.2026.03.06.08.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:13:03 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 6 Mar 2026 08:13:02 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (aspeed-g6-pwm-tach): fix driver data handling in
 probe/remove
Message-ID: <e6c06c88-d2cd-4501-8a15-b89ba5a36e5f@roeck-us.net>
References: <20260306-pwm_fixes-v1-1-e8ede6fbaf47@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-pwm_fixes-v1-1-e8ede6fbaf47@aspeedtech.com>

On Fri, Mar 06, 2026 at 02:44:31PM +0800, Billy Tsai wrote:
> Ensure proper association of driver data by setting and retrieving
> the platform device's driver data during probe and remove.
> 
> Fixes: 7e1449cd15d1 ("hwmon: (aspeed-g6-pwm-tacho): Support for ASPEED g6 PWM/Fan tach")
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  drivers/hwmon/aspeed-g6-pwm-tach.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/aspeed-g6-pwm-tach.c b/drivers/hwmon/aspeed-g6-pwm-tach.c
> index 44e1ecba205d..0c03d272279a 100644
> --- a/drivers/hwmon/aspeed-g6-pwm-tach.c
> +++ b/drivers/hwmon/aspeed-g6-pwm-tach.c
> @@ -490,6 +490,7 @@ static int aspeed_pwm_tach_probe(struct platform_device *pdev)
>  	if (IS_ERR(chip))
>  		return PTR_ERR(chip);
>  
> +	platform_set_drvdata(pdev, chip);
>  	pwmchip_set_drvdata(chip, priv);
>  	chip->ops = &aspeed_pwm_ops;
>  
> @@ -519,7 +520,8 @@ static int aspeed_pwm_tach_probe(struct platform_device *pdev)
>  
>  static void aspeed_pwm_tach_remove(struct platform_device *pdev)
>  {
> -	struct aspeed_pwm_tach_data *priv = platform_get_drvdata(pdev);
> +	struct pwm_chip *chip = platform_get_drvdata(pdev);
> +	struct aspeed_pwm_tach_data *priv = aspeed_pwm_chip_to_data(chip);
>  
>  	reset_control_assert(priv->reset);

AI review has the same (and more) concerns. Here is what it has to say:

Does asserting the reset here place the hardware into reset while the sysfs
interfaces are still active?

Since probe uses devm_pwmchip_add() and
devm_hwmon_device_register_with_info(), those devices are unregistered
during devres cleanup, which happens after this remove function returns. If
userspace accesses the devices before devres cleanup finishes, it could
access an IP block that is in reset and cause a system hang.

Also, since probe already registers a devres action
(devm_add_action_or_reset()) to call aspeed_pwm_tach_reset_assert(),
this explicit assert appears to be redundant. Can the remove function be
dropped entirely?

This isn't a bug, but probe calls of_platform_populate() without a
corresponding of_platform_depopulate(). Using
devm_of_platform_populate() in probe would fix the leak and allow
deleting this remove function.

I think all those points are valid.

Thanks,
Guenter
