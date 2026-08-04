Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB99132AADB
	for <linux-hwmon@vger.kernel.org>; Tue,  4 Aug 2026 08:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785833088; cv=none; b=OgBgP/my7lutQZYqOM/rmGb4jZltzYRVig4DYRTtXPXZMds5SWS3oVdVl3SCJgTYjmOsB8xUSDkdV0UTnm4c5mFH0ny3fHTfzHcGMpl3QW5/EKQ5B4Pyu7fkmNzB/ktzk240C77QHfY1fniLptDEoEProEsyKsdpSgvVgT6HI7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785833088; c=relaxed/simple;
	bh=TLXXvYxG4dSrfuZtqjgizIZxNe/7R+iSXeA7PWcwcFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kpta+KFQ0UCACawm4lfyC6DX5u1Y8/EYCxbWCA3S/zcEZr/bkOfO8IjgZca3ZbnFME0/89L1BunIK/iPwtcyCXBurBHlfHzkmADwxyK5HbApdyEpXxCocoKNbsxz5XKhEXo06UlDhxyx6rvqPuBko/QIdK/uWiOh1NsH4x8HjPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GoLxfmit; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GoLxfmit"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so14522425e9.2
        for <linux-hwmon@vger.kernel.org>; Tue, 04 Aug 2026 01:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785833085; x=1786437885; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3lTgO1wd2ybz6X0zk/HA/GHdvFXht7sq/xTVbmfBJFQ=;
        b=GoLxfmit04U0r+EE1hTeGrvQho3mNOz0hroL34zxp3scXo3ax7rhziQ7yi+YACpjW9
         R6pVOc3H0rSFQkxR5htFl7BV8nbfpJHbP15ZBlCu9wr+q6HikUX8Qhh89pggcPvEx57y
         1Rgzbv5QS7ukif2v/TQeYX+dbpwyFqpjrm3s7KjOGLnGZv6/DjoqxSbGzitRRUxoWlwW
         LF4ivtzaom8Ml+XmztjQaG88dOG2sAIzEcrdHa2BK5f9ncrsGQ465qC4Qw1pxu6GRxP2
         buMbaDOCN/yy7X9Gd3fkUOcffyyj8SFHYqeNPvbJspO+BCq7qhmByQQBPR3dqJqIqeBJ
         CdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785833085; x=1786437885;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3lTgO1wd2ybz6X0zk/HA/GHdvFXht7sq/xTVbmfBJFQ=;
        b=ETGe81Uik7iNdtsRGaLuBnt36VismzTavCXbjYIKZcNnqqqqiaSXMfiRL6fHmNPgc5
         42IRNsWk3HNCas6/fXQO1RpGZj4KTWXgZIECNLyGBn5Z0sQuWie+l5YUxlJjjSKgVWwH
         sXvQPtjTh8L2Q3dxYm5OTKkEx5ODzpLds29twBY8qwT1jjHg6SXn+nqHc5R/g89e1Xee
         vuvpJ+/uWtuXX5EISnv47va+4Gkv2SMI+pb9+XICShcIMBN1eLihH32cQt02n+Bjw3wQ
         avuHfcFdTs/AUtC1EWXCmOEvZ4BTZ3BgLiyXhvHqZ0sKWasTRvL4ZzunmVysp6nLxnSE
         bwEw==
X-Gm-Message-State: AOJu0YzQQVdkVTc9ZLivqn2sn9QhasJCbqLmSiEnN4rZ5iGAZjsaBTph
	waJBWFIFcFfNyxdBPRxzfuNiTDBrN2XW9rzqPYI8txadrY1kMnIPpwYd
X-Gm-Gg: AR+sD113GWbPBOlyDV9PayDgMJJF16PJxOUUtWvMHE8Y1WAH8t14aFgSLf3Tj1wYflT
	0wOuPkG6yQwZt+LUm2EaorSl9ScdlawehcNiLXKl+8hHKotKxxvEI85QKkEkQCir7HzEVCJf3cm
	Jngpez/swRRy9dhK6dWWkN+Lh5Nv5SjAKHO4jVfaUTanZ4bO3/fvxJE4J43Eb4fCBSgNdXoEYun
	OEJvPJRC+4YnsOQylGqyrtfUy55pRqacXeKU7vSJTlX1WmxWsivKRbLgTrAgVTlLb7Eq4UoQXZt
	lODo/CnVNB8BH1rRWLPH/IWCt86d/6W/y19Q3YJWIbZJj6OKDgA5W5yGCqMMvGNk9DqJxZS5ZWJ
	ELYxuehgZFwMoAI/poVaLZIU4euKzOJktaexSfScerP/BNrF6WSvvdQLJbuBA1D7ciWmryFoUOl
	dvicW3Mpm88w+TFh404FlPmpfF8u6mxRldP65NoF3RxcgS6hObVIOr9lO3xViMIq8=
X-Received: by 2002:a05:600c:46ce:b0:498:ee7:e403 with SMTP id 5b1f17b1804b1-4980ee7e7dfmr246344365e9.19.1785833084487;
        Tue, 04 Aug 2026 01:44:44 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fd12a5sm62094645e9.6.2026.08.04.01.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 01:44:44 -0700 (PDT)
