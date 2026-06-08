Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0A7317176
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Jun 2026 02:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780886360; cv=none; b=mowBDSZv1GurZtEfvcJaYTI3tUMbUx0NRnGj7Dxi2++XnT63pKdFOLQXvV+sDyN+nKF6/QnZ+jiIRdC71lAyZBcFMzq8xHSz1zIPA3OM1CjjozixQA6aJW+jLb95d+kxJiLAXKBqQzyu4YTCGG65A1Th5TKaTZTTeOLKcxCrONU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780886360; c=relaxed/simple;
	bh=lrg3BfU0Dfd2KrphFHdGyamOqLlZn8UGWEQr3pMFwwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s0CUDJIVxDLDX/7mO60BIHycXOYj8oMQIclqomMvCcoUVKjgKiWgBwI97hOS7seT3Og2bcaGq6pbFTQOFmtbvkQ8noWgAB2OpUCna50Ejiv9kb54pUro+VJmh258mlbWizUdbgpQaDTmASkYJRqT0Uvc2JuzFd0FmMXlpYKcaHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M4hmWh5f; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4hmWh5f"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-36b9d265355so2062431a91.2
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Jun 2026 19:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780886358; x=1781491158; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YfFgN+bmnzJQ2v84ituwVsdrEhxj4WXz21z/Ki18mKI=;
        b=M4hmWh5fvMRXRXwJ8nNLaQFJmOiJdZlgPPldh2R+jAZB6jU9iaKdS0xVVehoxTpHZJ
         /GrmdqEjJWH25DW2q2RDzwrfjxb2Ac0O5yCfCWenfCCRDtjiLgLGELCTiHuei+3WfrNk
         bqmIg1QPplkL/m3o354XABlTxfI+GZ7sYAYmxeJRfjjrPlbxI1t9jLnCnfUiVsIiCIzr
         sBa9b3W7Gl54ZXVooX1qTc7BLOyxGIvHlTv2tClVzxZDt8M8OFB5xBUb/osrwAAlEOCL
         ukjtzaKe4haXfLVW0J0bqRgfhWNdRCanx916U1j0Qff/w7RBcB1MYhDAxD+yHbAZHnAU
         kRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780886358; x=1781491158;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YfFgN+bmnzJQ2v84ituwVsdrEhxj4WXz21z/Ki18mKI=;
        b=c1fDW7Nfo/Av9uqO49bC7vwj1c9NV/7Xn27WQTKNFRhNtCK40qPVaZ7n9B+9cl5GV8
         pxlnCt33PRkh3iVSztDE8kEMJIClth2qucqS1xuIsBoqPMNa9fgQlEvpNp71v8g9HYJC
         TDKotDJp8QaYAboz575PPeg7TrHdvl2QYU7GjXURR2stnLOBcoKJzOZiYxoxkkThoe/3
         uZhYP/XuVVWaxbxrGi/1l4KSfCKC1oey2gXFY2plGSPEDcTiAeF/dv+8TY43WWK2aOL8
         VsRE+cZnYwATTgAQct6HBWt5IsouTEO43ahLt4mT11WcWJ1kVTIf+RqHLkJaKkPk/c29
         mWNQ==
X-Forwarded-Encrypted: i=1; AFNElJ+rBO87TAfwcJ7ZWfRPKXWjZgpAktDSRIu+1jmNHQFVdE3x6x0+0bc9GyxlaoSbYI0gaM12AmMPulTe+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7OLOoqZgEWikQxzi5pdd2XVUo/E9kYOC4SJjdbAUXHb50zaqK
	JAVVpkvs+pstJA/DtkEKayj0t+4bjMs4KadZ7ET6M6NuDNK+zFHESwzE
X-Gm-Gg: Acq92OF/L22gLo746V8Xh+wDRqTYJY1EcLlguG5sCD+1ZWX7pX6FhUV5ok8E8bjwdiF
	9Iw6X4bp+up1iujuNCqzicTwLlRr5yLwWd/4jh7R03JfG40IIASo/QSOyVvjw/Hc4JMylrdewlo
	h7t8ZuAQFmkSKlXUwl3yjAMJiKqNTCKvInK5DQOGWhxMnvTLWiGy1X7GpuU4Nt0PSo8RxvRbrhE
	sRBcmYuQICZz5uDIY3m0219bmmd+XpUPYbBmnTClYL4GuQrp4tkVBZOZE9L1Huvm0PkmoAtJWIj
	JQt7IVUFhJ2ONVobOCQ+dO5xR549cnJAdC5wYBUNCx6sTfJJ0EWG4NhARVm+qhKwX+JxQOyWC8Y
	+ZFQtgS5eFu6tdYdElwDj/NG4p7ovvS+gGMyuyZKQRaKq/G2MeUPFhI1fg2isDakSQGhgLyJh8P
	fqDGHje8ir+utXvlgnrlHO5kyHDf3Iu+XWmMTqDlNPeMuDHMezDEZ2QJBjtQ==
