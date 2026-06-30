Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D9B3CF211
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 03:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782791012; cv=none; b=ENyrpQnSIbzLT9QhqWHzaP0Xh0voRX8pcjWbOt4ZAkXBmmiVhRDE4IqT2wyfbGR7kqBrTL0E6KSEhnIDk5N6psvdOzvBps8hfKD2KsV6T6sVvFLQbPhPLzkmAFHWB6FLYgfks1F8tYIQd9o+MkkB+i/zwpYzVA93X8wWdeW3fp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782791012; c=relaxed/simple;
	bh=7qZ7BD/kPdntbjx284SKm6xDphVUDw2P3Dj9RXsLrTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QSKj9FJknKtZI0Hl14nererf+ujj2lgEjJs76L0t1kCRRjCUI2kSH7WtEef/PyNbBsHoWXqO3BvMPtkSDWyU5X2d9AQxzcRXg5Ym2AsBUwNW6mN1vWZWnzpYcm5h5D/Jzd+9gM4IPSYIsENVfSCV/0xPtGdAFzmho1OAQLh3p6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mE7FxRQT; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mE7FxRQT"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c85d4b4245aso2370421a12.1
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 20:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782791010; x=1783395810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=RFyykPXnuU8lpZ43+6F/IaAIeDAQiIIJTgb29BGSmF4=;
        b=mE7FxRQTLBd/TqwRWjUCsk83vO3/THTKAIi22Y0r0vi19n4GuxQE1M4ejEk+ejkG0l
         B0BTFLOkD+KH0W2qOEgMBQEjwrqLuv2DE11qnj5FNnBwfCsxhXcMgKdNqqG78jnRNDTr
         ybLBwqlkYYGJnaoI+fs7LKT++UknGSAAO1Py0T7C7+/YlWk1EfTy1GvE0b+tb+QFuioo
         YDkOaUJdsfmw/RMqZaE5LFD6i7BOcxG3wHqXxu4FG4M6ELbkTqpOhRBdDX7leKNo5zb+
         OK5dGzsbI6QyeuRnr45hmWMRTX1oE1RJR0Zr4D8/CwH+88PRg3lXElbKiZzbJW0TzKns
         fojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782791010; x=1783395810;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RFyykPXnuU8lpZ43+6F/IaAIeDAQiIIJTgb29BGSmF4=;
        b=sWEr5s2YQflWUQVpxPPOwJMFzro47lt1CnXAqFcDdvGnaJuNWEoi+gUvFoo5n2lfgb
         AfNa98MsBdVmOi21BVMr3cgAt6rXkPQAV6fqqLtsHQGnaOKM3dLjj/AGEmo/pynfeZZy
         AG9z3Wui3JT1pg+ZNE8ewhNV0xZ8Dh0mTvpWC/uQmLzNG+464voiHFe/fyhFH5Z0V6cJ
         JYvkZgX+nnQ/2guZKHZE59+yNwvQ161dKEpezHDC8HwBjgOI3hszy0WPn1Osowx8m2WZ
         blM9uWUmToL8crGw6JJFQUJgzbrqiaT+fOi1ORugBNuNR2ORfph8sjSVGQLnOZBfWzmF
         lYFw==
X-Gm-Message-State: AOJu0YwmM9v4DdBZhgk0WzxztcLn0A2vNQUYdvtudOAS1yd2fFUTcII3
	GUB6X8h8ELBdMNMzLx2InvaW0ld51RvIf/0mtWq0RqRqEYNOMEyGma2J
X-Gm-Gg: AfdE7ckKn+IknOa75MXGckEtIA6v0iX67YuErW0jLq1r9EWuBETDCDQGkV7NIvEE3Iy
	PyJcKEWHhiltIkEXyD7p3SihuBXhOdrQHcnTXNVJB0fQXTgRUUvSFANuVWa556hXq0iT2jIF+EE
	+ylk3TVqhDB4/Yki/+J6yQ72w5nPJc2igtxPSKaNrazU4O4cqfjQPjXMGbKm16xxjXNw19EjEAh
	E4fQJ6tLm8eeHO/sYhYmm43dD1Ty38lLCoYrXT7zsDfi7eIlq4ottBAGgTgxyQWG50WeeH9WF6T
	l0bsEn0VlXa2sFtw6T0zpoG+OnKQre4BpA0+WC3LO2xvzF8P/ybkxTdUVkP3Cdh6gZMOPS5Z3S/
	Cn0pv1p7MTLsWe9VNgyO3MlfWwq7AVWjYn00QZ/VyfhtPk94Xq3XUCFVvfMJGNJ+nisTjhEkrpW
	s3bqcufiGPxbo1qxwZ0wdd+l80rmabP5XmjPbDAyv82fo4vPUeMuJJFuWLmjhJ6A==
