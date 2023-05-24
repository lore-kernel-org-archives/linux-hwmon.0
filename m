Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA75C77B7A
	for <linux-hwmon@archiver.kernel.org>; Wed, 24 May 2023 19:02:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbjEXTBy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 24 May 2023 15:01:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjEXTBX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 24 May 2023 15:01:23 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26C3D119
        for <linux-hwmon@vger.kernel.org>; Wed, 24 May 2023 12:01:22 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-64d57cd373fso117521b3a.1
        for <linux-hwmon@vger.kernel.org>; Wed, 24 May 2023 12:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684954881; x=1687546881;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q2MM51to1J4TkSqRgYVRrM5MePaHoiqZ6gFxEbnTffQ=;
        b=aXTz0qu3emGVQ2hqOn36XouKH3Z2FktxxKDm9gXlBkbHM225x8AnNgmhrCkK97u5PW
         fI0U+SlO6NGhV6oc92/eF7AH+37/aIYAS1QlS+eZrCNCi6hbLF57IU9I40/5igNjAf7M
         MssOkKhWjBqf8upLeOEBG9rqIxlDUny+cR9oIGEeAa5BWNID4WFhB3cewc8V8Ae2G8TL
         qbrHYhJ0ybOfSgiTxauCzALhzkzxxe3AdOc0wWh80jzDOh1gmDB8lChhdTa0v93DtTEz
         FgKgBb6f+BZ1gYLmAB+MezJQ3hteWgEzQkdNboWfNtO35EDD2xWFugwE9Pob7kRsCBad
         QdTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684954881; x=1687546881;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q2MM51to1J4TkSqRgYVRrM5MePaHoiqZ6gFxEbnTffQ=;
        b=cTF741xDVLw3hEdhpvLWRRV0KCem5GqLyWFMokz4Npx88I3VXu9IC98ad0g37CmLhe
         GzSJ2uxY+0hPoy078FG/iPtXfpgwciYpd7v4pYjsgDEiBgKxvSRNr7zDOItKySAtAVe+
         gs/9KU6/VrkRdW7xrSsFus/6UnAbIAT526N7IwvrmJaXIhWMb308jh5o5d12Zl8V4yN0
         xNcYRgCN0nNBc1QNf1IU0j6TTAHNyf05D8whB+1owH7cmNhb2EYZAtTzMVc8uH5Hf8Bk
         M7J+drDf2aNAOMhZUj/NEFXeOuHOa7VdVAX4SwznbMPu3yT7QP1JzLlOypS9glnxAC20
         DQwQ==
X-Gm-Message-State: AC+VfDw2dSFkdZ/tRctSzcgNLDJvwTTxM2ujPDVvo4oaN5dvGpXcsF4B
        Mvzx7ScLPmFf0Q+wLOfAmwZLoH8qSsA=
X-Google-Smtp-Source: ACHHUZ4sit0baDoQiWipFXJayI37eEHn/rKaw1bVR6FL0aA5Enl/ZULXDNWZpJ6pbXQnuVRVXH5bxw==
X-Received: by 2002:a05:6a20:3c8b:b0:10c:d5dd:c223 with SMTP id b11-20020a056a203c8b00b0010cd5ddc223mr339718pzj.15.1684954881116;
        Wed, 24 May 2023 12:01:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h22-20020a632116000000b00519c3475f21sm8238729pgh.46.2023.05.24.12.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 12:01:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 24 May 2023 12:01:18 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Kirill Yatsenko <kiriyatsenko@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, delvare@suse.com, jcdra1@gmail.com
