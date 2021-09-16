Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 744D2C43217
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 13:41:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 586196120F
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 13:41:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240324AbhIPNmg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 16 Sep 2021 09:42:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240272AbhIPNmf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Sep 2021 09:42:35 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B456C061574
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Sep 2021 06:41:15 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id s69so1565678oie.13
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Sep 2021 06:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1S0+DbDxU199O+AKJ02IJcghGrb1eGXaA/1C+J+bFso=;
        b=OzFEOykkDqzUvLx24cIbZWpbX+utN+7hzE6mTVhehfsrwNADKv2H2lKe1IIdQmjlIZ
         i8oxMJTsexdOWoD8+9C1et1S2RvjCU+7hrQz9aCFj8uI/BxBE7p0sjx7+zCtyVTrZ/bU
         RCPPfkXlvJfc3qOjurtmPlYtyh/h/RGfvUuGI13hapN7FF1E4d+BNNgM5U7eecTqySMG
         dce+xy8klRLIkMHqayWlHMMep4Jh+gM6HL2qAaygQjbLM3f16qgXHFXyJvVNJYm9/3d0
         Ohrj+cYTJODN27kK7QU+2njDisWVfSNXaG3X+Ump0OtTbhJrtpwgX9zBSI9CEcUCAF+B
         /nBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1S0+DbDxU199O+AKJ02IJcghGrb1eGXaA/1C+J+bFso=;
        b=7X36VZR5ujlfTLj+1U/vnBxThygC4B8ppH4pBUUPH5xqWJit7EuibMCtB/AQW75+gO
         PyZ2EihXhEOFSTWc4Z4ns7uGuCbhLisRvskgniEN7GOmEjYFdGOA6inPUYJOlMnk+V0i
         Y5Fdk8ZABXu8MajVNevr8aFtxpm1M46eGUTBR6JUyOWBAsjbcyubOk0piVsVnEfYSfxG
         D2jmTG7y+3rFbJpfR4DS+OVi9P7B/ISJ8ouPk0GAV9rGi7azLdRlWxVu4AHS1xU6+w2Y
         yjW9vV/taOIRZVglsXQJTD0HpGSp2zCNWuuEPgx5waRmVJrqiWyJpquP2AoO011eKwkb
         BsRA==
X-Gm-Message-State: AOAM53001BTvr6m0FEnucB0O8ipdtikvrv779+KzGupO1NAiNGHMYlav
        f8x7ATybD6lULgAq2cAglFNltWG2NfU=
X-Google-Smtp-Source: ABdhPJwOaIvkFSpRHaUGdUPluS1pJWy8GNTg6IDfBtGX6aNVsO2YUL1lq2rMWtA/g31Zu6soWCaSRA==
X-Received: by 2002:aca:670c:: with SMTP id z12mr3802773oix.14.1631799674420;
        Thu, 16 Sep 2021 06:41:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y24sm822810oto.40.2021.09.16.06.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Sep 2021 06:41:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH hwmon-next 2/3] hwmon: (mlxreg-fan) Extend driver to
 support multiply PWM
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     linux-hwmon@vger.kernel.org
References: <20210916132254.831200-1-vadimp@nvidia.com>
 <20210916132254.831200-3-vadimp@nvidia.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <9020e080-39d4-d365-c587-93da76ec2ea3@roeck-us.net>
