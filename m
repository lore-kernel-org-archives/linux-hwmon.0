Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157361E5B88
	for <linux-hwmon@vger.kernel.org>; Mon,  5 Jan 2026 15:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767627616; cv=none; b=cWQilY74uGX1vbFv8aM87MmOtZtGlPedIB48p0heTfAt55pJHu40kGXXRQ9GewvlptnQqMOPmAfSRngJtG7Ih0iY0fVXJorHsjyB7WuxOOmGR2YD3tmqgSSQCSllsQtrVXsO1bE2iIJmlryIkiTxPgcmkytYqYfBcMw+DIXfboA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767627616; c=relaxed/simple;
	bh=HzqPPiBcn5jkAczVFpka6mooXd/SxlkXlQ2RXOYVanE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LuObWfzKbeB8ecHr0svJJHcoiltafQTGwfZis2wIL5McSK92549pVI9cR5171npdPZ4q9QX7jCUWiYVyhRK2o6aF5XUHDS6Xgz2UZ5eRx2vN+E/mfL2WU6RtyesJ5OuGnxjt5uGDg9wqZkYdZ51W7ATSccpRoKknrJw7E1OG8Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g7wQ2WZa; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g7wQ2WZa"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-bc4b952cc9dso12271833a12.3
        for <linux-hwmon@vger.kernel.org>; Mon, 05 Jan 2026 07:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767627612; x=1768232412; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mSjUHHGhSA9iARuSXnUKtwVzESj0KnI38pcQdQIS31I=;
        b=g7wQ2WZaSvKs1ZyF5ViSgO0yOqSRVXo4PtpMO+xp1V5XymBSKQTyf/6Hubs1S1Ecrk
         NOrOWQdf+mZV6JYw0whrD56G1AbmrAlGN6k524pLRdSh5esqS+thlc9JA2y22uUsZWGT
         Ck6wW76YpGJY8IuuTDXNGcnVZUsrdko3PyF2K8LYhneVS41zSh+79ICCXXjL8lRdAFdr
         UUKMT2DFzwoQcCL+9Nko/o8H8nXYxijxasD8mczRLQPpAQ3+nTkL9ihxHsFG+SAt7GD8
         rHiQZlbNvPXYPFHXB7CdoE+wsC7zEjCrOnzdZJPE1m/mi+I1nFUbbkToyRwLlfStiU87
         oZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767627612; x=1768232412;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mSjUHHGhSA9iARuSXnUKtwVzESj0KnI38pcQdQIS31I=;
        b=HyLuYN3jdMcQtwWiOFcxN01QJdzK2SPoFSNttUT9Hes9p8XXCU3hbnousegYvHCtn1
         B/AtBjxeknMrE6rHIIFSiOjp1jvJrkbQ/34sxhAIIUZNRTCrGvZotEZ8SStIapEp697a
         fHrB1i13Sa3gxp00H0mWupTbWeYPOX/FsqGEu9dzmg29Jq8L/qVoD5KaQ6woUHunmOiR
         8kPuxnpHj9kYvMJwSDiKw0HTAOl+eN5adaZw+t8gJZJd1Hb1UuHGyLrxmHv8kya6nF+f
         k01jnqqNNLEmtvDO0aQE6AJ7dYzfRnZWGbZz9j6AWtjjDVDi6UkSObCl9hpCuoOktwoR
         Eb9w==
X-Forwarded-Encrypted: i=1; AJvYcCXJT5XHO15MPIgVoJXQd0vjQznOyw204bY6sZZoF5Xo9WmtpE+pMTNvvVokegvjH7Y+/6zqHMAbexXEog==@vger.kernel.org
X-Gm-Message-State: AOJu0Yza3E0ND5mQYBySapLIFCaVzTHeg/4aLSVY2WwlwBjmYnDCH2BZ
	+G8jCXGJqDj9LhysQxKolCgzCKZG81yqsTTQWt3Mg4cTiqJ1Hgf0ssaBe7as8w==
