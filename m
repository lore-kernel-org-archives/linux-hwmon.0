Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B8617577
	for <linux-hwmon@vger.kernel.org>; Thu, 23 May 2024 21:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716500881; cv=none; b=cWRUf8Btl8bUow/bKmw4489qoHSttamwbvc455TZUhbZ6NVGivE4rio0EbtRbVC+RQoCvSmjv7/SWp20McuQFSvZFIGOWhUjMQ3YmZvnCnoX5N2VFWLrTECcpMS8tF7WalPiUFnXi2uEY/BNwplVCtVE5xMOuEElO7r5v8ssVuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716500881; c=relaxed/simple;
	bh=oSS37f9Nte6A51ODmpSJhzBNDDvL9Vw2Kmw1aldCbnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SPRYLg4jxslaI/jmPXs4NhK1Qcaj9G8f9Vb61sjNCHNl5rBpkLdYzNXBHmD7gZ4DjJVMih7OYVMysKyvxlY7csoNiCEPgczLlSUO3fbU/MyydlaPenQgyw+qir/oOUhWDIdofMDtHm7ErTOKiEvPgJWvLtfAjmmGwfxUplDqNdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XviVVFSt; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XviVVFSt"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6f8eaa14512so253958b3a.3
        for <linux-hwmon@vger.kernel.org>; Thu, 23 May 2024 14:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716500879; x=1717105679; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Iy6whbU9RHBa3w198zAq+OllYSI4GPStO5uNLAV0+EA=;
        b=XviVVFStzop8TewBSsXSCsHW7UMuKCS68RZBVz7ZbMy6snRHyup0bYenD8tVwi8Y9t
         TkR9L11eQnqs9mY8RYGKMI/JQ2VRCQyTl0/7wTwJ1LfHQZ6zu7IHOv3R1MsTh5gUQ4JC
         YrDk1SF5+uQClEV8bYqBqIzNz8Ib7v2vTJSqJnGpcEw0JHiOn5bGn0GfmCfA5CwcL28L
         OKDuhc8WBll4BzLD3qXbUHvxbJikmkElfO70Yv2OlT7cjfDYS/UxGbxzRF/HdBTRN/Ln
         Ejvp+lkhSRaw3gm0HxQdrWeP7NLV7ekxPgv5pRYO+loubWiKblDpunn6WALydW5Sqw+I
         QgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716500879; x=1717105679;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iy6whbU9RHBa3w198zAq+OllYSI4GPStO5uNLAV0+EA=;
        b=FifI76kFWI4wbvgqKBgwsx+YlqhDQcgTlWQcfQd67aalO2DwCNTlLYxLT3xrtARpv0
         DCs9SOZAEJ7a8eSjJnbr3BN5rQ/yCvPQokU5eKd11qbo9QzUfa71Tfz4s7bcclHg7DwB
         42eue/xUsmjgtDwY4MKeitZiONlWQ9tg9Dw5+Dm6v19AUaMnUCcsuoF09K+96A2yA69e
         8wasmjNS4Jt1SCdkokZwHy99A3ceSd2fgehW0bGT3mGn/AkLErpWfFy4S+X6dxoD7zPx
         2wqSW+TG24h9+Phlx4WnVcBpX0bnSoeQhJweqLnz3JHWaoi4zgrOis+xWdU5OHN++fJ2
         BAbg==
X-Forwarded-Encrypted: i=1; AJvYcCVOB0VnrWA/O/rCI+mcdkjh4gZHArINjfus3fcPA4EcNnD3G9hPZgzTl6SzCEl3t+5jM+/NkzwP6Br7f/wVt0VRx3nH8pTb0r2hl1U=
X-Gm-Message-State: AOJu0YwyiezJ/0WXOMmBFJdf9+ZxM94JotfgrDNMBJHwzUJw8SqFGLD9
	ce3cXTfeZ28wuT+jmLjhyLV/rKeqBmJECB9xAQLnRAgtaRYDFRgH
X-Google-Smtp-Source: AGHT+IEP9AjshViNEBjHvPOxG+UTs7dAe81p/sPXQ3HzafHIyhqSgGXWC4c+pcw9eZwyK4WcbvuVVw==
X-Received: by 2002:a05:6a21:3282:b0:1ae:84b3:bb62 with SMTP id adf61e73a8af0-1b212cc7319mr955191637.12.1716500878803;
        Thu, 23 May 2024 14:47:58 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6822798bfe7sm21194a12.94.2024.05.23.14.47.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 May 2024 14:47:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <cd58922f-711e-4125-8214-57e1f83f6777@roeck-us.net>
Date: Thu, 23 May 2024 14:47:56 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (nzxt-smart2) add another USB ID
To: Aleksandr Mezin <mezin.alexander@gmail.com>, linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>
References: <20240523203130.75681-1-mezin.alexander@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240523203130.75681-1-mezin.alexander@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/23/24 13:31, Aleksandr Mezin wrote:
> Fan speed control reported to be working with existing userspace (hidraw)
> software, so I assume it's compatible. Fan channel count is the same. No known
> differences from already supported devices, at least regarding fan speed
> control and initialization.
> 
> Discovered in liquidctl project:
> 
> https://github.com/liquidctl/liquidctl/pull/702
> 

That is not an appropriate commit description.

Guenter

> Signed-off-by: Aleksandr Mezin <mezin.alexander@gmail.com>
> Cc: stable@vger.kernel.org  # v6.1+
> ---
>   drivers/hwmon/nzxt-smart2.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwmon/nzxt-smart2.c b/drivers/hwmon/nzxt-smart2.c
> index 7aa586eb74be..df6fa72a6b59 100644
> --- a/drivers/hwmon/nzxt-smart2.c
> +++ b/drivers/hwmon/nzxt-smart2.c
> @@ -799,6 +799,7 @@ static const struct hid_device_id nzxt_smart2_hid_id_table[] = {
>   	{ HID_USB_DEVICE(0x1e71, 0x2010) }, /* NZXT RGB & Fan Controller */
>   	{ HID_USB_DEVICE(0x1e71, 0x2011) }, /* NZXT RGB & Fan Controller (6 RGB) */
>   	{ HID_USB_DEVICE(0x1e71, 0x2019) }, /* NZXT RGB & Fan Controller (6 RGB) */
> +	{ HID_USB_DEVICE(0x1e71, 0x2020) }, /* NZXT RGB & Fan Controller (6 RGB) */
>   	{},
>   };
>   

