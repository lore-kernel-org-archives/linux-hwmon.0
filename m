Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB98C433FE
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Dec 2020 23:47:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06116238EE
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Dec 2020 23:47:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730421AbgLHXr1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 8 Dec 2020 18:47:27 -0500
Received: from gproxy7-pub.mail.unifiedlayer.com ([70.40.196.235]:35762 "EHLO
        gproxy7-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725906AbgLHXr1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 8 Dec 2020 18:47:27 -0500
Received: from CMGW (unknown [10.9.0.13])
        by gproxy7.mail.unifiedlayer.com (Postfix) with ESMTP id CEAA2215C93
        for <linux-hwmon@vger.kernel.org>; Tue,  8 Dec 2020 16:46:45 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id mmgvk1k5ni1lMmmgvkyjLg; Tue, 08 Dec 2020 16:46:45 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.2 cv=Mu4i0ySe c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10 a=zTNgK-yGK50A:10
 a=evQFzbml-YQA:10 a=Ikd4Dj_1AAAA:8 a=ZJtX8EOkh62-9hCohm0A:9
 a=VeJy5fTaEDXsqvGU:21 a=1rzXoHST8PCbeXl3:21 a=CjuIK1q_8ugA:10
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=CTGHwxx2HlSK9h13X8r72pvHIZgGdUgP3nIQB+LPTCs=; b=xmbuQMp1vbUR5f5/xXI1zbpPXv
        s9eAvqHoCGDgCR4n/Y9JRcN2pbUE+RcdyXRcX1hJ3mQaN5bCeCKdEGOSf+55i2chpYlGeh+4e9moi
        wp9Rf2VNF7xD8ZERjoi7HqGIhuZoycgon0MjGCuzyUvTQlPuWabI/hgUcx36yxYyd0P2KytDVXrfm
        6DSejjUXbmjj4SJlwQB+MhHIL+DVf81bDaRzvA/59uy6FUTseox3YLiwrt4lrSnC4q6NAaq4G8pLf
        liQIfcwWHuQ2b/h4zz3XNARH4P1gV0rFI00L/IaEOa71Z24PshUtRq9QX2x4gG4J3Mr8Fk99SSn5Q
        yylpiedA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:42048 helo=localhost)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1kmmgu-003XSd-S6; Tue, 08 Dec 2020 23:46:45 +0000
Date:   Tue, 8 Dec 2020 15:46:44 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH hwmon-next v2 1/1] hwmon: (mlxreg-fan) Add support for
 fan drawers capability and present registers
Message-ID: <20201208234644.GA79190@roeck-us.net>
References: <20201208231259.47955-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208231259.47955-1-vadimp@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1kmmgu-003XSd-S6
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:42048
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 1
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Dec 09, 2020 at 01:12:59AM +0200, Vadim Pasternak wrote:
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
> v1->v2:
>  Comments pointed out by Guenter:
>  - Simplify drawers number calculation in mlxreg_fan_config().
>  - Validate that the number of drawers and tachometers, supported on
>    system, both are not zero. Otherwise return error.
>  Added by Vadim:
>  - Change comment in mlxreg_fan_read() regarding FAN presence - use
>    "FAN is inserted" instead of "FAN is physically connected", t
>    clarify that "FAN presence" can be changed dynamically.
> ---
>  drivers/hwmon/mlxreg-fan.c | 48 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 47 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
> index ed8d59d4eecb..8a69044140a6 100644
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
> +					/* FAN is not connected - return zero for FAN speed. */
> +					*val = 0;
> +					return 0;
> +				}
> +			}
> +
>  			err = regmap_read(fan->regmap, tacho->reg, &regval);
>  			if (err)
>  				return err;
> @@ -388,9 +412,9 @@ static int mlxreg_fan_speed_divider_get(struct mlxreg_fan *fan,
>  static int mlxreg_fan_config(struct mlxreg_fan *fan,
>  			     struct mlxreg_core_platform_data *pdata)
>  {
> +	int tacho_num = 0, regval, drwr_avail = 0, tacho_avail = 0, i;

Why is regval int instead of unsigned int ?

Initialization of drwr_avail seems unnecessary.

>  	struct mlxreg_core_data *data = pdata->data;
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
> @@ -453,6 +479,26 @@ static int mlxreg_fan_config(struct mlxreg_fan *fan,
>  		}
>  	}
>  
> +	if (pdata->capability) {

The check here is different than the check used in mlxreg_fan_read().
If tacho->prsnt is set but pdata->capability is not, tachos_per_drwr will
be 0, and we'll get a nice divide by 0 error when trying to read the fan
speed.

Nit: regval and drwr_avail are only used here and might thus be declared
here.

> +		/* Obtain the number of FAN drawers, supported by system. */
> +		err = regmap_read(fan->regmap, pdata->capability, &regval);
> +		if (err) {
> +			dev_err(fan->dev, "Failed to query capability register 0x%08x\n",
> +				pdata->capability);
> +			return err;
> +		}
> +
> +		drwr_avail = hweight32(regval);
> +		if (!tacho_avail || !drwr_avail) {
> +			dev_err(fan->dev, "Configuration is invalid: drawers num %d tachos num %d\n",
> +				drwr_avail, tacho_avail);
> +			return -EINVAL;
> +		}
> +
> +		/* Set the number of tachometers per one drawer. */
> +		fan->tachos_per_drwr = tacho_avail / drwr_avail;

tachos_per_drwr will still be 0 if tacho_avail < drwr_avail.

> +	}
> +
>  	/* Init cooling levels per PWM state. */
>  	for (i = 0; i < MLXREG_FAN_SPEED_MIN_LEVEL; i++)
>  		fan->cooling_levels[i] = MLXREG_FAN_SPEED_MIN_LEVEL;
> -- 
> 2.11.0
> 
