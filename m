Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286C83D3CE2
	for <linux-hwmon@vger.kernel.org>; Tue, 31 Mar 2026 23:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775001374; cv=none; b=Ff7Uo+0l0a1lcQiyhyRI/jlryadL87jWQYlHeFKhf/HVSJeEOGN+WSMljXSX+GJPYVpvyzKu8OpjjFBN87DIKHFk1UUIXnaFNW0pEOS4RGJ744MEfOCHeOUyjuRyHMrRipG/hGgJdSp+kne9BS6HPa/qg3Nos1FEgZueGIWI4ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775001374; c=relaxed/simple;
	bh=9d8xd88aiUm8VgXjnmm0fTQpnZ1VYMiFZ7Ju5d+R4lg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TsWtzOMftB4N1lfntxRGfidlHPE1TEgFFQ2KWYh0qN+EmHcd7kZYL3Z/DIe/V9gUswEK7367j3D1RpKXgxvNbfhWBiuE0+voz5xxsZDB7fvGiDMYFYWSXG4HwR+VENfb6zR4xdvhS1vvkvgGPU+fNUa1PUVQ2Gl/O/WZ9tHCtmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=atTFrzDI; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="atTFrzDI"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-126ea4e9694so1901882c88.1
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Mar 2026 16:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775001370; x=1775606170; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9hdSzpG5NO9RYAgONCLY3fKC0SZ0JRDtBMlPE4JL0nE=;
        b=atTFrzDIIePyyg4r43DWH6y++oQoIHIofcSPZ7EKK71MmkBkbGFpjSKBvg5I9/eRbs
         m9qFwkAEDESb1bkLuoSRvDomNXoQr3d/rvPTwvmJp5p7AjpDzZYbAzCUecWh5fq838EP
         XM635LI8nXdb4DAQ5GHoz2IOrBqUb2x4xN0QdHJQlLjGpwvv1pGyF1kGgI6GIXCQspBa
         nKyCVImC3r7qlPQgpsyeAmO1vfCxTH6W6g3qTIVE5liAvZSlRjRGaJ3UqIjLS1bNrKPx
         jhOqgH603TTE7rknbOqX4oniBSs5G4YMpzCBwlUyA9HRgIwUFURWcACrEymHhwpYe0HL
         uzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775001370; x=1775606170;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9hdSzpG5NO9RYAgONCLY3fKC0SZ0JRDtBMlPE4JL0nE=;
        b=jYzPBCg/ConkDLrNBukpbrkOR4ZckXh6CE/8xOGZbPq97SQ0QTdMStPtG0RVp4v55O
         AN9DfYfcnIW1wa9C1y3sF/g3AMs2kGvH0Q9rlSPeOJ5dL9uscw17QzWJ52U2gGtOMSvx
         JbbF6kNPVy8Vr4nWnGwhSpVqZayb8+/gHUwLDjDSxwU2Q0mwkdRR0Izavsf8R8fJjWl+
         /rrvdTjqk7LPTYHJ9g1L4g5xYM516STOwo10F7y8uk1qYKlQTt112T9nktOi5+Mh6d0C
         TsR0/ILFthU6mCWzJN89kO4aWc44X27sb7VXdtDIHfmOs+jU2aL5ShjmMuRaDCOQQYFl
         uT1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXoa5OMJuxHrJpn37tyxnaHbXV9hpXwFF7mshrhX+QKFnlNt2yW9q0sEKzky2MIbRW1W1JFKcUo8iCJsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtAXMoiEf9AAz3Lzqo809hbJYMdsq2zrhMgm2ay0OMxJAYrGmx
	JffzTNGObU8dwWMt2JYGj7hAMjJulFIiI8epVzoIjT6mZzj7BSbK/+SH
X-Gm-Gg: ATEYQzxHoXjVSqAaDOrJGXd/ZjGlBYa/oZM5oHMXZnLoEqqRPAwFr2t7Wz16T1ESgpY
	S48utuCsY0m0/ZnkdA0tuiX3O6N1/l5xi5lvtsnWxGSGgXPXiSIm2FFgDHMaou026SEG5rc14dL
	pMzhZRrsuoFIk9/9FzNwRARhMHXOupK9J2F8Pjs/78R1Uhhv9tE8hQv4mTXu2D6RqM79aTSlrqW
	T1ZM343sEghUs5tcV2rXC1IsOVdfxM7v61b1Shb0gLKiN1S8jz7rea61qqag8YDEgj6ZxTz5RAF
	/27poLu+f0vbQBP9+XIx5C5nSzgE1HzO1R/8to3aU3X1FB86mJqW2Wm8HDeEObLXi7AkfUn1j1+
	aaxd8h8HVkFoiueeFvWIDGL9UxrySZLV+U40UoQnPXyEPkZtzw70ipP6dB/NdJzTISW4qwc7Uq3
	PEDrOlInTfE1x/f0d2x2ke4zTVmeg8NFIDawywstmBa3ryWPT8XoxOKF/U4Je4rO7RnFPWypwx
