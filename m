Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAA536EA98
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 14:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781619189; cv=none; b=D6epGTmeKqaFZTKy9Q1K3QfiTKQaTFaLJMWFIIcQ2kXWEoFPobcp+ZbcgjLJMVuvdTtyWbk/KUZvC6fGZ46EZHcF4dBTCQ2LsIgm2dfdKpcLyT5x/y2XLYHppotyW+PrTFZfUvuBoA9BxLFzOtCnND5l/DM/E8Ipo2+i0VDoprE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781619189; c=relaxed/simple;
	bh=EzyrpESZ6sx78ziNYC4dwQEt1wvJ/sO+d+pbw71TIfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YxHLW0qrZGxXBY7JcES7s8nJmqdT+sD8y4Rj3N6+Aj55pt9ViWcixJ2RdaoEsx+gYXVGxT13ceEFwP4vyg6yojmbT0DF/vRo9tkA7T+lVBgaLVolSsJpuNHFZIIB1Nwy+McZd5J5cutl76AFUs/sDI2e4tErn770wHWJnAFLEe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j2WCRia5; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j2WCRia5"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-842d37438d8so1814035b3a.0
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 07:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781619186; x=1782223986; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=KXP0r2jujypcXFrQc5+xMdbDTCDzpAzAxM0kAvYA+dY=;
        b=j2WCRia5YnQl+EQLdPBleKUpROpPpCWpdoTv5tzPup9NdnwmtiDPBPCeZQGZleCXjT
         tBnE3fa61akEHOXUVt2LDQ+4iUavC6XVqaCR1+OBF0mLBFXurYS3kT4hcbSzlhh0nMqC
         ML3Xgs9m8SG4zkx9ZhM48To63GviCqm+TDVgMyNnCYcGxo3M458CIJBzOijJmLPFIqfF
         oXfvbZ3m1aUIk3WuSptb9lIbyPSlbOsSyiKh5bctpC3Fdd2+QQC/zDYov/d7GlFMSbFp
         xgR//YNazGWgGD0s0O0d83U7DudivwrSRsr2qI91MP3ltCs/SZ+NaUqv3GeIEQfUPauq
         U2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781619186; x=1782223986;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KXP0r2jujypcXFrQc5+xMdbDTCDzpAzAxM0kAvYA+dY=;
        b=C4DnjTE3oFVSuIrbJH9FOZKkBu2+DTAqpV5Y1uR2i8FdIUho4CeqHr+iXeTbRyTTwi
         S49IzdpZGvOZmm26A/MfyJ8+lJeEibM0bjLhIHW+lP5KeZS+C6QROjTsYZZfVtNfxtMd
         RODx8mYhOHqg91DItqgV0u2Mp6VH0LtNjHC+PqgO6CBolc2K1/FzZfu7jdGdz6RWGFys
         erf687uwXpbloK2XrO/2f0hAiZ7/eQarPgtAb1a7gHxOU6ZU6yWj56vEa3gKbP2FTOyy
         E/Vbgvs4R14dWPp1gyS9zwoLsPXWuVc5rW31QSwwYWHXL/DpQgDZZNZR3OwBl/zxCTMB
         YEOA==
X-Forwarded-Encrypted: i=1; AFNElJ93unTiz7qaxmeESoQ+AO1xwGpxtcF2kiBfg3z8KcnTaYfDSYeK2gyZp/mz/V+z8ACaINtrElamx4MrWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6SqlOzH7/yQ9VTWLVsx/uDoKxFLzxa4j/cEg6+lOE2QmadRq+
	rzpfc7sBTcgGN1nhbPEQlxH0VInIezwM6ujoGNLHFwytdbgfDGPrXBYR
X-Gm-Gg: Acq92OEotRogQTCayuqjRGt8VnhIm1mVT8S7TmdWlk0As4jwxH/2UN5/DzKWgopw3Ve
	Huv3wvyI8WZJaD34plY0HBbxjpWKm+FnpJRFLWfHblFKyQ41PkhdV3Y94hBId5HSnOs8YwptuNi
	IBOMYdwB/c85WnK0dowo6Kc105zifoxPajvMLd/yWfBuXe0TGfsia6JOQEpXo7IT+piCoCZS9Lx
	mB3jKxS5A30rbvV9mFn34xs6Jp5GZeiQXzI45k/BbuXfrRVPFDS6bFYMyFIUoDDfFHkx2ViaQ3U
	AUBcRjby3ntK8Vj9HajMmUnRB0aodjWvLMo52jmciQQk63hQP+8GzSemfL7hGiHZs3p+dA4USXr
	chU4zTFFOrnTXxTfA464qL1HH1jf7NT+jlfT3qGZBDlACoqlZHI3oRYiae+VYEibwCKtFUfcOna
	xTXeRYP5gzjeV5W4EwoP4kZIaQxIsjgbb9n62E4Ixdl4DE2Vssk3BFkVo2I3+Z182xSADfPtw8
