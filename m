Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF9B6C433C1
	for <linux-hwmon@archiver.kernel.org>; Tue, 30 Mar 2021 16:52:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C45D619B9
	for <linux-hwmon@archiver.kernel.org>; Tue, 30 Mar 2021 16:52:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232057AbhC3QwQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 30 Mar 2021 12:52:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232435AbhC3Qvm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 30 Mar 2021 12:51:42 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98B77C061574
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Mar 2021 09:51:42 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id i3so17106189oik.7
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Mar 2021 09:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uKrBRI4EVs0M8nRsdejZYjKMwZ+841FM9Nrw/Ndd2ws=;
        b=j911LILvKellRCDROjIlDIuXQDdJYBLZrJrZHUZPoawry/THLMGJEcsbvFLEC5FImq
         BdCmT6ODsT9/zVREwp89gRgn4yHdYf2Cp5yRNPBBFtj3Mv2k00WxVViz5CutSx3/vRf4
         qg0Nn4wxIrmAoBAkFJchRorTqwJj5K6Wpt0fr3byPSmHJxMj9Pa72ZhywAE49fFAxANI
         EcMP3x25h5/53HodZ8XrckKB1mlmzZq8EU8aepKohhVagDtlgpYxB3SFMQET4lbjWu1C
         qqo+w96eD+PwJJgoKZ1w5x8ckBUmN8/d7fjhJFamnUFtZtH9G5gh61Q7psF5r/YauzUI
         iFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=uKrBRI4EVs0M8nRsdejZYjKMwZ+841FM9Nrw/Ndd2ws=;
        b=FbLL386iGQQhVSDpHxFxfWpRLE9l6ikCMdYEZ8MKWyUUQI/zzGDI8z3kbgOghuJRn1
         H5OSizssvkel/NlvartWetD4IJuX7u2Bz2D6f0RdWlMIOoR64UYg8qTN5X/9IV9rTrxT
         mEwRZiZvZCKeDc0OveVeCqE8yZ+SIzXfU10kjoV5qDzS0IEpmmScYeyCcg3vTh0QmNjT
         amtAsZ2KkfAipywZfDve2xP2J694yJ5eflStEWF82DL5qz753oP1pc/sSIa3fkhCN7bt
         CEJ3MYTR+h30tXLVQQbdVFdPSirjRS0xF/csdj/PSI6GKWgyLSam+v3k0/xBtIeSk8LY
         Co5g==
X-Gm-Message-State: AOAM531UuLKGXd4a1iYBitZEk0jdkZOtV16oDBbhPkVxfPR6xbaQ2wVH
        npi6mlJK/p9xwUb+y9kT5B1wXZ4TWms=
X-Google-Smtp-Source: ABdhPJwfe7hCCj5VHdSX9yAxgD8j3m72U+Gnn9l2WM29T/9699CsOgW1GBUwny83pmR4kB9Rc0+zDg==
X-Received: by 2002:a05:6808:14cc:: with SMTP id f12mr3873330oiw.166.1617123101768;
        Tue, 30 Mar 2021 09:51:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 7sm4198943ois.20.2021.03.30.09.51.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 09:51:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] lm63: Added thermal zone support
