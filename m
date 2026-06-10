Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E3840862C
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 13:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098047; cv=none; b=L7oscNvfvhJ3Y+Ya8h5NOVfyGI6p06BvsxV3fMjcn2eX1piOyPcD5PhOQbYBQfLrLWTuJYmdvqh3en5jVOzU17GdeC/XCVPS8quZJ7AMap/eYLvUsBa+muD+OGn81azciVQq2ruTxs05twgHaLkaJ1ntzXWVlTui+WXX60huuCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098047; c=relaxed/simple;
	bh=jk8C2srbyo+ZHF3k91WSnemxRv1GlfFtvnpaTGVI680=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B6d/C4/ovzd1JjWdHsbXZc+VPcDDMEHkFksN4TTZ9oKV8OnrW/KGJNO919HTtzqENu1M36nZVchD7RGFuNknyaUC+YxBuTbECAEn4x1g/UavvYT4c5fl1XYk+vtwfBgVU3NFnviBWxHLuPFOQnRGdIziOddEDzjtqdptNANkf48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTNDycE0; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTNDycE0"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36da151a152so4710164a91.1
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 06:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781098046; x=1781702846; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=auNVEQywJvrbCnmekbg49sDVv3GjAtbK/fCRJB0e8AY=;
        b=JTNDycE0VLCS+45CS471SoJFkvWUpLB6TPzudVoTRWXt1WauXkRIETpEHwio2X27pW
         azyEAjjPv2St+L1XSS3Qb4/FQpLIrdZEPBsdUXO3XzClIm6XGDEmSWBmFT/eKP6NnZb6
         KQbiAhwHFGbxtbR74SkklFVT0s9DAY+UAjTxTVRxLfoUF1dVlBJ2DcIZzsjy+icogoF8
         si7WpnXI5Zn11bubO8GjAh90FocSf/G4kBLhyNo9odAAy3Yw6L9aQeOzXRoz0mHM8t0S
         9pAV7uEX43XqY27zeTkPG+eZbPvM5TojUM7F9mCZZsnYmxoqbipCGAcSavsgtB58oZ9l
         Fl5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098046; x=1781702846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=auNVEQywJvrbCnmekbg49sDVv3GjAtbK/fCRJB0e8AY=;
        b=jmmTbJEe87NxaL/iYslHak+6M2qQjBDZ1BOqGVA6cpgNoNkIFSvRqjoNtQ/nzALaId
         adtCEZSWSiboqKtjBCMWtA6fl0/s9aNQaLtDFFkQhQjbdPiUVblXbwHJ0NyuoHQT0yPG
         SPexvQakAC/JUgYma1tgnvaNRcNuN2gCu0c4YhilfG6eaHGp6bkHRxBCbd/+TlqrJgI7
         SV/Or0/8+xkn/gL3jX0keJKtANubNC0tVfJ03ZBbr9sXUzuGSWo8sbHlkvFVctOSQU30
         w6+SIv+u1PwV44gGa+I87lCMwrWCSe0lDDMSyw8/Zrj0J07oNGqqwvNSCWt4U1WTL928
         WWxw==
X-Gm-Message-State: AOJu0Yw3xGrFGwC1fO7Xsc5ro/CscsEPNHdVNrEbpmhfhcRpQp3GQI4C
	tO/7PA/a0p6PsYibDAG0FQNBVX9NvxHP4nZP9r6zTjtL2ZO7J+jmsO6X/4+yeUCf
X-Gm-Gg: Acq92OFkHIt5nkqXbfAls4fQD8CbZw5OaU/EEdXUgrMHyCNOsXqiUqeIDCdURKDxUey
	LLaTuYlWqVqJWFVIlRTG0Va1S5PpYTdAA1k0YWwK4bLExXlC/MZ3VKjyyJDEXE3Ql5IB8ZpaTkq
	oLeitMg3q90oJlhhnymzYMA9jsoFUsIqFYZPXuJg90J6aJN5mQ/DADvwUDRWDE+qAeWqB+6R2SL
	Xv0Qpfi3m/CAnKxPITbIPQezXd2bj/ghepjEpGqiM0IVa2l8C287XynUJavaj6MWWsf+HFRffYR
	N4q57zEEHqnTshJhW8vpvQUeuljIIHiQemnQJEXnbxRvqkhXJ2FDigDn3Ze0XOh2nDOu7uDNxl2
	oPBVqliJJMt4FpqGAQK+6TKyYapm4PQZYqru/Jvl4NTXw17pYUt9R7aO3hfbvAf0ORXpzRJySRa
	1wAzKaeY9FyUmaA94jl9UXI9VNbYMG3xmk+O6+XFvhkxhC68meHP2h4ZPJFw==
X-Received: by 2002:a17:903:fad:b0:2b2:ebed:7af5 with SMTP id d9443c01a7336-2c1e7b13addmr281502165ad.13.1781098046034;
        Wed, 10 Jun 2026 06:27:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f9f358sm244072125ad.30.2026.06.10.06.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:27:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 10 Jun 2026 06:27:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	cryolitia@uniontech.com
Subject: Re: [PATCH] hwmon: (gpd-fan) Reject EC PWM value 0 as invalid
Message-ID: <4472e09e-cdf3-478f-8c8a-1d89366b322f@roeck-us.net>
References: <cbdc1df2ed3443b08cbd1fc2652638deaf798c4b.1780990542.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbdc1df2ed3443b08cbd1fc2652638deaf798c4b.1780990542.git.xiaopei01@kylinos.cn>

On Tue, Jun 09, 2026 at 03:41:35PM +0800, Pei Xiao wrote:
> The EC firmware is expected to return values in [1, pwm_max]. A read of 0
> is illegal and would cause underflow in the conversion formula. Explicitly
> check for 0 and return -EIO.
> 
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
>  drivers/hwmon/gpd-fan.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
> index d1993cd645cb..decb61936b95 100644
> --- a/drivers/hwmon/gpd-fan.c
> +++ b/drivers/hwmon/gpd-fan.c
> @@ -341,7 +341,11 @@ static int gpd_wm2_read_pwm(struct gpd_fan_data *data)
>  
>  	gpd_ecram_read(drvdata, drvdata->pwm_write, &var);
>  
> -	// Match gpd_generic_write_pwm(u8) below
> +	/* EC PWM register valid range is 1 ~ pwm_max; 0 is an invalid state */
> +	if (unlikely(!var))
> +		return -EIO;
> +
> +	/* Match gpd_generic_write_pwm() below */

Please do not change to comment format in an existing driver.
This driver uses the C++ comment style.

Thanks,
Guenter

>  	return DIV_ROUND_CLOSEST((var - 1) * 255, (drvdata->pwm_max - 1));
>  }
>  
