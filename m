Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9C922258C
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Dec 2025 07:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765179548; cv=none; b=n2abzSsaHXEqMjJGSDcAxPtRIwl65e5fOXOMP1/S/fYjFafGKpyLVFdmPihKenQ80oauxGZfRgffuIM7DatJeSnlA4PmG3XIzYkMsBMxjVjKAUTtUoNWmIbxhm1HkL8SoMz42TmzW9ZNXGvsxB1LtMUybkojZnNFdBIw3aVAQMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765179548; c=relaxed/simple;
	bh=zYh00H4ZXzq3PWkS/1ENfQH85iOSx8Rq3hrnOQ0fPwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZLtrnDWjmh1VvolNNHtxZSfBY9LGC4kT2qk9PgBZD/1b3FpLzbLMmGW7UxzVwDK0hTnH096EJMQa6qJY9F1D5Ul1l2wl63lajKKJ7NpLZsUBoJ6WhBTWGZz/DYPFrDxfbhQMjZW8+6lpJsWIY3byq8xcv5Jj/mzhLb8czHwkzhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NGkIc/4J; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NGkIc/4J"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b98983bae8eso3289859a12.0
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Dec 2025 23:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765179544; x=1765784344; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yXDnfOTk0bKHOljlc8hqbi3cRVbO+lOwhLyhsOiAOaY=;
        b=NGkIc/4J86vTLALv+Pxw4zkgJzElfSxY0Q2fdB1HXuqTMRBmwLDzDV1Qr/QdA2s2Eb
         C+1hij8LgtfV840KYh+15oD7o9Lwp1uOItd45OdNxeyTICPpwY10hdm5DFlRF9C8stmx
         eKYNInwHrosVRW7JHgu8lzUsEuOpChaLynutWGWHiqueHCFp3HXcbDZeSu4IGsquTv0g
         jpNz+NmVDvrbqoBLvnkGVi15Rf7uYHiJBnlNkZSc2+Kx7UmDUmyMg90XAYSMtU6MtUHP
         7b5n9cEEC5R1esaDivElVQIP8kXoc24cRuFipjo9yAfuWSLjBNL/Z3fcw/wvwSVw2TGl
         JIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765179544; x=1765784344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yXDnfOTk0bKHOljlc8hqbi3cRVbO+lOwhLyhsOiAOaY=;
        b=c49QtVZniioAP59PruHECzlxycT3p4QOsqlP/0i0hy/eOr1MlD0f3AiI4WR66d4yA+
         M21gCeWIiAhJGPicUj0cvZ/npHzRWN22LMBVtyiF1q5uYZkph4WtpOrW3ZS5wGkOeSpX
         DZtRIx/5RoNH3BnCxnb4C/leMgec1mIE96cNLXt5cUOQw4fCgB8PqKGW+bbqmUlTJID9
         AAaeAdL2dImMFm32/9DVRm8CJZa3YqZ/STfjS/ZqjTEfpzepGdvigKUDaPYK1e40I7sN
         +RUhSDoTCSqbAZiU891vq4tWjwpmSU1nDdmwXC5qXcP/e3RRC1mG3GIuctbnvNmosRHB
         FW2A==
X-Forwarded-Encrypted: i=1; AJvYcCUMNXoXt81/otR9fiOTzKRjeyjrxURgRg3p9lPOLwY3ttFy/Hu3BjwBs3pHpT7zT3ztDcHn3G+YuvsLdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YylFvMjOC89MMbhOrM1L4QYocZph06rw93fni7jlVwy7a8+IHeC
	RxllLhSTJanP6ppL8bLAGn4PvMikXp1V5DiP+SlnF4h1LEDMq1Sh8k5G