Date:   Thu, 16 Sep 2021 06:41:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210916132254.831200-3-vadimp@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/16/21 6:22 AM, Vadim Pasternak wrote:
> Add additional PWM attributes in order to support the systems, which
> can be equipped with up-to four PWM controllers. System capability of
> additional PWM support is validated through the reading of relevant
> registers.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
>   drivers/hwmon/mlxreg-fan.c | 55 +++++++++++++++++++++++++++++---------
>   1 file changed, 43 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
> index 6e6c7437db94..930636868ef5 100644
> --- a/drivers/hwmon/mlxreg-fan.c
> +++ b/drivers/hwmon/mlxreg-fan.c
> @@ -13,6 +13,8 @@
>   #include <linux/thermal.h>
>   
>   #define MLXREG_FAN_MAX_TACHO		14
> +#define MLXREG_FAN_MAX_PWM		4
> +#define MLXREG_FAN_PWM_NOT_CONNECTED	0xff
>   #define MLXREG_FAN_MAX_STATE		10
>   #define MLXREG_FAN_MIN_DUTY		51	/* 20% */
>   #define MLXREG_FAN_MAX_DUTY		255	/* 100% */
> @@ -105,7 +107,7 @@ struct mlxreg_fan {
>   	void *regmap;
>   	struct mlxreg_core_platform_data *pdata;
>   	struct mlxreg_fan_tacho tacho[MLXREG_FAN_MAX_TACHO];
> -	struct mlxreg_fan_pwm pwm;
> +	struct mlxreg_fan_pwm pwm[MLXREG_FAN_MAX_PWM];
>   	int tachos_per_drwr;
>   	int samples;
>   	int divider;
> @@ -119,6 +121,7 @@ mlxreg_fan_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   {
>   	struct mlxreg_fan *fan = dev_get_drvdata(dev);
>   	struct mlxreg_fan_tacho *tacho;
> +	struct mlxreg_fan_pwm *pwm;
>   	u32 regval;
>   	int err;
>   
> @@ -169,9 +172,10 @@ mlxreg_fan_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   		break;
>   
>   	case hwmon_pwm:
> +		pwm = &fan->pwm[channel];
>   		switch (attr) {
>   		case hwmon_pwm_input:
> -			err = regmap_read(fan->regmap, fan->pwm.reg, &regval);
> +			err = regmap_read(fan->regmap, pwm->reg, &regval);
>   			if (err)
>   				return err;
>   
> @@ -195,6 +199,7 @@ mlxreg_fan_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   		 int channel, long val)
>   {
>   	struct mlxreg_fan *fan = dev_get_drvdata(dev);
> +	struct mlxreg_fan_pwm *pwm;
>   
>   	switch (type) {
>   	case hwmon_pwm:
> @@ -203,7 +208,8 @@ mlxreg_fan_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   			if (val < MLXREG_FAN_MIN_DUTY ||
>   			    val > MLXREG_FAN_MAX_DUTY)
>   				return -EINVAL;
> -			return regmap_write(fan->regmap, fan->pwm.reg, val);
> +			pwm = &fan->pwm[channel];
> +			return regmap_write(fan->regmap, pwm->reg, val);
>   		default:
>   			return -EOPNOTSUPP;
>   		}
> @@ -235,7 +241,7 @@ mlxreg_fan_is_visible(const void *data, enum hwmon_sensor_types type, u32 attr,
>   		break;
>   
>   	case hwmon_pwm:
> -		if (!(((struct mlxreg_fan *)data)->pwm.connected))
> +		if (!(((struct mlxreg_fan *)data)->pwm[channel].connected))
>   			return 0;
>   
>   		switch (attr) {
> @@ -270,6 +276,9 @@ static const struct hwmon_channel_info *mlxreg_fan_hwmon_info[] = {
>   			   HWMON_F_INPUT | HWMON_F_FAULT,
>   			   HWMON_F_INPUT | HWMON_F_FAULT),
>   	HWMON_CHANNEL_INFO(pwm,
> +			   HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT,
>   			   HWMON_PWM_INPUT),
>   	NULL
>   };
> @@ -300,7 +309,7 @@ static int mlxreg_fan_get_cur_state(struct thermal_cooling_device *cdev,
>   	u32 regval;
>   	int err;
>   
> -	err = regmap_read(fan->regmap, fan->pwm.reg, &regval);
> +	err = regmap_read(fan->regmap, fan->pwm[0].reg, &regval);
>   	if (err) {
>   		dev_err(fan->dev, "Failed to query PWM duty\n");
>   		return err;
> @@ -339,7 +348,7 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
>   		for (i = state; i <= MLXREG_FAN_MAX_STATE; i++)
>   			fan->cooling_levels[i] = i;
>   
> -		err = regmap_read(fan->regmap, fan->pwm.reg, &regval);
> +		err = regmap_read(fan->regmap, fan->pwm[0].reg, &regval);
>   		if (err) {
>   			dev_err(fan->dev, "Failed to query PWM duty\n");
>   			return err;
> @@ -358,7 +367,7 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
>   
>   	/* Normalize the state to the valid speed range. */
>   	state = fan->cooling_levels[state];
> -	err = regmap_write(fan->regmap, fan->pwm.reg,
> +	err = regmap_write(fan->regmap, fan->pwm[0].reg,
>   			   MLXREG_FAN_PWM_STATE2DUTY(state));
>   	if (err) {
>   		dev_err(fan->dev, "Failed to write PWM duty\n");
> @@ -390,6 +399,22 @@ static int mlxreg_fan_connect_verify(struct mlxreg_fan *fan,
>   	return !!(regval & data->bit);
>   }
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
>   static int mlxreg_fan_speed_divider_get(struct mlxreg_fan *fan,
>   					struct mlxreg_core_data *data)
>   {
> @@ -418,8 +443,8 @@ static int mlxreg_fan_speed_divider_get(struct mlxreg_fan *fan,
>   static int mlxreg_fan_config(struct mlxreg_fan *fan,
>   			     struct mlxreg_core_platform_data *pdata)
>   {
> +	int tacho_num = 0, tacho_avail = 0, pwm_num = 0, pwm_avail = 0, i;
>   	struct mlxreg_core_data *data = pdata->data;
> -	int tacho_num = 0, tacho_avail = 0, i;
>   	bool configured = false;
>   	int err;
>   
> @@ -449,13 +474,19 @@ static int mlxreg_fan_config(struct mlxreg_fan *fan,
>   			fan->tacho[tacho_num++].connected = true;
>   			tacho_avail++;
>   		} else if (strnstr(data->label, "pwm", sizeof(data->label))) {
> -			if (fan->pwm.connected) {
> -				dev_err(fan->dev, "duplicate pwm entry: %s\n",
> +			if (pwm_num == MLXREG_FAN_MAX_TACHO) {
> +				dev_err(fan->dev, "too many pwm entries: %s\n",
>   					data->label);
>   				return -EINVAL;
>   			}
> -			fan->pwm.reg = data->reg;
> -			fan->pwm.connected = true;
> +
> +			err = mlxreg_pwm_connect_verify(fan, data);
> +			if (err)
> +				return err;
> +
> +			fan->pwm[pwm_num].reg = data->reg;
> +			fan->pwm[pwm_num].connected = true;

I don't see where pwm_num is ever increased. Also, given the context,
don't see why pwm_avail would be necessary. This is different to the
tacho code, which distinguishes between num and avail.

> +			pwm_avail++;
>   		} else if (strnstr(data->label, "conf", sizeof(data->label))) {
>   			if (configured) {
>   				dev_err(fan->dev, "duplicate conf entry: %s\n",
> 

