Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5CB8C433C1
	for <linux-hwmon@archiver.kernel.org>; Mon, 29 Mar 2021 22:14:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71AA86193A
	for <linux-hwmon@archiver.kernel.org>; Mon, 29 Mar 2021 22:14:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230444AbhC2WON (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 29 Mar 2021 18:14:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231185AbhC2WNp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 29 Mar 2021 18:13:45 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD3CDC061762
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Mar 2021 15:13:45 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id 91-20020a9d08640000b0290237d9c40382so13727368oty.12
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Mar 2021 15:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hhIHA4vbeHE9h6vlv9AKbpKqLtFCEndHgbsgqb3DAd0=;
        b=GQv0Y8n9gq5UjaqQHlmPx9KQ0aGnYHtAnPM2IO25wtyqdwOKlcsqLkF5fh2p+aMqrt
         MblB4Dddej5ewKDkszJ7+L2GRQvABVJPD5AFJ+xOPm+9cQLwuFHV/vnTa+rMReChB7gr
         iC4ZIR2Zu5xYkIYGeGwaxJqrmIVaDkrzVkWgNumGqW3t6Mui63QTDab/bw/69DcCEIuF
         XRBNT8oeuBjnk/qZHGS1GQv49/OzC1RldSNkkuDzUOl2Pph5iCeqi3dipbxwV5c3mWaS
         hRBjzms8THF04dGsHIWsG+QUiWblo/IkGKnuq5YcpKVfiIZAkgd8KMY/pDFFfYFutsMe
         Db/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=hhIHA4vbeHE9h6vlv9AKbpKqLtFCEndHgbsgqb3DAd0=;
        b=kV4EsQIQpdxXvS2NY+1MzMocPn40yyOM7ZENVMD2XxcywW2GIChgYZTtGjMC7JMogE
         JnEHGzjp8g8nHzjV1C9JR5LWNIdZDxM6nWmm3NTBADMJNOLGCbilokU54czGyAl4uk24
         yS+6ROu7VrzBGy8BaO5KCOHkPFzcoXsq2Ny/BqCtZqbz94SbO7Qh5iwST7dJgufbo/o5
         7fNw3cVYo2f9eCsQhnihKCr+/48rM0GUt1/7Kb3RB55BJIUdASbBocuGYoDzgTSWViJU
         d+pTruOero5vz+sqc2MA4K84RNLF117xewwCajkDI5Wqx3kH6rDzJAdFwYgl7zb2UCb6
         6unA==
X-Gm-Message-State: AOAM531wQrSXO3hN6CAtZYTI1q0CZ89/u/QAGPVt1JyizTWLck185oN5
        cjxl9Qw1CiH7bMQfa9zWZ1Crphx2GQM=
X-Google-Smtp-Source: ABdhPJwpdTAvinNZ6v0VSfC5VDx+OSURFks/uhe19o1RdFz8c+gWKV6M2zzdnDyTTXLDGsyG7VYImg==
X-Received: by 2002:a9d:4d0e:: with SMTP id n14mr24116992otf.316.1617056025094;
        Mon, 29 Mar 2021 15:13:45 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y11sm4865221ots.80.2021.03.29.15.13.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Mar 2021 15:13:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 29 Mar 2021 15:13:43 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH hwmon-next v3 1/1] hwmon: (mlxreg-fan) Add support for
 fan drawers capability and present registers
