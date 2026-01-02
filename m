Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430122BE7DD
	for <linux-hwmon@vger.kernel.org>; Fri,  2 Jan 2026 16:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767371295; cv=none; b=c7G6pzbUvXSirF7MzT1sW0zSVQAiipsoIS3LlwpA49kq4XHGtIplw7lbiKuQ1/rKbiZgjQY0IkBRax+EdHnSmBxPSG9yd/9qY32vP/dGego5JUq6qyC9tWvIV4N/PWPrnYIPec9cHV4KAYM9MQ+HBXKdmxKx1fB3OdLlgAhIT68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767371295; c=relaxed/simple;
	bh=TV2ZrXsujKYPbBId+T4oh8LuO/XNkZ0hJQCFCRsOEbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oSsoA6Hao1NMsQi6o/zCxt8dDOPfgxxYvMzeKdFpmYSzezdCH7xoBnA+OY6mHPFSfyQj8DfnveGmCoZdhzo+ZGUAiFw+46mRCER4m+UcHKHApN8YyL8YZI1AnR6h5KSM2v84Uc2wbz36pohGQ3nXOOeuwJWpFaATisdg6CaKAF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JVpnPriG; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JVpnPriG"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a0ac29fca1so102535905ad.2
        for <linux-hwmon@vger.kernel.org>; Fri, 02 Jan 2026 08:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767371291; x=1767976091; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E8+A+yf4zi4aisISZCe5JsXf4y6Jgf2TIS9vv5oBPsw=;
        b=JVpnPriG7mVocDysEZiCKm/YfUQhpFPQ2RfHlQK9zAeAtj3O+wLXoqo+GYTXWjksQh
         VtqKjallQrfDEuV+THazMhEWcEq088NeOL3Yx2YZBlJGOOY/qsd2h3wNv2vG+SgJZeOP
         bqvSFQoz/TItnxGWJ67ww+VpdSltHvSB9GgwizLlO2UeJaQbvNdBQyuM3xgEy/MCvf64
         yuLUb4ivLEfJC3mH5ITaWbklGjByaA5xHxQzvNJ56rv5xD78jLAJGnLLj3+nwFgdiuii
         630UCTYpmjmln4yD6s23pSuPHOqawNPHLawmfuBFAoTWXH50o/aRZuXVpu1GD4thto62
         itDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767371291; x=1767976091;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E8+A+yf4zi4aisISZCe5JsXf4y6Jgf2TIS9vv5oBPsw=;
        b=m7rmnu4yzmcohBomzx3JDDsH8cNe9F+Et2zi0gFrgczrh1E62EOc7uRs4HwWA/W7Ln
         s4lEbzuPqxNV1EwpINTlhxUCAJtUGUeBqCvM5KkfdHr+LAnWU8OE+GaWQODy+TMI+e5b
         LEDi3DQ/A41YJSiPHfc8QeHvP80VfgP9miIdRVCq5wpBTbPzD2iHwKl6omz75RhrJSBC
         h6RlSD6wtVu1IMP/LFEwHSIvCEnO+LXPKCa2ZN3wAxCulKWX+b9ISHJs3elQytpdCua4
         4k8bJbuwyFFrSA4y4dUy1UX8qbP7Ibo2gUr6stUl3Iue+4wVvIhiP1/9vz/Cg0vz05k9
         xOUA==
X-Gm-Message-State: AOJu0YwIvf1MMOfs3RJsQK6d2Fu+hQ5N0lKlUZ2hJFxc3w98EUyEqlZ8
	6t9Tx1bpzTTG0d8QLVxX8NXUMdn9YumKM+xkIyv27Fe1HwD758el8l3o
