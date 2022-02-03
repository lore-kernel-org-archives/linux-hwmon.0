Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF25CC433F5
	for <linux-hwmon@archiver.kernel.org>; Thu,  3 Feb 2022 19:13:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353719AbiBCTNf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 3 Feb 2022 14:13:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238196AbiBCTNe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 3 Feb 2022 14:13:34 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7555FC061714
        for <linux-hwmon@vger.kernel.org>; Thu,  3 Feb 2022 11:13:32 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id j38-20020a9d1926000000b0059fa6de6c71so3374103ota.10
        for <linux-hwmon@vger.kernel.org>; Thu, 03 Feb 2022 11:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EpnI9DSzAkJtQbzTatPyHhui5U7nLGw0Fj//guBXxmI=;
        b=bh0pUvmMss9dSuMln/Z3diLOTXBVp2KlC1d9wkJWTpKRxKFRPtclHKqayEAM4NA9LB
         GSFoFbtoviSxcDMm7xmEuSr7qdDQ+IpgFuAdYwv3pbr5ocQQiilZ73I48rAVNe350Zav
         oyneJGvNpxM2FdIn9G6TJ37byZHqqHYmpJSpBaqyNTomyYgGNDEgIejbXBPTcV41ps67
         5mscj0jmHZZ9T11TUyPAG70+XFAZxwd/gByeR5h8YNBVh6SHpjCqAsuuPqeWniQMLhfz
         KneF8BMOt1FKtoLf+GeGioPMVZ1gWun8NY1+8BeF3lCXbMaHkfLDGOad/Tz2Yl2Ja2z4
         nC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=EpnI9DSzAkJtQbzTatPyHhui5U7nLGw0Fj//guBXxmI=;
        b=qtEy0qURQoyJKiqfhwzU8usxOUnmPyig9d57i1+n/LNxPi+EseTjQIO+I1TXHnhjXs
         zBCFSs2JL2Y6DSrxEnjaLY63l1bch9aYVctcXSTXdYpCqlzy6ShunidF/oUbfsyuEfQZ
         UabrZwB/DY1ziMNgYHRQBNrNvIn+ubagv87Ac0z30dmndOOH37RvQcu9oXdrMgnE6f+u
         Xx9VWg8MAhAiyqsv3EBipvYfRz5fV1XyfxekE78yzMkAcchdc3wQiZp9FSKP/d16x/Z8
         hlL4McyPpSJKI2bpEr/O6WH1ImERMpr6BVtZM1dycQmQZ7ZMAwUM/KeydzoSzQoBfExk
         lQlQ==
X-Gm-Message-State: AOAM532nI1hWo6PutqJTcJKi6k4E6qWTOvcc+oagTyfklYt4o2xx/IxA
        wQCmPV8HOYRKRIb/+rAk9RbdsRp1GqHAow==
X-Google-Smtp-Source: ABdhPJzgErkjA4md3eJZNf2GIBdYwPlgB6Znn+qhOBauuxWwDQWXIBgTuMxp3C+2gvDRx8XreEEd8w==
X-Received: by 2002:a9d:6d01:: with SMTP id o1mr16976963otp.204.1643915611699;
        Thu, 03 Feb 2022 11:13:31 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p82sm12253388oib.25.2022.02.03.11.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 11:13:31 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 3 Feb 2022 11:13:29 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Marcello Sylvester Bauer <sylv@sylv.io>
Cc:     linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v4 4/4] hwmon: (max6639) Change from pdata to dt
 configuration
Message-ID: <20220203191329.GA237056@roeck-us.net>
References: <cover.1643299570.git.sylv@sylv.io>
 <5d4b331526abc252ef8c6a78af497a186c0baf87.1643299570.git.sylv@sylv.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d4b331526abc252ef8c6a78af497a186c0baf87.1643299570.git.sylv@sylv.io>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Jan 27, 2022 at 05:17:30PM +0100, Marcello Sylvester Bauer wrote:
> max6639_platform_data is not used by any in-kernel driver and does not
> address the MAX6639 channels separately. Move to device tree
> configuration with explicit properties to configure each channel.
> 
> Non-DT platform can still use this module with its default
> configuration.
> 
> Signed-off-by: Marcello Sylvester Bauer <sylv@sylv.io>
> ---
>  drivers/hwmon/max6639.c               | 162 +++++++++++++++++++-------
>  include/linux/platform_data/max6639.h |  15 ---
>  2 files changed, 119 insertions(+), 58 deletions(-)
>  delete mode 100644 include/linux/platform_data/max6639.h
> 
> diff --git a/drivers/hwmon/max6639.c b/drivers/hwmon/max6639.c
> index 14bb7726f8d7..717bde3392bd 100644
> --- a/drivers/hwmon/max6639.c
> +++ b/drivers/hwmon/max6639.c
> @@ -19,7 +19,6 @@
>  #include <linux/hwmon-sysfs.h>
>  #include <linux/err.h>
>  #include <linux/mutex.h>
> -#include <linux/platform_data/max6639.h>
>  
>  /* Addresses to scan */
>  static const unsigned short normal_i2c[] = { 0x2c, 0x2e, 0x2f, I2C_CLIENT_END };
> @@ -85,8 +84,9 @@ struct max6639_data {
>  	u8 temp_ot[2];		/* OT Temperature, 0..255 C (->_emergency) */
>  
>  	/* Register values initialized only once */
> -	u8 ppr;			/* Pulses per rotation 0..3 for 1..4 ppr */
> -	u8 rpm_range;		/* Index in above rpm_ranges table */
> +	u8 ppr[2];		/* Pulses per rotation 0..3 for 1..4 ppr */
> +	u8 rpm_range[2];	/* Index in above rpm_ranges table */
> +	u8 pwm_polarity[2];	/* Fans PWM polarity, 0..1 */
>  
>  	/* Optional regulator for FAN supply */
>  	struct regulator *reg;
> @@ -319,7 +319,7 @@ static ssize_t fan_input_show(struct device *dev,
>  		return PTR_ERR(data);
>  
>  	return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan[attr->index],
> -		       data->rpm_range));
> +		       data->rpm_range[attr->index]));
>  }
>  
>  static ssize_t alarm_show(struct device *dev,
> @@ -386,28 +386,26 @@ static struct attribute *max6639_attrs[] = {
>  ATTRIBUTE_GROUPS(max6639);
>  
>  /*
> - *  returns respective index in rpm_ranges table
> - *  1 by default on invalid range
> + *  Get respective index in rpm_ranges table
>   */
> -static int rpm_range_to_reg(int range)
> +static int rpm_range_to_index(u8 *index, int range)

That doesn't reauire an extra parameter; the return value can be used both
as index and error return value.

>  {
>  	int i;
>  
>  	for (i = 0; i < ARRAY_SIZE(rpm_ranges); i++) {
> -		if (rpm_ranges[i] == range)
> -			return i;
> +		if (rpm_ranges[i] == range) {

Keep
			return i;

> +			*index = i;
> +			return 0;
> +		}
>  	}
>  
> -	return 1; /* default: 4000 RPM */
> +	return -EINVAL;
>  }
>  
>  static int max6639_init_client(struct i2c_client *client,
>  			       struct max6639_data *data)
>  {
> -	struct max6639_platform_data *max6639_info =
> -		dev_get_platdata(&client->dev);
>  	int i;
> -	int rpm_range = 1; /* default: 4000 RPM */
>  	int err;
>  
>  	/* Reset chip to default values, see below for GCONFIG setup */
> @@ -416,43 +414,25 @@ static int max6639_init_client(struct i2c_client *client,
>  	if (err)
>  		goto exit;
>  
> -	/* Fans pulse per revolution is 2 by default */
> -	if (max6639_info && max6639_info->ppr > 0 &&
> -			max6639_info->ppr < 5)
> -		data->ppr = max6639_info->ppr;
> -	else
> -		data->ppr = 2;
> -	data->ppr -= 1;
> -
> -	if (max6639_info)
> -		rpm_range = rpm_range_to_reg(max6639_info->rpm_range);
> -	data->rpm_range = rpm_range;
> -
>  	for (i = 0; i < 2; i++) {
>  
>  		/* Set Fan pulse per revolution */
>  		err = i2c_smbus_write_byte_data(client,
>  				MAX6639_REG_FAN_PPR(i),
> -				data->ppr << 6);
> +				data->ppr[i] << 6);
>  		if (err)
>  			goto exit;
>  
>  		/* Fans config PWM, RPM */
>  		err = i2c_smbus_write_byte_data(client,
>  			MAX6639_REG_FAN_CONFIG1(i),
> -			MAX6639_FAN_CONFIG1_PWM | rpm_range);
> +			MAX6639_FAN_CONFIG1_PWM | data->rpm_range[i]);
>  		if (err)
>  			goto exit;
>  
> -		/* Fans PWM polarity high by default */
> -		if (max6639_info && max6639_info->pwm_polarity == 0)
> -			err = i2c_smbus_write_byte_data(client,
> -				MAX6639_REG_FAN_CONFIG2a(i), 0x00);
> -		else
> -			err = i2c_smbus_write_byte_data(client,
> -				MAX6639_REG_FAN_CONFIG2a(i), 0x02);
> -		if (err)
> -			goto exit;
> +		/* Fans PWM polarity */
> +		err = i2c_smbus_write_byte_data(client,
> +			MAX6639_REG_FAN_CONFIG2a(i), data->pwm_polarity[i] ? 0x00 : 0x02);
>  
>  		/*
>  		 * /THERM full speed enable,
> @@ -464,10 +444,6 @@ static int max6639_init_client(struct i2c_client *client,
>  		if (err)
>  			goto exit;
>  
> -		/* Max. temp. 80C/90C/100C */
> -		data->temp_therm[i] = 80;
> -		data->temp_alert[i] = 90;
> -		data->temp_ot[i] = 100;
>  		err = i2c_smbus_write_byte_data(client,
>  				MAX6639_REG_THERM_LIMIT(i),
>  				data->temp_therm[i]);
> @@ -483,8 +459,6 @@ static int max6639_init_client(struct i2c_client *client,
>  		if (err)
>  			goto exit;
>  
> -		/* PWM 120/120 (i.e. 100%) */
> -		data->pwm[i] = 120;
>  		err = i2c_smbus_write_byte_data(client,
>  				MAX6639_REG_TARGTDUTY(i), data->pwm[i]);
>  		if (err)
> @@ -524,12 +498,87 @@ static void max6639_regulator_disable(void *data)
>  	regulator_disable(data);
>  }
>  
> +static int max6639_probe_child_from_dt(struct i2c_client *client,
> +				      struct device_node *child,
> +				      struct max6639_data *data)
> +
> +{
> +	struct device *dev = &client->dev;
> +	u32 i, val;
> +	int err;
> +
> +	err = of_property_read_u32(child, "reg", &i);
> +	if (err) {
> +		dev_err(dev, "missing reg property of %pOFn\n", child);
> +		return err;
> +	}
> +
> +	if (i >= 2) {
> +		dev_err(dev, "invalid reg %d of %pOFn\n", i, child);
> +		return -EINVAL;
> +	}
> +
> +	err = of_property_read_u32(child, "pulses-per-revolution", &val);
> +	if (!err) {
> +		if (val < 0 || val > 5) {
> +			dev_err(dev, "invalid pulses-per-revolution %d of %pOFn\n", val, child);
> +			return -EINVAL;
> +		}
> +		data->ppr[i] = val;
> +	}
> +
> +	err = of_property_read_u32(child, "rpm-max", &val);
> +	if (!err) {
> +		err = rpm_range_to_index(&data->rpm_range[i], val);
> +		if (err) {
> +			dev_err(dev, "invalid rpm-max %d of %pOFn\n", val, child);
> +			return err;
> +		}

		err = rpm_range_to_index(val);
		if (err < 0) {
			dev_err(dev, "invalid rpm-max %d of %pOFn\n", val, child);
			return err;
		}
		data->rpm_range[i] = err;

> +	}
> +
> +	err = of_property_read_u32(child, "pwm-polarity", &val);
> +	if (!err) {
> +		if (val > 1) {
> +			dev_err(dev, "invalid pwm-polarity %d of %pOFn\n", val, child);
> +			return -EINVAL;
> +		}
> +		data->pwm_polarity[i] = val;
> +	}
> +
> +	return 0;
> +}
> +
> +static int max6639_probe_from_dt(struct i2c_client *client, struct max6639_data *data)
> +{
> +	struct device *dev = &client->dev;
> +	const struct device_node *np = dev->of_node;
> +	struct device_node *child;
> +	int err;
> +
> +	/* Compatible with non-DT platforms */
> +	if (!np)
> +		return 0;
> +
> +	for_each_child_of_node(np, child) {
> +		if (strcmp(child->name, "channel"))
> +			continue;
> +
> +		err = max6639_probe_child_from_dt(client, child, data);
> +		if (err) {
> +			of_node_put(child);
> +			return err;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static int max6639_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
>  	struct max6639_data *data;
>  	struct device *hwmon_dev;
> -	int err;
> +	int err, i;
>  
>  	data = devm_kzalloc(dev, sizeof(struct max6639_data), GFP_KERNEL);
>  	if (!data)
> @@ -560,6 +609,24 @@ static int max6639_probe(struct i2c_client *client)
>  
>  	mutex_init(&data->update_lock);
>  
> +	/* default values */
> +	for (i = 0; i < 2; i++) {
> +		/* 4000 RPM */
> +		data->rpm_range[i] = 1;
> +		data->ppr[i] = 2;
> +		data->pwm_polarity[i] = 1;
> +		/* Max. temp. 80C/90C/100C */
> +		data->temp_therm[i] = 80;
> +		data->temp_alert[i] = 90;
> +		data->temp_ot[i] = 100;
> +		/* PWM 120/120 (i.e. 100%) */
> +		data->pwm[i] = 120;
> +	}
> +
> +	err = max6639_probe_from_dt(client, data);
> +	if (err)
> +		return err;
> +
>  	/* Initialize the max6639 chip */
>  	err = max6639_init_client(client, data);
>  	if (err < 0)
> @@ -618,6 +685,14 @@ static const struct i2c_device_id max6639_id[] = {
>  
>  MODULE_DEVICE_TABLE(i2c, max6639_id);
>  
> +#ifdef CONFIG_OF
> +static const struct of_device_id maxim_of_platform_match[] = {
> +	{.compatible = "maxim,max6639"},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, maxim_of_platform_match);
> +#endif
> +
>  static SIMPLE_DEV_PM_OPS(max6639_pm_ops, max6639_suspend, max6639_resume);
>  
>  static struct i2c_driver max6639_driver = {
> @@ -625,6 +700,7 @@ static struct i2c_driver max6639_driver = {
>  	.driver = {
>  		   .name = "max6639",
>  		   .pm = &max6639_pm_ops,
> +		   .of_match_table = of_match_ptr(maxim_of_platform_match),
>  		   },
>  	.probe_new = max6639_probe,
>  	.id_table = max6639_id,
> diff --git a/include/linux/platform_data/max6639.h b/include/linux/platform_data/max6639.h
> deleted file mode 100644
> index 65bfdb4fdc15..000000000000
> --- a/include/linux/platform_data/max6639.h
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef _LINUX_MAX6639_H
> -#define _LINUX_MAX6639_H
> -
> -#include <linux/types.h>
> -
> -/* platform data for the MAX6639 temperature sensor and fan control */
> -
> -struct max6639_platform_data {
> -	bool pwm_polarity;	/* Polarity low (0) or high (1, default) */
> -	int ppr;		/* Pulses per rotation 1..4 (default == 2) */
> -	int rpm_range;		/* 2000, 4000 (default), 8000 or 16000 */
> -};
> -
> -#endif /* _LINUX_MAX6639_H */
