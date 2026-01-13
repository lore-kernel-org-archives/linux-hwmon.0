Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358BA2D97AB
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Jan 2026 15:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768316781; cv=none; b=ssW2Ne0Mk8j2ssgCf6C6C5XtEQDbdB6Qlr7H+Zju4lZUTS2PtnkbRqurnsRtZWHNXg73+GxUrnysVNCNPn4JfdeaIZXqvk7YU5pxErDN47VwsL6K3h4+iIb44WvZPAM/8ZaSPcCUMnej7EquJFlYNCU6IogIMPa47qYuJhknC/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768316781; c=relaxed/simple;
	bh=ix2vEkDxkx/qX95hGyUcQ/EDh6tqbhd+51wFSLA0+Ro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Acy/JU9DZTd6Yuc8Wif1GWh++0sZVNoqcf3yp+RDu6mTUvzcbNovoyNstyZREr+ZAYZji5OEt05U3zWreQ6HsitWOvpBi0YtMCkAHbaGfN53E6fMGtLrpJ4celFlA+qSK7J5ZdPk19GP1pfdaNLTqtpFeITY0yXa5THo48HF4E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RH5Crice; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RH5Crice"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-11f3a10dcbbso6957864c88.1
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Jan 2026 07:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768316777; x=1768921577; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ufhPzoOtPDqdj3uM9a6Vgcwlr1IUsrf3mDuYDzQ15Kk=;
        b=RH5Crice1SZMIIOfGNzD2B2lyWfRGv0T2g1rOWJLuoRosUKVw8EqrzLhxOxS5LLKTe
         FkW20IXT7rGmrg/hv1zkTwoCQ4j7V6ubNKg3+7afjFb2O1KcrG3eQiJwb/BgkIRjJOdY
         dK8O5hz/6AiWaKSMIcwYDNXs5QQlO25hLBlcsmIzlE5W804iDo6G8EWSKyZz3jQMtRFj
         QwT19ifH1wjH11OAr1+rWDmZ8+A7RWkPTWnv1vlL+tJDrfKRA1dmJ0B32T3VR+mN6bAU
         zzB+/meZS94htQZMn0b1Xj2MuSUg0vzFq46eHijTuV4hLrgkm6RB0nf/JIJFoTRF97CO
         udug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768316777; x=1768921577;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ufhPzoOtPDqdj3uM9a6Vgcwlr1IUsrf3mDuYDzQ15Kk=;
        b=HTyR+7XxNY5/l2akyNRznZ0XdW41unN+IIkD3yyMqRpnSiVH7XUHlamMvhL3IinHsG
         VfNCIUQZgNmA81mO+AKeY7Qlq/ap9o04bFRNDHLWZUSiASBmhk3CnbIYQsNVvg66au5p
         msH3sP4f8ZUuRuWSPfgK8lLPnXG7RssXncwhzQySyUmACga/S2ODb3kkHd/fjcZvbmOk
         lCZwXgjVy9uk2wSX8BVtjcCbS6yUKT270UzlT1BUQWZuLYhIkWWNZnD/0JudviPFYE3q
         J2gPtZZDaV9SjAO/SzFxCIIRytapnSm2gdwHNxVbHhIoc1OqQAEOgLA+3nu9eWW40bmA
         vtNg==
X-Forwarded-Encrypted: i=1; AJvYcCXciSvsbn7C+EFcO9+NzJvWTaHCStahz+aZIoCbMwLJhZN4oaITVRcAVx0i0k7p0lZSk2ifbHxencjmFw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn8qXnbDhv+qdgQneVHtbqDOZRXwkU1sGgJSGwMJE7OMgUhasa
	mlBrWbOAj3XRlwxe7eXoTuO/Zw5Updd+D9DcdOIPVEcGTPkaW252wvZc
X-Gm-Gg: AY/fxX655w2fBmkTcEZQ09qqlfizfMYt0+vBlY7cbLEW9WLLZp10JFMQIx6vEYEbBw0
	Opy2l97XAgwhVZwt9rtx9sO2TjJsmP+HnNIHdjDdPjX3GNHWyKxwcze5wUb+/RugEIOPgYoGSyL
	TIBC6t1Q7tivT7qVvlnSjbCMQa4Wf/DCnCkHcEvvbCCZum3enzOPmgIXu1dbmFMiG184udeqcXI
	2TLrBP7dw7MCuDwgG1Xz5KCNtisv0DnonGz8k7xtYV5nL7OnGqBM126pgaQRhS/WLAlp3hMoQHk
	ecbT9YkvZMZcz37oeAjD7pyv3B1ZutZKhep+T0iwpISxi4Dvk90h/BlRRHU/UiM4hY6o86OvUXo
	luVBrJ4H2lAwbGQwFCaz5wApgFrt9Tfef3ey0DLOxu8jbwnedsVOq0gnksnvtfLYIkf/KojLgX/
	/ngiEMuX1jw2kDg7WRc7ax2W9ZM8KVRYzVZaxPM+2Yrzcnm4lteq5sBrwE8kf4pkIa41x/NMk=
X-Google-Smtp-Source: AGHT+IF7WOOz0yQrTGuA2ALq/uQDzLgxDrQjELDB7LIj01YWLMg0N+tr7XNBcTzfkwV+Rkk4zLqBBA==
X-Received: by 2002:a05:7022:150a:b0:123:2cb4:7346 with SMTP id a92af1059eb24-1232cb47496mr3454339c88.33.1768316776892;
        Tue, 13 Jan 2026 07:06:16 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f243421esm27894312c88.2.2026.01.13.07.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 07:06:16 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c4f9e253-ae23-4ba2-b70c-1dd3c37dde0a@roeck-us.net>
Date: Tue, 13 Jan 2026 07:06:14 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hwmon: (tmp108) Add support for P3T1035 and P3T2030
To: Mayank Mahajan <mayankmahajan.x@nxp.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: priyanka.jain@nxp.com, vikash.bansal@nxp.com
References: <20260113085207.1608-1-mayankmahajan.x@nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260113085207.1608-1-mayankmahajan.x@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/13/26 00:52, Mayank Mahajan wrote:
> Add support for the P3T1035 & P3T2030 temperature sensor. While mostly
> compatible with the TMP108, P3T1035 uses an 8-bit configuration register
> instead of the 16-bit layout used by TMP108. Updated driver to handle
> this difference during configuration read/write.
> 

This is way too complex. Use a single regmap configuration, implement the chip
accesses in the driver, and map the 8-bit configuration register to a 16 bit
value in the access functions. See the lm75 driver for an example; it does
exactly the same.

The remaining differences are

- Conversion rate. Use tables, like the lm75 driver.

- The new chips don't support hysteresis. Handle in is_visible function;
   that is what it is for.

- Configuration
   - Alert polarity. Not supported by the driver, so don't care.
   - Configuration bit 2 (LC = Latch Control vs. TM = Thermostat Mode).
     The functionality is the same (if set, alerts remain active until
     a register is read) and should be set.
   - Hysteresis. The value doesn't really matter for the P3T1035 since
     it is in the upper byte of the configuration register which will be
     ignored by the chip when written through the regmap access function.

Thanks,
Guenter

