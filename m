Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F28E2E7F3E
	for <linux-hwmon@vger.kernel.org>; Sun, 29 Mar 2026 14:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774795977; cv=none; b=Si+C+5DiCErW0A0EeqZODlYftSyQVy+yMdyKzjr10TvBz0e+2gAiPfUzLbMVhVX7/l5D3Qg9nv5ZOfP4Ex3R4Attkas69j1ZIZQcdr5CQhXVvZISTiKHXQX5UHu+TKAyOg6d7clIw6nPxvw2EttyejkekHEOIzPPyTHNirOc8oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774795977; c=relaxed/simple;
	bh=31DFWSp7tZHbBt6gshIUjUpW53zyl0a2dyGe83RpvcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BXGNVigvjIGxI842TlM2bBTLFCKYEzbbgPNx7gymBL//PR6zwx19BBFGjcIUivagJ9qnaFmcrlgaoxHaBvFfebAbWhi8eAEa7WBxuf2xW9VXEHPq2hIpto0ZoLT0aihLRFicWS7fdXDQgtSOvE0t54xvkgEJEq4e/QsKNVF68mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kVkfI23a; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kVkfI23a"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2c56aa62931so40748eec.0
        for <linux-hwmon@vger.kernel.org>; Sun, 29 Mar 2026 07:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774795975; x=1775400775; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=lRHwvAXzq8uNGWq6fSfV5Lw59HHClk7FJM22dlAFP2w=;
        b=kVkfI23a7dpHxIj7GEyWB9N92uJUW6jIjOSScxc1J16jS77m+LrJwcZ/wZFlEa5MJU
         JDXE3jg2qeUajuGks0ntqqRNwUwR+uvCrUUuSd7I9Wa14PHZZrG6JLHXg9gWLr0mItPx
         xS8xCqGjvNPEzdVbJjV80UFubAdwVQMxITQGyx6jZ+YbSFbIIhg8f5V+G1k3kmn0vzlv
         Z7qHspjCOgYqolyp8kwsMkZd7AxOBNzceaRmIrNbVI8FceWenvMQg401V8PEUnMCKYqc
         IEkqEZo8q/T7CcFKK1MqvU0K8hM3bhNbVz2vau6P8EQFT5Zzn75gN1DkwhNAcv7aqcd9
         qiZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774795975; x=1775400775;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lRHwvAXzq8uNGWq6fSfV5Lw59HHClk7FJM22dlAFP2w=;
        b=ZCAvzBrZz5PZeCLEUmSmy9QtMZyax7aOFn1ntDScea+Zp/2J4zgyZpt0xIZnF/vfWX
         jw7M9+HTXEqrA+5UgB7Eh+ZZVTjMPgUPk/4AHaKc84JtFOTNgKj50YeN5+5OcbroEnOw
         2ThgKwo7LLlatCqIZ8ZDrgQ1g/6G3UFd8sjcFP+GZ1tGkaCZigiEziqHAHO2HG0SzHhU
         DOWgu9TfpD3AnESXLIAQkntxPsDLl3Xfglt146DUKDKaqEqe4mUAt0adDahtDKyYCZta
         xBWpIWL5Wl6Uy5P8BpfTyDatsEVykSlIKkBaHalSTADmH+J8RFbe5r9m7ELfrM/fCX6e
         Uu3A==
X-Gm-Message-State: AOJu0Yz7KEo4UlIjAePXP/8kpSLr7cDy4PZcMAAn/oVlDPSFeA9Z9VPc
	a1VC0w/MYPJkC51NsAOhgFd1pKMoyPHBFFb7yuhioBXxBG43yRy5lVFU
