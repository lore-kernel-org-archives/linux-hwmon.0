Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3084211A19;
	Fri, 10 Jan 2025 16:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736526125; cv=none; b=jdJdloCGB23bwnbK7YuvSHrcxOm5XDPQgdwrCBjS8c586W0vVnPE4U+6LK3NAbPVUQLVECzoOXvncgx1r0s9orThFWL+Q4+wb/6kkaTl6YTQbX+ppvnnmOYa/BOROcbSXsncqf51CyjwnbARaBBHlsXcNniesa6Ht9H9IsbTLF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736526125; c=relaxed/simple;
	bh=oCdGx+as79PI6hM9FNReFDF49yt6pyfqnCFLeZ5BK70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V6ZToMZsBnqF4u8ThQy70+ke2Rbhvvuz4ajL3xUz77RBrwy+5eRkJSHqS5HgtFuLlOZ6tz1uXJh8kvPk6ivrFNgOy4ZvvF94rTVYRqTkJcUgNgiuBQ8CpEsTilUGCAN+v3J2BpVNq7jbQ9fzEVcOPgMu11zA9pCEwhk7RQ9qaMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQRnEc13; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQRnEc13"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2163dc5155fso40886205ad.0;
        Fri, 10 Jan 2025 08:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736526123; x=1737130923; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=K51RVU9Ux4R08hHe+nuiTfYB9EXYAccFcEfd5h37HQY=;
        b=QQRnEc13x3MuFc2zgsGRKFFOYj+sY2VtlCMBMckI56DtvXtn83WtNF9niwx5zQHhYF
         1plNO/FxYCaZDIESey0TJE5C2pfD4LPpRGjI+Ky9CEx0Ub0CslHPAeE+fW+gcA6Pzhxv
         bdS5u8/2JRmSOi0G7ma0qDrDBHe5bHyQQjV8AZOTJ7VFFyi4OLR42H+IcMcix5AQOA/A
         4+ZjYWJF1xdaGQfH8Zs8pjDL8W2XYoGj1SnB99mW8WaIfAhfXM57u+eImaI2tsjQeqeD
         /sTdomNM9jNKnQX1kdz7bruPxfTGMUrjyhHswQtwphfM2c0YqRL1tg8A9FNBpsaSVfpp
         bl5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736526123; x=1737130923;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K51RVU9Ux4R08hHe+nuiTfYB9EXYAccFcEfd5h37HQY=;
        b=bYkgZ2+8HW4wVfY388qQGzIV0feEN9T/qCiTpp8kdXPuIS7X1lPwdCIum4hQo2s8MY
         miT5LnGaIHAMWAdGSE8THCJR+msp/9XkS38C2NzB1uXXfJdanhHarVq3/l9c5lDHKKOZ
         b+Q5vopXNSfiFF3gWXhdSBSN6LZYAwzeaMh1ljzhPdMJXo8b93fq/bmf/bQKFtp6z4zW
         AQkCZ3Vi+Cg4rG8ViFyflc4duB65bl5TFs64K5xIyILAILMN7lR8CRiZn7q0KIsN/P2+
         EMbIlcwH0No/2AksatTATtx1lqiRPhV15y4Y69eYjhOp0kPcAcHfwHT1W3DdDs06cn9c
         8x5g==
X-Forwarded-Encrypted: i=1; AJvYcCUxbzji7Vh5/Vts0RKSuhSVRjZO3Ott1LYdhDO9XcVXratf8KIvr+4QnO1cb8k6tuRp1QWZzWQcnDUu@vger.kernel.org, AJvYcCVnqGWIeCSEk0iQpr6HAoNAE/8MCZlJ1FtassliT2vuF6pOIPF0aF6FD4hXDdezbh01RREzw1420e4I@vger.kernel.org, AJvYcCVoCP/yk0lYideSQD3Q4s8mYTXcDic6wM75a/bDdBpLY73wcmhOvCfKheTERtWXgH8onSPI4Fn37pj3uoYP@vger.kernel.org, AJvYcCVxLe5OlMhr9DV/HmouvTYGfRCqPhjhHB3Yso43fKrEIm7lKEad3O8FH4freGX50AZ0t7imFuZzeBQIbt8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvh65dibPkUnLkILykDPqnmk/1E9DidWxVQV5EIw7kPUprWr7H
	Q1UueJWsBiBhEhFIpkaTTtizowoZnP0krfw0YENbwIs76raXXp5s
