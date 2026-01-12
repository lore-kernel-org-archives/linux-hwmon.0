Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDCA2EA169
	for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 15:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768231618; cv=none; b=TPavsqKeSR9m/AA43D320u8toB+gi8ow/lgoA/+OFvphcikkrKN5t8qwLFQIwe/nYsb3dzHy/QTFr17/5CdvmjCzAO1WLn91hyLidryeLs/YQ21idEVBTdjN+K6cPS8JBFQ28yZM1lkqSBLv2IN7MwR9UwiuMfDc7NwL0KETx/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768231618; c=relaxed/simple;
	bh=T69JtBxhUZCuCAdXwmO3l5OAmRLeYdL2JM6JMwvsiCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jmTYEJolVtzwntipyyQOUZTMo8lqcXCkRj4BgvbzpmHV/gp7t++W0/TbDV9aeY13BRXOUyTgcrTF4zCuBXVHtY5S1XbPflnT91vJtqCsaFGe06+jfbLa2XZWaP1tMJRS30Sg3JJc0Xcwvn88ujHb2qB93L6O5ISbkU/52iA17iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iV1vjVlw; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iV1vjVlw"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2ae29ddaed9so2506837eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 07:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768231612; x=1768836412; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=70f5nX6ldwbHHAv0cSLeCqUZ+kUWLA8s5i8rl6D7Oa4=;
        b=iV1vjVlwu4puiS6eYQguztzKhU8dTlnl6fkRv6fmI+VbW7vlmKhrkvoZPVqO3KFtua
         mje3/CDFMSisdZftWeXdJbcW+2oOCBQYAVGwexJHlqG0sndTSplpFLvVdhRR5D1ZO2g3
         4bB/0/U2LoTB2e/P+688bSVG0i08/nVcRBwRuYiu9at3SOnY03MPakMjBeSJbgcj04fs
         qXCa+KP8o3YF4YlnLGo5QW2xitEP9O0OaIDNtaV1ob8hqC6jx8n6fAQdSqeqznnKzuyl
         5o7D/7cSC1PWcPLdTtEBxzbyq0/3WmeQPy2g0EHxjGQG7VUhybZbAx9elQfwSgRlDSQu
         kYjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768231612; x=1768836412;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=70f5nX6ldwbHHAv0cSLeCqUZ+kUWLA8s5i8rl6D7Oa4=;
        b=BfMGGMe06Cs3aBwe4+aLhPk69PvuI3fWVz57yhT3poIrwlDjRBZz7z/qKXJHtkxg7a
         ThUgLX15qdzDRzs7eTBH/NMgyMjODtyPlYPGXLZWgMBzZE/Nc2uvFNKcHITWUHwyU25s
         rFDy6Ek9cwOo8IByNa7FfPPG3cWQUkIkOrDkeST3PensfAOhPQ4mU1ug0cr84oawUzqW
         IR1UB64DX7mxUk3v9drzMoDekNWczcEH8tQwovkvJI2wz3RPKmLs4wtYUkM2QQ1qGil6
         SJ+7wpTn6scmN4fM+3sqHyC/7+xt9sG92eWD+MhjU2URpVpL/fB2cn7qAE4SAXRl13E5
         9djg==
X-Forwarded-Encrypted: i=1; AJvYcCXGsVTd7RelsohOeZqFe+c5IfV+/GSREPSe2fqUeZL8w2Ek3sJlETX/e+ZjF1M7kvW4DPpDUbmixgidxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyomEGJccEuq8KGf/BgVADSpw/spQoMPRWvJHr6mWgChB89JbAA
	k0uRSK+xhxNyuwMotN3UV7VoScnY4Wx7wufch9JbaW/dRkF+TLIedu+V