X-Gm-Gg: AY/fxX7rQx5kN8ZqSN0Ui4IevuswvjiUJBaevV0t7A8UdceeVp7klCqrVBP8u9+d3Re
	y7pKiUHQ0xz5ZpY1NUPOmYq4CyTaRPUZ8D9EhULhjsovy6g/KDI6VXhaZMkShsBHd/PZ4/+o0gw
	d6RLGPm3MZmAGEiLLka61gIGbCmrEPGHAER21EBuQGV7O/cQulooxlGNVAKcPtceyZs27RH/ith
	tAW1Ml4AJoScf6HKUG19Gaea5uE4OzPbvGtlIyMtlUTKZgOKBURcfdmxNXK/C7jOL/Jlk5ULDj3
	pOMBfmdo3jb9Gu11rUmiF4Dp/cSCW2IYDnzILcV+fXNuaSIEjsVU97beaUVMn3QWFsv751T6u1l
	PAlWZttivEyDUCnoRN8DrUkUhnxRurTAwsnxl7MOKN+jncu/8T2lRExqbpmkLoZHTpYbvt3p2Oc
	xzmom2VDFc+0IMOmtwlbgoiotv
X-Google-Smtp-Source: AGHT+IHq6CpRNC7XC5DMaqlcaJA/WWs49pHs5VSRG5FK3VXCxmatrwKsElFHZgPozRkQUWobwL5tEQ==
X-Received: by 2002:a05:7022:238f:b0:11f:3483:bbb2 with SMTP id a92af1059eb24-121722aae15mr37438449c88.12.1767371291174;
        Fri, 02 Jan 2026 08:28:11 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm156452141c88.4.2026.01.02.08.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 08:28:10 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 2 Jan 2026 08:28:09 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: ASHISH YADAV <ashishyadav78@gmail.com>
Cc: linux-hwmon@vger.kernel.org, ASHISH YADAV <Ashish.Yadav@infineon.com>
Subject: Re: [PATCH]  hwmon:(pmbus/tda38740a) Add driver for Infineon
 TDA38740A/TDA38725A Voltage Regulator
Message-ID: <92d6c340-f18a-4d50-a967-57c3ba8aefbf@roeck-us.net>
References: <20251231105503.77881-1-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251231105503.77881-1-Ashish.Yadav@infineon.com>

On Wed, Dec 31, 2025 at 04:25:03PM +0530, ASHISH YADAV wrote:
> Add the pmbus driver for the Infineon TDA38740A/TDA38725A
>        voltage regulator.
> 
> Signed-off-by: ASHISH YADAV <Ashish.Yadav@infineon.com>
> ---
>  .../hwmon/pmbus/infineon,tda38740a.yaml       |  73 ++++++
>  drivers/hwmon/pmbus/Kconfig                   |  16 ++
>  drivers/hwmon/pmbus/Makefile                  |   1 +
>  drivers/hwmon/pmbus/tda38740a.c               | 223 ++++++++++++++++++

Devicetree bindings and code changes need to be two separate patches, and
devicetree changes need to be reviewed by dt maintainers.

>  4 files changed, 313 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740a.yaml
>  create mode 100644 drivers/hwmon/pmbus/tda38740a.c
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740a.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740a.yaml
> new file mode 100644
> index 000000000000..07c8eb94807e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740a.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,tda38740a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Infineon TDA38740A and TDA38725A Synchronous Buck Regulator with I2C
> +
> +maintainers:
> +  - ASHISH YADAV <Ashish.Yadav@infineon.com>
> +
> +description: |
> +  The Infineon TDA38740A/TDA38725A is a 40A/25A Single-voltage Synchronous Buck Regulator with
> +  I2C designed for Industrial use.
> +
> +  Datasheet:
> +  https://www.infineon.com/assets/row/public/documents/24/49/infineon-tda38740a-tda38725a-datasheet-en.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - infineon,tda38725a
> +      - infineon,tda38740a
> +
> +  reg:
> +    maxItems: 1
> +
> +  vout_multiplier:

This most likely needs to be prefixed unless it is a standard
property.

Also, what is the use case ? The provided value is linear, meaning it is
self-adjusting. Also, the measurement is normally internal to the pin.
This needs further explanation.