Date: Tue, 4 Aug 2026 09:45:55 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, 
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
Subject: Re: [PATCH 1/5] hwmon: (pmbus/core) Introduce
 pmbus_read_smbus_i2c_block_data()
Message-ID: <anGlg2E-tcp_6Qkn@nsa>
References: <20260803193535.2286578-1-linux@roeck-us.net>
 <20260803193535.2286578-2-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260803193535.2286578-2-linux@roeck-us.net>

On Mon, Aug 03, 2026 at 12:35:31PM -0700, Guenter Roeck wrote:
> PMBus drivers need support for reading SMBus block data. Unfortunately,
> not all i2C controllers support this command.
> 
> Implement pmbus_read_smbus_i2c_block_data() which first tries to use
> i2c_smbus_read_block_data(). If not supported, try to emulate it by calling
> i2c_smbus_read_i2c_block_data(). Export the new function for use in PMBus
> drivers.
> 
> Cc: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> Cc: Nuno Sá <nuno.sa@analog.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/pmbus/pmbus.h      |   1 +
>  drivers/hwmon/pmbus/pmbus_core.c | 102 ++++++++++++++++++++++++++++---
>  2 files changed, 95 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> index 5fe2c415eada..2cd3216b3cd9 100644
> --- a/drivers/hwmon/pmbus/pmbus.h
> +++ b/drivers/hwmon/pmbus/pmbus.h
> @@ -561,6 +561,7 @@ void pmbus_set_update(struct i2c_client *client, u8 reg, bool update);
>  void pmbus_wait(struct i2c_client *client);
>  void pmbus_update_ts(struct i2c_client *client, int op);
>  int pmbus_set_page(struct i2c_client *client, int page, int phase);
> +int pmbus_read_smbus_i2c_block_data(struct i2c_client *client, u8 reg, char *data_buf);
>  int pmbus_read_word_data(struct i2c_client *client, int page, int phase,
>  			 u8 reg);

...

> +int pmbus_read_smbus_i2c_block_data(struct i2c_client *client, u8 reg, char *data_buf)
> +{
> +	u8 buf[I2C_SMBUS_BLOCK_MAX];
> +	int blen, len, ret;
> +
> +	if (i2c_check_functionality(client->adapter,
> +				    I2C_FUNC_SMBUS_READ_BLOCK_DATA)) {
> +		pmbus_wait(client);
> +		ret = i2c_smbus_read_block_data(client, reg, data_buf);
> +		pmbus_update_ts(client, 0);
> +		return ret;
> +	}
> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_READ_I2C_BLOCK)) {
> +		dev_err_once(&client->dev, "I2C adapter does not support I2C_FUNC_SMBUS_READ_I2C_BLOCK\n");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	/*
> +	 * If the returned data is valid SMBus block data, the first byte
> +	 * must be the data length.
> +	 *
> +	 * i2c_smbus_read_i2c_block_data() may return an error if the chip
> +	 * sends NACK before the number of requested bytes is received.
> +	 * Handle this by reading the data length first, then reading the
> +	 * entire message up to I2C_SMBUS_BLOCK_MAX bytes. This ensures
> +	 * that requested number of bytes never exceeds the number of
> +	 * bytes sent by the chip.
> +	 */
> +	pmbus_wait(client);
> +	ret = i2c_smbus_read_i2c_block_data(client, reg, 1, buf);
> +	pmbus_update_ts(client, 0);
> +	if (ret < 0)
> +		return ret;
> +	if (ret != 1)
> +		return -EIO;
> +

I think the above is ret != -1 is not really necessary (same for the
below check. i2c_smbus_read_i2c_block_data() always returns the length passed to it.
The only case where it doesn't is if we pass something >
I2C_SMBUS_BLOCK_MAX which would always fail anyways.

- Nuno Sá

> +	len = buf[0];
> +	if (len == 0)
> +		return 0;
> +	blen = len;
> +	if (len >= I2C_SMBUS_BLOCK_MAX)
> +		len = I2C_SMBUS_BLOCK_MAX - 1;
> +	pmbus_wait(client);
> +	ret = i2c_smbus_read_i2c_block_data(client, reg, len + 1, buf);
> +	pmbus_update_ts(client, 0);
> +	if (ret < 0)
> +		return ret;
> +	if (ret != len + 1)
> +		return -EIO;
> +	if (buf[0] != blen)
> +		return -EIO;
> +	memcpy(data_buf, buf + 1, len);
> +	return len;
> +}
> +EXPORT_SYMBOL_NS_GPL(pmbus_read_smbus_i2c_block_data, "PMBUS");
> +
>  static int pmbus_read_block_data(struct i2c_client *client, int page, u8 reg,
>  				 char *data_buf)
>  {
> @@ -527,11 +617,7 @@ static int pmbus_read_block_data(struct i2c_client *client, int page, u8 reg,
>  	if (rv < 0)
>  		return rv;
>  
> -	pmbus_wait(client);
> -	rv = i2c_smbus_read_block_data(client, reg, data_buf);
> -	pmbus_update_ts(client, 0);
> -
> -	return rv;
> +	return pmbus_read_smbus_i2c_block_data(client, reg, data_buf);
>  }
>  
>  static struct pmbus_sensor *pmbus_find_sensor(struct pmbus_data *data, int page,
> -- 
> 2.45.2
> 