X-Received: by 2002:a17:90b:3a44:b0:369:971:4888 with SMTP id 98e67ed59e1d1-370f057ac30mr12499905a91.15.1780886357991;
        Sun, 07 Jun 2026 19:39:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f711e52b0sm14248048a91.15.2026.06.07.19.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 19:39:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 7 Jun 2026 19:39:16 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: ASHISH YADAV <ashishyadav78@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: Re: [PATCH v3 2/2] hwmon:(pmbus/xdp720) Add support for efuse xdp730
Message-ID: <bf947dcd-2028-4dfd-a007-c4f39d2b7649@roeck-us.net>
References: <20260601090925.3781-1-Ashish.Yadav@infineon.com>
 <20260601090925.3781-3-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601090925.3781-3-Ashish.Yadav@infineon.com>

On Mon, Jun 01, 2026 at 02:39:25PM +0530, ASHISH YADAV wrote:
> From: Ashish Yadav <ashish.yadav@infineon.com>
> 
> Adds support for the Infineon XDP730 Digital eFuse Controller by
> updating the existing XDP720 driver.
> 
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
> ---
> XDP720/XDP730 Digital eFuse Controllers provides accurate system telemetry
> (V, I, P, T) and reports analog current at the IMON pin for post-processing.
> 
> Both parts share the same PMBus register map and direct-format
> coefficients; they differ in the GIMON gain step exposed via the
> TELEMETRY_AVG register (bit 10) and in the VDD_VIN pin number
> (XDP720: pin 9, XDP730: pin 20).
> 
> The Current and Power measurement depends on the RIMON and GIMON values.
> The GIMON (microA/A) depends on the 10th bit of TELEMETRY_AVG PMBUS Register.
> The value of RIMON (kohm) can be provided by the user through device tree using
> infineon,rimon-micro-ohms  property.
> ---
>  drivers/hwmon/pmbus/Kconfig  |   2 +-
>  drivers/hwmon/pmbus/xdp720.c | 167 +++++++++++++++++++++--------------
>  2 files changed, 100 insertions(+), 69 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 8f4bff375ecb..a9e86d92b044 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -715,7 +715,7 @@ config SENSORS_XDP720
>  	tristate "Infineon XDP720 family"
>  	help
>  	  If you say yes here you get hardware monitoring support for Infineon
> -	  XDP720.
> +	  XDP720 and XDP730 Digital eFuse Controllers.
>  
>  	  This driver can also be built as a module. If so, the module will
>  	  be called xdp720.
> diff --git a/drivers/hwmon/pmbus/xdp720.c b/drivers/hwmon/pmbus/xdp720.c
> index 8729a771f216..1a5eab09f2fd 100644
> --- a/drivers/hwmon/pmbus/xdp720.c
> +++ b/drivers/hwmon/pmbus/xdp720.c
> @@ -1,128 +1,159 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  /*
> - * Hardware monitoring driver for Infineon XDP720 Digital eFuse Controller
> + * Hardware monitoring driver for Infineon XDP720 / XDP730 Digital
> + * eFuse Controllers.
> + *
> + * Both parts share the same PMBus register map and direct-format
> + * coefficients; they differ in the GIMON gain step exposed via
> + * the TELEMETRY_AVG register and in the VDD_VIN pin number.
>   *
>   * Copyright (c) 2026 Infineon Technologies. All rights reserved.
>   */
>  
> +#include <linux/bitops.h>
>  #include <linux/i2c.h>
> -#include <linux/module.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
> -#include <linux/of_device.h>
> -#include <linux/bitops.h>
>  #include <linux/math64.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/property.h>
> +#include <linux/regulator/consumer.h>
>  #include "pmbus.h"
>  
>  /*
> - * The IMON resistor required to generate the system overcurrent protection.
> - * Arbitrary default Rimon value: 2k Ohm
> + * The IMON resistor required to generate the system overcurrent
> + * protection.  Arbitrary default Rimon value: 2 kOhm (in micro-ohms).
>   */
> -#define XDP720_DEFAULT_RIMON 2000000000 /* 2k ohm */
> -#define XDP720_TELEMETRY_AVG 0xE9
> +#define XDP720_DEFAULT_RIMON		2000000000U	/* 2 kohm */
> +#define XDP720_TELEMETRY_AVG		0xE9
> +#define XDP720_TELEMETRY_AVG_GIMON	BIT(10)		/* high/low GIMON select */
> +
> +/* Chip identifiers carried in OF match-data and i2c_device_id->driver_data. */
> +enum xdp720_chip_id {
> +	CHIP_XDP720 = 0,
> +	CHIP_XDP730,
> +};
>  
> -static struct pmbus_driver_info xdp720_info = {
> +struct xdp720_data {
> +	enum xdp720_chip_id	 id;
> +	struct pmbus_driver_info info;
> +};
> +
> +static const struct pmbus_driver_info xdp720_info = {
>  	.pages = 1,
> -	.format[PSC_VOLTAGE_IN] = direct,
> -	.format[PSC_VOLTAGE_OUT] = direct,
> -	.format[PSC_CURRENT_OUT] = direct,
> -	.format[PSC_POWER] = direct,
> -	.format[PSC_TEMPERATURE] = direct,
> -
> -	.m[PSC_VOLTAGE_IN] = 4653,
> -	.b[PSC_VOLTAGE_IN] = 0,
> -	.R[PSC_VOLTAGE_IN] = -2,
> -	.m[PSC_VOLTAGE_OUT] = 4653,
> -	.b[PSC_VOLTAGE_OUT] = 0,
> -	.R[PSC_VOLTAGE_OUT] = -2,
> +	.format[PSC_VOLTAGE_IN]		= direct,
> +	.format[PSC_VOLTAGE_OUT]	= direct,
> +	.format[PSC_CURRENT_OUT]	= direct,
> +	.format[PSC_POWER]		= direct,
> +	.format[PSC_TEMPERATURE]	= direct,
> +
> +	.m[PSC_VOLTAGE_IN]	= 4653,
> +	.b[PSC_VOLTAGE_IN]	= 0,
> +	.R[PSC_VOLTAGE_IN]	= -2,
> +	.m[PSC_VOLTAGE_OUT]	= 4653,
> +	.b[PSC_VOLTAGE_OUT]	= 0,
> +	.R[PSC_VOLTAGE_OUT]	= -2,

Do not change patch formatting just because you prefer your own
format. This hides the actual changes for no purpose.

>  	/*
> -	 * Current and Power measurement depends on the RIMON (kOhm) and
> -	 * GIMON(microA/A) values.
> +	 * Current and Power measurement depend on the RIMON (micro-ohm)
> +	 * and GIMON (microA/A) values; scaled per-instance in probe().

Also, if you make changes like this, do it in a separate patch
or patch series. Again, this hides functional changes.

I am not going to review this patch any further.

Guenter

>  	 */
> -	.m[PSC_CURRENT_OUT] = 24668,
> -	.b[PSC_CURRENT_OUT] = 0,
> -	.R[PSC_CURRENT_OUT] = -4,
> -	.m[PSC_POWER] = 4486,
> -	.b[PSC_POWER] = 0,
> -	.R[PSC_POWER] = -1,
> -	.m[PSC_TEMPERATURE] = 54,
> -	.b[PSC_TEMPERATURE] = 22521,
> -	.R[PSC_TEMPERATURE] = -1,
> +	.m[PSC_CURRENT_OUT]	= 24668,
> +	.b[PSC_CURRENT_OUT]	= 0,
> +	.R[PSC_CURRENT_OUT]	= -4,
> +	.m[PSC_POWER]		= 4486,
> +	.b[PSC_POWER]		= 0,
> +	.R[PSC_POWER]		= -1,
> +	.m[PSC_TEMPERATURE]	= 54,
> +	.b[PSC_TEMPERATURE]	= 22521,
> +	.R[PSC_TEMPERATURE]	= -1,
>  
>  	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_PIN |
> -		   PMBUS_HAVE_TEMP | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_INPUT |
> -		   PMBUS_HAVE_STATUS_TEMP,
> +		   PMBUS_HAVE_TEMP | PMBUS_HAVE_IOUT |
> +		   PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
>  };
>  
>  static int xdp720_probe(struct i2c_client *client)
>  {
> -	struct pmbus_driver_info *info;
> +	struct xdp720_data *data;
>  	int ret;
> -	u32 rimon;
>  	int gimon;
> +	u32 rimon;
>  
> -	info = devm_kmemdup(&client->dev, &xdp720_info, sizeof(*info),
> -			    GFP_KERNEL);
> -	if (!info)
> +	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
>  		return -ENOMEM;
>  
> +	data->id = (enum xdp720_chip_id)(uintptr_t)i2c_get_match_data(client);
> +	data->info = xdp720_info;
> +
>  	ret = devm_regulator_get_enable(&client->dev, "vdd-vin");
>  	if (ret)
>  		return dev_err_probe(&client->dev, ret,
> -			"failed to enable vdd-vin supply\n");
> +				     "failed to enable vdd-vin supply\n");
>  
>  	ret = i2c_smbus_read_word_data(client, XDP720_TELEMETRY_AVG);
> -	if (ret < 0) {
> -		dev_err(&client->dev, "Can't get TELEMETRY_AVG\n");
> -		return ret;
> +	if (ret < 0)
> +		return dev_err_probe(&client->dev, ret,
> +				     "failed to read TELEMETRY_AVG\n");
> +
> +	/* Bit 10 of TELEMETRY_AVG selects the GIMON gain step in microA/A */
> +	switch (data->id) {
> +	case CHIP_XDP720:
> +		gimon = (ret & XDP720_TELEMETRY_AVG_GIMON) ? 18200 : 9100;
> +		dev_info(&client->dev, "Initialised XDP720 instance\n");
> +		break;
> +	case CHIP_XDP730:
> +		gimon = (ret & XDP720_TELEMETRY_AVG_GIMON) ? 20000 : 10000;
> +		dev_info(&client->dev, "Initialised XDP730 instance\n");
> +		break;
> +	default:
> +		return -EINVAL;
>  	}
>  
> -	ret >>= 10; /* 10th bit of TELEMETRY_AVG REG for GIMON Value */
> -	ret &= GENMASK(0, 0);
> -	if (ret == 1)
> -		gimon = 18200; /* output gain 18.2 microA/A */
> -	else
> -		gimon = 9100; /* output gain 9.1 microA/A */
> -
> -	if (of_property_read_u32(client->dev.of_node,
> -				 "infineon,rimon-micro-ohms", &rimon))
> -		rimon = XDP720_DEFAULT_RIMON; /* Default if not set via DT */
> +	if (device_property_read_u32(&client->dev,
> +				     "infineon,rimon-micro-ohms", &rimon))
> +		rimon = XDP720_DEFAULT_RIMON;	/* Default if not in FW */
>  	if (rimon == 0)
>  		return -EINVAL;
>  
> -	/* Adapt the current and power scale for each instance */
> -	info->m[PSC_CURRENT_OUT] = DIV64_U64_ROUND_CLOSEST((u64)
> -		info->m[PSC_CURRENT_OUT] * rimon * gimon, 1000000000000ULL);
> -	info->m[PSC_POWER] = DIV64_U64_ROUND_CLOSEST((u64)
> -		info->m[PSC_POWER] * rimon * gimon, 1000000000000000ULL);
> +	/* Adapt the current and power scale for each instance. */
> +	data->info.m[PSC_CURRENT_OUT] = DIV64_U64_ROUND_CLOSEST((u64)
> +		data->info.m[PSC_CURRENT_OUT] * rimon * gimon,
> +		1000000000000ULL);
> +	data->info.m[PSC_POWER] = DIV64_U64_ROUND_CLOSEST((u64)
> +		data->info.m[PSC_POWER] * rimon * gimon,
> +		1000000000000000ULL);
>  
> -	return pmbus_do_probe(client, info);
> +	return pmbus_do_probe(client, &data->info);
>  }
>  
>  static const struct of_device_id xdp720_of_match[] = {
> -	{ .compatible = "infineon,xdp720" },
> -	{}
> +	{ .compatible = "infineon,xdp720", .data = (void *)CHIP_XDP720 },
> +	{ .compatible = "infineon,xdp730", .data = (void *)CHIP_XDP730 },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(of, xdp720_of_match);
>  
>  static const struct i2c_device_id xdp720_id[] = {
> -	{ "xdp720" },
> -	{}
> +	{ "xdp720", CHIP_XDP720 },
> +	{ "xdp730", CHIP_XDP730 },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, xdp720_id);
>  
>  static struct i2c_driver xdp720_driver = {
>  	.driver = {
> -		   .name = "xdp720",
> -		   .of_match_table = xdp720_of_match,
> +		.name		= "xdp720",
> +		.of_match_table	= xdp720_of_match,
>  	},
> -	.probe = xdp720_probe,
> -	.id_table = xdp720_id,
> +	.probe		= xdp720_probe,
> +	.id_table	= xdp720_id,
>  };
>  
>  module_i2c_driver(xdp720_driver);
>  
>  MODULE_AUTHOR("Ashish Yadav <ashish.yadav@infineon.com>");
> -MODULE_DESCRIPTION("PMBus driver for Infineon XDP720 Digital eFuse Controller");
> +MODULE_DESCRIPTION("PMBus driver for Infineon XDP720/XDP730 Digital eFuse Controllers");
>  MODULE_LICENSE("GPL");
>  MODULE_IMPORT_NS("PMBUS");
