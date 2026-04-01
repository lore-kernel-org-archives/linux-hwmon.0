Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09873D811A
	for <linux-hwmon@vger.kernel.org>; Wed,  1 Apr 2026 23:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775085305; cv=none; b=G0lDjMGPJqUsvF/f5VWMKSnu5MY6vVndWQgQjt6lR3A25DSMsBZAQGjhK4fdit4YXejfSfDZn8NSr2f/Mb94NOBpnuLB8GExcbyvY1uVZBo73ohXvPeT7cs80kImN87x+1kOphkraXBoaUcQVpRTLit6QgsNOpMuu5TUsNrcq1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775085305; c=relaxed/simple;
	bh=YwJJf7/a4t3nYki98nbuDWrNITsOCPBXSrvdusNiMTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FXBrsCjZ+zwx3wWWy4iIffuGOOoCUkz82aIgUHlxfcDUZi7P7CPiyEh2895wQhfnEVfMIQOkLhc7YxwYaFt3DUGe3hMH6TfRY+pBDR5jYaOop43AiclteAa71CpAP+N25SZXRqNvv9ZxfScnlfgucCMDceyc1QWm8B9fdgR9lEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXXOGkoG; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXXOGkoG"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2c4db6bca03so125997eec.1
        for <linux-hwmon@vger.kernel.org>; Wed, 01 Apr 2026 16:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775085300; x=1775690100; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=HvgkhlZHyoGXhD82N9kvhL1NVejfNLCCRdXgy+tebnE=;
        b=FXXOGkoGgEI/aAdyRjvfe3LDxZNmEri0j6R0Jq4SHe1EwTjsHp/jviuB8PTp6rdl77
         jCbflrS72E0YwPmmt2QTJaJTV6dk1cRNpvw5MXvPrRdMn753EsZwi005/qaDkbPmHkP4
         DFkc+eVyHj8qJbKHkNnxX6HyORVwpsR6Qst6nxJMjM6X5q+ijMUGm4CwBjbDI39sfoxL
         uBSxXgphHvidIaprPjAZfgY24dw8G9CDIT6MABg2llSIqbFMnjjM0HWTFtTQCf6YQuRm
         zxGpzU6meCye8JP8Vb5GQFMeQroQLd/f26BMdINRk4ioE21Hv6iC4diuGJ+iI2kgu5Xv
         yqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775085300; x=1775690100;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HvgkhlZHyoGXhD82N9kvhL1NVejfNLCCRdXgy+tebnE=;
        b=sgPYjopQx0mXZJXLGXZfB/CHH7xUNp+xeD3UT2mv544Lp+YCJqT/sNfbcJwOM4oHo/
         tBh7S/IURFAeT0pKGAXXf/1e4ZgaN8ifCmvjV1Vklv5/A7glZPAC27BbbSRVcAummv/A
         DHSoRVmAZ6X7DxMe3zKA4bYMngtCejGRTlb58QcpQnkDqHsEB34/GDFCjqu+DnNCxRNX
         RFOOpCNAHmo21p7QW60JNyRmlI30LnNEI68rJmmJ7VUC3WYgd4VgLHQqRMaDhiRm4WHH
         qN3TApwRS2p1/4Iuk2SGKVkw0L97ztq3+soDwUJwldUvQ0eN77PdSFIfDqeljpqbVugb
         vyAw==
X-Forwarded-Encrypted: i=1; AJvYcCWiwG1+SFxiE/c5f6ym0tb1tDV1uH5nzU9fZ2gwkGsILV3wSKek5gYxeshr/R8uxdIQZDKX8XZVz9nWuw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx76jPkfMZO/njJeIypGKoYAdS8OnivWurD+RFAHBFzv0T9gj7L
	3VCicHwghoNNmWA2sj2vVuIzFJ2GJ/e1diu+Cz5KOQMKRW2BBe+8h8/D5bp+iQ==
X-Gm-Gg: ATEYQzyofLk2T2Dh8zw4I2qb7pqxlBiaJu0Gaa25QtordKCO0aIdXYeCe9z30wvIFKA
	l5blvNJPjjq071Po7Jpke5gPgGvLpW1doox8c6sSsh0nozNbSTGc3yyqHMryTgbtVY3paO3L1NW
	f1NHEzXOLXi7kD6XpNBrlXMAXmC5RZ5anV2z5yW57VaMH+2s/lQzugxzubbHuTn9hSCyip7aVnl
	1nLFGfz5O2vui2mtDUuZnjlzrenBc2QFsgLvwyRdVLHdCNIiqQ5quRm+MzrtJQqLtH6cMeGzASK
	eYkFdhfhdXRiQXagzJ+oFMFNSUsE7SWVeHPRXbt5s5puVJLRl6i935+07Mk8/LR4tZuDH27y1fa
	9DO/ZjdBfHcCIoctA6pBx10kuoRQagG7OgKoETYT0mgS6zVNrkkQLWIu0xkUl/H291yh3r+FceY
	RQRpDv7v4xwYm7wo2nsdNra2Fk+rd/FAbLPYH8ciXvzud6hcJ+x/3XeSaMfCnjLzHO0dRJ/x1o
