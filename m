Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8F038F954
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 16:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785257452; cv=none; b=fnyAPMUuNFJTlMvkXFkCgDzR4/wfS36SVT/wfbWRmjzQzZN5iOwRWOOjT6012qGkKRb3H2atjQxOsPZgKJdBfs0M7/dutO4XW2IJ7r0WsbHuAs+WHsYYnQVHaHumwl1shtr8/GV7FBWQn3KsdOd7iFkX+/N+BzZdmGO9jTf3wEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785257452; c=relaxed/simple;
	bh=bbkrfyJll4eWbTc3P2oc8Elb695J0eIeWk3HsEK/mOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jNtKFx6A1cneZDv+e+8Gr97OU9trtK3pA5PqhSbI7eNkUC5rbq8GiDOEv/DDJwi/VmCuRQB3mUnUok7KgmNoL9QTn9R/TWpBjnkcWaDqSVI0kUZphazNhvEurLzDXodXXukbu3Q/c35gXZEtAKj3VACZBgx13brjq1HEXBQCobg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RR0tI4Hs; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RR0tI4Hs"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cacb8416a1so1197095ad.1
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 09:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785257449; x=1785862249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rLI3SUHYloKuFEV3J0EFy8MLCezNoniF4Af9gyaTZYY=;
        b=RR0tI4HsinvibXv87R/UNlNgAtbCje0ZyhaATQpBY30f7CODJNuXF0VrrdIlI7HeoD
         g55gAYR41Nc1/HG/4nf7LVUaioVocLeQl4C7I6av9KONjY34fPPwlrOgT5AGFQKWWs/2
         I+I2Nz2BgyP6fVziXpVlBa/45kJiKPt/KgnI9hTn5FrDwagbWtcT+zz8WDtGekBvrht+
         8fKlSOp1PvVVHayOva+xaBy47SdEWnbZ7vvyFEUPS4UegAsdi5LEKHq79TJDMOhWO7Di
         VUGiFy6fdKIRmMRu96vbdvAUcmHmiZ0Z3C2JZIPz+ktTfmZKp6I7tqt/p6ES2ihN7/FB
         QQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785257449; x=1785862249;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rLI3SUHYloKuFEV3J0EFy8MLCezNoniF4Af9gyaTZYY=;
        b=mdKSFuaFBU+K1OlTedfynoOOT/2wcZjR613+fO6Q6d029//wkFeeybJ5AD+BQqU6i9
         B1+uDEdpV1Z1Ke0z9mF2pNVycCYDDYVJ2IaR2IpCo/mgACGx063UeyBYqj9I3ErmEXjy
         PRxSOAXvwRMLGS6aLf7DOptvg2OrVOmkDtTjvIKRZUnA2jYctbJpDlzYjjgd7tP6bccF
         sZ+vRInp6RFK8Rv45wnR69j5VS3nN6fUntANXXQxGxij6vaGpvGlApKrus6szQwn40CN
         HWcY2uSNLtZoeYvgTmXsRqn3cNyXFmFHL08LoWrW0GjZTHhxHQFaOHAMFnB/hK2dzQ9Q
         lZ5g==
X-Forwarded-Encrypted: i=1; AHgh+RpF9PnDo+HVMbDUH5tjVq+eQfPbM/FgYDA+ZHyF4XVcwf12CyAgIqaPqyMxbUrptyl1UZ3Bj5PjFMnKRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlXn7XICHJMvX0NhTpHMxjQnjQrq8vgY2erZQxGUKkuBnWBq0+
	FEgIQLbetF3hzxp3Cjp7Cth2sO5yl8GlMQooG/oDmhm5Vpu78FTjFzDP
X-Gm-Gg: AR+sD12iS3CbOTbYD6xrmZHziOD3jLc4eUPxFDrAeOL7Ed1ulHdWIUsThxVB6mgbnw2
	dXlwD9rEulhQluM1PFTf8izG3trbgiMyG+tBC/hjc9DMOMs4e2wWzW1bW+5I70G9ZepXffRFz5o
	qd6SD3/p9i+eVeQnn0w+FMKwlVJCgv2hstJ7wv+Lmef3oUfynaM6SxtbDY3N6IxJ5qfdkWQwr3b
	2lcOY9YAS8/958cRhPXlSJu4ieqaYdhoq1JbdEhPw9fWL5/xXTf+AsG5c4Qqm5Udi+mkkTndmJS
	VpwTum20XxfzjVepOPANtwWMi9ErfOLG1bDSLp3hiAp5dB6Itt1bdIug8g5lX95I7ZUEBUCg2u5
	xyY0sQFMkm/n0hqdSxUxaslzV+0QTKVKi7i/xKlqAX/5UOoXkbqJkRpsyRV8nG9huF3GPZvF4Hn
	ksUVJ4VHTuki7IJKg6ciFYQRVeioHb9DItRvLNFJGCK8hfy+c+JY0Nid/0VdY27Q==
