Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEBCCC433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 20:19:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A4B6661207
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 20:19:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbhIPUUj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 16 Sep 2021 16:20:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232331AbhIPUUc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Sep 2021 16:20:32 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00A6DC061574
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Sep 2021 13:19:11 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id u22so2497152oie.5
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Sep 2021 13:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=V24DaK8VeJdlchZNl0iGlou2T65Av/FWYwj8G7+XKp4=;
        b=fKMpDTzaqwbtlUoLKre88wPU9FOs0XOQ3rovofHhIZjxAKp7cztdXt7jFTuDlmnKr6
         fkMaSiTl5npF4VrKBt7N5uP+QWKGl59fSPlZPV/uUDTNbNRp+naYUBj9FQOAes019GjX
         I8k3ApzI4Xgpg0BKm/7jjO1isNTEmbaECJKRKvJASIqjOaPrv6vkVf2mz/RKyx4M6BiZ
         f2bxPU68l5WKfY7m7hX3glW0y246Zil0hqdVLfFwzjqoVAVcUdqtiLPVl8camdlEfK3g
         njSlaC0IKq2mnFVi/cGazHHkwUKdiR2Xoxo6qr4LizV8+1bgmw+/HUgeZrYyTGpSV5s6
         fxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=V24DaK8VeJdlchZNl0iGlou2T65Av/FWYwj8G7+XKp4=;
        b=ZoBF2zQj4du1s4gdry3n1kDTqmDRJcy6GSb98+0pWQBst/LD3Eo2aIiubq4sT6MLOV
         WWMQJI9+T4Q5RasDYAr5+PK+6wXfUPKIOu9SgkeI4stzkmdtfuS9dxroCNRxWqCMVO15
         4Jk0NHBOVeBW1/Rq0TmNI12W5gZVq2NQXGVAX/YNnTDxz+HZiJOVslMIaKmoTQdYCzwM
         bLkyTlNrGrapq+Fxxf0ya2QioMxflO8PCMh4OyG0CBjKUdrprEghreOx3bvbwibkDj43
         z5RTXtztgGgHDVgItx1/9HNRRCiek4j1MuI+md6fplMiYLH+NMfdYVugIWsUajpHb7GL
         GjhA==
X-Gm-Message-State: AOAM530WFeWsWV1nLOoElM7C+SOFYV1QXJmskLP4hHqf8OqARWt0nX0k
        Sg7LIt7D6RVI/rpLvz7gR5F+dpSt/pk=
X-Google-Smtp-Source: ABdhPJzv0VIPNhdFPMSGmeCngEsC2QGpphjAUIXPXhHGxiopV1JY3U3+45Vr6lD5aZgpxbOqHWrnHQ==
X-Received: by 2002:a05:6808:f8a:: with SMTP id o10mr1237204oiw.153.1631823551363;
        Thu, 16 Sep 2021 13:19:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k23sm957331ood.12.2021.09.16.13.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 13:19:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 16 Sep 2021 13:19:09 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH hwmon-next v2 2/3] hwmon: (mlxreg-fan) Extend driver to
 support multiply PWM
Message-ID: <20210916201909.GC1966690@roeck-us.net>
References: <20210916194719.871413-1-vadimp@nvidia.com>
 <20210916194719.871413-3-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916194719.871413-3-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 16, 2021 at 10:47:18PM +0300, Vadim Pasternak wrote:
> Add additional PWM attributes in order to support the systems, which
> can be equipped with up-to four PWM controllers. System capability of
> additional PWM support is validated through the reading of relevant
> registers.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>

Applied, no need to resend.

Guenter

