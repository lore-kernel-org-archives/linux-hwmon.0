Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A919536606F
	for <linux-hwmon@vger.kernel.org>; Fri,  6 Mar 2026 18:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772820610; cv=none; b=uH2qN3+RX5k7HbeuXLI05lkgmbMcNwoVxbCKxd3pJAn08QTd9Wg0Ed9C1phQ+YIt6o6l4Qtk7aRNlDG33Uo+M9fmxEWWc7bAl7Iern5cZgfC01LBAuZga+JW3nLKig/tUAPFT/0xi1U49nMkT5CKnrsFCWbo3LOyK0kUy6E8RCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772820610; c=relaxed/simple;
	bh=fb9fAI+2R4+pLGV9+1rNCenVLZhpHBa88vK4gABjIw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rwR87N9kDUqvk4ePmEsLbl1E2yUnSgpn6SDkDG1lLn0A8ht7iAwlBUQK9zQAPIKC92fGMDUS6IKpUEHbMTyk/bwokrVH0r0Eg6aZzS5sAcFrrwL5dm1bl8Rfha0zFtcmUK/C3hoaXHHyQiNjPrp8d8xhvvqYO0HtBw0BqUdpz9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DIVLYDWQ; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DIVLYDWQ"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1275750cfc7so2529638c88.0
        for <linux-hwmon@vger.kernel.org>; Fri, 06 Mar 2026 10:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772820607; x=1773425407; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4t90rBsh0jMs5hxeKF0aBgH4tWUbByc3KabB0tRVGYg=;
        b=DIVLYDWQcua0+8SGuUS0ptNGhjqxHRSnwy+7N1PXVFP/1fe1pQktqxgFqBGGRZ7eqk
         WncpVAVCimI/nlrcQPWvr5CLG9a9oQtTMOCJC4sRZb6UMjCgGiZvxbxxeqdF8C7oOaAf
         AvnHYDrBYTaHSO4yVXm45omz1Xyv3O3OcMyIevJwRjglNlC4dulSYxErxdZqjY5JToz0
         2rx3peWypJoPfRRUK4hNcuhFsGp5jG6x26r9TlLDf+eZVSkmavME+a6t4rw6N1BptW8B
         GUHsHTK3BqR36/I3s2R40Xk/giaQRZ3+1GISYHBbOQUkcVGTyh8Y79g4q1wLQe2TWzUC
         BooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772820607; x=1773425407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4t90rBsh0jMs5hxeKF0aBgH4tWUbByc3KabB0tRVGYg=;
        b=Zulu4ozp0i/iIaDzBzPjjRBVTPSyK00Xa4qg/eiiY4+svB/AHkRkYcl+mw+kpKDk9D
         fi6mHAIisHNhR3EIKUN+MukBFQbgnT3rhA9vRKE0weUUpE3VznUmbXHc4TxrwKsBaPnr
         1bX1DEdj8iCvlhn5LWYzgAimiwih5DrGvz9Yzq4RY9l9FqFYBnkByXS7AM/dzEovef/c
         879iDbgC66fVDknH1lBrfFs89dQHAKrubMulVov2GPrQYUKdnt2PmvIcXliMXS9D10Qe
         IEkO6GWI83vIGaW5AHY4d8Qai7/I9lHOSu36QGnzIaq0E+Ez2tJwa6bjrX3jLrlKPnHK
         z4aA==
X-Forwarded-Encrypted: i=1; AJvYcCUVoqW8tWg9sn6076b8ZxQj6iU97v1FJ7lKp7ZJEX2/FxuVuf0mUEIiFgEPJJJNP1ZP8buAzXOpfdjwNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeLKS0DcE/TjxXeYmIQvc4csgbN8wHz6n+pUT/40oY/Iq/X7Yq
	ndkN8+h+RoMfAJHeBW7dvIb3hMjG9snII2QJL24NRsyLwRZtTOJtplNM
X-Gm-Gg: ATEYQzzBjPsFec6B2ItOthiCThzV4VpBBVSHJe6zyyE8ySAhie9T90puXfbbJVzguTC
	HY9Mu5T/F2JPKQRq/ihxWu2+ko2mOvGPk1TD84+6NhbBGR/OqYAk97J2+T2cgyhyMtAAUZnA95Q
	LWDsCc/b2spo0r7oEsEdA7XPR+tsl78s5zxiqzB1vT8fXMhMb+dHO7sHnKBhDQrd93Rxh3TrgD0
	qqShks6xL+H3seZIDAMmmoVaWkSHnFfSHGUL95WX2TmIbeD8syWjL8/QZB9ppRPCjasqqrkeT3g
	omQSFnYth2T6qXRB0Nprln2ReBA1fKbu9PvR92TVoLlgY+JdaLqJo8TNK1vFPFLVFmICOPGXpzC
	HPIMB0ztI8ZQ23m2N/55dqWf5mB52+c+tykN/SHM9yfTtBBpkaL87hKfBNGg0zMN0bfgJP68YW1
	UVpiZQeYnMZa2i8Ayt3+YMqP6TLoq2Gj371E/C
X-Received: by 2002:a05:7022:784:b0:11c:b3ad:1fe1 with SMTP id a92af1059eb24-128c2dc0854mr1462737c88.11.1772820606683;
        Fri, 06 Mar 2026 10:10:06 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128c3f4351bsm1596188c88.11.2026.03.06.10.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 10:10:06 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 6 Mar 2026 10:10:05 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Davis <afd@ti.com>
Cc: Chiang Brian <chiang.brian@inventec.com>,
	Erick Karanja <karanja99erick@gmail.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Jeff Lin <jefflin994697@gmail.com>,
	Cherrence Sarip <cherrence.sarip@analog.com>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/11] hwmon: (pmbus/ltc2978) Remove use of
 i2c_match_id()
Message-ID: <85d35de0-943d-4efc-925f-d42eae941948@roeck-us.net>
References: <20260306171652.951274-1-afd@ti.com>
 <20260306171652.951274-11-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306171652.951274-11-afd@ti.com>

On Fri, Mar 06, 2026 at 11:16:51AM -0600, Andrew Davis wrote:
> The function i2c_match_id() is used to fetch the matching ID from
> the i2c_device_id table. This can instead be done with
> i2c_client_get_device_id(). For this driver functionality should
> not change. Switch over to remove the last couple users of the
> i2c_match_id() function from kernel.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  drivers/hwmon/pmbus/ltc2978.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
> index 8f5be520a15db..d69a5e675e80e 100644
> --- a/drivers/hwmon/pmbus/ltc2978.c
> +++ b/drivers/hwmon/pmbus/ltc2978.c
> @@ -733,7 +733,7 @@ static int ltc2978_probe(struct i2c_client *client)
>  		return chip_id;
>  
>  	data->id = chip_id;
> -	id = i2c_match_id(ltc2978_id, client);
> +	id = i2c_client_get_device_id(client);

AI feedback:

  Is `id` guaranteed to be non-NULL here?

  If the device is instantiated via ACPI `PRP0001` or using a fallback DT
  compatible string where the first compatible string is not in the
  `ltc2978_id` table, `i2c_client_get_device_id()` will return `NULL`.
  This leads to a NULL pointer dereference when accessing `id->driver_data`.

  While this vulnerability existed in the old code with `i2c_match_id()`,
  adding a NULL check here might be a good idea while the code is being
  refactored.

I never know if this is real. Any idea ?

Thanks,
Guenter

>  	if (data->id != id->driver_data)
>  		dev_warn(&client->dev,
>  			 "Device mismatch: Configured %s (%d), detected %d\n",
> -- 
> 2.39.2
> 
