Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B062328750B
	for <linux-hwmon@vger.kernel.org>; Thu, 18 Dec 2025 17:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766080194; cv=none; b=s7xH9v+Q4V5jBii3Rd23/4C5BUY0fXT8PAOqwXvkc4XDmzhWzPUZI2B9pYbn99aOIL1yx1GDROSIwwlLgVFjsHgj8morIxUXlC8hUhFtYAh7Jf198C/ksKKqaRm66gi7bknsn2XyIdP2Xw6khdLqDWORiIPZSvPfHt1c2rNyLtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766080194; c=relaxed/simple;
	bh=JvUyJ0b5t+AisHwmv9HabomTFZm9mbbvR2kLyM+8ChY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IEuU98oh67J5edXz7cI4ShoNUaSM2gkngKezJrflTySDXTUmicfXOix90rJqpSPCXi7UhjUNFxw4HsbP8rFN3/V3LsgON2J0h0zMESV7munpy/aYBr+h0CJZ1FglAKkM4rDDLwKB9bfmRm9/8L+40elIPJwGx84LLzk4latzHdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jBZ3chiM; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBZ3chiM"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso984553b3a.3
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Dec 2025 09:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766080192; x=1766684992; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b86URYmboRpfsL7oipfrdl2zfszQJi0IR++a0s4t4W0=;
        b=jBZ3chiMhLEKbua0MDQxq1r27Et9I5YLhhwC7hY1MVcU8eHukOdxlnxZ7mwl1f84Rg
         QVgkfoJwKWyHwptTCSAqY+lg4mI9XhOCXWT5GpNSSUXn0l50U8i3XwSXpwNLzeu53MYT
         QsptrW33qOtnQ4NwnM0ZxjZtud1jewVACAWXrbQzoAbFqoOzGis9WZ1kUmZ+r/dKVxm4
         4+yBQ505R6nJE+KB5N8m3yY35094zsn6Deu+UhYF/tuXxnmtPc+A3vVg9B1Ir5Nydujt
         zyKgxjgoHnx7xLJmZtECW6M+vJoEwpU9Nys2PS4pSfLESfEyEDQA50y3MdEQ4TfqAgW/
         pXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766080192; x=1766684992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b86URYmboRpfsL7oipfrdl2zfszQJi0IR++a0s4t4W0=;
        b=gojRT536Y4POzsoVxjxUCYDdSv/S2Vk5gdowIoAOVaHGBUAYz5QJPUuVlgq7d1Xd1K
         XbCn5kLZuBc63gclF53+qSGeZ9WWuUB05f9ogDyAPaurGI3mabRAHIaetTKUu5LqodLM
         YnxG5Vm61QpMFej2DckG8dpzzQIAYUgHJ3PJqLGBzlBZbQMvUbDSAOgoCm9C6NQoxJgb
         vbc6QUkehOkNMZYBqDxdPQQhiFBDH0CAKSxkaQjso4aM1Dq5bOIlZqifb290M7qtd6CI
         Hq6sSO0L6PNhwCI3RESzHUxGjZkFaagKaRPzoikIjzaIRxTXNjDJSZiK4bOZsUX4ejPs
         Crcg==
X-Forwarded-Encrypted: i=1; AJvYcCVx9Dn/Kik9qhzNbg3SoaQdFO1fZC4P1+PqjZm2lAiKXNzfNsWsc4qj6o3J2WvdQ7/LKI4JHIyuJEKdWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwU/SEJM0reYFhGsX1MSr5H2ys9Tw8+ss3uGWwEthpIDiXCLJvk
	xGUdEMxsGIBTnU3If7TaZnxw3pFXAVIUyeB58YKlzcagQL4X3taRrsfw
X-Gm-Gg: AY/fxX48mcidLUIdS5dzV+bWVr2/JOYRfemaghWLSmBclWlNJ/hZS+TqYZJEBIm6u7A
	lfXQz6eLQNPy60pOWRmCxe3mez0yKKYT+AbtxggQ2gvYUvpS7dz+w+fdF/CYXUWnuwzwRzPf4G+
	h1BFuy37rpOndrQ/wErBaeju0tnbrEVtX0OM4M6WkuF1Ngfzezpb1Hx+2pLZb5YTJWlvHjeQc/X
	H0n7j9kpivu4s4YC33sqcwGqS0CvNKuNO2Z1GHhfj3IfVAiUDj4/3xtHuXW3L2xaF4pM7M//2Zy
	GV8l98jOmAqZt8G2B/K3HlldlkNNZCroOcMxbC5muZRcPfyq4noyLIMZNciCukw77n7XlGpXdFY
	n5ut1syCKk9bPxs64jzDxGlL4crUUEEaHdDD4Lg7WD9ZbHFLfYqxo+5dmuPz2Fda0O61EYB7qEY
	8ir0uTgqbM24k/RAT7Ahxf1UMC
