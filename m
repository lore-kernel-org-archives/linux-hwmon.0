Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA074F96C4
	for <linux-hwmon@vger.kernel.org>; Fri, 18 Sep 2026 15:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789743764; cv=none; b=oQnB5MKnmvlH4IvbUaY5rW/FSywu9D3UwiPLI/gm672SPmxJ+DjA4HpTmhFv4a646BxeZkBs7pry6rJlQdW3i1eKy1rh4/30LABvfFTjIVl+SaLqiIeLSyzuK/JX976KYQfo0I5qi5fcSYhVI8UpiHrI6dZC3sgwAk5ToBRAYbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789743764; c=relaxed/simple;
	bh=ITubyCmQ0IqICURrqkJRPxQa8V5YyjerEjVQzcuewrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=msSk/vSVyY3DPRGd0rIti7NF6EcQhLXx2ekY61sNqfYPFP/zjSdYREMptWWZQ3w2BDU7zn/F1dDgZIEdTanWO+7J6nZffKGA4TPK70Nd4xh/Y8GbHeaoHtddAoT4UactAGiq+CxOUMI0GjCio7aCRv4aCR0NifDoY63mmrg1hJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHmETVqr; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHmETVqr"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f05ffdso6484325ad.1
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Sep 2026 08:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789743761; x=1790348561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LhCDu1m9RcDMKABHVNVaAnRdFOqbBkAGLFS2ulG6C8Y=;
        b=FHmETVqrApRdb6PN/F/bhE9hB4pgzneIIj78BHwu1wyIUjRhf7QcuZwT7/JzcbT5c4
         Z4W1IZ1Jy/ZFtAbvpbqWeVLfydmWb37okgZ6YSgo9rmVhtdIbiNKZIhUZOACn10DT5uv
         ICvNLxRra+HRkCtoPiVix4zJoPCoShGXsNefmbeKmba3nvpPY+4K4/uMW3LpGSl+p726
         /bmWImkrpYnpo/s6JhLWa3s7yDsAJreX3hz8qIB48J5YDwSpDjZs5zUyp3B6kgALJZZ0
         JYdYwT8wCIc5DfPCtspUkNHT44mS9MLhiRIo9qLEsbrGJxoJ5GwcFAu4fCZw6Ttd2wWP
         d3BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789743761; x=1790348561;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LhCDu1m9RcDMKABHVNVaAnRdFOqbBkAGLFS2ulG6C8Y=;
        b=OwSjHUAdXj2kAWkSX8/gSdMv+qdm8whgtJaO9SuBCpqOLYXpDG945lS/FpyVxh6GnP
         1ZaCphQkqTLp5lJLluUeLNMPnLMHvEpWaFLby70/qKIanaIyLmJMZI3cqs8pQj9qYNH+
         EZrhG+HLGgcuSXD7GqBLRdmaXuebF6yumjiM6R6c1SQM5WEIr8gCaEntHQ4n27DZGEk0
         loqAmsOM1UzGbNKnaluXxIdjGd8S2nv4X87ydjJzHaMM2g/N9G/6s8ibsL/k7kxRO6ll
         lnvjqKf4JVTGEe/AGsZ5lHGOSeymQ6cucBVlfhhKk68Anvw+7waQMNySJtW1IJEelQoc
         3u7A==
X-Gm-Message-State: AFuF++mu10Ig6DG1DOsTcPDEwlUPBM4Hlufp5UpFEX+qhb9N9QbihDBh
	jyliY/meGDkjOPhMaLNYaMGg4T0d25/p9lB1Xz4PmAO71YYJcGzkFc1W
