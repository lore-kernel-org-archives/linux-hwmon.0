Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571B12D660E
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Jan 2026 14:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769696462; cv=none; b=fW79jueZkLGvHyL+ctGHN8yIjDsu1ttapKEEl83oyuG5PK/Hwkkp/KrA99Jj8bIpt3nn73mJZr6L+3uXBBI+nsvqoYiTU8ShwgXMDczif6lkrd8x+bXlhiTtTxHjVGn7HTtw1K5uBnsbuQW1jsgfLYGGduAI21nHbHpZsKHxhXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769696462; c=relaxed/simple;
	bh=zRxvCVVQMJYVkVUNGE2Tyt26/eIK+Sk2Jr4h2yQLT94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G9c4u4FQmSUfmqR6pi1rGlqod9UPQHroGlJEcRCyKwoMMgcsSEPqmZwwUIhuCpQdxZ2W5p+hEFKUeX/ep3wTn2lVRV2fJPw5ixGI6q2Lo6cvh3BM8TrCVl+d4XIAjlVH7HUn6Tdp16ZvKOapAWbl/sdcb9Pg2BH1Z2233aGH8yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KiQea7gQ; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KiQea7gQ"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a09a3bd9c5so6988805ad.3
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Jan 2026 06:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769696459; x=1770301259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TS0KWx3bT5mxvGxI2toZXmxExTcE6y7ZRb/LECbq+2I=;
        b=KiQea7gQQLr3Q6HPhk/1zbwRNQpPFboQ5IhzV7Evj5avdT37QEaQBUKEl9paYm06HH
         OXLxIaNijBTy4z5WFJ3fN2LGOtYWIiAPCKlEJ02rAzNuwdA8QPW+zNycwI0UtGoJofTy
         AyRLKHxpb2eXmN0tyVQXYho3FEPYfXSzSHJWX5NLjCdzcTAyreU9jbuTMC+zoyc1cPnj
         PzMUrMNIY6TDDsbmhhgSl7r23iZ07/k5GVLY0521CiJorMGeZdnaKzYYmhx5qs58Dh4c
         SyOqSaqSk596DT5ACZLj5ZNSw7CDqz3WPS+uQlfkzC6dwFtoQyCeKokkl9W0Bqv1ogKV
         36Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769696459; x=1770301259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TS0KWx3bT5mxvGxI2toZXmxExTcE6y7ZRb/LECbq+2I=;
        b=SkqLXRmnVT9o5qWwEPNCRCDJDAP/97RwrD2/aC39j+DNyY5OqNK1D+ItI6WXU6jmFv
         TD75Vso28DWZwSewfhBiuAPtAfuKOAg0ExBNdHfuqM3Xy2SCIOtopgnijobveOlIhkqD
         B/aJpegqdBGv4dJ/eCsFg1TRDQTDsWhV0llg0WpjnSkl6H/YXEnIhWZg16kC9H5FedZZ
         Y+zFFLYCfxpVp6ST/4tgDppFIrrZ2Xu8x88sKifFBHFBvJyhTTNEhpLVYEOQ4jJ3irJB
         cMXdUv4pi9/bkZ3KOFxWgYuGBaj05zBFp6rnKYGNMXwQeCPZo0aGkjqOYXeFUGwPMQX2
         5mQg==
X-Forwarded-Encrypted: i=1; AJvYcCWDjQoQkvcneK2CYs9c5dLsc8QfLBULeWVy/s9zvz7nn6nzhGqkcWiccDjABzdJ3ekx2V8tgu6y89tHOw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1uzXy9QuO1PwUhNoShTI017i+IPkeiJVnzIiiyJ9JI5j/SuoU
	ez5AjyGWKZ2H+yPGHJOpRTJut/DKE/kTOGzdWizizXDVX68eIbP0pWNSINSSyumK
X-Gm-Gg: AZuq6aKEiLfg+yAVF9uNDXQ9dqymSFSUH6n1lIhlv7ShNfQrcV6Qytt21XMDdQXzcv6
	EC4Z9DkLINfCeWqWittPcEzQ7Eryz7bh2CRKFH6mX+gY/mb6baglfm90pdIkHiVahmzDOyPmTFP
	EHZpKwGDMiuGejjGq20i+IHj9LIIIE8m0Zl53gSuOgXsseo0vC5aIQG/kvuJ1JUVg/UWVUe/8YY
	D8+g/nLVh6GGoGWx262IsxozAV9XI1jKYEvehcrhz/4o60A9cACyJ84IvomwsSWAYudc/WGPSq3
	e/BWr1BZOqKm+UdVZqaJO6UiMik1BzZn0ebm7nCB4bIAF64WykcxHdZygJ8Cz5civZj0Id1+mcp
	5EsPXcw+wDyntnTAfLvMGwOoELx5iZGY57oJneIvKVlG/r8FLxI9A6Y5AiKgQYOKJAYrHJZOKhs
	aYNTybyEE00wfqKKDdz/OQJEk7
X-Received: by 2002:a17:903:249:b0:2a5:99e9:569d with SMTP id d9443c01a7336-2a870d6483fmr82656725ad.18.1769696458634;
        Thu, 29 Jan 2026 06:20:58 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a8980c8623sm40581465ad.94.2026.01.29.06.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 06:20:58 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 29 Jan 2026 06:20:57 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: etremblay@distech-controls.com, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (tmp513) Add missing check for
 device_property_read_u32_array
Message-ID: <7ade6258-8df6-483b-9f55-3d38e9a50cb3@roeck-us.net>
References: <20260128073021.2476709-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128073021.2476709-1-nichen@iscas.ac.cn>

On Wed, Jan 28, 2026 at 03:30:21PM +0800, Chen Ni wrote:
> Add check for the return value of device_property_read_u32_array() and
> return the error if it fails in order to catch the error.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/hwmon/tmp513.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/tmp513.c b/drivers/hwmon/tmp513.c
> index 5acbfd7d088d..f201d0a9ba14 100644
> --- a/drivers/hwmon/tmp513.c
> +++ b/drivers/hwmon/tmp513.c
> @@ -676,8 +676,10 @@ static int tmp51x_read_properties(struct device *dev, struct tmp51x_data *data)
>  	if (ret < 0)
>  		return ret;
>  
> -	device_property_read_u32_array(dev, "ti,nfactor", data->nfactor,
> -				       data->max_channels - 1);
> +	ret = device_property_read_u32_array(dev, "ti,nfactor", data->nfactor,
> +					     data->max_channels - 1);
> +	if (ret)
> +		return ret;

NACK. The default is 0, and the property is optional.

Guenter

>  
>  	// Check if shunt value is compatible with pga-gain
>  	if (data->shunt_uohms > data->pga_gain * 40 * MICRO) {
> -- 
> 2.25.1
> 
> 