X-Received: by 2002:a05:6a00:2da7:b0:842:5bf3:c53c with SMTP id d2e1a72fcca58-845152ae344mr3679305b3a.2.1781619186010;
        Tue, 16 Jun 2026 07:13:06 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b07c5c2sm13358690b3a.61.2026.06.16.07.13.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 07:13:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <67bec6ae-4f21-441a-8c5e-b56bd1a2ab84@roeck-us.net>
Date: Tue, 16 Jun 2026 07:13:03 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] hwmon: adm1275: Support ROHM BD12780
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Wensheng Wang <wenswang@yeah.net>,
 Ashish Yadav <ashish.yadav@infineon.com>,
 Kim Seer Paller <kimseer.paller@analog.com>,
 Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Yuxi Wang <Yuxi.Wang@monolithicpower.com>,
 Charles Hsu <hsu.yungteng@gmail.com>, ChiShih Tsai <tomtsai764@gmail.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <cover.1781591132.git.mazziesaccount@gmail.com>
 <c92f1356fbf967dee3130f2eb0da08eb84800d47.1781591132.git.mazziesaccount@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <c92f1356fbf967dee3130f2eb0da08eb84800d47.1781591132.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/15/26 23:36, Matti Vaittinen wrote:
> From: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> ROHM BD12780 and BD12780A are hot-swap controllers. They are largely
> similar to Analog Devices ADM1278. Besides the ID registers and some
> added functionality, the BD12780 and BD12780A mark PMON_CONFIG bits
> [15:14] as reserved. Hence TSFILT setting must be omitted on these ICs.
> 
> The BD12780 has 3 pins usable for configuring the I2C address. The
> BD12780A lists the ADDR3-pin as "not connect".
> 
> Support ROHM BD12780 and BD12780A controllers.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> ---
>   drivers/hwmon/pmbus/Kconfig   |  2 +-
>   drivers/hwmon/pmbus/adm1275.c | 46 +++++++++++++++++++++++++++++------
>   2 files changed, 39 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 8f4bff375ecb..b3c27f3b2712 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -52,7 +52,7 @@ config SENSORS_ADM1275
>   	help
>   	  If you say yes here you get hardware monitoring support for Analog
>   	  Devices ADM1075, ADM1272, ADM1273, ADM1275, ADM1276, ADM1278, ADM1281,
> -	  ADM1293, ADM1294 and SQ24905C Hot-Swap Controller and
> +	  ADM1293, ADM1294, ROHM BD12780, and SQ24905C Hot-Swap Controller and
>   	  Digital Power Monitors.
>   
>   	  This driver can also be built as a module. If so, the module will
> diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
> index bc2a6a07dc3e..838b8827eb76 100644
> --- a/drivers/hwmon/pmbus/adm1275.c
> +++ b/drivers/hwmon/pmbus/adm1275.c
> @@ -19,7 +19,7 @@
>   #include "pmbus.h"
>   
>   enum chips { adm1075, adm1272, adm1273, adm1275, adm1276, adm1278, adm1281,
> -	 adm1293, adm1294, sq24905c };
> +	 adm1293, adm1294, bd12780, sq24905c };
>   
>   #define ADM1275_MFR_STATUS_IOUT_WARN2	BIT(0)
>   #define ADM1293_MFR_STATUS_VAUX_UV_WARN	BIT(5)
> @@ -47,6 +47,8 @@ enum chips { adm1075, adm1272, adm1273, adm1275, adm1276, adm1278, adm1281,
>   #define ADM1278_VOUT_EN			BIT(1)
>   
>   #define ADM1278_PMON_DEFCONFIG		(ADM1278_VOUT_EN | ADM1278_TEMP1_EN | ADM1278_TSFILT)
> +/* The BD12780 data sheets mark TSFILT bit as reserved. */
> +#define BD12780_PMON_DEFCONFIG		(ADM1278_VOUT_EN | ADM1278_TEMP1_EN)
>   
>   #define ADM1293_IRANGE_25		0
>   #define ADM1293_IRANGE_50		BIT(6)
> @@ -487,6 +489,21 @@ static const struct i2c_device_id adm1275_id[] = {
>   	{ "adm1281", adm1281 },
>   	{ "adm1293", adm1293 },
>   	{ "adm1294", adm1294 },
> +	/*
> +	 * The BD12780a is functionally identical to BD12780(*). Even the pmbus ID
> +	 * register contents are same. When instantiated from the DT, it is required
> +	 * to have the bd12780 as a fall-back. We still need the bd12780a ID here,
> +	 * because the i2c_device_id is created from the first compatible, not from
> +	 * the fall-back entry.
> +	 * (*)Until proven to differ. I prefer having own compatible for these
> +	 * variants for that day. Please note that even though the probe is called
> +	 * based on the 'bd12780a' -entry, the ID is picked at probe based on the
> +	 * pmbus register contents and not by DT entry. Thus, if the bd12780 and
> +	 * bd12780a are found to require different handling, then this needs to be
> +	 * changed, or bd12780a is handled as bd12780.
> +	 */
> +	{ "bd12780", bd12780 },
> +	{ "bd12780a", /* driver data unused, see --^ */ },

We don't usually do that. There are various A/B/C variants for many chips,
and we just use the base name unless a difference is warranted. Either this
is needed, and driver data is needed as well, or it isn't. If it is not needed,
it should be dropped.

>   	{ "mc09c", sq24905c },
>   	{ }
>   };
> @@ -494,12 +511,13 @@ MODULE_DEVICE_TABLE(i2c, adm1275_id);
>   
>   /* Enable VOUT & TEMP1 if not enabled (disabled by default) */
>   static int adm1275_enable_vout_temp(struct adm1275_data *data,
> -				    struct i2c_client *client, int config)
> +				    struct i2c_client *client, int config,
> +				    u16 defconfig)
>   {
>   	int ret;
>   
> -	if ((config & ADM1278_PMON_DEFCONFIG) != ADM1278_PMON_DEFCONFIG) {
> -		config |= ADM1278_PMON_DEFCONFIG;
> +	if ((config & defconfig) != defconfig) {
> +		config |= defconfig;
>   		ret = adm1275_write_pmon_config(data, client, config);
>   		if (ret < 0) {
>   			dev_err(&client->dev, "Failed to enable VOUT/TEMP1 monitoring\n");
> @@ -535,7 +553,8 @@ static int adm1275_probe(struct i2c_client *client)
>   		return ret;
>   	}
>   	if ((ret != 3 || strncmp(block_buffer, "ADI", 3)) &&
> -	    (ret != 2 || strncmp(block_buffer, "SY", 2))) {
> +	    (ret != 2 || strncmp(block_buffer, "SY", 2)) &&
> +	    (ret != 4 || strncmp(block_buffer, "ROHM", 4))) {
>   		dev_err(&client->dev, "Unsupported Manufacturer ID\n");
>   		return -ENODEV;
>   	}
> @@ -562,7 +581,7 @@ static int adm1275_probe(struct i2c_client *client)
>   	if (mid->driver_data == adm1272 || mid->driver_data == adm1273 ||
>   	    mid->driver_data == adm1278 || mid->driver_data == adm1281 ||
>   	    mid->driver_data == adm1293 || mid->driver_data == adm1294 ||
> -	    mid->driver_data == sq24905c)
> +	    mid->driver_data == bd12780 || mid->driver_data == sq24905c)
>   		config_read_fn = i2c_smbus_read_word_data;
>   	else
>   		config_read_fn = i2c_smbus_read_byte_data;
> @@ -666,7 +685,8 @@ static int adm1275_probe(struct i2c_client *client)
>   			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
>   			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
>   
> -		ret = adm1275_enable_vout_temp(data, client, config);
> +		ret = adm1275_enable_vout_temp(data, client, config,
> +					       ADM1278_PMON_DEFCONFIG);
>   		if (ret)
>   			return ret;
>   
> @@ -712,7 +732,16 @@ static int adm1275_probe(struct i2c_client *client)
>   		break;
>   	case adm1278:
>   	case adm1281:
> +	case bd12780:
>   	case sq24905c:
> +	{
> +		u16 defconfig;
> +
> +		if (data->id == bd12780)
> +			defconfig = BD12780_PMON_DEFCONFIG;
> +		else
> +			defconfig = ADM1278_PMON_DEFCONFIG;
> +

Please add a separate case statement for the new chip
and do not overload existing chip data.

>   		data->have_vout = true;
>   		data->have_pin_max = true;
>   		data->have_temp_max = true;
> @@ -728,13 +757,14 @@ static int adm1275_probe(struct i2c_client *client)
>   			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
>   			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
>   
> -		ret = adm1275_enable_vout_temp(data, client, config);
> +		ret = adm1275_enable_vout_temp(data, client, config, defconfig);
>   		if (ret)
>   			return ret;
>   
>   		if (config & ADM1278_VIN_EN)
>   			info->func[0] |= PMBUS_HAVE_VIN;
>   		break;
> +	}
>   	case adm1293:
>   	case adm1294:
>   		data->have_iout_min = true;

