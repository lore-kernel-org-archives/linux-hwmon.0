Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1895C433FE
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 13:44:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 89A126120F
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 13:44:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240340AbhIPNpw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 16 Sep 2021 09:45:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240404AbhIPNpu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Sep 2021 09:45:50 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A806C0613DF
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Sep 2021 06:44:24 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id y6so2432081oie.4
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Sep 2021 06:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=na47/DQeXMMte0FLOr5XIT4sl814OnKHcqWikMHd5gQ=;
        b=a7fXRY8DLYEljLXLrEpH7hUuolEFSEfgzr/SIkMSk7OFo9rdXOci48jNNrvG37onhp
         23zJ/1ale1GeJ0Fxz97dC+C3yc3RWFArh94NJIoMN3X22qVna18fE5NEO2aKtnt3XPfk
         JZ6naRnuhC7kppaHbP4Jx8VOznPR6BU6ac2PZa9cf5ifH2CE5AyQjQXDOgB4LLM3lN0y
         FvsnhCSKRA4/ODWDtfVqmuLy+xizD4j+ZSj5AXjSBXPbFNulyY0hIJzQJ3RB0SkKwbZG
         nmqiYPQT6vaPcslNZi5+GqebW3XbmLkKxIoEWF7YDBIYDZKrYwI2rHkKLeILH26ufEVr
         irjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=na47/DQeXMMte0FLOr5XIT4sl814OnKHcqWikMHd5gQ=;
        b=J+HUEi5piPwsbkYVM0xFgo5vLCXubWaNkHYHjpMEZ4VL120sxMJJWrTwok5DbVWQu2
         Ivl2A0hSQ49w+VHHqrjC/G8PJUeH7iKf6YeaobfV0aFt6+3iJCZlvq0Mar0jVOpSoaQ4
         J3KXEf4L47liMKljPmKi24tgKjAaPU6svZBitMJLdEtaNhiJw7/mK4e4cz1+C1ZBEGA6
         7eR8/FTQ2aUoMoimYeBYoa3rshSrl7czLGExangElNWqQ2lVXA3RIX+yzeJOw+yGf/Bn
         gcMtQo79HHlGB+z7iAbC2BNVO9MTU25ZmaoZPGqFdW03qrybdpnGkMff5R2nKnEvrWF2
         Ga6g==
X-Gm-Message-State: AOAM532gvhBordsCcaN6tLlHxmCFb6PaPyCajZoWk2zsrkptnIkSQTl7
        fM+lfHR5YQwQVTui1tWqPWFtZAj8DuY=
X-Google-Smtp-Source: ABdhPJzpOlUNA7Z72CZO+Q95hbp4rQ1N2NzTFUvkadpjmpG76whRe3DWonnl77xij06rfIWv9ZcVTg==
X-Received: by 2002:a05:6808:7:: with SMTP id u7mr9373768oic.63.1631799863360;
        Thu, 16 Sep 2021 06:44:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n73sm819374oig.9.2021.09.16.06.44.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Sep 2021 06:44:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH hwmon-next 3/3] hwmon: (mlxreg-fan) Extend driver to
 support multiply cooling devices
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     linux-hwmon@vger.kernel.org
References: <20210916132254.831200-1-vadimp@nvidia.com>
 <20210916132254.831200-4-vadimp@nvidia.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <9be589f2-7473-1a43-9c00-8a9ba41d7154@roeck-us.net>
