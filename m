Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73BE364926
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 04:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785211879; cv=none; b=RVDaPLZl2St7fZ/qa2Nr6ynPpvMt3B0uJWaHZoJHgtD3dZ36WXu4D2uYaPz8uYJeKffqjP4rDmIw5cnrEvtPo5fgXWHOF0k38QMOS9dWFgayUVetXg8RgyjOB9SytvXxAwNQoH3x2/oWLXRsN+ThgTRM07uhBt1E/WZPXxonZL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785211879; c=relaxed/simple;
	bh=rzHSSUxKw4BlJul30nuAk87yQXFGdgckT1MJA42S4SI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HWaa9tx79lC0rSs5w3ogHj1oJlUqGgtfyYMfbuZjZwluoyD2UWtNOhWr9g3YLz4cHV6oMdLfV/RQ8vRQbtiHXnX9zGv8dHqTo+RZld7OWghQng1d9iDvoEiS+wmL19YH18wgIxIKElntQzRynL15qSzcGIervgzKiMM1vRXtNaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGqTHsj9; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGqTHsj9"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8423f236418so2596321b3a.1
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 21:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785211876; x=1785816676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iTBGyr7mBmgTBTF3mSoHRHnNBWWZbdw9RY2sNeblvzE=;
        b=KGqTHsj9zEkEn4mhIBgoO8vah2XojKYxmH3XY8QvvztLFEc3VRMB1yph1535aoAEMs
         OrVDvjl/7DiIRAzJPH08joqyu47c2pwmEcgbLwD0Oa5zxO5tBsU47jOWVbcmPCsa+HzU
         tHG4WJUeM31XtN9meT1fHL+0GX+LPd0NCR/TENXKvpMQqkU+9/sWYNyllKtb4vH7eV0I
         7L7aE46ZZuu2xhw4Z9Kc2/6y5jhhcSc99A5kO2ElwEAa77CH9PXYK2EtH5t6aPtWA1/w
         exV/v610anRl4AAo8fjnXh5tt50cuXkRRXYFizd0KufhoL7ZGDoXuiY+UL34hB0xlP8E
         yxjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785211876; x=1785816676;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iTBGyr7mBmgTBTF3mSoHRHnNBWWZbdw9RY2sNeblvzE=;
        b=NO1FDPLyIkxgf1v49DZ186DWof3xRbNwuBPKZJ3N/NQGwO/A1nheycFgt5xx1R2gpm
         YrLWluSD1KaImAVYtuQz5aQDJ5zzZEUCH+vqas3HemnEXT4i4h8XNMuXnIaN/z41TKvq
         UU8/oHrtuchKec760vi+twww8fDHuRfMYPPUMWCp4lbTbElUC4KiyR92arRAAz4LflAs
         m8kIlWQvukfyCAaR1TSa+Qfpp2Ei2gyGo0XvJkY+rf+t88gCC12N91S3uiteErOpLK28
         QipT0Z4pxdSbWJGoMyUSB2Yy/R7fYIN5uJytTIyTAKgw7+iqGHexpYDed5mJUu926rVq
         y/2Q==
X-Gm-Message-State: AOJu0Yy2v1MMlb6QY2g0njBd2vHFdgz43+2sTGz2CRwE3y/hmxQoaApf
	nUdA/q6BeLdSl4PxQPvbPhl/57RMWNkt/dvtVecwSuZ+G3wCjv3WDb7s
X-Gm-Gg: AR+sD12QNDCF7lY4Z4rjVsa74Q1R9F69cUs0axITKkexxnDNbI5MC+IY4Kqa7/0znFc
	ev1THkHHB8EV+AX/2fO/F6ViEvRJpB9eXMWuVxaxQUebKqo9GV7aKCYx36XXOWX0+5aI0q20Gzf
	NmVPWrIy9fQK3IyPXuc9zmUj79IHJT38eom7SK72m4c+1Y8MY3DolFIMKK+R+uWBMXjo72oL6n8
	PUJs1bTHUrmcOSf+bqTCzC3cQvB+pQ5Lyc+1bXnBTIJp7/lN38IAN+aw0WKBGxX4l+oRmoZqKJm
	xs0i01qJZYgk4PkLTqrqab7RU+Mugy1Qznj/7oVi2iHUGnS+FUZUlbOb6CKoakjiUeZTtB7cg/I
	ATl7Z1RJl/HO+miJHWQoO8QJ8uDmberO2zh6vr4LPADs7xTcZVdR181FmYLsy51BFPZG3rgm82p
	i1cKvXVuuhuoVCkbN71lH0Kbq76ttVzkHSdDU/3NzEB1kbrlXDorM=