X-Gm-Gg: AY/fxX5wuc06XDAdxGKHkMa/Ufyq3vPG6WzBVogkqJyl4EGSkEkLpCljCZPa30Nbd3e
	0HTknLXu2faCfhD56WccmbhVrQyt3pp5D4fAf1+9rXzeXHvAGXA4H16Z83ppblvVJEHxLJ4lThx
	JvA9nec8xxb0+1FtvHIIVleSl9jrg4clhbbI/2HtJvnumnRHEg/DORNZZhYmAFl8J8+4ySjcPZL
	k4y7T+u/YkDW/w+zET7aNhbTzMXBH5n8rdFpRXQlCUlQsaf90xW8DHh3Kcd2F3bNpnQQvCFUNBp
	pgbCWl/1rr30ZWig8+HVKyUgFvu7m6ZMVyUttguQCr0aeaJdplfIuo6cEP7jjuZh5ljIIvdIbL0
	aBLHuYrb3Hoi2eQn6xVQ2KfJGuWgSvXcl8fo/nVSshZPapjX5cSGsswmGVOA8FrYTDm59CvDVFI
	AkEv2V7+iy6lj8NwS1X9H/zRgp
X-Google-Smtp-Source: AGHT+IF4A6yL8tuIdN4S1c8bNTYQ57Gvy/snPP3ZnRbHtYPTMAPchQmpm05cXbqk/Fn4CpOEndYaRg==
X-Received: by 2002:a05:7301:dd93:b0:2af:fbb:97cf with SMTP id 5a478bee46e88-2b05ecb3c19mr32419584eec.43.1767627611522;
        Mon, 05 Jan 2026 07:40:11 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b140c42ecfsm13187513eec.25.2026.01.05.07.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 07:40:10 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 5 Jan 2026 07:40:09 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: ASHISH YADAV <ashishyadav78@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	ASHISH YADAV <Ashish.Yadav@infineon.com>
Subject: Re: [PATCH] hwmon:(pmbus/tda38740a) TDA38740A Voltage Regulator
 Driver
Message-ID: <a8c3586b-5baa-4cf8-996d-b99082bf2563@roeck-us.net>
References: <20260104105351.68907-1-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260104105351.68907-1-Ashish.Yadav@infineon.com>

On Sun, Jan 04, 2026 at 04:23:51PM +0530, ASHISH YADAV wrote:
> Add the pmbus driver for the Infineon TDA38740A/TDA38725A
>       DC-DC voltage regulator.

No need for indentation.

> 
> Signed-off-by: ASHISH YADAV <Ashish.Yadav@infineon.com>

No change log, no versioning, the devicetree description was not separated
but dropped or submitted entirely separately without copying hwmon,
no explanation for the new property, review feedback not completely
addressed.

More comments inline.

> ---
>  drivers/hwmon/pmbus/Kconfig     |  16 +++
>  drivers/hwmon/pmbus/Makefile    |   1 +
>  drivers/hwmon/pmbus/tda38740a.c | 182 ++++++++++++++++++++++++++++++++

Driver documentation missing.