X-Gm-Gg: ATEYQzw1EmoPvtz3COCOsfxfAxH1iuZE4VJRVUTIPUqjpBC8j0Fvj4GgSIR+xNFzipf
	YvrvuKjIE/OSqQt0SR/qCkyBM8VQOryZsBFe0Byi5WI1gBluTEKSFJekYWieTDK2LRmMxGOPo92
	lD9RkACqVHiReu0q66YJ3D79N3yoi6PLuN+zjnlZv2R3U2cys3rYpvItalcO58Q/S1JdqWjm10M
	yLIltIqExiCeavgPYcf69RB3XLaB4F8B1l/4JP52R4A2aU+XeZ176yg5wacnf93ozFj7pq2EemB
	cJpif5LjCkexaFBBVpBlvY2t+w/sP3csPxdEdDmqhV1Hw3VZu6oM686u7X25RB0pT5yNtYB+LX/
	8hJ0aSVATBWSgdkpfdPL0+K6LuA0dPDL+rA6OGPBZOmK/50vAetgP9PO+FoL/ckAEc38uNn+Jgt
	aBPfzoW74VzClrlDWQ7XsMuyE4glimwOmntSvUpdQdvI9GuqVVMPelXW9vWF9MX8xTUzDsqcFf
X-Received: by 2002:a05:7300:7491:b0:2c4:7bb:5c94 with SMTP id 5a478bee46e88-2c407bb60ebmr2492209eec.11.1774795975019;
        Sun, 29 Mar 2026 07:52:55 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c68b249fsm4627370eec.19.2026.03.29.07.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 07:52:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d8e615e0-a569-4ecc-92a9-918997bc7f34@roeck-us.net>
Date: Sun, 29 Mar 2026 07:52:53 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hwmon: (ads7871) Use DMA-safe buffer for SPI
 writes
To: Tabrez Ahmed <tabreztalks@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 shuah@kernel.org, me@brighamcampbell.com
References: <20260329073352.270451-1-tabreztalks@gmail.com>
 <20260329073352.270451-3-tabreztalks@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260329073352.270451-3-tabreztalks@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/29/26 00:33, Tabrez Ahmed wrote:
> The driver currently passes a stack-allocated buffer to spi_write(),
> which is incompatible with DMA on systems with CONFIG_VMAP_STACK
> enabled.
> 
> Move the transfer buffer into the driver's private data structure
> to ensure it is DMA-safe. Since this shared buffer now requires
> serialization, this change depends on the previous commit which
> migrated the driver to the hwmon 'with_info' API.
> 
> While moving the logic, also:
> - Corrected the sign extension for 14-bit data by casting to s16.
> - Scaled the output to millivolts (2500mV full scale
> ) to comply with the hwmon ABI.
> 
> Signed-off-by: Tabrez Ahmed <tabreztalks@gmail.com>
> ---
>   drivers/hwmon/ads7871.c | 36 ++++++++++++++++++++++--------------
>   1 file changed, 22 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/hwmon/ads7871.c b/drivers/hwmon/ads7871.c
> index 41a1e9bbd4050..cd58c960690f1 100644
> --- a/drivers/hwmon/ads7871.c
> +++ b/drivers/hwmon/ads7871.c
> @@ -63,6 +63,7 @@
>   
>   struct ads7871_data {
>   	struct spi_device *spi;
> +	u8 tx_buf[2] ____cacheline_aligned;
>   };
>   static umode_t ads7871_is_visible(const void *data,
>   				  enum hwmon_sensor_types type,
> @@ -78,6 +79,7 @@ static int ads7871_read_reg8(struct spi_device *spi, int reg)
>   {
>   	int ret;
>   
> +

Please no whitespace changes. Also, please run checkpatch.pl --strict on your patches, since that
would have reported the resulting formatting violation:

CHECK: Please don't use multiple blank lines
#137: FILE: drivers/hwmon/ads7871.c:82:

+

>   	reg = reg | INST_READ_BM;
>   	ret = spi_w8r8(spi, reg);
>   	return ret;
> @@ -92,11 +94,12 @@ static int ads7871_read_reg16(struct spi_device *spi, int reg)
>   	return ret;
>   }
>   
> -static int ads7871_write_reg8(struct spi_device *spi, int reg, u8 val)
> +static int ads7871_write_reg8(struct ads7871_data *pdata, int reg, u8 val)
>   {
> -	u8 tmp[2] = {reg, val};
> +	pdata->tx_buf[0] = reg;
> +	pdata->tx_buf[1] = val;
>   
> -	return spi_write(spi, tmp, sizeof(tmp));
> +	return spi_write(pdata->spi, pdata->tx_buf, 2);
>   }
>   
>   static int ads7871_read(struct device *dev, enum hwmon_sensor_types type,
> @@ -115,7 +118,7 @@ static int ads7871_read(struct device *dev, enum hwmon_sensor_types type,
>   	 */
>   	/*MUX_M3_BM forces single ended*/
>   	/*This is also where the gain of the PGA would be set*/
> -	ret = ads7871_write_reg8(spi, REG_GAIN_MUX,
> +	ret = ads7871_write_reg8(pdata, REG_GAIN_MUX,
>   				 (MUX_CNV_BM | MUX_M3_BM | channel));
>   	if (ret < 0)
>   		return ret;
> @@ -123,6 +126,7 @@ static int ads7871_read(struct device *dev, enum hwmon_sensor_types type,
>   	ret = ads7871_read_reg8(spi, REG_GAIN_MUX);
>   	if (ret < 0)
>   		return ret;
> +

Another whitespace change. Again, please refrain from making such changes.

Thanks,
Guenter

>   	mux_cnv = ((ret & MUX_CNV_BM) >> MUX_CNV_BV);
>   	/*
>   	 * on 400MHz arm9 platform the conversion
> @@ -142,8 +146,11 @@ static int ads7871_read(struct device *dev, enum hwmon_sensor_types type,
>   		if (raw_val < 0)
>   			return raw_val;
>   
> -		/*result in volts*10000 = (val/8192)*2.5*10000*/
> -		*val = ((raw_val >> 2) * 25000) / 8192;
> +		/*
> +		 * Use (s16) to ensure the sign bit is preserved during the shift.
> +		 * Report millivolts (2.5V = 2500mV).
> +		 */
> +		*val = ((s16)raw_val >> 2) * 2500 / 8192;
>   		return 0;
>   	}
>   
> @@ -180,11 +187,17 @@ static int ads7871_probe(struct spi_device *spi)
>   	spi->bits_per_word = 8;
>   	spi_setup(spi);
>   
> -	ads7871_write_reg8(spi, REG_SER_CONTROL, 0);
> -	ads7871_write_reg8(spi, REG_AD_CONTROL, 0);
> +	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
> +	if (!pdata)
> +		return -ENOMEM;
> +
> +	pdata->spi = spi;
> +
> +	ads7871_write_reg8(pdata, REG_SER_CONTROL, 0);
> +	ads7871_write_reg8(pdata, REG_AD_CONTROL, 0);
>   
>   	val = (OSC_OSCR_BM | OSC_OSCE_BM | OSC_REFE_BM | OSC_BUFE_BM);
> -	ads7871_write_reg8(spi, REG_OSC_CONTROL, val);
> +	ads7871_write_reg8(pdata, REG_OSC_CONTROL, val);
>   	ret = ads7871_read_reg8(spi, REG_OSC_CONTROL);
>   
>   	dev_dbg(dev, "REG_OSC_CONTROL write:%x, read:%x\n", val, ret);
> @@ -195,11 +208,6 @@ static int ads7871_probe(struct spi_device *spi)
>   	if (val != ret)
>   		return -ENODEV;
>   
> -	pdata = devm_kzalloc(dev, sizeof(struct ads7871_data), GFP_KERNEL);
> -	if (!pdata)
> -		return -ENOMEM;
> -
> -	pdata->spi = spi;
>   	hwmon_dev = devm_hwmon_device_register_with_info(dev, spi->modalias,
>   							 pdata,
>   							 &ads7871_chip_info,