Date:   Thu, 16 Sep 2021 06:44:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210916132254.831200-4-vadimp@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/16/21 6:22 AM, Vadim Pasternak wrote:
> Add support for additional cooling devices in order to support the
> systems, which can be equipped with up-to four PWM controllers.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
>   drivers/hwmon/mlxreg-fan.c | 80 +++++++++++++++++++++++++-------------
>   1 file changed, 54 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
> index 930636868ef5..f5968eb4ab78 100644
> --- a/drivers/hwmon/mlxreg-fan.c
> +++ b/drivers/hwmon/mlxreg-fan.c
> @@ -63,6 +63,8 @@
>   					 MLXREG_FAN_MAX_DUTY,		\
>   					 MLXREG_FAN_MAX_STATE))
>   
> +struct mlxreg_fan;
> +
>   /*
>    * struct mlxreg_fan_tacho - tachometer data (internal use):
>    *
> @@ -81,12 +83,18 @@ struct mlxreg_fan_tacho {
>   /*
>    * struct mlxreg_fan_pwm - PWM data (internal use):
>    *
> + * @fan: private data;
>    * @connected: indicates if PWM is connected;
>    * @reg: register offset;
> + * @cooling: cooling device levels;
> + * @cdev: cooling device;
>    */
>   struct mlxreg_fan_pwm {
> +	struct mlxreg_fan *fan;
>   	bool connected;
>   	u32 reg;
> +	u8 cooling_levels[MLXREG_FAN_MAX_STATE + 1];
> +	struct thermal_cooling_device *cdev;
>   };
>   
>   /*
> @@ -99,8 +107,6 @@ struct mlxreg_fan_pwm {
>    * @tachos_per_drwr - number of tachometers per drawer;
>    * @samples: minimum allowed samples per pulse;
>    * @divider: divider value for tachometer RPM calculation;
> - * @cooling: cooling device levels;
> - * @cdev: cooling device;
>    */
>   struct mlxreg_fan {
>   	struct device *dev;
> @@ -111,8 +117,6 @@ struct mlxreg_fan {
>   	int tachos_per_drwr;
>   	int samples;
>   	int divider;
> -	u8 cooling_levels[MLXREG_FAN_MAX_STATE + 1];
> -	struct thermal_cooling_device *cdev;
>   };
>   
>   static int
> @@ -305,11 +309,12 @@ static int mlxreg_fan_get_cur_state(struct thermal_cooling_device *cdev,
>   				    unsigned long *state)
>   
>   {
> -	struct mlxreg_fan *fan = cdev->devdata;
> +	struct mlxreg_fan_pwm *pwm = cdev->devdata;
> +	struct mlxreg_fan *fan = pwm->fan;
>   	u32 regval;
>   	int err;
>   
> -	err = regmap_read(fan->regmap, fan->pwm[0].reg, &regval);
> +	err = regmap_read(fan->regmap, pwm->reg, &regval);
>   	if (err) {
>   		dev_err(fan->dev, "Failed to query PWM duty\n");
>   		return err;
> @@ -324,7 +329,8 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
>   				    unsigned long state)
>   
>   {
> -	struct mlxreg_fan *fan = cdev->devdata;
> +	struct mlxreg_fan_pwm *pwm = cdev->devdata;
> +	struct mlxreg_fan *fan = pwm->fan;
>   	unsigned long cur_state;
>   	bool config = false;
>   	u32 regval;
> @@ -344,11 +350,11 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
>   		config = true;
>   		state -= MLXREG_FAN_MAX_STATE;
>   		for (i = 0; i < state; i++)
> -			fan->cooling_levels[i] = state;
> +			pwm->cooling_levels[i] = state;
>   		for (i = state; i <= MLXREG_FAN_MAX_STATE; i++)
> -			fan->cooling_levels[i] = i;
> +			pwm->cooling_levels[i] = i;
>   
> -		err = regmap_read(fan->regmap, fan->pwm[0].reg, &regval);
> +		err = regmap_read(fan->regmap, pwm->reg, &regval);
>   		if (err) {
>   			dev_err(fan->dev, "Failed to query PWM duty\n");
>   			return err;
> @@ -366,8 +372,8 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
>   		return -EINVAL;
>   
>   	/* Normalize the state to the valid speed range. */
> -	state = fan->cooling_levels[state];
> -	err = regmap_write(fan->regmap, fan->pwm[0].reg,
> +	state = pwm->cooling_levels[state];
> +	err = regmap_write(fan->regmap, pwm->reg,
>   			   MLXREG_FAN_PWM_STATE2DUTY(state));
>   	if (err) {
>   		dev_err(fan->dev, "Failed to write PWM duty\n");
> @@ -539,13 +545,41 @@ static int mlxreg_fan_config(struct mlxreg_fan *fan,
>   		fan->tachos_per_drwr = tacho_avail / drwr_avail;
>   	}
>   
> -	/* Init cooling levels per PWM state. */
> -	for (i = 0; i < MLXREG_FAN_SPEED_MIN_LEVEL; i++)
> -		fan->cooling_levels[i] = MLXREG_FAN_SPEED_MIN_LEVEL;
> -	for (i = MLXREG_FAN_SPEED_MIN_LEVEL; i <= MLXREG_FAN_MAX_STATE; i++)
> -		fan->cooling_levels[i] = i;
> +	return 0;
> +}
> +
> +static int mlxreg_fan_cooling_config(struct device *dev, struct mlxreg_fan *fan)
> +{
> +	int i, j, err;
> +
> +	for (i = 0; i <= MLXREG_FAN_MAX_PWM; i++) {
> +		struct mlxreg_fan_pwm *pwm = &fan->pwm[i];
> +
> +		if (!pwm->connected)
> +			continue;
> +		pwm->fan = fan;
> +		pwm->cdev = devm_thermal_of_cooling_device_register(dev, NULL, "mlxreg_fan", pwm,
> +								    &mlxreg_fan_cooling_ops);
> +		if (IS_ERR(pwm->cdev)) {
> +			dev_err(dev, "Failed to register cooling device\n");
> +			err = PTR_ERR(pwm->cdev);
> +			goto devm_thermal_of_cooling_device_register_fail;
> +		}
> +
> +		/* Init cooling levels per PWM state. */
> +		for (j = 0; j < MLXREG_FAN_SPEED_MIN_LEVEL; j++)
> +			pwm->cooling_levels[j] = MLXREG_FAN_SPEED_MIN_LEVEL;
> +		for (j = MLXREG_FAN_SPEED_MIN_LEVEL; j <= MLXREG_FAN_MAX_STATE; j++)
> +			pwm->cooling_levels[j] = j;
> +	}
>   
>   	return 0;
> +devm_thermal_of_cooling_device_register_fail:
> +	for (i = i - 1; i >= 0; i--) {
> +		if (fan->pwm[i].cdev)
> +			thermal_cooling_device_unregister(fan->pwm[i].cdev);

This looks suspicious, since registration was done with a devm_ function.
Are you sure this is needed ?

Guenter

> +	}
> +	return err;
>   }
>   
>   static int mlxreg_fan_probe(struct platform_device *pdev)
> @@ -582,16 +616,10 @@ static int mlxreg_fan_probe(struct platform_device *pdev)
>   		return PTR_ERR(hwm);
>   	}
>   
> -	if (IS_REACHABLE(CONFIG_THERMAL)) {
> -		fan->cdev = devm_thermal_of_cooling_device_register(dev,
> -			NULL, "mlxreg_fan", fan, &mlxreg_fan_cooling_ops);
> -		if (IS_ERR(fan->cdev)) {
> -			dev_err(dev, "Failed to register cooling device\n");
> -			return PTR_ERR(fan->cdev);
> -		}
> -	}
> +	if (IS_REACHABLE(CONFIG_THERMAL))
> +		err = mlxreg_fan_cooling_config(dev, fan);
>   
> -	return 0;
> +	return err;
>   }
>   
>   static struct platform_driver mlxreg_fan_driver = {
> 