X-Received: by 2002:a05:6a21:1506:b0:3bf:6c08:fb95 with SMTP id adf61e73a8af0-3bfc532ebbemr1804293637.55.1782791009663;
        Mon, 29 Jun 2026 20:43:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9bbf95be56sm678099a12.16.2026.06.29.20.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 20:43:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e5c7fcae-57aa-4461-987d-7f004d066873@roeck-us.net>
Date: Mon, 29 Jun 2026 20:43:26 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] hwmon: (pmbus/max20830): add support for max20830c
 and max20840c
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
 <20260630-dev-max20830c-v1-6-a02786bde470@analog.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260630-dev-max20830c-v1-6-a02786bde470@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/29/26 19:46, Alexis Czezar Torreno wrote:
> Add support for MAX20830C and MAX20840 step-down DC-DC switching
> regulator with PMBus interface. MAX20830C is a different packaging
> for MAX20830, and MAX20840C supports 40A regulation compared to
> MAX20830 that is only 30A.
> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> ---
>   Documentation/hwmon/max20830.rst | 27 +++++++++++++---
>   drivers/hwmon/pmbus/max20830.c   | 68 ++++++++++++++++++++++++++++------------
>   2 files changed, 70 insertions(+), 25 deletions(-)
> 
> diff --git a/Documentation/hwmon/max20830.rst b/Documentation/hwmon/max20830.rst
> index 936e409dcc5c0898dde27d782308d4a7e1357e73..b850f3b6e40d1f1d0cec944be40af02265aced59 100644
> --- a/Documentation/hwmon/max20830.rst
> +++ b/Documentation/hwmon/max20830.rst
> @@ -13,6 +13,22 @@ Supported chips:
>   
>       Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max20830.pdf
>   
> +  * Analog Devices MAX20830C
> +
> +    Prefix: 'max20830c'
> +
> +    Addresses scanned: -
> +
> +    Datasheet:
> +
> +  * Analog Devices MAX20840C
> +
> +    Prefix: 'max20840c'
> +
> +    Addresses scanned: -
> +
> +    Datasheet:
> +
>   Author:
>   
>     - Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> @@ -21,12 +37,13 @@ Author:
>   Description
>   -----------
>   
> -This driver supports hardware monitoring for Analog Devices MAX20830
> -Step-Down Switching Regulator with PMBus Interface.
> +This driver supports hardware monitoring for Analog Devices MAX20830, MAX20830C
> +and MAX20840C. These are Step-Down Switching Regulator with PMBus Interface.
>   
> -The MAX20830 is a 2.7V to 16V, 30A fully integrated step-down DC-DC switching
> -regulator. Through the PMBus interface, the device can monitor input/output
> -voltages, output current and temperature.
> +MAX20830, and MAX20830C are 2.7V to 16V, 30A fully integrated step-down DC-DC
> +switching regulators. MAX20840C is similar but can reach 40A. Through the PMBus
> +interface, these devices can monitor input/output voltages, output current and
> +temperature.
>   
>   The driver is a client driver to the core PMBus driver. Please see
>   Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
> diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max20830.c
> index a3abd24437e8e7560264aad55fc4f456d30ae235..252c77beb243c5a2d90fcf96941605ff31439383 100644
> --- a/drivers/hwmon/pmbus/max20830.c
> +++ b/drivers/hwmon/pmbus/max20830.c
> @@ -14,7 +14,30 @@
>   #include <linux/string.h>
>   #include "pmbus.h"
>   
> -#define MAX20830_IC_DEVICE_ID_LENGTH	9
> +struct max20830_chip_info {
> +	const char *id_str;
> +	u8 id_length;
> +};
> +
> +static const struct max20830_chip_info max20830_chip = {
> +	/*
> +	 * MAX20830 IC_DEVICE_ID has a byte length of 9 despite being an 8
> +	 * character string, as it includes a null terminator. The other
> +	 * devices do not include null.
> +	 */
> +	.id_str = "MAX20830\0",
> +	.id_length = 9,
> +};
> +
> +static const struct max20830_chip_info max20830c_chip = {
> +	.id_str = "MAX20830C",
> +	.id_length = 9,
> +};
> +
> +static const struct max20830_chip_info max20840c_chip = {
> +	.id_str = "MAX20840C",
> +	.id_length = 9,
> +};
>   
>   struct max20830_data {
>   	struct pmbus_driver_info info;
> @@ -60,11 +83,14 @@ static struct pmbus_driver_info max20830_info = {
>   
>   static int max20830_probe(struct i2c_client *client)
>   {
> +	const struct max20830_chip_info *chip;
>   	u8 buf[I2C_SMBUS_BLOCK_MAX + 1] = {};
>   	struct max20830_data *data;
>   	struct gpio_desc *enable_gpio;
>   	int ret;
>   
> +	chip = i2c_get_match_data(client);
> +
>   	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
>   	if (!data)
>   		return -ENOMEM;
> @@ -90,16 +116,14 @@ static int max20830_probe(struct i2c_client *client)
>   	 * which do not support SMBus block reads.
>   	 */
>   	if (i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_READ_BLOCK_DATA)) {
> -		/* Reads 9 Data bytes from MAX20830 */
>   		ret = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, buf);
>   		if (ret < 0)
>   			return dev_err_probe(&client->dev, ret,
>   					     "Failed to read IC_DEVICE_ID\n");
>   	} else {
> -		/* Reads 1 length byte + 9 Data bytes from MAX20830 */
> +		/* Reads 1 length byte + data bytes */
>   		ret = i2c_smbus_read_i2c_block_data(client, PMBUS_IC_DEVICE_ID,
> -						    MAX20830_IC_DEVICE_ID_LENGTH + 1,
> -						    buf);
> +						    chip->id_length + 1, buf);
>   		if (ret < 0)
>   			return dev_err_probe(&client->dev, ret,
>   					     "Failed to read IC_DEVICE_ID\n");
> @@ -108,36 +132,40 @@ static int max20830_probe(struct i2c_client *client)
>   		 * match the format of i2c_smbus_read_block_data().
>   		 * Also adjust return value to reflect length byte removal.
>   		 */
> -		memmove(buf, buf + 1, MAX20830_IC_DEVICE_ID_LENGTH);
> +		memmove(buf, buf + 1, chip->id_length);
>   		ret = ret - 1;
>   	}
>   
> -	/*
> -	 * MAX20830 IC_DEVICE_ID sends string data "MAX20830\0".
> -	 * Return value should at least be 9 bytes of data.
> -	 */
> -	if (ret < MAX20830_IC_DEVICE_ID_LENGTH)
> +	/* Verify we read the expected number of bytes */
> +	if (ret < chip->id_length)
>   		return dev_err_probe(&client->dev, -ENODEV,
> -				     "IC_DEVICE_ID too short: expected at least 9 bytes, got %d\n",
> -				     ret);
> +				     "IC_DEVICE_ID too short: expected %d bytes, got %d\n",
> +				     chip->id_length, ret);
> +
> +	/* Null-terminate the string */
> +	buf[chip->id_length] = '\0';
>   
> -	/* 9 bytes of data, buf[0]-buf[7] = "MAX20830", buf[8] = '\0' */
> -	buf[MAX20830_IC_DEVICE_ID_LENGTH - 1] = '\0';
> -	if (strncmp(buf, "MAX20830", MAX20830_IC_DEVICE_ID_LENGTH - 1))
> +	/* Verify the device ID matches what we expect */
> +	if (strncmp(buf, chip->id_str, chip->id_length))
>   		return dev_err_probe(&client->dev, -ENODEV,
> -				     "Unsupported device: '%s'\n", buf);
> +				     "Device mismatch: expected '%s', got '%s'\n",
> +				     chip->id_str, buf);
>   
> -	return pmbus_do_probe(client, &max20830_info);
> +	return pmbus_do_probe(client, &data->info);
>   }
>   
>   static const struct i2c_device_id max20830_id[] = {
> -	{"max20830"},
> +	{ "max20830", (kernel_ulong_t)&max20830_chip },
> +	{ "max20830c", (kernel_ulong_t)&max20830c_chip },
> +	{ "max20840c", (kernel_ulong_t)&max20840c_chip },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(i2c, max20830_id);
>   
>   static const struct of_device_id max20830_of_match[] = {
> -	{ .compatible = "adi,max20830" },
> +	{ .compatible = "adi,max20830", .data = &max20830_chip },
> +	{ .compatible = "adi,max20830c", .data = &max20830c_chip },
> +	{ .compatible = "adi,max20840c", .data = &max20840c_chip },

"adi,max20830" is a fallback for the other two chips, but that
is not how the code is implemented.

Guenter

>   	{ }
>   };
>   MODULE_DEVICE_TABLE(of, max20830_of_match);
> 

