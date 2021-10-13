Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E21EC433F5
	for <linux-hwmon@archiver.kernel.org>; Wed, 13 Oct 2021 18:51:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6FC1661139
	for <linux-hwmon@archiver.kernel.org>; Wed, 13 Oct 2021 18:51:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230415AbhJMSxU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 13 Oct 2021 14:53:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbhJMSxT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 13 Oct 2021 14:53:19 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 271AAC061570
        for <linux-hwmon@vger.kernel.org>; Wed, 13 Oct 2021 11:51:16 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id o204so5055551oih.13
        for <linux-hwmon@vger.kernel.org>; Wed, 13 Oct 2021 11:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=yXrg3+A6lEtTpa644d3Tw6Ij2wxMErKcrnK5dFU9crQ=;
        b=Sk5FwLnh2qmnVhOCRdQsB76tpgQS4svx3Ga2nLdWTst4nm0w+1E6wvMxLT874ImDrR
         d5k8qSer0pGcRDP3826FWF3jZoX/o6tNHGG064gEWqrKVDF1MjB9ppQ0nBpTbbyYdkQC
         bJhfUija+iln3fomPPyQTDOzJ05oYrW2NzUyAx2vHeDfrLrhqbjHzM7zHCVaxZH956sV
         J12iBHFNQLssFU4vO4Gsnp+10YAQfSKl3k+L8M1lhhzbK/ZLb8wUXRDko+ClrVSEpULZ
         3pmQkVahlDIUWOpefIr4v7eWBvQGhkaf8V7GNrmXf/WSqM1+MoD0l2jZpK251SviVSfO
         ZK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=yXrg3+A6lEtTpa644d3Tw6Ij2wxMErKcrnK5dFU9crQ=;
        b=RlcGWrBeShcdOkTM1cDejEloJNoX8G8cxUax2O/xwE3lHj/QJhzQdPMH8TnAXhGNME
         6vEn9DPvyerGnXEEpGZPDoFaLn0Aohigj9D2luWSCAzTZuN0LiE4XRN6oLumFCxgUiJ9
         m8UxyUFVb20vXoIypicemJ2MoNr139w56Oeu0/t4tyllrseOmkGU9s9UcTJPwV9h3hd+
         f+zp9jqsLjgu6uTdpaoEwoCsGhifqu/lRQX1Uja2BMtZqlM4SNVcRoy1CW2AumzOMgUu
         jm9JLYfReSDNEtord+SZON7SYcjMQ9aiLpU9fclIJkWpw/J4on9ksMUSCF6/lln+UVhz
         CA1A==
X-Gm-Message-State: AOAM531OoiWiKMGve7+wO6PgjEL9KynZQCVRJ9mVUo2JhdaawWy3cEv3
        qBIAVfeCfGaIJmXsF2jxk/k=
X-Google-Smtp-Source: ABdhPJwNDEYjbh2dd21ti+timno+1LMojx98mAZ7SCfHaq1CI0GsPPXB7PURS1ot+WOdOohiReQfUQ==
X-Received: by 2002:aca:f302:: with SMTP id r2mr586827oih.90.1634151075585;
        Wed, 13 Oct 2021 11:51:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l45sm87562ooi.30.2021.10.13.11.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 11:51:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 13 Oct 2021 11:51:13 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     W_Armin@gmx.de
Cc:     pali@kernel.org, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 1/2] hwmon: (dell-smm) Add support for fanX_min,
 fanX_max and fanX_target
Message-ID: <20211013185113.GA3336263@roeck-us.net>
References: <20210926221044.14327-1-W_Armin@gmx.de>
 <20210926221044.14327-2-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210926221044.14327-2-W_Armin@gmx.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Sep 27, 2021 at 12:10:43AM +0200, W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> The nominal speed of each fan can be obtained with
> i8k_get_fan_nominal_speed(), however the result is not available
> from userspace.
> Change that by adding fanX_min, fanX_max and fanX_target attributes.
> All are RO since fan control happens over pwm.
> 
> Tested on a Dell Inspiron 3505 and a Dell Latitude C600.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> Reviewed-by: Pali Rohár <pali@kernel.org>

Applied.

Thanks,
Guenter

