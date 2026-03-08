Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC8538A718
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Mar 2026 17:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772990828; cv=none; b=gI2x++TZr1qj8ifQu4QIV+yR8uecFdy2XNk0ETSwK1xp23llE0JJ8euaZvb2KuuCxGt24KVdcu0oOd2JXp+UiFX18b08cEVYXRe7v17ir4of4z4wShRJPKyWJXWagTPDPcRDOcdB8jFmG4X8/sBEir1of51q+D8jbsItTl40zLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772990828; c=relaxed/simple;
	bh=CAQ8S8M8gY757s8+qFF69y5Q2kg+5Gz8Hr4+kBTp5XI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RnIYpd9HRMUdQorjrUHhY8jP+VX4TyCeweK5otd27jhkI1ZNxo59omoj9WfVKBO9c8agQhaztkLFtGq/1nEkB7k/Z4Ah+BEtVdiCggsCJOZgnTKMKg2jepu2K9Zp9wQZrWgIF5+fNaBhDsMFEMQoBvM6okH+f2jxGOgBPFW3Tm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lH1C/uBC; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lH1C/uBC"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so6117220eec.1
        for <linux-hwmon@vger.kernel.org>; Sun, 08 Mar 2026 10:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772990824; x=1773595624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0B8wfwcJ9MtNTTDGKV0MRSAjfLmQc8I4ziS7m3/Fg+w=;
        b=lH1C/uBCbljTOXPq241XDCD6fxXQXOQnGYX0RWB2ZlKQVj75rbAm9S2CgHJ+3H2MyW
         p72m4d5flMKPG0RGD7Hx0zNzNkT1jxCdLYgiIksIRxssb40uHRzAn2hMqZfx0W9/rKzB
         tVbXcpvUdPZIrGrZaTW9q7K7l/mj/uVnMWxDiIUYbykxeL0TnHVlhzpyBeJt3hXJV4Xs
         ZGvBjDF8IpY55nZZZHII7E79D0SR9u1WB1entmKLViiTBWvFU9XKITisePbkvEpOaXWd
         ZqeeShTPcdbFhYRhKG5OuT/qVICsxo2e7hwfmeHW8p68hAY3FowQ3QsCItqNY40yRQDI
         I2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772990824; x=1773595624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0B8wfwcJ9MtNTTDGKV0MRSAjfLmQc8I4ziS7m3/Fg+w=;
        b=Rnu/MQ+BW5GyhHER05mI0robR9ZCPn2o42SuV2T86inKwCm2mT0y/5BwZidF1GMIjC
         6+GMs2SiTSQd6DoVKhtC9FEIC2k3FsQZicmN0vBFR8bjUujBmNPSz5Dh2jh3l/zXDB6t
         cDTumBiB9o/bd/ez9R2NC4Gx1bNONM4n+iKAqyYZ1SymjFnYZadhVOvuwcC+2ycSiCF/
         XjjOCnbbdHNMGUL+Vf1eHZiEekbPG740kSC61PjyBd20NVS6IVivgxG7vwQTFC8JmN1+
         0VIPkWMxiC3DRxwlDWt9M5C2vSQ0mBBIl4BwQrhXb7N4T5NP0sFj26lzQJ76rPReNpX7
         SZYA==
X-Forwarded-Encrypted: i=1; AJvYcCWUG17p+JA8WTBoA9qoGagphmyokRoKvAUa1Y1QugJU3avAO/K4rPw4nCf0DeXVAo2Briiz2ws4XLi1RQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFU3NftqzfKwLSEi2alCBabV7R77ZNxCL658LWOO1dSfWg0Jm8
	6zze0Nc4wyOPqp5vQBZSXYzKTtqpiRzwgiiwK+BpfDswl4cclbTmsq1r
