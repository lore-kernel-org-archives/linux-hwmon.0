Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5818E155352;
	Mon,  6 Jan 2025 15:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736177487; cv=none; b=IGv1XfDZ8171cjAZ0EETlY2pzB7buuVHicND/Y1vdt/feorhkpu1XsXxMTBFlnGzAIe9uc6hg3Tq+Q75iEMJndBP5c03YUJQK5dSvxGvzkn9znLuS+63iAhxAZWTVdSNwm43pkP0+Tz7x8fuy/MUMVQ98OUz9cmdeJuq5Wazylg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736177487; c=relaxed/simple;
	bh=RZJjvfYDEnlmCfO++OC3OhtPJ7ZRK3D5aCDMinS8eIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ruDWPcEuyDNRNod4oT5dllAf8f1XndZW7mSZqREA5HHIlEVGcydzcaAKwAVjimQIkQETKNAUjbo7VgdGCk+JfU72ucu9t8M9vtzlI2NOgSkVDYB8+sFE4JEuSqmCwTIE2Ujl/W/rO6ViOC3Wx4stdZ4ckqFDSRL1DEkCoqB4W44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eTC7uF+n; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eTC7uF+n"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-219f8263ae0so162562795ad.0;
        Mon, 06 Jan 2025 07:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736177483; x=1736782283; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=QRIfV5ElrP/vHa1+ZSyZIu/SlEGPuLTt3lYRKEgjbXo=;
        b=eTC7uF+nPgn+5HYupTa7QmM4g0fEeTYgrxJ04Sr0KKqte5psoAvFiixJ2iLoKdZXpy
         +WAv/A/P2oXeZrFFk+d8srgvNh+J+/b8FhulgWhQ2IXCTGXgBOVWiFedYAMiQyZiy9R5
         6CJm3MJ6Oib77ib0fXhYgv+kdRqBz5ViXUPcfdKGbHBO8hgup1sd7e0hz9ttzRGGFeVk
         068H3FaD3JRS5pui6IuK7f5ZrsNHYdptm3yXayMo+CFSMlm28GR3J1G+8uWESn5iQ4IM
         xSBy6S/67RgiygSBfG5NKbknqhYs8yjaXY2PKngRVT+mWQYyZhFdunABclPeCvjmSi8B
         MWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736177483; x=1736782283;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QRIfV5ElrP/vHa1+ZSyZIu/SlEGPuLTt3lYRKEgjbXo=;
        b=VNh3/bmEe63icr/vKh5+GqfoPNAWUFZ3En3gV41ZcW7VDFZ1MR27/X4OiJs3r//G0U
         NbM339uyHr/66Ljs//m7iwC4wtCiqeV0BDeXOVyNpBpkzuy9SAQa1wlXdqUAGF+SFdPv
         qbd6pgRzXeNa99c0TD/Iw2KGAEJuL6kZAqyujgn8rQXT/nErDd0km6K6t0ac46x4Qjza
         ldF55OB+N1SLU/ucRDE3k5bmDWybmJvfZxqG6SpJymstK6qqAmgzetxzZURmpoVPkrmD
         rM2hCxoJQn1jXUXKspfgyWinPpFaVZ4nQEwEoMY8AHIdDIpkBWMchPpAxYHj/YwweGJJ
         Pi3g==
X-Forwarded-Encrypted: i=1; AJvYcCUWydXsRdwLlVA321ObvK86/99W9v8rWQ3pObqOg06VbhzYTakK4pQUvaHXf7R6c7oRBmpk8Gzem2tL@vger.kernel.org, AJvYcCV1hZ00IItP1w+StKLcNhNBijMLlgHP1w4Yyyg+OrPFNace803eoWXh4AYLW4e7sUmfofGQV+euVf2XrII=@vger.kernel.org, AJvYcCVbiVaDRIX+Qk7vIpeKhNQgq4CVlFpN/gZMhN1XjoRapSSCgOx+MSO1OeoMgKEuhIcGnqyYYfYt3EoR@vger.kernel.org, AJvYcCXbrj7HKYP2yYcACBGz6bryS6DHlsNiXN/930Im86NRJB8TNYXaF543cMl+xv6sri9Kj1OM+UthkiZvLmCF@vger.kernel.org
X-Gm-Message-State: AOJu0YwYTuCbE/aFaw95hnuMXCzgi3h5dQdkC1MOkw3PaZ8QT3+xpwD3
	jfjPzU6tdQxFdfvmV7NTgvTNF6K5/2FECJ9SRYY+olGiRRQCNW3g