X-Received: by 2002:a05:6a00:f0c:b0:848:727f:2c8d with SMTP id d2e1a72fcca58-84e93313298mr692501b3a.77.1785211875939;
        Mon, 27 Jul 2026 21:11:15 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e532acee2sm3757774b3a.27.2026.07.27.21.11.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 21:11:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ca4f288b-7bdf-483f-babb-b5f948a27198@roeck-us.net>
Date: Mon, 27 Jul 2026 21:11:13 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] hwmon: (pmbus/tps25990): Add TPS1689 support
To: Stoyan Bogdanov <sbogdanov@baylibre.com>, jbrunet@baylibre.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260728015857.193890-1-sbogdanov@baylibre.com>
 <20260728015857.193890-4-sbogdanov@baylibre.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260728015857.193890-4-sbogdanov@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/27/26 18:58, Stoyan Bogdanov wrote:
> Extend the existing TPS25990 driver to support the TPS1689 eFuse,
> as both devices share the same command interface and functionality.
> 
> Update the documentation to include TPS1689 support.
> 
> Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
> ---
>   Documentation/hwmon/tps25990.rst | 15 +++--
>   drivers/hwmon/pmbus/tps25990.c   | 98 ++++++++++++++++++++++++++------
>   2 files changed, 92 insertions(+), 21 deletions(-)
> 
> diff --git a/Documentation/hwmon/tps25990.rst b/Documentation/hwmon/tps25990.rst
> index 04faec780d26..e8bc9a550bda 100644
> --- a/Documentation/hwmon/tps25990.rst
> +++ b/Documentation/hwmon/tps25990.rst
> @@ -9,26 +9,31 @@ Supported chips:
>   
>       Prefix: 'tps25990'
>   
> -  * Datasheet
> +    Datasheet: Publicly available at Texas Instruments website: https://www.ti.com/lit/gpn/tps25990
>   
> -    Publicly available at Texas Instruments website: https://www.ti.com/lit/gpn/tps25990
> +  * TI TPS1689
> +
> +    Prefix: 'tps1689'
> +
> +    Datasheet: Publicly available at Texas Instruments website: https://www.ti.com/lit/gpn/tps1689
>   
>   Author:
>   
>   	Jerome Brunet <jbrunet@baylibre.com>
> +	Stoyan Bogdanov <sbogdanov@baylibre.com>
>   
>   Description
>   -----------
>   
> -This driver implements support for TI TPS25990 eFuse.
> +This driver implements support for TI TPS25990 and TI TPS1689 eFuse chips.
>   This is an integrated, high-current circuit protection and power
>   management device with PMBUS interface
>   
> -Device compliant with:
> +Devices are compliant with:
>   
>   - PMBus rev 1.3 interface.
>   
> -Device supports direct format for reading input voltages,
> +Devices supports direct format for reading input voltages,
>   output voltage, input current, input power and temperature.
>   
>   Due to the specificities of the chip, all history reset attributes
> diff --git a/drivers/hwmon/pmbus/tps25990.c b/drivers/hwmon/pmbus/tps25990.c
> index 490dcd2a5fa5..7e2991a85da1 100644
> --- a/drivers/hwmon/pmbus/tps25990.c
> +++ b/drivers/hwmon/pmbus/tps25990.c
> @@ -48,6 +48,7 @@
>   					 PK_MIN_AVG_RST_MIN)
>   
>   enum chips {
> +	tps1689,
>   	tps25990,
>   };
>   
> @@ -105,6 +106,8 @@ static int tps25990_mfr_write_protect_get(struct i2c_client *client)
>   static int tps25990_read_word_data(struct i2c_client *client,
>   				   int page, int phase, int reg)
>   {
> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +	struct tps25990_data *data = container_of(info, struct tps25990_data, info);
>   	int ret;
>   
>   	switch (reg) {
> @@ -193,9 +196,11 @@ static int tps25990_read_word_data(struct i2c_client *client,
>   		ret = pmbus_read_word_data(client, page, phase, reg);
>   		if (ret < 0)
>   			break;
> -		ret = DIV_ROUND_CLOSEST(ret * TPS25990_VIN_OVF_NUM,
> -					TPS25990_VIN_OVF_DIV);
> -		ret += TPS25990_VIN_OVF_OFF;
> +		if (data->chip_id == tps25990) {
> +			ret = DIV_ROUND_CLOSEST(ret * TPS25990_VIN_OVF_NUM,
> +						TPS25990_VIN_OVF_DIV);
> +			ret += TPS25990_VIN_OVF_OFF;
> +		}

Unless I am missing something, TPS1689 also has a voltage offset for this register.

>   		break;
>   
>   	case PMBUS_IIN_OC_FAULT_LIMIT:
> @@ -207,9 +212,11 @@ static int tps25990_read_word_data(struct i2c_client *client,
>   		ret = pmbus_read_byte_data(client, page, TPS25990_VIREF);
>   		if (ret < 0)
>   			break;
> -		ret = DIV_ROUND_CLOSEST(ret * TPS25990_IIN_OCF_NUM,
> -					TPS25990_IIN_OCF_DIV);
> -		ret += TPS25990_IIN_OCF_OFF;
> +		if (data->chip_id == tps25990) {
> +			ret = DIV_ROUND_CLOSEST(ret * TPS25990_IIN_OCF_NUM,
> +						TPS25990_IIN_OCF_DIV);
> +			ret += TPS25990_IIN_OCF_OFF;
> +		}

Looking at the datasheet, I see no difference regarding TPS25990_VIREF
and its use across the two chips. Also, it does not make sense to me to pass
the value of TPS25990_VIREF directoy as OC fault limit. Unless I am missing
something, I don't think this works as intended.

>   		break;
>   
>   	case PMBUS_VIRT_SAMPLES:
> @@ -238,6 +245,8 @@ static int tps25990_read_word_data(struct i2c_client *client,
>   static int tps25990_write_word_data(struct i2c_client *client,
>   				    int page, int reg, u16 value)
>   {
> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +	struct tps25990_data *data = container_of(info, struct tps25990_data, info);
>   	int ret;
>   
>   	switch (reg) {
> @@ -253,20 +262,23 @@ static int tps25990_write_word_data(struct i2c_client *client,
>   		value = clamp_val(value, 0, 0xff);
>   		ret = pmbus_write_word_data(client, page, reg, value);
>   		break;
> -
>   	case PMBUS_VIN_OV_FAULT_LIMIT:
> -		value -= TPS25990_VIN_OVF_OFF;
> -		value = DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_VIN_OVF_DIV,
> -					  TPS25990_VIN_OVF_NUM);
> -		value = clamp_val(value, 0, 0xf);
> +		if (data->chip_id == tps25990) {
> +			value -= TPS25990_VIN_OVF_OFF;
> +			value = DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_VIN_OVF_DIV,
> +						  TPS25990_VIN_OVF_NUM);
> +			value = clamp_val(value, 0, 0xf);
> +		}

As pointed out by Sashiko, a clamp is still needed here. Also, again,
according to the datasheet there is still a voltage offset.

>   		ret = pmbus_write_word_data(client, page, reg, value);
>   		break;
>   
>   	case PMBUS_IIN_OC_FAULT_LIMIT:
> -		value -= TPS25990_IIN_OCF_OFF;
> -		value = DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_IIN_OCF_DIV,
> -					  TPS25990_IIN_OCF_NUM);
> -		value = clamp_val(value, 0, 0x3f);
> +		if (data->chip_id == tps25990) {
> +			value -= TPS25990_IIN_OCF_OFF;
> +			value = DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_IIN_OCF_DIV,
> +						  TPS25990_IIN_OCF_NUM);
> +			value = clamp_val(value, 0, 0x3f);
> +		}

Again, per datasheets, there does not appear to be a difference between
the two chips regarding TPS25990_VIREF.
>   		ret = pmbus_write_byte_data(client, page, TPS25990_VIREF, value);
>   		break;
>   
> @@ -347,6 +359,59 @@ static const struct regulator_desc tps25990_reg_desc[] = {
>   #endif
>   
>   static struct pmbus_driver_info tps25990_base_info[] = {
> +	[tps1689] = {
> +		.pages = 1,
> +		.format[PSC_VOLTAGE_IN] = direct,
> +		.m[PSC_VOLTAGE_IN] = 1166,
> +		.b[PSC_VOLTAGE_IN] = 0,
> +		.R[PSC_VOLTAGE_IN] = -2,
> +		.format[PSC_VOLTAGE_OUT] = direct,
> +		.m[PSC_VOLTAGE_OUT] = 1166,
> +		.b[PSC_VOLTAGE_OUT] = 0,
> +		.R[PSC_VOLTAGE_OUT] = -2,
> +		.format[PSC_TEMPERATURE] = direct,
> +		.m[PSC_TEMPERATURE] = 140,
> +		.b[PSC_TEMPERATURE] = 32103,
> +		.R[PSC_TEMPERATURE] = -2,
> +		/*
> +		 * Current and Power measurement depends on the ohm value
> +		 * of Rimon. m is multiplied by 1000 below to have an integer
> +		 * and -3 is added to R to compensate.
> +		 */
> +		.format[PSC_CURRENT_IN] = direct,
> +		.m[PSC_CURRENT_IN] = 9548,
> +		.b[PSC_CURRENT_IN] = 0,
> +		.R[PSC_CURRENT_IN] = -6,
> +		.format[PSC_CURRENT_OUT] = direct,
> +		.m[PSC_CURRENT_OUT] = 24347,
> +		.b[PSC_CURRENT_OUT] = 0,
> +		.R[PSC_CURRENT_OUT] = -3,
> +		.format[PSC_POWER] = direct,
> +		.m[PSC_POWER] = 2775,
> +		.b[PSC_POWER] = 0,
> +		.R[PSC_POWER] = -4,
> +		.func[0] = (PMBUS_HAVE_VIN |
> +			    PMBUS_HAVE_VOUT |
> +			    PMBUS_HAVE_VMON |
> +			    PMBUS_HAVE_IIN |
> +			    PMBUS_HAVE_PIN |
> +			    PMBUS_HAVE_TEMP |
> +			    PMBUS_HAVE_STATUS_VOUT |
> +			    PMBUS_HAVE_STATUS_IOUT |
> +			    PMBUS_HAVE_STATUS_INPUT |
> +			    PMBUS_HAVE_STATUS_TEMP |
> +			    PMBUS_HAVE_SAMPLES),
> +
> +		.read_word_data = tps25990_read_word_data,
> +		.write_word_data = tps25990_write_word_data,
> +		.read_byte_data = tps25990_read_byte_data,
> +		.write_byte_data = tps25990_write_byte_data,
> +
> +#if IS_ENABLED(CONFIG_SENSORS_TPS25990_REGULATOR)
> +		.reg_desc = tps25990_reg_desc,
> +		.num_regulators = ARRAY_SIZE(tps25990_reg_desc),
> +#endif
> +		},
>   	[tps25990] = {
>   		.pages = 1,
>   		.format[PSC_VOLTAGE_IN] = direct,
> @@ -389,7 +454,6 @@ static struct pmbus_driver_info tps25990_base_info[] = {
>   		.write_word_data = tps25990_write_word_data,
>   		.read_byte_data = tps25990_read_byte_data,
>   		.write_byte_data = tps25990_write_byte_data,
> -
>   #if IS_ENABLED(CONFIG_SENSORS_TPS25990_REGULATOR)
>   		.reg_desc = tps25990_reg_desc,
>   		.num_regulators = ARRAY_SIZE(tps25990_reg_desc),
> @@ -398,12 +462,14 @@ static struct pmbus_driver_info tps25990_base_info[] = {
>   };
>   
>   static const struct i2c_device_id tps25990_i2c_id[] = {
> +	{ "tps1689", tps1689 },
>   	{ "tps25990", tps25990 },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(i2c, tps25990_i2c_id);
>   
>   static const struct of_device_id tps25990_of_match[] = {
> +	{ .compatible = "ti,tps1689", .data = (void *)tps1689 },
>   	{ .compatible = "ti,tps25990", .data = (void *)tps25990 },
>   	{}
>   };