X-Gm-Gg: ATEYQzwScS1Qe9uGvrtnr3VtUpZpEmBhNTzMh5O6pGZRC1KBBrrnoJzcms/mgwKGy2l
	SmOJAcws3frUHT4c1qDvXHjJYzLpDsyQjJU/LWI4I+5/3q4SlDxIq6W44Dmdfsy5IDzCSP8/7qJ
	VjXZ/DCot7UnUg85XXdokcewjVJKKFXx0v6vtKDJ3qUxZmnO7FeKXOUATF4Hcx4z4mDSPho/Jfd
	+ZKdYCZeLSNscNRsjntCcqfsA7S/2TloIQZp8kmcwx4gtAFRfwzAcYPCS4OnjQYvyL9Lzhz7Oli
	OrAcBrPn+KPqVy7NDMw0WR7oPkOuXC2A1dLLr9OiVhJtqsfN7gMVRnZrPcwloL9WCipWnQfKWBC
	gSpWtrO1N8p4ZmMCRp7PnzSCS6YhiQjqe0gdrOPvbSNoC/pHEl2gD5+jdl0kkMa0UCeXH1xevGX
	d96ehru2J3x4JW7m7ZKgU4iq9ljOSXu8prIg4ccrSD6YLm5jw=
X-Received: by 2002:a05:7300:6c28:b0:2be:8da:320f with SMTP id 5a478bee46e88-2be4deacfa2mr3199124eec.10.1772990823981;
        Sun, 08 Mar 2026 10:27:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f80d72esm6917083eec.4.2026.03.08.10.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 10:27:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 8 Mar 2026 10:27:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Stoyan Bogdanov <sbogdanov@baylibre.com>
Cc: jbrunet@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] hwmon: (pmbus/tps25990): Rework TPS25990 non
 standatd direct conversion
Message-ID: <8f691afc-cac1-4583-9c64-68372644aa1d@roeck-us.net>
References: <20260217081203.1792025-1-sbogdanov@baylibre.com>
 <20260217081203.1792025-2-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217081203.1792025-2-sbogdanov@baylibre.com>

