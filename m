Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DE119C540
	for <linux-hwmon@vger.kernel.org>; Fri, 19 Dec 2025 18:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766169595; cv=none; b=ZLKv90L0kCoyEJLj0/ABwusHg+kA0ZttxT/+X13EQZr70RQ0PXbeyN7UvWDdEnesgXeu8/fO4w4DbNEo4n6ZWj8zlFqzPlIkBx+wRKfH72tz8fzT2AfK+wibzjN8CNb2Mps1pffPQ6lgc8E6nkkPejPV3qI57yoGEKsNDJuMFws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766169595; c=relaxed/simple;
	bh=vmmlyERkT3AjRqpZk/y1yFDkCVu7HL5/z99/+aWZxrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pLFqYOIjIxyOLorN3F0YFn/VKPL8IIJvYV2pCze51havYW8oxq2eYe0K2PPe8Gp10KwJHOfBwAysEPSIravgOu55ARuPnOA1bi5vYqO7txFwqGtTcKrirS1NcdSKRRYkIr5xbNvOfE4ss2wV8v3GQdihGdRZxINz8p5FiaNEYHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OwUqHCzp; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OwUqHCzp"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4ed82ee9e57so25464251cf.0
        for <linux-hwmon@vger.kernel.org>; Fri, 19 Dec 2025 10:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766169592; x=1766774392; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vuCZ+fHIJQF3Nuz7eOBOWcO6aa8yeNtMpL8cd+du1T4=;
        b=OwUqHCzp5Au5PQPI6ngIPlMMgxEsl2c3THDM/2Jwa2Dsrnz8phtPnQ901GNXrVLPAK
         v+SGSPBmVfx1ixWF/fqtaqNVx/YZSeFRynnloO3AajP4fJu/4I5mB5qFuNo+4dNExvXT
         l4V/R+yMwQUPKuQ2JD8kPo/guXqAVORdgdOBZSELEeEYjxck7BANuTGkL7WQzcv4Ib8b
         V5FEFLsbISYAGnfzhA12arsi7KOGe0QlzIKILElHzc9muDE6LxlPVT0DGHFO5v597qUj
         2TfKopZWYQI6xf8u6/SBFLYAFxcdBki0J9ecI9XxkE2qy1VdanAyeetM+eXYhyDVkMG3
         y+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766169592; x=1766774392;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vuCZ+fHIJQF3Nuz7eOBOWcO6aa8yeNtMpL8cd+du1T4=;
        b=iBsSL6d80p6L3cXDDDAmU3gozvHSLnO3aMBH+B5lnH/DVroRiGTHJjUrI6zyUk3P1h
         rN19sW2RQY2rUlvDWx/FHyMomREwje0PLd1RG3PD04hl8CQfk81LPSQQGX5ciZNv5Nm9
         DWMaSsUGxO+zdcSHLgkHgnsHlVw9oayaTAxRxVKZcS4ggi7zA65zLsx9KJuXqyYrE385
         Vj4w4UsBRbv8Jxa72rXanFYB80IbUnMo1iWudBRhwQRoSlwONLuXlBtMPiTAfJ9J3QBu
         gggb3RJnIIYM6Xblw8smCNpwkx/0NVd+rfTzY0BftmRR9QOkAfIhMaoDjZWPQ7yw6q6J
         h1Yw==
X-Forwarded-Encrypted: i=1; AJvYcCWhxfc5SJkRMI7yBUySkTr+0myahwKDZ7kdcMRhiJOIzBSVpf4jG+Rwgo3SrKCFMIdzO30TKZmsgrarqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLgaCcto+0UHIIEBeGpOlbOucMmH5yl9WgD0SbafqGzxpughbv
	u8Lv5+tbZ9CR9FPU9ApxGW+i+PY93sYOz7ofMCDw3bVocnTEJXvajniI
X-Gm-Gg: AY/fxX7UeP904Y/1oFbWBFwcWy6uCxaKKYl4bdF9D5XLuTLDSCOSaL/3UWIa5xp4dPB
	ISIkNheahyjiuoMn6G8CRF/ZCoHP9FXvfnJtQvgW6C4xv0LMGTKVCkS5njnpFAKmNoXHn/tRU0z
	pIg8y4BtgvwBIARjz3ZScFzR4ZGKVgQX9yeL4ol/EaRzAGt2PHNwQ+rhXcn39W4A4JhPeNOnTvb
	NxmOrho7qUqQQqTjn/YhI9T5pvXGHiU496iPAdHMSbmYSGyTAqfQx3bZKu1TRMBElMusxX7Yu+0
	m7yyqQLPTJnGHHsD5Kg1QkG/zyXcAh0Qxt6i1546XTdrbxDlvHVfwJDvIWPkRLxoCyI2XoBHdSi
	h8c+hfEIPnDAUJyAKZlm4VzxDXlEaK0Bq2NRpcSUQYGLomYWqgJIEplVWc9AeT4m6e1DNyIhI8M
	j51asRiVoYOArZ3QlY5FsPbV4v
X-Google-Smtp-Source: AGHT+IHOKSC+KI1Nyc4OKONZJ3szj4wUL6LNTRbQr8apuim/UbhzwDmhASs87IoUPE1cdNRRnYXwYA==
X-Received: by 2002:a05:7022:248a:b0:11b:9152:b3ad with SMTP id a92af1059eb24-121722dff70mr3707810c88.31.1766163143581;
        Fri, 19 Dec 2025 08:52:23 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c23csm9673327c88.9.2025.12.19.08.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 08:52:22 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 19 Dec 2025 08:52:22 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
Cc: corbet@lwn.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, wyx137120466@gmail.com,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: add mp5926 driver
Message-ID: <7fbb2eb5-5257-4461-96d8-264a1ac243a6@roeck-us.net>
References: <20251219055413.1661-1-Yuxi.Wang@monolithicpower.com>
 <20251219055413.1661-3-Yuxi.Wang@monolithicpower.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219055413.1661-3-Yuxi.Wang@monolithicpower.com>

On Fri, Dec 19, 2025 at 01:54:13PM +0800, Yuxi Wang wrote:
> Add support for mps mp5926.
> 
> Signed-off-by: Yuxi Wang <Yuxi.Wang@monolithicpower.com>

Applied, with a minor fix. See below.

Thanks,
Guenter

> ---
>  Documentation/hwmon/index.rst  |   1 +
>  Documentation/hwmon/mp5926.rst |  92 ++++++++++++++++
>  MAINTAINERS                    |   7 ++
>  drivers/hwmon/pmbus/Kconfig    |   9 ++
>  drivers/hwmon/pmbus/Makefile   |   1 +
>  drivers/hwmon/pmbus/mp5926.c   | 185 +++++++++++++++++++++++++++++++++
>  6 files changed, 295 insertions(+)
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
> index 000000000000..234a3e58f7e7
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/mp5926.c
> @@ -0,0 +1,185 @@
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
> +		}
> +		return PB_VOUT_MODE_DIRECT;
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
> +		if (data->vout_mode == linear)
> +			ret = ((s16)((ret & 0x7ff) << 5)) >> 5;
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
> +			dev_err_probe(&client->dev, ret, "Can't get vout exponent.");
> +			return ret;

			return dev_err_probe(&client->dev, ret, "Can't get vout exponent.");

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
