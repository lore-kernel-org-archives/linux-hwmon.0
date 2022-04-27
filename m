Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80122C433F5
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Apr 2022 13:27:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235800AbiD0Nal (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 Apr 2022 09:30:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235860AbiD0NaZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 Apr 2022 09:30:25 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A3723E5E6
        for <linux-hwmon@vger.kernel.org>; Wed, 27 Apr 2022 06:26:59 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id e4so1956080oif.2
        for <linux-hwmon@vger.kernel.org>; Wed, 27 Apr 2022 06:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=jwwFB2Z5DuG4GbpUpDpVeuiOtrvg9l04cmnoQZ/MWAk=;
        b=IvtaRVvmDd1mkNlPo3hEZrMyBf1T2THWWDJ4fTi9Nco0rIF6Ll3+iTHxKHBNc6TnpE
         xq01U5SAxbc3Sfm5/OqDyUSHWjYlbBdXEQYnnfcxsPRh2Fa97JlMfZQx1vHgkLq5cczv
         2ZSbLazS2s99c+HVE5nbgLQ1kHWGPLxFFWl3iYyxQJfkLO3GwPWQ1r9mlGLtMO12jJP2
         zLoGpODpiuNLSu0bMN32mTzzfkW3T6aIVtra2jfHcw8TkVo0aSgJbcT5ozRsNURzc5/J
         ddqpNpucx33YaPj1sM6Q1scPXGjOYNI2dhDYO3+G+3B5PCQWzh6AbZNtjwt5ZgHgcFgy
         YPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=jwwFB2Z5DuG4GbpUpDpVeuiOtrvg9l04cmnoQZ/MWAk=;
        b=b3BvbJW2RDZuVzg2qIIMAku1kvDifF1aHT8uk2UGqygaq8wlVs4uau9cz4sOqSr3TJ
         q/C/D2S8UDVB7mH9SlsUjIVjYCVUY9dD2nCq7B3koc7xhnzYPsG61I/l8c1rPEF/sV1h
         QjdlUj034cLIBxHSz37oStJFLAEDQC9KOYREqYoLQ+pYKFTfsishxaQVBrQ0GMA049rc
         fusttXBL5BNXpTTTBzAnSGssNK1V2fC/qeb54XQhZfn8JGnry7BOYMuo4uIpwBDJhsfx
         KntVZKngEd3ILCg54ISxyfL7ntFFYP8BwxWW+HjRUi6ZOl6DPcBZCOAVEjLekkxlfL8R
         PgsA==
X-Gm-Message-State: AOAM533MZkT+/zkLvoteDoDHql8UUJK2WZSABh29XpZwYWAmCZeZ/dtd
        l+XQjVxQIm+dDkpMjUHKxSIQEzUAAdQ=
X-Google-Smtp-Source: ABdhPJwesBp6AythX8m78GhDSuOy09TE/MiyL206MrztPClw7oiept0YNZ1k180kG5gY6TzLpyA2WQ==
X-Received: by 2002:a05:6808:1244:b0:2f9:e450:4bc4 with SMTP id o4-20020a056808124400b002f9e4504bc4mr13258152oiv.290.1651066018508;
        Wed, 27 Apr 2022 06:26:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u20-20020a4a9e94000000b003291f6ac4b2sm6750531ook.28.2022.04.27.06.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 06:26:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 27 Apr 2022 06:26:56 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?M=E5rten?= Lindahl <marten.lindahl@axis.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel@axis.com
Subject: Re: [PATCH v3 1/3] hwmon: (pmbus) Use driver specific ops if they
 exist
Message-ID: <20220427132656.GA3187691@roeck-us.net>
References: <20220427130213.1557793-1-marten.lindahl@axis.com>
 <20220427130213.1557793-2-marten.lindahl@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220427130213.1557793-2-marten.lindahl@axis.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Apr 27, 2022 at 03:02:11PM +0200, Mårten Lindahl wrote:
> Pmbus drivers using the default pmbus_regulator_ops for the enable/
> disable/is_enabled functions will use the standard pmbus core functions
> pmbus_read/write_byte_data. This could potentially influence some
> specific regulator chips that for example need a time delay before each
> data access.
> 
> Lets add support for drivers to use chip specific read/write operations
> when using the standard pmbus_regulator_ops.

The subject is misleading. It should be something like "introduce and
use write_byte_data callback". Also, existing code calling
pmbus_write_byte_data() should call _pmbus_write_byte_data() instead.
This applies to pmbus_update_fan() and pmbus_get_boolean().

Thanks,
Guenter

> 
> Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
> ---
>  drivers/hwmon/pmbus/pmbus.h      |  2 ++
>  drivers/hwmon/pmbus/pmbus_core.c | 58 +++++++++++++++++++++-----------
>  2 files changed, 40 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> index e74b6ef070f3..c031a9700ace 100644
> --- a/drivers/hwmon/pmbus/pmbus.h
> +++ b/drivers/hwmon/pmbus/pmbus.h
> @@ -438,6 +438,8 @@ struct pmbus_driver_info {
>  	int (*read_byte_data)(struct i2c_client *client, int page, int reg);
>  	int (*read_word_data)(struct i2c_client *client, int page, int phase,
>  			      int reg);
> +	int (*write_byte_data)(struct i2c_client *client, int page, int reg,
> +			      u8 byte);
>  	int (*write_word_data)(struct i2c_client *client, int page, int reg,
>  			       u16 word);
>  	int (*write_byte)(struct i2c_client *client, int page, u8 value);
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index b2618b1d529e..1b0728c3c7d8 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -384,25 +384,6 @@ int pmbus_write_byte_data(struct i2c_client *client, int page, u8 reg, u8 value)
>  }
>  EXPORT_SYMBOL_NS_GPL(pmbus_write_byte_data, PMBUS);
>  
> -int pmbus_update_byte_data(struct i2c_client *client, int page, u8 reg,
> -			   u8 mask, u8 value)
> -{
> -	unsigned int tmp;
> -	int rv;
> -
> -	rv = pmbus_read_byte_data(client, page, reg);
> -	if (rv < 0)
> -		return rv;
> -
> -	tmp = (rv & ~mask) | (value & mask);
> -
> -	if (tmp != rv)
> -		rv = pmbus_write_byte_data(client, page, reg, tmp);
> -
> -	return rv;
> -}
> -EXPORT_SYMBOL_NS_GPL(pmbus_update_byte_data, PMBUS);
> -
>  /*
>   * _pmbus_read_byte_data() is similar to pmbus_read_byte_data(), but checks if
>   * a device specific mapping function exists and calls it if necessary.
> @@ -421,6 +402,43 @@ static int _pmbus_read_byte_data(struct i2c_client *client, int page, int reg)
>  	return pmbus_read_byte_data(client, page, reg);
>  }
>  
> +/*
> + * _pmbus_write_byte_data() is similar to pmbus_write_byte_data(), but checks if
> + * a device specific mapping function exists and calls it if necessary.
> + */
> +static int _pmbus_write_byte_data(struct i2c_client *client, int page, int reg, u8 value)
> +{
> +	struct pmbus_data *data = i2c_get_clientdata(client);
> +	const struct pmbus_driver_info *info = data->info;
> +	int status;
> +
> +	if (info->write_byte_data) {
> +		status = info->write_byte_data(client, page, reg, value);
> +		if (status != -ENODATA)
> +			return status;
> +	}
> +	return pmbus_write_byte_data(client, page, reg, value);
> +}
> +
> +int pmbus_update_byte_data(struct i2c_client *client, int page, u8 reg,
> +			   u8 mask, u8 value)
> +{
> +	unsigned int tmp;
> +	int rv;
> +
> +	rv = _pmbus_read_byte_data(client, page, reg);
> +	if (rv < 0)
> +		return rv;
> +
> +	tmp = (rv & ~mask) | (value & mask);
> +
> +	if (tmp != rv)
> +		rv = _pmbus_write_byte_data(client, page, reg, tmp);
> +
> +	return rv;
> +}
> +EXPORT_SYMBOL_NS_GPL(pmbus_update_byte_data, PMBUS);
> +
>  static struct pmbus_sensor *pmbus_find_sensor(struct pmbus_data *data, int page,
>  					      int reg)
>  {
> @@ -2396,7 +2414,7 @@ static int pmbus_regulator_is_enabled(struct regulator_dev *rdev)
>  	int ret;
>  
>  	mutex_lock(&data->update_lock);
> -	ret = pmbus_read_byte_data(client, page, PMBUS_OPERATION);
> +	ret = _pmbus_read_byte_data(client, page, PMBUS_OPERATION);
>  	mutex_unlock(&data->update_lock);
>  
>  	if (ret < 0)
