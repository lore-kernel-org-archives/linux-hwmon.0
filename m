Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B596C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 Jan 2022 14:10:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346265AbiAUOKw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 21 Jan 2022 09:10:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344906AbiAUOKv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Jan 2022 09:10:51 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 534ECC061574
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Jan 2022 06:10:51 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id g205so13654539oif.5
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Jan 2022 06:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Pf0SlKkZJAsDVndD1UKjPddKXz6ThlVUWoWM2zlPsEw=;
        b=FqFnPDJP5jyQL8kfe9xFpZDWcRyt8PF3Ktt0xKCTn7ReuO8xK0T/7o9yHeQ04p1gAA
         R1yjJdYq1cisIt9rxxOAFHqD7n9ltA7dtfe4q0wvYutIFHl3KQ6zpioDwW4rjm6GIle7
         h24g5DBXVk4vvetKzGH64teCRgv9V0sJZ9xtIIc8f9VdQ3pQc7KHMsCnEY0eeJqukdNk
         cisioG6R9FsXtyKh7eDDWdyOdVS2olTnLqc7Sx2tVALtzywb58aRuTJikq02dl2XYENQ
         qFGwJNRhHo3kpP9y1CZLmErNXny5TbTHk8cBAYCRSjYdmJE1eCojCiV/PiRXw8Yy2GyU
         +XqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=Pf0SlKkZJAsDVndD1UKjPddKXz6ThlVUWoWM2zlPsEw=;
        b=WdXJ03G1a+icPt61vk4ZGdWX3V0lyIHy/9dy6SaYcWYKYG/syINRlJ5EgbHrcQZMkY
         /yn/8shEC3EVo0Lko/LKgrYbcYl0pHBVW2Wg7aAYCPY+pSFv0l7O1GuVENm96x6VpBQN
         d2eUs4HdcugZakJSkwS4m8s3EcE+dNsMFNOTb+jO92NYM4h36rVXBLIJu08AfONE5sPZ
         cGP1T3YF61mCg8sUdoMQB5kqV2phgNvfnoJv64owHdEJ3D5/O19wW0vtbHaEb2yDibIM
         o0GVRLthyjtYy2rUIw/BbxpUfs0dYHp6WQTPYjkEomw7kmUZWA6dxSzMG/kCX4sWryU9
         6tdg==
X-Gm-Message-State: AOAM531CAmqiqTdEBk5Vv8j6Ou1KwXmdizVXH7Tf1jJ8aQcSF23maXbK
        EjrE5e7eFkho85cpeBSz6HE=
X-Google-Smtp-Source: ABdhPJzn3LJbm+J15RofxhyZMsa524xkR+xWL6iAogk47QRk8dUUtm6N5Hlq6Yk1z19iJVvhI05ZGQ==
X-Received: by 2002:a05:6808:159f:: with SMTP id t31mr691030oiw.60.1642774250717;
        Fri, 21 Jan 2022 06:10:50 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bn14sm1133872oib.8.2022.01.21.06.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 06:10:50 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 21 Jan 2022 06:10:48 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     michaelsh@nvidia.com
Cc:     linux-hwmon@vger.kernel.org, vadimp@nvidia.com
Subject: Re: [PATCH v3 1/3] hwmon: powr1220: Cosmetic changes
Message-ID: <20220121141048.GA308312@roeck-us.net>
References: <20220118075611.10665-1-michaelsh@nvidia.com>
 <20220118075611.10665-2-michaelsh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220118075611.10665-2-michaelsh@nvidia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jan 18, 2022 at 09:56:09AM +0200, michaelsh@nvidia.com wrote:
> From: Michael Shych <michaelsh@nvidia.com>
> 
> Update code alignments.
> 
> Signed-off-by: Michael Shych <michaelsh@nvidia.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/powr1220.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/powr1220.c b/drivers/hwmon/powr1220.c
> index 9e086338dcba..542e4a7b0234 100644
> --- a/drivers/hwmon/powr1220.c
> +++ b/drivers/hwmon/powr1220.c
> @@ -111,7 +111,7 @@ static int powr1220_read_adc(struct device *dev, int ch_num)
>  	mutex_lock(&data->update_lock);
>  
>  	if (time_after(jiffies, data->adc_last_updated[ch_num] + HZ) ||
> -			!data->adc_valid[ch_num]) {
> +	    !data->adc_valid[ch_num]) {
>  		/*
>  		 * figure out if we need to use the attenuator for
>  		 * high inputs or inputs that we don't yet have a measurement
> @@ -119,12 +119,12 @@ static int powr1220_read_adc(struct device *dev, int ch_num)
>  		 * max reading.
>  		 */
>  		if (data->adc_maxes[ch_num] > ADC_MAX_LOW_MEASUREMENT_MV ||
> -				data->adc_maxes[ch_num] == 0)
> +		    data->adc_maxes[ch_num] == 0)
>  			adc_range = 1 << 4;
>  
>  		/* set the attenuator and mux */
>  		result = i2c_smbus_write_byte_data(data->client, ADC_MUX,
> -				adc_range | ch_num);
> +						   adc_range | ch_num);
>  		if (result)
>  			goto exit;
>  