On Tue, Feb 17, 2026 at 10:12:01AM +0200, Stoyan Bogdanov wrote:
> Rework existing implementation for calculation of direct
> format conversion for TPS25990. With this implamentation
> is leveraged code reusability for non standard parameters.
>  - Add enum for parameter
>  - Add m, b, R structure to hold value per device
>  - Add data structure to hold for pmbus_driver_info and
>    local_direct_values
>  - Conversion functions are implemented according to formula from
>    TPS25990 datasheet
>  - Remove previously used defines replace with structure
> 
> Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
> ---
>  drivers/hwmon/pmbus/tps25990.c | 115 +++++++++++++++++++++++++--------
>  1 file changed, 88 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/tps25990.c b/drivers/hwmon/pmbus/tps25990.c
> index c13edd7e1abf..33f6367f797c 100644
> --- a/drivers/hwmon/pmbus/tps25990.c
> +++ b/drivers/hwmon/pmbus/tps25990.c
> @@ -36,17 +36,58 @@
>  #define  TPS25990_UNLOCKED		BIT(7)
>  
>  #define TPS25990_8B_SHIFT		2
> -#define TPS25990_VIN_OVF_NUM		525100
> -#define TPS25990_VIN_OVF_DIV		10163
> -#define TPS25990_VIN_OVF_OFF		155
> -#define TPS25990_IIN_OCF_NUM		953800
> -#define TPS25990_IIN_OCF_DIV		129278
> -#define TPS25990_IIN_OCF_OFF		157
>  
>  #define PK_MIN_AVG_RST_MASK		(PK_MIN_AVG_RST_PEAK | \
>  					 PK_MIN_AVG_RST_AVG  | \
>  					 PK_MIN_AVG_RST_MIN)
>  
> +enum tps25990_parameters {
> +	TPS25990_VIN_OVF = 0, /* VIN over volatage fault */
> +	TPS25990_IIN_OCF, /* IIN Over currect fault */
> +	TPS25590_DIRECT_VALUES_MAX, /* Max value ensure there enough space */
> +};
> +
> +struct local_direct_value {
> +	int m[TPS25590_DIRECT_VALUES_MAX]; /* mantissa for direct data format */
> +	int b[TPS25590_DIRECT_VALUES_MAX]; /* offset */
> +	int R[TPS25590_DIRECT_VALUES_MAX]; /* exponent */
> +};
> +
> +struct tps25990_data {
> +	struct pmbus_driver_info *info;
> +	struct local_direct_value *info_local;
> +};
> +
> +static int tps25990_raw_to_value(struct i2c_client *client, int param, int raw)
> +{
> +	struct tps25990_data *data = (struct tps25990_data *)of_device_get_match_data(&client->dev);

This returns the global data structure (which is corrupted on
multi-instance systems) instead of per-instance data.

> +	struct local_direct_value *info_local = data->info_local;
> +
> +	/* Formula : X = (Y / 10^R - b) / m */
> +	if (info_local->R[param] >= 0)
> +		raw /= int_pow(10, info_local->R[param]);
> +	else
> +		raw *= int_pow(10, -info_local->R[param]);

This will overflow if the exponent is -6 and raw is larger than ~2147.
This may not happen with current parameters, but it is brittle.

> +
> +	return DIV_ROUND_CLOSEST(raw - info_local->b[param], info_local->m[param]);
> +}
> +
> +static unsigned int tps25990_value_to_raw(struct i2c_client *client, int param, int val)
> +{
> +	struct tps25990_data *data = (struct tps25990_data *)of_device_get_match_data(&client->dev);
> +	struct local_direct_value *info_local = data->info_local;
> +
> +	/* Formula : Y = ( m * X + b) * 10^R */
> +	val = (long)val * info_local->m[param] + info_local->b[param];

This will overflow on 32-bit systems (where long is a 32-bit value).

> +
> +	if (info_local->R[param] >= 0)
> +		val *= int_pow(10, info_local->R[param]);
> +	else
> +		val = DIV_ROUND_CLOSEST(val, int_pow(10, -info_local->R[param]));
> +
> +	return val;
> +}
> +
>  /*
>   * Arbitrary default Rimon value: 1kOhm
>   * This correspond to an overcurrent limit of 55A, close to the specified limit
> @@ -184,9 +225,7 @@ static int tps25990_read_word_data(struct i2c_client *client,
>  		ret = pmbus_read_word_data(client, page, phase, reg);
>  		if (ret < 0)
>  			break;
> -		ret = DIV_ROUND_CLOSEST(ret * TPS25990_VIN_OVF_NUM,
> -					TPS25990_VIN_OVF_DIV);
> -		ret += TPS25990_VIN_OVF_OFF;
> +		ret = tps25990_raw_to_value(client, TPS25990_VIN_OVF, ret);
>  		break;
>  
>  	case PMBUS_IIN_OC_FAULT_LIMIT:
> @@ -198,9 +237,7 @@ static int tps25990_read_word_data(struct i2c_client *client,
>  		ret = pmbus_read_byte_data(client, page, TPS25990_VIREF);
>  		if (ret < 0)
>  			break;
> -		ret = DIV_ROUND_CLOSEST(ret * TPS25990_IIN_OCF_NUM,
> -					TPS25990_IIN_OCF_DIV);
> -		ret += TPS25990_IIN_OCF_OFF;
> +		ret = tps25990_raw_to_value(client, TPS25990_IIN_OCF, ret);
>  		break;
>  
>  	case PMBUS_VIRT_SAMPLES:
> @@ -246,17 +283,13 @@ static int tps25990_write_word_data(struct i2c_client *client,
>  		break;
>  
>  	case PMBUS_VIN_OV_FAULT_LIMIT:
> -		value -= TPS25990_VIN_OVF_OFF;
> -		value = DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_VIN_OVF_DIV,
> -					  TPS25990_VIN_OVF_NUM);
> +		value = tps25990_value_to_raw(client, TPS25990_VIN_OVF, value);
>  		value = clamp_val(value, 0, 0xf);
>  		ret = pmbus_write_word_data(client, page, reg, value);
>  		break;
>  
>  	case PMBUS_IIN_OC_FAULT_LIMIT:
> -		value -= TPS25990_IIN_OCF_OFF;
> -		value = DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_IIN_OCF_DIV,
> -					  TPS25990_IIN_OCF_NUM);
> +		value = tps25990_value_to_raw(client, TPS25990_IIN_OCF, value);
>  		value = clamp_val(value, 0, 0x3f);
>  		ret = pmbus_write_byte_data(client, page, TPS25990_VIREF, value);
>  		break;
> @@ -337,7 +370,16 @@ static const struct regulator_desc tps25990_reg_desc[] = {
>  };
>  #endif
>  
> -static const struct pmbus_driver_info tps25990_base_info = {
> +struct local_direct_value tps25590_local_info = {
> +	.m[TPS25990_VIN_OVF] = 10163,
> +	.b[TPS25990_VIN_OVF] = -30081,
> +	.R[TPS25990_VIN_OVF] = -4,
> +	.m[TPS25990_IIN_OCF] = 9538,
> +	.b[TPS25990_IIN_OCF] = 0,
> +	.R[TPS25990_IIN_OCF] = -6,
> +};
> +
> +static struct pmbus_driver_info tps25990_base_info = {
>  	.pages = 1,
>  	.format[PSC_VOLTAGE_IN] = direct,
>  	.m[PSC_VOLTAGE_IN] = 5251,
> @@ -386,14 +428,19 @@ static const struct pmbus_driver_info tps25990_base_info = {
>  #endif
>  };
>  
> +struct tps25990_data data_tps25990 = {
> +	.info = &tps25990_base_info,
> +	.info_local = &tps25590_local_info,
> +};
> +
>  static const struct i2c_device_id tps25990_i2c_id[] = {
> -	{ "tps25990" },
> +	{ .name = "tps25990", .driver_data = (kernel_ulong_t)&data_tps25990 },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(i2c, tps25990_i2c_id);
>  
>  static const struct of_device_id tps25990_of_match[] = {
> -	{ .compatible = "ti,tps25990" },
> +	{ .compatible = "ti,tps25990", .data = &data_tps25990 },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, tps25990_of_match);
> @@ -401,23 +448,37 @@ MODULE_DEVICE_TABLE(of, tps25990_of_match);
>  static int tps25990_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
> -	struct pmbus_driver_info *info;
> +	struct tps25990_data *data;
>  	u32 rimon = TPS25990_DEFAULT_RIMON;
> +	struct pmbus_driver_info *info_get;
> +	struct local_direct_value *info_local_get;
>  	int ret;
>  
>  	ret = device_property_read_u32(dev, "ti,rimon-micro-ohms", &rimon);
>  	if (ret < 0 && ret != -EINVAL)
>  		return dev_err_probe(dev, ret, "failed to get rimon\n");
>  
> -	info = devm_kmemdup(dev, &tps25990_base_info, sizeof(*info), GFP_KERNEL);
> -	if (!info)
> +	data = (struct tps25990_data *)of_device_get_match_data(dev);
> +	if (!data)
> +		return -EOPNOTSUPP;

By calling of_device_get_match_data() which returns NULL on non-devicetree
systems, this patch breaks support for such systems.

> +
> +	info_get = data->info;
> +	/* Make copy of pmbus_info and replace it to preserve original values */
> +	data->info = devm_kmemdup(dev, info_get, sizeof(*info_get), GFP_KERNEL);

This overwrites information in the global data structure returned by
of_device_get_match_data(). When multiple instances of the device exist,
each subsequent probe overwrites the global pointer. If any device is
removed, the global pointer now points to freed memory, leading to a
Use-After-Free when other instances access it via of_device_get_match_data
or during their own removal/re-probe.

This also completely breaks multi-instance support.

> +	if (!data->info)
> +		return -ENOMEM;
> +
> +	info_local_get = data->info_local;
> +	/* Make copy of pmbus_info and replace it to preserve original values */
> +	data->info_local = devm_kmemdup(dev, info_local_get, sizeof(*info_local_get), GFP_KERNEL);
> +	if (!data->info_local)
>  		return -ENOMEM;
>  
>  	/* Adapt the current and power scale for each instance */
> -	tps25990_set_m(&info->m[PSC_CURRENT_IN], rimon);
> -	tps25990_set_m(&info->m[PSC_POWER], rimon);
> +	tps25990_set_m(&data->info->m[PSC_CURRENT_IN], rimon);
> +	tps25990_set_m(&data->info->m[PSC_POWER], rimon);
>  
> -	return pmbus_do_probe(client, info);
> +	return pmbus_do_probe(client, data->info);
>  }
>  
>  static struct i2c_driver tps25990_driver = {
