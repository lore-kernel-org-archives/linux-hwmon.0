Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C987C77B7C
	for <linux-hwmon@archiver.kernel.org>; Wed, 24 May 2023 22:09:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231555AbjEXWJO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 24 May 2023 18:09:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230423AbjEXWJN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 24 May 2023 18:09:13 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C318119
        for <linux-hwmon@vger.kernel.org>; Wed, 24 May 2023 15:09:11 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1afeec98a00so3814045ad.3
        for <linux-hwmon@vger.kernel.org>; Wed, 24 May 2023 15:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684966151; x=1687558151;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eF94zxGWcMrm3vqEALkTDvZQKDSQiwyP0WOrFZeKLMY=;
        b=him6SAf0hpJ/VI+85/47Z3ml3xsDoJwNS04qQ8fcej7wqxWVOtAOgJz+UAe/325icq
         DWu0WO7etcd+5liDcPiwX72eBl/6VlGHbb1vLIq85qjeeaI23clKUpaVDy5tQPV/Uica
         uhI3h+YIzd0ERvHEjJn1y+M8cgmiu9NMxfvnOa3BNn4JKoVFf6Ak3MdoROEb2SKwIuVP
         rmkAsxOgbyVoAS3jzv7Y8STdjdGptzTuXlDd116CCJd6T9Tc7OKSGUrt+FIyzEaLM2se
         G2+s+3Zj6FLKMoaiT7lQCqyb4iUDRFGRbc7xKkMK76NW/rv9exXDjoe+aCBByFfV3ynX
         fWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684966151; x=1687558151;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eF94zxGWcMrm3vqEALkTDvZQKDSQiwyP0WOrFZeKLMY=;
        b=O+nRlAObGgebVDcKMk2UzRIbxPLTJAWy9zbCPKi+wu6cFekkrYlODPITh9XkXnbD21
         4ao7FvgSvSIs7HN34lrLmc4yju+I8LOVvNZVjagoe/n5IrwVOxJhETzik/Ckk1z+zm5N
         5P/C/kVFZWA11YNk9+f5fPAE2vGd2+rtj0dHgoUv0OkO3W13XFiEzpjRZbKoTf7bSUjh
         KLT4dES2IURO/A0Ot2MBbJLX5bFJ0v45vUJ+XIQLjepqRR789eRHeikLjhFJ+3ACFtFL
         cLg2uzrO7UUNNFXuVNMzrJXFjlj499dRmNdj/a6gUgVBK7xEKyAhlzFxPdXBVRAsjoMG
         Vk8A==
X-Gm-Message-State: AC+VfDy2fSUhQL+2pT6u907orPT5NtXjx2JDia9Uhl4yfFwwIy2qk7QE
        ypIqC38uqKLH2K6bJ4omsX4=
X-Google-Smtp-Source: ACHHUZ6S044dkFmnU6JCQ+uA6BDIuS6x1Xa6N6CQTGFTW4v+FDsNg19tFiNWl1I3y9biE2w3rfCA+g==
X-Received: by 2002:a17:902:680d:b0:1a5:5e7:a1cc with SMTP id h13-20020a170902680d00b001a505e7a1ccmr14893870plk.58.1684966150726;
        Wed, 24 May 2023 15:09:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c18-20020a170902d49200b00192aa53a7d5sm9304932plg.8.2023.05.24.15.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 15:09:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 24 May 2023 15:09:08 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Kirill Yatsenko <kiriyatsenko@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, delvare@suse.com, jcdra1@gmail.com
Subject: Re: [PATCH v3] hwmon: (aht10) Add support for compatible aht20
Message-ID: <8a1f2ffc-8474-4ee3-9c97-30e896dd382a@roeck-us.net>
References: <20230524201912.815993-1-kiriyatsenko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230524201912.815993-1-kiriyatsenko@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, May 24, 2023 at 10:19:12PM +0200, Kirill Yatsenko wrote:
> Add support for compatible AHT20 temperature/humidity sensor. The only
> difference between the two is that AHT20 has additional crc8 byte.
> 
> It seems like AHT15 is also supported by the driver but it wasn't
> verified and tested yet.
> 
> Tested on Beaglebone black rev C.
> 
> Signed-off-by: Kirill Yatsenko <kiriyatsenko@gmail.com>

