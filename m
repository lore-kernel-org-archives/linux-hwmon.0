Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911C731AA87
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 01:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778722649; cv=none; b=GPdt3ZFHCoyD92+YeLgX/QODsATHnmn/4Lqt4JG+GJrJc5zV1p9UycRWbvdB+IPFlvj/HXPTI+2a14A0DOgBhQviLcF6webFwqbmP1GZh1irh56OE6G6EJGFDFDqXlcFeUwSM5gFDUq76AGGreJiVx3utr8u9+m3mIqc8Vgg3qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778722649; c=relaxed/simple;
	bh=karPUL7ncg3d13Kd5U+OLYVeRtGIGRUhNgVga0LzLMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bNWjIRsCSrTxoDBdmoUMIz+cMNlFErcvrqqfQ8G2Iz9vwXUrSKTKOscPTiMWsz2wcrb836dnvgYl8viJi+dEyLTf7iT6nxsdqLEYbZnhQjvlZBlTKtlhPjsAd8/1VjI3xbIGkRUoEDGci4dGnvbizMk54WEEsdTox23E9a4GJkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ARyHIgez; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ARyHIgez"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8367df48711so3525744b3a.1
        for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 18:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778722648; x=1779327448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mAKAJQbl4Cd4/zopDe4p8caMLQ0m6LhmzJdP+QLvBb8=;
        b=ARyHIgezChsjkRYZRz6gk6Gvlq5a8iil7gRA4n04ddnLzQ346xnDefYWoPt5x6FR9e
         dhTLN5k9lolD9J/K8nUqm+BTgMjsQGL8kK37wfo8tADPKZTreBFEalK2sSBepVmxLXNB
         1oloJCYJRFtQm5BFsRbu3tBHgLkpVOGJxxz1ZtHPfs9HnxQn56PmfQoeLaIQOJ/YD2Sb
         stcrJG3tH4LAyea6YKbSei67P6FDORsXD7tpsGxekZA4ezlHVNOEHwyPT0F8ZNFlQGa0
         1lx+AXvfQ2EYsWzgLjkKbjvRg84FZ60P4yM1LTY43v6FbXb7rU18/0K99f8CMMkwbgDP
         9MHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778722648; x=1779327448;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mAKAJQbl4Cd4/zopDe4p8caMLQ0m6LhmzJdP+QLvBb8=;
        b=F7xqvYrPb+5w7kTZcu/7wDv6Ew8h7OFqT+7KB9jJDmpCOdh+pVICTAjIqeDteAvqyU
         g3Kf8YIdkfwfrthGt4RRzrgbAE7TWkGZABA8OopcCgeA/iQXad0PwOKTmU8N9pdm3BCf
         usE+3X0pKkP6TNa3tR/yAEOxcewoEaK+OhNFqeHwKX5ArO3oEjyuEsfDCZWyAzPbrPTh
         RO661/WrF+lH3yNPBQX1VA3wsZQlhsbUd9jY0hO1uKxmPsAzzsxqVotMXqxDWm/rnTuT
         CLuJ33ub0gVnEn+2j5Hhe1oBmRCV7/IfLUIu2w04/i7uJby/dzjRfzGucg2pO6rM0cCG
         LftA==
X-Forwarded-Encrypted: i=1; AFNElJ+4UIHQbiVOCXFd1ADC6d/x9SkEpZjtP0km5X9RReEAYlu09tzl+mA5slrl7rCoLnqWfLs0xIGoXab0SQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcUgC74rPoCfBDOaONozh7chUe9r4og2O4vpedTet2x+A1a0Ne
	YxDKYCbQ/ORTYhCs6alb7vzS6jZ2AyigxF+E23hjNezuEBiMU6PTgbIiQysgNw==