X-Gm-Gg: AYBFou1SEArCn0WAgl1f3PBEsqVmgto3jabkOdC+8CGjhUSt6JmHpTSvF+FYjtuubWr
	UfV5y1vCAWYhigV0wMXjU3sDX+S8myyc45rFs20VUtG1r24OaTGS5aQA5g39c18SfutOdlWsann
	6OACk1NRiUt46d1g2Utsg5nozyXnt2dmphaBo4PRtNR5hgDVpMbO7EShg5S1bYhOXCNAsZYL0WG
	eKtAMwWp4EUaI7982/qR0eimdFUREJdQ1n1vph1tR7NcIP8SHicbrnqgm5zbNOou11QcSfJcKGF
	OdisVKDQ+RJXFUOY4vkdz4ahxUFFrkMapxnF1hpawFszyHBPzvpMykGxDqQ9P7/b5prGFE5/ud6
	cx9N4fhTKfA8UkmohrIM7rNBBEN4u6YVBFV5FOO05BK8hIYVPxswd3LEbfDfev2pfyXkGLBofII
	jO59z1pPESHTm8nFfQOIPwOLuP/7M5AHE8fvBrtAWnMv2CRUuaKpxqkMXhaIB8HBJG2KndotUNI
	8N2ymzVWNtw1dEztxzF0AvSVgbKT1rtaYE/ujJoZiBDRlWgFPEBd5VfYGI=
X-Received: by 2002:a17:902:c945:b0:2dd:ad74:ac26 with SMTP id d9443c01a7336-2ddb1b9a0fcmr61272835ad.24.1789743760748;
        Fri, 18 Sep 2026 08:02:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb73db1c5sm9960585ad.4.2026.09.18.08.02.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 08:02:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <dbd0a721-898b-4524-a0cd-c9751fd4bd68@roeck-us.net>
Date: Fri, 18 Sep 2026 08:02:38 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] hwmon: (pmbus/tda38740) Add driver for Infineon
 TDA38740/TDA38725
To: Colin Huang <u8813345@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, colin.huang2@amd.com, linux-doc@vger.kernel.org
References: <20260918-add-tda38740-and-tda38725-v6-0-a8b11018d850@gmail.com>
 <20260918-add-tda38740-and-tda38725-v6-2-a8b11018d850@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260918-add-tda38740-and-tda38725-v6-2-a8b11018d850@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/26 03:23, Colin Huang wrote:
> Add a PMBus driver for Infineon TDA38740 and TDA38725
> single-voltage synchronous buck regulators.
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>