X-Received: by 2002:a05:7300:cd8f:b0:2c4:e154:dc28 with SMTP id 5a478bee46e88-2cad905d2eamr120736eec.20.1775085299388;
        Wed, 01 Apr 2026 16:14:59 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca79e1d331sm1045925eec.13.2026.04.01.16.14.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 16:14:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <943979c4-6dbe-48a4-b604-6a235e03dbbb@roeck-us.net>
Date: Wed, 1 Apr 2026 16:14:57 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] hwmon: pmbus: Add support for Sony APS-379
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260401194235.2149796-1-chris.packham@alliedtelesis.co.nz>
 <20260401194235.2149796-3-chris.packham@alliedtelesis.co.nz>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260401194235.2149796-3-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Chris,

On 4/1/26 12:42, Chris Packham wrote:
> Add pmbus support for Sony APS-379 power supplies. There are a few PMBUS
> commands that return data that is undocumented/invalid so these need to
> be rejected with -ENXIO. The READ_VOUT command returns data in linear11
> format instead of linear16 so we need to workaround this.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
Sashiko is still not happy:

https://sashiko.dev/#/patchset/20260401194235.2149796-1-chris.packham%40alliedtelesis.co.nz

I think we can (hopefully) ignore the multi-page concerns, and the MODULE_IMPORT_NS
concern is obviously wrong.

However, there are a number of real possible issues:

- Is the linear11 format returned for PMBUS_READ_VOUT guaranteed to be positive ?
   Because if not, sign-extending and then clamping the result to [0, 0x3ff]
   would indeed be necessary (just masking to 0x3ff would still return a large
   positive value, so that would not work).

- PMBUS_IOUT_OC_FAULT_LIMIT: Good question. Reporting the value in % would
   indeed be wrong. Either the code or the documentation is wrong and must
   be adjusted.

- The concern about the exponent value from PMBUS_READ_VOUT during probe
   is really a good one. What does the command return if the power supply
   is turned off ? If it is not guaranteed to be static, it might be better
   to hard-code the exponent and adjust the actual runtime value if it happens
   to be different.

Thanks,
Guenter