X-Received: by 2002:a17:902:ffcf:b0:2c9:97a8:aff4 with SMTP id d9443c01a7336-2d015da371amr36731815ad.45.1785257448612;
        Tue, 28 Jul 2026 09:50:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde80ee56sm55353295ad.76.2026.07.28.09.50.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 09:50:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <67a9f9ef-3007-4f62-9af7-7604a8771f4f@roeck-us.net>
Date: Tue, 28 Jul 2026 09:50:46 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (cros_ec): Hide unconfigured temperature
 thresholds
To: dhs@frame.work, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tzung-Bi Shih <tzungbi@kernel.org>, linux@frame.work
References: <20260729-crosec-hwmon-warn-default-v1-1-d1eb39656a60@frame.work>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260729-crosec-hwmon-warn-default-v1-1-d1eb39656a60@frame.work>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/28/26 09:38, Daniel Schaefer via B4 Relay wrote:
> From: Daniel Schaefer <dhs@frame.work>
> 
> The EC reports a threshold of 0 K for host thresholds that are not
> configured. Most Framework Computer systems don't use all thresholds.
> E.g. temp_host_warn is left unset and stays at its -273 C / 0 K
> default), see the EC code in zephyr/shim/src/thermal.c:
> 
>    DT_PROP_OR(node_id, temp_host_warn,  -273)
> 
> Previously these unconfigured thresholds were exposed as sysfs limits
> that read back as -273.15 C, which userspace (e.g. s-tui) interpreted as
> a real, permanently-exceeded limit.
> 
> To avoid this we can hide the sysfs attribute for that threshold.
> See truncated example below.
> 

Is the limit just not configured or indeed unsupported ?

If it is indeed unsupported, this is ok. If it is supported but not set
(and it is configurable), this is not ok and will require a better solution.

Guenter

> Before:
> 
>> sensors cros_ec-isa-000c
> cpu_f75303@4d:       +36.9°C  (crit = +74.8°C, emerg = +84.8°C)
> 
> After:
> 
>> sensors cros_ec-isa-000c
> cpu_f75303@4d:       +36.9°C  (high = -273.1°C, crit = +74.8°C)
>                                (emerg = +84.8°C)
> 
> Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> Cc: Thomas Weißschuh <linux@weissschuh.net>
> Cc: linux@frame.work
> Signed-off-by: Daniel Schaefer <dhs@frame.work>
> ---
>   drivers/hwmon/cros_ec_hwmon.c | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> index 03bfcc40bb7c..57158443dafe 100644
> --- a/drivers/hwmon/cros_ec_hwmon.c
> +++ b/drivers/hwmon/cros_ec_hwmon.c
> @@ -319,6 +319,7 @@ static umode_t cros_ec_hwmon_is_visible(const void *data, enum hwmon_sensor_type
>   					u32 attr, int channel)
>   {
>   	const struct cros_ec_hwmon_priv *priv = data;
> +	u32 threshold;
>   	u16 speed;
>   
>   	if (type == hwmon_fan) {
> @@ -334,8 +335,17 @@ static umode_t cros_ec_hwmon_is_visible(const void *data, enum hwmon_sensor_type
>   	} else if (type == hwmon_temp) {
>   		if (priv->temp_sensor_names[channel]) {
>   			if (cros_ec_hwmon_attr_is_temp_threshold(attr)) {
> -				if (priv->temp_threshold_supported)
> -					return 0444;
> +				if (!priv->temp_threshold_supported)
> +					return 0;
> +
> +				if (cros_ec_hwmon_read_temp_threshold(priv->cros_ec, channel,
> +								      cros_ec_hwmon_attr_to_thres(attr),
> +								      &threshold) != 0)
> +					return 0;
> +				if (threshold == 0)
> +					return 0;
> +
> +				return 0444;
>   			} else {
>   				return 0444;
>   			}
> 
> ---
> base-commit: 58717b2a1365d06c8c64b72aa948541b53fe31eb
> change-id: 20260729-crosec-hwmon-warn-default-9f3ca86ed809
> 
> Best regards,

