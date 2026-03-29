Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C0D233721
	for <linux-hwmon@vger.kernel.org>; Sun, 29 Mar 2026 15:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774796483; cv=none; b=gXdNWxO9t/kAdoZXmBraS5YsxiwF+3TBYGzbOb8HTv1QP1QhIJBvWihieJ6quli/nJC4Vt6nF5x1+XgZ1xm8cm8DKYJIYaCmWmmR9oRv15svg9znuV4pRODzgqzw5SzgHy23KV+Nwfo05yMGMKXsjxb3sCqSZTgYf0KvCwiw1WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774796483; c=relaxed/simple;
	bh=lejtvJC33p9BC+RwaffBBGR04HATVQb7DJfIZ9KTOQQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MOekdp68LX4yW9sHRlMU+tTV+v2cEv04incxZ8I3l8p8rUy5mWM53wk1ZUYd6AQ4omS2Fe/BhqPl2ILdURA+R7mcIAZS3bloNBSMrjlJVRkX46GJoHZZ4gZW/kaapGAeEmQxf6Xzlq2oFCGw7bgChtC4FakdF1rKFuDnwUadT6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gPnp492Y; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gPnp492Y"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2c17d152c01so2536056eec.0
        for <linux-hwmon@vger.kernel.org>; Sun, 29 Mar 2026 08:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774796481; x=1775401281; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3d6tmspJxyJbyp8HTBXeNyse5uUauM5IakWF7IZoW0=;
        b=gPnp492YD8l7fjX9v7Erl0DjsUv0M9jPuts0BBXRvgH8gyfZnHre7FZNkviTNE9dJB
         ajGBNpMdgePTHNb/yA1VdnLiKO9OBAMjfpSvnknuulvx6gdMx57SwCPhTWcYILjrWccD
         DaepUPTYDrQr7/hG4JE4UumRmD3LO3Cteip8yUGSBtCLXt0fviUiC99touAtspRq1Ybh
         GYA6X0PdI0kH3NaSoiwQZUU2UafDlX2rGuS/JLJoTc6qCChpby+TZ0nBXjSiMP26kZ8P
         WMlE60fuwUNlfzWBSKu9NGkzKmYu/Uaa89Wej6tuz1ZXud2eOd5geYT2Uf2RJpXnEkCi
         VNDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774796481; x=1775401281;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q3d6tmspJxyJbyp8HTBXeNyse5uUauM5IakWF7IZoW0=;
        b=Ggec0mnNb1rENtov3c99txM5sHdET72SXh+YAiC9csBQ52qwEcxO7tgi8BNMTswQ3r
         0GECBrgAVQkVhiqHXI5ana/7HqX0k/tLPlb6bxQiNGa4e9eSaNoauVj1SJG80kI0spk1
         BEXCNtrau+J7ppkO8Lj3gKUDBkQalaWUpxNlOT3TU7P3sQmXMo21VNR7cI8R6/b1hHy6
         y31AaB+1pp7f/VbyKnpn4R46vqXnJOmauQr29oacuCpYC+EZtlxXdPYtYw6WdRYqd776
         3MQIVmo1w6+JtfOE9DziQiUd92Ju2wcM5dz3c7+a56MI6LAWTuhnImPnyd0b+cf8ke96
         +7MA==
X-Gm-Message-State: AOJu0Yzt9P7fuTLzEDJlvyeZ+70qecLZaSZe+QSBKr93Fe1EVdfEkT2c
	ooZhbsVQ64qC2f6fxgWDUQsbIfgHJmMo1XLILfg242hZoKHJ7D6fZIJE
X-Gm-Gg: ATEYQzz59tpTPafqfPVHCnR2z1i92X0hxMTtkad4zor4zAlu2LAM6HrA7x1X9erya4k
	w7y7G+t6et8PCVfeD6UvV0NinuEAfgjRFWHZXp4dUuaGFwcNTaNTTCsZ+9fA6NP5sIjSiHt1vnY
	CVdcoLRlIq4OFzIw9/6A0hjss6sRJ0CDRfkzhrUiMpEeoPedpqOSSa1pc+t/i0qa0Oc5uKmUy8G
	ECrcBt0sa3kSEN9L8lJfdOcwBa6zdv+F1REWl7mV+tVZ2EP4lvZcW+OXV4utzz0ZNJHa/9LIJc/
	SoDalI9rpaB//E29djmhzY7PtoEq2Iv0V8O8GaZYfZ90kezlJogwlb/RRpZHkYX1mtFgb0rzjn8
	nwsuTyEGDtSpQS/cNtvIzgpkhzCXHMJp7AN2scSxeZ864CxP71bbSk5sOtr53jnosUq38ROT8or
	MvWH2e3oBEv+uA5Fnx4Fr/iwQJ7p8g4k0b+wZDZHrX5zPdVsDi883fhyq9j78HOBulMalRwr/T
