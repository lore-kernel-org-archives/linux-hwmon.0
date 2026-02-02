Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E28121ADA7
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Feb 2026 15:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770045886; cv=none; b=npJk5V4GZfnhKUy+mYVDWyc619tk1kckrHtVq1bVeckH/Ut13zYKKT4A24/Kg8kQDauaZio2yqB3A4uiKaYvGfjjs9368yWWqZOc+yvxbRbcKfA+SZtnokjzBA0g7Lj2c/X8RJjSaNxh9J6/d9OLynJ5mDoWO930W8yaBBkduYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770045886; c=relaxed/simple;
	bh=MbaS3LERvHVhVkH8jYF9YOuwA5xWcW9zDPOclh/q5n0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MPbn9qR2nAP6kbfBHbnRzrFu3iY1jATmRvowQTKRxl1zkL9UW/3wajVpZIauwOtkEylxFSJpssv6C2SfTjBXsN2AeFBraBGQTYo0LWzvsAmTVK423af7hR7douTQGFZrY8QagosJo79khWjKwypH5O91NoU4rCiGxVH8zdQoxR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bi0YFTdx; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bi0YFTdx"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2b70abe3417so10041453eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Feb 2026 07:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770045884; x=1770650684; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9p8YrmROARkEBgIDOl0qmgBvazyjaoa1X7f/B8K6qZE=;
        b=Bi0YFTdxyhW6krnScVzXuSx/JCqeiH37370W8U7sbvS6c1TvsiJ4vwfTr+FnUgZS+8
         ROJp+XI8gAlXy3brWhAdB8cAVd+a1UUxzePuT/QMZOde+iBiDpAqAgTMWVRa4gZSusti
         oKjFVbNpN9T0tak+3b11nBhqGQ8FWk5FVupm7HfmbywjLCUfZd4l3RuITiwlZAgq0iQM
         1iWy6tJshTQDtP4w2GzLK1vy2sB7C7f08Xsy6mc6S5hwnHIxdAOgP/F0C3i8wyzfhusc
         8ijl3ADQ6N6f3F1By/eUPd3mojBiaCzGhStldZdxvdbY9QDs2Iu5dKxmH7jUGn0qS4fS
         FzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770045884; x=1770650684;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9p8YrmROARkEBgIDOl0qmgBvazyjaoa1X7f/B8K6qZE=;
        b=oc/oK0uyYeA10WB9u7vHSK8PxZglUNYL2wWqCH13rDUtjetARzwuxB4ij8/umzRQVE
         FG0KZwOYH132cwotBqdpZ5edn6q9oga1xoPCMGk/q+RpyoJ+FedVi5woUleGbGbriS0L
         /Wx6LqK8QcxdlourwwtT/iGGveGWxwayJgi2BqJ8+BsvWALIXtFVVM9KCKz/zfrslvd8
         VIVjIPt7wQ5pFBwPwSg6fyixRass03h0scKAdoQXLxEQcSQLQ0dlGJm/qWzRaspFXoJC
         qH2h8OzOpFkIfSVUHNqhn5YqGB9xomCzVUPE4s0/IvQuI56w9IT28T+eAac8WQLU5k3N
         Bfsg==
X-Forwarded-Encrypted: i=1; AJvYcCXy1kD93MPsbEnFjVP/GBOH/Npe+da7c0EL1iIEOBYzKRGRHRqZZOmGW/Xv5Ne4v6WZyij2RZRwnfwNEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCw6TINT9tgp4H/O4yS1fOPNBqOLtdEkOsBglIdg9ra//Ec1Ev
	rlJZ63W6mpAniZPmkhXbZW94FCT0OvY0wuWA11iyMqx5P8cE7stP5rUoXQGNWvQh
X-Gm-Gg: AZuq6aJpxQCOzEqFpTbxIrq9Y7ErI6MAf/KZTd8IMxGbUDEwkLzy0xtnWHwcDaffjG9
	/BkoMMRh/j+qelqRXN0XG+Sqbx+H9JEJHH+1gh8GT6dJjfoP6eXsDbjZ078wJSQrj/3IdEXj5d1
	hGodFzn9VPuk5sezx42ESBD0XIFn9HyW+pBMzADjUw2r2brw8DhWKhqCda5ZcflufYJB514WX2e
	WNh8R0mFnDKppcIxlTRYjxy1XQAO8a/DGT5703BLEWETcgU6HE1yrkcH0wgVqdqQFPbSUaNninM
	gwKXqSR7qYGalJtr/425m1yQ1W5KGGxkslRcdQ4iFt/Xo6+RMNsNniJ+WjqkgSa90sf2Mh3u6CS
	6DnGWDdGIMmYJEznQbqxsm5nxKGMzc3fKZSCldf0QZuyhSx+Fb2ttvM/UqtW9hkFhnJXm39+Bbr
	sW4XnFmLwfuLSOuyQOy0M3GXiQVAk5lw9eh0HBtNY23UDOQOY1biIfk7dsA0e1
X-Received: by 2002:a05:7300:7306:b0:2b7:2664:aeae with SMTP id 5a478bee46e88-2b7c8942454mr6177131eec.37.1770045884054;
        Mon, 02 Feb 2026 07:24:44 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16cfaa8sm19624057eec.4.2026.02.02.07.24.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 07:24:43 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8daadfff-a8c8-4775-93de-72088f929f9f@roeck-us.net>