> ---
> v0->v2:
>  Comments pointed out by Guenter:
>  - Fix handling of PWM counter, increment 'pwm_num', drop 'pwm_avail'.
> ---
>  drivers/hwmon/mlxreg-fan.c | 55 +++++++++++++++++++++++++++++---------
>  1 file changed, 43 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
> index 0f5b109817a7..1a146cc4b0fd 100644
> --- a/drivers/hwmon/mlxreg-fan.c
> +++ b/drivers/hwmon/mlxreg-fan.c
> @@ -13,6 +13,8 @@
>  #include <linux/thermal.h>
>  
>  #define MLXREG_FAN_MAX_TACHO		14
> +#define MLXREG_FAN_MAX_PWM		4
> +#define MLXREG_FAN_PWM_NOT_CONNECTED	0xff
>  #define MLXREG_FAN_MAX_STATE		10
>  #define MLXREG_FAN_MIN_DUTY		51	/* 20% */
>  #define MLXREG_FAN_MAX_DUTY		255	/* 100% */
> @@ -105,7 +107,7 @@ struct mlxreg_fan {
>  	void *regmap;
>  	struct mlxreg_core_platform_data *pdata;
>  	struct mlxreg_fan_tacho tacho[MLXREG_FAN_MAX_TACHO];
> -	struct mlxreg_fan_pwm pwm;
> +	struct mlxreg_fan_pwm pwm[MLXREG_FAN_MAX_PWM];
>  	int tachos_per_drwr;
>  	int samples;
>  	int divider;
> @@ -119,6 +121,7 @@ mlxreg_fan_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>  {
>  	struct mlxreg_fan *fan = dev_get_drvdata(dev);
>  	struct mlxreg_fan_tacho *tacho;
> +	struct mlxreg_fan_pwm *pwm;
>  	u32 regval;
>  	int err;
>  
> @@ -169,9 +172,10 @@ mlxreg_fan_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>  		break;
>  
>  	case hwmon_pwm:
> +		pwm = &fan->pwm[channel];
>  		switch (attr) {
>  		case hwmon_pwm_input:
> -			err = regmap_read(fan->regmap, fan->pwm.reg, &regval);
> +			err = regmap_read(fan->regmap, pwm->reg, &regval);
>  			if (err)
>  				return err;
>  
> @@ -195,6 +199,7 @@ mlxreg_fan_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>  		 int channel, long val)
>  {
>  	struct mlxreg_fan *fan = dev_get_drvdata(dev);
> +	struct mlxreg_fan_pwm *pwm;
>  
>  	switch (type) {
>  	case hwmon_pwm:
> @@ -203,7 +208,8 @@ mlxreg_fan_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>  			if (val < MLXREG_FAN_MIN_DUTY ||
>  			    val > MLXREG_FAN_MAX_DUTY)
>  				return -EINVAL;
> -			return regmap_write(fan->regmap, fan->pwm.reg, val);
> +			pwm = &fan->pwm[channel];
> +			return regmap_write(fan->regmap, pwm->reg, val);
>  		default:
>  			return -EOPNOTSUPP;
>  		}
> @@ -235,7 +241,7 @@ mlxreg_fan_is_visible(const void *data, enum hwmon_sensor_types type, u32 attr,
>  		break;
>  
>  	case hwmon_pwm:
> -		if (!(((struct mlxreg_fan *)data)->pwm.connected))
> +		if (!(((struct mlxreg_fan *)data)->pwm[channel].connected))
>  			return 0;
>  
>  		switch (attr) {
> @@ -270,6 +276,9 @@ static const struct hwmon_channel_info *mlxreg_fan_hwmon_info[] = {
>  			   HWMON_F_INPUT | HWMON_F_FAULT,
>  			   HWMON_F_INPUT | HWMON_F_FAULT),
>  	HWMON_CHANNEL_INFO(pwm,
> +			   HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT,
>  			   HWMON_PWM_INPUT),
>  	NULL
>  };
> @@ -300,7 +309,7 @@ static int mlxreg_fan_get_cur_state(struct thermal_cooling_device *cdev,
>  	u32 regval;
>  	int err;
>  
> -	err = regmap_read(fan->regmap, fan->pwm.reg, &regval);
> +	err = regmap_read(fan->regmap, fan->pwm[0].reg, &regval);
>  	if (err) {
>  		dev_err(fan->dev, "Failed to query PWM duty\n");
>  		return err;
> @@ -343,7 +352,7 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
>  		for (i = state; i <= MLXREG_FAN_MAX_STATE; i++)
>  			fan->cooling_levels[i] = i;
>  
> -		err = regmap_read(fan->regmap, fan->pwm.reg, &regval);
> +		err = regmap_read(fan->regmap, fan->pwm[0].reg, &regval);
>  		if (err) {
>  			dev_err(fan->dev, "Failed to query PWM duty\n");
>  			return err;
> @@ -361,7 +370,7 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
>  
>  	/* Normalize the state to the valid speed range. */
>  	state = fan->cooling_levels[state];
> -	err = regmap_write(fan->regmap, fan->pwm.reg,
> +	err = regmap_write(fan->regmap, fan->pwm[0].reg,
>  			   MLXREG_FAN_PWM_STATE2DUTY(state));
>  	if (err) {
>  		dev_err(fan->dev, "Failed to write PWM duty\n");
> @@ -392,6 +401,22 @@ static int mlxreg_fan_connect_verify(struct mlxreg_fan *fan,
>  	return !!(regval & data->bit);
>  }
>  
> +static int mlxreg_pwm_connect_verify(struct mlxreg_fan *fan,
> +				     struct mlxreg_core_data *data)
> +{
> +	u32 regval;
> +	int err;
> +
> +	err = regmap_read(fan->regmap, data->reg, &regval);
> +	if (err) {
> +		dev_err(fan->dev, "Failed to query pwm register 0x%08x\n",
> +			data->reg);
> +		return err;
> +	}
> +
> +	return regval != MLXREG_FAN_PWM_NOT_CONNECTED;
> +}
> +
>  static int mlxreg_fan_speed_divider_get(struct mlxreg_fan *fan,
>  					struct mlxreg_core_data *data)
>  {
> @@ -420,8 +445,8 @@ static int mlxreg_fan_speed_divider_get(struct mlxreg_fan *fan,
>  static int mlxreg_fan_config(struct mlxreg_fan *fan,
>  			     struct mlxreg_core_platform_data *pdata)
>  {
> +	int tacho_num = 0, tacho_avail = 0, pwm_num = 0, i;
>  	struct mlxreg_core_data *data = pdata->data;
> -	int tacho_num = 0, tacho_avail = 0, i;
>  	bool configured = false;
>  	int err;
>  
> @@ -451,13 +476,19 @@ static int mlxreg_fan_config(struct mlxreg_fan *fan,
>  			fan->tacho[tacho_num++].connected = true;
>  			tacho_avail++;
>  		} else if (strnstr(data->label, "pwm", sizeof(data->label))) {
> -			if (fan->pwm.connected) {
> -				dev_err(fan->dev, "duplicate pwm entry: %s\n",
> +			if (pwm_num == MLXREG_FAN_MAX_TACHO) {
> +				dev_err(fan->dev, "too many pwm entries: %s\n",
>  					data->label);
>  				return -EINVAL;
>  			}
> -			fan->pwm.reg = data->reg;
> -			fan->pwm.connected = true;
> +
> +			err = mlxreg_pwm_connect_verify(fan, data);
> +			if (err)
> +				return err;
> +
> +			fan->pwm[pwm_num].reg = data->reg;
> +			fan->pwm[pwm_num].connected = true;
> +			pwm_num++;
>  		} else if (strnstr(data->label, "conf", sizeof(data->label))) {
>  			if (configured) {
>  				dev_err(fan->dev, "duplicate conf entry: %s\n",
> -- 
> 2.20.1
> 
