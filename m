Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4B81F0E29
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Mar 2026 01:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772932922; cv=none; b=K3c2epS4xFdnhb2rVdsakYiBivODyy30HGdiJrtNQDyNSuvAUxkVKBRexjDJ6OeXf2trFD21D38A6jjFcOdba/7pQB+/Fzz22HEF+3034vJBdMCxcSzynzjjyBIpCTlw6LcwxmXihWGyaGXPksU+LWCx181Aa4Y3uVf0Vj9Bkck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772932922; c=relaxed/simple;
	bh=etOhkSfYLR5ggsnislmjuT7BqCj6aE2dxd3IvUNbs8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gN0JlTvwN5n9/EIHWlxINpNoN1oeQt6XIz1SndHpfNbgHbU93lN985wj7yw7lwXa7pP9C3KL76Q1FSNWO6/LQkf1rzpoJGDC99VLyQfeotUDDL1EDYeVVpoO/wumDs/yKK0Xc4rGbfrMk/W1Sakqr38o9UHJTvk/Er7XqqSojA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTGSZb0G; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTGSZb0G"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2be19f05d7dso3372940eec.1
        for <linux-hwmon@vger.kernel.org>; Sat, 07 Mar 2026 17:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772932920; x=1773537720; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U+2uW3pVX4s3uqBjVfFNFLLPtvFDpbm5f7Ej5kaVeSc=;
        b=HTGSZb0G+cdTvzSnE1qKDEWP37OoAmm1ZlHlMIob0J1/bG7DQTC/mItCUICboMB79T
         u37HOH0Uyv6mywpeNKjFCy5Udfp6fxtTAbydGioIAok9VqHNqgHj5W+a2oVkJOwulCRc
         D/lwXlnYwo55WdI7xTD4uWkoQH5Z0wEhv0LmW38CNB4lIg6USCXYQmUGOMvpwKjkGCpx
         Vm+0eCrK69vlROg/7t7kr21/biqVHOZ28DRsnrwYz71KUq5PhnalrPfL4Z1KQjrQNzOE
         M/6fbOELSWLRYaqKRoUb8dUjBOTlSSanYuBHIZoplw48e2vt93LaKkuWMsII3BNhu7g1
         SPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772932920; x=1773537720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U+2uW3pVX4s3uqBjVfFNFLLPtvFDpbm5f7Ej5kaVeSc=;
        b=kbo6CMXa5YgDVXhi59naWIS5597HqkBabOFSRZejmRmuLG+m1XUL2/569QK8nhFzXL
         tZWImJB3zkZ/JAGiv/ttEjgxNDGfAB++41ff0rez7ymPGkl38C35Gwq+QVkTED0mTm5P
         xJ6y13mAoK7nGB0W4kHTfv85Wm4dBinE0M0r8Q3hCoUEqATCDKqN3urLA0w7IVvfidQ8
         xD09Ktv6Lo05vUVZRv+5Xjq3jY2etemExXXwYOQ5yH++1KUA4+R0vRJyTwndVllYIoTh
         g/RMImt3zCbR6eII/aFTKdfazse/bmj8gZMF5diJwiA7WT7jovAZVURzCsEvSgD0YrrZ
         7o+g==
X-Gm-Message-State: AOJu0YyKinEunvWVOy6Zh0uh2sXpdpwYVxOIjO08M1h9NkioExan03XS
	0W6vy2YFxFwrWMzqXo6pC8egmHSasBZ3SzId1Jf+p9IT6zsZ3oBAqmvfjA33EBwr
X-Gm-Gg: ATEYQzy2cpFz6mymr2m62sm+k234tvVouCeUdNGsQv38hHMPgKLclqPIACWxE9qQMvq
	5FqDXJSUxhzqiFyTjkfVi1s5zQdr7XrTgOGNJ+YRhUQ/92lVO+NGPiY8YQ0KLSmLTBfbWiCF4qi
	XuEBl4gwkaqxMe0md1kfeAixKyTATIUrCCpag+rYgTizhloW1sHSFph+AyscQsrOn1Hp0orwpVw
	MGqk0L94ggoTVZEu6f9Q4lfhoa5WxQYDUQl61XoQwi1Ffl4dXesKtVXEO2ycwIpaGf+SKe3NgNd
	WjwOahEHalDoxh464xKY1ef0shiz6KsFeRtwXioMze4jovmAVhXWQjRW0d7Nm/b/UDzBx8zw77z
	vdmvGpjD4mxXc5gCRUSPIfqeqEJHjjBPWGBbhVxcrLiBc9j3Vo9oG5lSG1sYYTIiNhcbl8hBBpf
	mzYfYoURAUfE89v0joAP4xwF8aaySewpnklptY
