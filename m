Received: from smtp.smtpout.orange.fr (smtp-82.smtpout.orange.fr [80.12.242.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D531D3594D;
	Fri, 24 Jan 2025 12:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737720971; cv=none; b=J8OcVWGifLsodXAbs915QTGvudYoX1ee4PPnb5ZQASSwjkTkRdMER04Gzj+UHM3mBtjHKxF3JDiHhaxPW+gdu1JyutlcTtJJAX0UAzPqZ4u4IDCuM0YeiN97q+NyuBD9vfCJGnybNhDgOcOKx6vPUChXKlTGuPKqEJtf/w5+T7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737720971; c=relaxed/simple;
	bh=9ENlOYiberbziazgp8yWjlO+2waSMkjgL61NP1jYtw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cLDs3oASoAgH9xRn7jxFslx3XHCwWr5u51Y9CrbRL6prrCM8zOEW71d6k/H6+dEFuhZaoTHye25M6kin2WCUJBeuS7lI3AaqLgXGRASVxe++7ut3oZf4YSQOugNJ2Cc2yO/pqkyKMu/p8SmWU10yCiYBdj5H4W14+gao+LMijUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=LAM9hLhw; arc=none smtp.client-ip=80.12.242.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="LAM9hLhw"
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id bIaKtnCUOp1eZbIaNtPDhU; Fri, 24 Jan 2025 13:14:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1737720896;
	bh=zewGTqTRviqQatlp616LnOknYGSxX/Smo/DU0+JId8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=LAM9hLhwvawPKZkRR7ijHkN4GvJ6igfn60QUKjZvghZJlvBlb9CeA1AvuHShKkAf/
	 oB2aDUWUgJ5A4qnkV1NwhPbGBtosyJbZQV/DxQsGe4gXskYS6dndOf6gq6EoFZgM7X
	 nB4VysZXQd8VfwvrOW3MJA+lVRI3RRYg5UkVDj9nnixFtMignR4jebmFPICOqbNG5p
	 yayd38iqMNqdIyxcbcCgek1EYca2RJkDeOPh/zT3IvJI4AkZCrtAmJhIQRXKbDXj2C
	 b5VBdyMOgW1pWrv7EX3Hq/Z9XPi1iZUMKro9RqrZJXs/oiNkLnFpshWqyU07EmdwoL
	 hEI7Bojxbd5Jw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 24 Jan 2025 13:14:56 +0100
X-ME-IP: 90.11.132.44
Message-ID: <a27c761e-12d7-4a00-b5bb-95feabcd1a3c@wanadoo.fr>
Date: Fri, 24 Jan 2025 13:14:51 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hwmon: add driver for HTU31
To: Andrei Lalaev <andrey.lalaev@gmail.com>, jdelvare@suse.com,
 linux@roeck-us.net, conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250123202528.223966-1-andrey.lalaev@gmail.com>
 <20250123202528.223966-2-andrey.lalaev@gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250123202528.223966-2-andrey.lalaev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 23/01/2025 à 21:25, Andrei Lalaev a écrit :
> Add base support for HTU31 temperature and humidity sensor.
> 
> Besides temperature and humidity values, the driver also exports a 24-bit
> serial number to sysfs.
> 
> Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
> ---

...

> +static int htu31_read(struct device *dev, enum hwmon_sensor_types type,
> +		u32 attr, int channel, long *val)
> +{
> +	struct htu31_data *data = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = htu31_data_fetch_command(data);
> +

Unneeded empty line.

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

Why not return ret?

> +
> +	crc = crc8(htu31_crc8_table, sn_buf, HTU31_SERIAL_NUMBER_LEN, HTU31_CRC8_INIT_VAL);
> +	if (crc != sn_buf[HTU31_SERIAL_NUMBER_CRC_OFFSET]) {
> +		dev_err(&client->dev, "Serial number CRC mismatch\n");
> +		return -EIO;
> +	}
> +
> +	memcpy(data->serial_number, sn_buf, HTU31_SERIAL_NUMBER_LEN);
> +
> +	return 0;
> +}

...

> +static ssize_t heater_enable_store(struct device *dev,
> +				   struct device_attribute *attr,
> +				   const char *buf,
> +				   size_t count)
> +{
> +	struct htu31_data *data = dev_get_drvdata(dev);
> +	u8 heater_cmd;
> +	bool status;
> +	int ret;
> +
> +	ret = kstrtobool(buf, &status);
> +	if (ret)
> +		return ret;
> +
> +	heater_cmd = status ? HTU31_HEATER_ON_CMD : HTU31_HEATER_OFF_CMD;
> +
> +	guard(mutex)(&data->i2c_lock);
> +
> +	ret = i2c_master_send(data->client, &heater_cmd, 1);
> +	if (ret < 0)
> +		return -EIO;

Why not return ret?

> +
> +	data->heater_enable = status;
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(heater_enable);
> +
> +static ssize_t serial_number_show(struct device *dev,
> +				  struct device_attribute *attr,
> +				  char *buf)
> +{
> +	struct htu31_data *data = dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "%X%X%X\n", data->serial_number[0],
> +					   data->serial_number[1],
> +					   data->serial_number[2]);
> +}
> +
> +static DEVICE_ATTR_RO(serial_number);
> +
> +static struct attribute *htu31_attrs[] = {
> +	&dev_attr_heater_enable.attr,
> +	&dev_attr_serial_number.attr,
> +	NULL,

No need for trailing comma after a terminator

> +};
> +
> +ATTRIBUTE_GROUPS(htu31);
> +
> +static const struct hwmon_channel_info * const htu31_info[] = {
> +	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
> +	HWMON_CHANNEL_INFO(humidity, HWMON_H_INPUT),
> +	NULL,

No need for trailing comma after a terminator

> +};

...

> +static int htu31_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct device *hwmon_dev;
> +	struct htu31_data *data;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->client = client;
> +	data->wait_time = HTU31_TEMPERATURE_CONV_TIME + HTU31_HUMIDITY_CONV_TIME;
> +
> +	mutex_init(&data->i2c_lock);

Maybe devm_mutex_init()?

> +
> +	crc8_populate_msb(htu31_crc8_table, HTU31_CRC8_POLYNOMIAL);
> +
> +	if (serial_number_populate(data)) {

Maybe:
     ret = serial_number_populate(data);
     if (ret) {
         ...
         return ret;
     }

> +		dev_err(dev, "Failed to read serial number\n");
> +		return -EIO;
> +	}
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev,
> +							 client->name,
> +							 data,
> +							 &htu31_chip_info,
> +							 htu31_groups);
> +
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static const struct i2c_device_id htu31_id[] = {
> +	{ "htu31" },
> +	{ },

No need for trailing comma after a terminator

> +};
> +MODULE_DEVICE_TABLE(i2c, htu31_id);
> +
> +#if IS_ENABLED(CONFIG_OF)
> +static const struct of_device_id htu31_of_match[] = {
> +	{ .compatible = "meas,htu31" },
> +	{ },

No need for trailing comma after a terminator

> +};
> +MODULE_DEVICE_TABLE(of, htu31_of_match);

...

CJ
