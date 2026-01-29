Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AE326CE32
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Jan 2026 14:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769696308; cv=none; b=OhHfhzbutCEoXB6rfhd31p7whtVnBOlX2ZujCE/NnDfFFTeVkvaekL9dOXkjYtnaZnlMHJCVSi8tMIY9lXZpg6PhJZ8ybyOHi6uUzNLTku8jcpkZC+7KdWJNWybbxom76VjNaoPnQOG2714FFF2Q/zsUJxtKf9borT7PFihphVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769696308; c=relaxed/simple;
	bh=EDers8fN2HljLl1KM73ByzR5GscUSEeRnainkZYB2nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RwrcYaTym6+8V9GkX4hDwAx9M9n8ZImjT30L7EjXITmklFcBIE1+yMxDYPEdYW2bWaFXgqRx2Sbw0mnbkgmtDUJqGd56NOUDiI6xTdqc0Ef75fBeAP9n1zgtPxTKbUX1Bn0W0v9SqZCBf/Cutrad6b2rnmzmic6yh68oN1fnPHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dBKYhtMa; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dBKYhtMa"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-352e3d18fa7so601055a91.1
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Jan 2026 06:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769696306; x=1770301106; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ri7RrmqyAkFYNWJdmG59gMaCqhBOcnxpGMzCXKtgG+Q=;
        b=dBKYhtMaCahl3pQve4grrg+KQrcnHlDqo72AkZrxMDZRR/05uVySEqPJn3MzWK11Rg
         1QZ3Dpbi6vRcZq4LimTI3dG38lMl4/SBSr9JNtNO0WwDN1Tj6kbC7w+CurlJNCw1XjzR
         8xsfjWSTMtj/LrQHoD3Mhsfl1pwXzGW94m3xcaWIU4gLLiBx8ulMPQLbjFilM/wfaKDT
         DecSz6b6ioH9a5CloWvKrviu4U8Y9og4w0quTbzMi3SebLw/m58ExqjXsqM3rM1wtD07
         3RgIRWFLx9XdPktzYOdewVSuGsRRyiQQlRrgRmDlIvYtvGykHffGo2L6EZPzzKHkVBaa
         ir5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769696306; x=1770301106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ri7RrmqyAkFYNWJdmG59gMaCqhBOcnxpGMzCXKtgG+Q=;
        b=DhRB8+oNxYuCe9TiiRLNjdbBUYd/VFgWAh1DxKnfEtGoZHvN64oGVaVSkAAFoAbAq6
         pxNsuVCDr/GepBkjAox8b95GGnffYEmqFyE3c7H6bqe9u98VA+qRNBl/h0qXtUvFE0K+
         WKzEUx9Tyy7KemDGagdxKDsgYWYvnML5PPonXAEVsLuyXqpBfT1aOFhf62TDAjQkFFp/
         7XvYmTLAcpB4aAktNHJUNvX2EfHMvlUUX2T1FSqoZ+67GcTy7sOC4iN2/Swv/E9flBpi
         +16+JpBpIqZTNTpuCEt0IoyAzC2IaNCZ+iRPR68AvIo2aPzc994Zy6jSbc8TY5zfPYez
         57+Q==
X-Gm-Message-State: AOJu0YxP1GJsKumoFY3vIhhoe5OxP+sekapCIJRGEB3H4/jeykk7O6H5
	IFkDLDGCeqGD7zm+Ij2YdA0u0G2gYEX/kG694fKcud94g8m9MejXkiVe
X-Gm-Gg: AZuq6aLdV0k7e6hNTIVhRhsiJYYf9hXnR0bue09ZFyb/W1Cr9hh/Kol5iGsUhQ9Npuy
	ziJqFp64DcU1fp7H/4OM2jn8fC2RabSyizd8dYBNXa0o6/FiTElbjTDYyzhmmhQ/90afJXODEG+
	QDWkx+i9C6H8pZCRdnrYYJLq8BgX+IuhQBdw56DSebgKOSLQV3uzvb6ZQplPoLuNHhbzHhRelHA
	4/8y+VXuiRV2lTXk4udgIWHcmoItmEnPW/6BfyY+bkWdLNlLpRNDskSfnn8VFpYt/HTNBfYyd0t
	h0cylj0eG9EkLbr7s5N/QNjuOmBDZTvVQOd4yTOyLnktFA0VhtjZIizkKW0/eppUC8wzZnhGNoE
	13f7lGh7pIm5PMswmjyO7JBANLsvwEVVx1hwXT6d8qT39v4gJrqhXr0+z9dluzyC3ZGQk7LsnYB
	am9z4CdjIpSfqDTiXcidMBZxANYtr1V1nvkxY=
X-Received: by 2002:a17:90b:5208:b0:341:c964:126c with SMTP id 98e67ed59e1d1-353fedae2a1mr7222180a91.34.1769696306252;
        Thu, 29 Jan 2026 06:18:26 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3542dd54fa8sm246980a91.3.2026.01.29.06.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 06:18:25 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 29 Jan 2026 06:18:24 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (pwm-fan) Add missing check for
 device_property_read_u32_array
Message-ID: <2806020e-725a-4da4-8922-e6d28854b53d@roeck-us.net>
References: <20260128072610.2476625-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128072610.2476625-1-nichen@iscas.ac.cn>

On Wed, Jan 28, 2026 at 03:26:10PM +0800, Chen Ni wrote:
> Add check for the return value of device_property_read_u32_array() and
> return the error if it fails in order to catch the error.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/hwmon/pwm-fan.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> index 37269db2de84..3535007f5c37 100644
> --- a/drivers/hwmon/pwm-fan.c
> +++ b/drivers/hwmon/pwm-fan.c
> @@ -609,8 +609,11 @@ static int pwm_fan_probe(struct platform_device *pdev)
>  		for (i = 0; i < ctx->tach_count; i++)
>  			ctx->pulses_per_revolution[i] = 2;
>  
> -		device_property_read_u32_array(dev, "pulses-per-revolution",
> -					       ctx->pulses_per_revolution, ctx->tach_count);
> +		ret = device_property_read_u32_array(dev, "pulses-per-revolution",
> +						     ctx->pulses_per_revolution, ctx->tach_count);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "Failed to read pulses-per-revolution\n");

NACK

This would defeat the purpose of setting the default a couple of lines above.

Guenter

>  	}
>  
>  	channels = devm_kcalloc(dev, channel_count + 1,
> -- 
> 2.25.1
> 
> 
