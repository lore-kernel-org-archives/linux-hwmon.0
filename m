Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D09337B9B
	for <linux-hwmon@vger.kernel.org>; Fri, 14 Nov 2025 15:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763134183; cv=none; b=UYPUTzuSmXy7/nMhPHndn/GFLCZSliikzyQcyy8xsGmLTZ2SjQXaXTuNjSDrB7qE2Vfi3CXEFw1Ba79rEI3sdYZYKB19foPByUe8QOw041YOYCgrNgvABRA071HeKwcldlXOsE8Jfx6VpdNQCpoCFwSvhujnfGOY6R6p5jn6izk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763134183; c=relaxed/simple;
	bh=DaXWtoQvGbFzhT23Z4AmkN7jx8CjZ2L9trGYHFixPco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BCQUiQLUCSGjQrMpu62BNoAqrTdEtprCJUdjlqQ52evrzr8W4JlwNIv1qexMncKeZPpQ/TygJE5k5aD0j1lqudIUlIJu+48LqwPWZTgJvByYmhexX3W9OmSrQBxTgHnXOwnfTtia23n9D16L0OMyvHu4mMHTzR6g8cun3v2ep5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YCpqkwWC; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YCpqkwWC"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-343514c7854so1907895a91.1
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Nov 2025 07:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763134180; x=1763738980; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=PsT3lrmyivI6dlbWqm9TLeAnXyj52XDDeruC1J/VoIs=;
        b=YCpqkwWCSmeZEHTBB9rRJ+VP5svigo+4sECfGRjVkPOl25u6dR5MHCMs1mXVk04CYr
         tfGDPBz738StaKQ8YTabAtCvL+gBfnKGfLG1gnBo5CPhxlS+sNoePjv4Z42HJbztt5q8
         pG6OHTZR/hNLxrQ9n/T4o//PoJygaoOZ20H4N4NiEnCfzO3M49xmg6vRwNnDoxkpZYZm
         BNlXZF6Sio5ggiaK4xHxlDy2xPA3LK20lcEZjdtLrQzuGdSOJ9lEP4cleQWXgrV57QVP
         nfpxjnrPnWRi3nTgv8n9KZdBKpdtR20ptNE+cNNCOMXtBQoFnwkVB6mAeZQ1KomQMSPC
         XUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763134180; x=1763738980;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PsT3lrmyivI6dlbWqm9TLeAnXyj52XDDeruC1J/VoIs=;
        b=Yy1wpf/CydRePcsIJEInKQjnjPk0qw9cgdL7brVCVPPXwRUEEGDVvcT2GNqt78XGtZ
         VEDuiOSG7aebrXScbRzZnJiKVQMu0M3JiacT4qnd2t8xJkuabJySNJHFPM739jxuaey4
         4OI9Y1Wr/xFa3ceqxQhadJIFeZSVA3taJPktppSg2FINNtgR9ejpt129pe27jq9fhezb
         kwTm15LS/cCgbhoRjFsta5L0RS3+/hXudHi21uF/PfDBrSk/qmyvXSXaIoZNrAOs2snW
         TbQ6r1j4Vp21lc7qwkKYtdiCk3qwe06xgJ1/MN8AC+ykirrBcZVwS767+IQIoGeHOOnb
         EEjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUc9v209Jk4hO6T4xqJFC6PbWtSmxT8sUer7VyAJA5V9BHrDHluDWP7xsbU7FdTdCoKvSYwecKTtEw08g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyL764iNvqTSS8zgdgKloXtxgzfika86gb0/JrrPOWFV4JyDrxl
	ZzksqnWlTivbmC8D9faxRAKcbznHjqQgt8ThGkygP14Dtz5AY2m0nb2S