X-Gm-Gg: ASbGnctNRIwP7zqnDsJ77bkj7lu0wsfdqc/sjIcJjqJ6vxKKH2uDX7cinH7IDcKWFhD
	mPpmvNqboD3zno+2lP1dMYLj1NeReilERq7/Nio2ym3PgnKGZoTfE3Q9XrYeXe5KAl02uaGExEM
	iuRDE5ibyeN3Rt1ZJR1rrLupXKe6Mo82icMi+tusxW6f5jvoINJfb02cF5EZptCjmEMHcxDok0P
	iW96IM84B2HvipMDAaT/ytLTFQRg4ZaKs40OSWYIrOkjMfLluF4+1bsEFT7ektz5OvIptM/AKlZ
	HGMd1XsnOcZR/Pd9uhR4p3+6SFF1mA==
X-Google-Smtp-Source: AGHT+IFTrNPIKEGYex/9XO8Y/nHOITFWQ2Z0x7iHZgSvj050xBtsC9Pg8SvsHgG+drEelELPvaPwLA==
X-Received: by 2002:a05:6a00:1942:b0:725:cfa3:bc6b with SMTP id d2e1a72fcca58-72abde404b0mr87717383b3a.3.1736177483350;
        Mon, 06 Jan 2025 07:31:23 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad816166sm31669251b3a.13.2025.01.06.07.31.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 07:31:22 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b2a336dc-c029-4a95-9807-8e8b82f75ec9@roeck-us.net>
Date: Mon, 6 Jan 2025 07:31:20 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: Add driver for TI INA233 Current and Power
 Monitor
To: Leo Yang <leo.yang.sy0@gmail.com>, jdelvare@suse.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, Leo-Yang@quantatw.com,
 corbet@lwn.net, Delphine_CC_Chiu@Wiwynn.com, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250106071337.3017926-1-Leo-Yang@quantatw.com>
 <20250106071337.3017926-3-Leo-Yang@quantatw.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250106071337.3017926-3-Leo-Yang@quantatw.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/5/25 23:13, Leo Yang wrote:
> Support ina233 driver for Meta Yosemite V4.
> 
> Driver for Texas Instruments INA233 Current and Power Monitor
> With I2C-, SMBus-, and PMBus-Compatible Interface
> 
> According to the mail
> https://lore.kernel.org/all/
> 20230920054739.1561080-1-Delphine_CC_Chiu@wiwynn.com
> maintainer's suggested rewrite driver
> 
Drop the last sentence, or move after "---".

Besides, while I did point out a number of problems, but I did not suggest
to "rewrite the driver".

Since this is v2 of this driver, the submission should have been versioned,
and a change log should have been provided.

