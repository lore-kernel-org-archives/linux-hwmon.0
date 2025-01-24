Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC25218EBD;
	Fri, 24 Jan 2025 08:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737707511; cv=none; b=jd5nhtezPlIfvNtftGAbQLrWp1YSkDb6BAf9+8I2fM/EWWUS+PVTV8bjutavcFGF1E+nfmGiCGi/LGUC69djJ3iz64MYlXdhDfpU6EoEwiSEzKJiuNH1s72R4kz0L0mGbHDowFO9RpW7RbWG+kyO/qcuFko2ui5XNs6Oq87wcNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737707511; c=relaxed/simple;
	bh=ihIY6K38uM0IeGs8jpN6weJMOPLxjPhVvC5EBclPDKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kFrZVw4yyzwn+DJ/lcr4mQdellPXtRtDJRO8Q20RhqXQ/Rj1j3zhmRg0W1Jj8KOnUosR/VJcFJ05Xx7ZQomTXZ+ulQD0q3KubqkGBE82PCzbYIR0ugMOLsneClOr9gkWgx1XDJ8LSJM5a3cIVgjqSL397KRG3l0CwYayO87VQ7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U07SYBSY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U07SYBSY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08AFAC4CEE1;
	Fri, 24 Jan 2025 08:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737707510;
	bh=ihIY6K38uM0IeGs8jpN6weJMOPLxjPhVvC5EBclPDKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U07SYBSYC8FQiemJnuZJh1CKNYr6NlSv2+cZvp9GAlDfYbDyGz4AFOEwb3fFBtdHN
	 2DRW44kqGalUfSgXF2QgUq+e0nssRlY4JfbAHyWJ0zb3IoX7mh/9XmuwyT+MTnlx0n
	 iXuKkwCQEsT7y9urRn0eLnUDOmh5pI90ACaUFN9ezC9SPkXqUb1Til/3uvbCxrkFfJ
	 kf9KFZTf5esg6k2bcsIxlNqissXMXLl6nVcVeHd4Of2vAcFTDBI8Q5ur9j74lfJ/fQ
	 j0R4RJqtvhViTX4CUZJekynaR8f5CIYgQL8QMUXygZx3SeRD67JnFIKLpnyLb6AUgU
	 SYZ8AQwTR8KRg==
Date: Fri, 24 Jan 2025 09:31:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrei Lalaev <andrey.lalaev@gmail.com>
Cc: jdelvare@suse.com, linux@roeck-us.net, conor+dt@kernel.org, 
	krzk+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: add driver for HTU31
Message-ID: <20250124-refined-belligerent-hornet-270b14@krzk-bin>
References: <20250123202528.223966-1-andrey.lalaev@gmail.com>
 <20250123202528.223966-2-andrey.lalaev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250123202528.223966-2-andrey.lalaev@gmail.com>

On Thu, Jan 23, 2025 at 09:25:06PM +0100, Andrei Lalaev wrote:
>     ibmpowernv
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 4cbaba15d86e..e123e06ba352 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -789,6 +789,17 @@ config SENSORS_HS3001
>  	  This driver can also be built as a module. If so, the module
>  	  will be called hs3001.
>  

Looks like you add here stray spaces.

