Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F37737C906
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 15:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789053596; cv=none; b=sz5chZP08e/4WxV//sPJ/gd/b7I9ggk8ZBJIXf7CaZtqc7N4I6kWH9mwAbaApQRc9IbSAE0qsnoZplmPNb2gZsJhkvFfY1gVc090Ow+cJiDAeUKcXNjihbCSysjURz9gqm9yo2mMJGIR7kFMlCSKjyNGZkNgbSnFFj/ZhYm2mxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789053596; c=relaxed/simple;
	bh=RS5fzbnrhNxA/GAN2337xKkxjWEl1P2eDhtbp5XkuB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QZMS7CCvgrA/UjLjvsxC2en6aVejpTtsDjqih4ZY/ia5wxAn5iIr6l4na1k2/cCcXMNvBFPJNKNIyD09IXWerTmSJaLT9ZQlXBpRK2MrKQ9Datxeh1vpTyHP2oGKkTxlemMB0p3drLWZlqsJtETvfljm+tusbyHa7espMd0YWNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qC118meU; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qC118meU"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-46adf49ff3dso4687636fac.3
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 08:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789053588; x=1789658388; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kglaqaLFoVxSEZyqvHDcD/nUChRlP6JQlA/ICImrCj0=;
        b=qC118meUqb0I05UJQrGOAnZbx/ylGVMv4LaMhvCNLpxf0wNYSF48EBtwhc3bqQJYFP
         4MH/Pyf8xWA6FyRNtEXzvABVpcHbcROBsOtRqyUHXrkb2/ygK3QeiE5+mBzlvfdDU0Nd
         IEIsazaPprPzCDsn+VQTe3peFVS+s8rL/3Qef8AgSWbQzNhgSTDyGU/4JOq5d4JBaW9o
         rdhmbM36yGtwthDort5SOQqU+p7gWBQEcLWjx/won7QtWcMhSOLPWodSOrEudWBR1+hI
         LUhqpcZJ2i8OaxEikH2pMxxbqgc0u4sloxr25Q89OF5owBvlTlOXi3c1FkzJ9DmHD8tz
         yAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789053588; x=1789658388;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kglaqaLFoVxSEZyqvHDcD/nUChRlP6JQlA/ICImrCj0=;
        b=HVaV1eDWZdihOjy3swdKx0fED+Og8bzlRHYVGEAbs8v14NSHd38IoLUTJIac2UH8VH
         HeK+veCFq43lV37aoKr1qlMSQVvVWIlNfVImZhfYc7eO4FWs+S/rjODqlZmY9Nb0fQ/h
         IgKiey90Vy1fKgBB1uFU9VOT+VOIIHxyGPcnj0FTe8pwOlYvOYQisE9V8nXoXgyBrkLN
         ZW7Iu7QiFoBH0ANgUlVf66uG4+sxAeVKU8EMexDhZZSD0gpV8aT1L9vWPxYIltpDoKhA
         vIDnDJekZPY1LYTVW2Cvfslnq5Yjn4rL10x1LwDfMHakRC3g+o2Kh79atu1fg4966AQr
         lC4A==
X-Gm-Message-State: AFuF++k5DdhC87GRutFYpes0I0f3uLrDZmvhXo+VydKvaQoBRAAMLAcT
	yAMSOlhm1J1zIMqPhEVkdbFiweenXcBSufBzWNjyoCf4k21MvEPu9EAI
X-Gm-Gg: AYBFou0Q4hAZR/JG57QMLyGx8/smqrAJOoRx9CeuYcZlf+KrfZCpSACrWaUF6LpYGsE
	0UWfolFT25yTncEOvgwxUoO9XGrqN/dyAwaH8Osbn4N5WjtShj4iC/7hpQggw2OBF0KK0ZkbMb0
	obfFmdZJ19o03wRU0sLV+EhGDxUberckc2LAQMFbOoR2JMH7Porh7R61axgAY2nqKsfQpfLFeca
	pBI0r+rPywCjdCj3NP/qIue9FbhP8rLvDTdetwaz2FZeyKi7Oqqdt/zucLikYaF158ntYjQT31F
	focuKxAUjW8/fliNl9Fc7sgHRkn78dbXtm8HDCfqzS2emGrXffwHicZmeA8Pwk9m8lWLtYDan8r
	imxxI0oUch97aU35ygMcO/rkAeFlfwio7Cy7oUDb+lg96an/RgMNKDuPpwruBzNgtT8wOReCfls
	QxXRkQmoZy5YfnKoNZ8BIwhSORly9GHr9J84QutOfQgUjABK7teKJ+c9M3rOMUesbK+E1v3Zd8X
	loHCsV2PyH+TptF/g4MgbMI1B3AjDFPmkuJnURrWYnTwi55
