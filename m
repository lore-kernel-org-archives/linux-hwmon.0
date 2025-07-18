Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A661DED53
	for <linux-hwmon@vger.kernel.org>; Fri, 18 Jul 2025 16:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752856484; cv=none; b=JAc1GS5jKWXUrhlit5WCymsax91WD/qX6x0bHeZdISimQblQhfsLKepIMl+jUuduD3lmpTlewfCme1fOX61+9uOaojAX34Jxyl8gy7xvLYK5fUkszQhiefWmGEpVCs2PsCYQQbdnbMBlV6U+2rrLwp7RMdsLf29VFyr36I1K2M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752856484; c=relaxed/simple;
	bh=mI/esk/gl5N5GPE4tZVxDBN7NX6rJZxOdzFKWMs4IL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ep9xBF5mW+P7U3ynt7ewWYo6dXgjEdjYX9egRXgJwYDsE2zQdgNd72oSdZ/X0xi3ka0QLLw21WHuFUMmc4Lafg8e6Ekmf8JOluGsk9fsTJ2WsucLBaDTh2wvo4q3OF7c5QtNRHmVjYN0pqNlp69rBzVTTQrrb81eI6zOGhF29dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VxbmWsVf; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VxbmWsVf"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-315c1b0623cso2252959a91.1
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jul 2025 09:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752856482; x=1753461282; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TkTPQ5ohW9TzuL1lUaLK41kO6k+IQp9Iwjvbv0pjB9k=;
        b=VxbmWsVfVZpiuBj+ZKb/UL2oBhnv53ov/UCXJYPEjm/ibKlbYNsP0gDThBu15WJb1N
         /g2tVYU2KOFMowwMkkvrL1grQI/TjNfl5Uwuw88B5d/ddtz9J64fPJVGVfRlWAmy8TmY
         GbsDXlOoE5YYntR0Te78wrguVXPFeWtOPlbZs1fbu2UXiSnFGbF2UP3kNb1+A4xbSJWW
         VINm6TURRRfTAOxDQ3q/+DXRaGm05TCwnf68u3RysnxC6IPfyO59wX6I88555nxSQI0p
         I48UDDQDhaVAsJ8tXLmCW1hhYTsxgrLp6tAu7nM7W8vlP43GV8ZLNUGpI0ngt4i483Th
         NgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752856482; x=1753461282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TkTPQ5ohW9TzuL1lUaLK41kO6k+IQp9Iwjvbv0pjB9k=;
        b=D/LrRqHzM2cigd9SCORRZo0ACJG/K/7DOu5bUQgX3BILfE4jyMh7gbibIePUWrJJyQ
         l0aAbE+RGZnZ3WTJvOgzwP1pJbFGgaxbjGWx9H73a+nKWo0uUTQEeB0vx3+Vzi7PBwae
         ZCopxQIbQMenXqvxUCGUxmnLtImkDyccdJslMukIqw2Sb9mQbwS1QwKCUOeSl/1L9Yem
         M8xvTIlBUdUTgrnWxbfQWchGQrUlPiGHZustwMoyLKH2s1W71co2eLMWcEbCJHR/04yZ
         VZWjQLtWxTg52ateH7agLaaACGB26ntGsxAM8+i/L3+/5QiaThoTz7V5B/7zwqe5CrOl
         Zlfw==
X-Forwarded-Encrypted: i=1; AJvYcCWehuti1t4qyr8DnDiiSTBU9xLT4Q5re+aLBqz4K9a7hAfXgC3o543evT5axQy+4Dt+ZhxEpPX78BxyDw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx47rdWQwT6IlxGYzgYkCq2S5M9Um0WLfwdJI+44L8zepEjzAYu
	JPCjhgNYE7csaiTHD1TixJ0voY4Q3G+eBoy33PvoReco4AXh3vVoxi9n