X-Gm-Gg: AY/fxX7qz3SGGXPklwbbWmtscA+QWg3g1OKNoFQfPrnJYIRM/BCO41msONd0h8Vxt32
	BrPREJ8bje7TcYJSFAcScBgz8YkLMLsSTyrxr0rv7HGDBz+k5De+z6jW+3T+70+sR9pYN2B33MN
	oXmIUG8qOEHNb+d9bG+7uklzJFzbsV10faF3RBeFSGQe3DydPxcQpROcJOQPbtW4xkJvZ4FYFkD
	hJKq0v7FlOdggTLueAeQwDZsKssRIja/Gq1BM/pZVdcIgblawPHObDrDCYj7t1ouDYPA5VUJFi8
	6oTQSUP8hV3yjYZdL+saDjZryQKsUXI1IKwtrZA8v7ZsgRqqFvs3yrPQpCcbN5S5ykZZGbMbOuy
	oLo9lI1z8/Rs9Osue/+5QQ3qOeHfZb/u0YEYIG0ta99UwXt1mEjrI51DBP2CiGEI0tuUPmUdkEa
	u9KxZq9fsuMr1fw49TJxD/Au98EPc0a/WlLh9uzGfIkjUp8pbafyTEAAolB5C2
X-Google-Smtp-Source: AGHT+IGYLED8FMeltVsaQmPfawpXtVYg7CvTOfbWRVy7F6TRtygxdsFFWPU+BK/PXEOvVpHCed8WFQ==
X-Received: by 2002:a05:7300:7fa2:b0:2ab:9c11:4c91 with SMTP id 5a478bee46e88-2b17c842913mr15130512eec.12.1768231612397;
        Mon, 12 Jan 2026 07:26:52 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1706a5d3dsm15196864eec.13.2026.01.12.07.26.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 07:26:51 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <67eb366e-1207-4e9a-9659-3482c8a9ec9b@roeck-us.net>
Date: Mon, 12 Jan 2026 07:26:49 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] hwmon: Add support for HiTRON HAC300S PSU
To: Vasileios Amoiridis <vassilisamir@gmail.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 Vasileios Amoiridis <vasileios.amoiridis@cern.ch>
References: <20260106160353.14023-1-vassilisamir@gmail.com>
 <20260106160353.14023-3-vassilisamir@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260106160353.14023-3-vassilisamir@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/6/26 08:03, Vasileios Amoiridis wrote:
> From: Vasileios Amoiridis <vasileios.amoiridis@cern.ch>
> 
> Add Support for HiTRON HAC300S PSU. This is a AC/DC hot-swappable
> CompactPCI Serial Dual output active current sharing switching power
> supply with a 312W rating.
> 
> Signed-off-by: Vasileios Amoiridis <vasileios.amoiridis@cern.ch>
> ---
>   Documentation/hwmon/hac300s.rst |  37 ++++++++

Needs to be added to index.rst.

>   MAINTAINERS                     |   7 ++
>   drivers/hwmon/pmbus/Kconfig     |   9 ++
>   drivers/hwmon/pmbus/Makefile    |   1 +
>   drivers/hwmon/pmbus/hac300s.c   | 152 ++++++++++++++++++++++++++++++++
>   5 files changed, 206 insertions(+)
>   create mode 100644 Documentation/hwmon/hac300s.rst
>   create mode 100644 drivers/hwmon/pmbus/hac300s.c
> 
> diff --git a/Documentation/hwmon/hac300s.rst b/Documentation/hwmon/hac300s.rst
> new file mode 100644
> index 000000000000..573269fc81f8
> --- /dev/null
> +++ b/Documentation/hwmon/hac300s.rst
> @@ -0,0 +1,37 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver hac300s
> +=====================
> +
> +Supported chips:
> +
> +   * HiTRON HAC300S
> +
> +     Prefix: 'hac300s'
> +
> +     Datasheet: Publicly available at HiTRON website.
> +
> +Author:
> +
> +  - Vasileios Amoiridis <vasileios.amoiridis@cern.ch>
> +
> +Description
> +-----------
> +
> +This driver implements support for the HiTRON HAC300S PSU. It is a Universal

s/implements support/supports/

