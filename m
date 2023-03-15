Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A70C3C6FD1D
	for <linux-hwmon@archiver.kernel.org>; Wed, 15 Mar 2023 21:52:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230147AbjCOVwJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 15 Mar 2023 17:52:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230296AbjCOVwH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 15 Mar 2023 17:52:07 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D2925940A
        for <linux-hwmon@vger.kernel.org>; Wed, 15 Mar 2023 14:51:52 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id s7so3522353ilv.12
        for <linux-hwmon@vger.kernel.org>; Wed, 15 Mar 2023 14:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678917112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GjGst9vQZ0GGMnXueC8vLJFfZORugzAs/PbAYufwCKY=;
        b=qGJ58vG0yYlMWtXbsZ0UzqOESK25duXcOCfWrDyBMT77rUcqUh2wkcMgkZSA8vXYo6
         2ukLyyPsmSytZ8gFTNrawbh7YGfAE5bM1Xrk6McGGPdYVHbCx8dJ6Ecw+6vdnyCHBvd6
         dOZMk30tfRA/QHJK/lrbP7tMtF4alSXR0HTNIkjz1N7Fjy49HNP7KawlEb98s2htfz4s
         EZBcXrbToVeee1SjTZreKk7D2OUR4v1HW7jIIToBjKG3yzHoatIP5Zee0LVJlrqy2+fL
         pWNYLIN/gl5BpiYX70KAgi7CY6zTZP0Ex5xt+fRFqTdLADbJuhubJGP2Xj1A0TIjgT1w
         u53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678917112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GjGst9vQZ0GGMnXueC8vLJFfZORugzAs/PbAYufwCKY=;
        b=UrPzcRFuuPwFGBYkNmIJPDuJJ9wrGw4gmdt7aYq/NHxm9M2GBOgMAWbiWep683x7pE
         vw7OguOaW9c9659+m3gce8krw4B2g/J+6reBWqIRpyrDcOtYoNWzy6NQ6guIW6eoX4zI
         iP5vVte3M5IXvzaKa1S44hQjfYuNRcdbIUSrxZDVwfaKkqmDRp99fGO7xPwIPMgRwvm1
         cim9Rv6c2e1ikfXCOS2GWTP+mCtxQ1KC9zqvsrheEl/OyASF9E9zm8j6suhCtJRTw+TX
         4MIvtcKRBlaC/A1cUosYRVn+F3zyQM+r55+pvuGwU8VW4dxxfEQ0BWecahvRTJlkQoDG
         J7Ng==
X-Gm-Message-State: AO0yUKWsvkQq9rK0pWmPv/wdgLewnMWvWG8cqe5SjDN/rBWPsvq6fYu4
        5PveoGu/92NebFd6TYict7M=
X-Google-Smtp-Source: AK7set91QzK+BN8Ldsu7u060zoiXpyPd67wIsdb/WdHf8JcgEdjlVHPAh83uUmRaccxj3Tcn6qi2nA==
X-Received: by 2002:a05:6e02:1a2d:b0:323:70c:ba96 with SMTP id g13-20020a056e021a2d00b00323070cba96mr7329206ile.0.1678917111954;
        Wed, 15 Mar 2023 14:51:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q1-20020a056e02096100b00314201bcbdfsm1940804ilt.3.2023.03.15.14.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 14:51:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 15 Mar 2023 14:51:50 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v1] hwmon (it87): Add scaling macro for recent ADC
 voltages
Message-ID: <ff68e4d9-f32d-455a-b48a-033c3278c74c@roeck-us.net>
References: <20230313115356.334937-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230313115356.334937-1-frank@crawford.emu.id.au>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Mar 13, 2023 at 10:53:56PM +1100, Frank Crawford wrote:
> Generalise scaling to include all recent ADC values and match the labels
> for internal voltage sensors.
> 
> This includes correction of an existing error for voltage scaling for
> chips that have 10.9mV ADCs, where scaling was not performed.
> 

This is again two logical changes in a single patch, one of which is
a bug fix.

Guenter

> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
> ---
>  drivers/hwmon/it87.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index 66f7ceaa7c3f..f774a0732a7c 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -515,6 +515,8 @@ static const struct it87_devices it87_devices[] = {
>  #define has_six_temp(data)	((data)->features & FEAT_SIX_TEMP)
>  #define has_vin3_5v(data)	((data)->features & FEAT_VIN3_5V)
>  #define has_conf_noexit(data)	((data)->features & FEAT_CONF_NOEXIT)
> +#define has_scaling(data)	((data)->features & (FEAT_12MV_ADC | \
> +						     FEAT_10_9MV_ADC))
>  
>  struct it87_sio_data {
>  	int sioaddr;
> @@ -2002,7 +2004,7 @@ static ssize_t show_label(struct device *dev, struct device_attribute *attr,
>  
>  	if (has_vin3_5v(data) && nr == 0)
>  		label = labels[0];
> -	else if (has_12mv_adc(data) || has_10_9mv_adc(data))
> +	else if (has_scaling(data))
>  		label = labels_it8721[nr];
>  	else
>  		label = labels[nr];
> @@ -3134,7 +3136,7 @@ static int it87_probe(struct platform_device *pdev)
>  			 "Detected broken BIOS defaults, disabling PWM interface\n");
>  
>  	/* Starting with IT8721F, we handle scaling of internal voltages */
> -	if (has_12mv_adc(data)) {
> +	if (has_scaling(data)) {
>  		if (sio_data->internal & BIT(0))
>  			data->in_scaled |= BIT(3);	/* in3 is AVCC */
>  		if (sio_data->internal & BIT(1))