> ---
>  Documentation/hwmon/dell-smm-hwmon.rst |  3 ++
>  drivers/hwmon/dell-smm-hwmon.c         | 61 +++++++++++++++++++++++---
>  2 files changed, 58 insertions(+), 6 deletions(-)
> 
> --
> 2.20.1
> 
> diff --git a/Documentation/hwmon/dell-smm-hwmon.rst b/Documentation/hwmon/dell-smm-hwmon.rst
> index 3bf77a5df995..beec88491171 100644
> --- a/Documentation/hwmon/dell-smm-hwmon.rst
> +++ b/Documentation/hwmon/dell-smm-hwmon.rst
> @@ -34,6 +34,9 @@ Name				Perm	Description
>  =============================== ======= =======================================
>  fan[1-3]_input                  RO      Fan speed in RPM.
>  fan[1-3]_label                  RO      Fan label.
> +fan[1-3]_min                    RO      Minimal Fan speed in RPM
> +fan[1-3]_max                    RO      Maximal Fan speed in RPM
> +fan[1-3]_target                 RO      Expected Fan speed in RPM
>  pwm[1-3]                        RW      Control the fan PWM duty-cycle.
>  pwm1_enable                     WO      Enable or disable automatic BIOS fan
>                                          control (not supported on all laptops,
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 774c1b0715d9..476f2a74bd8c 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -76,6 +76,7 @@ struct dell_smm_data {
>  	int temp_type[DELL_SMM_NO_TEMP];
>  	bool fan[DELL_SMM_NO_FANS];
>  	int fan_type[DELL_SMM_NO_FANS];
> +	int *fan_nominal_speed[DELL_SMM_NO_FANS];
>  };
> 
>  MODULE_AUTHOR("Massimo Dal Zotto (dz@debian.org)");
> @@ -673,6 +674,13 @@ static umode_t dell_smm_is_visible(const void *drvdata, enum hwmon_sensor_types
>  			if (data->fan[channel] && !data->disallow_fan_type_call)
>  				return 0444;
> 
> +			break;
> +		case hwmon_fan_min:
> +		case hwmon_fan_max:
> +		case hwmon_fan_target:
> +			if (data->fan_nominal_speed[channel])
> +				return 0444;
> +
>  			break;
>  		default:
>  			break;
> @@ -740,6 +748,25 @@ static int dell_smm_read(struct device *dev, enum hwmon_sensor_types type, u32 a
> 
>  			*val = ret;
> 
> +			return 0;
> +		case hwmon_fan_min:
> +			*val = data->fan_nominal_speed[channel][0];
> +
> +			return 0;
> +		case hwmon_fan_max:
> +			*val = data->fan_nominal_speed[channel][data->i8k_fan_max];
> +
> +			return 0;
> +		case hwmon_fan_target:
> +			ret = i8k_get_fan_status(data, channel);
> +			if (ret < 0)
> +				return ret;
> +
> +			if (ret > data->i8k_fan_max)
> +				ret = data->i8k_fan_max;
> +
> +			*val = data->fan_nominal_speed[channel][ret];
> +
>  			return 0;
>  		default:
>  			break;
> @@ -889,9 +916,12 @@ static const struct hwmon_channel_info *dell_smm_info[] = {
>  			   HWMON_T_INPUT | HWMON_T_LABEL
>  			   ),
>  	HWMON_CHANNEL_INFO(fan,
> -			   HWMON_F_INPUT | HWMON_F_LABEL,
> -			   HWMON_F_INPUT | HWMON_F_LABEL,
> -			   HWMON_F_INPUT | HWMON_F_LABEL
> +			   HWMON_F_INPUT | HWMON_F_LABEL | HWMON_F_MIN | HWMON_F_MAX |
> +			   HWMON_F_TARGET,
> +			   HWMON_F_INPUT | HWMON_F_LABEL | HWMON_F_MIN | HWMON_F_MAX |
> +			   HWMON_F_TARGET,
> +			   HWMON_F_INPUT | HWMON_F_LABEL | HWMON_F_MIN | HWMON_F_MAX |
> +			   HWMON_F_TARGET
>  			   ),
>  	HWMON_CHANNEL_INFO(pwm,
>  			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
> @@ -910,7 +940,7 @@ static int __init dell_smm_init_hwmon(struct device *dev)
>  {
>  	struct dell_smm_data *data = dev_get_drvdata(dev);
>  	struct device *dell_smm_hwmon_dev;
> -	int i, err;
> +	int i, state, err;
> 
>  	for (i = 0; i < DELL_SMM_NO_TEMP; i++) {
>  		data->temp_type[i] = i8k_get_temp_type(i);
> @@ -926,8 +956,27 @@ static int __init dell_smm_init_hwmon(struct device *dev)
>  		err = i8k_get_fan_status(data, i);
>  		if (err < 0)
>  			err = i8k_get_fan_type(data, i);
> -		if (err >= 0)
> -			data->fan[i] = true;
> +
> +		if (err < 0)
> +			continue;
> +
> +		data->fan[i] = true;
> +		data->fan_nominal_speed[i] = devm_kmalloc_array(dev, data->i8k_fan_max + 1,
> +								sizeof(*data->fan_nominal_speed[i]),
> +								GFP_KERNEL);
> +		if (!data->fan_nominal_speed[i])
> +			continue;
> +
> +		for (state = 0; state <= data->i8k_fan_max; state++) {
> +			err = i8k_get_fan_nominal_speed(data, i, state);
> +			if (err < 0) {
> +				/* Mark nominal speed table as invalid in case of error */
> +				devm_kfree(dev, data->fan_nominal_speed[i]);
> +				data->fan_nominal_speed[i] = NULL;
> +				break;
> +			}
> +			data->fan_nominal_speed[i][state] = err;
> +		}
>  	}
> 
>  	dell_smm_hwmon_dev = devm_hwmon_device_register_with_info(dev, "dell_smm", data,
