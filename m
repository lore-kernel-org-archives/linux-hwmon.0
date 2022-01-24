Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0502CC433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Jan 2022 17:16:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232172AbiAXRQJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 24 Jan 2022 12:16:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbiAXRQJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Jan 2022 12:16:09 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A653C06173B
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Jan 2022 09:16:08 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id x193so26616079oix.0
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Jan 2022 09:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=sOTcEiKx2Rs+mvqB/bnUj7+fkBdCgeaTelhQfpOatY0=;
        b=ea7svJ5yvrjbT6lKUKaSjU0SzQyuuRY9rvxA3hnQBd/dpYt3Zi+NIB5f7MyNSd+euW
         8D46ZQbtEZKB0ya8y+jNbKRJ2tpe0twIrWCQdBw5LYACcr0tGhvZ9z0NvnxQCAN8m8iI
         vGpx0QfY2t/3CwOFBdBNfIh4JGkwD4i7fINRpyrOj4owi87dAi+NCHKsfSdCZRNxbpB+
         kJ+5ocwbtS4itcSDGwyF5pneuxJQalXvcQPTsR40PsqVN+QKihEXVReFkh4kEpP1MUd7
         lqVEp6Fx7wr0iM98nJmFAsaRTL5osgicBdoCf1G+knfQleQ+JYQychDYPMozJjiIhTKj
         2ijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=sOTcEiKx2Rs+mvqB/bnUj7+fkBdCgeaTelhQfpOatY0=;
        b=hvzYmqbf1HHiPKB4hDAI+UZxULMUye5wZiaSXBclQmJElvTcL6KUklmrvb4Ea+PsZB
         7ChbrSMvK7mglQ6Uf4BEYCie43zk45URxZ8W6nO8ysKCO8pkIdSw8aR0c1S9It28wsCh
         XJmQFtiCyDN+FCUlUpTF6HUHrippLJPDwZMutFS6nVF8f0RoZE3+V5RWU3srVA1Haw+Z
         1dMfHDf4kMmt1G6aRci9AzaPtBZpgW6+R+csSLjRHXPhzPjpkSNjDqJbIRICU4EQqpM4
         e7msX8kfM1kMkMxU26d8/1rSFn9htPWgk+uE1zlfjB2LgdkIq6ECs2lBxLjYWhvHxNrX
         sxbQ==
X-Gm-Message-State: AOAM530EmxTi4v13jLuTEciWb95TTLxA+1gC0vJlCTx/om5JJS3/BFOn
        i8HHa445ERksxUK8AiL4Mjw=
X-Google-Smtp-Source: ABdhPJzGn4VqLZBIytbwoFpuwOQCTcGOF5jxY7YmpnPDrmMIlqvoWxg0nE/5+W4xBzXdzIKmf/3pYw==
X-Received: by 2002:a05:6808:b38:: with SMTP id t24mr2298573oij.25.1643044567713;
        Mon, 24 Jan 2022 09:16:07 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w7sm4500857oou.13.2022.01.24.09.16.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jan 2022 09:16:06 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <70f24710-9efb-5002-22de-718f67a8537a@roeck-us.net>
Date:   Mon, 24 Jan 2022 09:16:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     linux-hwmon@vger.kernel.org
References: <20220124112744.27950-1-vadimp@nvidia.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH hwmon-next 1/1] hwmon: (mlxreg-fan) Use pwm attribute for
 setting fan speed low limit
In-Reply-To: <20220124112744.27950-1-vadimp@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 1/24/22 03:27, Vadim Pasternak wrote:
> Currently driver uses 'thermal' attribute 'cur_state' to set low limit
> for fan speed from user space. Such limit is set due to system wise
> considerations, like absence of power supply unit, faults received for
> transceivers, power supplies, or some other devices.
> 
> Recently 'cur_state' interface has been deprecated, while the speed
> limit feature is required for Nvidia systems.
> 
Unless I am missing something, what is deprecated is setting cur_state
from userspace, not setting it from the kernel. So this is misleading
and needs to be explained further. What exactly is needed for Nvidia
systems, and why can those systems not use the recommended mechanisms
to control the system state ?

> Use 'hwmon' 'pwm' attribute for setting low limit for fan speed in
> case 'thermal' subsystem is configured in kernel. In this case setting

"pwm" is supposed to set the current pwm value, not a minimum pwm value.
What I think (suspect ?) this is doing is to never let the thermal
subsystem select a lower duty cycle than the duty cycle selected
with the pwm attribute, which makes more sense and should be explained
accordingly. If so, I think it should be possible to simplify the code
significantly: For example, assuming that cooling levels 0..10 translate
to pwm duty cycles 0%..100%, just let the resulting pwm value never
be lower than the pwm value selected with the pwm attribute.
There should be no need to keep changing cooling_levels[].

