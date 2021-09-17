Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B03CBC433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 17 Sep 2021 01:07:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71C75611EE
	for <linux-hwmon@archiver.kernel.org>; Fri, 17 Sep 2021 01:07:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242049AbhIQBIW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 16 Sep 2021 21:08:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbhIQBIV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Sep 2021 21:08:21 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87770C061574
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Sep 2021 18:06:57 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id i8-20020a056830402800b0051afc3e373aso10739888ots.5
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Sep 2021 18:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=bNHBcVHocStoHk1ud7mIf3+yeha4NcrFFdE10gED03I=;
        b=CKmjpvddUgJ4FqdYVMhTNBF87W+Fo1lPMMR2n4OUpiY6MNWhGy5OKXIxdXKdwaaPDA
         G8BZAcPgw7JFEKHy+gWWOJv1q7CXAcQeun+8idui+XsMH9AlDrbK6FPCoveKr2H7vP/F
         KWYDNlRS44vb9oScU/bNU5HePqybKB9DB2vaubRXkCO27FDwZBG8jA55wr2pHqtw0Lyt
         hpXQYBQzJwAgzUDvu2FN8Q1VtpMNDeZ8rCfaOFmC1btlFLPy8FNQDje2YWTHlAm9umff
         dF/WxBXJG+NNHce4abgFIKitdrQPkUg4+WH6b6njIQaaopqm4FbDx9g5Go1inhLirQSG
         qzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition;
        bh=bNHBcVHocStoHk1ud7mIf3+yeha4NcrFFdE10gED03I=;
        b=HdiD4/l79W/vlOJioX/FaS8gObderI0+G2kki/b7/o01nQkGx8QXxwBe2xQntXBui2
         qzp+HcWNFDrDuW5p/DumVfM7QSEFOu5bOYhRmIcF+w3V3kIGWnuI2PEYa+NfTP6z24a0
         2SYmR939DWrkm4wl72YIZDVzghJvPubXHmK9+GYUbqavR3o7yoNR3FY7IFNJPPAqGDrO
         yO2mzwqoOOeYw8ZhRxhHttXmyZYRlkMQxk69crk6F5fqQP+t+tJiNMdem34MESDXcq+n
         FX1PL6+fKn4hg+h4Zl7zeTH9m6xqJ0GDVw467azmS5iTvBpZfHR0+WBTlH2Q4MnjpM7e
         DPkA==
X-Gm-Message-State: AOAM532BwsnPRLcYy771VU3dlSVT5SNvmVc2ricMeExaCcI7B/SwUHE7
        7stj301ebLLjz7T2jynKR1xxZ9w4MaA=
X-Google-Smtp-Source: ABdhPJyNRqwuurENRQo1voBclh8HvuGcoc4h1T2deF4prJ3z+XcBOnl7Mfw22wH9qNo2napTnI6IdA==
X-Received: by 2002:a9d:7019:: with SMTP id k25mr7265756otj.350.1631840816746;
        Thu, 16 Sep 2021 18:06:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e2sm1047937ooh.40.2021.09.16.18.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 18:06:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 16 Sep 2021 18:06:54 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH hwmon-next v3 1/1] hwmon: (mlxreg-fan) Extend driver to
 support multiply cooling devices
Message-ID: <20210917010654.GA2518068@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Sep 17, 2021 at 12:31:28AM +0300, Vadim Pasternak wrote:
> Add support for additional cooling devices in order to support the
> systems, which can be equipped with up-to four PWM controllers.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>

Applied.

Thanks,
Guenter