Applied.

Thanks,
Guenter

> ---
> v2: Add aht20 to aht10_id instead of using Kconfig flag, remove ifdefs
>     as suggested by Guenter Roeck <linux@roeck-us.net>
> 
> v3: Use multi-line comments, return -EIO instead of -ENODATA, add break
>     in default switch case as suggested by Guenter Roeck <linux@roeck-us.net>
> 
>  Documentation/hwmon/aht10.rst | 20 ++++++---
>  drivers/hwmon/Kconfig         |  5 ++-
>  drivers/hwmon/aht10.c         | 84 +++++++++++++++++++++++++++--------
>  3 files changed, 83 insertions(+), 26 deletions(-)
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
> index ec7459575c58..f136bf3ff40a 100644
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
> @@ -121,8 +138,25 @@ static int aht10_polltime_expired(struct aht10_data *data)
>  	return ktime_after(difference, data->min_poll_interval);
>  }
>  
> +DECLARE_CRC8_TABLE(crc8_table);
> +
>  /**
> - * aht10_read_values() - read and parse the raw data from the AHT10
> + * crc8_check() - check crc of the sensor's measurements
> + * @raw_data: data frame received from sensor(including crc as the last byte)
> + * @count: size of the data frame
> + * Return: 0 if successful, 1 if not
> + */
> +static int crc8_check(u8 *raw_data, int count)
> +{
> +	/*
> +	 * crc calculated on the whole frame(including crc byte) should yield
> +	 * zero in case of correctly received bytes
> +	 */
> +	return crc8(crc8_table, raw_data, count, CRC8_INIT_VALUE);
> +}
> +
> +/**
> + * aht10_read_values() - read and parse the raw data from the AHT10/AHT20
>   * @data: the struct aht10_data to use for the lock
>   * Return: 0 if successful, 1 if not
>   */
> @@ -131,7 +165,7 @@ static int aht10_read_values(struct aht10_data *data)
>  	const u8 cmd_meas[] = {AHT10_CMD_MEAS, 0x33, 0x00};
>  	u32 temp, hum;
>  	int res;
> -	u8 raw_data[AHT10_MEAS_SIZE];
> +	u8 raw_data[AHT20_MEAS_SIZE];
>  	struct i2c_client *client = data->client;
>  
>  	mutex_lock(&data->lock);
> @@ -148,14 +182,19 @@ static int aht10_read_values(struct aht10_data *data)
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
> +		return -EIO;
> +	}
> +
>  	hum =   ((u32)raw_data[1] << 12u) |
>  		((u32)raw_data[2] << 4u) |
>  		((raw_data[3] & 0xF0u) >> 4u);
> @@ -292,6 +331,8 @@ static const struct hwmon_chip_info aht10_chip_info = {
>  
>  static int aht10_probe(struct i2c_client *client)
>  {
> +	const struct i2c_device_id *id = i2c_match_id(aht10_id, client);
> +	enum aht10_variant variant = id->driver_data;
>  	struct device *device = &client->dev;
>  	struct device *hwmon_dev;
>  	struct aht10_data *data;
> @@ -307,6 +348,17 @@ static int aht10_probe(struct i2c_client *client)
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
> +		break;
> +	}
> +
>  	mutex_init(&data->lock);
>  
>  	res = aht10_init(data);
> @@ -326,12 +378,6 @@ static int aht10_probe(struct i2c_client *client)
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
> @@ -343,6 +389,6 @@ static struct i2c_driver aht10_driver = {
>  module_i2c_driver(aht10_driver);
>  
>  MODULE_AUTHOR("Johannes Cornelis Draaijer <jcdra1@gmail.com>");
> -MODULE_DESCRIPTION("AHT10 Temperature and Humidity sensor driver");
> +MODULE_DESCRIPTION("AHT10/AHT20 Temperature and Humidity sensor driver");
>  MODULE_VERSION("1.0");
>  MODULE_LICENSE("GPL v2");
