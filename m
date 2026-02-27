Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4509C361668
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Feb 2026 04:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772166937; cv=none; b=Lf5xHhEo7q50dQX+1JN7a4xokTzX/KadGjdxWe1Sf8Pp+lDOTTWIHMsqWXo/nETMKrnULPiKFLvDqhzMTDRV8NosGNPhGDUijYLIjl+zgq6OdePzXMJImvCGW+sAT7ZGKmNEp3XbEGHg+RD3kEOKp9Ek4KpWQvFz2/09L/9aWsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772166937; c=relaxed/simple;
	bh=SWHzJ90SdLnzw1kw+7UlOAwp6++K7g1f7cyLLHrhZGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ecqKMNyvlIToSmiZlO9tskAsHU8vDXkoNaFMR25DbmxmGtcZqFjpf8tSnkInf+WxoMqMopVuiQIcEHlRrit0mOWqviAZW6IPGh9SEMaSO4kxIi6UdGkfishbtjrrXS0uG1Vk8xW7Hi8H2JUPnX3yW4XTefxDUdSQZ9JeJdN5y8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=REHVBIjF; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="REHVBIjF"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c636487ccaeso550010a12.1
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Feb 2026 20:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772166935; x=1772771735; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Zl5ub3QzzN5bD+RwdIfU/p2iJGD13syZruWCSfGt9ts=;
        b=REHVBIjFvx/HPBH2u31rjJ5NN6AKhF3+xyX6Ltj1FFHa1oOHtHP9ZgJy0Qlrm5FgN9
         JDpH4Rwt4mBA41yePhGOaPOTF5DMOcCaI1XBhnZqP6QObeD0ew0Gr7o2pfYYgYlTdfyt
         ofZm6hq5G3z5hzVxw9hkuvLhH62AfWeGybwnU/HjKlG2SeVxqaM/RZ2kOu6AvAGUL1Vw
         MVB47LlrznV9qaTqsLuJw69oMp7u5RFpL09DTcRAELsDYL5tBAQcFM5LSKF4xni/p982
         +qlpBluBrt5RByWYbV5yRSlPTm26FaOGMhKVB+4IrkKDWZrx35RHAjm6TUO0QyvA5Fnl
         r3Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772166935; x=1772771735;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zl5ub3QzzN5bD+RwdIfU/p2iJGD13syZruWCSfGt9ts=;
        b=A1OG8T90kSi+WSc8mo7AqJvVxMKY3G+A3WwBcVZa6IZ1iSjkXqMQJ7IbkU/uiJjoVT
         C/kRJqoQ0lR1qqlXVGoQ/2PxaPL+dKfkABqCAUiY8NDTmjIPqzIW1spBQU9mQSyLNWJL
         6uv3Fz7WMJEQAlcAlMqoeQIaOiQ7pe7BVP3AyXgmvEfJ6j2K/jb4bTNccOdCJ3BAYm4z
         PY6nAwWvwMsLICNQgaCpz77xWC9kyNcvJGGYCA67YUVDdARvfcK0XTqBYbQHZPnPvudM
         ySiT/G/Bbj9OoZrq1gT3MYAob4pmY+m2VItVCw/ULbLDRFklhgsePfRMfhaxYhuzNZV6
         F4Hw==
X-Forwarded-Encrypted: i=1; AJvYcCVIHFMWFYVk6cVr0+VZakwO5as5mlgCb1n/8ltP4IyjyORyEEdKNF7EbwvyMWYmOMvX72VPEgbk2kXL3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwazjD24GsOcthbpbRtYxKqz8neBG8clbg73ok24joGAJqbmwlX
	L823l54AtlKUmslJL8r9FOy6yJpv9KTDgXw7dFY91Yp9UQbPIbYd7a1k
