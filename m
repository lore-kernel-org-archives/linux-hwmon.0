Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A62C26A0B9
	for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 01:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778809524; cv=none; b=Cunv/kIy+VM6Y/1yMzqO9U2aBHIPOr8zmsgwfTP8n1gHjdqpsid26VeSPHbPyviHELlUme4v4AMhr+UnVKO61Dd6wnicoKbNlQeFOo1npv4lKQbeZSrEXu2x71QPK5Ib7CcwTcSXvG8YH0fPS0vz5CA4I2O3TWsg8IvAiEguFXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778809524; c=relaxed/simple;
	bh=ugNfDe5iiDtBCLoGrBS8jtDNE7bgRfZxthW9fe8F4Fw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pp8JmNX4dUgzaHIMBUg7qsi3gb02BKtYdiA/OrvwCtJC4bkS7FGjmNGxd8xNE7bwPLACtzbXKEv6kWwcE7fmSPAjv2CGfA+pay+iA/vT2mEs7h1MsY7r3EgaI/utu4tYSaBhzWY/QZzy4crmkfmR6vfaT3mDRFVVYTCjV4VskT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTjXxviO; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTjXxviO"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2ef8d6ba48bso302683eec.1
        for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 18:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778809522; x=1779414322; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dw9O+N/qBD88B3z5kXXHKsi3gAMVqUZYDR9e86dCtjw=;
        b=HTjXxviO6xUp0xCXoVY7YuueT0exbQQUS9w+kQJwzO2C0kMVDLKU0je2b0HzWkaDbv
         CCak/1zMJ5rNH/t1CFcEmgBQ5W+gsuhC7MluKmj5cWVXkz0e3GyYHT+YYsn2N2ptm5vA
         YLwYYDDiZOrk4bHigmsbE0UUY2eJa0taM5E0IXQ7Vv2AcCDE7u2YEyWJZHEWacwsvDqr
         zXjyRD0mW7B5nfox151qYG/7qZJas0FzvhT+MWXyKxVk0avxKK1E9Hsf/QGt9Rz0lhH8
         0HGnujFBFsSCMQUMDamfMqyGnoSbInyCIff9wgu3h7ylC3R7I68+Q5588EM710b4E+UB
         /UEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778809522; x=1779414322;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dw9O+N/qBD88B3z5kXXHKsi3gAMVqUZYDR9e86dCtjw=;
        b=i4s/mlqxN2z2bgMayQfhNguA3Tn5WCA1UCUKHK9ADYvwAqsdws70hJY9z/9PN0vE5I
         oy5iEDfi3/D9++mlVhO+i+lnrtRuv0OYyCoJsdnRVBvM5/B6zKa1pDWW89t5pcJDBSeR
         EV3vsuuX4HsKM/a70m9lebDLwUL0qXAtIdqr/8B92FKv6IYE7WPvW8WkkAa8uezOmLZe
         J7vQbugrbVAAXgX8sVXRAmJWAzU9kZIpZOTZ0KFRGzZ+rP91GHgfUiREgm861yffRxmX
         ChYn/+sH+DNnDRhhtl369baCcu5BLpLZi+CQRLYiZGDzTwYmOjiD56SBT2u3O5CN/Uvu
         8V9A==
X-Forwarded-Encrypted: i=1; AFNElJ89b7Rt9cBJ6dNgz8ug5M4Y7clTeeJNyt93wqe3uGc0qEXLxpjJjgqSueXd9zZ4TbLx3fdnhMMfikr+qA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRg4+Ont82iIoNMTrX01p84En7PXW7zV8E0xkmskVtB8DwW8Nc
	bB8Y1rhk59bHplU3yUdG8uCV8I8UUCkFtuLw9UwcV5jKtYRLR06F4K1k
X-Gm-Gg: Acq92OHoF7MzhjbdD1J2nnlKVhuiKgteQCtyYwdpNbNw1pFLiBadzvWxTwIVaF+08So
	bgRY9B8XFwCQb8P1DvBxDfJHLjniIFYC6q4P5rinzzVBWndJPgfYGhVEM1mqNutfuSpZQPfyqkp
	wfGnx84r7t28sv73+A2DUOPcadEeAwjmUIb1502lI/KYEY9GXoH7YsAxkxuJiF4a1PdAHSoN21v
	xxknxrVuM4SGKV4FbHaH8jb/6QAfTow6/PDJMCTgP3yZjRmzb+2lqci/dinPyg0dDai7xZGnN+0
	4Z35eSG67j/l9OREMgeWVhXHQkh1gS2jaFuH6jKYhKqqLwFhUa6YMNRLbCsIxSpWMRC75I3r9G0
	bj1CIGFB0lCyx3AK0SWnF33VwYnEPeszrdbr7+LxZ7otE93AW1M69yA5MksN9hSCJQEwMA8ofOZ
	6xdW9vPUKyhgxlzyo1T+5Ec7o/esav2JcqDVdn
X-Received: by 2002:a05:7301:644b:b0:2d9:db50:c6ce with SMTP id 5a478bee46e88-3039785c4f8mr955396eec.3.1778809522192;
        Thu, 14 May 2026 18:45:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcc458sm6205369eec.18.2026.05.14.18.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 18:45:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 14 May 2026 18:45:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Alexandru Tachici <alexandru.tachici@analog.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] hwmon: (pmbus/adm1266) include adapter number in
 GPIO line label
Message-ID: <0f2be441-34ea-497d-8b2d-5883d0ea82c4@roeck-us.net>
References: <20260512-adm1266-v3-0-a81a479b0bb0@nexthop.ai>
 <20260512-adm1266-v3-5-a81a479b0bb0@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-adm1266-v3-5-a81a479b0bb0@nexthop.ai>

On Tue, May 12, 2026 at 11:56:28AM -0700, Abdurrahman Hussain wrote:
> Platforms that fit more than one ADM1266 on different I2C buses at
> the same 7-bit slave address (a common shelf-management pattern,
> e.g. one device per power domain) end up with duplicate GPIO line
> labels because the existing format only includes the slave address.
> Including the adapter number disambiguates them.
> 
> The adapter number is formatted as decimal to match the i2c-N
> convention used elsewhere in Linux (sysfs paths, dev nodes); the
> slave address keeps its conventional hexadecimal form.
> 
> The label is purely informational (visible via gpioinfo and the
> gpiochip /sys/class/gpio name); no DT or ABI consumer parses it.
> 
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/adm1266.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index 05b31bb08f38..12cdf6de341a 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c
> @@ -292,8 +292,9 @@ static int adm1266_config_gpio(struct adm1266_data *data)
>  	int i;
>  
>  	for (i = 0; i < ARRAY_SIZE(data->gpio_names); i++) {
> -		gpio_name = devm_kasprintf(&data->client->dev, GFP_KERNEL, "adm1266-%x-%s",
> -					   data->client->addr, adm1266_names[i]);
> +		gpio_name = devm_kasprintf(&data->client->dev, GFP_KERNEL, "adm1266-%d-%x-%s",
> +					   data->client->adapter->nr, data->client->addr,
> +					   adm1266_names[i]);
>  		if (!gpio_name)
>  			return -ENOMEM;
>  
