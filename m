Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B8F8C3A5A7
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Dec 2022 22:47:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbiLFWrB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 6 Dec 2022 17:47:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbiLFWqh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 6 Dec 2022 17:46:37 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 107B94A07F
        for <linux-hwmon@vger.kernel.org>; Tue,  6 Dec 2022 14:46:22 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id q18-20020a056830441200b006704633f258so3872012otv.0
        for <linux-hwmon@vger.kernel.org>; Tue, 06 Dec 2022 14:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n+hmOP+7htJWAAk5TWvv2AZ42b3pmm8FuF0oJ6QpSpA=;
        b=B4iyH11D1cFzMNNVSnwnMfejAWshWJoePoF27w/xQIuHOvjCMTSOY9t6oOZBC4hsk4
         pFgEvLX/SGkq5wR2iQNs4y+WTYEfdo2RGXun5y8xvWUYejOzB4OHLxi5qcyENyL0jnjz
         L4YHqtZ8vxCPVSxxXZsE2NQRWXVVR8eRN12RuzsHJj3AJ96phqSZA7vvlnBeT5RlpUi4
         xWd+uE4E14LTIRvi4eV9Fm3Wy908W6tLpkFbk4o/FlyLKeb/B3EoAEyRdwwgtlTtmhjO
         isKfrSzR/+Nf4Y2bMT6axNVYu6Btq77orYCip+mvwGa/zdXpoZRL2ks7JDADZV9ycOh8
         /+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n+hmOP+7htJWAAk5TWvv2AZ42b3pmm8FuF0oJ6QpSpA=;
        b=gqijb/9qP6aVIMnEV8OXg6Br4pDXzEvqp7T1Vn2GSeuNAqBtLtGRsVZD46dy0H3R9T
         tYR+BD7tkuEVv/LUchTluz5sxikOffncLyW+SnGqa7Pplx22oETjTLEV20//wxoteGU0
         qfSfT4PedtpX0Buk0PSh8wMLuQYmwh4UWq0ElU+stwxfX6wMUrP92SjpOmZVYS4hgUm3
         +oFy6wMEcEYxVLMPD2g59SEO8B8A81URegv5smcq/nWNOChZJ2WigPZS0mx8Z8rEBMYw
         QpRQWEC3oH5AgU1OTTljy4vaqZj7nC6i0xh4pOFVVvAt0kWpnPgPPkxTo+xB776p+iMJ
         JFSA==
X-Gm-Message-State: ANoB5pmJ2EhZGxTjv8bBCitwtT5P5J88zDBQ7IVczAgcKdPzZQvyWVmi
        mm8UgE4vNxZZ3Ta121aL6Cw=
X-Google-Smtp-Source: AA0mqf7RsmdDCEYI+gXHMlnClTgjY2wGx2BWfOyjOdBASPZFsqbMGu4M5mql4PUBBZRck+Lt49BUpA==
X-Received: by 2002:a05:6830:2b2b:b0:66c:52d6:50c8 with SMTP id l43-20020a0568302b2b00b0066c52d650c8mr45888390otv.200.1670366781002;
        Tue, 06 Dec 2022 14:46:21 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l17-20020a056871069100b0013d6d924995sm11385024oao.19.2022.12.06.14.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 14:46:20 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 6 Dec 2022 14:46:19 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Xingjiang Qiao <nanpuyue@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Michael Shych <michaelsh@nvidia.com>,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: (emc2305) fix pwm never being able to set
 lower
Message-ID: <20221206224619.GA1001408@roeck-us.net>
References: <20221205173611.145571-1-nanpuyue@gmail.com>
 <20221206055331.170459-2-nanpuyue@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221206055331.170459-2-nanpuyue@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Dec 06, 2022 at 01:53:31PM +0800, Xingjiang Qiao wrote:
> There are fields 'last_hwmon_state' and 'last_thermal_state' in the
> structure 'emc2305_cdev_data', which respectively store the cooling state
> set by the 'hwmon' and 'thermal' subsystem, and the driver author hopes
> that if the state set by 'hwmon' is lower than the value set by 'thermal',
> the driver will just save it without actually setting the pwm. Currently,
> the 'last_thermal_state' also be updated by 'hwmon', which will cause the
> cooling state to never be set to a lower value. This patch fixes that.
> 
> Signed-off-by: Xingjiang Qiao <nanpuyue@gmail.com>

Applied, after renaming emc2305_set_cur_state_shim to __emc2305_set_cur_state.

Thanks,
Guenter

> ---
>  drivers/hwmon/emc2305.c | 37 ++++++++++++++++++++++++-------------
>  1 file changed, 24 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
> index 9a78ca22541e..e0f6eb8d72fc 100644
> --- a/drivers/hwmon/emc2305.c
> +++ b/drivers/hwmon/emc2305.c
> @@ -171,22 +171,12 @@ static int emc2305_get_max_state(struct thermal_cooling_device *cdev, unsigned l
>  	return 0;
>  }
>  
> -static int emc2305_set_cur_state(struct thermal_cooling_device *cdev, unsigned long state)
> +static int emc2305_set_cur_state_shim(struct emc2305_data *data, int cdev_idx, unsigned long state)
>  {
> -	int cdev_idx, ret;
> -	struct emc2305_data *data = cdev->devdata;
> +	int ret;
>  	struct i2c_client *client = data->client;
>  	u8 val, i;
>  
> -	if (state > data->max_state)
> -		return -EINVAL;
> -
> -	cdev_idx =  emc2305_get_cdev_idx(cdev);
> -	if (cdev_idx < 0)
> -		return cdev_idx;
> -
> -	/* Save thermal state. */
> -	data->cdev_data[cdev_idx].last_thermal_state = state;
>  	state = max_t(unsigned long, state, data->cdev_data[cdev_idx].last_hwmon_state);
>  
>  	val = EMC2305_PWM_STATE2DUTY(state, data->max_state, EMC2305_FAN_MAX);
> @@ -211,6 +201,27 @@ static int emc2305_set_cur_state(struct thermal_cooling_device *cdev, unsigned l
>  	return 0;
>  }
>  
> +static int emc2305_set_cur_state(struct thermal_cooling_device *cdev, unsigned long state)
> +{
> +	int cdev_idx, ret;
> +	struct emc2305_data *data = cdev->devdata;
> +
> +	if (state > data->max_state)
> +		return -EINVAL;
> +
> +	cdev_idx =  emc2305_get_cdev_idx(cdev);
> +	if (cdev_idx < 0)
> +		return cdev_idx;
> +
> +	/* Save thermal state. */
> +	data->cdev_data[cdev_idx].last_thermal_state = state;
> +	ret = emc2305_set_cur_state_shim(data, cdev_idx, state);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
>  static const struct thermal_cooling_device_ops emc2305_cooling_ops = {
>  	.get_max_state = emc2305_get_max_state,
>  	.get_cur_state = emc2305_get_cur_state,
> @@ -401,7 +412,7 @@ emc2305_write(struct device *dev, enum hwmon_sensor_types type, u32 attr, int ch
>  				 */
>  				if (data->cdev_data[cdev_idx].last_hwmon_state >=
>  				    data->cdev_data[cdev_idx].last_thermal_state)
> -					return emc2305_set_cur_state(data->cdev_data[cdev_idx].cdev,
> +					return emc2305_set_cur_state_shim(data, cdev_idx,
>  							data->cdev_data[cdev_idx].last_hwmon_state);
>  				return 0;
>  			}