X-Google-Smtp-Source: AGHT+IEiDYf2/RGrQySGE3lIY1IHIWZorTe9AS53lFG91U22GQ/ieAamdz6WdDzGgZ7xb9qDBGjQcg==
X-Received: by 2002:a05:7023:905:b0:11d:fd26:234e with SMTP id a92af1059eb24-121722b821amr98330c88.16.1766080191665;
        Thu, 18 Dec 2025 09:49:51 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12061f473acsm9347205c88.3.2025.12.18.09.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 09:49:51 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 18 Dec 2025 09:49:49 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
Cc: corbet@lwn.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, wyx137120466@gmail.com,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 RESEND 2/2] hwmon: add mp5926 driver
Message-ID: <48471efc-8ea2-41f6-9fd7-0d4c33806ab3@roeck-us.net>
References: <20251215022505.1602-1-Yuxi.Wang@monolithicpower.com>
 <20251215022505.1602-3-Yuxi.Wang@monolithicpower.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215022505.1602-3-Yuxi.Wang@monolithicpower.com>

On Mon, Dec 15, 2025 at 10:25:05AM +0800, Yuxi Wang wrote:
> Add support for mps mp5926.
> 
> Signed-off-by: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
> ---
>  Documentation/hwmon/index.rst  |   1 +
>  Documentation/hwmon/mp5926.rst |  92 ++++++++++++++++
>  MAINTAINERS                    |   7 ++
>  drivers/hwmon/pmbus/Kconfig    |   9 ++
>  drivers/hwmon/pmbus/Makefile   |   1 +
>  drivers/hwmon/pmbus/mp5926.c   | 190 +++++++++++++++++++++++++++++++++
>  6 files changed, 300 insertions(+)
>  create mode 100644 Documentation/hwmon/mp5926.rst
>  create mode 100644 drivers/hwmon/pmbus/mp5926.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 85d7a686883e..6181c3f62177 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -185,6 +185,7 @@ Hardware Monitoring Kernel Drivers
>     mp2993
>     mp5023
>     mp5920
> +   mp5926
>     mp5990
>     mp9941
>     mp9945
> diff --git a/Documentation/hwmon/mp5926.rst b/Documentation/hwmon/mp5926.rst
> new file mode 100644
> index 000000000000..4b64a7e24ae6
> --- /dev/null
> +++ b/Documentation/hwmon/mp5926.rst
> @@ -0,0 +1,92 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver mp5926
> +====================
> +
> +Supported chips:
> +
> +  * MPS mp5926
> +
> +    Prefix: 'mp5926'
> +
> +  * Datasheet
> +    https://www.monolithicpower.com/en/
> +
> +Author:
> +
> +	Yuxi Wang <Yuxi.Wang@monolithicpower.com>
> +
> +Description
> +-----------
> +
> +This driver implements support for Monolithic Power Systems, Inc. (MPS)
> +MP5926 Hot-Swap Controller.
> +
> +Device compliant with:
> +
> +- PMBus rev 1.3 interface.
> +
> +The driver exports the following attributes via the 'sysfs' files
> +for input voltage:
> +
> +**in1_input**
> +
> +**in1_label**
> +
> +**in1_crit**
> +
> +**in1_crit_alarm**
> +
> +The driver provides the following attributes for output voltage:
> +
> +**in2_input**
> +
> +**in2_label**
> +
> +**in2_lcrit**
> +
> +**in2_lcrit_alarm**
> +
> +**in2_rated_max**
> +
> +**in2_rated_min**
> +
> +The driver provides the following attributes for input current:
> +
> +**curr1_input**
> +
> +**curr1_label**
> +
> +**curr1_max**
> +
> +**curr1_max_alarm**
> +
> +The driver provides the following attributes for output current:
> +
> +**curr2_input**
> +
> +**curr2_label**
> +
> +The driver provides the following attributes for input power:
> +
> +**power1_input**
> +
> +**power1_label**
> +
> +The driver provides the following attributes for output power:
> +
> +**power2_input**
> +
> +**power2_label**
> +
> +The driver provides the following attributes for temperature:
> +
> +**temp1_input**
> +
> +**temp1_crit**
> +
> +**temp1_crit_alarm**
> +
> +**temp1_max**
> +
> +**temp1_max_alarm**
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d701a4d5b00e..fea710aab535 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17708,6 +17708,13 @@ S:	Maintained
>  F:	Documentation/hwmon/mp2993.rst
>  F:	drivers/hwmon/pmbus/mp2993.c
>  
> +MPS MP5926 DRIVER
> +M:	Yuxi Wang <Yuxi.Wang@monolithicpower.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/hwmon/mp5926.rst
> +F:	drivers/hwmon/pmbus/mp5926.c
> +
>  MPS MP9941 DRIVER
>  M:	Noah Wang <noahwang.wang@outlook.com>
>  L:	linux-hwmon@vger.kernel.org
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index f3fb94cebf1a..d0aa460abdc9 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -472,6 +472,15 @@ config SENSORS_MP5920
>  	  This driver can also be built as a module. If so, the module will
>  	  be called mp5920.
>  
> +config SENSORS_MP5926
> +	tristate "MPS MP5926"
> +	help
> +	  If you say yes here you get hardware monitoring support for Monolithic
> +	  MP5926.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called mp5926.
> +
>  config SENSORS_MP5990
>  	tristate "MPS MP5990"
>  	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 349a89b6d92e..75ec4956ca8d 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -47,6 +47,7 @@ obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
>  obj-$(CONFIG_SENSORS_MP2993)	+= mp2993.o
>  obj-$(CONFIG_SENSORS_MP5023)	+= mp5023.o
>  obj-$(CONFIG_SENSORS_MP5920)	+= mp5920.o
> +obj-$(CONFIG_SENSORS_MP5926)	+= mp5926.o
>  obj-$(CONFIG_SENSORS_MP5990)	+= mp5990.o
>  obj-$(CONFIG_SENSORS_MP9941)	+= mp9941.o
>  obj-$(CONFIG_SENSORS_MP9945)	+= mp9945.o
> diff --git a/drivers/hwmon/pmbus/mp5926.c b/drivers/hwmon/pmbus/mp5926.c
> new file mode 100644
> index 000000000000..3122854b07f8
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/mp5926.c
> @@ -0,0 +1,190 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +//
> +// mp5926.c  - pmbus driver for mps mp5926
> +//
> +// Copyright 2025 Monolithic Power Systems, Inc
> +//
> +// Author: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/pmbus.h>
> +#include "pmbus.h"
> +
> +#define PAGE	0x01
> +#define EFUSE_CFG	0xCF
> +#define I_SCALE_SEL	0xC6
> +#define MP5926_FUNC	(PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | \
> +			PMBUS_HAVE_IIN | PMBUS_HAVE_PIN | \
> +			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_INPUT | \
> +			PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_STATUS_VOUT)
> +
> +struct mp5926_data {
> +	struct pmbus_driver_info info;
> +	u8 vout_mode;
> +	u8 vout_linear_exponent;
> +};
> +
> +#define to_mp5926_data(x)  container_of(x, struct mp5926_data, info)
> +
> +static int mp5926_read_byte_data(struct i2c_client *client, int page,
> +				 int reg)
> +{
> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +	struct mp5926_data *data = to_mp5926_data(info);
> +	int ret;
> +
> +	switch (reg) {
> +	case PMBUS_VOUT_MODE:
> +		if (data->vout_mode == linear) {
> +			/*
> +			 * The VOUT format used by the chip is linear11,
> +			 * not linear16. Report that VOUT is in linear mode
> +			 * and return exponent value extracted while probing
> +			 * the chip.
> +			 */
> +			return data->vout_linear_exponent;
> +		} else {

else after return is not needed.

> +			return PB_VOUT_MODE_DIRECT;
> +		}

> +		break;

and neither is a break after unconditional return.

> +	default:
> +		ret = -ENODATA;
> +		break;
> +	}
> +	return ret;
> +}
> +
> +static int mp5926_read_word_data(struct i2c_client *client, int page, int phase,
> +				 int reg)
> +{
> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +	struct mp5926_data *data = to_mp5926_data(info);
> +	int ret;
> +	s32 mantissa;
> +
> +	switch (reg) {
> +	case PMBUS_READ_VOUT:
> +		ret = pmbus_read_word_data(client, page, phase, reg);
> +		if (ret < 0)
> +			return ret;
> +		/*
> +		 * Because the VOUT format used by the chip is linear11 and not
> +		 * linear16, we disregard bits[15:11]. The exponent is reported
> +		 * as part of the VOUT_MODE command.
> +		 */
> +		if (data->vout_mode == linear) {
> +			mantissa = ((s16)((ret & 0x7ff) << 5)) >> 5;
> +			ret = mantissa;

The extra 'mantissa' variable is really unnecessary.
			ret = ((s16)((ret & 0x7ff) << 5)) >> 5;
or even better sign_extend32() would be sufficient.

> +		}
> +		break;
> +	default:
> +		ret = -ENODATA;
> +		break;
> +	}
> +	return ret;
> +}
> +
> +static struct pmbus_driver_info mp5926_info = {
> +	.pages = PAGE,
> +	.format[PSC_VOLTAGE_IN] = direct,
> +	.format[PSC_CURRENT_IN] = direct,
> +	.format[PSC_VOLTAGE_OUT] = direct,
> +	.format[PSC_TEMPERATURE] = direct,
> +	.format[PSC_POWER] = direct,
> +
> +	.m[PSC_VOLTAGE_IN] = 16,
> +	.b[PSC_VOLTAGE_IN] = 0,
> +	.R[PSC_VOLTAGE_IN] = 0,
> +
> +	.m[PSC_CURRENT_IN] = 16,
> +	.b[PSC_CURRENT_IN] = 0,
> +	.R[PSC_CURRENT_IN] = 0,
> +
> +	.m[PSC_VOLTAGE_OUT] = 16,
> +	.b[PSC_VOLTAGE_OUT] = 0,
> +	.R[PSC_VOLTAGE_OUT] = 0,
> +
> +	.m[PSC_TEMPERATURE] = 4,
> +	.b[PSC_TEMPERATURE] = 0,
> +	.R[PSC_TEMPERATURE] = 0,
> +
> +	.m[PSC_POWER] = 25,
> +	.b[PSC_POWER] = 0,
> +	.R[PSC_POWER] = -2,
> +
> +	.read_word_data = mp5926_read_word_data,
> +	.read_byte_data = mp5926_read_byte_data,
> +	.func[0] = MP5926_FUNC,
> +};
> +
> +static int mp5926_probe(struct i2c_client *client)
> +{
> +	struct mp5926_data *data;
> +	struct pmbus_driver_info *info;
> +	int ret;
> +
> +	data = devm_kzalloc(&client->dev, sizeof(struct mp5926_data),
> +			    GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	memcpy(&data->info, &mp5926_info, sizeof(*info));
> +	info = &data->info;
> +	ret = i2c_smbus_read_word_data(client, EFUSE_CFG);
> +	if (ret < 0)
> +		return ret;
> +	if (ret & BIT(12)) {
> +		data->vout_mode = linear;
> +		data->info.format[PSC_VOLTAGE_IN] = linear;
> +		data->info.format[PSC_CURRENT_IN] = linear;
> +		data->info.format[PSC_VOLTAGE_OUT] = linear;
> +		data->info.format[PSC_TEMPERATURE] = linear;
> +		data->info.format[PSC_POWER] = linear;
> +		ret = i2c_smbus_read_word_data(client, PMBUS_READ_VOUT);
> +		if (ret < 0) {
> +			dev_err(&client->dev, "Can't get vout exponent.");
> +			return ret;

dev_err_probe() would be useful here.

> +		}
> +		data->vout_linear_exponent = (u8)((ret >> 11) & 0x1f);
> +	} else {
> +		data->vout_mode = direct;
> +		ret = i2c_smbus_read_word_data(client, I_SCALE_SEL);
> +		if (ret < 0)
> +			return ret;
> +		if (ret & BIT(6))
> +			data->info.m[PSC_CURRENT_IN] = 4;
> +	}
> +
> +	return pmbus_do_probe(client, info);
> +}
> +
> +static const struct i2c_device_id mp5926_id[] = {
> +	{ "mp5926", 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, mp5926_id);
> +
> +static const struct of_device_id mp5926_of_match[] = {
> +	{ .compatible = "mps,mp5926" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, mp5926_of_match);
> +
> +static struct i2c_driver mp5926_driver = {
> +	.probe = mp5926_probe,
> +	.driver = {
> +			.name = "mp5926",
> +			.of_match_table = mp5926_of_match,
> +		   },
> +	.id_table = mp5926_id,
> +};
> +
> +module_i2c_driver(mp5926_driver);
> +MODULE_AUTHOR("Yuxi Wang <Yuxi.Wang@monolithicpower.com>");
> +MODULE_DESCRIPTION("MPS MP5926 pmbus driver");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("PMBUS");
