Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA8E3DC4D0
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 21:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785273307; cv=none; b=mlbzKa/ZEYD4KZEjd7I5TNZXxpemDkgmg1E2wwUC7kykzG5yb0CYBjuOjS4zIusw1JzYcKuorTw0vgONg38eDHX3FXbFD48wFI4+uFNwm+EMkPOSbfuLgJDyzpvgxhj2dGuAkpR4u3ZiBWdD1SvVBkX8lRk6wa9wr3CFJMB/is0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785273307; c=relaxed/simple;
	bh=vSaMxr+W/btop39PHqyfqkC45fGdfrxJ6QgL4JoxHfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SZsdb76NTBWGnmTJnmSl5eiSLdH7NFCy0D+M5x0lzeyujNs7XVl331bdr+u4nT5hT4El2Ux54/BEbzc3yLo598CRP9FfXpTpJYdin8rYpEkcIcZU6cXeCwi21OCb/iQJJY3n3XUF4RFyjgk2kkjy+K3eJ2lOv6TLZF1X0F5vEuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LlTGwRRR; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LlTGwRRR"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-caf707e3a70so1026536a12.1
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 14:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785273305; x=1785878105; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ETJTb72goFKmsExh0rWtuWEGrY06VrxO/4I2OvR2Y5g=;
        b=LlTGwRRRY0Ag3rMcZn/IchoYfZw7tfmYC/CeOQsrT0+vmDJS65NokhqAUijaQfRciA
         H135t2RiOUBncXGdbwsrkzo3MslpndaA+vgfdsBu4NwInL1h5IbYwjtTcXeA3QhH83Z4
         CnPh5fAP4ZwoeWGJ/MsjY5OiFZ84lls+2u1E27VdbiY5nzEqnul58RP8FHwAPEAjTWJ8
         ohqhg2ix1lEAjOoLHEPpateJBfPhp2itFxVIw1s7rP6c9Gj5tLWw6elNOkaKiGRFme7G
         YqDG5XHznAQ9XmqEDT+JyMyf0C8Pb17w7YTx4KfeBnPftkpUtgkn4LC7Ty4LmSUQCYV6
         omSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785273305; x=1785878105;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ETJTb72goFKmsExh0rWtuWEGrY06VrxO/4I2OvR2Y5g=;
        b=l/RpXV/Vr2OCysbCy9MGOmkNm0Ei9MEAZblbhfyIj10G1qlKwLnKMww8FMjKqmIHQ4
         AL3nzRLEnlY5EtefWYH6sbiw3ubil1mrga/+l6xxo+JPPaGMh5yMt7Td1JKzMVWg7dPg
         RKoEflWuLNbadvHLcO82vFvydvCMF79bTjRHyhJC1c6YZ+JPNnf3WBY+MbnqAxG1MMO3
         sKxk4xeWbApSshgoRr7Sh3E1GdsGcosAw28nyI6hlksN6tpKFIb6vPMIYaI7CgJB/m4G
         VGqWQRLI+q7flS74PgrxZasKKg2Xxvjlrj8/Bz9avGsiZj+MfAxIjyjVaGJZU3QhzM0b
         pVZA==
X-Forwarded-Encrypted: i=1; AHgh+Rr3FcadsxaoClmrf2hp9QjfCQhT/HFfQpRnFm262Qwc6F0DjljzJZ//YKfu4xXVkcvGpb08WdxtLx+Gmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNAdusD+OOdfagPqMRX3XtiyEiVLOUVqMWblqY+3EvuWyhGwbu
	oFj3bp5aKALJwHpWIPGFGRVdkJCQTcJkdEmHdKnpfYgExGPTqxLqbyc8
X-Gm-Gg: AR+sD12v4wFhhchXUyyFn215boVz0PqBelWKllv20rZk4r47IluncCH/RIXtPus0Acz
	vKvlGekDiz7d1CskebdpaqfVoQ4DcgA4X/uK3zKIqNgI4Sl1Iq0Cyw4B3DrrPX/awal9vqoymRh
	O+13z1FNvH0gQat/UWoZku4eZ27mu/LN5nWoZwII3cvxG1gEkYAB09nKmmnbfyKcC51LGhX6Lig
	I7gtwgOyg4nvl3EDIxIKIPSrHdZfKFrdbfMVDCs0p3T+GS1Shjdvnquj+RJKIe/BuQ1dx7nKX0V
	L7BGUDgYUvfQlcRaohPTr8My2awwYKIc5Y1Cjvo9GUnCA8zvEs6is3R7cgFTMgRPXok96YM5vvC
	cx6t3H7bGKbE7LQP33WuBZ1bG6uS30DabJNpOQkJ8ckMGEE3BgrCySa808shEvADa9sWQqLXRlh
	LQ+ap0Ffq9MvsTFuYLsq9+AUWb7X4nK6t2MzrVSM5PCXr3+BTSwTUEilCq8doWDXvU6F9QzCG0w
	5vOsePzz+rr
