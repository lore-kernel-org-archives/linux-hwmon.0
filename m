Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653A733C51D
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Mar 2026 20:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773866366; cv=none; b=GfAjv2zjnIcongU1yiCJ0YopVnJ9VVH4olruYpPLKQwLzW0hAb+XG5s5Ki9XpKPRuap8jLr/vgh1iGzaO1mc9W/qf6LDlVwskJFlFFdn1mpqVb1xMlG/nrXEQHFknA9fUQ7bgxEg0zCdUQx2ACUoLKcalJiSsc1x6NHRVqv7T0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773866366; c=relaxed/simple;
	bh=K6fFk6jgPk/ELODmU4K13Iuu5ExuxDeXbxGnbD9Iu4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MBR2Wic1QwgP6oU42dhci2JLOTbXMdeMkM4qLcN1D7MH8rTmcd7pIwmpHkMTEZhyT/tTlDj95YSHR5c9Zpp0aBangCTAH+F3q+Q6EP8HX1reUTxUbcX2qr2RKo9WXL/Ftqypvu0MwKgT5WDr4RYxH8aIk2x1tPuTw3Sp3IuUe2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RN7T+gvv; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RN7T+gvv"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-359fea895b5so255759a91.0
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Mar 2026 13:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773866364; x=1774471164; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NO7l1j/JSa3nzmOJtX7R9PKY7mTRri7kyBMKzNUW53c=;
        b=RN7T+gvvm5AaZ9HDtKV/+SoBD4iY2amCMPOUrm+kVlrA6CkMBVBrFUaWta2g9dkWYb
         eSNMHP/0GiSNK/X/LYzjpZeQKLKzO9AKalxY9uHCEHb2AyXHU9civCm/iTTqzuqCa7yp
         Qgj3H4MWJZX/RS2DqaB70sHMeA0+DAp9Ae1bVHXjqUaCOGOghvSU9J5onZ8XN3kIj8oG
         lHV75Yo27R2+u92t7vONLgyx6FqJ6v/DYhrww2h0tVDqFbzLZfzfYJKHCOEnuB6As/iW
         slK+lz4BylxpMej90quh1UXz02LdE5jBgDBi7ZNlwHypJtEGgZPGDCREUlfQHndnWD6O
         tg0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773866364; x=1774471164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NO7l1j/JSa3nzmOJtX7R9PKY7mTRri7kyBMKzNUW53c=;
        b=YhkOxIwZ17asy9ydMqhpjGXGyQNtcgND+XqKmp3Qq1XAxvWgmC9rs5hPmC+mphrn23
         cO/UiwcG00/DZ4Zf0h9eDvthTsFDwgYGTH+TvBYCabsOw/ESkvCYrRVMMCEgd9MUl2we
         r9Ja9xhso/yE/3hNjckg/qHfkVtQzw9uk7XTqrTnPCk+ycA++iVgFSj09IhggJm3HgdI
         122ZdypxtuLhNib6C78KD9QH8+J7qCzNKw6QL6lYX8GiFk8XWbD8eNqSa2N1jy9eIY5i
         YSdhqRZALYoUI5+HsfanzVybP18W+BO3IU8k/WhLZro/d+EArMVlHQLxCz5f8oGZls8j
         TNUQ==
X-Gm-Message-State: AOJu0YyJNRuaeW/yjjWhKsw3k5+4qsJ6vg0gNt9Q5czz7+2gcNc8OjjD
	mdDwF2mzCWvDQeG/PFRi1ivwTevU6LeR8dD3G/ay8ajZ/BJfYdWdxTli
X-Gm-Gg: ATEYQzyMHn/Wu4o38eUIboXiVAjhEETNpQEWCXK4owIUqyxiZFn7qVOirB0gVL0+pwW
	UXAbt65W2/fwTa7fgdDpuwvO/nQJXFm2I1Z+bitczsLL++9D3D0mefTdew8nkOBJ9IvlaIYjjL7
	GT+JK5Ea62PcoSkKOrfKTjG9Rk4bAGLUjdgvTdIXZLPReMm0uvU4xKfi/UN8+b57LKGo9YebFvU
	S25z1JaH7XRyhxIiq67vFMVcFpT5E+JrQSr6fmrGCzC2hivM5z/8AyUIT7VWu/jerupqroNSWAU
	zZdAKWDuCuhcGuhX24KcZZIpRsUh3TS0uwFHfCPH55uN9207GNShdnl9p+8k1nCABf78mTxMF+t
	ubd8MS9Dlfc3KY/O2c2roMAPzhQH6cNfk2kQZTsjJ163keyo0lsIh6cqgAbCjFnbRLISYyN0weS
	wIOfRusDBnGG8KMkykDPhINHkEwFKBUrVSxBNE
X-Received: by 2002:a17:90b:2886:b0:359:fd9a:c506 with SMTP id 98e67ed59e1d1-35bb9f27187mr3873380a91.29.1773866363774;
        Wed, 18 Mar 2026 13:39:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc62b514bsm577096a91.3.2026.03.18.13.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 13:39:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 18 Mar 2026 13:39:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] hwmon: (pmbus/isl68137) Fix unchecked return
 value and use sysfs_emit()
Message-ID: <02d70fd5-de57-49d5-b0a3-ad59c957f057@roeck-us.net>
References: <20260318193952.47908-1-sanman.pradhan@hpe.com>
 <20260318193952.47908-2-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318193952.47908-2-sanman.pradhan@hpe.com>

On Wed, Mar 18, 2026 at 07:40:19PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> isl68137_avs_enable_show_page() uses the return value of
> pmbus_read_byte_data() without checking for errors. If the I2C transaction
> fails, a negative error code is passed through bitwise operations,
> producing incorrect output.
> 
> Add an error check to propagate the return value if it is negative.
> Additionally, modernize the callback by replacing sprintf()
> with sysfs_emit().
> 
> Fixes: 038a9c3d1e424 ("hwmon: (pmbus/isl68137) Add driver for Intersil ISL68137 PWM Controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter

> ---
> v2:
>   - Kept explicit bitmask comparison instead of using !! operator
> ---
>  drivers/hwmon/pmbus/isl68137.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
> index 97b61836f53a4..e7dac26b5be61 100644
> --- a/drivers/hwmon/pmbus/isl68137.c
> +++ b/drivers/hwmon/pmbus/isl68137.c
> @@ -98,8 +98,11 @@ static ssize_t isl68137_avs_enable_show_page(struct i2c_client *client,
>  {
>  	int val = pmbus_read_byte_data(client, page, PMBUS_OPERATION);
>  
> -	return sprintf(buf, "%d\n",
> -		       (val & ISL68137_VOUT_AVS) == ISL68137_VOUT_AVS ? 1 : 0);
> +	if (val < 0)
> +		return val;
> +
> +	return sysfs_emit(buf, "%d\n",
> +			   (val & ISL68137_VOUT_AVS) == ISL68137_VOUT_AVS);
>  }
>  
>  static ssize_t isl68137_avs_enable_store_page(struct i2c_client *client,