> fan speed through 'hwmon' is used for setting fan low speed limit:
> - Fan speed is to be updated in hardware in case the requested fan
>    speed is above of the last cooling level, set by 'thermal' subsystem.
>    Thermal cooling levels array is to be updated accordingly, thus
>    if cooling state has been set to 'n', fan->cooling_levels[0..n] are
>    to be converted to the same RPM value.
> - Otherwise, the requested fan speed is only to be stored in thermal
>    cooling levels array with no update in hardware.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
>   drivers/hwmon/mlxreg-fan.c | 96 +++++++++++++++++++-------------------
>   1 file changed, 47 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
> index 4a8becdb0d58..daae8741ff2b 100644
> --- a/drivers/hwmon/mlxreg-fan.c
> +++ b/drivers/hwmon/mlxreg-fan.c
> @@ -18,15 +18,6 @@
>   #define MLXREG_FAN_MAX_STATE		10
>   #define MLXREG_FAN_MIN_DUTY		51	/* 20% */
>   #define MLXREG_FAN_MAX_DUTY		255	/* 100% */
> -/*
> - * Minimum and maximum FAN allowed speed in percent: from 20% to 100%. Values
> - * MLXREG_FAN_MAX_STATE + x, where x is between 2 and 10 are used for
> - * setting FAN speed dynamic minimum. For example, if value is set to 14 (40%)
> - * cooling levels vector will be set to 4, 4, 4, 4, 4, 5, 6, 7, 8, 9, 10 to
> - * introduce PWM speed in percent: 40, 40, 40, 40, 40, 50, 60. 70, 80, 90, 100.
> - */
> -#define MLXREG_FAN_SPEED_MIN			(MLXREG_FAN_MAX_STATE + 2)
> -#define MLXREG_FAN_SPEED_MAX			(MLXREG_FAN_MAX_STATE * 2)
>   #define MLXREG_FAN_SPEED_MIN_LEVEL		2	/* 20 percent */
>   #define MLXREG_FAN_TACHO_SAMPLES_PER_PULSE_DEF	44
>   #define MLXREG_FAN_TACHO_DIV_MIN		283
> @@ -87,6 +78,7 @@ struct mlxreg_fan_tacho {
>    * @connected: indicates if PWM is connected;
>    * @reg: register offset;
>    * @cooling: cooling device levels;
> + * @last_thermal_state: last cooling state set by thermal subsystem;
>    * @cdev: cooling device;
>    */
>   struct mlxreg_fan_pwm {
> @@ -94,6 +86,7 @@ struct mlxreg_fan_pwm {
>   	bool connected;
>   	u32 reg;
>   	u8 cooling_levels[MLXREG_FAN_MAX_STATE + 1];
> +	unsigned long last_thermal_state;
>   	struct thermal_cooling_device *cdev;
>   };
>   
> @@ -107,6 +100,7 @@ struct mlxreg_fan_pwm {
>    * @tachos_per_drwr - number of tachometers per drawer;
>    * @samples: minimum allowed samples per pulse;
>    * @divider: divider value for tachometer RPM calculation;
> + * @pwm_limit_set: callback to set minimum limit for PWM;
>    */
>   struct mlxreg_fan {
>   	struct device *dev;
> @@ -117,6 +111,7 @@ struct mlxreg_fan {
>   	int tachos_per_drwr;
>   	int samples;
>   	int divider;
> +	int (*pwm_limit_set)(struct mlxreg_fan *fan, struct mlxreg_fan_pwm *pwm, long val);

Are we at any time in the future expecting a different callback
function ? If not, using a callback is not warranted. Just use
if (IS_REACHABLE(CONFIG_THERMAL)) instead.

>   };
>   
>   static int
> @@ -204,6 +199,7 @@ mlxreg_fan_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   {
>   	struct mlxreg_fan *fan = dev_get_drvdata(dev);
>   	struct mlxreg_fan_pwm *pwm;
> +	int err;
>   
>   	switch (type) {
>   	case hwmon_pwm:
> @@ -213,7 +209,11 @@ mlxreg_fan_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   			    val > MLXREG_FAN_MAX_DUTY)
>   				return -EINVAL;
>   			pwm = &fan->pwm[channel];
> -			return regmap_write(fan->regmap, pwm->reg, val);
> +			/* If thermal is configured - handle PWM limit setting. */
> +			if (!err && fan->pwm_limit_set)

I don't see where 'err' is set. Doesn't the compiler complain about
using an uninitialized variable ?

> +				return fan->pwm_limit_set(fan, pwm, val);
> +			err = regmap_write(fan->regmap, pwm->reg, val);
> +			return err;

Why not just keep the original code ?
			return regmap_write(fan->regmap, pwm->reg, val);
			
>   		default:
>   			return -EOPNOTSUPP;
>   		}
> @@ -338,49 +338,13 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,

If this API
>   {
>   	struct mlxreg_fan_pwm *pwm = cdev->devdata;
>   	struct mlxreg_fan *fan = pwm->fan;
> -	unsigned long cur_state;
> -	int i, config = 0;
> -	u32 regval;
>   	int err;
>   
> -	/*
> -	 * Verify if this request is for changing allowed FAN dynamical
> -	 * minimum. If it is - update cooling levels accordingly and update
> -	 * state, if current state is below the newly requested minimum state.
> -	 * For example, if current state is 5, and minimal state is to be
> -	 * changed from 4 to 6, fan->cooling_levels[0 to 5] will be changed all
> -	 * from 4 to 6. And state 5 (fan->cooling_levels[4]) should be
> -	 * overwritten.
> -	 */
> -	if (state >= MLXREG_FAN_SPEED_MIN && state <= MLXREG_FAN_SPEED_MAX) {
> -		/*
> -		 * This is configuration change, which is only supported through sysfs.
> -		 * For configuration non-zero value is to be returned to avoid thermal
> -		 * statistics update.
> -		 */
> -		config = 1;
> -		state -= MLXREG_FAN_MAX_STATE;
> -		for (i = 0; i < state; i++)
> -			pwm->cooling_levels[i] = state;
> -		for (i = state; i <= MLXREG_FAN_MAX_STATE; i++)
> -			pwm->cooling_levels[i] = i;
> -
> -		err = regmap_read(fan->regmap, pwm->reg, &regval);
> -		if (err) {
> -			dev_err(fan->dev, "Failed to query PWM duty\n");
> -			return err;
> -		}
> -
> -		cur_state = MLXREG_FAN_PWM_DUTY2STATE(regval);
> -		if (state < cur_state)
> -			return config;
> -
> -		state = cur_state;
> -	}
> -
>   	if (state > MLXREG_FAN_MAX_STATE)
>   		return -EINVAL;
>   
> +	/* Save requested thermal state. */
> +	pwm->last_thermal_state = state;
>   	/* Normalize the state to the valid speed range. */
>   	state = pwm->cooling_levels[state];
>   	err = regmap_write(fan->regmap, pwm->reg,
> @@ -389,7 +353,7 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
>   		dev_err(fan->dev, "Failed to write PWM duty\n");
>   		return err;
>   	}
> -	return config;
> +	return 0;
>   }
>   
>   static const struct thermal_cooling_device_ops mlxreg_fan_cooling_ops = {
> @@ -562,6 +526,38 @@ static int mlxreg_fan_config(struct mlxreg_fan *fan,
>   	return 0;
>   }
>   
> +static int mlxreg_pwm_limit_set(struct mlxreg_fan *fan, struct mlxreg_fan_pwm *pwm, long val)
> +{
> +	unsigned long new_state;
> +	int i, err = 0;
> +	u32 regval;
> +
> +	/*
> +	 * In case thermal subsystem is configured, access for PWM setting through hwmon is used
> +	 * for setting fan minimum speed limit. For such case update cooling levels accordingly,
> +	 * thus if cooling state has been set to 'n', fan->cooling_levels[0..n] are to be
> +	 * converted to the same RPM value. Update PWM in case requested speed is above cooling
> +	 * state set by thermal driver.
> +	 */
> +	err = regmap_read(fan->regmap, pwm->reg, &regval);
> +	if (err) {
> +		dev_err(fan->dev, "Failed to query PWM duty\n");
> +		return err;
> +	}
> +
> +	new_state = MLXREG_FAN_PWM_DUTY2STATE(val);
> +
> +	for (i = 0; i < new_state; i++)
> +		pwm->cooling_levels[i] = new_state;
> +	for (i = new_state; i <= MLXREG_FAN_MAX_STATE; i++)
> +		pwm->cooling_levels[i] = i;
> +	/* Update PWM only in case requested state is above last thermal state. */
> +	if (new_state >= pwm->last_thermal_state)
> +		err = regmap_write(fan->regmap, pwm->reg, MLXREG_FAN_PWM_STATE2DUTY(new_state));
> +
> +	return err;
> +}
> +
>   static int mlxreg_fan_cooling_config(struct device *dev, struct mlxreg_fan *fan)
>   {
>   	int i, j;
> @@ -586,6 +582,8 @@ static int mlxreg_fan_cooling_config(struct device *dev, struct mlxreg_fan *fan)
>   			pwm->cooling_levels[j] = j;
>   	}
>   
> +	fan->pwm_limit_set = mlxreg_pwm_limit_set;
> +
>   	return 0;
>   }
>   

