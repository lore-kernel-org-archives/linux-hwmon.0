Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B81C004C0
	for <linux-hwmon@archiver.kernel.org>; Mon, 23 Oct 2023 14:44:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbjJWOoA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 23 Oct 2023 10:44:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233690AbjJWOnu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 23 Oct 2023 10:43:50 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E85062D60;
        Mon, 23 Oct 2023 07:42:30 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-d9a58f5f33dso3130601276.1;
        Mon, 23 Oct 2023 07:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698072149; x=1698676949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=zH8mUOymJbvzzJhr/S7hsIyJARM0IAtp1qxr/iVjEAc=;
        b=dKlJQct+iQCAhINFWckXHe//c8w7WfKWZ9lBkZC5PE3iGw2S86wjE4Zt89U6O3kyjZ
         dBfZw/C4DpvQZmSclCo7amHKN3cxmfwCpmrvc10ihle0t/kcPvDuNUK8nXr+C7VVPmNy
         sKUfToHRlrmD38ZHIqMoOMu3GtDPsV/9MCEDkymcclU1eANIjfIn0J4pFpK3tdUJRLHk
         FsMPpDYAMZyGfuZmlKzUL/CHYATtL6DTQr9aKzBcRKsz8TEpfXy/PH6NTGK0E0HMxvcf
         m0UD+DxaK4XE7dokuB2S3Pi3Kv02jJFD9LZVLALvLcVuS//s5QXfktdtr4G5OZXVLrZ3
         Msew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698072149; x=1698676949;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zH8mUOymJbvzzJhr/S7hsIyJARM0IAtp1qxr/iVjEAc=;
        b=weoy0ADjq4A1BEY0NzCUW93M2NYLc5R/ze0FiRltt4Fe4cMyn3xohbXqSpfX8Kw1jm
         KzyAVX7EZEGVO4HdUu4JWfSXyEbP+t0SQUh9iNW7BKwNEbXkS0Bmqw/p85mlB2BPaDg5
         O4WPpfDpmhkydmDs4T1vVXBFoxGnpELUF+BuMLH7VcNu7JZpQe5wnYcwu1Yzy2l5AM46
         lAMLVH+K4aexAqKqke/YuReWGuA6V5S45aCXoVDp6G+fbNFXUqPgQZdjGTdNifupwEe6
         0DR/qCLbOmmqFNugnul3boCZqKwZEyjxHNtaE+vOl4unHt4esdhF+EhKUmnFzhBaSU5o
         VXuw==
X-Gm-Message-State: AOJu0Yw6IiG5HrNA6CkT5YwsBh4d1m3yJSbv22pikYw2j0SZMbuAw8jg
        duPrfkRyJGr7eY7dBTQS374=
X-Google-Smtp-Source: AGHT+IH0YgwN+fFhm/8kUt+n0BhXZx5pK0fSmyLIq13q8GGMEeF70ETrY9+QoSkBwFyvTnO8xXA15g==
X-Received: by 2002:a5b:b0e:0:b0:d9b:9f55:8ccf with SMTP id z14-20020a5b0b0e000000b00d9b9f558ccfmr9068235ybp.32.1698072149555;
        Mon, 23 Oct 2023 07:42:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n22-20020a25da16000000b00d9caecd5c86sm2793846ybf.62.2023.10.23.07.42.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 07:42:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2943d0a3-7119-f813-cc6a-4418fc35c3ff@roeck-us.net>
Date:   Mon, 23 Oct 2023 07:42:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] hwmon: (pmbus/max31785) Add delay between bus accesses
Content-Language: en-US
To:     Lakshmi Yadlapati <lakshmiy@us.ibm.com>, joel@jms.id.au,
        andrew@aj.id.au, eajames@linux.ibm.com, ninad@linux.ibm.com,
        jdelvare@suse.com