X-Received: by 2002:a05:7022:394:b0:128:d20a:2f3d with SMTP id a92af1059eb24-12be645079amr840691c88.4.1775001370052;
        Tue, 31 Mar 2026 16:56:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab97efb42sm17177155c88.7.2026.03.31.16.56.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 16:56:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b4b2642c-35d6-410e-8e44-b3860dc551cf@roeck-us.net>
Date: Tue, 31 Mar 2026 16:56:08 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: pmbus: Add support for Sony APS-379
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260331231916.94662-1-chris.packham@alliedtelesis.co.nz>
 <20260331231916.94662-3-chris.packham@alliedtelesis.co.nz>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260331231916.94662-3-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Chris,

On 3/31/26 16:19, Chris Packham wrote:
> Add pmbus support for Sony APS-379 power supplies. There are a few PMBUS
> commands that return data that is undocumented/invalid so these need to
> be rejected with -ENXIO. The READ_VOUT command returns data in linear11
> format instead of linear16 so we need to workaround this.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Feedback inline.

Thanks,
Guenter

> ---
>   drivers/hwmon/pmbus/Kconfig   |   6 ++
>   drivers/hwmon/pmbus/Makefile  |   1 +
>   drivers/hwmon/pmbus/aps-379.c | 196 ++++++++++++++++++++++++++++++++++
>   3 files changed, 203 insertions(+)
>   create mode 100644 drivers/hwmon/pmbus/aps-379.c
> 
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
> index 000000000000..e4c4c2d12bc9
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/aps-379.c

Driver documentation is missing.

This power supply does not seem to be documented anywhere, so this is actually quite
important.

Having said this, the behavior seems quite similar to BluTek BPA-RS600. Are those
power supplies from the same OEM ?

> @@ -0,0 +1,196 @@
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
> +static const struct i2c_device_id aps_379_id[] = {
> +	{ "aps-379", 0 },
> +	{},
> +};
> +
> +static int aps_379_read_byte_data(struct i2c_client *client, int page, int reg)
> +{
> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +	struct aps_379_data *data = to_aps_379_data(info);
> +	int ret;
> +
> +	if (page > 0)
> +		return -ENXIO;

Unnecessary since there is only one page.

Yes, I know, other drivers do it, but it is really pointless.

> +
> +	switch (reg) {
> +	case PMBUS_VOUT_MODE:
> +		/*
> +		 * The VOUT format used by the chip is linear11,
> +		 * not linear16. Report that VOUT is in linear mode
> +		 * and return exponent value extracted while probing
> +		 * the chip.
> +		 */
> +		ret = data->vout_linear_exponent;
> +		break;
> +	default:
> +		ret = -ENODATA;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +/*
> + * The APS-379 uses linear11 format instead of linear16. We've reported the exponent
> + * via the PMBUS_VOUT_MODE so we just return the mantissa here.
> + */
> +static int aps_379_read_vout(struct i2c_client *client)
> +{
> +	int ret;
> +	s32 mantissa;
> +
> +	ret = pmbus_read_word_data(client, 0, 0xff, PMBUS_READ_VOUT);
> +	if (ret < 0)
> +		return ret;
> +
> +	mantissa = ((s16)((ret & 0x7ff) << 5)) >> 5;

sign_extend32() ?

Also, is the exponent known to be static ? If not it may be necessary
to adjust it. If yes, I'd suggest to add a comment above.

> +	ret = mantissa;

That assignment is really unnecessary.

> +
> +	return ret;
> +}
> +
> +static int aps_379_read_word_data(struct i2c_client *client, int page, int phase, int reg)
> +{
> +	int ret;
> +
> +	if (page > 0)
> +		return -ENXIO;

Unnecessary.

> +
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
> +		ret = -ENXIO;
> +		break;

I'd suggest to return directly in this function. There is no real value
to assign the return value to ret just to return it.

> +	case PMBUS_READ_VOUT:
> +		ret = aps_379_read_vout(client);
> +		break;
> +	default:
> +		if (reg >= PMBUS_VIRT_BASE)
> +			ret = -ENXIO;
> +		else
> +			ret = -ENODATA;
> +		break;
> +	}
> +
> +	return ret;
> +
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
> +static int aps_379_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	const struct i2c_device_id *mid;
> +	struct pmbus_driver_info *info;
> +	struct aps_379_data *data;
> +	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
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
> +	for (mid = aps_379_id; mid->name[0]; mid++) {
> +		if (!strncasecmp(buf, mid->name, strlen(mid->name)))
> +			break;
> +	}

That seems to be excessive. There is only one power supply.
If more are added in the future, a looop can be added. Right
now a simple comparison should do.

Thanks,
Guenter

> +	if (!mid->name[0]) {
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