X-Gm-Gg: ASbGncunZAigQVU+TrzW4rHpCzfcgwLKolMfmB6HYLLNAPrF8vVMj8gOIDAzUVJJtd+
	nbbjR8lB09lAk3RPsN3ZbEs8STMvqQJcDau/RYmQ5tAzxjf88sL+Zelyp0JDZxVbGPT7AfiEvll
	jPBNceVGe4Lkfj4CHcRHThuRnwawqwUHz8e32gLmDzLT48fXmwotJVQlGlVsKuv1OxT5xo50ENm
	WzN2zQ9v/EF9mopOm3H+bhPmGgiNT3AgDMSzdJ2Ah62QlgYOGF7wCX8hFK1kGYwyHFyV2PEYZcH
	wC0AqWIazNE7CSmCE4GbcPFlWkwdkfuTmyoQDY0TS2LZioPPjmjM+Zfh91s/epdikg1/qC2zLXF
	pmY0yy9Vj/91mVLB+ogALKc9ztABcZeiFWF0T8bqJFQYFxyFmIH2O3FknFTMy2TdGgILGpkvppF
	rKZnd3qf3j9LA7Il6vBDNiyxCG7pY4OKOgTw==
X-Google-Smtp-Source: AGHT+IFgFOAKUJZOhYYNZpiFMZ8LUUma7b6IZuq74P5uVZsA19ajYX5KWm5sGaeJqtccZPJYMMSSLw==
X-Received: by 2002:a05:7300:e8a5:b0:2a6:a306:eff5 with SMTP id 5a478bee46e88-2abc70f7acfmr3810082eec.5.1765179544282;
        Sun, 07 Dec 2025 23:39:04 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df7573508sm38310688c88.3.2025.12.07.23.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 23:39:03 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 7 Dec 2025 23:39:01 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
Cc: corbet@lwn.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, wyx137120466@gmail.com,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: add mp5926 driver
Message-ID: <5f83f1f7-2ddd-4f4b-9c6f-f69aafcd8693@roeck-us.net>
References: <20251208071659.1157-1-Yuxi.Wang@monolithicpower.com>
 <20251208071659.1157-3-Yuxi.Wang@monolithicpower.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208071659.1157-3-Yuxi.Wang@monolithicpower.com>

On Mon, Dec 08, 2025 at 03:16:59PM +0800, Yuxi Wang wrote:
> Add support for MPS mp5926.
> Signed-off-by: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
> ---
>  Documentation/hwmon/index.rst  |   1 +
>  Documentation/hwmon/mp5926.rst |  92 ++++++++++++++++
>  MAINTAINERS                    |   7 ++
>  drivers/hwmon/pmbus/Kconfig    |   9 ++
>  drivers/hwmon/pmbus/Makefile   |   1 +
>  drivers/hwmon/pmbus/mp5926.c   | 192 +++++++++++++++++++++++++++++++++
>  6 files changed, 302 insertions(+)
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
> index f3fb94cebf1a..0a6699fa976a 100644
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
> +	  be called MP5926.
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
> index 000000000000..e86ec1ec0584
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/mp5926.c
> @@ -0,0 +1,192 @@
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
> +/*Common Register*/

Useless (and, in fact, misleading) comment

> +#define PAGE	0x01

That is not a register, it is used as the number of pages.

> +#define EFUSE_CFG 0xCF
> +#define I_SCALE_SEL 0xC6

Please align properly with tab after name.

#define<space>NAME<tab>value

> +#define MP5926_FUNC	(PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | \
> +			PMBUS_HAVE_IIN | PMBUS_HAVE_PIN | \
> +			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_INPUT | \
> +			PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_STATUS_VOUT)

Add empty line