X-Gm-Gg: ATEYQzx/dYvWB9HhMS2zzAwyEV0TWYmjgGXULazChW2IZiiBXpvCjoNB1KPCugUn0af
	6g46yGrmFT+3ZLM6+yFi169/ZP3qfuQ3Ew81DjXOda/KBm0EhsF7OyQwL4d09hLx7plI/IMOtJs
	ZlhJUtiEdwUsJQcjvqbHW+Fem4R/ql9CHi6kOb3rdG6dB0Yf5Xex+PMQo5UfIuVYFuFdl7blJG8
	doaZqk/w1h7L826CkZSffhg9HsLHfNDLxSRqCRjGJIZJbwuOOGHJFccZDY9oLBFzX/llrcFXUJk
	CwnokMpYJsUxNBj+PxDQdswrbfcmyOZhktpyOf47ybZnFqYLFyD9TpmxRuRgFMMw9TTx7H10ErB
	N02HgOckuREsd6BXy0aXiGycaXmnDDLD70Rr5Bn7lgetjOpWYS4NwSCnCSSScRcXPlSrWNi5FPX
	MuIg3mzD0lXJcxZ3asUgV7TmJ+Xos5ukWbubjrNgDTYYPOUeQQKr6MHDEuSlgWdJvKwdS1KSwR
X-Received: by 2002:a05:6a20:ce4b:b0:364:be7:6ffa with SMTP id adf61e73a8af0-395c3b0f610mr1836593637.36.1772166935523;
        Thu, 26 Feb 2026 20:35:35 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3593dcad21dsm3588106a91.4.2026.02.26.20.35.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 20:35:34 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <501be986-17b4-4fca-99bd-25c669f2b39c@roeck-us.net>
Date: Thu, 26 Feb 2026 20:35:33 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: gpd-fan: replace custom EC I/O with kernel
 ec_read/ec_write
To: Morduan Zang <zhangdandan@uniontech.com>,
 devnull+cryolitia.gmail.com@kernel.org
Cc: CoelacanthusHex@gmail.com, Cryolitia@gmail.com, corbet@lwn.net,
 jdelvare@suse.com, linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, marcin@stragowski.com
References: <53C09CAECC90EB98+20260227024945.151198-1-zhangdandan@uniontech.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <53C09CAECC90EB98+20260227024945.151198-1-zhangdandan@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/26/26 18:49, Morduan Zang wrote:
> Replace the custom gpd_ecram_read() and gpd_ecram_write() functions that
> use direct I/O port access (inb/outb) with the kernel's standard ec_read()
> and ec_write() functions. This provides better abstraction, improves code
> maintainability, and ensures compatibility across different kernel
> versions.
> 

It also adds dependency on ACPI. On top of that, it is quite obviously
buggy (see below).

> Signed-off-by: Morduan Zang <zhangdandan@uniontech.com>
> ---
>   drivers/hwmon/gpd-fan.c | 37 +++----------------------------------
>   1 file changed, 3 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
> index 1729729b135f..c44957b7fd91 100644
> --- a/drivers/hwmon/gpd-fan.c
> +++ b/drivers/hwmon/gpd-fan.c
> @@ -19,6 +19,7 @@
>   #include <linux/kernel.h>
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
> +#include <linux/acpi.h>
>   
>   #define DRIVER_NAME "gpdfan"
>   #define GPD_PWM_CTR_OFFSET 0x1841
> @@ -243,44 +244,12 @@ static const struct gpd_fan_drvdata *gpd_module_drvdata[] = {
>   // Helper functions to handle EC read/write
>   static void gpd_ecram_read(u16 offset, u8 *val)
>   {
> -	u16 addr_port = gpd_driver_priv.drvdata->addr_port;
> -	u16 data_port = gpd_driver_priv.drvdata->data_port;
> -
> -	outb(0x2E, addr_port);
> -	outb(0x11, data_port);
> -	outb(0x2F, addr_port);
> -	outb((u8)((offset >> 8) & 0xFF), data_port);
> -
> -	outb(0x2E, addr_port);
> -	outb(0x10, data_port);
> -	outb(0x2F, addr_port);
> -	outb((u8)(offset & 0xFF), data_port);
> -
> -	outb(0x2E, addr_port);
> -	outb(0x12, data_port);
> -	outb(0x2F, addr_port);
> -	*val = inb(data_port);
> +	*val = ec_read(offset, val);

ec_read() writes the return value into val, and returns an error code.
So this now returns the lower 8 bit of the error code as "value".

... which of course means that this code was not tested, and who knows
what the ec_read() and ec_write() functions actually do.

This code is so bad that I won't trust any subsequent versions. NACK.

Guenter

