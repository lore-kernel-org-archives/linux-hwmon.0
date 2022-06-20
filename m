Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E19BCCA479
	for <linux-hwmon@archiver.kernel.org>; Mon, 20 Jun 2022 15:22:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244283AbiFTPWo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 20 Jun 2022 11:22:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244265AbiFTPW3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 20 Jun 2022 11:22:29 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67AE5B1E
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Jun 2022 08:16:39 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id p3-20020a17090a428300b001ec865eb4a2so5960147pjg.3
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Jun 2022 08:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=/CdmIvPEV+9cQtU27I8h0pFbWSCmhydDPoXr+i9yvfw=;
        b=JfHaoIM01GhTiFXFVsxK49dVSSMZBtOZ5KJd//ih/90BXZURPsu73VabpOKek9kVnC
         u5d3rjrH/k7pzjxqMzl3OHdPj/uPbMPo2OKx+RszMG8kI6norUbp1yJ9bS+UFCIugNtw
         OXmP7ism872GkT2y1oXyShiv8+QqoLYU/yL/12rCvreL75Ux+xV9rJ4vQCy12foU2eYB
         dyR4+5/5swL0hQJae1c4c7Fd85gXwkttZJnNLh8KnWO2cvtFNZTPKWrYw6sz87I8cKqW
         MWj8o4Shcyk+v/8Yq9BVpOme6su6mV6u7LyCtQozIx2MTcUqcUHph3TUFWdFW5cc1fhP
         g3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=/CdmIvPEV+9cQtU27I8h0pFbWSCmhydDPoXr+i9yvfw=;
        b=j9r4LP+M3Bc4Z7h8Qb3iGSycuN1fTMsb8RFKJHNgEheaz5Ob6h9FnX2Up1mRDi8+U4
         OX5BZBNnG1dN78texQRMvv2oDC+omDpZZRXU2s5JjXuBevVpmSdOfRPZogQYeW7+A8Og
         +FCbaF6+ZyAqWCCNEpLhEkc0eIOAcX+jn8gY/1Hzcff5tFHxo8c++JK3ZHqGCMswIwIq
         GvYeAH/8hx6v1N6yg5zA7T0ce3TcRbbcl/5F8s56vz/C27IDKPQq/rmR33bqF+2Gs3vy
         j5HDsV44PSMRc/mpu5JnfO6p3F5fBtefCijjhoXvWu+ddfWo7h/H8HUGLJS8PN49YoVg
         e7Zw==
X-Gm-Message-State: AJIora/lRG1/fCATeOF1cbBOChF/Rnus2xoTBqaavycNdyGsfOvIpLYp
        PtMygnkjO3NK90smhSFdjteYMn0d5VA=
X-Google-Smtp-Source: AGRyM1sqg7XlPRAqt401hK9Gw5Dep89mKWfft/oHeoAoLCli1LltLGBHiAEhlRPTI2Oo18R688EsdA==
X-Received: by 2002:a17:902:b217:b0:169:67b:146 with SMTP id t23-20020a170902b21700b00169067b0146mr22204830plr.33.1655738198641;
        Mon, 20 Jun 2022 08:16:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z9-20020a1709027e8900b0015e8d4eb209sm8914412pla.83.2022.06.20.08.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 08:16:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 20 Jun 2022 08:16:36 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?M=E5rten?= Lindahl <marten.lindahl@axis.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel@axis.com
