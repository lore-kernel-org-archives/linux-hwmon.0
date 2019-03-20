Return-Path: <SRS0=9YG5=RX=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54484C43381
	for <linux-hwmon@archiver.kernel.org>; Wed, 20 Mar 2019 13:27:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 14DFF213F2
	for <linux-hwmon@archiver.kernel.org>; Wed, 20 Mar 2019 13:27:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RaeK5epj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727622AbfCTN1i (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 20 Mar 2019 09:27:38 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39898 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725905AbfCTN1h (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 20 Mar 2019 09:27:37 -0400
Received: by mail-pf1-f193.google.com with SMTP id i17so1940842pfo.6
        for <linux-hwmon@vger.kernel.org>; Wed, 20 Mar 2019 06:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4PJ67OEkfSsYsnD03b0d5IXzDVznlZwJ7rzU/rNUj/o=;
        b=RaeK5epjLIlazNmEOQA3RIg2Gx3Jiziq3cpnYiQnPewiNVzeUBBaTlkrSV3cX0O9TE
         nJ+IwAEolhNfBwi1x/i5pWwcS63CHWf6uVIRZJpVwayTny+YffCQBe2NPxVf4484Oo6i
         SkR9cdssALgzINKM6MGHu3enjJx3uZn9c+hK3LiXOFJ8ghc/BUV5kawpKw0N9fsoL1ux
         5YF4UYn982xGla7QzsfndAGc/24FMlVbIJnYFbyZmSiG4PEQw2YuBEvkTdzlzS+KWKhj
         PotdlGde1gxBb4PGqFyNNlRlMSTUKPilnOEUU3yA+ElXLZi24p2XAon3WrB/KSod1qGn
         ZUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=4PJ67OEkfSsYsnD03b0d5IXzDVznlZwJ7rzU/rNUj/o=;
        b=Z5wa5INlI+v4+iqpHDG1NIBlxWhEWu4fQT6oufgfSkNRudn7I78SV7MD84Rit2yJaz
         /It8KjxHU9utqoCOO3DlSAWRtOqZtlkQttL/e9+oluK7rafIJFpCdXGox/WCaq33yiz1
         HFkuJlKF96+stbg8usWyNpHzzzDnlITLJpEl/2B4XxqDo1osxtBJmFW3HbhUvXjU60a+
         cnTZrybiJ2bAH0qyEJ344r8im+TElwJgVldammFtgy9c7KbVfC14GN05XpUxd3eHioZh
         NNVIjNBJDQ56i5cCbxOcfts+Uf77VwzYN5Qtwif2phztjGewCCuDtJFdjIlc9ilRDMko
         QLKg==
X-Gm-Message-State: APjAAAWOdhKFkQ6/no8HsgBs2YY+V8wp3cL7JlC/EiUpu2cx3rX5f9HH
        d/QmKeNUqG2KOqRY8RNGMTE=
X-Google-Smtp-Source: APXvYqx2Qv6upiTao8n9mATGGh4bwulg4MaqffQ9LZZn4Mk8BH82+xIfeV7lffU7+vBtI3hgr2Gexg==
X-Received: by 2002:a17:902:8d97:: with SMTP id v23mr8256894plo.274.1553088455999;
        Wed, 20 Mar 2019 06:27:35 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u11sm2606695pfh.23.2019.03.20.06.27.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Mar 2019 06:27:34 -0700 (PDT)
Date:   Wed, 20 Mar 2019 06:27:33 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 hwmon-next] hwmon: (mlxreg-fan) Add support for fan
 capability registers
Message-ID: <20190320132733.GA6565@roeck-us.net>
References: <20190318161028.29868-1-vadimp@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190318161028.29868-1-vadimp@mellanox.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Mar 18, 2019 at 04:10:28PM +0000, Vadim Pasternak wrote:
> Add support for fan capability registers in order to distinct between
> the systems which have minor fan configuration differences. This
> reduces the amount of code used to describe such systems.
> The capability registers provides system specific information about the
> number of physically connected tachometers and system specific fan
> speed scale parameter.
> For example one system can be equipped with twelve fan tachometers,
> while the other with for example, eight or six. Or one system should
> use default fan speed divider value, while the other has a scale
> parameter defined in hardware, which should be used for divider
> setting.
> Reading this information from the capability registers allows to use the
> same fan structure for the systems with the such differences.
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
> v1->v2:
>  Comments pointed out by Guenter:
>  - Make the defines names shorter to fit into 80 symbols.
>  - Simplify mlxreg_fan_connect_verify().
>  - Make more clear comment in mlxreg_fan_speed_divider_get().
> ---
>  drivers/hwmon/mlxreg-fan.c | 73 ++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 68 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
> index db8c6de0b6a0..44d4b1af1550 100644
> --- a/drivers/hwmon/mlxreg-fan.c
> +++ b/drivers/hwmon/mlxreg-fan.c
> @@ -27,7 +27,9 @@
>  #define MLXREG_FAN_SPEED_MAX			(MLXREG_FAN_MAX_STATE * 2)
>  #define MLXREG_FAN_SPEED_MIN_LEVEL		2	/* 20 percent */
>  #define MLXREG_FAN_TACHO_SAMPLES_PER_PULSE_DEF	44
> -#define MLXREG_FAN_TACHO_DIVIDER_DEF		1132
> +#define MLXREG_FAN_TACHO_DIV_MIN		283
> +#define MLXREG_FAN_TACHO_DIV_DEF		(MLXREG_FAN_TACHO_DIV_MIN * 4)
> +#define MLXREG_FAN_TACHO_DIV_SCALE_MAX	64
>  /*
>   * FAN datasheet defines the formula for RPM calculations as RPM = 15/t-high.
>   * The logic in a programmable device measures the time t-high by sampling the
> @@ -360,15 +362,57 @@ static const struct thermal_cooling_device_ops mlxreg_fan_cooling_ops = {
>  	.set_cur_state	= mlxreg_fan_set_cur_state,
>  };
>  
> +static int mlxreg_fan_connect_verify(struct mlxreg_fan *fan,
> +				     struct mlxreg_core_data *data)
> +{
> +	u32 regval;
> +	int err;
> +
> +	err = regmap_read(fan->regmap, data->capability, &regval);
> +	if (err) {
> +		dev_err(fan->dev, "Failed to query capability register 0x%08x\n",
> +			data->capability);
> +		return err;
> +	}
> +
> +	return !!(regval & data->bit);
> +}
> +
> +static int mlxreg_fan_speed_divider_get(struct mlxreg_fan *fan,
> +					struct mlxreg_core_data *data)
> +{
> +	u32 regval;
> +	int err;
> +
> +	err = regmap_read(fan->regmap, data->capability, &regval);
> +	if (err) {
> +		dev_err(fan->dev, "Failed to query capability register 0x%08x\n",
> +			data->capability);
> +		return err;
> +	}
> +
> +	/*
> +	 * Set divider value according to the capability register, in case it
> +	 * contains valid value. Otherwise use default value. The purpose of
> +	 * this validation is to protect against the old hardware, in which
> +	 * this register can return zero.
> +	 */
> +	if (regval > 0 && regval <= MLXREG_FAN_TACHO_DIV_SCALE_MAX)
> +		fan->divider = regval * MLXREG_FAN_TACHO_DIV_MIN;
> +
> +	return 0;
> +}
> +
>  static int mlxreg_fan_config(struct mlxreg_fan *fan,
>  			     struct mlxreg_core_platform_data *pdata)
>  {
>  	struct mlxreg_core_data *data = pdata->data;
>  	bool configured = false;
>  	int tacho_num = 0, i;
> +	int err;
>  
>  	fan->samples = MLXREG_FAN_TACHO_SAMPLES_PER_PULSE_DEF;
> -	fan->divider = MLXREG_FAN_TACHO_DIVIDER_DEF;
> +	fan->divider = MLXREG_FAN_TACHO_DIV_DEF;
>  	for (i = 0; i < pdata->counter; i++, data++) {
>  		if (strnstr(data->label, "tacho", sizeof(data->label))) {
>  			if (tacho_num == MLXREG_FAN_MAX_TACHO) {
> @@ -376,6 +420,17 @@ static int mlxreg_fan_config(struct mlxreg_fan *fan,
>  					data->label);
>  				return -EINVAL;
>  			}
> +
> +			if (data->capability) {
> +				err = mlxreg_fan_connect_verify(fan, data);
> +				if (err < 0)
> +					return err;
> +				else if (!err) {
> +					tacho_num++;
> +					continue;
> +				}
> +			}
> +
>  			fan->tacho[tacho_num].reg = data->reg;
>  			fan->tacho[tacho_num].mask = data->mask;
>  			fan->tacho[tacho_num++].connected = true;
> @@ -394,13 +449,21 @@ static int mlxreg_fan_config(struct mlxreg_fan *fan,
>  				return -EINVAL;
>  			}
>  			/* Validate that conf parameters are not zeros. */
> -			if (!data->mask || !data->bit) {
> +			if (!data->mask && !data->bit && !data->capability) {
>  				dev_err(fan->dev, "invalid conf entry params: %s\n",
>  					data->label);
>  				return -EINVAL;
>  			}
> -			fan->samples = data->mask;
> -			fan->divider = data->bit;
> +			if (data->capability) {
> +				err = mlxreg_fan_speed_divider_get(fan, data);
> +				if (err)
> +					return err;
> +			} else {
> +				if (data->mask)
> +					fan->samples = data->mask;
> +				if (data->bit)
> +					fan->divider = data->bit;
> +			}
>  			configured = true;
>  		} else {
>  			dev_err(fan->dev, "invalid label: %s\n", data->label);