X-Gm-Gg: ASbGnctT/v5fK1HYHgoWI4XeIXNQIPCUcMGVHtHudbakRuV2FJ5xr3lJSdvXwVi7T42
	Ng7XU4k3ikjfYyvwt/Sw3Qq8PDWPRh6B7tPGZ/dxeTPEOMRpeQd0fFsgLcxXOTconrdVwZqWRaz
	YQVBsDiqdU+qhmMtVIxPdHGoN0Ce+wHQY5ar9j+jduSb+f2shY+hkQLin2f+F1iBYe1plRT5Ekh
	m02cTiVzz8JE/rR0k0GTD/poEYhd7xEbUKLzOTMIVEDPi/29AV9eHKJcBZpGf/ZHMwQYEUH20li
	pcXmqsqI6bGv3oDluMAl7CDdJVhv+g==
X-Google-Smtp-Source: AGHT+IH9rcLIPOvjnADnrxvd5q2UGsOWnaIzKt6R4/LgYKLI1vC/A0RjS+tywApNzHtGpPVM4pA/jQ==
X-Received: by 2002:a17:902:f644:b0:216:59ed:1aa3 with SMTP id d9443c01a7336-21a83f70f0fmr153965065ad.27.1736526123031;
        Fri, 10 Jan 2025 08:22:03 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f12f8dcsm15635605ad.66.2025.01.10.08.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 08:22:02 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <190bb6f2-7bbe-4145-b45f-4ad6672884b8@roeck-us.net>
Date: Fri, 10 Jan 2025 08:22:00 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hwmon: Add driver for TI INA232 Current and Power
 Monitor
To: Leo Yang <leo.yang.sy0@gmail.com>, jdelvare@suse.com, robh@kernel.org,
 davem@davemloft.net, krzk+dt@kernel.org, conor+dt@kernel.org,
 Leo-Yang@quantatw.com, corbet@lwn.net, Delphine_CC_Chiu@Wiwynn.com,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>
References: <20250110081546.61667-1-Leo-Yang@quantatw.com>
 <20250110081546.61667-3-Leo-Yang@quantatw.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250110081546.61667-3-Leo-Yang@quantatw.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/10/25 00:15, Leo Yang wrote:
> Support ina233 driver for Meta Yosemite V4.
> 

Irrelevant. Please drop.

The subject wrongly refers to INA232.

> Driver for Texas Instruments INA233 Current and Power Monitor
> With I2C-, SMBus-, and PMBus-Compatible Interface
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501092213.X9mbPW5Q-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202501061734.nPNdRKqO-lkp@intel.com/
> Signed-off-by: Leo Yang <Leo-Yang@quantatw.com>

Other feedback is on top of feedback from Krzysztof.

