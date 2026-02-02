Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8CC21CC43
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Feb 2026 15:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770046280; cv=none; b=WYN8jK7vXvjANgTg73zVdnFd+M5efsGDCuue7IBdFYKDxlgnd7HlTz9vQ3QN5/V8ugnBFslQfhqocG+VGIjP42vfA86JUrHneqpxb/HWXxXW/HpTf41QOUa6Xr1S7LRcYfY50LVG7Ta7wvcQWqQd9EbzyfDrO99b8ARWE/QJPU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770046280; c=relaxed/simple;
	bh=UEzb61WiEx2UmPh655yKl5YB3scIAObWORgpS5rNTkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eaT6jSCWCHOIQAu2HN/z8eXS0QBDLpu2aEf+g+ZG44PDuS8nERltcnu06Uj6DRRUS5l7t9SchNlR+opBVY8m4sQvDsb1b7uLqC7LZA71ELWBnB5mL2yJoq20Of+pG1r3hLlkohG5QsIRpoHNILmlxG8HFMu1GApCy3XKT7ar3WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MlYiVBrG; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MlYiVBrG"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-124a95e592fso5336019c88.0
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Feb 2026 07:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770046276; x=1770651076; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=KASwKVJAOcRcDQ62DynEubbsVbrQ52fy8su604URc1s=;
        b=MlYiVBrGUaf5E8ChoapXNaQGq0Tfx1fq5Kt9CBf4dHp/61hInLa8jlZyN7OgMVLDIt
         9DFbjyrHXox8FHtbxn+m7OH44jcT7xTMwJWR+lW9e21MqLPGZWkttGhur32KGTZi8fqU
         YNB3mujrRBfE2LNhl6Pc80Fe7gef5HRK/pHRfHvcxVbnAXkoAt+4iZvKM6Vj+WeYEa6Q
         0VVdkUxRQScaUBpzZq13NqQplzrHnLhEcGTOg40oNyqJUTeyMRxYCdXDazE0nzJxpGse
         XH4iKzB0TFVWZOz9snJ+6f5iknL/DHiAT9fFyzVqUTfsnl9o4nDSWwHrgC/YStbv4jMS
         uR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770046276; x=1770651076;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KASwKVJAOcRcDQ62DynEubbsVbrQ52fy8su604URc1s=;
        b=rYwTzEoqCxO8UwgLJqWAHxUqnjLYXtDQGPfOFAb8KCdK4yqzDfc9TL7sgmbaekjmo4
         gteC04rDh4BZLuJvaMdhn7mzZInCTK3d0lHmjeBWugTiaiULuQB6CAV7vBum2iv1PItM
         IDnV9PYFEz8/F4lyqOQpFm8500/XeucuYROIRTwouHG40LD5CBOQEQbwPpJeCmPFi8zG
         +4YuihWVwRkknktCAQYkGUnqSl+prLP7t0Ck99rCKjIlc944rvg8PnwEEKPU3UHU1bsA
         b5otzjkCv5qxAR8kOTnSMAYd3j5kTU0CL1tPj39tozIFfbxDzsfIPzsU0qcVN4JPHlhQ
         Fgjw==
X-Gm-Message-State: AOJu0YzI+3txTUD/ljJ+R69TY7wspou5HAT78dOA//+Aiy7N6A0/W3Dq
	02dfPRGHj+kou9sa+sWPwDX5JnrkOY2Dcxik6mGWOxtwF4GV/QR6S9cl
X-Gm-Gg: AZuq6aLkSh8FjJ+2e8NpSY2ycr8qR1rl3e2t2jIqYj7VedBA/Wo49IfozYgEZ71rcVK
	HybDKJh9DsQmoGWlxgRkU84SnAsmGGnEyagaNLg8nUmYV48fFVjXIflydOC8JcAOEUjupPNas5v
	EJCRCnLoSAsHI2a4FsSSueoFtABOBolIIQVWe4OYyX9ZErLrqJ++PKzTub7ndFIjlgykZ91b+wX
	CpCMXNRyg8JO+7KfIptYE8EmE3VR1xkhEsYRpqxaErZcVhG+v+wjVC7fU1V+vqtuAZPobaRdON7
	+wjpywviBd44Bzxaj1NvKBulo19c/CdPV002RA2+ssqcv2cnYHXHuSiQmZu/3AMMZ6rfkSs1WBC
	Ij9GK0npqT6ObaiERK40vBWM1gb5LouDgPhftajxA64x37lD5iy8GQz6+TF4PsYoCCtN2JyzLwc
	1277xLwZZWXG26DzepKI/Sfrzq4UqCq1lmAS7cshQQO+A3K1QqmjQIq9uQc82l
X-Received: by 2002:a05:7022:124:b0:121:dea2:d54d with SMTP id a92af1059eb24-125c0fafcd7mr5852450c88.20.1770046276127;
        Mon, 02 Feb 2026 07:31:16 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1adc60dsm19913850eec.23.2026.02.02.07.31.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 07:31:15 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d0854014-7977-48b9-bf31-d66865352ecf@roeck-us.net>
