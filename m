Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C6FC433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 17 Dec 2021 15:31:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238586AbhLQPbo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 17 Dec 2021 10:31:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238687AbhLQPbG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 17 Dec 2021 10:31:06 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EC29C061799;
        Fri, 17 Dec 2021 07:30:33 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id 47-20020a9d0332000000b005798ac20d72so3266148otv.9;
        Fri, 17 Dec 2021 07:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=veEbyUB8J9BVVUXT69LpTMAsweV6kAhcPIYEid00ozg=;
        b=d2tYEuBv0id7nH+twjsaZSPc7l4EEQdlXoEXUN20TdssYHytrNpsQ22jQ4SHwkNpfV
         2Z/iIfrGLZ/EB0d6kCCfyIsmA899H5IlPMCgO121lX69Rj9e7kWVK59G58xjgttORTBM
         mdE2DOdebgEpBpmSrNsK1Oiq3BGxYd+MBsu3sz2YK6f5KiwhXWAiMAV27NAGWcO6tU9/
         GGhG4XvNM0LBrN7PZoLWmOtIduHLJ/pPlQIygVwy9wWM6zCAdcVYMuqxzaDQ28c1DnGB
         u7Bhm9woc0DM9yTGMB9oCYbzwMN6N9mJY5JQr0Dk89YhNNE19SHwIiLRrkYccADSrbBt
         +FcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=veEbyUB8J9BVVUXT69LpTMAsweV6kAhcPIYEid00ozg=;
        b=zMS5rKPENOmXbjsLMELvMdNiJnHKgqWWkhgHtCsq7vwX5pCokfAhTa51qeBox3cmz0
         MLLP5DbfUJjuT8gi+cfZRuVgmhFKwsW/ijtn5sr/oL1l1QPIn0MstPWhJ3FVl8NoWJra
         UEA/k95jmpOdXDl4vsn6+DO0/5pPxzDQDTQfS+KdD0o8Q5noCzub0DFIAQjlIOvjf6kk
         g5awalFy4YYjPulNizqcgDo2ZXt5qK4WwkdHPyvhxTM3kMPg3KSh0ejEa1+DQ9lZa66g
         ELEaxBJn4vmiiMTGgj6Bt2LfaCzrvlD3NEBcDpxRegUa0eTmgT+4hkjoEL2sry+WsLnm
         3KGw==
X-Gm-Message-State: AOAM532hpoL9HC8QMN2vdgfwLJaIY54GmoKhHb2q3PAlNtgRLeqA7oIH
        46F7Cr04qmB/B0VdOzMuOC+U3kYIn4U=
X-Google-Smtp-Source: ABdhPJw7+HIa39ja4oZc/HQFfMrZmbGR/TeuwGlhEJrpgzMocJ2V003bX1mzWBKn4vy42aEAfnLDjA==
X-Received: by 2002:a9d:7d04:: with SMTP id v4mr2630336otn.180.1639755032762;
        Fri, 17 Dec 2021 07:30:32 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j10sm1587704ooq.5.2021.12.17.07.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 07:30:32 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 17 Dec 2021 07:30:30 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] hwmon: (nct6775) delete some new lines
Message-ID: <20211217153030.GA2465710@roeck-us.net>
References: <20211215114050.GB14967@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215114050.GB14967@kili>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Dec 15, 2021 at 02:40:50PM +0300, Dan Carpenter wrote:
> This code can fit on one line.  No need to break it up.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/nct6775.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
> index 57ce8633a725..2c5057fa3b71 100644
> --- a/drivers/hwmon/nct6775.c
> +++ b/drivers/hwmon/nct6775.c
> @@ -3154,10 +3154,8 @@ store_speed_tolerance(struct device *dev, struct device_attribute *attr,
>  	if (err < 0)
>  		return err;
>  
> -	high = fan_from_reg16(data->target_speed[nr],
> -			      data->fan_div[nr]) + val;
> -	low = fan_from_reg16(data->target_speed[nr],
> -			     data->fan_div[nr]) - val;
> +	high = fan_from_reg16(data->target_speed[nr], data->fan_div[nr]) + val;
> +	low = fan_from_reg16(data->target_speed[nr], data->fan_div[nr]) - val;
>  	if (low <= 0)
>  		low = 1;
>  	if (high < low)