X-Gm-Gg: Acq92OGv8pykxEQuv/SKdxQtN3r3bKl3YP0pSYUa93Vei3W+zELz9wqKsoWcRbApEmL
	CSqqPI8C3T+c8TZ92AeQvzLwjMHPCg+DZMU3xw78ZCUi5zaXei85Wn02zIX4Y0fjZTqYYH0XgbO
	aWLRkH0GqVA+Ib39P+sWEwUsOqWD5rYia7o/d+9+xKR9JK3nEpX4cIXHeBgQztRHlc4axK9HomB
	cEVv0XpOQdKoldaN4fwbEvJ+KeMDDko2QOLTvDO8YuuQUdh/VqJZ3VpdfJCyQM6yJ8d79p9/eAJ
	yIiPGHpawvIOxFTPJ3vGIw8e1pT87syxZHCheoJSeuw3mDgUmhn5GHwVkGtZvBMLDv6+k6crzzd
	zoBYZaLPLqh0S5Re1VLkA8rpbp6V/H5EtJUHhElmWPH6TVFmPE19ubxsDEiYjenQom1qo+LobYk
	HRQnu4sUdbiZoce5oHe+3hX1BHHcCKORJqy++ST802loMwHrEa+ad5GGN8QW4shdlmEVWGRu4N
X-Received: by 2002:a05:6a00:4404:b0:837:a211:4ed0 with SMTP id d2e1a72fcca58-83f042c81bamr6157499b3a.41.1778722647729;
        Wed, 13 May 2026 18:37:27 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f196647aasm767494b3a.5.2026.05.13.18.37.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 18:37:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <80804838-5526-4096-b0ee-d6b46bbe0ecb@roeck-us.net>
Date: Wed, 13 May 2026 18:37:26 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hwmon: lenovo-ec-sensors: Fix EC signature check
 logic in probe
To: Kean <rh_king@163.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260514011411.4167069-1-rh_king@163.com>
 <20260514011411.4167069-2-rh_king@163.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260514011411.4167069-2-rh_king@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/26 18:14, Kean wrote:
> The probe function reads a 4-byte signature ("MCHP") from the EC to
> verify it is a Microchip EC before binding the driver. The condition
> uses && (AND) to check if each byte differs from the expected value:
> 
>    if ((byte0 != 'M') && (byte1 != 'C') && (byte2 != 'H') && (byte3 != 'P'))
> 
> This rejects the device only if ALL four bytes are wrong simultaneously.
> A partially matching signature (e.g. "MXXX") would pass the check and
> cause the driver to bind to a non-Microchip EC, as long as at least one
> byte matches the expected value.
> 
> Change && to || so the driver is rejected when ANY byte does not match
> the expected "MCHP" signature.
> 
> Signed-off-by: Kean <rh_king@163.com>
> 
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

As with the other patches: How do I know that this review really happened ?

Guenter

> ---
>   drivers/hwmon/lenovo-ec-sensors.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/lenovo-ec-sensors.c b/drivers/hwmon/lenovo-ec-sensors.c
> index 8681bbf6665b..a32b1f2c6a3a 100644
> --- a/drivers/hwmon/lenovo-ec-sensors.c
> +++ b/drivers/hwmon/lenovo-ec-sensors.c
> @@ -537,9 +537,9 @@ static int lenovo_ec_probe(struct platform_device *pdev)
>   	outw_p(MCHP_SING_IDX, MCHP_EMI0_EC_ADDRESS);
>   	mutex_unlock(&ec_data->mec_mutex);
>   
> -	if ((inb_p(MCHP_EMI0_EC_DATA_BYTE0) != 'M') &&
> -	    (inb_p(MCHP_EMI0_EC_DATA_BYTE1) != 'C') &&
> -	    (inb_p(MCHP_EMI0_EC_DATA_BYTE2) != 'H') &&
> +	if ((inb_p(MCHP_EMI0_EC_DATA_BYTE0) != 'M') ||
> +	    (inb_p(MCHP_EMI0_EC_DATA_BYTE1) != 'C') ||
> +	    (inb_p(MCHP_EMI0_EC_DATA_BYTE2) != 'H') ||
>   	    (inb_p(MCHP_EMI0_EC_DATA_BYTE3) != 'P')) {
>   		release_region(IO_REGION_START, IO_REGION_LENGTH);
>   		return -ENODEV;