Date: Mon, 2 Feb 2026 07:31:14 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon:(pmbus/xdpe1a2g7b) Add support for
 xdpe1a2g5b/7b controllers
To: ASHISH YADAV <ashishyadav78@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ashish Yadav <ashish.yadav@infineon.com>
References: <20260202080355.53061-1-Ashish.Yadav@infineon.com>
 <20260202080355.53061-3-Ashish.Yadav@infineon.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260202080355.53061-3-Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/2/26 00:03, ASHISH YADAV wrote:
> From: Ashish Yadav <ashish.yadav@infineon.com>
> 
> Add the pmbus driver for Infineon Digital Multi-phase XDPE1A2G5B and
> XDPE1A2G7B controllers.
> 
> XDPE1A2G5B controller supports Linear Data format for VOUT using VOUT_MODE
> command.
> XDPE1A2G7B controller supports Linear and VID Data format for VOUT using
> VOUT_MODE command.
> 
> In case of vid mode in XDPE1A2G7B controller, NVIDIA PWM VID vrm_version
> is supported:
> Vout = 5mV * (VID-1) + 195mV
> 
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
> ---
>   drivers/hwmon/pmbus/Kconfig      |   9 +++
>   drivers/hwmon/pmbus/Makefile     |   1 +
>   drivers/hwmon/pmbus/pmbus.h      |   2 +-
>   drivers/hwmon/pmbus/pmbus_core.c |   4 ++
>   drivers/hwmon/pmbus/xdpe1a2g7b.c | 115 +++++++++++++++++++++++++++++++

Driver documentation missing.

>   5 files changed, 130 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/hwmon/pmbus/xdpe1a2g7b.c
> 
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index f3fb94cebf1a..c6750bce446d 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -684,6 +684,15 @@ config SENSORS_XDPE152
>   	  This driver can also be built as a module. If so, the module will
>   	  be called xdpe152c4.
>   
> +config SENSORS_XDPE1A2G7B
> +	tristate "Infineon XDPE1A2G7B"
> +	help
> +	  If you say yes here you get hardware monitoring support for Infineon
> +	  XDPE1A2G5B and XDPE1A2G7B.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called xdpe1a2g7b.
> +
>   config SENSORS_XDPE122
>   	tristate "Infineon XDPE122 family"
>   	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 349a89b6d92e..620f24baa289 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -67,6 +67,7 @@ obj-$(CONFIG_SENSORS_UCD9200)	+= ucd9200.o
>   obj-$(CONFIG_SENSORS_XDP710)	+= xdp710.o
>   obj-$(CONFIG_SENSORS_XDPE122)	+= xdpe12284.o
>   obj-$(CONFIG_SENSORS_XDPE152)	+= xdpe152c4.o
> +obj-$(CONFIG_SENSORS_XDPE1A2G7B)	+= xdpe1a2g7b.o
>   obj-$(CONFIG_SENSORS_ZL6100)	+= zl6100.o
>   obj-$(CONFIG_SENSORS_PIM4328)	+= pim4328.o
>   obj-$(CONFIG_SENSORS_CRPS)	+= crps.o
> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> index d2e9bfb5320f..3ddcb742d289 100644
> --- a/drivers/hwmon/pmbus/pmbus.h
> +++ b/drivers/hwmon/pmbus/pmbus.h
> @@ -416,7 +416,7 @@ enum pmbus_sensor_classes {
>   #define PMBUS_PAGE_VIRTUAL	BIT(31)	/* Page is virtual */
>   
>   enum pmbus_data_format { linear = 0, ieee754, direct, vid };
> -enum vrm_version { vr11 = 0, vr12, vr13, imvp9, amd625mv };
> +enum vrm_version { vr11 = 0, vr12, vr13, imvp9, amd625mv, nvidia195mv };
>   
>   /* PMBus revision identifiers */
>   #define PMBUS_REV_10 0x00	/* PMBus revision 1.0 */
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index be6d05def115..4d7634ee6148 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -885,6 +885,10 @@ static s64 pmbus_reg2data_vid(struct pmbus_data *data,
>   		if (val >= 0x0 && val <= 0xd8)
>   			rv = DIV_ROUND_CLOSEST(155000 - val * 625, 100);
>   		break;
> +	case nvidia195mv:
> +		if (val >= 0x01)
> +			rv = 195 + (val - 1) * 5;  /* VID step is 5mv */
> +		break;
>   	}
>   	return rv;
>   }

The core change needs to be a separate patch.