X-Received: by 2002:a05:7300:dc91:b0:2be:2cfe:68b7 with SMTP id 5a478bee46e88-2be4de9a2dfmr2510733eec.11.1772932920083;
        Sat, 07 Mar 2026 17:22:00 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f8078c6sm5538581eec.5.2026.03.07.17.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 17:21:59 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 7 Mar 2026 17:21:58 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Tabrez Ahmed <tabreztalks@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>
Subject: Re: [PATCH v2] hwmon: (ads7871) Fix incorrect error code in
 voltage_show
Message-ID: <bd4eaebe-67b3-4730-89d7-b680a1ec4692@roeck-us.net>
References: <20260307115226.25757-1-tabreztalks@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307115226.25757-1-tabreztalks@gmail.com>

On Sat, Mar 07, 2026 at 05:22:26PM +0530, Tabrez Ahmed wrote:
> The voltage_show() function returns -1 when the A/D conversion
> fails to complete within the polling loop. -1 maps to -EPERM
> (operation not permitted), which does not describe the actual
> failure.
> 
> Replace this -1 error code with -ETIMEDOUT to better indicate
> the timeout condition to userspace.
> 
> Drop the else block after return.
> 
> Note: not runtime tested due to lack of hardware.
> 
> Signed-off-by: Tabrez Ahmed <tabreztalks@gmail.com>
> ---
> Changes in v2:
> - Dropped unnecessary 'else' block after return as suggested by Guenter Roeck.
> 
> Note: This patch applies on top of my previously submitted patch:
> "hwmon: (ads7871) Replace sprintf() with sysfs_emit()"
> 
>  drivers/hwmon/ads7871.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/ads7871.c b/drivers/hwmon/ads7871.c
> index b84426c940c5e..753bf77ce19b4 100644
> --- a/drivers/hwmon/ads7871.c
> +++ b/drivers/hwmon/ads7871.c
> @@ -125,9 +125,9 @@ static ssize_t voltage_show(struct device *dev, struct device_attribute *da,
>  		/*result in volts*10000 = (val/8192)*2.5*10000*/
>  		val = ((val >> 2) * 25000) / 8192;
>  		return sysfs_emit(buf, "%d\n", val);
> -	} else {
> -		return -1;
>  	}
> +
> +	return -ETIMEDOUT;

AI feedback below. Somewhat unrelated, but it turns out the driver has a number
of problems. I'll apply the two patches, but that won't fix the real problems
with the driver.

  Does this code mask actual SPI errors?
  If ads7871_read_reg8() fails, it returns a negative error code (e.g., -EIO).
  Since MUX_CNV_BM is 0x80, any standard negative error code will have the 7th bit
  set, meaning mux_cnv evaluates to 1:
	ret = ads7871_read_reg8(spi, REG_GAIN_MUX);
	mux_cnv = ((ret & MUX_CNV_BM) >> MUX_CNV_BV);
  This causes the polling loop to continue and eventually return -ETIMEDOUT
  here. Should we check if ret < 0 and propagate the actual SPI error code
  instead of unconditionally returning -ETIMEDOUT?
  Also, since this attribute is registered via devm_hwmon_device_register_with_groups()
  rather than the _with_info() variant, the hwmon core does not serialize accesses.
  If userspace reads multiple channels concurrently, could they overwrite each
  other's REG_GAIN_MUX writes before the conversion completes? Should we add
  locking to serialize this function?
  Additionally, since we are improving error reporting, should we also check the
  return values of ads7871_write_reg8() and ads7871_read_reg16() to prevent
  operating on or returning bogus data when SPI transfers fail?

That driver would really benefit from a conversion to the with_info API.

Thanks,
Guenter