> +AC input harmonic correction AC-DC hot-swappable CompactPCI Serial Dual output
> +(with 5V standby) 312 Watts active current sharing switching power supply.
> +
> +The device has an input of 90-264VAC and 2 nominal output voltaged at 12V and
> +5V which they can supplu up to 25A and 2.5A respectively.
> +
> +Sysfs entries
> +-------------
> +
> +======= ==========================================
> +curr1   Output current
> +in1     Output voltage
> +power1  Output power
> +temp1   Ambient temperature inside the module
> +temp2   Internal secondary component's temperature
> +======= ==========================================
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a0dd762f5648..feb8ec4d9b17 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11254,6 +11254,13 @@ F:	kernel/time/timer_list.c
>   F:	kernel/time/timer_migration.*
>   F:	tools/testing/selftests/timers/
>   
> +HITRON HAC300S PSU DRIVER
> +M:	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/hwmon/hac300s.rst
> +F:	drivers/hwmon/pmbus/hac300s.c
> +
>   DELAY, SLEEP, TIMEKEEPING, TIMERS [RUST]
>   M:	Andreas Hindborg <a.hindborg@kernel.org>
>   R:	Boqun Feng <boqun.feng@gmail.com>
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index f3fb94cebf1a..4c2cb51dbe3f 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -124,6 +124,15 @@ config SENSORS_FSP_3Y
>   	  This driver can also be built as a module. If so, the module will
>   	  be called fsp-3y.
>   
> +config SENSORS_HAC300S
> +	tristate "Hitron HAC300S-D120E PSU"
> +	help
> +	  If you say yes here you get hardware monitoring support for the
> +	  Hitron HAC300S-D120E Power Supply.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called hac300s.
> +
>   config SENSORS_IBM_CFFPS
>   	tristate "IBM Common Form Factor Power Supply"
>   	depends on LEDS_CLASS
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 349a89b6d92e..b92309019d35 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -13,6 +13,7 @@ obj-$(CONFIG_SENSORS_BEL_PFE)	+= bel-pfe.o
>   obj-$(CONFIG_SENSORS_BPA_RS600)	+= bpa-rs600.o
>   obj-$(CONFIG_SENSORS_DELTA_AHE50DC_FAN) += delta-ahe50dc-fan.o
>   obj-$(CONFIG_SENSORS_FSP_3Y)	+= fsp-3y.o
> +obj-$(CONFIG_SENSORS_HAC300S)	+= hac300s.o
>   obj-$(CONFIG_SENSORS_IBM_CFFPS)	+= ibm-cffps.o
>   obj-$(CONFIG_SENSORS_DPS920AB)	+= dps920ab.o
>   obj-$(CONFIG_SENSORS_INA233)	+= ina233.o
> diff --git a/drivers/hwmon/pmbus/hac300s.c b/drivers/hwmon/pmbus/hac300s.c
> new file mode 100644
> index 000000000000..a1640449e5f5
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/hac300s.c
> @@ -0,0 +1,152 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// SPDX-FileCopyrightText: 2024 CERN (home.cern)
> +/*
> + * Hardware monitoring driver for Hi-Tron HAC300S PSU.
> + *
> + * NOTE: The HAC300S device does not support the PMBUS_VOUT_MODE register.
> + * On top of that, it returns the Voltage output values in Linear11 which is
> + * not adhering to the PMBus specifications. (PMBus Specification Part II,
> + * Section 7.1-7.3). For that reason the PMBUS_VOUT_MODE register is being faked
> + * and returns the exponent value of the READ_VOUT register. The exponent part
> + * of the VOUT_* registers is being cleared in order to return the mantissa to
> + * the pmbus core.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/pmbus.h>
> +
> +#include "pmbus.h"
> +
> +#define LINEAR11_EXPONENT_MASK GENMASK(15, 11)
> +#define LINEAR11_MANTISSA_MASK GENMASK(10, 0)
> +
> +#define to_hac300s_data(x) container_of(x, struct hac300s_data, info)
> +
> +struct hac300s_data {
> +	struct pmbus_driver_info info;
> +	bool vout_linear11;
> +	s8 exponent;
> +};
> +
> +static int hac300s_read_byte_data(struct i2c_client *client, int page, int reg)
> +{
> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +	struct hac300s_data *data = to_hac300s_data(info);
> +
> +	if (reg == PMBUS_VOUT_MODE && data->vout_linear11)
> +		return data->exponent;
> +
> +	return pmbus_read_byte_data(client, page, reg);
> +}
> +
> +static int hac300s_read_word_data(struct i2c_client *client, int page,
> +				   int phase, int reg)
> +{
> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +	struct hac300s_data *data = to_hac300s_data(info);
> +	int rv;
> +
> +	rv = pmbus_read_word_data(client, page, phase, reg);
> +	if (rv < 0)
> +		return rv;
> +
> +	switch (reg) {
> +	case PMBUS_VIRT_READ_IOUT_AVG:
> +	case PMBUS_VIRT_READ_POUT_AVG:
> +	case PMBUS_VIRT_READ_TEMP_AVG:
> +		return -ENXIO;
> +	case PMBUS_VOUT_OV_WARN_LIMIT:
> +	case PMBUS_VOUT_UV_WARN_LIMIT:
> +	case PMBUS_VOUT_OV_FAULT_LIMIT:
> +	case PMBUS_VOUT_UV_FAULT_LIMIT:
> +	case PMBUS_MFR_VOUT_MAX:
> +	case PMBUS_MFR_VOUT_MIN:
> +	case PMBUS_READ_VOUT:
> +		if (data->vout_linear11)
> +			return FIELD_GET(LINEAR11_MANTISSA_MASK, rv);

Is it guaranteed that the exponent is always the same ? Because if not the
conversion will have to be explicit.

> +		fallthrough;
> +	default:
> +		return rv;

This is wrong. The register should only be read by affected commands, and
the function should return -ENODATA for the others.

> +	}
> +}
> +
> +#define HAC300S_SW_FUNC (PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 | \
> +			 PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT | \
> +			 PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | \
> +			 PMBUS_HAVE_POUT | PMBUS_HAVE_STATUS_TEMP)
> +
Unnecessary define since it is only used once. Please fold into the declaration
below.

> +static struct pmbus_driver_info hac300s_info = {
> +	.pages = 1,
> +	.func[0] = HAC300S_SW_FUNC,
> +	.read_byte_data = hac300s_read_byte_data,
> +	.read_word_data = hac300s_read_word_data,
> +	.format[PSC_VOLTAGE_OUT] = linear,
> +};
> +
> +static struct pmbus_platform_data hac300s_pdata = {
> +	.flags = PMBUS_NO_CAPABILITY,
> +};
> +
> +static int hac300s_probe(struct i2c_client *client)
> +{
> +	struct hac300s_data *data;
> +	int rv;
> +
> +	data = devm_kzalloc(&client->dev, sizeof(struct hac300s_data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	if (!i2c_check_functionality(client->adapter,
> +				     I2C_FUNC_SMBUS_READ_BYTE_DATA |
> +				     I2C_FUNC_SMBUS_READ_WORD_DATA))
> +		return -ENODEV;
> +
> +	rv = i2c_smbus_read_byte_data(client, PMBUS_VOUT_MODE);
> +	if (rv < 0) {

This needs explanation. Why try to read PMBUS_VOUT_MODE if the failure is
expected ? Are there variants of the PSU which return something useful here ?
The note above does not explain the reason for this conditional.

If this is supposed to check if this is really the expected device,
read and verify PMBUS_MFR_ID instead.

Thanks,
Guenter

> +		data->vout_linear11 = true;
> +		/* LINEAR11 format, use exponent from READ_VOUT register */
> +		rv = i2c_smbus_read_word_data(client, PMBUS_READ_VOUT);
> +		if (rv < 0)
> +			return dev_err_probe(&client->dev, rv, "Failed to read vout_mode\n");
> +
> +		data->exponent = FIELD_GET(LINEAR11_EXPONENT_MASK, rv);
> +	}
> +
> +	data->info = hac300s_info;
> +	client->dev.platform_data = &hac300s_pdata;
> +	return pmbus_do_probe(client, &data->info);
> +}
> +
> +static const struct of_device_id hac300s_of_match[] = {
> +	{ .compatible = "hitron,hac300s" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, hac300s_of_match);
> +
> +static const struct i2c_device_id hac300s_id[] = {
> +	{"hac300s", 0},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, hac300s_id);
> +
> +static struct i2c_driver hac300s_driver = {
> +	.driver = {
> +		   .name = "hac300s",
> +		   .of_match_table = hac300s_of_match,
> +	},
> +	.probe = hac300s_probe,
> +	.id_table = hac300s_id,
> +
> +};
> +module_i2c_driver(hac300s_driver);
> +
> +MODULE_AUTHOR("Vasileios Amoiridis");
> +MODULE_DESCRIPTION("PMBus driver for Hi-Tron HAC300S PSU");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("PMBUS");