> diff --git a/drivers/hwmon/pmbus/xdpe1a2g7b.c b/drivers/hwmon/pmbus/xdpe1a2g7b.c
> new file mode 100644
> index 000000000000..79b12b56e7b6
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/xdpe1a2g7b.c
> @@ -0,0 +1,115 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Hardware monitoring driver for Infineon Multi-phase Digital XDPE1A2G5B
> + * and XDPE1A2G7B Controllers
> + *
> + * Copyright (c) 2026 Infineon Technologies. All rights reserved.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include "pmbus.h"
> +
> +#define XDPE1A2G7B_PAGE_NUM 2
> +#define XDPE1A2G7B_NVIDIA_195MV 0x1E /* NVIDIA mode 1.95mV, VID step is 5mV */
> +
> +static int xdpe1a2g7b_identify(struct i2c_client *client,
> +			       struct pmbus_driver_info *info)
> +{
> +	u8 vout_params;
> +	int i, ret, vout_mode;
> +
> +	vout_mode = pmbus_read_byte_data(client, 0, PMBUS_VOUT_MODE);
> +	if (vout_mode >= 0 && vout_mode != 0xff) {

What if vout_mode < 0 ? Also, what if the mode is different for page 1 ?

Also, if I understand patch 0 correctly, executing this function is not needed
for XDPE1A2G5B.

> +		switch (vout_mode >> 5) {
> +		case 0:
> +			info->format[PSC_VOLTAGE_OUT] = linear;
> +			return 0;
> +		case 1:
> +			info->format[PSC_VOLTAGE_OUT] = vid;
> +			break;
> +		default:
> +			return -ENODEV;
> +		}
> +	}
> +
> +	for (i = 0; i < info->pages; i++) {
> +		/* Read the VOUT_MODE register for VID Code Type. */
> +		ret = pmbus_read_byte_data(client, i, PMBUS_VOUT_MODE);

Given that there are only two pages, reading PMBUS_VOUT_MODE for
page 0 twice is a bit of a waste. On top of that, the need for the loop
suggests that the mode can be different across pages. That needs to be
supported: Bailing out in that case is not acceptable. Worse:
What if the mode is linear on page 0 but vid on page 1 ?

> +		if (ret < 0)
> +			return ret;
> +
> +		vout_params = ret & GENMASK(4, 0);
> +		switch (vout_params) {
> +		case XDPE1A2G7B_NVIDIA_195MV:
> +			info->vrm_version[i] = nvidia195mv;
> +			break;
> +		default:
> +			return -EINVAL;

This warrants an error message and an explanation (comment) why other modes
are not supported by the driver. The detailed datasheet is not public, so
you'll have to help out here. As mentioned above, bailing out because the
mode on page 1 is linear is not acceptable.

> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static struct pmbus_driver_info xdpe1a2g7b_info = {
> +	.pages = XDPE1A2G7B_PAGE_NUM,
> +	.identify = xdpe1a2g7b_identify,
> +	.format[PSC_VOLTAGE_IN] = linear,
> +	.format[PSC_TEMPERATURE] = linear,
> +	.format[PSC_CURRENT_IN] = linear,
> +	.format[PSC_CURRENT_OUT] = linear,
> +	.format[PSC_POWER] = linear,
> +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> +		   PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> +		   PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 | PMBUS_HAVE_STATUS_TEMP |
> +		   PMBUS_HAVE_POUT | PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT,
> +	.func[1] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> +		   PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> +		   PMBUS_HAVE_PIN | PMBUS_HAVE_POUT | PMBUS_HAVE_STATUS_INPUT,
> +};
> +
> +static int xdpe1a2g7b_probe(struct i2c_client *client)
> +{
> +	struct pmbus_driver_info *info;
> +
> +	info = devm_kmemdup(&client->dev, &xdpe1a2g7b_info, sizeof(*info),
> +			    GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	return pmbus_do_probe(client, info);
> +}
> +
> +static const struct i2c_device_id xdpe1a2g7b_id[] = { { "xdpe1a2g5b" },
> +						      { "xdpe1a2g7b" },
> +						      {} };

Please use more lines and less indentation.

> +
> +MODULE_DEVICE_TABLE(i2c, xdpe1a2g7b_id);
> +
> +static const struct of_device_id __maybe_unused xdpe1a2g7b_of_match[] = {
> +	{ .compatible = "infineon,xdpe1a2g5b" },
> +	{ .compatible = "infineon,xdpe1a2g7b" },
> +	{}

... just like here.

> +};
> +
> +MODULE_DEVICE_TABLE(of, xdpe1a2g7b_of_match);
> +
> +static struct i2c_driver xdpe1a2g7b_driver = {
> +	.driver = {
> +		.name = "xdpe1a2g7b",
> +		.of_match_table = of_match_ptr(xdpe1a2g7b_of_match),
> +	},
> +	.probe = xdpe1a2g7b_probe,
> +	.id_table = xdpe1a2g7b_id,
> +};
> +
> +module_i2c_driver(xdpe1a2g7b_driver);
> +
> +MODULE_AUTHOR("Ashish Yadav <ashish.yadav@infineon.com>");
> +MODULE_DESCRIPTION("PMBus driver for Infineon XDPE1A2G5B/7B");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("PMBUS");

