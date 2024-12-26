Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572DE2BCF5;
	Thu, 26 Dec 2024 21:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735247052; cv=none; b=INmWunx3iE078VE5SBokQBpVKuMNBhf8RHjGoxs78BWCgy5lnWNrX80rYc2ZJSOy+WqN9PSPToH/Ua8JtaNOvRZRCCoRREXERhRLWf1SRCE8cF7CQmSJQB8kbrRzHOYdWOtSxusPfkgUjd0HgiGPw0huKDN4QYtoM+ISVi8jZiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735247052; c=relaxed/simple;
	bh=fV4HpAu3+65Nq1fyyVvikH3QjtH12JjyMohd0Ems3uY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PDS2fmiAMgsibgvFlfUrtn0C5SKkCjmJJv132b4NFsz5qgN9mHhw5aT1zGWBlR6kDsD/N7i/Xo4oFZ+D0W0qE8VIDPmai+PNjThAKSniYwUMEIFBUumLbGM6rh45UUHHhWA7YBEzqfPmff9eAIB/mxgnVRUD3TxTpI6TZPUOkfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1C71jaX; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1C71jaX"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2f13acbe29bso7616386a91.1;
        Thu, 26 Dec 2024 13:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735247049; x=1735851849; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Fv0dmw4a1MlZSN9IU7fNoeOhmvuFgDbPitU3E7VQj8=;
        b=L1C71jaXrakrNFRjdbNxZcpOHLCzzHN/LSuD+GA0TLUlksCFRVaifWwpc+MULd65DD
         1H0h0bS9nP15Ff5oU/yepiPsTOzgo0AMIqHknHIjZ4M5rE+8UPoSwq5cvLFlj1knxpj3
         NsYskJTUDmV8XM4oh5XzPxzRw/CYmKrZ1gh23003dXw3Shjj3wgckK9VwVlmqFwpcyiT
         My/aTCjogrn++4xfyNvbDrEhIk9+WBm5EGY55O9r6mS2fawWN44ElfklFYE2Wz75LYJc
         AYb0KfErhTvmmT7ZQkoCJtRM4jAwNG2EOuYjnyt2EnbI/DuncYcaNZLD5J9NoNJqcSZl
         MApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735247049; x=1735851849;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Fv0dmw4a1MlZSN9IU7fNoeOhmvuFgDbPitU3E7VQj8=;
        b=SQKoVrmE4f0xz8OvdV9e5ef2UKI6ecHPNiriBjVnyVKT3X2PHt5xoz9+zXVcWyc914
         8xH5vud/MNGOR627i4C3rQEX2Qt3dcgHpYNiAm1IwJFeGpEl0NsjdxmVoNxff/E5yePG
         lemVQiSiHapsLVA3o27m+Pjhqwfsx1PyxX3tSVbGcnnOd3hVLXIPHwlYAYrt1UlBN61M
         JIp2cV2zZc59Rhc5Ri3+V7jV46w2pZUF019YzmQAEXZdypWFbciyWiLIsnyTgEWjCPrw
         zSohsXlBcjDeKHam3Qm7rfDknMYK2ovO+0VOcIIlOQw47jTBterVhjGVvA7OSYNmV4eP
         f4bQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqb8YUYnM//8hivyj9Oh6lrNSCLENQAmrCCtsyJ0TiS6P+OS9z4h6+AL8DZkhMN8Tpez5iQYh940BlIeg1@vger.kernel.org, AJvYcCX+R9xc4SF3V886zd9Rs/PHjUHXbL26y9nnl2+zl9F2xCiLqn7xcxANVkpiJ4X2uO0qS0Clz8wUDQ0vHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmYsIqgzxOF0aM19IgS7dk3gM8W2J4nbIyWzSLbL4BYTbEBu0V
	xLOVtEWofjEi5awlItspKCURSdj06lCsGICPUk09ZT1Aqfy+2JGS
