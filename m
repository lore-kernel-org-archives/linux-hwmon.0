Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8B834EEE9
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Jan 2026 17:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768324565; cv=none; b=lua7040F47bpNFr3237AfXLKQkQgN+0AfwcSLGuUK/awXanPx4+Nep8aTGtWkOWp9Jqy3S7l8/m6QIblagh30dtQOOsy2WJQKWKKO1Ve0/1hKmfeSuEyzo+EpbzNnML1NZvDENMDB32vt4xNlZ5u7Y6uX01qnzNOoM9qxrdgYAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768324565; c=relaxed/simple;
	bh=55Z9NohMYqHVFuiKtLlhc1uH6aINofJ/z5hH2FjBwAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s2q+a+fGCy7Vm8dAC3Qp+D8f0FpURmTYj7omwdLjk/LNqXDmdGVfC0c/RACe7Fzs7tTnsq6czECdoPRQ3Yt+EnE2waWD4Ix59qN4arEw97s+ovcP+fYrB9ru3pdsHBoIJbgNWFHNXhLTYecsslWMAqfQurzTDO3L0hupPWkvcz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ldJmD32f; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ldJmD32f"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2b04fb5c7a7so7325977eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Jan 2026 09:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768324563; x=1768929363; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=77SGHvejoYnxzjCp/TNjHKiw3t3+SvXp2I+puN/EyY8=;
        b=ldJmD32f4n/5geczMd7ik79IISX6aR4IaqqWJ5650k0KdH69Yri/SuCqF+zorOVkuf
         2bqjXKov93u8lQanSl54AofuNPaelZNIJBFiZMTz1gUVBUvSztVa6N2G5JRB6uumKnYW
         JWuN6tdE8DSYtkgf2llnbHD+iQE6IiDKq7Is1yxfTFQoXF7EfoRfnNL1TQc/0mMM2HKi
         dN/Zr9H7N158yHBlK/9+Nx8vI3EkJkIoFvyKYCqHNdyVcNWwmMd5ti70BvabEKO7vhV2
         2ASXLV94V+50b0pDzzwn/8VVejzpKYDNFiahfdYVtMyQ6dlh996A3f8syUjJpm4617mq
         JA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768324563; x=1768929363;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=77SGHvejoYnxzjCp/TNjHKiw3t3+SvXp2I+puN/EyY8=;
        b=WakNFxZ8csNSpSr9gMdB+rs5kciVeachBXhOmhiE4ubJQJfaiqPH5QERW5eksyCkz4
         wrERlrVSdBHSwQo9GL4cs7WqGvgRTLU/MGTAbCh+5abwkfseEGS1LMUDBoLlg8iFtrpd
         pglsSPeRyZCBoixT7iktrdXf92+kL5OYoq2UMAOLWi0CkEQ2Z0TN1+G0CgOnL/gUMhX/
         4FRDKkt3eygl2a44U34evT+WNQda9Ohk1fgdyKP1ZuS9IKeQeXJfjDIhvzxUokbU7Xgi
         B08MpqE1Dok8AdYXKVU527vBOAwZd3MxIMFjvf+xEkQ9hnF+SWZ8OtyMjdRPGe+8pmD5
         pKbg==
X-Forwarded-Encrypted: i=1; AJvYcCWldUipTYiJTuGrrTERSx0bsoMS0eg9hSjA7J+5kyJqWRC58P7Pz156Z1Z7AKi/gQnGp/QdyDwoywj4sw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEz+EVukneNdKwBquCppFrkmS0tJml8Pnx1FkNkPVKd+TIO++g
	bC30phOH8sizYL0z1iMFFnywqkW2yMzqy98yFTDKXEcwd8E/rZj84ZH8
X-Gm-Gg: AY/fxX4JNd5bugewNbm3JJmNxTT+Ag1/VqPqskd/YSaURMcc3hSJKbi6WtZEVGVXlYz
	foUpPJhi1elzTPtBl0RNe+YpoNnO01qrX1erDPmrnFeIJOhG3sVzcv/Og6ugxF8dK981dZuCf0l
	F/vE6qM6uh3uoMc4AIWmtShDc1CHTLUJtq+4lU2sRo6QyIwwIB36HwF1D3gG2N7eQMQYNKwocmA
	GpMmOn9A4pkzMVsL6x9DRTFbpDRJ62wuOIBuUbebz1Z0NHyChAsrFzPUoGY2i7TdmCSwvrTxOzC
	QyAF2NqoY/Sd9TVTLjPGdBu2r6ZpFBCTJVIYkkgczghgmFEdMR+zuyKJL5E1edOOKgCW+SjusGH
	kOC/nnY1Lo+MwI+G34bmKjJ/PS9VJ//KFYoZBRJ6aFmIKDT/LZHab6C4sSuUklhQY4vVh16bYBM
	QswysINnn1Tssyb14LRrFGEVdd
