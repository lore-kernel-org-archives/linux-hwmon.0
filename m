Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18E92D94B2
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Oct 2025 17:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760291971; cv=none; b=qo4tH8hZw8/kZxb9g9zez7xJ6syMd3N5nIc5+r+6T7iautqr72f0uGpzE8Nf32MjFFboFlymMyOCmPxCFxRFzoMprivl2/4zRqpHVWAVG6cTtGOG3WpVI6m59hytoXFyrTaBelQijdiSLvfS7o0vCuKHl9eD8w2irXoMx+y0CQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760291971; c=relaxed/simple;
	bh=qWt8KlsS667/DWj7CEknkJJNlszKHGEwCFpf/nti7Ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=neVz0XYIqf2IPbgwOsrl6JTiLf4xevn9d4SRCgRzF3UnMpicHbcyU3OYwNMpxxkJSDG2fO5yl7LuGkpzYpbB3+UL+34LbVq94FNHAOuN4tAK6gDf/SKzFolSYJ/Pm7pZ0ZDaUBeBo48xX6oonOnY+2kCxyjeyEBzu/4dS3FFYa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jsi7X9+I; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jsi7X9+I"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-27c369f8986so32203395ad.3
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Oct 2025 10:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760291969; x=1760896769; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pvLTpqWhUMNwfKi2DUzR3zUOBPTWtPFJRGCtsVkQ/g0=;
        b=jsi7X9+IOyGJnrlnwk/I0epxiqgODnSleiYV2QS8Cy/Zz9py4xvwveWbLY89SEfAv+
         rmB/3GInpQ35zXpZ0N3NPCTy7crlZ5MTTubVQNpvwzJjV3ItLfXEpR5eVSXgdSTD5eO8
         w+TIeRfLVuASWRI9ZVw6geQr9Fxzp65I+nnve5zUvwFqptApIdH4Mae3axVhIiTq0HC7
         RA7Kep648q6x7nMxMcR4xJUShhDi8ZEzAjOiD9L0OP6ENQsKqWFgVfsjkPwyVVUCRvCE
         TkrM0ILJLE1oAIPA/db2wtSsjkIwjDj7qUrEGghA5GTAnLwkwu7PFIH8zz/klq28QEw1
         b3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760291969; x=1760896769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pvLTpqWhUMNwfKi2DUzR3zUOBPTWtPFJRGCtsVkQ/g0=;
        b=VMYdjytz4SUGny/sK+L61ua3lv9xPNys4gXn7MkqVdyOsJ+FYXaJt+2nByoamLkCy0
         8raBXhzLF1+ocK1n3DMa6zFOrelbNkyOyHVzNDoeNYNilmwuziQJMlbwXxEIf6p9/MKI
         GE24KfsCqs+v9W2iNw5mGwlvmGSEcD1jFHf5ekdsJZ1mBw2n2IcQBjHLxWGRQaeYBDs0
         AHCcsHKuA9PYPN7+RlueBGnxL9xNFzjZrXkIkbioZoeCQ/f5GBypSh7XOMaCnBfZVhzx
         hSvSBI8t8P5Cjudt1I+ecBCxgliybm5MwzeiVB5ZhCa6D2d+Oy0g1xlGUq03VFjiHOfG
         HJ4A==
X-Forwarded-Encrypted: i=1; AJvYcCWgxn2CK53ZbKcKenvH7yIyj1bNBcMbaOuS4OV59z5qUWgZNykt6yhEtGstu0DcVc6jdLN/CE41Jix5iQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcCmVm75Z/PWGP4Bbwx2w0Guljp6f+YFFUYfwGrTTQPXmVQyBU
	ujiSchssX4pWXSWq5+IgL7k5BF1FAQ9FScC6ho7/OLHb+26ZsHaOaeKT
X-Gm-Gg: ASbGncvK9y4hgH81GOO7hrYslRvGZMSHRvFT1nM0Nd6W6hoyUz7snqqLEFdA8PMLZ6n
	j6UVPw9n2A13/ahGOC/vMvl868rwSF+/wgqbkfnZ08EujbwQTKtGujPZG0LeDt95FOKp6H9zUZR
	wpvLmSd1+ToxPpgajasfNO8hi3RyqPajyCgqiTUXvI/9axHhky9H/L9jlUQP8s+ZgTGIzVcBRKT
	BdB12LDXUb1qWybnAi4rY6GUNtE2Y1SE3Br0Ry24Ml6qudoC7IXTo5n1tZDIV+dj7zrrCW4kHlC
	fRao6qtZ2DfHbOwj7RrG920nAXN2HqDsUfaF1QlnchtmQ6y0sUxJj4K3Q6yAS6VALGGMfsHPukw
	0VRBxyAdiPmEYabqwf/F9NwLReY8tF13BafV2uMO17CnGNyKb3hE8QQ==
X-Google-Smtp-Source: AGHT+IH66mjgwju+uytBphIGoHpFDHA0VnVMlPqCCqqHrYPKBigQsM48Pjhjh2izDM7DkBtwCGDObA==
X-Received: by 2002:a17:902:f642:b0:270:4964:ad7c with SMTP id d9443c01a7336-29027356555mr258463735ad.2.1760291969153;
        Sun, 12 Oct 2025 10:59:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2905571d68asm45135485ad.2.2025.10.12.10.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 10:59:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 12 Oct 2025 10:59:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ranganath V N <vnranganath.20@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] hwmon: sht3x: initialize variable 'ret' in
 update_interval_write().
Message-ID: <7fc29d1b-4c5b-4a0a-b591-dd260eb6acfe@roeck-us.net>
References: <20251012-my_driver_work-v1-1-9e5fe6de51f4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251012-my_driver_work-v1-1-9e5fe6de51f4@gmail.com>

On Sun, Oct 12, 2025 at 05:13:27PM +0530, Ranganath V N wrote:
> fix for the smatch errors:
> drivers/hwmon/sht3x.c:606 update_interval_write() error: uninitialized symbol 'ret'.
> 
> The warning can occur when both the data->mode and mode which is
> derived from get_mode_from_update_interval() are zero.
> In this case, no i2c command is sent and ret remains undefined
> before reaching the coman return path.
> 
> When both data->mode and mode are zero, the device remains in
> single shot mode and no configuration change is required.
> In such cases, it is correct to treat the operation as successful
> without issuing any i2c transfer.
> 
> To address this, initialize 'ret' to 'SHT3X_CMD_LENGTH'. this makes
> the no-operation path return success while keeping the existing error
> to all other paths.
> 
> This change removes the smatch errors. Tested by compiling.
> 
> Signed-off-by: Ranganath V N <vnranganath.20@gmail.com>

Applied.

Guenter

> ---
>  drivers/hwmon/sht3x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> 
> ---
> base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
> change-id: 20251012-my_driver_work-77b22c239e99
> 
> Best regards,
> 
> diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
> index 557ad3e7752a..4b52d57eaad8 100644
> --- a/drivers/hwmon/sht3x.c
> +++ b/drivers/hwmon/sht3x.c
> @@ -553,7 +553,7 @@ static int update_interval_read(struct device *dev)
>  static int update_interval_write(struct device *dev, int val)
>  {
>  	u8 mode;
> -	int ret;
> +	int ret = SHT3X_CMD_LENGTH;
>  	const char *command;
>  	struct sht3x_data *data = dev_get_drvdata(dev);
>  	struct i2c_client *client = data->client;