> +    description: |
> +      If voltage multiplier present at vout, the voltage at voltage sensor pin
> +      will be scaled. The properties will convert the raw reading to a more
> +      meaningful number if voltage multiplier present. It has two numbers,
> +      numerator ie vout_multiplier[0] and denominator ie vout_multiplier[1].
> +      Therefore, the adjusted vout is equal to
> +      Vout = (Vout * vout_multiplier[0]) / vout_multiplier[1].
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 2
> +    maxItems: 2
> +
> +  regulators:
> +    type: object
> +    description:
> +      list of regulators provided by this controller.
> +
> +    properties:
> +      vout:
> +        $ref: /schemas/regulator/regulator.yaml#
> +        type: object
> +
> +        unevaluatedProperties: false
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        tda38740a@40 {
> +            compatible = "infineon,tda38740a";
> +            reg = <0x40>;
> +            vout_multiplier = <75 70>;
> +        };
> +    };
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index f3fb94cebf1a..e7d7ff1b57df 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -602,6 +602,22 @@ config SENSORS_TDA38640_REGULATOR
>  	  If you say yes here you get regulator support for Infineon
>  	  TDA38640 as regulator.
>  
> +config SENSORS_TDA38740A
> +	tristate "Infineon TDA38740A"
> +	help
> +	  If you say yes here you get hardware monitoring support for Infineon
> +	  TDA38740A/25A.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called tda38740a.
> +
> +config SENSORS_TDA38740A_REGULATOR
> +	bool "Regulator support for TDA38740A and compatibles"
> +	depends on SENSORS_TDA38740A && REGULATOR
> +	help
> +	  If you say yes here you get regulator support for Infineon
> +	  TDA38740A/25A as regulator.
> +
>  config SENSORS_TPS25990
>  	tristate "TI TPS25990"
>  	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 349a89b6d92e..f422c80cf3d8 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -58,6 +58,7 @@ obj-$(CONFIG_SENSORS_PXE1610)	+= pxe1610.o
>  obj-$(CONFIG_SENSORS_Q54SJ108A2)	+= q54sj108a2.o
>  obj-$(CONFIG_SENSORS_STPDDC60)	+= stpddc60.o
>  obj-$(CONFIG_SENSORS_TDA38640)	+= tda38640.o
> +obj-$(CONFIG_SENSORS_TDA38740A)  += tda38740a.o
>  obj-$(CONFIG_SENSORS_TPS25990)	+= tps25990.o
>  obj-$(CONFIG_SENSORS_TPS40422)	+= tps40422.o
>  obj-$(CONFIG_SENSORS_TPS53679)	+= tps53679.o
> diff --git a/drivers/hwmon/pmbus/tda38740a.c b/drivers/hwmon/pmbus/tda38740a.c
> new file mode 100644
> index 000000000000..4a51b773dcc4
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/tda38740a.c
> @@ -0,0 +1,223 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/**
> + * Hardware monitoring driver for Infineon Integrated-pol-voltage-regulators
> + * Driver for TDA38725A and TDA38740A
> + *
> + * Copyright (c) 2025 Infineon Technologies
> + */
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/regulator/driver.h>
> +#include "pmbus.h"
> +
> +#define TDA38725A_IC_DEVICE_ID	"\xA9"
> +#define TDA38740A_IC_DEVICE_ID	"\xA8"
> +
> +static const struct i2c_device_id tda38740a_id[];
> +
> +enum chips {
> +	tda38725a,
> +	tda38740a
> +};
> +
> +struct tda38740a_data {
> +	enum chips id;
> +	struct pmbus_driver_info info;
> +	u32 vout_multiplier[2];
> +};
> +
> +#define to_tda38740a_data(x)  container_of(x, struct tda38740a_data, info)
> +
> +static const struct regulator_desc __maybe_unused tda38740a_reg_desc[] = {
> +	PMBUS_REGULATOR("vout", 0),
> +};
> +
> +static int tda38740a_read_word_data(struct i2c_client *client, int page,
> +					int phase, int reg)
> +{
> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +	const struct tda38740a_data *data = to_tda38740a_data(info);
> +	int ret = 0;

Unnecessary variable initialization.

> +
> +	/* Virtual PMBUS Command not supported */
> +	if (reg >= PMBUS_VIRT_BASE) {
> +		ret = -ENXIO;
> +		return ret;

Unnecessary assignment to ret.

> +	}
> +
> +	switch (reg) {
> +	case PMBUS_READ_VOUT:
> +		ret = pmbus_read_word_data(client, page, phase, reg);
> +		pr_info("READ_VOUT Value:%d %d %d\n", ret, data->vout_multiplier[0],
> +					data->vout_multiplier[1]);

This is completely unacceptable noise.

Missing error check.

> +		ret = ((ret * data->vout_multiplier[0])/data->vout_multiplier[1]);

Space around '/'. "linear" properties have an exponent and mantissa.
The calculations do not take that into account.

> +		break;
> +	default:
> +		ret = pmbus_read_word_data(client, page, phase, reg);
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static struct pmbus_driver_info tda38740a_info[] = {
> +	[tda38725a] = {
> +		.pages = 1,
> +		.read_word_data = tda38740a_read_word_data,
> +		.format[PSC_VOLTAGE_IN] = linear,
> +		.format[PSC_VOLTAGE_OUT] = linear,
> +		.format[PSC_CURRENT_OUT] = linear,
> +		.format[PSC_CURRENT_IN] = linear,
> +		.format[PSC_POWER] = linear,
> +		.format[PSC_TEMPERATURE] = linear,
> +
> +		.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
> +			| PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
> +			| PMBUS_HAVE_IIN
> +			| PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
> +			| PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
> +			| PMBUS_HAVE_POUT | PMBUS_HAVE_PIN,
> +#if IS_ENABLED(CONFIG_SENSORS_TDA38740A_REGULATOR)
> +		.num_regulators = 1,
> +		.reg_desc = tda38740a_reg_desc,
> +#endif
> +	},
> +	[tda38740a] = {
> +		.pages = 1,
> +		.read_word_data = tda38740a_read_word_data,
> +		.format[PSC_VOLTAGE_IN] = linear,
> +		.format[PSC_VOLTAGE_OUT] = linear,
> +		.format[PSC_CURRENT_OUT] = linear,
> +		.format[PSC_CURRENT_IN] = linear,
> +		.format[PSC_POWER] = linear,
> +		.format[PSC_TEMPERATURE] = linear,
> +
> +		.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
> +			| PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
> +			| PMBUS_HAVE_IIN
> +			| PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
> +			| PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
> +			| PMBUS_HAVE_POUT | PMBUS_HAVE_PIN,
> +#if IS_ENABLED(CONFIG_SENSORS_TDA38740A_REGULATOR)
> +		.num_regulators = 1,
> +		.reg_desc = tda38740a_reg_desc,
> +#endif

Unless I am missing something, both declarations are the same, making it
pointless to have them separate.

> +	},
> +};
> +
> +static int tda38740a_get_device_id(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	u8 device_id[I2C_SMBUS_BLOCK_MAX + 1];
> +	enum chips id;
> +	int status;
> +
> +	status = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, device_id);
> +	if (status < 0) {
> +		dev_err(dev, "Failed to read Device Id\n");
> +		return status;
> +	}
> +
> +	pr_info("PMBUS IC DEVICE_ID:%s\n", device_id);

Unnecessary noise, and pr_info() is inappropriate.
> +
> +	if (!strncasecmp(TDA38725A_IC_DEVICE_ID, device_id, strlen(device_id))) {

The device seems to be a single-byte hex number, 0xa8 or 0xa9. What is the
point of using strncasecmp() for the ID match instead of just checking the
returned length and comparing the first byte directly ?

> +		id = tda38725a;
> +	} else if (!strncasecmp(TDA38740A_IC_DEVICE_ID, device_id, strlen(device_id))) {
> +		id = tda38740a;
> +	} else {
> +		dev_err(&client->dev, "Unsupported device\n");
> +		return -ENODEV;
> +	}
> +
> +	return id;
> +}
> +
> +static int tda38740a_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct tda38740a_data *data;
> +	enum chips id;
> +	int chip_id;
> +
> +	/* FUNC for I2C SMBUS */

Pointless comment.

> +	if (!i2c_check_functionality(client->adapter,
> +			I2C_FUNC_SMBUS_BYTE |
> +			I2C_FUNC_SMBUS_BYTE_DATA |
> +			I2C_FUNC_SMBUS_WORD_DATA |
> +			I2C_FUNC_SMBUS_BLOCK_DATA |
> +			I2C_FUNC_SMBUS_PEC))
> +		dev_warn(&client->dev, "One of the required Func not supported by I2C adapter.\n");

Either this is critical or not. If not, the warning is pointless.
If yes, the driver should bail out.

> +
> +	chip_id = tda38740a_get_device_id(client);
> +	if (chip_id < 0)
> +		return chip_id;
> +
> +	if (dev->of_node)
> +		id = (uintptr_t)of_device_get_match_data(dev);
> +	else
> +		id = i2c_match_id(tda38740a_id, client)->driver_data;
> +

Use i2c_get_match_data().

> +	if (chip_id != id)
> +		dev_warn(&client->dev, "Device mismatch: %d %d\n", id, chip_id);

Displaying the device ID is pointless here since that is an internal
value which doesn't mean anything to the user.

> +	else
> +		pr_info("Device Match %d %d\n", id, chip_id);

Unnecessary noise, and wrong use of pr_info(). Why are you using pr_info
randomly anyway ? This is odd.

> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +	data->id = chip_id;
> +	memcpy(&data->info, &tda38740a_info[chip_id], sizeof(data->info));
> +
> +	if (!of_property_read_u32_array(client->dev.of_node, "vout_multiplier",
> +				data->vout_multiplier, ARRAY_SIZE(data->vout_multiplier))) {
> +		pr_info("vout_multiplier from Device Tree:%d %d\n",
> +				data->vout_multiplier[0], data->vout_multiplier[1]);
> +	} else {
> +		pr_info("vout_multiplier not available from Device Tree");
> +		data->vout_multiplier[0] = 0x01;
> +		data->vout_multiplier[1] = 0x01;
> +		pr_info("vout_multiplier default value:%d %d\n",
> +				data->vout_multiplier[0], data->vout_multiplier[1]);
> +	}
> +
> +	return pmbus_do_probe(client, &data->info);
> +}
> +
> +static const struct i2c_device_id tda38740a_id[] = {
> +	{"tda38725a",  tda38725a},
> +	{"tda38740a",  tda38740a},
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, tda38740a_id);
> +
> +static const struct of_device_id __maybe_unused tda38740a_of_match[] = {
> +	{.compatible = "infineon,tda38725a", .data = (void *)tda38725a },
> +	{.compatible = "infineon,tda38740a", .data = (void *)tda38740a },
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, tda38740a_of_match);
> +
> +/**
> + *  This is the driver that will be inserted
> + */

Useless comment.

> +static struct i2c_driver tda38740a_driver = {
> +	.driver = {
> +		.name = "tda38740a",
> +		.of_match_table = of_match_ptr(tda38740a_of_match),
> +	},
> +	.probe = tda38740a_probe,
> +	.id_table = tda38740a_id,
> +};
> +
> +module_i2c_driver(tda38740a_driver);
> +
> +MODULE_AUTHOR("Ashish Yadav <Ashish.Yadav@infineon.com>");
> +MODULE_DESCRIPTION("PMBus driver for Infineon IPOL");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("PMBUS");
> -- 
> 2.39.5
> 
