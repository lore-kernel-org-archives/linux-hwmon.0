Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F24C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 02:03:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8932C60F6D
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 02:03:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243833AbhIXCFX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 23 Sep 2021 22:05:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243798AbhIXCFW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Sep 2021 22:05:22 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B685C061574
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Sep 2021 19:03:50 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id l16-20020a9d6a90000000b0053b71f7dc83so11169221otq.7
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Sep 2021 19:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=yUbngRqXqPfOEoab/qFoEfa/uuiDZuOa3g9N7yNAICk=;
        b=W5dhkWfg+GFkoMeCr/pmDaF3tB6ihoa5KtPVVQK0bMLDfCPx5EgknHSCXCyo7Ta0et
         6an9HKx4juIp1YOhINTgkeC9sB8/iPa8my/ff6CkYEySBlHuIgVdaAwFTZ9sAI8miIJV
         5SD3BKdEtyID8NrlsX+oYAM+AARfS5pq9blIr50xLxuhvUcSiapfB0+Wlgw4RQync5BH
         mPJf9gHhwSQ6wAYuthBz17kIJc64aN2hGXUmfd5j+lprSPo5Cp9hZwKzNapXClmMebIT
         c9/Jl4Xf4DVrFDmEyOc0c3hbZdX0Pk0eQACiNrv1fsal1E5KJmFEEO8qQJm36YTbQa0e
         OVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=yUbngRqXqPfOEoab/qFoEfa/uuiDZuOa3g9N7yNAICk=;
        b=oo8Id1yKlEg+dzF3QtO0b9ij1J78RqmV71pW94RmBEdbpTGskZqCgNxl91yJ9DuuHe
         ze7oS19GaatimAkXyUZe9+ZoPMYpx5NZS+C1amX5WuXJ3XDtolnXRLTm1u7wIAFPDhxU
         fd3RYFEIAjLIejzMtyGsA/yctjIBiANdXrZnrlIPguUEdSti33Ik4jFPg1/k8IclszpB
         t0woiwWktmmoB64gQHuXBphhojyPGg0+5KycRCqbq+0HKAiv+/QhUXo2mPUWzkeYRmOB
         vOzYDE3xDLX/5t+7QnTldry3DijAgaXFPB7OrAT2TIZjyn9kJMTo+/I8St0kvJRJXaSH
         N+HA==
X-Gm-Message-State: AOAM5310AmlzXIVWdKTA0fWiPF4ANXdTXs6hXMwZsIVzFRSkkdDgmAUB
        KYTn6B0Df++9GaM2kn+j0K8=
X-Google-Smtp-Source: ABdhPJxzz1y3B+tI0vvPrY/VLty3nLTdZXy9d1iw3lLTTxpvqSDoU9uE+lcoytxVSD0FllJV28S7qw==
X-Received: by 2002:a9d:6944:: with SMTP id p4mr1754352oto.262.1632449029665;
        Thu, 23 Sep 2021 19:03:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k6sm1680603otf.80.2021.09.23.19.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 19:03:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 23 Sep 2021 19:03:48 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] hwmon: ltc2947: Properly handle errors when looking for
 the external clock
Message-ID: <20210924020348.GA3031696@roeck-us.net>
References: <20210923201113.398932-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210923201113.398932-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 23, 2021 at 10:11:13PM +0200, Uwe Kleine-König wrote:
> The return value of devm_clk_get should in general be propagated to
> upper layer. In this case the clk is optional, use the appropriate
> wrapper instead of interpreting all errors as "The optional clk is not
> available".
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/ltc2947-core.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> 
> base-commit: 7d2a07b769330c34b4deabeed939325c77a7ec2f
> 
> diff --git a/drivers/hwmon/ltc2947-core.c b/drivers/hwmon/ltc2947-core.c
> index bb3f7749a0b0..5423466de697 100644
> --- a/drivers/hwmon/ltc2947-core.c
> +++ b/drivers/hwmon/ltc2947-core.c
> @@ -989,8 +989,12 @@ static int ltc2947_setup(struct ltc2947_data *st)
>  		return ret;
>  
>  	/* check external clock presence */
> -	extclk = devm_clk_get(st->dev, NULL);
> -	if (!IS_ERR(extclk)) {
> +	extclk = devm_clk_get_optional(st->dev, NULL);
> +	if (IS_ERR(extclk))
> +		return dev_err_probe(st->dev, PTR_ERR(extclk),
> +				     "Failed to get external clock\n");
> +
> +	if (extclk) {
>  		unsigned long rate_hz;
>  		u8 pre = 0, div, tbctl;
>  		u64 aux;