X-Gm-Gg: ASbGncsz2X1bfs3ifIT5ODKjCWLNgmrn+eHJWXL4lkaxA2TJcMqc4yKsmLF2eky7LpY
	kcIsrNlyEbMu4p0gaIikkQAb6rLENew0qDjheIC7gACwhYJDbO6NYQrc383JchzNZ6O5eKS4ptq
	37/Zf69volMS7XflW/HUqDPESPjxMU0RcEOOxs2wwEBAGxLhBSzcEaDgK4FISmPdCBpKEBD48XW
	XEFEP7fEIdr8sFoI3suBlV6981MxEm9jfZySYiLhHCHvEAu59Jr6gGcwIQmPPETd48bNo5XX8Zn
	egKwmns/oT+Az4o1KNz6fHfOSp5/yARroidIhKsnc/zgsI+POUAG7rkj18ABe3Q4QgR/ipFx/aF
	ZYRAEviEf24hmWLfXh+mkGYVWDI8FUO/Yr3T52LXv7Trdvd0V6vrtsK96RbqUecuPhS4lJItm43
	Yc5PROQIXgDo0CPp9oV9LYAF1Be2bXK6Hlv1X9JBNj6G/qTUSn
X-Google-Smtp-Source: AGHT+IEKH71Zp+WAxHUvXFFGVsxCN9nyQENffoSzY9TPYYqDI8LI587T5fi80waT/YblG0WXJ5UcSg==
X-Received: by 2002:a17:90b:1c10:b0:343:6a63:85d5 with SMTP id 98e67ed59e1d1-343f91b2b48mr4450897a91.16.1763134179901;
        Fri, 14 Nov 2025 07:29:39 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3456518b32bsm830219a91.16.2025.11.14.07.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 07:29:39 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b6275c17-b122-46cf-a819-54fecdd30803@roeck-us.net>
Date: Fri, 14 Nov 2025 07:29:38 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: tps23861: add regmap_bulk_read() handling in port
 resistance read
To: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>,
 Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
References: <20251114150045.2230687-1-Pavel.Zhigulin@kaspersky.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251114150045.2230687-1-Pavel.Zhigulin@kaspersky.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/25 07:00, Pavel Zhigulin wrote:
> regmap_bulk_read() was called without checking its return value
> in function tps23861_port_resistance(). If the read failed,
> the code proceeded with an uninitialized register value.
> 
> Add return value handling
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: fff7b8ab2255 ("hwmon: add Texas Instruments TPS23861 driver")
> Signed-off-by: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>
> ---
>   drivers/hwmon/tps23861.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/tps23861.c b/drivers/hwmon/tps23861.c
> index 4cb3960d5170..8873b2e21064 100644
> --- a/drivers/hwmon/tps23861.c
> +++ b/drivers/hwmon/tps23861.c
> @@ -457,13 +457,16 @@ static char *port_poe_plus_status_string(uint8_t poe_plus, unsigned int port)
>   static int tps23861_port_resistance(struct tps23861_data *data, int port)
>   {
>   	unsigned int raw_val;
> +	int rc = 0;
>   	__le16 regval;
> 
> -	regmap_bulk_read(data->regmap,
> -			 PORT_1_RESISTANCE_LSB + PORT_N_RESISTANCE_LSB_OFFSET * port,
> -			 &regval,
> -			 2);
> +	rc = regmap_bulk_read(data->regmap,
> +			      PORT_1_RESISTANCE_LSB + PORT_N_RESISTANCE_LSB_OFFSET * port,
> +			      &regval,
> +			      2);
> 
> +	if (rc < 0)
> +		return 0;
>   	raw_val = le16_to_cpu(regval);
>   	switch (FIELD_GET(PORT_RESISTANCE_RSN_MASK, raw_val)) {
>   	case PORT_RESISTANCE_RSN_OTHER:

tps23861_port_resistance() is called from tps23861_port_status_show(),
which has three unchecked calls to regmap_read(). It is not entirely obvious
to me why checking this specific call to regmap_bulk_read() would warrant
an error check but not the calls to regmap_read().

Also, I am not sure if it make sense to ignore the error.

Guenter

