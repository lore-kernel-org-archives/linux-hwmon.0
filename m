Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87362C4361B
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Dec 2020 20:44:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BC1222582
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Dec 2020 20:44:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727566AbgLHUoK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 8 Dec 2020 15:44:10 -0500
Received: from gproxy2-pub.mail.unifiedlayer.com ([69.89.18.3]:55186 "EHLO
        gproxy2-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729372AbgLHUoK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 8 Dec 2020 15:44:10 -0500
Received: from cmgw10.unifiedlayer.com (unknown [10.9.0.10])
        by gproxy2.mail.unifiedlayer.com (Postfix) with ESMTP id 3EDDA1E0695
        for <linux-hwmon@vger.kernel.org>; Tue,  8 Dec 2020 12:49:33 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id mizMklrpyDlydmizNkY0PP; Tue, 08 Dec 2020 12:49:33 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=Na7IKVL4 c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
 a=zTNgK-yGK50A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=Ikd4Dj_1AAAA:8
 a=nqDq7g027uqO0xOfmSsA:9 a=IrozfAhPQEuQoa7p:21 a=tRMeWC-FM1UP98Em:21
 a=CjuIK1q_8ugA:10:nop_charset_2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=f1TnuxSpgW7YkkgGCtqe9JN3PQWSIr/XCM6AC0mHy1o=; b=a/PArZ06ETvJ7rLEmLg3h2AWoQ
        UZrgEfzNmwnVFxq0V6aBwSW7LmQvfL3VD8Rg/LmdAXyt6kpt/VKuHPQekTgOhl8AFsYe19bEAkuH7
        j95WJUH3ZkgkbjkGa7cP1k++tkjWh01fIifHNcszh21F0zUAFGC07IjxmoHPwea16+asByaiZvHjN
        kzlyOvW9fKi0lCYmot24bK+lMrmjIo90LoiBmQ/kh5ed7KlzCgQJB16P2VfIjT8SA1YImtN/aEcRP
        QCEm/fi9GYn/URd68uzdne4ZeROGn1NBNuLpn7iXxPXuCrx0/AgWEjcab286JH4mGGO36WUe40i54
        eIM37bjA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:40938 helo=localhost)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1kmizM-001z4J-Bp; Tue, 08 Dec 2020 19:49:32 +0000
Date:   Tue, 8 Dec 2020 11:49:31 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH hwmon-next 1/1] hwmon: (mlxreg-fan) Add support for fan
 drawers capability and present registers
Message-ID: <20201208194931.GD71189@roeck-us.net>
References: <20201208092931.1074-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208092931.1074-1-vadimp@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1kmizM-001z4J-Bp
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:40938
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 16
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Dec 08, 2020 at 11:29:31AM +0200, Vadim Pasternak wrote:
> Add support for fan drawer's capability and present registers in order
> to set mapping between the fan drawers and tachometers. Some systems
> are equipped with fan drawers with one tachometer inside. Others with
> fan drawers with several tachometers inside. Using present register
> along with tachometer-to-drawer mapping allows to skip reading missed
> tachometers and expose input for them as zero, instead of exposing
> fault code returned by hardware.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
>  drivers/hwmon/mlxreg-fan.c | 46 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
> index ed8d59d4eecb..ab743929a6cd 100644
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
> +			 * if FAN is not physically connected, zero - otherwise.
> +			 */
> +			if (tacho->prsnt) {
> +				err = regmap_read(fan->regmap, tacho->prsnt, &regval);
> +				if (err)
> +					return err;
> +
> +				/*
> +				 * Map channel to presence bit - drawer can be equipped with
> +				 * one or few FANs, while presence is indicated per drawer.
> +				 */
> +				if ((BIT(channel / fan->tachos_per_drwr) & regval)) {

The outer double (( )) is pointless.

> +					/* FAN is not connected - return zero for FAN speed. */
> +					*val = 0;
> +					return 0;
> +				}

Assuming fan configuration is static, it might make more sense
to disable the attribute in the is_visible function instead of
checking the presence condition over and over again.

> +			}
> +
>  			err = regmap_read(fan->regmap, tacho->reg, &regval);
>  			if (err)
>  				return err;
> @@ -388,9 +412,11 @@ static int mlxreg_fan_speed_divider_get(struct mlxreg_fan *fan,
>  static int mlxreg_fan_config(struct mlxreg_fan *fan,
>  			     struct mlxreg_core_platform_data *pdata)
>  {
> +	int tacho_num = 0, regval, regsize, drwr_avail = 0, tacho_avail = 0, i;
>  	struct mlxreg_core_data *data = pdata->data;
>  	bool configured = false;
> -	int tacho_num = 0, i;
> +	unsigned long drwrs;
> +	u32 bit;
>  	int err;
>  
>  	fan->samples = MLXREG_FAN_TACHO_SAMPLES_PER_PULSE_DEF;
> @@ -415,7 +441,9 @@ static int mlxreg_fan_config(struct mlxreg_fan *fan,
>  
>  			fan->tacho[tacho_num].reg = data->reg;
>  			fan->tacho[tacho_num].mask = data->mask;
> +			fan->tacho[tacho_num].prsnt = data->reg_prsnt;
>  			fan->tacho[tacho_num++].connected = true;
> +			tacho_avail++;
>  		} else if (strnstr(data->label, "pwm", sizeof(data->label))) {
>  			if (fan->pwm.connected) {
>  				dev_err(fan->dev, "duplicate pwm entry: %s\n",
> @@ -453,6 +481,22 @@ static int mlxreg_fan_config(struct mlxreg_fan *fan,
>  		}
>  	}
>  
> +	if (pdata->capability) {
> +		/* Obtain the number of FAN drawers, supported by system. */
> +		err = regmap_read(fan->regmap, pdata->capability, &regval);
> +		if (err) {
> +			dev_err(fan->dev, "Failed to query capability register 0x%08x\n",
> +				pdata->capability);
> +			return err;
> +		}
> +		regsize = regmap_get_val_bytes(fan->regmap);
> +		drwrs = regval;
> +		for_each_set_bit(bit, &drwrs, 8 * regsize)
> +			drwr_avail++;

Why not just hweight_long() or hweight32() ? And what is the point
of the extra variable ? It is also odd that regval is an int while
regmap_read() takes a pointer to an unsigned int as parameter. So
the returned value is converted to int and then to unsigned long.

Yes, I understand this only takes bits into account which are reported
by regmap_get_val_bytes, but regmap_read already takes that into account
and won't set bits larger than indicated by val_bytes. So all I can see
is a lot of complexity with no gain.

> +		/* Set the number of tachometers per one drawer. */
> +		fan->tachos_per_drwr = tacho_avail / drwr_avail;

What if no bit is set, ie drwr_avail == 0 ?

Also, what guarantees that tachos_per_drwr is not 0 ?

> +	}
> +
>  	/* Init cooling levels per PWM state. */
>  	for (i = 0; i < MLXREG_FAN_SPEED_MIN_LEVEL; i++)
>  		fan->cooling_levels[i] = MLXREG_FAN_SPEED_MIN_LEVEL;
> -- 
> 2.11.0
> 