X-Google-Smtp-Source: AGHT+IFOUaR/DaLDKHqOGdq+SnpYExe3GX6V8dMfJvHq+vhur1RN43ChGV/gJhIwggbkoJ7kAi7n8A==
X-Received: by 2002:a05:693c:2883:b0:2ae:5db9:f32c with SMTP id 5a478bee46e88-2b17d2f0e55mr13897070eec.26.1768324562164;
        Tue, 13 Jan 2026 09:16:02 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170673266sm18589553eec.1.2026.01.13.09.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 09:16:01 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 13 Jan 2026 09:16:00 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: "benoit.masson" <yahoo@perenite.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] hwmon: it87: describe per-chip temperature
 resources
Message-ID: <986c8598-aaee-46e7-8ba2-8b8c73dd977b@roeck-us.net>
References: <20260110012613.48150-1-yahoo@perenite.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260110012613.48150-1-yahoo@perenite.com>

On Sat, Jan 10, 2026 at 02:26:09AM +0100, benoit.masson wrote:
> Add per-chip temp limit/offset/map counts and wire the driver
> to use them.
> 
> This keeps existing chips on the previous defaults while allowing newer
> chips to advertise larger resources.
> 
> Signed-off-by: benoit.masson <yahoo@perenite.com>
> ---
>  drivers/hwmon/it87.c | 51 +++++++++++++++++++++++++++++++++-----------
>  1 file changed, 38 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index e233aafa8856..ec5b1668dd7b 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -54,6 +54,7 @@
>  #include <linux/hwmon-vid.h>
>  #include <linux/err.h>
>  #include <linux/mutex.h>
> +#include <linux/minmax.h>
>  #include <linux/sysfs.h>
>  #include <linux/string.h>
>  #include <linux/dmi.h>
> @@ -279,8 +280,9 @@ static const u8 IT87_REG_AUTO_BASE[] = { 0x60, 0x68, 0x70, 0x78, 0xa0, 0xa8 };
>  #define NUM_VIN			ARRAY_SIZE(IT87_REG_VIN)
>  #define NUM_VIN_LIMIT		8
>  #define NUM_TEMP		6
> -#define NUM_TEMP_OFFSET		ARRAY_SIZE(IT87_REG_TEMP_OFFSET)
> -#define NUM_TEMP_LIMIT		3
> +#define IT87_TEMP_OFFSET_MAX	ARRAY_SIZE(IT87_REG_TEMP_OFFSET)
> +#define IT87_TEMP_LIMIT_DEFAULT	3
> +#define IT87_TEMP_MAP_DEFAULT	3

Adding IT87_ prefixes here is unnecessary and inconsistent.

_DEFAULT defines are unnecessary. num_temp_limit, num_temp_offset,
and num_temp_map should be added to all configuration entries.
With this, FEAT_TEMP_OFFSET and has_temp_offset() are unnecessary
and can be dropped since support is implicit with num_temp_offset > 0.