Subject: Re: [PATCH v3 3/3] hwmon: (pmbus/ltc2978) Set voltage resolution
Message-ID: <20220620151636.GA2691257@roeck-us.net>
References: <20220614095144.3472305-1-marten.lindahl@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220614095144.3472305-1-marten.lindahl@axis.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jun 14, 2022 at 11:51:44AM +0200, Mårten Lindahl wrote:
> The LTC2977 regulator does not set the regulator_desc .n_voltages value
> which is needed in order to let the regulator core list the regulator
> voltage range.
> 
> This patch defines a regulator_desc with a voltage range, and uses it
> for defining voltage resolution for regulators LTC2972/LTC2974/LTC2975/
> LTC2977/LTC2978/LTC2979/LTC2980/LTM2987 based on that they all have a 16
> bit ADC with the same stepwise 122.07uV resolution. It also scales the
> resolution to a 1mV resolution which is easier to handle.
> 
> Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/ltc2978.c | 44 +++++++++++++++++++++++++++++++----
>  drivers/hwmon/pmbus/pmbus.h   |  8 +++++--
>  2 files changed, 46 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
> index 531aa674a928..6d2592731ba3 100644
> --- a/drivers/hwmon/pmbus/ltc2978.c
> +++ b/drivers/hwmon/pmbus/ltc2978.c
> @@ -562,7 +562,24 @@ static const struct i2c_device_id ltc2978_id[] = {
>  MODULE_DEVICE_TABLE(i2c, ltc2978_id);
>  
>  #if IS_ENABLED(CONFIG_SENSORS_LTC2978_REGULATOR)
> +#define LTC2978_ADC_RES	0xFFFF
> +#define LTC2978_N_ADC	122
> +#define LTC2978_MAX_UV	(LTC2978_ADC_RES * LTC2978_N_ADC)
> +#define LTC2978_UV_STEP	1000
> +#define LTC2978_N_VOLTAGES	((LTC2978_MAX_UV / LTC2978_UV_STEP) + 1)
> +
>  static const struct regulator_desc ltc2978_reg_desc[] = {
> +	PMBUS_REGULATOR_STEP("vout", 0, LTC2978_N_VOLTAGES, LTC2978_UV_STEP),
> +	PMBUS_REGULATOR_STEP("vout", 1, LTC2978_N_VOLTAGES, LTC2978_UV_STEP),
> +	PMBUS_REGULATOR_STEP("vout", 2, LTC2978_N_VOLTAGES, LTC2978_UV_STEP),
> +	PMBUS_REGULATOR_STEP("vout", 3, LTC2978_N_VOLTAGES, LTC2978_UV_STEP),
> +	PMBUS_REGULATOR_STEP("vout", 4, LTC2978_N_VOLTAGES, LTC2978_UV_STEP),
> +	PMBUS_REGULATOR_STEP("vout", 5, LTC2978_N_VOLTAGES, LTC2978_UV_STEP),
> +	PMBUS_REGULATOR_STEP("vout", 6, LTC2978_N_VOLTAGES, LTC2978_UV_STEP),
> +	PMBUS_REGULATOR_STEP("vout", 7, LTC2978_N_VOLTAGES, LTC2978_UV_STEP),
> +};
> +
> +static const struct regulator_desc ltc2978_reg_desc_default[] = {
>  	PMBUS_REGULATOR("vout", 0),
>  	PMBUS_REGULATOR("vout", 1),
>  	PMBUS_REGULATOR("vout", 2),
> @@ -839,10 +856,29 @@ static int ltc2978_probe(struct i2c_client *client)
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
> +			dev_warn(&client->dev, "num_regulators too large!");
> +			info->num_regulators = ARRAY_SIZE(ltc2978_reg_desc);
> +		}
> +		break;
> +	default:
> +		info->reg_desc = ltc2978_reg_desc_default;
> +		if (info->num_regulators > ARRAY_SIZE(ltc2978_reg_desc_default)) {
> +			dev_warn(&client->dev, "num_regulators too large!");
> +			info->num_regulators =
> +			    ARRAY_SIZE(ltc2978_reg_desc_default);
> +		}
> +		break;
>  	}
>  #endif
>  
> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> index c031a9700ace..4a4689c4ab7f 100644
> --- a/drivers/hwmon/pmbus/pmbus.h
> +++ b/drivers/hwmon/pmbus/pmbus.h
> @@ -463,8 +463,8 @@ struct pmbus_driver_info {
>  
>  extern const struct regulator_ops pmbus_regulator_ops;
>  
> -/* Macro for filling in array of struct regulator_desc */
> -#define PMBUS_REGULATOR(_name, _id)				\
> +/* Macros for filling in array of struct regulator_desc */
> +#define PMBUS_REGULATOR_STEP(_name, _id, _voltages, _step)  \
>  	[_id] = {						\
>  		.name = (_name # _id),				\
>  		.supply_name = "vin",				\
> @@ -474,8 +474,12 @@ extern const struct regulator_ops pmbus_regulator_ops;
>  		.ops = &pmbus_regulator_ops,			\
>  		.type = REGULATOR_VOLTAGE,			\
>  		.owner = THIS_MODULE,				\
> +		.n_voltages = _voltages,			\
> +		.uV_step = _step,				\
>  	}
>  
> +#define PMBUS_REGULATOR(_name, _id)	PMBUS_REGULATOR_STEP(_name, _id, 0, 0)
> +
>  /* Function declarations */
>  
>  void pmbus_clear_cache(struct i2c_client *client);