X-Gm-Gg: ASbGncsT1Qnalwn4+Ph2j+MrMG4MKnexH6sZYTlFjbGer2A3RykmX4kDsWyN3nQY2xj
	ShTFDklGb9iHGWOxYDBr5uHIBK/LAt/3aJ63CqtefNRkzMU7aIEa6kpRTh3ZtWlIUDyxkNFdKKj
	0jCIlmWDncXGUYI/celSEbVz0eiaoRhWj7HFNCF+aZ/2NXgB4W22DBLpg5S3Fm2XO9h4MDHzkSY
	bjfgot24OUwtbSmPctoOPssdak7xCVFQK4jbM36pHmVilDOvfAUcGDAr0gJHCd4ZcPtLQ==
X-Google-Smtp-Source: AGHT+IG4d7fkEBOkkhF5XV1d4feqkZinRx+EU8eZzFCNrZ/MjQbY0w5ruY9+o5LWFPMz382BttcoRA==
X-Received: by 2002:a17:90b:3a43:b0:2ee:94a0:255c with SMTP id 98e67ed59e1d1-2f4536d25fcmr37163902a91.13.1735247049482;
        Thu, 26 Dec 2024 13:04:09 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f447882af6sm15872560a91.36.2024.12.26.13.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 13:04:08 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 26 Dec 2024 13:04:07 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: tjakobi@math.uni-bielefeld.de
Cc: Derek John Clark <derekjohn.clark@gmail.com>,
	=?iso-8859-1?Q?Joaqu=EDn_Ignacio_Aramend=EDa?= <samsagax@gmail.com>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] hwmon: (oxp-sensors) Separate logic from
 device-specific data
Message-ID: <cf3ef6ff-632e-4fcf-9c13-1425e444a0e5@roeck-us.net>
References: <cover.1735232354.git.tjakobi@math.uni-bielefeld.de>
 <daa7571b0731e203b5a86e484da8083fd034601e.1735232354.git.tjakobi@math.uni-bielefeld.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <daa7571b0731e203b5a86e484da8083fd034601e.1735232354.git.tjakobi@math.uni-bielefeld.de>

On Thu, Dec 26, 2024 at 06:00:16PM +0100, tjakobi@math.uni-bielefeld.de wrote:
> From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> 
> We currently have large switch-statements in all functions that
> write to EC registers, even though the bulk of the supported
> devices functions more or less the same.
> 
> Factor the device-specific data out into a struct oxp_config. This
> only leaves logic in the corresponding functions and should make
> adding future devices much easier and less error-prone.
> 
> Also introduce struct oxp_data which is going to be used in a
> later commit to cache device state.
> 
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  drivers/hwmon/oxp-sensors.c | 517 +++++++++++++++---------------------
>  1 file changed, 215 insertions(+), 302 deletions(-)
> 
>  
...
> -static int oxp_pwm_disable(void)
> +static int oxp_pwm_disable(const struct oxp_config *config)
>  {
> -	switch (board) {
> -	case orange_pi_neo:
> -		return write_to_ec(ORANGEPI_SENSOR_PWM_ENABLE_REG, PWM_MODE_AUTO);
> -	case aok_zoe_a1:
> -	case aya_neo_2:
> -	case aya_neo_air:
> -	case aya_neo_air_1s:
> -	case aya_neo_air_plus_mendo:
> -	case aya_neo_air_pro:
> -	case aya_neo_flip:
> -	case aya_neo_geek:
> -	case aya_neo_kun:
> -	case oxp_2:
> -	case oxp_fly:
> -	case oxp_mini_amd:
> -	case oxp_mini_amd_a07:
> -	case oxp_mini_amd_pro:
> -	case oxp_x1:
> -		return write_to_ec(OXP_SENSOR_PWM_ENABLE_REG, PWM_MODE_AUTO);
> -	default:
> -		return -EINVAL;
> -	}
> +	if (test_bit(OXP_FEATURE_PWM, &config->features))
> +		return write_to_ec(config->sensor_pwm_enable_reg, PWM_MODE_AUTO);
> +

This and all the other feature checks are completely wrong.
Those checks whould happen once in the is_visible functions,
and there should not be any such runtime checks. If a feature
is not available, the associated attributes should not be created
in the first place.

If such checks happen in the current code, that should be fixed
in the is_visible functions. Any existing runtime feature checks
should be removed.

Guenter