> ---
>   Documentation/hwmon/ina233.rst |  77 ++++++++++++++
>   MAINTAINERS                    |   8 ++
>   drivers/hwmon/pmbus/Kconfig    |   9 ++
>   drivers/hwmon/pmbus/Makefile   |   1 +
>   drivers/hwmon/pmbus/ina233.c   | 184 +++++++++++++++++++++++++++++++++
>   5 files changed, 279 insertions(+)
>   create mode 100644 Documentation/hwmon/ina233.rst
>   create mode 100644 drivers/hwmon/pmbus/ina233.c
> 
> diff --git a/Documentation/hwmon/ina233.rst b/Documentation/hwmon/ina233.rst
> new file mode 100644
> index 000000000000..41537f89bed5
> --- /dev/null
> +++ b/Documentation/hwmon/ina233.rst
> @@ -0,0 +1,77 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver ina233
> +====================
> +
> +Supported chips:
> +
> +  * TI INA233
> +
> +    Prefix: 'ina233'
> +
> +  * Datasheet
> +
> +    Publicly available at the TI website : https://www.ti.com/lit/ds/symlink/ina233.pdf
> +
> +Author:
> +
> +	Leo Yang <Leo-Yang@quantatw.com>
> +
> +Usage Notes
> +-----------
> +
> +The shunt resistor value can be configured by a device tree property;
> +see Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml for details.
> +
> +
> +Description
> +-----------
> +
> +This driver supports hardware monitoring for TI INA233.
> +
> +The driver is a client driver to the core PMBus driver. Please see
> +Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
> +
> +The driver provides the following attributes for input voltage:
> +
> +**in1_input**
> +
> +**in1_label**
> +
> +**in1_max**
> +
> +**in1_max_alarm**
> +
> +**in1_min**
> +
> +**in1_min_alarm**
> +
> +The driver provides the following attributes for shunt voltage:
> +
> +**in2_input**
> +
> +**in2_label**
> +
> +The driver provides the following attributes for output voltage:
> +
> +**in3_input**
> +
> +**in3_label**
> +
> +**in3_alarm**
> +
> +The driver provides the following attributes for output current:
> +
> +**curr1_input**
> +
> +**curr1_label**
> +
> +**curr1_max**
> +
> +**curr1_max_alarm**
> +
> +The driver provides the following attributes for input power:
> +
> +**power1_input**
> +
> +**power1_label**
> \ No newline at end of file
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c575de4903db..fde1713dff9d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11226,6 +11226,14 @@ L:	linux-fbdev@vger.kernel.org
>   S:	Orphan
>   F:	drivers/video/fbdev/imsttfb.c
>   
> +INA233 HARDWARE MONITOR DRIVER
> +M:	Leo Yang <Leo-Yang@quantatw.com>
> +M:	Leo Yang <leo.yang.sy0@gmail.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Odd Fixes
> +F:	Documentation/hwmon/ina233.rst
> +F:	drivers/hwmon/pmbus/ina233.c
> +

In addition to other comments: No "Odd Fixes" for hwmon drivers, please.
Just drop this entry.