> +config SENSORS_HTU31
> +	tristate "Measurement Specialties HTU31 humidity and temperature sensor"
> +	depends on I2C
> +	select CRC8
> +	help
> +	  If you say yes here you get support for the HTU31 humidity
> +	  and temperature sensors.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called htu31.
> +
>  config SENSORS_IBMAEM
>  	tristate "IBM Active Energy Manager temperature/power sensors and control"
>  	select IPMI_SI
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index b7ef0f0562d3..02465d959d14 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -199,6 +199,7 @@ obj-$(CONFIG_SENSORS_SCH5636)	+= sch5636.o
>  obj-$(CONFIG_SENSORS_SFCTEMP)	+= sfctemp.o
>  obj-$(CONFIG_SENSORS_SG2042_MCU) += sg2042-mcu.o
>  obj-$(CONFIG_SENSORS_SL28CPLD)	+= sl28cpld-hwmon.o
> +obj-$(CONFIG_SENSORS_HTU31)	+= htu31.o
>  obj-$(CONFIG_SENSORS_SHT15)	+= sht15.o
>  obj-$(CONFIG_SENSORS_SHT21)	+= sht21.o
>  obj-$(CONFIG_SENSORS_SHT3x)	+= sht3x.o
> diff --git a/drivers/hwmon/htu31.c b/drivers/hwmon/htu31.c
> new file mode 100644
> index 000000000000..09f979a8db92
> --- /dev/null
> +++ b/drivers/hwmon/htu31.c
> @@ -0,0 +1,335 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * The driver for Measurement Specialties HTU31 Temperature and Humidity sensor.
> + *
> + * Copyright (C) 2025
> + * Author: Andrei Lalaev <andrey.lalaev@gmail.com>
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/cleanup.h>
> +#include <linux/crc8.h>
> +#include <linux/delay.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +
> +#define HTU31_READ_TEMP_HUM_CMD	0x00
> +#define HTU31_READ_SERIAL_CMD		0x0a
> +#define HTU31_CONVERSION_CMD		0x5e
> +#define HTU31_HEATER_OFF_CMD		0x02
> +#define HTU31_HEATER_ON_CMD		0x04
> +
> +#define HTU31_TEMP_HUM_LEN		6
> +
> +/* Conversion time for the highest resolution */
> +#define HTU31_HUMIDITY_CONV_TIME	10000 /* us */
> +#define HTU31_TEMPERATURE_CONV_TIME	15000 /* us */
> +
> +#define HTU31_SERIAL_NUMBER_LEN	3
> +#define HTU31_SERIAL_NUMBER_CRC_LEN	1
> +#define HTU31_SERIAL_NUMBER_CRC_OFFSET	3
> +
> +#define HTU31_CRC8_INIT_VAL		0
> +#define HTU31_CRC8_POLYNOMIAL		0x31
> +DECLARE_CRC8_TABLE(htu31_crc8_table);
> +
> +struct htu31_data {
> +	struct i2c_client *client;
> +	struct mutex i2c_lock;

What is the lock guarding? See checkpatch below. What's confusing is
that you call it I2C but it also covers some memcpy operations and this
rtcuture, so much wider scope. Be detaile when fixing checkpatch
warning.

Please run scripts/checkpatch.pl and fix reported warnings. After that,
run also 'scripts/checkpatch.pl --strict' and (probably) fix more
warnings. Some warnings can be ignored, especially from --strict run,
but the code here looks like it needs a fix. Feel free to get in touch
if the warning is not clear.


> +	long wait_time;
> +	long temperature;
> +	long humidity;
> +	u8 serial_number[HTU31_SERIAL_NUMBER_LEN];
> +	bool heater_enable;
> +};
> +
> +static long htu31_temp_to_millicelsius(long val)
> +{
> +	return -40000 + DIV_ROUND_CLOSEST(165000 * val, 65535);
> +}
> +
> +static long htu31_relative_humidity(long val)
> +{
> +	return DIV_ROUND_CLOSEST(100000 * val, 65535);
> +}
> +
> +static int htu31_data_fetch_command(struct htu31_data *data)
> +{
> +	struct i2c_client *client = data->client;
> +	u8 conversion_on = HTU31_CONVERSION_CMD;
> +	u8 read_data_cmd = HTU31_READ_TEMP_HUM_CMD;
> +	u8 t_h_buf[HTU31_TEMP_HUM_LEN] = {};
> +	struct i2c_msg msgs[] = {
> +		{
> +			.addr = client->addr,
> +			.flags = 0,
> +			.len = 1,
> +			.buf = &read_data_cmd,
> +		},
> +		{
> +			.addr = client->addr,
> +			.flags = I2C_M_RD,
> +			.len = sizeof(t_h_buf),
> +			.buf = t_h_buf,
> +		},
> +	};
> +	int ret;
> +	u8 crc;
> +
> +	guard(mutex)(&data->i2c_lock);
> +
> +	ret = i2c_master_send(client, &conversion_on, 1);
> +	if (ret != 1) {
> +		ret = ret < 0 ? ret : -EIO;
> +		dev_err(&client->dev,
> +			"Conversion command is failed. Error code: %d\n", ret);
> +		return ret;
> +	}
> +
> +	fsleep(data->wait_time);
> +
> +	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> +	if (ret != ARRAY_SIZE(msgs)) {
> +		ret = ret < 0 ? ret : -EIO;
> +		dev_err(&client->dev,
> +			"T&H command is failed. Error code: %d\n", ret);
> +		return ret;
> +	}
> +
> +	crc = crc8(htu31_crc8_table, &t_h_buf[0], 2, HTU31_CRC8_INIT_VAL);
> +	if (crc != t_h_buf[2]) {
> +		dev_err(&client->dev, "Temperature CRC mismatch\n");
> +		return -EIO;
> +	}
> +
> +	crc = crc8(htu31_crc8_table, &t_h_buf[3], 2, HTU31_CRC8_INIT_VAL);
> +	if (crc != t_h_buf[5]) {
> +		dev_err(&client->dev, "Humidity CRC mismatch\n");
> +		return -EIO;
> +	}
> +
> +	data->temperature = htu31_temp_to_millicelsius(be16_to_cpup((__be16 *) &t_h_buf[0]));
> +	data->humidity = htu31_relative_humidity(be16_to_cpup((__be16 *) &t_h_buf[3]));
> +
> +	return 0;
> +}
> +
> +static umode_t htu31_is_visible(const void *data, enum hwmon_sensor_types type,
> +		u32 attr, int channel)
> +{
> +	switch (type) {
> +	case hwmon_temp:
> +	case hwmon_humidity:
> +		return 0444;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int htu31_read(struct device *dev, enum hwmon_sensor_types type,
> +		u32 attr, int channel, long *val)
> +{
> +	struct htu31_data *data = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = htu31_data_fetch_command(data);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		if (attr != hwmon_temp_input)
> +			return -EINVAL;
> +
> +		*val = data->temperature;
> +		break;
> +	case hwmon_humidity:
> +		if (attr != hwmon_humidity_input)
> +			return -EINVAL;
> +
> +		*val = data->humidity;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static int serial_number_populate(struct htu31_data *data)

htu31_read_serial_number(...)


> +{
> +	struct i2c_client *client = data->client;
> +	u8 read_sn_cmd = HTU31_READ_SERIAL_CMD;
> +	u8 sn_buf[HTU31_SERIAL_NUMBER_LEN + HTU31_SERIAL_NUMBER_CRC_LEN];
> +	struct i2c_msg msgs[] = {
> +		{
> +			.addr = client->addr,
> +			.flags = 0,
> +			.len = 1,
> +			.buf = &read_sn_cmd,
> +		},
> +		{
> +			.addr = client->addr,
> +			.flags = I2C_M_RD,
> +			.len = sizeof(sn_buf),
> +			.buf = sn_buf,
> +		},
> +	};
> +	int ret;
> +	u8 crc;
> +
> +	guard(mutex)(&data->i2c_lock);
> +
> +	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> +	if (ret < 0)
> +		return -EIO;
> +
> +	crc = crc8(htu31_crc8_table, sn_buf, HTU31_SERIAL_NUMBER_LEN, HTU31_CRC8_INIT_VAL);
> +	if (crc != sn_buf[HTU31_SERIAL_NUMBER_CRC_OFFSET]) {
> +		dev_err(&client->dev, "Serial number CRC mismatch\n");
> +		return -EIO;
> +	}
> +
> +	memcpy(data->serial_number, sn_buf, HTU31_SERIAL_NUMBER_LEN);

...

> +#if IS_ENABLED(CONFIG_OF)
> +static const struct of_device_id htu31_of_match[] = {
> +	{ .compatible = "meas,htu31" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, htu31_of_match);
> +#endif
> +
> +static struct i2c_driver htu31_driver = {
> +	.driver = {
> +		.name = "htu31",
> +		.of_match_table = of_match_ptr(htu31_of_match),
> +	},
> +	.probe = htu31_probe,
> +	.id_table = htu31_id,
> +};
> +module_i2c_driver(htu31_driver);
> +
> +MODULE_AUTHOR("Andrei Lalaev <andrey.lalaev@gmail.com>");
> +MODULE_DESCRIPTION("HTU31 Temperature and Humidity sensor driver");
> +MODULE_VERSION("1.0");

Drop version. Linux kernel defines the version.

Best regards,
Krzysztof