X-Received: by 2002:a05:7300:ca1:b0:2ba:7617:eeb1 with SMTP id 5a478bee46e88-2c185d53755mr5003930eec.12.1774796480616;
        Sun, 29 Mar 2026 08:01:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c6e9ca80sm5209141eec.22.2026.03.29.08.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 08:01:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ca7260a7-0dad-4e3d-8807-9e8bfbd15a8e@roeck-us.net>
Date: Sun, 29 Mar 2026 08:01:18 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] hwmon: (ads7871) Convert to
 hwmon_device_register_with_info
To: Tabrez Ahmed <tabreztalks@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 shuah@kernel.org, me@brighamcampbell.com
References: <20260329073352.270451-1-tabreztalks@gmail.com>
 <20260329073352.270451-2-tabreztalks@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260329073352.270451-2-tabreztalks@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 3/29/26 00:33, Tabrez Ahmed wrote:
> Convert the ads7871 driver from the legacy hwmon_device_register() to the
> modern hwmon_device_register_with_info() API. This migration simplifies
> the driver by using the structured hwmon_channel_info approach and
> prepares the codebase for the transition to a shared DMA-safe buffer.
> 

Please add: "While at it, fix checkpatch violations" since you fixed the
"empty line after variable declarations" problem.

.. but please fix all of them. See inline.

Thanks,
Guenter

> Signed-off-by: Tabrez Ahmed <tabreztalks@gmail.com>
> ---
>   drivers/hwmon/ads7871.c | 76 ++++++++++++++++++++++-------------------
>   1 file changed, 41 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/hwmon/ads7871.c b/drivers/hwmon/ads7871.c
> index 9bfdf9e6bcd77..41a1e9bbd4050 100644
> --- a/drivers/hwmon/ads7871.c
> +++ b/drivers/hwmon/ads7871.c
> @@ -56,7 +56,6 @@
>   #include <linux/init.h>
>   #include <linux/spi/spi.h>
>   #include <linux/hwmon.h>
> -#include <linux/hwmon-sysfs.h>
>   #include <linux/err.h>
>   #include <linux/delay.h>
>   
> @@ -65,10 +64,20 @@
>   struct ads7871_data {
>   	struct spi_device *spi;
>   };

Add empty line (checkpatch reports that, plus a couple more formatting issues).