> Signed-off-by: Leo Yang <Leo-Yang@quantatw.com>
> ---
>   Documentation/hwmon/ina233.rst |  77 +++++++++++++
>   Documentation/hwmon/index.rst  |   1 +
>   MAINTAINERS                    |   9 ++
>   drivers/hwmon/pmbus/Kconfig    |   9 ++
>   drivers/hwmon/pmbus/Makefile   |   1 +
>   drivers/hwmon/pmbus/ina233.c   | 200 +++++++++++++++++++++++++++++++++
>   6 files changed, 297 insertions(+)
>   create mode 100644 Documentation/hwmon/ina233.rst
>   create mode 100644 drivers/hwmon/pmbus/ina233.c
> 
> diff --git a/Documentation/hwmon/ina233.rst b/Documentation/hwmon/ina233.rst
> new file mode 100644
> index 000000000000..5c9e5ed2d6d5
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
> +see Documentation/devicetree/bindings/hwmon/pmbus/ti,ina233.yaml for details.
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
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 55f1111594b2..f280fa6e7d95 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -89,6 +89,7 @@ Hardware Monitoring Kernel Drivers
>      ibmpowernv
>      ina209
>      ina2xx
> +   ina233
>      ina238
>      ina3221
>      inspur-ipsps1
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c575de4903db..061da798536d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11226,6 +11226,15 @@ L:	linux-fbdev@vger.kernel.org
>   S:	Orphan
>   F:	drivers/video/fbdev/imsttfb.c
>   
> +INA233 HARDWARE MONITOR DRIVER
> +M:	Leo Yang <Leo-Yang@quantatw.com>
> +M:	Leo Yang <leo.yang.sy0@gmail.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Odd Fixes
> +F:	Documentation/devicetree/bindings/hwmon/ina233.txt
> +F:	Documentation/hwmon/ina233.rst
> +F:	drivers/hwmon/pmbus/ina233.c
> +
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
> index 000000000000..1f7be600dea4
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/ina233.c
> @@ -0,0 +1,200 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Hardware monitoring driver for ina233
> + *
> + * Copyright (c) 2024 Leo Yang
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>

Alphabetic include file order, please.

> +#include "pmbus.h"
> +
> +#define MFR_READ_VSHUNT 0xd1
> +#define MFR_CALIBRATION 0xd4
> +
> +#define INA233_RSHUNT_DEFAULT		2000 /* uOhm */
> +#define INA233_CURRENT_LSB_DEFAULT	1000 /* uA/bit */

"bit" is implied in "LSB".