Cc:     linux-hwmon@vger.kernel.org, inux-kernel@vger.kernel.org
References: <20231023135655.2964972-1-lakshmiy@us.ibm.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20231023135655.2964972-1-lakshmiy@us.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/23/23 06:56, Lakshmi Yadlapati wrote:
> The MAX31785 has shown erratic behaviour across multiple system
> designs, unexpectedly clock stretching and NAKing transactions.
> 
> Experimentation shows that this seems to be triggered by a register access
> directly back to back with a previous register write. Experimentation also
> shows that inserting a small delay after register writes makes the issue go
> away.
> 
> Use a similar solution to what the max15301 driver does to solve the same
> problem. Create a custom set of bus read and write functions that make sure
> that the delay is added.
> 
> Signed-off-by: Lakshmi Yadlapati <lakshmiy@us.ibm.com>
> ---
>   drivers/hwmon/pmbus/max31785.c | 167 ++++++++++++++++++++++++++++-----
>   1 file changed, 146 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
> index f9aa576495a5..40fafb3b1867 100644
> --- a/drivers/hwmon/pmbus/max31785.c
> +++ b/drivers/hwmon/pmbus/max31785.c
> @@ -3,6 +3,7 @@
>    * Copyright (C) 2017 IBM Corp.
>    */
>   
> +#include <linux/delay.h>
>   #include <linux/kernel.h>
>   #include <linux/module.h>
>   #include <linux/init.h>
> @@ -23,19 +24,98 @@ enum max31785_regs {
>   
>   #define MAX31785_NR_PAGES		23
>   #define MAX31785_NR_FAN_PAGES		6
> +#define MAX31785_WAIT_DELAY_US		250
>   
> -static int max31785_read_byte_data(struct i2c_client *client, int page,
> -				   int reg)
> +struct max31785_data {
> +	ktime_t access;			/* Chip access time */
> +	struct pmbus_driver_info info;
> +};
> +
> +#define to_max31785_data(x)  container_of(x, struct max31785_data, info)
> +
> +/*
> + * MAX31785 Driver Workaround
> + *
> + * The MAX31785 fan controller occasionally exhibits communication issues.
> + * These issues are not indicated by the device itself, except for occasional
> + * NACK responses during master transactions. No error bits are set in STATUS_BYTE.
> + *
> + * To address this, we introduce a delay of 250us between consecutive accesses
> + * to the fan controller. This delay helps mitigate communication problems by
> + * allowing sufficient time between accesses.
> + */
> +
> +#define max31785_wait(_func, _driver_data, ...)	({			\
> +	int _ret;							\
> +	s64 delta = ktime_us_delta(ktime_get(), driver_data->access);	\
> +	if (delta < MAX31785_WAIT_DELAY_US)				\
> +		udelay(MAX31785_WAIT_DELAY_US - delta);			\
> +	/* All relevant functions return int */				\
> +	_ret = _func(__VA_ARGS__);					\
> +	_driver_data->access = ktime_get();				\
> +	_ret;								\
> +})

Please no function macros. This can easily be implemented as function,
like with all other drivers having the same problem.

> +
> +static int max31785_i2c_smbus_write_byte_data(struct i2c_client *client,
> +					      struct max31785_data *driver_data,
> +					      int command, u16 data)

Please reduce the size of local function names. i2c_smbus -> i2c, and
the _pmbus in the functions below adds no value.

Guenter