> +static int mp5926_read_word_data(struct i2c_client *client, int page, int phase,
> +				 int reg)
> +{
> +	int ret;
> +	s16 exponent;
> +	s32 mantissa;
> +	s64 val;
> +
> +	switch (reg) {
> +	case PMBUS_READ_VIN...PMBUS_READ_VCAP:
> +	case PMBUS_READ_IOUT...PMBUS_READ_TEMPERATURE_1:
> +	case PMBUS_READ_PIN:
> +	case PMBUS_STATUS_WORD:
> +		ret = -ENODATA;
> +	break;
> +	case PMBUS_READ_VOUT:
> +	// The Vout format used by the chip is linear11 and not linear16.
> +	// So we transform the value into the direct format defined by PMBus.
> +	ret = i2c_smbus_read_word_data(client, EFUSE_CFG);
> +	if (ret < 0)
> +		return ret;

Reading the value of EFUSE_CFG again and again is
unnecessary. Just read it once in the probe function
and store it in a local data structure.

Also, it is not entirely clear to me why mp5926_read_word_data
is even needed in direct mode. Please add a comment with an
explanation.

> +	if (ret & BIT(12)) {
> +		ret = i2c_smbus_read_word_data(client, PMBUS_READ_VOUT);
> +		if (ret < 0)
> +			return ret;
> +		exponent = ((s16)ret) >> 11;
> +		mantissa = ((s16)((ret & 0x7ff) << 5)) >> 5;
> +		val = mantissa * 1000;
> +		if (exponent >= 0)
> +			val <<= exponent;
> +		else
> +			val >>= -exponent;
> +		val = div_s64(val * 10 + 313L, 625L);
> +		return val;
> +	}
> +	ret = -ENODATA;
> +	break;

Alignment is off. Please fix.

> +	default:
> +		ret = -EINVAL;
> +	break;
> +	}
> +
> +	return ret;
> +}
> +
> +static int mp5926_read_byte_data(struct i2c_client *client, int page,
> +				 int reg)
> +{
> +	int ret;
> +
> +	switch (reg) {
> +	case PMBUS_STATUS_BYTE:
> +	case PMBUS_STATUS_VOUT:
> +	case PMBUS_STATUS_INPUT:
> +	case PMBUS_STATUS_TEMPERATURE:
> +	case PMBUS_STATUS_CML:
> +	case PMBUS_STATUS_MFR_SPECIFIC:
> +	   ret = -ENODATA;
> +	break;

Alignment.

> +	default:
> +		ret = -EINVAL;

Why is this needed ? This warrants an explanation.

> +	break;

Alignment

> +	}
> +	return ret;
> +}
> +
> +static struct pmbus_driver_info mp5926_info_linear = {
> +	.pages = PAGE,
> +	.format[PSC_VOLTAGE_IN] = linear,
> +	.format[PSC_CURRENT_IN] = linear,
> +	.format[PSC_VOLTAGE_OUT] = direct,
> +	.format[PSC_TEMPERATURE] = linear,
> +	.format[PSC_POWER] = linear,
> +
> +	.m[PSC_VOLTAGE_OUT] = 16,
> +	.b[PSC_VOLTAGE_OUT] = 0,
> +	.R[PSC_VOLTAGE_OUT] = 0,
> +
> +	.read_word_data = mp5926_read_word_data,
> +	.read_byte_data = mp5926_read_byte_data,
> +	.func[0] = MP5926_FUNC,
> +};
> +
> +static struct pmbus_driver_info mp5926_info_direct = {
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
> +	.R[PSC_TEMPERATURE] = 3,
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
> +	int ret;
> +
> +	if (!i2c_check_functionality(client->adapter,
> +				     I2C_FUNC_SMBUS_READ_BYTE_DATA
> +				     | I2C_FUNC_SMBUS_BLOCK_DATA))
> +		return -ENODEV;

That functionality check warrants an explanation. Why check
if block data read is supported ? It is not used anywhere.
But then i2c_smbus_read_word_data _is_ called below but its
support is not checked. That does not really make sense.

> +	ret = i2c_smbus_read_word_data(client, EFUSE_CFG);
> +	if (ret < 0)
> +		return ret;
> +	if (ret & BIT(12)) {
> +		ret = pmbus_do_probe(client, &mp5926_info_linear);
> +	} else {
> +		ret = i2c_smbus_read_word_data(client, I_SCALE_SEL);
> +		if (ret < 0)
> +			return ret;
> +		if (ret & BIT(6))
> +			mp5926_info_direct.m[PSC_CURRENT_IN] = 4;
> +		ret = pmbus_do_probe(client, &mp5926_info_direct);

Use a local variable for the pointer to the info structure,
and call pmbus_do_probe() only once.

> +	}
> +	if (!ret)
> +		dev_info(&client->dev, "%s chip found\n", client->name);

Please drop this noise.

> +	return ret;
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
> +		.name = "mp5926",
> +		.of_match_table = mp5926_of_match,
> +	},
> +	.id_table = mp5926_id,
> +};
> +
> +module_i2c_driver(mp5926_driver);
> +MODULE_AUTHOR("Yuxi Wang <Yuxi.Wang@monolithicpower.com>");
> +MODULE_DESCRIPTION("MPS MP5926 HWMON driver");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("PMBUS");
