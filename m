Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 560FEC433EF
	for <linux-hwmon@archiver.kernel.org>; Wed,  1 Jun 2022 20:42:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbiFAUms (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 1 Jun 2022 16:42:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbiFAUml (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 1 Jun 2022 16:42:41 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AA8D1CC5D9
        for <linux-hwmon@vger.kernel.org>; Wed,  1 Jun 2022 13:24:20 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id r65so4085978oia.9
        for <linux-hwmon@vger.kernel.org>; Wed, 01 Jun 2022 13:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=OXfHegdPq5IrLefShGdi2p674HrEShnTmPuWPQzcl5Y=;
        b=edHSjHeHyhiO9GQwFZK8SQypuVsupFRb4IRMv+o/4kZp1secIlurFMESvGKagkWMP3
         tqqXB+KlfixTMw/LYxKSwxEqxB67sxhWsofprFpVDbjRk4uYRnvE8ph1DVffFcRzO8AE
         u0AHvAx+QfzGbnurSn3tqXybPy2bXhDc7OFFtnUNfdcCzFkItx2hRWNtZp9pF/UOnNFD
         7owzCtgzU8ZH0A8vfmjB4kWJ7BRmQwnE/BoQC9KBYH6x6ndpsDqjAwuMZ7hcpLXfBm/c
         eKSpjcwYu5K0UXvHgqGL65LxHktebQFqlrWSjWTuw/JXSNtAuxN9uBM5lYKKWNE8ahar
         4TpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=OXfHegdPq5IrLefShGdi2p674HrEShnTmPuWPQzcl5Y=;
        b=HuD+5c7OnWpAoKAfhj1KzkeGFl3a1O0WVPm3H290FxcBPW/wimc9TkkdP348+q4HiQ
         OAMRqdC1Aer0Tm86GfPsFQBpB21qpe74pD+unS2yZJyQcinqIvZgg+UfUhagYk2mYZum
         s3cagMnneqNUqCR/RM8QLaXLK1qj5ua624xyV3tTTdiBb8uwd+dBwHekLgd6+G2vwJUV
         8ta13DOQp6tpYhVl05OF62RWWqCH3D4LR6+Y8pLc0ELrUneK2pPkOCR60vBxNBBzZl/9
         ZOjAmHZ9tmL9dNbMSg/R/blXtRjARqroh3M5RaOZy7TJ32IlEXT5dmEMR0+kw8Pc3PFD
         d2jA==
X-Gm-Message-State: AOAM532QRWYki2O6FoUineWaJ9svJnY9jlU/PblwjI2ow1fRwjXdk6V0
        EW0hgc3ulrTolnOvpOopN5GvO7WlJ7E=
X-Google-Smtp-Source: ABdhPJzUj+kGbaMEQ30LucRoxrI18SMt9Sp76YWb/CbCFBby/92E93GCOs6u5P6QI9B3LbI5E/HCiQ==
X-Received: by 2002:aca:32d7:0:b0:32b:4437:baf0 with SMTP id y206-20020aca32d7000000b0032b4437baf0mr604564oiy.204.1654110778002;
        Wed, 01 Jun 2022 12:12:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a17-20020a056870469100b000e686d13883sm1030662oap.29.2022.06.01.12.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 12:12:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 1 Jun 2022 12:12:56 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?M=E5rten?= Lindahl <marten.lindahl@axis.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel@axis.com
Subject: Re: [PATCH v1] hwmon: (pmbus/ltc2978) Set voltage resolution
Message-ID: <20220601191256.GA1416021@roeck-us.net>
References: <20220530143446.2649282-1-marten.lindahl@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220530143446.2649282-1-marten.lindahl@axis.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, May 30, 2022 at 04:34:46PM +0200, Mårten Lindahl wrote:
> When checking if a regulator supports a voltage range, the regulator
> needs to have support for listing the range or else -EINVAL will be
> returned.
> 
> This support does not exist for the LTC2977 regulator, so this patch
> adds support for list voltage to the pmbus regulators by adding
> regulator_list_voltage_linear to the pmbus_regulator_ops. It also
> defines the voltage resolution for regulators ltc2972/LTC2974/LTC2975/
> LTC2977/LTC2978/LTC2979/LTC2980/LTM2987 based on that they all have the
> same stepwise 122.07uV resolution.
> 
> Since 122.07uV resolution is very small the resolution is set to a 1mV
> resolution to be easier to handle.
> 
> Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
> ---
>  drivers/hwmon/pmbus/ltc2978.c    | 57 +++++++++++++++++++++++++++++---
>  drivers/hwmon/pmbus/pmbus_core.c |  1 +
>  2 files changed, 54 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
> index 531aa674a928..cfb568c6c155 100644
> --- a/drivers/hwmon/pmbus/ltc2978.c
> +++ b/drivers/hwmon/pmbus/ltc2978.c
> @@ -562,7 +562,37 @@ static const struct i2c_device_id ltc2978_id[] = {
>  MODULE_DEVICE_TABLE(i2c, ltc2978_id);
>  
>  #if IS_ENABLED(CONFIG_SENSORS_LTC2978_REGULATOR)
> +#define LTC2978_ADC_RES 0xFFFF
> +#define LTC2978_N_ADC 122
> +#define LTC2978_MAX_UV (LTC2978_ADC_RES * LTC2978_N_ADC)
> +#define LTC2978_UV_STEP (1000)

#define<space>DEFINE<tab>VALUE, please, and the () around 1000
is unnecessary.

Also, is the range really correct ? The valid / acceptable
voltages are in the range detected in pmbus_regulator_set_voltage(),
based on PMBUS_MFR_VOUT_MIN/PMBUS_VOUT_MARGIN_LOW and
PMBUS_MFR_VOUT_MAX/PMBUS_VOUT_MARGIN_HIGH, and that will likely differ
from the fixed number of voltages provided here.

That makes me wonder if it would make more sense to move this
functionality into the PMBus core code. Any thoughts on that ?

Thanks,
Guenter

> +
> +#define PMBUS_LTC2978_REGULATOR(_name, _id)               \
> +	[_id] = {                                               \
> +		.name = (_name # _id),                                \
> +		.supply_name = "vin",                                 \
> +		.id = (_id),                                          \
> +		.of_match = of_match_ptr(_name # _id),                \
> +		.regulators_node = of_match_ptr("regulators"),        \
> +		.ops = &pmbus_regulator_ops,                          \
> +		.type = REGULATOR_VOLTAGE,                            \
> +		.owner = THIS_MODULE,                                 \
> +		.n_voltages = (LTC2978_MAX_UV / LTC2978_UV_STEP) + 1, \
> +		.uV_step = LTC2978_UV_STEP,                           \
> +	}
> +
>  static const struct regulator_desc ltc2978_reg_desc[] = {
> +	PMBUS_LTC2978_REGULATOR("vout", 0),
> +	PMBUS_LTC2978_REGULATOR("vout", 1),
> +	PMBUS_LTC2978_REGULATOR("vout", 2),
> +	PMBUS_LTC2978_REGULATOR("vout", 3),
> +	PMBUS_LTC2978_REGULATOR("vout", 4),
> +	PMBUS_LTC2978_REGULATOR("vout", 5),
> +	PMBUS_LTC2978_REGULATOR("vout", 6),
> +	PMBUS_LTC2978_REGULATOR("vout", 7),
> +};
> +
> +static const struct regulator_desc ltc2978_reg_desc_default[] = {
>  	PMBUS_REGULATOR("vout", 0),
>  	PMBUS_REGULATOR("vout", 1),
>  	PMBUS_REGULATOR("vout", 2),
> @@ -839,10 +869,29 @@ static int ltc2978_probe(struct i2c_client *client)
>  
>  #if IS_ENABLED(CONFIG_SENSORS_LTC2978_REGULATOR)
>  	info->num_regulators = info->pages;
> -	info->reg_desc = ltc2978_reg_desc;
> -	if (info->num_regulators > ARRAY_SIZE(ltc2978_reg_desc)) {
> -		dev_err(&client->dev, "num_regulators too large!");
> -		info->num_regulators = ARRAY_SIZE(ltc2978_reg_desc);
> +	switch (data->id) {
> +	case ltc2972:
> +	case ltc2974:
> +	case ltc2975:
> +	case ltc2977:
> +	case ltc2978:
> +	case ltc2979:
> +	case ltc2980:
> +	case ltm2987:
> +		info->reg_desc = ltc2978_reg_desc;
> +		if (info->num_regulators > ARRAY_SIZE(ltc2978_reg_desc)) {
> +			dev_err(&client->dev, "num_regulators too large!");

Let's make this a dev_warn(); it does not result in an error abort,
after all.

> +			info->num_regulators = ARRAY_SIZE(ltc2978_reg_desc);
> +		}
> +		break;
> +	default:
> +		info->reg_desc = ltc2978_reg_desc_default;
> +		if (info->num_regulators > ARRAY_SIZE(ltc2978_reg_desc_default)) {
> +			dev_err(&client->dev, "num_regulators too large!");

Same here.

> +			info->num_regulators =
> +			    ARRAY_SIZE(ltc2978_reg_desc_default);
> +		}
> +		break;
>  	}
>  #endif
>  
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index f2cf0439da37..7d642b57c8b2 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -2634,6 +2634,7 @@ const struct regulator_ops pmbus_regulator_ops = {
>  	.get_error_flags = pmbus_regulator_get_error_flags,
>  	.get_voltage = pmbus_regulator_get_voltage,
>  	.set_voltage = pmbus_regulator_set_voltage,
> +	.list_voltage = regulator_list_voltage_linear,
>  };
>  EXPORT_SYMBOL_NS_GPL(pmbus_regulator_ops, PMBUS);
>  