X-Received: by 2002:a05:6a21:1bc4:b0:3c3:7dfd:22bb with SMTP id adf61e73a8af0-3c8abb6cdbbmr4297229637.13.1785273305363;
        Tue, 28 Jul 2026 14:15:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdb824d421sm77132a12.10.2026.07.28.14.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 14:15:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 28 Jul 2026 14:15:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Hongyan Xu <getshell@seu.edu.cn>
Cc: jianhao.xu@seu.edu.cn, andrew@codeconstruct.com.au,
	avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
	venture@google.com, yuenn@google.com, benjaminfair@google.com,
	openbmc@lists.ozlabs.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: (npcm750-pwm-fan): stop fan timer on device detach
Message-ID: <851962b9-10a0-4fbf-a962-4c2981ba647c@roeck-us.net>
References: <20260728075535.251-1-getshell@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728075535.251-1-getshell@seu.edu.cn>

On Tue, Jul 28, 2026 at 03:55:35PM +0800, Hongyan Xu wrote:
> When a fan tach channel is present, npcm7xx_pwm_fan_probe() starts
> fan_timer. The timer callback polls tach state and rearms the timer, but
> the driver has no remove callback or devm cleanup action to stop it. On
> device detach, the devm-managed driver data and I/O mappings can be
> released while the timer is still pending or running.
> 
> Register a devm cleanup action before starting the timer and shut the
> timer down synchronously from that action.
> 
> This issue was found by a static analysis tool.
> 
> Fixes: f1fd4a4db777 ("hwmon: Add NPCM7xx PWM and Fan driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
> ---
>  drivers/hwmon/npcm750-pwm-fan.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/npcm750-pwm-fan.c b/drivers/hwmon/npcm750-pwm-fan.c
> index aea0b8659f5..6503d28ed7b 100644
> --- a/drivers/hwmon/npcm750-pwm-fan.c
> +++ b/drivers/hwmon/npcm750-pwm-fan.c
> @@ -358,6 +358,13 @@ static void npcm7xx_fan_polling(struct timer_list *t)
>  	add_timer(&data->fan_timer);
>  }
>  
> +static void npcm7xx_fan_cleanup(void *data)
> +{
> +	struct npcm7xx_pwm_fan_data *fan_data = data;
> +
> +	timer_shutdown_sync(&fan_data->fan_timer);

Why not pass the pointer to the timer as parameter to devm_add_action_or_reset()
and just pass it on here ?

> +}
> +
>  static inline void npcm7xx_fan_compute(struct npcm7xx_pwm_fan_data *data,
>  				       u8 fan, u8 cmp, u8 fan_id, u8 flag_int,
>  				       u8 flag_mode, u8 flag_clear)
> @@ -1016,10 +1023,16 @@ static int npcm7xx_pwm_fan_probe(struct platform_device *pdev)
>  	for (i = 0; i < NPCM7XX_FAN_MAX_CHN_NUM; i++) {
>  		if (data->fan_present[i]) {
>  			/* fan timer initialization */
> -			data->fan_timer.expires = jiffies +
> -				msecs_to_jiffies(NPCM7XX_FAN_POLL_TIMER_200MS);
>  			timer_setup(&data->fan_timer,
>  				    npcm7xx_fan_polling, 0);
> +			ret = devm_add_action_or_reset(dev,
> +						       npcm7xx_fan_cleanup,
> +						       data);
> +			if (ret)
> +				return ret;
> +
> +			data->fan_timer.expires = jiffies +
> +				msecs_to_jiffies(NPCM7XX_FAN_POLL_TIMER_200MS);

Your patch does not explain why this assignment needed to be moved. Please either
explain or keep at the original location to reduce the size of the diff.

Thanks,
Guenter

>  			add_timer(&data->fan_timer);
>  			break;
>  		}