>  #define NUM_FAN			ARRAY_SIZE(IT87_REG_FAN)
>  #define NUM_FAN_DIV		3
>  #define NUM_PWM			ARRAY_SIZE(IT87_REG_PWM)
> @@ -290,6 +292,9 @@ struct it87_devices {
>  	const char *name;
>  	const char * const model;
>  	u32 features;
> +	u8 num_temp_limit;
> +	u8 num_temp_offset;
> +	u8 num_temp_map;
>  	u8 peci_mask;
>  	u8 old_peci_mask;
>  	u8 smbus_bitmap;	/* SMBus enable bits in extra config register */
> @@ -578,6 +583,9 @@ struct it87_data {
>  	int sioaddr;
>  	enum chips type;
>  	u32 features;
> +	u8 num_temp_limit;
> +	u8 num_temp_offset;
> +	u8 num_temp_map;
>  	u8 peci_mask;
>  	u8 old_peci_mask;
>  
> @@ -926,12 +934,13 @@ static struct it87_data *it87_update_device(struct device *dev)
>  			data->temp[i][0] =
>  				it87_read_value(data, IT87_REG_TEMP(i));
>  
> -			if (has_temp_offset(data) && i < NUM_TEMP_OFFSET)
> +			if (has_temp_offset(data) &&
> +			    i < data->num_temp_offset)
>  				data->temp[i][3] =
>  				  it87_read_value(data,
>  						  IT87_REG_TEMP_OFFSET[i]);
>  
> -			if (i >= NUM_TEMP_LIMIT)
> +			if (i >= data->num_temp_limit)
>  				continue;
>  
>  			data->temp[i][1] =
> @@ -1679,16 +1688,18 @@ static ssize_t show_pwm_temp_map(struct device *dev,
>  	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
>  	struct it87_data *data = it87_update_device(dev);
>  	int nr = sensor_attr->index;
> +	u8 num_map;
>  	int map;
>  
>  	if (IS_ERR(data))
>  		return PTR_ERR(data);
>  
> +	num_map = data->num_temp_map ?: IT87_TEMP_MAP_DEFAULT;
>  	map = data->pwm_temp_map[nr];
> -	if (map >= 3)
> +	if (map >= num_map)
>  		map = 0;	/* Should never happen */
> -	if (nr >= 3)		/* pwm channels 3..6 map to temp4..6 */
> -		map += 3;
> +	if (nr >= num_map)	/* pwm channels 3..6 map to temp4..6 */
> +		map += num_map;
>  
>  	return sprintf(buf, "%d\n", (int)BIT(map));
>  }
> @@ -1700,6 +1711,7 @@ static ssize_t set_pwm_temp_map(struct device *dev,
>  	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
>  	struct it87_data *data = dev_get_drvdata(dev);
>  	int nr = sensor_attr->index;
> +	u8 num_map = data->num_temp_map ?: IT87_TEMP_MAP_DEFAULT;
>  	long val;
>  	int err;
>  	u8 reg;
> @@ -1707,8 +1719,8 @@ static ssize_t set_pwm_temp_map(struct device *dev,
>  	if (kstrtol(buf, 10, &val) < 0)
>  		return -EINVAL;
>  
> -	if (nr >= 3)
> -		val -= 3;
> +	if (nr >= num_map)
> +		val -= num_map;
>  
>  	switch (val) {
>  	case BIT(0):
> @@ -3206,7 +3218,7 @@ static void it87_check_limit_regs(struct it87_data *data)
>  		if (reg == 0xff)
>  			it87_write_value(data, IT87_REG_VIN_MIN(i), 0);
>  	}
> -	for (i = 0; i < NUM_TEMP_LIMIT; i++) {
> +	for (i = 0; i < data->num_temp_limit; i++) {
>  		reg = it87_read_value(data, IT87_REG_TEMP_HIGH(i));
>  		if (reg == 0xff)
>  			it87_write_value(data, IT87_REG_TEMP_HIGH(i), 127);
> @@ -3399,6 +3411,7 @@ static int it87_probe(struct platform_device *pdev)
>  	struct resource *res;
>  	struct device *dev = &pdev->dev;
>  	struct it87_sio_data *sio_data = dev_get_platdata(dev);
> +	const struct it87_devices *chip;
>  	int enable_pwm_interface;
>  	struct device *hwmon_dev;
>  	int err;
> @@ -3421,9 +3434,21 @@ static int it87_probe(struct platform_device *pdev)
>  	data->type = sio_data->type;
>  	data->smbus_bitmap = sio_data->smbus_bitmap;
>  	data->ec_special_config = sio_data->ec_special_config;
> -	data->features = it87_devices[sio_data->type].features;
> -	data->peci_mask = it87_devices[sio_data->type].peci_mask;
> -	data->old_peci_mask = it87_devices[sio_data->type].old_peci_mask;
> +	chip = &it87_devices[sio_data->type];
> +	data->features = chip->features;
> +	data->peci_mask = chip->peci_mask;
> +	data->old_peci_mask = chip->old_peci_mask;
> +	data->num_temp_limit = chip->num_temp_limit ?
> +			       chip->num_temp_limit : IT87_TEMP_LIMIT_DEFAULT;
> +	if (chip->num_temp_offset)
> +		data->num_temp_offset = min(chip->num_temp_offset,
> +					    (u8)IT87_TEMP_OFFSET_MAX);
> +	else if (has_temp_offset(data))
> +		data->num_temp_offset = IT87_TEMP_OFFSET_MAX;
> +	else
> +		data->num_temp_offset = 0;
> +	data->num_temp_map = chip->num_temp_map ?
> +			     chip->num_temp_map : IT87_TEMP_MAP_DEFAULT;

Runtime checks of build parameters are unacceptable and, again,
all fields should be initialized correctly in the configuration data.
That is what it is for. Runtime updates such as the above are both
unnecessary and unacceptable. num_temp_limit, num_temp_map and
num_temp_offset are available in the configuration data. Enter the data
there and use it.

Thanks,
Guenter