X-Gm-Gg: ASbGncspzxlg1dqCz6FH6oWBpkgqGPQxZZct30fSOJglSSMpxUojk5SHszcyQfmo11J
	smGyodTMkIN7o4a0Enjm9SIxvQdRRsFQWLAn0ZgK048I+1j4tGWzvC2VrEPaPPIYPM8lM/syifv
	t8vk4MzfRNi9Tv6JWFNV2IxZVOR7RMzB078Bi/RkeeEspED66k3es5Qlsf/GvUnQTvTqy+MRrgp
	io0iFUfTNqSddRY78RnCEg8aRa7VxXMq4LMrX6uyltyRCFMNzLkWpkdi3rjvKaHt7HL7AuGTape
	zEoM/UFwSEwMSeym6gppfhNEALd2OjHhPsmgHa15/tPSrwcy7qSUWs51TUAvl7FzRlEXGB6R/JD
	YGCFcAn/k7uQOsgqtaMwxWp0/hAI7Z3hLFJdEO62c5NgaWA==
X-Google-Smtp-Source: AGHT+IHwRyh36PAAO5i/E3AQ5e0frP5l+PLw507BCkVWgL+XY5uMggvU3wm5UECImQnsmJKxEWDMpg==
X-Received: by 2002:a17:90b:254d:b0:311:ab20:159d with SMTP id 98e67ed59e1d1-31c9f4249b2mr15233627a91.19.1752856481731;
        Fri, 18 Jul 2025 09:34:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f28807csm5381718a91.26.2025.07.18.09.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 09:34:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 18 Jul 2025 09:34:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Torben Nielsen <t8927095@gmail.com>
Cc: bartosz.golaszewski@linaro.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon:pmbus:ucd9000: Fix error in ucd9000_gpio_set
Message-ID: <4bb4a9fd-17bc-4dc2-a27b-da83248d6e60@roeck-us.net>
References: <20250718093644.356085-2-t8927095@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718093644.356085-2-t8927095@gmail.com>

On Fri, Jul 18, 2025 at 11:36:45AM +0200, Torben Nielsen wrote:
> The GPIO output functionality does not work as intended.
> 
> The ucd9000_gpio_set function should set UCD9000_GPIO_CONFIG_OUT_VALUE
> (bit 2) in order to change the output value of the selected GPIO.
> Instead UCD9000_GPIO_CONFIG_STATUS (bit 3) is set, but this is a
> read-only value. This patch fixes the mistake and provides the intended
> functionality of the GPIOs.
> 
> See UCD90xxx Sequencer and System Health Controller PMBus Command SLVU352C
> section 10.43 for reference.
> 
> Signed-off-by: Torben Nielsen <t8927095@gmail.com>

Applied.

Thanks,
Guenter

> ---
> Reworded commit message as per suggestion by Guenter Roeck. 
> 
>  drivers/hwmon/pmbus/ucd9000.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> 
> base-commit: e2291551827fe5d2d3758c435c191d32b6d1350e
> 
> diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
> index 2bc8cccb01fd..52d4000902d5 100644
> --- a/drivers/hwmon/pmbus/ucd9000.c
> +++ b/drivers/hwmon/pmbus/ucd9000.c
> @@ -226,15 +226,15 @@ static int ucd9000_gpio_set(struct gpio_chip *gc, unsigned int offset,
>  	}
>  
>  	if (value) {
> -		if (ret & UCD9000_GPIO_CONFIG_STATUS)
> +		if (ret & UCD9000_GPIO_CONFIG_OUT_VALUE)
>  			return 0;
>  
> -		ret |= UCD9000_GPIO_CONFIG_STATUS;
> +		ret |= UCD9000_GPIO_CONFIG_OUT_VALUE;
>  	} else {
> -		if (!(ret & UCD9000_GPIO_CONFIG_STATUS))
> +		if (!(ret & UCD9000_GPIO_CONFIG_OUT_VALUE))
>  			return 0;
>  
> -		ret &= ~UCD9000_GPIO_CONFIG_STATUS;
> +		ret &= ~UCD9000_GPIO_CONFIG_OUT_VALUE;
>  	}
>  
>  	ret |= UCD9000_GPIO_CONFIG_ENABLE;
