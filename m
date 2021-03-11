Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEFB3C433DB
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Mar 2021 22:16:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A837964F7A
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Mar 2021 22:16:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230300AbhCKWQL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 11 Mar 2021 17:16:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbhCKWP7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 11 Mar 2021 17:15:59 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D595CC061574
        for <linux-hwmon@vger.kernel.org>; Thu, 11 Mar 2021 14:15:58 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id o22so15088660oic.3
        for <linux-hwmon@vger.kernel.org>; Thu, 11 Mar 2021 14:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pneWVGfa73ydBAlUo9blXvy5w+t2EM+EIOD7OojACVk=;
        b=NarMuJM0e5PiWJDu2jjKG3dyS87vy+NpVyvkCLPyvk0ERdYZaBeReUnizhAtwsJIhx
         wgE6P99kLDPOKsYZ0pQWkHht2D+X300XufR+F8ZFZaQ61NNqK0/38cvocldhX5aOcmDM
         P6v4LFkya6fd95IEZTOwatho5mx/2OfIk//GUe2wznUW6Y0LXGegr8gMsTBBMm6FsUw3
         zYdvi2VUPkRfcDkT4Ow/gtP2JyHSlTQ/Um5P10/V7sCCkJKDlMmjZ3V8b6e79TP7ACiR
         wJUYSljbPVvduo/Zl/JZswYcxHj1IecMPz5rDyAFMY3bpzKAGWoSxpZCP2p01hvuw48L
         54NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=pneWVGfa73ydBAlUo9blXvy5w+t2EM+EIOD7OojACVk=;
        b=FS1bRbHlR9+sU8lkseCBvPZrVVq5mNjjC/UldGhkzXsO9qsdnLOu/RdCGwbwmpIs37
         8m460Nevj9cMlTZXycyh7pFko+5u87vljuDiwcvKCzifC+vYL5NN9okl0i7QYG7pUjtN
         0yYCQjdLthuoVUkNNRvFIhG+7KsGg0EP9FdgvCeqJnn4WoL9nTm3LMNdYC6xYfPYP5Og
         OzhIi3d8N0YlgJX/dZE3Wz43RqRxAlGRRncBpSF+7Rb+77nDMAdNlKvJg7g+YXhgADDl
         GtzE2lGSYIz5swfqE1NLRLw5NMv7K1yYpdTCvZ3Te5aTm0+QK7eV7h3kl706RblqyNAX
         BrtQ==
X-Gm-Message-State: AOAM530tslBzZsyG0xFue7UoIIYLSy9Ej11dB6OUpmDcuPMsKJXM8MkU
        SsZwO/4UjVlL3D8mK/lSQ2voXGTX7Xk=
X-Google-Smtp-Source: ABdhPJwKixVd5c3lq5lwIxBxUmxlbv5USpya7WGJiwq8JoyMBMQWilNM5OffnL8ew+k8Fq/D4dBY4w==
X-Received: by 2002:a05:6808:1387:: with SMTP id c7mr7608334oiw.61.1615500958184;
        Thu, 11 Mar 2021 14:15:58 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b133sm834435oia.17.2021.03.11.14.15.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Mar 2021 14:15:57 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 11 Mar 2021 14:15:56 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Paul Menzel <pmenzel@molgen.mpg.de>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Guohan Lu <lguohan@gmail.com>, Boyang Yu <byu@arista.com>
Subject: Re: [PATCH] hwmon: (lm90) Fix false alarm when writing convrate on
 max6658
Message-ID: <20210311221556.GA38026@roeck-us.net>
References: <20210304153832.19275-1-pmenzel@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210304153832.19275-1-pmenzel@molgen.mpg.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Mar 04, 2021 at 04:38:32PM +0100, Paul Menzel wrote:
> From: Boyang Yu <byu@arista.com>
> 
> We found that the max6658 sometimes issues a false alarm when its
> convrate is changed, with the current hwmon driver. This workaround
> will fix it by stopping the conversion before setting the convrate.
> 
> Upstream the patch added added to the SONiC Linux kernel in merge/pull
> request #82 [1][2].
> 
> [1]: https://github.com/Azure/sonic-linux-kernel/pull/82
> [2]: https://github.com/Azure/sonic-linux-kernel/commit/d03f6167f64b2bfa1330ff7b33fe217f68ab7028
> 
> [pmenzel: Forward port patch from 4.19 to 5.12-rc1+]
> Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
> ---
>  drivers/hwmon/lm90.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> index ebbfd5f352c0..0c1a91b715e8 100644
> --- a/drivers/hwmon/lm90.c
> +++ b/drivers/hwmon/lm90.c
> @@ -639,7 +639,11 @@ static int lm90_set_convrate(struct i2c_client *client, struct lm90_data *data,
>  		if (interval >= update_interval * 3 / 4)
>  			break;
>  
> -	err = lm90_write_convrate(data, i);
> +	if (data->kind == max6657)
> +		err = max6657_write_convrate(client, i);

There is no such function in the upstream kernel.
Anyway, this problem has already been already fixed
in the upstream kernel with commit 62456189f3292 ("hwmon:
(lm90) Fix max6658 sporadic wrong temperature reading").

Guenter

> +	else
> +		err = lm90_write_convrate(data, i);
> +
>  	data->update_interval = DIV_ROUND_CLOSEST(update_interval, 64);
>  	return err;
>  }
> @@ -1649,7 +1653,11 @@ static void lm90_restore_conf(void *_data)
>  	struct i2c_client *client = data->client;
>  
>  	/* Restore initial configuration */
> -	lm90_write_convrate(data, data->convrate_orig);
> +	if (data->kind == max6657)
> +		max6657_write_convrate(client, data->convrate_orig);
> +	else
> +		lm90_write_convrate(data, data->convrate_orig);
> +
>  	i2c_smbus_write_byte_data(client, LM90_REG_W_CONFIG1,
>  				  data->config_orig);
>  }
> @@ -1672,7 +1680,8 @@ static int lm90_init_client(struct i2c_client *client, struct lm90_data *data)
>  	data->config_orig = config;
>  	data->config = config;
>  
> -	lm90_set_convrate(client, data, 500); /* 500ms; 2Hz conversion rate */
> +	if (data->kind != max6657)
> +		lm90_set_convrate(client, data, 500); /* 500ms; 2Hz conversion rate */
>  
>  	/* Check Temperature Range Select */
>  	if (data->kind == adt7461 || data->kind == tmp451) {