> ---
> v2->v3:
>  Comments pointed out by Guenter:
>  - Drop label "devm_thermal_of_cooling_device_register_fail".
> v0->v2:
>  Comments pointed out by Guenter:
>  - Drop call to thermal_cooling_device_unregister() in error flow,
>    devices registered by devm_thermal_of_cooling_device_register()
>    should be cleaned automatically.
> ---
>  drivers/hwmon/mlxreg-fan.c | 73 ++++++++++++++++++++++++--------------
>  1 file changed, 47 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
> index 1a146cc4b0fd..35228ed112d7 100644
> --- a/drivers/hwmon/mlxreg-fan.c
> +++ b/drivers/hwmon/mlxreg-fan.c
> @@ -63,6 +63,8 @@
>  					 MLXREG_FAN_MAX_DUTY,		\
>  					 MLXREG_FAN_MAX_STATE))
>  
> +struct mlxreg_fan;
> +
>  /*
>   * struct mlxreg_fan_tacho - tachometer data (internal use):
>   *
> @@ -81,12 +83,18 @@ struct mlxreg_fan_tacho {
>  /*
>   * struct mlxreg_fan_pwm - PWM data (internal use):
>   *
> + * @fan: private data;
>   * @connected: indicates if PWM is connected;
>   * @reg: register offset;
> + * @cooling: cooling device levels;
> + * @cdev: cooling device;
>   */
>  struct mlxreg_fan_pwm {
> +	struct mlxreg_fan *fan;
>  	bool connected;
>  	u32 reg;
> +	u8 cooling_levels[MLXREG_FAN_MAX_STATE + 1];
> +	struct thermal_cooling_device *cdev;
>  };
>  
>  /*
> @@ -99,8 +107,6 @@ struct mlxreg_fan_pwm {
>   * @tachos_per_drwr - number of tachometers per drawer;
>   * @samples: minimum allowed samples per pulse;
>   * @divider: divider value for tachometer RPM calculation;
> - * @cooling: cooling device levels;
> - * @cdev: cooling device;
>   */
>  struct mlxreg_fan {
>  	struct device *dev;
> @@ -111,8 +117,6 @@ struct mlxreg_fan {
>  	int tachos_per_drwr;
>  	int samples;
>  	int divider;
> -	u8 cooling_levels[MLXREG_FAN_MAX_STATE + 1];
> -	struct thermal_cooling_device *cdev;
>  };
>  
>  static int
> @@ -305,11 +309,12 @@ static int mlxreg_fan_get_cur_state(struct thermal_cooling_device *cdev,
>  				    unsigned long *state)
>  
>  {
> -	struct mlxreg_fan *fan = cdev->devdata;
> +	struct mlxreg_fan_pwm *pwm = cdev->devdata;
> +	struct mlxreg_fan *fan = pwm->fan;
>  	u32 regval;
>  	int err;
>  
> -	err = regmap_read(fan->regmap, fan->pwm[0].reg, &regval);
> +	err = regmap_read(fan->regmap, pwm->reg, &regval);
>  	if (err) {
>  		dev_err(fan->dev, "Failed to query PWM duty\n");
>  		return err;
> @@ -324,7 +329,8 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
>  				    unsigned long state)
>  
>  {
> -	struct mlxreg_fan *fan = cdev->devdata;
> +	struct mlxreg_fan_pwm *pwm = cdev->devdata;
> +	struct mlxreg_fan *fan = pwm->fan;
>  	unsigned long cur_state;
>  	int i, config = 0;
>  	u32 regval;
> @@ -348,11 +354,11 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
>  		config = 1;
>  		state -= MLXREG_FAN_MAX_STATE;
>  		for (i = 0; i < state; i++)
> -			fan->cooling_levels[i] = state;
> +			pwm->cooling_levels[i] = state;
>  		for (i = state; i <= MLXREG_FAN_MAX_STATE; i++)
> -			fan->cooling_levels[i] = i;
> +			pwm->cooling_levels[i] = i;
>  
> -		err = regmap_read(fan->regmap, fan->pwm[0].reg, &regval);
> +		err = regmap_read(fan->regmap, pwm->reg, &regval);
>  		if (err) {
>  			dev_err(fan->dev, "Failed to query PWM duty\n");
>  			return err;
> @@ -369,8 +375,8 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
>  		return -EINVAL;
>  
>  	/* Normalize the state to the valid speed range. */
> -	state = fan->cooling_levels[state];
> -	err = regmap_write(fan->regmap, fan->pwm[0].reg,
> +	state = pwm->cooling_levels[state];
> +	err = regmap_write(fan->regmap, pwm->reg,
>  			   MLXREG_FAN_PWM_STATE2DUTY(state));
>  	if (err) {
>  		dev_err(fan->dev, "Failed to write PWM duty\n");
> @@ -541,11 +547,32 @@ static int mlxreg_fan_config(struct mlxreg_fan *fan,
>  		fan->tachos_per_drwr = tacho_avail / drwr_avail;
>  	}
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
> +	int i, j;
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
> +			return PTR_ERR(pwm->cdev);
> +		}
> +
> +		/* Init cooling levels per PWM state. */
> +		for (j = 0; j < MLXREG_FAN_SPEED_MIN_LEVEL; j++)
> +			pwm->cooling_levels[j] = MLXREG_FAN_SPEED_MIN_LEVEL;
> +		for (j = MLXREG_FAN_SPEED_MIN_LEVEL; j <= MLXREG_FAN_MAX_STATE; j++)
> +			pwm->cooling_levels[j] = j;
> +	}
>  
>  	return 0;
>  }
> @@ -584,16 +611,10 @@ static int mlxreg_fan_probe(struct platform_device *pdev)
>  		return PTR_ERR(hwm);
>  	}
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
>  }
>  
>  static struct platform_driver mlxreg_fan_driver = {
> -- 
> 2.20.1
> 