> +static umode_t ads7871_is_visible(const void *data,
> +				  enum hwmon_sensor_types type,
> +				  u32 attr, int channel)
> +{
> +	if (type == hwmon_in && attr == hwmon_in_input)
> +		return 0444;
> +
> +	return 0;
> +}
>   
>   static int ads7871_read_reg8(struct spi_device *spi, int reg)
>   {
>   	int ret;
> +
>   	reg = reg | INST_READ_BM;
>   	ret = spi_w8r8(spi, reg);
>   	return ret;
> @@ -77,6 +86,7 @@ static int ads7871_read_reg8(struct spi_device *spi, int reg)
>   static int ads7871_read_reg16(struct spi_device *spi, int reg)
>   {
>   	int ret;
> +
>   	reg = reg | INST_READ_BM | INST_16BIT_BM;
>   	ret = spi_w8r16(spi, reg);
>   	return ret;
> @@ -85,19 +95,20 @@ static int ads7871_read_reg16(struct spi_device *spi, int reg)
>   static int ads7871_write_reg8(struct spi_device *spi, int reg, u8 val)
>   {
>   	u8 tmp[2] = {reg, val};
> +
>   	return spi_write(spi, tmp, sizeof(tmp));
>   }
>   
> -static ssize_t voltage_show(struct device *dev, struct device_attribute *da,
> -			    char *buf)
> +static int ads7871_read(struct device *dev, enum hwmon_sensor_types type,
> +			u32 attr, int channel, long *val)
>   {
>   	struct ads7871_data *pdata = dev_get_drvdata(dev);
>   	struct spi_device *spi = pdata->spi;
> -	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
> -	int ret, val, i = 0;
> -	uint8_t channel, mux_cnv;
> +	int ret, raw_val, i = 0;
> +	uint8_t mux_cnv;
>   
> -	channel = attr->index;
> +	if (type != hwmon_in || attr != hwmon_in_input)
> +		return -EOPNOTSUPP;

That doesn't hurt but isn't really needed here.

>   	/*
>   	 * TODO: add support for conversions
>   	 * other than single ended with a gain of 1
> @@ -127,39 +138,34 @@ static ssize_t voltage_show(struct device *dev, struct device_attribute *da,
>   	}
>   
>   	if (mux_cnv == 0) {
> -		val = ads7871_read_reg16(spi, REG_LS_BYTE);
> -		if (val < 0)
> -			return val;
> +		raw_val = ads7871_read_reg16(spi, REG_LS_BYTE);
> +		if (raw_val < 0)
> +			return raw_val;
> +
>   		/*result in volts*10000 = (val/8192)*2.5*10000*/
> -		val = ((val >> 2) * 25000) / 8192;
> -		return sysfs_emit(buf, "%d\n", val);
> +		*val = ((raw_val >> 2) * 25000) / 8192;
> +		return 0;

Sashiko suggests to make the 16-bit operations endianness safe.

https://sashiko.dev/#/patchset/20260329073352.270451-1-tabreztalks%40gmail.com

Not mandatory, but just in case you have the time ...

>   	}
>   
>   	return -ETIMEDOUT;
>   }
>   
> -static SENSOR_DEVICE_ATTR_RO(in0_input, voltage, 0);
> -static SENSOR_DEVICE_ATTR_RO(in1_input, voltage, 1);
> -static SENSOR_DEVICE_ATTR_RO(in2_input, voltage, 2);
> -static SENSOR_DEVICE_ATTR_RO(in3_input, voltage, 3);
> -static SENSOR_DEVICE_ATTR_RO(in4_input, voltage, 4);
> -static SENSOR_DEVICE_ATTR_RO(in5_input, voltage, 5);
> -static SENSOR_DEVICE_ATTR_RO(in6_input, voltage, 6);
> -static SENSOR_DEVICE_ATTR_RO(in7_input, voltage, 7);
> -
> -static struct attribute *ads7871_attrs[] = {
> -	&sensor_dev_attr_in0_input.dev_attr.attr,
> -	&sensor_dev_attr_in1_input.dev_attr.attr,
> -	&sensor_dev_attr_in2_input.dev_attr.attr,
> -	&sensor_dev_attr_in3_input.dev_attr.attr,
> -	&sensor_dev_attr_in4_input.dev_attr.attr,
> -	&sensor_dev_attr_in5_input.dev_attr.attr,
> -	&sensor_dev_attr_in6_input.dev_attr.attr,
> -	&sensor_dev_attr_in7_input.dev_attr.attr,
> +static const struct hwmon_channel_info * const ads7871_info[] = {
> +	HWMON_CHANNEL_INFO(in,
> +		HWMON_I_INPUT, HWMON_I_INPUT, HWMON_I_INPUT, HWMON_I_INPUT,
> +		HWMON_I_INPUT, HWMON_I_INPUT, HWMON_I_INPUT, HWMON_I_INPUT),
>   	NULL
>   };
>   
> -ATTRIBUTE_GROUPS(ads7871);
> +static const struct hwmon_ops ads7871_hwmon_ops = {
> +	.is_visible = ads7871_is_visible,
> +	.read = ads7871_read,
> +};
> +
> +static const struct hwmon_chip_info ads7871_chip_info = {
> +	.ops = &ads7871_hwmon_ops,
> +	.info = ads7871_info,
> +};
>   
>   static int ads7871_probe(struct spi_device *spi)
>   {
> @@ -194,10 +200,10 @@ static int ads7871_probe(struct spi_device *spi)
>   		return -ENOMEM;
>   
>   	pdata->spi = spi;
> -
> -	hwmon_dev = devm_hwmon_device_register_with_groups(dev, spi->modalias,
> -							   pdata,
> -							   ads7871_groups);
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, spi->modalias,
> +							 pdata,
> +							 &ads7871_chip_info,
> +							 NULL);
>   	return PTR_ERR_OR_ZERO(hwmon_dev);
>   }
>   