> Notes:
>      Changes in v3:
>      - Add missing MODULE_DEVICE_TABLE(i2c, ...) and move aps_379_id to just
>        above the probe.
>      - Remove unnecessary sign_extend32
>      - Zero initialise array on stack
>      Changes in v2:
>      - Simplify code per recommendations from Guenter
>      - Add driver documentation
> 
>   Documentation/hwmon/aps-379.rst |  58 +++++++++++
>   Documentation/hwmon/index.rst   |   1 +
>   drivers/hwmon/pmbus/Kconfig     |   6 ++
>   drivers/hwmon/pmbus/Makefile    |   1 +
>   drivers/hwmon/pmbus/aps-379.c   | 169 ++++++++++++++++++++++++++++++++
>   5 files changed, 235 insertions(+)
>   create mode 100644 Documentation/hwmon/aps-379.rst
>   create mode 100644 drivers/hwmon/pmbus/aps-379.c
> 
> diff --git a/Documentation/hwmon/aps-379.rst b/Documentation/hwmon/aps-379.rst
> new file mode 100644
> index 000000000000..468ec5a98fd6
> --- /dev/null
> +++ b/Documentation/hwmon/aps-379.rst
> @@ -0,0 +1,58 @@
> +Kernel driver aps-379
> +=====================
> +
> +Supported chips:
> +
> +  * Sony APS-379
> +
> +    Prefix: 'aps-379'
> +
> +    Addresses scanned: -
> +
> + Authors:
> +        - Chris Packham
> +
> +Description
> +-----------
> +
> +This driver implements support for the PMBus monitor on the Sony APS-379
> +modular power supply. The APS-379 deviates from the PMBus standard for the
> +READ_VOUT command by using the linear11 format instead of linear16.
> +
> +The known supported PMBus commands are:
> +
> +=== ============================= ========= ======= =====
> +Cmd Function                      Protocol  Scaling Bytes
> +=== ============================= ========= ======= =====
> +01  On / Off Command (OPERATION)  Byte R/W  --      1
> +10  WRITE_PROTECT                 Byte R/W  --      1
> +3B  FAN_COMMAND_1                 Word R/W  --      2
> +46  Current Limit (in percent)    Word R/W  2^0     2
> +47  Current Limit Fault Response  Byte R/W  --      1
> +79  Alarm Data Bits (STATUS_WORD) Word Rd   --      2
> +8B  Output Voltage (READ_VOUT)    Word Rd   2^-4    2
> +8C  Output Current (READ_IOUT)    Word Rd   2^-2    2
> +8D  Power Supply Ambient Temp     Word Rd   2^0     2
> +90  READ_FAN_SPEED_1              Word Rd   2^6     2
> +91  READ_FAN_SPEED_2              Word Rd   2^6     2
> +96  Output Wattage (READ_POUT)    Word Rd   2^1     2
> +97  Input Wattage (READ_PIN)      Word Rd   2^1     2
> +9A  Unit Model Number (MFR_MODEL) Block R/W --      10
> +9B  Unit Revision Number          Block R/W --      10
> +9E  Unit Serial Number            Block R/W --      8
> +99  Unit Manufacturer ID (MFR_ID) Block R/W --      8
> +D0  Unit Run Time Information     Block Rd  --      4
> +D5  Firmware Version              Rd cust   --      8
> +B0  User Data 1 (USER_DATA_00)    Block R/W --      4
> +B1  User Data 2 (USER_DATA_01)    Block R/W --      4
> +B2  User Data 3 (USER_DATA_02)    Block R/W --      4
> +B3  User Data 4 (USER_DATA_03)    Block R/W --      4
> +B4  User Data 5 (USER_DATA_04)    Block R/W --      4
> +B5  User Data 6 (USER_DATA_05)    Block R/W --      4
> +B6  User Data 7 (USER_DATA_06)    Block R/W --      4
> +B7  User Data 8 (USER_DATA_07)    Block R/W --      4
> +F0  Calibration command           Byte R/W  --      1
> +F1  Calibration data              Word Wr   2^9     2
> +F2  Unlock Calibration            Byte Wr   --      1
> +=== ============================= ========= ======= =====
> +
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index b2ca8513cfcd..2bc8d88b5724 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -41,6 +41,7 @@ Hardware Monitoring Kernel Drivers
>      adt7475
>      aht10
>      amc6821
> +   aps-379
>      aquacomputer_d5next
>      asb100
>      asc7621
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index fc1273abe357..29076921e330 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -77,6 +77,12 @@ config SENSORS_ADP1050_REGULATOR
>   	  µModule regulators that can provide microprocessor power from 54V
>   	  power distribution architecture.
>   
> +config SENSORS_APS_379
> +	tristate "Sony APS-379 Power Supplies"
> +	help
> +	  If you say yes here you get hardware monitoring support for Sony
> +	  APS-379 Power Supplies.
> +
>   config SENSORS_BEL_PFE
>   	tristate "Bel PFE Compatible Power Supplies"
>   	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index d6c86924f887..94f36c7069ec 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -9,6 +9,7 @@ obj-$(CONFIG_SENSORS_ACBEL_FSG032) += acbel-fsg032.o
>   obj-$(CONFIG_SENSORS_ADM1266)	+= adm1266.o
>   obj-$(CONFIG_SENSORS_ADM1275)	+= adm1275.o
>   obj-$(CONFIG_SENSORS_ADP1050)	+= adp1050.o
> +obj-$(CONFIG_SENSORS_APS_379)	+= aps-379.o
>   obj-$(CONFIG_SENSORS_BEL_PFE)	+= bel-pfe.o
>   obj-$(CONFIG_SENSORS_BPA_RS600)	+= bpa-rs600.o
>   obj-$(CONFIG_SENSORS_DELTA_AHE50DC_FAN) += delta-ahe50dc-fan.o
> diff --git a/drivers/hwmon/pmbus/aps-379.c b/drivers/hwmon/pmbus/aps-379.c
> new file mode 100644
> index 000000000000..5446f663d0b5
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/aps-379.c
> @@ -0,0 +1,169 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Hardware monitoring driver for Sony APS-379 Power Supplies
> + *
> + * Copyright 2026 Allied Telesis Labs
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/pmbus.h>
> +#include "pmbus.h"
> +
> +struct aps_379_data {
> +	struct pmbus_driver_info info;
> +	u8 vout_linear_exponent;
> +};
> +
> +#define to_aps_379_data(x) container_of(x, struct aps_379_data, info)
> +
> +static int aps_379_read_byte_data(struct i2c_client *client, int page, int reg)
> +{
> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +	struct aps_379_data *data = to_aps_379_data(info);
> +
> +	switch (reg) {
> +	case PMBUS_VOUT_MODE:
> +		/*
> +		 * The VOUT format used by the chip is linear11,
> +		 * not linear16. Report that VOUT is in linear mode
> +		 * and return exponent value extracted while probing
> +		 * the chip.
> +		 */
> +		return data->vout_linear_exponent;
> +	default:
> +		return -ENODATA;
> +	}
> +}
> +
> +/*
> + * The APS-379 uses linear11 format instead of linear16. We've reported the exponent
> + * via the PMBUS_VOUT_MODE so we just return the mantissa here.
> + */
> +static int aps_379_read_vout(struct i2c_client *client)
> +{
> +	int ret;
> +
> +	ret = pmbus_read_word_data(client, 0, 0xff, PMBUS_READ_VOUT);
> +	if (ret < 0)
> +		return ret;
> +
> +	return ret & 0x7ff;
> +}
> +
> +static int aps_379_read_word_data(struct i2c_client *client, int page, int phase, int reg)
> +{
> +	switch (reg) {
> +	case PMBUS_VOUT_UV_WARN_LIMIT:
> +	case PMBUS_VOUT_OV_WARN_LIMIT:
> +	case PMBUS_VOUT_UV_FAULT_LIMIT:
> +	case PMBUS_VOUT_OV_FAULT_LIMIT:
> +	case PMBUS_PIN_OP_WARN_LIMIT:
> +	case PMBUS_POUT_OP_WARN_LIMIT:
> +	case PMBUS_MFR_IIN_MAX:
> +	case PMBUS_MFR_PIN_MAX:
> +	case PMBUS_MFR_VOUT_MIN:
> +	case PMBUS_MFR_VOUT_MAX:
> +	case PMBUS_MFR_IOUT_MAX:
> +	case PMBUS_MFR_POUT_MAX:
> +	case PMBUS_MFR_MAX_TEMP_1:
> +		/* These commands return data but it is invalid/un-documented */
> +		return -ENXIO;
> +	case PMBUS_READ_VOUT:
> +		return aps_379_read_vout(client);
> +	default:
> +		if (reg >= PMBUS_VIRT_BASE)
> +			return -ENXIO;
> +		else
> +			return -ENODATA;
> +	}
> +}
> +
> +static struct pmbus_driver_info aps_379_info = {
> +	.pages = 1,
> +	.format[PSC_VOLTAGE_OUT] = linear,
> +	.format[PSC_CURRENT_OUT] = linear,
> +	.format[PSC_POWER] = linear,
> +	.format[PSC_TEMPERATURE] = linear,
> +	.format[PSC_FAN] = linear,
> +	.func[0] = PMBUS_HAVE_VOUT |
> +		PMBUS_HAVE_IOUT |
> +		PMBUS_HAVE_PIN | PMBUS_HAVE_POUT |
> +		PMBUS_HAVE_TEMP |
> +		PMBUS_HAVE_FAN12,
> +	.read_byte_data = aps_379_read_byte_data,
> +	.read_word_data = aps_379_read_word_data,
> +};
> +
> +static const struct i2c_device_id aps_379_id[] = {
> +	{ "aps-379", 0 },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(i2c, aps_379_id);
> +
> +static int aps_379_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct pmbus_driver_info *info;
> +	struct aps_379_data *data;
> +	u8 buf[I2C_SMBUS_BLOCK_MAX + 1] = { 0 };
> +	int ret;
> +
> +	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	memcpy(&data->info, &aps_379_info, sizeof(*info));
> +	info = &data->info;
> +
> +	if (!i2c_check_functionality(client->adapter,
> +				     I2C_FUNC_SMBUS_READ_BYTE_DATA
> +				     | I2C_FUNC_SMBUS_READ_WORD_DATA
> +				     | I2C_FUNC_SMBUS_READ_BLOCK_DATA))
> +		return -ENODEV;
> +
> +	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to read Manufacturer Model\n");
> +		return ret;
> +	}
> +
> +	if (strncasecmp(buf, aps_379_id[0].name, strlen(aps_379_id[0].name)) != 0) {
> +		buf[ret] = '\0';
> +		dev_err(dev, "Unsupported Manufacturer Model '%s'\n", buf);
> +		return -ENODEV;
> +	}
> +
> +	ret = i2c_smbus_read_word_data(client, PMBUS_READ_VOUT);
> +	if (ret < 0) {
> +		dev_err(dev, "Can't get vout exponent.\n");
> +		return ret;
> +	}
> +	data->vout_linear_exponent = (u8)((ret >> 11) & 0x1f);
> +
> +	return pmbus_do_probe(client, info);
> +}
> +
> +static const struct of_device_id __maybe_unused aps_379_of_match[] = {
> +	{ .compatible = "sony,aps-379" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, aps_379_of_match);
> +
> +static struct i2c_driver aps_379_driver = {
> +	.driver = {
> +		.name = "aps-379",
> +		.of_match_table = of_match_ptr(aps_379_of_match),
> +	},
> +	.probe = aps_379_probe,
> +	.id_table = aps_379_id,
> +};
> +
> +module_i2c_driver(aps_379_driver);
> +
> +MODULE_AUTHOR("Chris Packham");
> +MODULE_DESCRIPTION("PMBus driver for Sony APS-379");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("PMBUS");

