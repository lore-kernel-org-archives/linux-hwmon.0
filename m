Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9581AC433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 20:18:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C5C161207
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 20:18:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238448AbhIPUTW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 16 Sep 2021 16:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238442AbhIPUTW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Sep 2021 16:19:22 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9134AC061756
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Sep 2021 13:18:01 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id q26-20020a4adc5a000000b002918a69c8eeso2438062oov.13
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Sep 2021 13:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LzOoPmjYLJJLbvLAUwoia7CEkEFLMTaZ9zk1SHs6MlU=;
        b=TPyPa//Vd/I1cbTm3zoSXOW0RWpGWoRNR4098+IjMo+TNP5NerrOSV1y0AY5B5reKR
         V0YOjdXL1fc4x1iLneikDvDWJCBiJPvEr/K5RHZ6+RQQl8vaiuNanCnIqpzbb/axdFhC
         Ny8xC4qFQiacHuo4hvvtn9jiYkObXe1vdroFgPxXhpJEuMEAaMOIIoeeoXRLtktXqV1V
         KewA/6+/xujkclbl7E6HOxflSx+FrBGyVDneNF4XXCT3AHBqNXfBY0B/RR1ZZTQegvKB
         bOTcmabcSpkbhZDZV5XgtTWUl22qn0uRESI/+JcgKM+2TsZxxF3CSQ+XpBDeLYwP7WaN
         Nq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=LzOoPmjYLJJLbvLAUwoia7CEkEFLMTaZ9zk1SHs6MlU=;
        b=J0Ydy7qQp0Fj0cwceZt92NeNXFUAbUCJ3WSQDx0IdRkaNUnSbM1PDIpSSY/LZVo84c
         ZtPZ5sDjAXZXigqlf0umPC98eMVTleulWVKh0ZvbTm+xiN85URIq4n3HI8IxHPCDoiNA
         WArihxhIICPOAiKRvnQHKrHlJ0CuZEPWAkmhtEHsTSYeRW3xqge047FoIMT7LFTB/KY+
         i9KWXDd8eF0o1Wljgg1f00YLDWwABjXIiIN+knSDqYgJXsjdUiv0jSNMiZMJdHI1SzUg
         zsgiZKQdreEYdPGqK4sQrdyR9hflfSeRkV3/Vt/5D0gNXATx+FtrjFcl2S/WFKvfxOfs
         Pn4w==
X-Gm-Message-State: AOAM530w2tJrekL688wPSgBia7GqhYzmFFJ2uH/uvgutIP6FjiNbxoU+
        gmBmyzpx+lN85sUvSXfxGbJwm3GzBSs=
X-Google-Smtp-Source: ABdhPJyYAA5mHjNmrAPozl39awXLPqiyzsSc05g6F2rN+nH9EChT5xcTMunRDvgXpEyoKWIIHRQ77Q==
X-Received: by 2002:a4a:a841:: with SMTP id p1mr5810462oom.92.1631823480946;
        Thu, 16 Sep 2021 13:18:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a1sm973420otr.33.2021.09.16.13.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 13:18:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 16 Sep 2021 13:17:59 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH hwmon-next v2 3/3] hwmon: (mlxreg-fan) Extend driver to
 support multiply cooling devices
Message-ID: <20210916201759.GA1966690@roeck-us.net>
References: <20210916194719.871413-1-vadimp@nvidia.com>
 <20210916194719.871413-4-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916194719.871413-4-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 16, 2021 at 10:47:19PM +0300, Vadim Pasternak wrote:
> Add support for additional cooling devices in order to support the
> systems, which can be equipped with up-to four PWM controllers.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
> v0->v2:
>  Comments pointed out by Guenter:
>  - Drop call to thermal_cooling_device_unregister() in error flow,
>    devices registered by devm_thermal_of_cooling_device_register()
>    should be cleaned automatically.
> ---
>  drivers/hwmon/mlxreg-fan.c | 76 +++++++++++++++++++++++++-------------
>  1 file changed, 50 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
> index 1a146cc4b0fd..566bee333c3c 100644
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
> @@ -541,13 +547,37 @@ static int mlxreg_fan_config(struct mlxreg_fan *fan,
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

Unnecessary goto.

			return PTR_ERR(pwm->cdev);

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
> +devm_thermal_of_cooling_device_register_fail:
> +	return err;
>  }
>  
>  static int mlxreg_fan_probe(struct platform_device *pdev)
> @@ -584,16 +614,10 @@ static int mlxreg_fan_probe(struct platform_device *pdev)
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