Subject: Re: [PATCH v2] hwmon: (aht10) Add support for compatible aht20
Message-ID: <3ba29c53-3097-4887-9d5f-e5be0edad793@roeck-us.net>
References: <20230524184611.709662-1-kiriyatsenko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230524184611.709662-1-kiriyatsenko@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, May 24, 2023 at 08:46:11PM +0200, Kirill Yatsenko wrote:
> Add support for compatible AHT20 temperature/humidity sensor. The only
> difference between the two is that AHT20 has additional crc8 byte.
> 
> It seems like AHT15 is also supported by the driver but it wasn't
> verified and tested yet.
> 
> Tested on Beaglebone black rev C.
> 
> Signed-off-by: Kirill Yatsenko <kiriyatsenko@gmail.com>
> ---
> v2: Add aht20 to aht10_id instead of using Kconfig flag, remove ifdefs
>     as suggested by Guenter Roeck <linux@roeck-us.net>
> 
>  Documentation/hwmon/aht10.rst | 20 ++++++---
>  drivers/hwmon/Kconfig         |  5 ++-
>  drivers/hwmon/aht10.c         | 81 +++++++++++++++++++++++++++--------
>  3 files changed, 80 insertions(+), 26 deletions(-)
> 
> diff --git a/Documentation/hwmon/aht10.rst b/Documentation/hwmon/aht10.rst
> index 4e198c5eb683..213644b4ecba 100644
> --- a/Documentation/hwmon/aht10.rst
> +++ b/Documentation/hwmon/aht10.rst
> @@ -5,32 +5,42 @@ Kernel driver aht10
>  
>  Supported chips:
>  
> -  * Aosong AHT10
> +  * Aosong AHT10/AHT20
>  
>      Prefix: 'aht10'
>  
>      Addresses scanned: None
>  
> -    Datasheet:
> +    Datasheet(AHT10):
>  
>        Chinese: http://www.aosong.com/userfiles/files/media/AHT10%E4%BA%A7%E5%93%81%E6%89%8B%E5%86%8C%20A3%2020201210.pdf
>        English: https://server4.eca.ir/eshop/AHT10/Aosong_AHT10_en_draft_0c.pdf
>  
> +    Datasheet(AHT20):
> +
> +      English: http://www.aosong.com/userfiles/files/media/Data%20Sheet%20AHT20.pdf
> +
>  Author: Johannes Cornelis Draaijer <jcdra1@gmail.com>
>  
>  
>  Description
>  -----------
>  
> -The AHT10 is a Temperature and Humidity sensor
> +The AHT10/AHT20 is a Temperature and Humidity sensor
>  
>  The address of this i2c device may only be 0x38
>  
> +Special Features
> +----------------
> +
> +AHT20 has additional CRC8 support which is sent as the last byte of the sensor
> +values.
> +
>  Usage Notes
>  -----------
>  
> -This driver does not probe for AHT10 devices, as there is no reliable
> -way to determine if an i2c chip is or isn't an AHT10. The device has
> +This driver does not probe for AHT10/ATH20 devices, as there is no reliable
> +way to determine if an i2c chip is or isn't an AHT10/AHT20. The device has
>  to be instantiated explicitly with the address 0x38. See
>  Documentation/i2c/instantiating-devices.rst for details.
>  
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index fc640201a2de..bf73934a6eee 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -255,10 +255,11 @@ config SENSORS_ADT7475
>  	  will be called adt7475.
>  
>  config SENSORS_AHT10
> -	tristate "Aosong AHT10"
> +	tristate "Aosong AHT10, AHT20"
>  	depends on I2C
> +	select CRC8
>  	help
> -	  If you say yes here, you get support for the Aosong AHT10
> +	  If you say yes here, you get support for the Aosong AHT10 and AHT20
>  	  temperature and humidity sensors
>  
>  	  This driver can also be built as a module. If so, the module
> diff --git a/drivers/hwmon/aht10.c b/drivers/hwmon/aht10.c
> index ec7459575c58..02396ebe6ef5 100644
> --- a/drivers/hwmon/aht10.c
> +++ b/drivers/hwmon/aht10.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  
>  /*
> - * aht10.c - Linux hwmon driver for AHT10 Temperature and Humidity sensor
> + * aht10.c - Linux hwmon driver for AHT10/AHT20 Temperature and Humidity sensors
>   * Copyright (C) 2020 Johannes Cornelis Draaijer
>   */
>  
> @@ -10,9 +10,13 @@
>  #include <linux/i2c.h>
>  #include <linux/ktime.h>
>  #include <linux/module.h>
> +#include <linux/crc8.h>
>  
>  #define AHT10_MEAS_SIZE		6
>  
> +#define AHT20_MEAS_SIZE		7
> +#define AHT20_CRC8_POLY		0x31
> +
>  /*
>   * Poll intervals (in milliseconds)
>   */
> @@ -44,9 +48,18 @@
>  
>  #define AHT10_MAX_POLL_INTERVAL_LEN	30
>  
> +enum aht10_variant { aht10, aht20 };
> +
> +static const struct i2c_device_id aht10_id[] = {
> +	{ "aht10", aht10 },
> +	{ "aht20", aht20 },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(i2c, aht10_id);
> +
>  /**
> - *   struct aht10_data - All the data required to operate an AHT10 chip
> - *   @client: the i2c client associated with the AHT10
> + *   struct aht10_data - All the data required to operate an AHT10/AHT20 chip
> + *   @client: the i2c client associated with the AHT10/AHT20
>   *   @lock: a mutex that is used to prevent parallel access to the
>   *          i2c client
>   *   @min_poll_interval: the minimum poll interval
> @@ -56,12 +69,14 @@
>   *                   the chip from warming up due to the heat it generates.
>   *                   If it's unwanted, it can be ignored setting it to
>   *                   it to 0. Default value is 2000 ms
> - *   @previous_poll_time: the previous time that the AHT10
> + *   @previous_poll_time: the previous time that the AHT10/AHT20
>   *                        was polled
>   *   @temperature: the latest temperature value received from
> - *                 the AHT10
> + *                 the AHT10/AHT20
>   *   @humidity: the latest humidity value received from the
> - *              AHT10
> + *              AHT10/AHT20
> + *   @crc8: crc8 support flag
> + *   @meas_size: measurements data size
>   */
>  
>  struct aht10_data {
> @@ -75,11 +90,13 @@ struct aht10_data {
>  	ktime_t previous_poll_time;
>  	int temperature;
>  	int humidity;
> +	bool crc8;
> +	unsigned int meas_size;
>  };
>  
>  /**
> - * aht10_init() - Initialize an AHT10 chip
> - * @data: the data associated with this AHT10 chip
> + * aht10_init() - Initialize an AHT10/AHT20 chip
> + * @data: the data associated with this AHT10/AHT20 chip
>   * Return: 0 if successful, 1 if not
>   */
>  static int aht10_init(struct aht10_data *data)
> @@ -121,8 +138,23 @@ static int aht10_polltime_expired(struct aht10_data *data)
>  	return ktime_after(difference, data->min_poll_interval);
>  }
>  
> +DECLARE_CRC8_TABLE(crc8_table);
> +
> +/**
> + * crc8_check() - check crc of the sensor's measurements
> + * @raw_data: data frame received from sensor(including crc as the last byte)
> + * @count: size of the data frame
> + * Return: 0 if successful, 1 if not
> + */
> +static int crc8_check(u8 *raw_data, int count)
> +{
> +	// crc calculated on the whole frame(including crc byte) should yield
> +	// zero in case of correctly received bytes

Please use standard multi-line comments.

> +	return crc8(crc8_table, raw_data, count, CRC8_INIT_VALUE);
> +}
> +
>  /**
> - * aht10_read_values() - read and parse the raw data from the AHT10
> + * aht10_read_values() - read and parse the raw data from the AHT10/AHT20
>   * @data: the struct aht10_data to use for the lock
>   * Return: 0 if successful, 1 if not
>   */
> @@ -131,7 +163,7 @@ static int aht10_read_values(struct aht10_data *data)
>  	const u8 cmd_meas[] = {AHT10_CMD_MEAS, 0x33, 0x00};
>  	u32 temp, hum;
>  	int res;
> -	u8 raw_data[AHT10_MEAS_SIZE];
> +	u8 raw_data[AHT20_MEAS_SIZE];
>  	struct i2c_client *client = data->client;
>  
>  	mutex_lock(&data->lock);
> @@ -148,14 +180,19 @@ static int aht10_read_values(struct aht10_data *data)
>  
>  	usleep_range(AHT10_MEAS_DELAY, AHT10_MEAS_DELAY + AHT10_DELAY_EXTRA);
>  
> -	res = i2c_master_recv(client, raw_data, AHT10_MEAS_SIZE);
> -	if (res != AHT10_MEAS_SIZE) {
> +	res = i2c_master_recv(client, raw_data, data->meas_size);
> +	if (res != data->meas_size) {
>  		mutex_unlock(&data->lock);
>  		if (res >= 0)
>  			return -ENODATA;
>  		return res;
>  	}
>  
> +	if (data->crc8 && crc8_check(raw_data, data->meas_size)) {
> +		mutex_unlock(&data->lock);
> +		return -ENODATA;

-ENODATA for checksum errors is not appropriate. I would suggest
to use -EIO.

> +	}
> +
>  	hum =   ((u32)raw_data[1] << 12u) |
>  		((u32)raw_data[2] << 4u) |
>  		((raw_data[3] & 0xF0u) >> 4u);
> @@ -292,6 +329,8 @@ static const struct hwmon_chip_info aht10_chip_info = {
>  
>  static int aht10_probe(struct i2c_client *client)
>  {
> +	const struct i2c_device_id *id = i2c_match_id(aht10_id, client);
> +	enum aht10_variant variant = (enum aht10_variant)id->driver_data;

This should not require a type cast.

>  	struct device *device = &client->dev;
>  	struct device *hwmon_dev;
>  	struct aht10_data *data;
> @@ -307,6 +346,16 @@ static int aht10_probe(struct i2c_client *client)
>  	data->min_poll_interval = ms_to_ktime(AHT10_DEFAULT_MIN_POLL_INTERVAL);
>  	data->client = client;
>  
> +	switch (variant) {
> +	case aht20:
> +		data->meas_size = AHT20_MEAS_SIZE;
> +		data->crc8 = true;
> +		crc8_populate_msb(crc8_table, AHT20_CRC8_POLY);
> +		break;
> +	default:
> +		data->meas_size = AHT10_MEAS_SIZE;

Add
		break;

> +	}
> +
>  	mutex_init(&data->lock);
>  
>  	res = aht10_init(data);
> @@ -326,12 +375,6 @@ static int aht10_probe(struct i2c_client *client)
>  	return PTR_ERR_OR_ZERO(hwmon_dev);
>  }
>  
> -static const struct i2c_device_id aht10_id[] = {
> -	{ "aht10", 0 },
> -	{ },
> -};
> -MODULE_DEVICE_TABLE(i2c, aht10_id);
> -
>  static struct i2c_driver aht10_driver = {
>  	.driver = {
>  		.name = "aht10",
> @@ -343,6 +386,6 @@ static struct i2c_driver aht10_driver = {
>  module_i2c_driver(aht10_driver);
>  
>  MODULE_AUTHOR("Johannes Cornelis Draaijer <jcdra1@gmail.com>");
> -MODULE_DESCRIPTION("AHT10 Temperature and Humidity sensor driver");
> +MODULE_DESCRIPTION("AHT10/AHT20 Temperature and Humidity sensor driver");
>  MODULE_VERSION("1.0");
>  MODULE_LICENSE("GPL v2");
> -- 
> 2.25.1
> 