To:     Azat Gismatov <gismatov.az@mail.ru>, jdelvare@suse.com
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>, linux-hwmon@vger.kernel.org
References: <20210322093904.2340-1-gismatov.az@mail.ru>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <9cf2d0b7-9998-87c0-871e-1854dd3905c1@roeck-us.net>
Date:   Tue, 30 Mar 2021 09:51:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210322093904.2340-1-gismatov.az@mail.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 3/22/21 2:39 AM, Azat Gismatov wrote:
> There are target systems where pwm controller is the lm63, but 
> temperature sensors aren't connected to the lm63 (sensors are
> part of CPU and supported by own linux driver). Automatic fan
> control by the lm63 chip doesn't work for that systems.
> Thermal zone is much more convenient for embedded systems, than
> fan-control, or any other userspace software, because It allow
> to get smaller software footprint. Also with thermal zone we
> can store all cooling settings in devicetree, which is easier
> to maintain for embedded systems, than some userspace software.
> Added support property "pwm-mode" (pwm-mode = "manual") for
> devicetree to use a manual pwm mode in the lm63 driver.
> 
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: linux-hwmon@vger.kernel.org
> Signed-off-by: Azat Gismatov <gismatov.az@mail.ru>
> ---
>  drivers/hwmon/lm63.c | 133 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 132 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/lm63.c b/drivers/hwmon/lm63.c
> index 50f67265c71d..764bc528294f 100644
> --- a/drivers/hwmon/lm63.c
> +++ b/drivers/hwmon/lm63.c
> @@ -34,7 +34,9 @@
>  #include <linux/err.h>
>  #include <linux/mutex.h>
>  #include <linux/of_device.h>
> +#include <linux/pwm.h>
>  #include <linux/sysfs.h>
> +#include <linux/thermal.h>
>  #include <linux/types.h>
>  
>  /*
> @@ -97,6 +99,8 @@ static const unsigned short normal_i2c[] = { 0x18, 0x4c, 0x4e, I2C_CLIENT_END };
>  #define LM63_MAX_CONVRATE_HZ		32
>  #define LM96163_MAX_CONVRATE_HZ		26
>  
> +#define MAX_SENSORS	2
> +
>  /*
>   * Conversions and various macros
>   * For tachometer counts, the LM63 uses 16-bit values.
> @@ -173,8 +177,15 @@ struct lm63_data {
>  	bool lut_temp_highres;
>  	bool remote_unsigned; /* true if unsigned remote upper limits */
>  	bool trutherm;
> +	struct pwm_chip chip;
> +	struct lm63_thermal_sensor thermal_sensor[MAX_SENSORS];
>  };
>  
> +static inline struct lm63_data *to_pwm(struct pwm_chip *chip)
> +{
> +	return container_of(chip, struct lm63_data, chip);
> +}
> +
>  static inline int temp8_from_reg(struct lm63_data *data, int nr)
>  {
>  	if (data->remote_unsigned)
> @@ -1015,9 +1026,15 @@ static void lm63_init_client(struct lm63_data *data)
>  {
>  	struct i2c_client *client = data->client;
>  	struct device *dev = &client->dev;
> +	const char *pwm_mode;
>  	u8 convrate;
>  
>  	data->config = i2c_smbus_read_byte_data(client, LM63_REG_CONFIG1);
> +	pwm_mode = of_get_property(dev->of_node, "pwm-mode", NULL);
> +	if (pwm_mode) {
> +		if (!strcmp(pwm_mode, "manual"))
> +			i2c_smbus_write_byte_data(client, LM63_REG_CONFIG_FAN, 0x20);
> +	}

This would require dt maintainer approval.

I would, however argue that it is not needed: If the chip registers as thermal
cooling device and has associated devicetree nodes, it should be locked to
manual mode, and manipulating chip configuration using sysfs attributes
should be disabled.

>  	data->config_fan = i2c_smbus_read_byte_data(client,
>  						    LM63_REG_CONFIG_FAN);
>  
> @@ -1087,6 +1104,108 @@ static void lm63_init_client(struct lm63_data *data)
>  		(data->config_fan & 0x20) ? "manual" : "auto");
>  }
>  
> +static int lm63_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> +				const struct pwm_state *state)
> +{
> +	struct lm63_data *data = to_pwm(chip);
> +	struct i2c_client *client = data->client;
> +	int ret = -EINVAL;
> +	u8 pwm_mode;
> +	u8 val;
> +
> +	mutex_lock(&data->update_lock);
> +	pwm_mode = i2c_smbus_read_byte_data(client, LM63_REG_CONFIG_FAN);
> +	if (!(pwm_mode >> 5)) {
> +		mutex_unlock(&data->update_lock);
> +		return -EPERM;
> +	}
> +
> +	if (state->period > 1) {
> +		val = state->duty_cycle * 255 / (state->period - 1);
> +		val = clamp_val(val, 0, 255);
> +		val = data->pwm_highres ? val :
> +				(val * data->pwm1_freq * 2 + 127) / 255;
> +		ret = i2c_smbus_write_byte_data(client, LM63_REG_PWM_VALUE, val);
> +	}
> +
> +	mutex_unlock(&data->update_lock);
> +	return ret;
> +}
> +
> +static const struct pwm_ops lm63_pwm_ops = {
> +	.apply = lm63_pwm_apply,
> +	.owner = THIS_MODULE,
> +};
> +
> +static void lm63_pwm_remove(void *arg)
> +{
> +	struct i2c_client *client = arg;
> +	struct lm63_data *data = i2c_get_clientdata(client);
> +
> +	pwmchip_remove(&data->chip);
> +}
> +
> +static int lm63_init_pwm(struct lm63_data *data)
> +{
> +	struct i2c_client *client = data->client;
> +	int ret;
> +
> +	ret = devm_add_action(&client->dev, lm63_pwm_remove, client);
> +	if (ret)
> +		return ret;
> +

This must be done after calling pwmchip_add().

> +	/* Initialize chip */
> +
> +	data->chip.dev = &client->dev;
> +	data->chip.ops = &lm63_pwm_ops;
> +	data->chip.base = -1;
> +	data->chip.npwm = 1;
> +
> +	ret = pwmchip_add(&data->chip);
> +	if (ret < 0) {
> +		dev_warn(&client->dev, "pwmchip_add() failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int lm63_get_temp(void *data, int *temp)
> +{
> +	struct lm63_thermal_sensor *thermal_sensor = data;
> +
> +	mutex_lock(&thermal_sensor->data->update_lock);
> +	*temp = i2c_smbus_read_byte_data(thermal_sensor->data->client,
> +			LM63_REG_LOCAL_TEMP + thermal_sensor->sensor_id) * 1000;
> +	mutex_unlock(&thermal_sensor->data->update_lock);

I don't immediately see the need for this lock.

> +
> +	return 0;
> +}
> +
> +static const struct thermal_zone_of_device_ops lm63_tz_ops = {
> +	.get_temp = lm63_get_temp,
> +};
> +
> +static void lm63_init_thermal(struct lm63_data *data)
> +{
> +	struct i2c_client *client = data->client;
> +	struct lm63_thermal_sensor *thermal_sensor;
> +	unsigned int i;
> +
> +	thermal_sensor = data->thermal_sensor;
> +	for (i = 0; i < MAX_SENSORS; i++, thermal_sensor++) {
> +		thermal_sensor->data = data;
> +		thermal_sensor->sensor_id = i;
> +		thermal_sensor->tz = devm_thermal_zone_of_sensor_register(&client->dev,
> +						 i, thermal_sensor, &lm63_tz_ops);
> +

As far as I can see this will happen if there is no thermal zone
configuration in the system, meaning almost all the time. The warning
message below is therefore unacceptable. A return value of -ENODEV
must be silently ignored.

Also, this change does not match the commit description. The argument made there
was that the LM63 is the pwm controller, but that the chip temperature sensor
is not used to make thermal decisions. If the chip temperature sensor is not
used to make thermal decisions, it does not have to be registered as thermal
zone.

The argument made in the description should probably be that the temperature sensor
in the lm63 is not the only temperature sensor in the system used to make thermal
decisions. That is, however, not currently the case. Please make sure that the
description matches the code.

> +		if (IS_ERR(thermal_sensor->tz)) {
> +			dev_warn(&client->dev, "unable to register thermal sensor %ld\n",
> +				 PTR_ERR(thermal_sensor->tz));
> +		}
> +	}
> +}
> +
>  static const struct i2c_device_id lm63_id[];
>  
>  static int lm63_probe(struct i2c_client *client)
> @@ -1095,6 +1214,7 @@ static int lm63_probe(struct i2c_client *client)
>  	struct device *hwmon_dev;
>  	struct lm63_data *data;
>  	int groups = 0;
> +	int ret;
>  
>  	data = devm_kzalloc(dev, sizeof(struct lm63_data), GFP_KERNEL);
>  	if (!data)
> @@ -1126,7 +1246,18 @@ static int lm63_probe(struct i2c_client *client)
>  
>  	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
>  							   data, data->groups);
> -	return PTR_ERR_OR_ZERO(hwmon_dev);
> +	if (IS_ERR(hwmon_dev))
> +		return PTR_ERR(hwmon_dev);
> +
> +	i2c_set_clientdata(client, data);
> +	lm63_init_thermal(data);
> +	if (IS_ENABLED(CONFIG_PWM)) {
> +		ret = lm63_init_pwm(data);
> +		if (ret)
> +			lm63_pwm_remove(data);

This is not needed if devm_add_action_or_reset() is called in lm63_init_pwm()
after successful pwm chip registration.

Also, other hwmon drivers drivers register as thermal cooling device. You'll
have to explain why this is better (and how it ties into the thermal subsystem),
and why the dependency on the pwm subsystem is needed for this cooling device
to work.

Thanks,
Guenter