Message-ID: <20210329221343.GA223346@roeck-us.net>
References: <20210322172237.2213584-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210322172237.2213584-1-vadimp@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Mar 22, 2021 at 07:22:37PM +0200, Vadim Pasternak wrote:
> Add support for fan drawer's capability and present registers in order
> to set mapping between the fan drawers and tachometers. Some systems
> are equipped with fan drawers with one tachometer inside. Others with
> fan drawers with several tachometers inside. Using present register
> along with tachometer-to-drawer mapping allows to skip reading missed
> tachometers and expose input for them as zero, instead of exposing
> fault code returned by hardware.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
> v2->v3:
>  Comments pointed out by Guenter:
>  - Remove unnecessary braces mlxreg_fan_read() (missed in v2).
>  - In order to avoid divide by 0 error, validate 'tachos_per_drwr' is
>    set prior mapping tachometer to drawer in mlxreg_fan_read().
>  - Change 'regval' to unsigned integer in mlxreg_fan_config().
>    Move it inside the 'if' statement, where it is used.
>  - No need to initialize 'drwr_avail' in mlxreg_fan_config().
>    Move it inside the 'if' statement, where it is used.
>  - Return error in case number of fan drawers less the number of
>    tachometers, since this is not valid.
>  Added by Vadim:
>  - Fix comment in mlxreg_fan_read().
> v1->v2:
>  Comments pointed out by Guenter:
>  - Simplify drawers number calculation in mlxreg_fan_config().
>  - Validate that the number of drawers and tachometers, supported on
>    system, both are not zero. Otherwise return error.
>  Added by Vadim:
>  - Change comment in mlxreg_fan_read() regarding FAN presence - use
>    "FAN is inserted" instead of "FAN is physically connected", to
>    clarify that "FAN presence" can be changed dynamically.
> ---
>  drivers/hwmon/mlxreg-fan.c | 51 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
> index ed8d59d4eecb..116681fde33d 100644
> --- a/drivers/hwmon/mlxreg-fan.c
> +++ b/drivers/hwmon/mlxreg-fan.c
> @@ -67,11 +67,13 @@
>   * @connected: indicates if tachometer is connected;
>   * @reg: register offset;
>   * @mask: fault mask;
> + * @prsnt: present register offset;
>   */
>  struct mlxreg_fan_tacho {
>  	bool connected;
>  	u32 reg;
>  	u32 mask;
> +	u32 prsnt;
>  };
>  
>  /*
> @@ -92,6 +94,7 @@ struct mlxreg_fan_pwm {
>   * @regmap: register map of parent device;
>   * @tacho: tachometer data;
>   * @pwm: PWM data;
> + * @tachos_per_drwr - number of tachometers per drawer;
>   * @samples: minimum allowed samples per pulse;
>   * @divider: divider value for tachometer RPM calculation;
>   * @cooling: cooling device levels;
> @@ -103,6 +106,7 @@ struct mlxreg_fan {
>  	struct mlxreg_core_platform_data *pdata;
>  	struct mlxreg_fan_tacho tacho[MLXREG_FAN_MAX_TACHO];
>  	struct mlxreg_fan_pwm pwm;
> +	int tachos_per_drwr;
>  	int samples;
>  	int divider;
>  	u8 cooling_levels[MLXREG_FAN_MAX_STATE + 1];
> @@ -123,6 +127,26 @@ mlxreg_fan_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>  		tacho = &fan->tacho[channel];
>  		switch (attr) {
>  		case hwmon_fan_input:
> +			/*
> +			 * Check FAN presence: FAN related bit in presence register is one,
> +			 * if FAN is physically connected, zero - otherwise.
> +			 */
> +			if (tacho->prsnt && fan->tachos_per_drwr) {
> +				err = regmap_read(fan->regmap, tacho->prsnt, &regval);
> +				if (err)
> +					return err;
> +
> +				/*
> +				 * Map channel to presence bit - drawer can be equipped with
> +				 * one or few FANs, while presence is indicated per drawer.
> +				 */
> +				if (BIT(channel / fan->tachos_per_drwr) & regval) {
> +					/* FAN is not connected - return zero for FAN speed. */
> +					*val = 0;
> +					return 0;
> +				}
> +			}
> +
>  			err = regmap_read(fan->regmap, tacho->reg, &regval);
>  			if (err)
>  				return err;
> @@ -389,8 +413,8 @@ static int mlxreg_fan_config(struct mlxreg_fan *fan,
>  			     struct mlxreg_core_platform_data *pdata)
>  {
>  	struct mlxreg_core_data *data = pdata->data;
> +	int tacho_num = 0, tacho_avail = 0, i;
>  	bool configured = false;
> -	int tacho_num = 0, i;
>  	int err;
>  
>  	fan->samples = MLXREG_FAN_TACHO_SAMPLES_PER_PULSE_DEF;
> @@ -415,7 +439,9 @@ static int mlxreg_fan_config(struct mlxreg_fan *fan,
>  
>  			fan->tacho[tacho_num].reg = data->reg;
>  			fan->tacho[tacho_num].mask = data->mask;
> +			fan->tacho[tacho_num].prsnt = data->reg_prsnt;
>  			fan->tacho[tacho_num++].connected = true;
> +			tacho_avail++;
>  		} else if (strnstr(data->label, "pwm", sizeof(data->label))) {
>  			if (fan->pwm.connected) {
>  				dev_err(fan->dev, "duplicate pwm entry: %s\n",
> @@ -453,6 +479,29 @@ static int mlxreg_fan_config(struct mlxreg_fan *fan,
>  		}
>  	}
>  
> +	if (pdata->capability) {
> +		int drwr_avail;
> +		u32 regval;
> +
> +		/* Obtain the number of FAN drawers, supported by system. */
> +		err = regmap_read(fan->regmap, pdata->capability, &regval);
> +		if (err) {
> +			dev_err(fan->dev, "Failed to query capability register 0x%08x\n",
> +				pdata->capability);
> +			return err;
> +		}
> +
> +		drwr_avail = hweight32(regval);
> +		if (!tacho_avail || !drwr_avail || tacho_avail < drwr_avail) {
> +			dev_err(fan->dev, "Configuration is invalid: drawers num %d tachos num %d\n",
> +				drwr_avail, tacho_avail);
> +			return -EINVAL;
> +		}
> +
> +		/* Set the number of tachometers per one drawer. */
> +		fan->tachos_per_drwr = tacho_avail / drwr_avail;
> +	}
> +
>  	/* Init cooling levels per PWM state. */
>  	for (i = 0; i < MLXREG_FAN_SPEED_MIN_LEVEL; i++)
>  		fan->cooling_levels[i] = MLXREG_FAN_SPEED_MIN_LEVEL;