X-Received: by 2002:a05:6870:318e:b0:448:8bdd:8358 with SMTP id 586e51a60fabf-47551c2914bmr29838746fac.15.1789053588033;
        Thu, 10 Sep 2026 08:19:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-475541a8becsm19532037fac.6.2026.09.10.08.19.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 08:19:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7317a007-3995-47b3-b9f8-3aaf7702c7a4@roeck-us.net>
Date: Thu, 10 Sep 2026 08:19:45 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] hwmon: (pmbus/tda38740) Add driver for Infineon
 TDA38740/TDA38725
To: Colin Huang <colin.huang2@amd.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Colin Huang <u8813345@gmail.com>
References: <20260910-add-tda38740-and-tda38725-v4-0-dbae7fabce09@gmail.com>
 <20260910-add-tda38740-and-tda38725-v4-2-dbae7fabce09@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260910-add-tda38740-and-tda38725-v4-2-dbae7fabce09@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/26 05:35, Colin Huang wrote:
> From: Colin Huang <u8813345@gmail.com>
> 
> Add a PMBus driver for Infineon TDA38740 and TDA38725
> single-voltage synchronous buck regulators.
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> ---
>   Documentation/hwmon/index.rst    |  1 +
>   Documentation/hwmon/tda38740.rst | 65 +++++++++++++++++++++++++++
>   drivers/hwmon/pmbus/Kconfig      |  9 ++++
>   drivers/hwmon/pmbus/Makefile     |  1 +
>   drivers/hwmon/pmbus/tda38740.c   | 94 ++++++++++++++++++++++++++++++++++++++++
>   5 files changed, 170 insertions(+)
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
> index 000000000000..6d3e9884f733
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/tda38740.c
> @@ -0,0 +1,94 @@
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
> +/*
> + * TDA38725/TDA38740 only support Linear format for VOUT related commands,
> + * with exponents in the range of -8 to -12 (see datasheet VOUT_MODE
> + * description). Direct format is not supported by this device.
> + */
> +static int tda38740_identify(struct i2c_client *client,
> +			     struct pmbus_driver_info *info)
> +{
> +	int vout_mode;
> +
> +	vout_mode = pmbus_read_byte_data(client, 0, PMBUS_VOUT_MODE);
> +	if (vout_mode < 0 || vout_mode == 0xff)
> +		return vout_mode < 0 ? vout_mode : -ENODEV;
> +
> +	if ((vout_mode >> 5) != 0)
> +		return -ENODEV;
> +

What is the point of this code ? The PMBus core, in pmbus_identify_common(),
already compares the configured mode (info->format[PSC_VOLTAGE_OUT]) with
the value in the PMBUS_VOUT_MODE register and bails out if it does not match.
The code here just seems to duplicate that. Am I missing something ?
> +	info->format[PSC_VOLTAGE_OUT] = linear;
> +
> +	return 0;
> +}
> +
> +static struct pmbus_driver_info tda38740_info = {
> +	.pages = 1,
> +	.format[PSC_VOLTAGE_IN] = linear,
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
> +	.identify = tda38740_identify,
> +};
> +
> +static int tda38740_probe(struct i2c_client *client)
> +{
> +	struct tda38740_data *data;
> +

This definition got lost, and I don't immediately see why it would be
needed.

Thanks,
Guenter

> +	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	memcpy(&data->info, &tda38740_info, sizeof(tda38740_info));
> +
> +	return pmbus_do_probe(client, &data->info);
> +}
> +
> +static const struct i2c_device_id tda38740_id[] = {
> +	{ .name = "tda38725"},
> +	{ .name = "tda38740"},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, tda38740_id);
> +
> +static const struct of_device_id __maybe_unused tda38740_of_match[] = {
> +	{ .compatible = "infineon,tda38725"},
> +	{ .compatible = "infineon,tda38740"},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, tda38740_of_match);
> +
> +static struct i2c_driver tda38740_driver = {
> +	.driver = {
> +		.name = "tda38740",
> +		.of_match_table = of_match_ptr(tda38740_of_match),
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

