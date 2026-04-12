Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1912F376BCD
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Apr 2026 14:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776003881; cv=none; b=szdXlC6RH/tKYfKLi8ywlOwomUw7KAo/LBOpBeEnRRmAptWD9jrLAW12/J+VcxKHEKRKWQ1sAxCZXM1NEogRmrDXXgaxPIRG6OPZ2cwiRQVcBKQ10ipvduWiEAEmw+SSpRugxabiM/7WSFvDdRzrrOvDpqBRFzNcZahMWrETZGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776003881; c=relaxed/simple;
	bh=iOdISVO8BUXFsOA2uV6lJXxKDTcCArSPQ2QC26xiiJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SUnpsOc8ZJxHSiYi5KL0ya/16YAACHUmdApDbUkDgSqA7UYbmQOuxU1ElGMPr1WpZgoB8UjWEPukM05+FKJi2bpmF3T4TSluJUhcXK4H4glbmN4Ed63sie+KCoHsU7k+M09vDOajWQIZrOcwm6hZFDAOSOCvD+w0O0MkndMeNHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eoonAoVN; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eoonAoVN"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso1914722eec.0
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Apr 2026 07:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776003879; x=1776608679; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JWoFrymCDBZUNcJuoh+YqxhHlXVNIrXNdVeBdSnyFUI=;
        b=eoonAoVNAYEcP9kXEPnv8mFc6jdiwJR5CoHf7ZFrPvKK2/pK9P4QYRduS0UGpuVTnB
         Xut/cfRbJAtgmtCQVMFpHRHXaKVsrM+f4JiOF0ifWusFVzwbBQjP3CFCLbuZ6qUMUak1
         3/pY3E08EK0N0LU109KcQhoytAQ2O4MD5LVBZ1zXvcm1MkGLqPFMHtzRCbBYTcH+z2j7
         EjeeXKRW1PfT9pDsSiEyGP4hdbl2POrLMZCUTWS/rMXbawWIRl1CXdAApxvo780OPEY2
         Cq65YPCiisA8qNE9K/CKxC3q4Yy1auWX/x5fFzq6LZahnC19YlyHhncORdtRDmlAIkJ8
         5BpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776003879; x=1776608679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JWoFrymCDBZUNcJuoh+YqxhHlXVNIrXNdVeBdSnyFUI=;
        b=C93BlfNgkExCN0iDgBTVEfbUWDReoaV2GB6mKuhdoYFBalx5/G+PKBYk4U1TRMtn6C
         n03vsSBH1oU5PyPfTpSwD7SRH/QO16SzXfMVF4rucyiVcJwvxnfYls++8G1+5gZ6kSzV
         HKOYX1jhz4bMU1zY/rvhgGEZUqfzO4kdeXKN3tnn0twH8WWm5poa/kHT1P85Q3H7eA7/
         40oG1Z7iDXVe01WllT2Hqn+pFcDPpekD6VRt9qnANWDyrYbDOKVa5D+6gu0bSVqB+3NI
         gJhKMIsfALaDDp4l9GCiWks+QUjWfvAgzVsK7RHEhWcWbiMM1LqQzGWH6gta5lRSSXDh
         slBw==
X-Gm-Message-State: AOJu0YwGe0ZYEKYjwSEq+kY7hM+ONPap02C1GDO/aH30eCeccVufKQM7
	0yC5g+qkafWYNH2m0EIqh3VAPykiBLgDJjZwNoRRXg08hccGbDtfigOd
X-Gm-Gg: AeBDievqkJTST9CzICZB1imVG0YfMfyrdkVbBrFDRaeUpA6ZNe4b8yd/6uyAMkwBeta
	vmhjnL2uN+M77jCskaz38jgz575fbmJ29AsKt/hmzRBo5I1ggH1gPfC5lzHlKRHQ0Hw4OJOp4xk
	IwGiF5Z5h6SCuAnwIm7QMqvefduZ2zaAWmRcZIzoJavdnCGVHXvQtutq9SLEynj7a8jrZV0lnQ0
	eqYMTApQlMM5gvlMgx7p+dZ8rQB4FnkwjnQ4d0dsDsD+1QspgX3AtNI+BqjYAZLviJXRchKvy3U
	uBlcSZxS80CjYtV3j6DOuzkXS6oBmZAwiaqiqtPU4wtjXUbNkp2hWuvIymJKckkBrYap+9xgqLG
	ZeLJ7mTnxBzQ0PCWp2U8tzHrs0IYOZ1/OhnFyGz2I2G8VAGYTHGfEYNCbGLGonZKX8A/fz5cM4U
	LjRSIDLdQCG6WQ12VSHuNDzWTxV8rJNOfhZ2KV
X-Received: by 2002:a05:7300:2d05:b0:2d8:4dee:6ad0 with SMTP id 5a478bee46e88-2d84dee722fmr966009eec.16.1776003879069;
        Sun, 12 Apr 2026 07:24:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d90ae89e49sm994164eec.31.2026.04.12.07.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 07:24:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 12 Apr 2026 07:24:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v1 1/1] hwmon: (pmbus/tps25990) Don't check for specific
 errors when parsing properties
Message-ID: <a2773f5c-6e6c-40e8-9f4b-1a9ed9a0b431@roeck-us.net>
References: <20260219141936.2259945-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219141936.2259945-1-andriy.shevchenko@linux.intel.com>

On Thu, Feb 19, 2026 at 03:19:36PM +0100, Andy Shevchenko wrote:
> Instead of checking for the specific error codes (that can be considered
> a layering violation to some extent) check for the property existence first
> and then either parse it, or apply a default value.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/tps25990.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/tps25990.c b/drivers/hwmon/pmbus/tps25990.c
> index c13edd7e1abf..05c6288ecafc 100644
> --- a/drivers/hwmon/pmbus/tps25990.c
> +++ b/drivers/hwmon/pmbus/tps25990.c
> @@ -402,12 +402,18 @@ static int tps25990_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
>  	struct pmbus_driver_info *info;
> -	u32 rimon = TPS25990_DEFAULT_RIMON;
> +	const char *propname;
> +	u32 rimon;
>  	int ret;
>  
> -	ret = device_property_read_u32(dev, "ti,rimon-micro-ohms", &rimon);
> -	if (ret < 0 && ret != -EINVAL)
> -		return dev_err_probe(dev, ret, "failed to get rimon\n");
> +	propname = "ti,rimon-micro-ohms";
> +	if (device_property_present(dev, propname)) {
> +		ret = device_property_read_u32(dev, propname, &rimon);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to get %s\n", propname);
> +	} else {
> +		rimon = TPS25990_DEFAULT_RIMON;
> +	}
>  
>  	info = devm_kmemdup(dev, &tps25990_base_info, sizeof(*info), GFP_KERNEL);
>  	if (!info)