Date: Mon, 2 Feb 2026 07:24:41 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i3c, iio: fix i3c driver dependencies
To: Arnd Bergmann <arnd@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jonathan Cameron <jic23@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frank Li
 <Frank.Li@nxp.com>, Andy Shevchenko <andriy.shevchenko@intel.com>,
 Carlos Song <carlos.song@nxp.com>,
 Adrian Fluturel <fluturel.adrian@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i3c@lists.infradead.org, linux-iio@vger.kernel.org
References: <20260202095628.1254175-1-arnd@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260202095628.1254175-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/2/26 01:55, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> All combined i2c/i3c drivers appear to suffer from the same link
> time problem when CONFIG_I3C is set to 'm':
> 
> arm-linux-gnueabi-ld: drivers/iio/magnetometer/mmc5633.o: in function `mmc5633_i3c_driver_init':
> mmc5633.c:(.init.text+0x30): undefined reference to `i3c_driver_register_with_owner'
> 
> This was previously fixed several times by marking individual
> drivers as 'depends on I2C; depends on I3C || !I3C', but this gets
> tedious and is somewhat confusing.
> 
> Add a Kconfig symbol 'I3C_OR_I2C' to help replace those dependencies,
> and use this in all the existing drivers that had already fixed it
> as well as the new mmc5633 driver.
> 
> Fixes: 6e5f6bf2e3f0 ("iio: magnetometer: Add mmc5633 sensor")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/hwmon/Kconfig            | 17 ++---------------
>   drivers/i3c/Kconfig              | 12 ++++++++++++
>   drivers/iio/magnetometer/Kconfig |  2 +-
>   drivers/misc/amd-sbi/Kconfig     |  3 +--
>   4 files changed, 16 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 41c381764c2b..1ddb3f73fdc0 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1493,8 +1493,7 @@ config SENSORS_LM73
>   
>   config SENSORS_LM75
>   	tristate "National Semiconductor LM75 and compatibles"
> -	depends on I2C
> -	depends on I3C || !I3C
> +	depends on I3C_OR_I2C
>   	select REGMAP_I2C
>   	select REGMAP_I3C if I3C
>   	help
> @@ -2381,19 +2380,7 @@ config SENSORS_TMP102
>   
>   config SENSORS_TMP103
>   	tristate "Texas Instruments TMP103"
> -	depends on I2C
> -	select REGMAP_I2C
> -	help
> -	  If you say yes here you get support for Texas Instruments TMP103
> -	  sensor chips.
> -
> -	  This driver can also be built as a module. If so, the module
> -	  will be called tmp103.
> 

Why ? That doesn't make sense to me, and if it does, it seems unrelated
to what this patch claims to do.

> -config SENSORS_TMP108
> -	tristate "Texas Instruments TMP108"
> -	depends on I2C
> -	depends on I3C || !I3C
> +	depends on I3C_OR_I2C
>   	select REGMAP_I2C
>   	select REGMAP_I3C if I3C
>   	help
> diff --git a/drivers/i3c/Kconfig b/drivers/i3c/Kconfig
> index 30a441506f61..626c54b386d5 100644
> --- a/drivers/i3c/Kconfig
> +++ b/drivers/i3c/Kconfig
> @@ -22,3 +22,15 @@ menuconfig I3C
>   if I3C
>   source "drivers/i3c/master/Kconfig"
>   endif # I3C
> +
> +config I3C_OR_I2C
> +	tristate
> +	default m if I3C=m
> +	default I2C
> +	help
> +	  Device drivers using module_i3c_i2c_driver() can use either
> +	  i2c or i3c hosts, but cannot be built-in for the kernel when
> +	  CONFIG_I3C=m.
> +
> +	  Add 'depends on I2C_OR_I3C' in Kconfig for those drivers to
> +	  get the correct dependencies.
> diff --git a/drivers/iio/magnetometer/Kconfig b/drivers/iio/magnetometer/Kconfig
> index 2b81b22c9550..448fef4e5716 100644
> --- a/drivers/iio/magnetometer/Kconfig
> +++ b/drivers/iio/magnetometer/Kconfig
> @@ -143,7 +143,7 @@ config MMC5633
>   	tristate "MEMSIC MMC5633 3-axis magnetic sensor"
>   	select REGMAP_I2C if I2C
>   	select REGMAP_I3C if I3C
> -	depends on I2C || I3C
> +	depends on I3C_OR_I2C
>   	help
>   	  Say yes here to build support for the MEMSIC MMC5633 3-axis
>   	  magnetic sensor.
> diff --git a/drivers/misc/amd-sbi/Kconfig b/drivers/misc/amd-sbi/Kconfig
> index be022c71a90c..30e7fad7356c 100644
> --- a/drivers/misc/amd-sbi/Kconfig
> +++ b/drivers/misc/amd-sbi/Kconfig
> @@ -1,10 +1,9 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   config AMD_SBRMI_I2C
>   	tristate "AMD side band RMI support"
> -	depends on I2C
> +	depends on I3C_OR_I2C
>   	depends on ARM || ARM64 || COMPILE_TEST
>   	select REGMAP_I2C
> -	depends on I3C || !I3C
>   	select REGMAP_I3C if I3C
>   	help
>   	  Side band RMI over I2C/I3C support for AMD out of band management.