>  3 files changed, 199 insertions(+)
>  create mode 100644 drivers/hwmon/pmbus/tda38740a.c
> 
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
> index 000000000000..3402bbf2cc47
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/tda38740a.c
> @@ -0,0 +1,182 @@
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
> +#define TDA38725A_IC_DEVICE_ID "\xA9"
> +#define TDA38740A_IC_DEVICE_ID "\xA8"
> +
> +static const struct i2c_device_id tda38740a_id[];
> +
> +enum chips { tda38725a, tda38740a };
> +
> +struct tda38740a_data {
> +	enum chips id;
> +	struct pmbus_driver_info info;
> +	u32 vout_multiplier[2];
> +};
> +
> +#define to_tda38740a_data(x) container_of(x, struct tda38740a_data, info)
> +
> +static const struct regulator_desc __maybe_unused tda38740a_reg_desc[] = {
> +	PMBUS_REGULATOR("vout", 0),
> +};
> +
> +static int tda38740a_read_word_data(struct i2c_client *client, int page,
> +				    int phase, int reg)
> +{
> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +	const struct tda38740a_data *data = to_tda38740a_data(info);
> +	int ret;
> +
> +	/* Virtual PMBUS Command not supported */
> +	if (reg >= PMBUS_VIRT_BASE)
> +		return -ENXIO;
> +
> +	switch (reg) {
> +	case PMBUS_READ_VOUT:
> +		ret = pmbus_read_word_data(client, page, phase, reg);
> +		if (ret < 0)
> +			return ret;
> +		ret = ((ret * data->vout_multiplier[0]) /
> +		       data->vout_multiplier[1]);

Repeating me, but the rationale (use case) for the multiplier is still not
provided, much less why it would be needed for READ_VOUT but not for any
of the other VOUT related commands. The data sheet does not provide an
explanation (section 13.3 does not explain the need for it, or suggest
that READ_VOUT would return a bad value, much less why only READ_VOUT would
require scaling or why adjusting VOUT_SCALE_LOOP would not be sufficient).

> +		break;
> +	default:
> +		ret = pmbus_read_word_data(client, page, phase, reg);

Should return -ENODATA and let the calling code handle it.

> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static struct pmbus_driver_info tda38740a_info[] = {
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
> +	},
> +};
> +
> +static int tda38740a_get_device_id(struct i2c_client *client)
> +{
> +	u8 device_id[I2C_SMBUS_BLOCK_MAX + 1];
> +	enum chips id;
> +	int status;
> +
> +	status = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID,
> +					   device_id);
> +	if (status < 0 || status > 1) {
> +		dev_err(&client->dev, "Failed to read Device Id %x\n", status);

Not necessarily. If status > 1 it is just unexpected/unsupported.

> +		return -ENODEV;
> +	}
> +
> +	if (!memcmp(TDA38725A_IC_DEVICE_ID, device_id, strlen(device_id))) {
> +		id = tda38725a;

device_id[] is not initialized, meaning its contents are random. There is no
guarantee that the returned data is a string either, 0-terminated or not.
Thus, strlen() is wrong.

> +	} else if (!memcmp(TDA38740A_IC_DEVICE_ID, device_id,
> +			   strlen(device_id))) {
> +		id = tda38740a;
> +	} else {
> +		dev_err(&client->dev, "Unsupported device\n");

Consider telling the user the ID of the unsupported device.

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
> +	int chip_id;
> +
> +	if (!i2c_check_functionality(client->adapter,
> +				     I2C_FUNC_SMBUS_BYTE |
> +					     I2C_FUNC_SMBUS_BYTE_DATA |
> +					     I2C_FUNC_SMBUS_WORD_DATA |
> +					     I2C_FUNC_SMBUS_BLOCK_DATA))
> +		return -ENODEV;
> +
> +	chip_id = tda38740a_get_device_id(client);
> +	if (chip_id < 0)
> +		return chip_id;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +	data->id = chip_id;
> +	memcpy(&data->info, &tda38740a_info[chip_id], sizeof(data->info));
> +
> +	if (!of_property_read_u32_array(client->dev.of_node, "vout_multiplier",
> +					data->vout_multiplier,
> +					ARRAY_SIZE(data->vout_multiplier))) {
> +		dev_info(&client->dev,
> +			 "vout_multiplier from Device Tree:%d %d\n",
> +			 data->vout_multiplier[0], data->vout_multiplier[1]);
> +	} else {
> +		dev_info(&client->dev,
> +			 "vout_multiplier not available from Device Tree");
> +		data->vout_multiplier[0] = 0x01;
> +		data->vout_multiplier[1] = 0x01;
> +		dev_info(&client->dev, "vout_multiplier default value:%d %d\n",
> +			 data->vout_multiplier[0], data->vout_multiplier[1]);

Drop the noise.

> +	}
> +
> +	return pmbus_do_probe(client, &data->info);
> +}
> +
> +static const struct i2c_device_id tda38740a_id[] = { { "tda38725a", tda38725a },
> +						     { "tda38740a", tda38740a },
> +						     {} };
> +
> +MODULE_DEVICE_TABLE(i2c, tda38740a_id);
> +
> +static const struct of_device_id __maybe_unused tda38740a_of_match[] = {
> +	{ .compatible = "infineon,tda38725a", .data = (void *)tda38725a },
> +	{ .compatible = "infineon,tda38740a", .data = (void *)tda38740a },
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(of, tda38740a_of_match);
> +
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