>   INDEX OF FURTHER KERNEL DOCUMENTATION
>   M:	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
>   S:	Maintained
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index f6d352841953..55db0ddc94ed 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -124,6 +124,15 @@ config SENSORS_DPS920AB
>   	  This driver can also be built as a module. If so, the module will
>   	  be called dps920ab.
>   
> +config SENSORS_INA233
> +	tristate "Texas Instruments INA233 and compatibles"
> +	help
> +	  If you say yes here you get hardware monitoring support for Texas
> +	  Instruments INA233.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called ina233.
> +
>   config SENSORS_INSPUR_IPSPS
>   	tristate "INSPUR Power System Power Supply"
>   	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index d00bcc758b97..3c4b06fb939e 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -15,6 +15,7 @@ obj-$(CONFIG_SENSORS_DELTA_AHE50DC_FAN) += delta-ahe50dc-fan.o
>   obj-$(CONFIG_SENSORS_FSP_3Y)	+= fsp-3y.o
>   obj-$(CONFIG_SENSORS_IBM_CFFPS)	+= ibm-cffps.o
>   obj-$(CONFIG_SENSORS_DPS920AB)	+= dps920ab.o
> +obj-$(CONFIG_SENSORS_INA233)	+= ina233.o
>   obj-$(CONFIG_SENSORS_INSPUR_IPSPS) += inspur-ipsps.o
>   obj-$(CONFIG_SENSORS_IR35221)	+= ir35221.o
>   obj-$(CONFIG_SENSORS_IR36021)	+= ir36021.o
> diff --git a/drivers/hwmon/pmbus/ina233.c b/drivers/hwmon/pmbus/ina233.c
> new file mode 100644
> index 000000000000..7899c3e99eeb
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/ina233.c
> @@ -0,0 +1,184 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Hardware monitoring driver for ina233
> + *
> + * Copyright (c) 2025 Leo Yang
> + */
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include "pmbus.h"
> +
> +#define MFR_READ_VSHUNT 0xd1
> +#define MFR_CALIBRATION 0xd4
> +
> +#define INA233_CURRENT_LSB_DEFAULT	1000 /* uA */
> +#define INA233_RSHUNT_DEFAULT		2000 /* uOhm */
> +
> +#define MAX_M_VAL 32767
> +#define MIN_M_VAL -32768
> +
> +static void calculate_coef(int *m, int *R, int power_coef)
> +{
> +	s64 scaled_m;
> +	int scale_factor = 0;
> +	int scale_coef = 1;
> +	bool is_integer = false;
> +
> +	/*
> +	 * 1000000 from Current_LSB A->uA .
> +	 * scale_coef is for scaling up to minimize rounding errors,
> +	 * If there is no decimal information, No need to scale.

s/No/no/

> +	 */
> +	if (1000000 % *m) {
> +		/* Scaling to keep integer precision */
> +		scale_factor = -3;
> +		scale_coef = 1000;
> +	} else {
> +		is_integer = true;
> +	}
> +
> +	/*
> +	 * Unit Conversion (Current_LSB A->uA) and use scaling(scale_factor)
> +	 * to keep integer precision.
> +	 * Formulae referenced from spec.
> +	 */
> +	scaled_m = div_s64(1000000 * scale_coef, *m * power_coef);
> +
> +	/* Maximize while keeping it bounded.*/
> +	while (scaled_m > MAX_M_VAL || scaled_m < MIN_M_VAL) {
> +		scaled_m = div_s64(scaled_m, 10);
> +		scale_factor++;
> +	}
> +	/* Scale up only if fractional part exists. */
> +	while (scaled_m * 10 < MAX_M_VAL && scaled_m * 10 > MIN_M_VAL && !is_integer) {
> +		scaled_m *= 10;
> +		scale_factor--;
> +	}
> +
> +	*m = scaled_m;
> +	*R = scale_factor;
> +}
> +
> +static int ina233_read_word_data(struct i2c_client *client, int page,
> +				 int phase, int reg)
> +{
> +	int ret;
> +
> +	switch (reg) {
> +	case PMBUS_VIRT_READ_VMON:
> +		ret = pmbus_read_word_data(client, 0, 0xff, MFR_READ_VSHUNT);
> +
> +		/* Adjust returned value to match VIN coefficients */
> +		/* VIN: 1.25 mV VSHUNT: 2.5 uV LSB */
> +		ret = DIV_ROUND_CLOSEST(ret * 25, 12500);
> +		break;
> +	default:
> +		ret = -ENODATA;
> +		break;
> +	}
> +	return ret;
> +}
> +
> +static int ina233_probe(struct i2c_client *client)
> +{
> +	int ret, m, R;
> +	u32 rshunt;
> +	u16 current_lsb;
> +	u16 calibration;
> +	struct pmbus_driver_info *info;
> +
> +	info = devm_kzalloc(&client->dev, sizeof(struct pmbus_driver_info),
> +			    GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	info->pages = 1;
> +	info->format[PSC_VOLTAGE_IN] = direct;
> +	info->format[PSC_VOLTAGE_OUT] = direct;
> +	info->format[PSC_CURRENT_OUT] = direct;
> +	info->format[PSC_POWER] = direct;
> +	info->func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_INPUT
> +		| PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
> +		| PMBUS_HAVE_POUT
> +		| PMBUS_HAVE_VMON | PMBUS_HAVE_STATUS_VMON;
> +	info->m[PSC_VOLTAGE_IN] = 8;
> +	info->R[PSC_VOLTAGE_IN] = 2;
> +	info->m[PSC_VOLTAGE_OUT] = 8;
> +	info->R[PSC_VOLTAGE_OUT] = 2;
> +	info->read_word_data = ina233_read_word_data;
> +
> +	/* If INA233 skips current/power, shunt-resistor and current-lsb aren't needed.	*/
> +	/* read rshunt value (uOhm) */
> +	if (of_property_read_u32(client->dev.of_node, "shunt-resistor", &rshunt) < 0)
> +		rshunt = INA233_RSHUNT_DEFAULT;
> +
> +	/* read current_lsb value (uA) */
> +	if (of_property_read_u16(client->dev.of_node, "ti,current-lsb", &current_lsb) < 0)
> +		current_lsb = INA233_CURRENT_LSB_DEFAULT;
> +
of_property_read_u16() returns -EOVERFLOW if the value provided was too large.
This should be checked to avoid situations where the value provided in devicetree
is too large.

A more higher level question: why not use device_property functions ?

> +	if (!rshunt || !current_lsb) {
> +		dev_err(&client->dev, "shunt-resistor and current-lsb cannot be zero.\n");
> +		return -EINVAL;

		return dev_err_probe(...);

Please use a consistent term for current LSB in error messages.

> +	}
> +
> +	/* calculate current coefficient */
> +	m = current_lsb;
> +	calculate_coef(&m, &R, 1);
> +	info->m[PSC_CURRENT_OUT] = m;
> +	info->R[PSC_CURRENT_OUT] = R;
> +
> +	/* calculate power coefficient */
> +	m = current_lsb;
> +	calculate_coef(&m, &R, 25);
> +	info->m[PSC_POWER] = m;
> +	info->R[PSC_POWER] = R;
> +
> +	/* write MFR_CALIBRATION register, Apply formula from spec with unit scaling. */
> +	calibration = div64_u64(5120000000ULL, (u64)rshunt * current_lsb);
> +	if (calibration > 0x7FFF) {
> +		dev_err(&client->dev, "Exceeds MFR_CALIBRATION limit, Use a reasonable Current_LSB with Shunt resistor value.\n");

Use dev_err_probe(). The error message is not actionable. Provide the values.
Something like "Current_LSB %u too small for shunt resistor value %u" or similar
would be more helpful.

> +		return -EINVAL;
> +	}
> +	ret = i2c_smbus_write_word_data(client, MFR_CALIBRATION, calibration);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "Unable to write calibration\n");
> +		return ret;

		return dev_err_probe(...);

> +	}
> +
> +	dev_dbg(&client->dev, "power monitor %s (Rshunt = %u uOhm, Current_LSB = %u uA/bit)\n",
> +		client->name, rshunt, current_lsb);
> +
> +	return pmbus_do_probe(client, info);
> +}
> +
> +static const struct i2c_device_id ina233_id[] = {
> +	{"ina233", 0},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, ina233_id);
> +
> +static const struct of_device_id __maybe_unused ina233_of_match[] = {
> +	{ .compatible = "ti,ina233" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, ina233_of_match);
> +
> +static struct i2c_driver ina233_driver = {
> +	.driver = {
> +		   .name = "ina233",
> +		   .of_match_table = of_match_ptr(ina233_of_match),
> +	},
> +	.probe = ina233_probe,
> +	.id_table = ina233_id,
> +};
> +
> +module_i2c_driver(ina233_driver);
> +
> +MODULE_AUTHOR("Leo Yang <Leo-Yang@quantatw.com>");
> +MODULE_DESCRIPTION("PMBus driver for INA233 and compatible chips");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("PMBUS");