> +
> +#define MAX_M_VAL 32767
> +#define MIN_M_VAL -32768
> +
> +static int calculate_coef(int *m, int *R, bool power)
> +{
> +	s64 scaled_m;
> +	int scale_factor = 0;
> +	int scale_coef = 1;
> +	int power_coef = 1;
> +	bool is_integer = false;
> +
> +	if (*m == 0) {
> +		*R = 0;
> +		return -1;
> +	}

*m is never 0.

> +
> +	if (power)
> +		power_coef = 25;
> +

Why not just pass the power coefficient directly as parameter ?

> +	if (1000000 % *m) {

I fail to understand the logic here. Why scale if and only if m is a clean
multiple of 1000000 ? Scale if m == 1000001 but not if m == 1000000 ?
Please explain.

> +		/* Default value, Scaling to keep integer precision,
> +		 * Change it if you need

This comment does not provide any actual information and thus does not
add any value. Change to what ? Why ? And, again, why not scale if
m is a multiple of 1000000, no matter how large or small it is ?

> +		 */
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
> +		scaled_m /= 10;

This looks wrong. If scaled_m < MIN_M_VAL it doesn't make sense
to decrease it even more.

> +		scale_factor++;
> +	}
> +	/* Scale up only if fractional part exists. */
> +	while (scaled_m * 10 < MAX_M_VAL && scaled_m * 10 > MIN_M_VAL && !is_integer) {

This looks just as wrong. If scaled_m > 10 * MIN_M_VAL, why increase it even more ?

> +		scaled_m *= 10;
> +		scale_factor--;
> +	}
> +
> +	*m = scaled_m;
> +	*R = scale_factor;
> +	return 0;
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
> +struct pmbus_driver_info ina233_info = {
> +	.pages = 1,
> +	.format[PSC_VOLTAGE_IN] = direct,
> +	.format[PSC_VOLTAGE_OUT] = direct,
> +	.format[PSC_CURRENT_OUT] = direct,
> +	.format[PSC_POWER] = direct,
> +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_INPUT
> +		| PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
> +		| PMBUS_HAVE_POUT
> +		| PMBUS_HAVE_VMON | PMBUS_HAVE_STATUS_VMON,
> +	.m[PSC_VOLTAGE_IN] = 8,
> +	.R[PSC_VOLTAGE_IN] = 2,
> +	.m[PSC_VOLTAGE_OUT] = 8,
> +	.R[PSC_VOLTAGE_OUT] = 2,
> +	.read_word_data = ina233_read_word_data,
> +};
> +
> +static int ina233_probe(struct i2c_client *client)
> +{
> +	int ret, m, R;
> +	u32 rshunt;
> +	u16 current_lsb;
> +	u16 calibration;
> +
> +	/* If INA233 skips current/power, shunt-resistor and current-lsb aren't needed.	*/
> +
> +	/* read rshunt value (uOhm) */
> +	ret = of_property_read_u32(client->dev.of_node, "shunt-resistor", &rshunt);
> +	if (ret < 0 || !rshunt) {
An rshunt value of 0 would be wrong and must not be accepted.

> +		dev_err(&client->dev, "Unable to read shunt-resistor or value is 0, default value %d uOhm is used.\n",
> +			INA233_RSHUNT_DEFAULT);

This is not an error and thus must not result in an error message.

> +		rshunt = INA233_RSHUNT_DEFAULT;
> +	}
> +
> +	/* read current_lsb value (uA/bit) */
> +	ret = of_property_read_u16(client->dev.of_node, "current-lsb", &current_lsb);
> +	if (ret < 0 || !current_lsb) {
> +		dev_err(&client->dev, "Unable to read current_lsb or value is 0, default value %d uA/bit is used.\n",
> +			INA233_CURRENT_LSB_DEFAULT);

Thjs is not an error and thus must not result in an error message.
Also, a current-lsb value of 0 in devicetree would be wrong and
must not be accepted.

> +		current_lsb = INA233_CURRENT_LSB_DEFAULT;
> +	}
> +
> +	/* calculate current coefficient */
> +	m = current_lsb;
> +	ret = calculate_coef(&m, &R, false);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "Calculate_coef error\n");

And ignore the error ? This is a no-go. Either it is an error, and the driver
should abort, or it isn't, and there should be no error message.

Besides, current_lsb is never 0, and the function will never return an error,
so this "error handling" is not only unnecessary but misleading.

> +	} else {
> +		ina233_info.m[PSC_CURRENT_OUT] = m;
> +		ina233_info.R[PSC_CURRENT_OUT] = R;

This is a no-go. There could be multiple INA233 with different parameters
in the system. The second one would overwrite the first one's parameters.

> +	}
> +
> +	/* calculate power coefficient */
> +	m = current_lsb;
> +	ret = calculate_coef(&m, &R, true);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "Calculate_coef error\n");
> +	} else {
> +		ina233_info.m[PSC_POWER] = m;
> +		ina233_info.R[PSC_POWER] = R;
> +	}

Same comments as above.

> +
> +	/* write MFR_CALIBRATION register, Apply formula from spec with unit scaling. */
> +	calibration = div_u64((u64)5120000000, (u64)rshunt * current_lsb);

5120000000ULL, and drop the type cast. Also, the divisor of div_u64() is u32,
so type casting its parameter to u64 won't help. If rshunt * current_lsb can
be larger than 32 bit, this would have to use div64_u64().

> +	if (calibration <= 0) {

The result of this calculation is never < 0.

> +		dev_err(&client->dev, "Calibration error\n");
> +		return -1;

This is not a valid error code, and the message is useless. It needs to explain why
the calibration failed, and the returned error code should be -EINVAL.

> +	}
> +	ret = i2c_smbus_write_word_data(client, MFR_CALIBRATION, calibration);

This only writes 16 bit. What if the calibration value is larger than 0xffff ?

> +	if (ret < 0) {
> +		dev_err(&client->dev, "Unable to write calibration\n");
> +		return ret;
> +	}
> +
> +	dev_info(&client->dev, "power monitor %s (Rshunt = %u uOhm, Current_LSB = %u uA/bit)\n",
> +		 client->name, rshunt, current_lsb);

Please refrain from logging noise and make this dev_dbg().

> +
> +	return pmbus_do_probe(client, &ina233_info);
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
> +/* This is the driver that will be inserted */

Useless comment. Please drop. Yes, it is kind of common in hwmon drivers,
and its existence is partly my fault, but that doesn't make it better.

Thanks,
Guenter

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