>   {
> -	if (page < MAX31785_NR_PAGES)
> -		return -ENODATA;
> +	return max31785_wait(i2c_smbus_write_byte_data, driver_data, client,
> +			     command, data);
> +}
> +
> +static int max31785_i2c_smbus_read_word_data(struct i2c_client *client,
> +					     struct max31785_data *driver_data,
> +					     int command)
> +{
> +	return max31785_wait(i2c_smbus_read_word_data, driver_data, client,
> +			     command);
> +}
> +
> +static int max31785_pmbus_read_byte_data(struct i2c_client *client,
> +					 struct max31785_data *driver_data,
> +					 int page, int command)
> +{
> +	return max31785_wait(pmbus_read_byte_data, driver_data, client, page,
> +			     command);
> +}
> +
> +static int max31785_pmbus_write_byte_data(struct i2c_client *client,
> +					  struct max31785_data *driver_data,
> +					  int page, int command, u16 data)
> +{
> +	return max31785_wait(pmbus_write_byte_data, driver_data, client, page,
> +			     command, data);
> +}
> +
> +static int max31785_pmbus_read_word_data(struct i2c_client *client,
> +					 struct max31785_data *driver_data,
> +					 int page, int phase, int command)
> +{
> +	return max31785_wait(pmbus_read_word_data, driver_data, client, page,
> +			     phase, command);
> +}
> +
> +static int max31785_pmbus_write_word_data(struct i2c_client *client,
> +					  struct max31785_data *driver_data,
> +					  int page, int command, u16 data)
> +{
> +	return max31785_wait(pmbus_write_word_data, driver_data, client, page,
> +			     command, data);
> +}
> +
> +static int max31785_read_byte_data(struct i2c_client *client, int page, int reg)
> +{
> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +	struct max31785_data *driver_data = to_max31785_data(info);
>   
>   	switch (reg) {
>   	case PMBUS_VOUT_MODE:
>   		return -ENOTSUPP;
>   	case PMBUS_FAN_CONFIG_12:
> -		return pmbus_read_byte_data(client, page - MAX31785_NR_PAGES,
> -					    reg);
> +		return max31785_pmbus_read_byte_data(client, driver_data,
> +						     page - MAX31785_NR_PAGES,
> +						     reg);
>   	}
>   
>   	return -ENODATA;
> @@ -102,16 +182,19 @@ static int max31785_get_pwm(struct i2c_client *client, int page)
>   	return rv;
>   }
>   
> -static int max31785_get_pwm_mode(struct i2c_client *client, int page)
> +static int max31785_get_pwm_mode(struct i2c_client *client,
> +                                 struct max31785_data *driver_data, int page)
>   {
>   	int config;
>   	int command;
>   
> -	config = pmbus_read_byte_data(client, page, PMBUS_FAN_CONFIG_12);
> +	config = max31785_pmbus_read_byte_data(client, driver_data, page,
> +                                               PMBUS_FAN_CONFIG_12);
>   	if (config < 0)
>   		return config;
>   
> -	command = pmbus_read_word_data(client, page, 0xff, PMBUS_FAN_COMMAND_1);
> +	command = max31785_pmbus_read_word_data(client, driver_data, page, 0xff,
> +                                                PMBUS_FAN_COMMAND_1);
>   	if (command < 0)
>   		return command;
>   
> @@ -129,6 +212,8 @@ static int max31785_get_pwm_mode(struct i2c_client *client, int page)
>   static int max31785_read_word_data(struct i2c_client *client, int page,
>   				   int phase, int reg)
>   {
> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +	struct max31785_data *driver_data = to_max31785_data(info);
>   	u32 val;
>   	int rv;
>   
> @@ -157,7 +242,7 @@ static int max31785_read_word_data(struct i2c_client *client, int page,
>   		rv = max31785_get_pwm(client, page);
>   		break;
>   	case PMBUS_VIRT_PWM_ENABLE_1:
> -		rv = max31785_get_pwm_mode(client, page);
> +		rv = max31785_get_pwm_mode(client, driver_data, page);
>   		break;
>   	default:
>   		rv = -ENODATA;
> @@ -188,8 +273,36 @@ static inline u32 max31785_scale_pwm(u32 sensor_val)
>   	return (sensor_val * 100) / 255;
>   }
>   
> -static int max31785_pwm_enable(struct i2c_client *client, int page,
> -				    u16 word)
> +static int max31785_update_fan(struct i2c_client *client,
> +			       struct max31785_data *driver_data, int page,
> +			       u8 config, u8 mask, u16 command)
> +{
> +	int from, rv;
> +	u8 to;
> +
> +	from = max31785_pmbus_read_byte_data(client, driver_data, page,
> +					     PMBUS_FAN_CONFIG_12);
> +	if (from < 0)
> +		return from;
> +
> +	to = (from & ~mask) | (config & mask);
> +
> +	if (to != from) {
> +		rv = max31785_pmbus_write_byte_data(client, driver_data, page,
> +						    PMBUS_FAN_CONFIG_12, to);
> +		if (rv < 0)
> +			return rv;
> +	}
> +
> +	rv = max31785_pmbus_write_word_data(client, driver_data, page,
> +					    PMBUS_FAN_COMMAND_1, command);
> +
> +	return rv;
> +}
> +
> +static int max31785_pwm_enable(struct i2c_client *client,
> +			       struct max31785_data *driver_data, int page,
> +			       u16 word)
>   {
>   	int config = 0;
>   	int rate;
> @@ -217,18 +330,23 @@ static int max31785_pwm_enable(struct i2c_client *client, int page,
>   		return -EINVAL;
>   	}
>   
> -	return pmbus_update_fan(client, page, 0, config, PB_FAN_1_RPM, rate);
> +	return max31785_update_fan(client, driver_data, page, config,
> +                                   PB_FAN_1_RPM, rate);
>   }
>   
>   static int max31785_write_word_data(struct i2c_client *client, int page,
>   				    int reg, u16 word)
>   {
> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +	struct max31785_data *driver_data = to_max31785_data(info);
> +
>   	switch (reg) {
>   	case PMBUS_VIRT_PWM_1:
> -		return pmbus_update_fan(client, page, 0, 0, PB_FAN_1_RPM,
> -					max31785_scale_pwm(word));
> +		return max31785_update_fan(client, driver_data, page, 0,
> +					   PB_FAN_1_RPM,
> +					   max31785_scale_pwm(word));
>   	case PMBUS_VIRT_PWM_ENABLE_1:
> -		return max31785_pwm_enable(client, page, word);
> +		return max31785_pwm_enable(client, driver_data, page, word);
>   	default:
>   		break;
>   	}
> @@ -303,13 +421,16 @@ static int max31785_configure_dual_tach(struct i2c_client *client,
>   {
>   	int ret;
>   	int i;
> +	struct max31785_data *driver_data = to_max31785_data(info);
>   
>   	for (i = 0; i < MAX31785_NR_FAN_PAGES; i++) {
> -		ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, i);
> +		ret = max31785_i2c_smbus_write_byte_data(client, driver_data,
> +							 PMBUS_PAGE, i);
>   		if (ret < 0)
>   			return ret;
>   
> -		ret = i2c_smbus_read_word_data(client, MFR_FAN_CONFIG);
> +		ret = max31785_i2c_smbus_read_word_data(client, driver_data,
> +                                                        MFR_FAN_CONFIG);
>   		if (ret < 0)
>   			return ret;
>   
> @@ -329,6 +450,7 @@ static int max31785_probe(struct i2c_client *client)
>   {
>   	struct device *dev = &client->dev;
>   	struct pmbus_driver_info *info;
> +	struct max31785_data *driver_data;
>   	bool dual_tach = false;
>   	int ret;
>   
> @@ -337,13 +459,16 @@ static int max31785_probe(struct i2c_client *client)
>   				     I2C_FUNC_SMBUS_WORD_DATA))
>   		return -ENODEV;
>   
> -	info = devm_kzalloc(dev, sizeof(struct pmbus_driver_info), GFP_KERNEL);
> -	if (!info)
> +	driver_data = devm_kzalloc(dev, sizeof(struct max31785_data), GFP_KERNEL);
> +	if (!driver_data)
>   		return -ENOMEM;
>   
> +	info = &driver_data->info;
> +	driver_data->access = ktime_get();
>   	*info = max31785_info;
>   
> -	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 255);
> +	ret = max31785_i2c_smbus_write_byte_data(client,driver_data,
> +						 PMBUS_PAGE, 255);
>   	if (ret < 0)
>   		return ret;
>   