For my reference (waiting for DT patch approval):

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   Documentation/hwmon/index.rst    |  1 +
>   Documentation/hwmon/tda38740.rst | 65 ++++++++++++++++++++++++++++++++++++++++
>   drivers/hwmon/pmbus/Kconfig      |  9 ++++++
>   drivers/hwmon/pmbus/Makefile     |  1 +
>   drivers/hwmon/pmbus/tda38740.c   | 64 +++++++++++++++++++++++++++++++++++++++
>   5 files changed, 140 insertions(+)
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index f07977a20271..aeff87b3d46d 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -265,6 +265,7 @@ Hardware Monitoring Kernel Drivers
>      sy7636a-hwmon
>      tc654
>      tc74
> +   tda38740
>      thmc50
>      tmp102
>      tmp103
> diff --git a/Documentation/hwmon/tda38740.rst b/Documentation/hwmon/tda38740.rst
> new file mode 100644
> index 000000000000..55ce12f14914
> --- /dev/null
> +++ b/Documentation/hwmon/tda38740.rst
> @@ -0,0 +1,65 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +====================================
> +Kernel driver tda38740
> +====================================
> +
> +Supported chips:
> +  * Infineon TDA38740
> +  * Infineon TDA38725
> +
> +    Prefix: 'tda38740'
> +
> +    Addresses scanned: -
> +
> +    Datasheet:
> +      https://www.infineon.com/row/public/documents/24/49/infineon-tda38740-tda38725-datasheet-en.pdf
> +
> +Author: Colin Huang <u8813345@gmail.com>
> +
> +Description
> +-----------
> +
> +The TDA38740 and TDA38725 are single-output synchronous buck regulators with a
> +PMBus interface. They expose basic voltage, current, power and temperature
> +telemetry through the standard PMBus hwmon interfaces.
> +
> +Sysfs entries
> +-------------
> +
> +======================= =======================================================
> +curr1_alarm		Input current alarm
> +curr1_input		Measured input current
> +curr1_label		"iin"
> +
> +curr2_crit		Critical maximum output current
> +curr2_crit_alarm	Output current critical high alarm
> +curr2_input		Measured output current
> +curr2_label		"iout"
> +
> +in1_crit		Critical maximum input voltage
> +in1_crit_alarm		Input voltage critical high alarm
> +in1_input		Measured input voltage
> +in1_label		"vin"
> +
> +in2_crit		Critical maximum output voltage
> +in2_crit_alarm		Output voltage critical high alarm
> +in2_input		Measured output voltage
> +in2_label		"vout"
> +in2_lcrit		Critical minimum output voltage
> +in2_lcrit_alarm		Output voltage critical low alarm
> +
> +power1_alarm		Input power alarm
> +power1_input		Measured input power
> +power1_label		"pin"
> +
> +power2_input		Measured output power
> +power2_label		"pout"
> +
> +temp1_crit		Critical high temperature
> +temp1_crit_alarm	Chip temperature critical high alarm
> +temp1_input		Measured temperature
> +temp1_max		Maximum temperature
> +temp1_max_alarm		Chip temperature high alarm
> +======================= =======================================================
> +
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index bcfdc4ce4c10..e4ca80dd0574 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -763,6 +763,15 @@ config SENSORS_TDA38640_REGULATOR
>   	  If you say yes here you get regulator support for Infineon
>   	  TDA38640 as regulator.
>   
> +config SENSORS_TDA38740
> +	tristate "Infineon TDA38725/TDA38740"
> +	help
> +	  If you say yes here you get hardware monitoring support for Infineon
> +	  TDA38725 and TDA38740.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called tda38740.
> +
>   config SENSORS_TPS25990
>   	tristate "TI TPS25990"
>   	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index e288fe72a437..eb06d47816fd 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -70,6 +70,7 @@ obj-$(CONFIG_SENSORS_STEF48H28)	+= stef48h28.o
>   obj-$(CONFIG_SENSORS_SQ24860)	+= sq24860.o
>   obj-$(CONFIG_SENSORS_STPDDC60)	+= stpddc60.o
>   obj-$(CONFIG_SENSORS_TDA38640)	+= tda38640.o
> +obj-$(CONFIG_SENSORS_TDA38740)	+= tda38740.o
>   obj-$(CONFIG_SENSORS_TPS25990)	+= tps25990.o
>   obj-$(CONFIG_SENSORS_TPS40422)	+= tps40422.o
>   obj-$(CONFIG_SENSORS_TPS53679)	+= tps53679.o
> diff --git a/drivers/hwmon/pmbus/tda38740.c b/drivers/hwmon/pmbus/tda38740.c
> new file mode 100644
> index 000000000000..067de07ba9fb
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/tda38740.c
> @@ -0,0 +1,64 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Hardware monitoring driver for Infineon TDA38725/TDA38740
> + *
> + * Copyright (c) 2023 9elements GmbH
> + *
> + */
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include "pmbus.h"
> +
> +static struct pmbus_driver_info tda38740_info = {
> +	.pages = 1,
> +	.format[PSC_VOLTAGE_IN] = linear,
> +	.format[PSC_VOLTAGE_OUT] = linear,
> +	.format[PSC_CURRENT_OUT] = linear,
> +	.format[PSC_CURRENT_IN] = linear,
> +	.format[PSC_POWER] = linear,
> +	.format[PSC_TEMPERATURE] = linear,
> +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
> +	    | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
> +	    | PMBUS_HAVE_IIN
> +	    | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
> +	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
> +	    | PMBUS_HAVE_POUT | PMBUS_HAVE_PIN,
> +};
> +
> +static int tda38740_probe(struct i2c_client *client)
> +{
> +	return pmbus_do_probe(client, &tda38740_info);
> +}
> +
> +static const struct i2c_device_id tda38740_id[] = {
> +	{ .name = "tda38725"},
> +	{ .name = "tda38740"},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, tda38740_id);
> +
> +static const struct of_device_id tda38740_of_match[] = {
> +	{ .compatible = "infineon,tda38725"},
> +	{ .compatible = "infineon,tda38740"},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, tda38740_of_match);
> +
> +static struct i2c_driver tda38740_driver = {
> +	.driver = {
> +		.name = "tda38740",
> +		.of_match_table = tda38740_of_match,
> +	},
> +	.probe = tda38740_probe,
> +	.id_table = tda38740_id,
> +};
> +
> +module_i2c_driver(tda38740_driver);
> +
> +MODULE_DESCRIPTION("PMBus driver for Infineon TDA38725/TDA38740");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("PMBUS");
> 

