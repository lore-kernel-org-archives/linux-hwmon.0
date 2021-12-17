Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E12C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 17 Dec 2021 15:43:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235011AbhLQPnx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 17 Dec 2021 10:43:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231386AbhLQPnx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 17 Dec 2021 10:43:53 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5513C061574;
        Fri, 17 Dec 2021 07:43:52 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id 35-20020a9d08a6000000b00579cd5e605eso3406912otf.0;
        Fri, 17 Dec 2021 07:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4VabQENKhOFEIbveodoolgPjhP7/0T0j8ZEePdOPNY4=;
        b=htucstOdav99ZJkV7JhFJW4fRzhHRDdNMl0Gbx4TneqezxItKI4la5Hh1xKVz/aYEl
         brh7Qg1sfxR40BiypvqAqWX/l+8euG1GnOyBP2ArzWK1kZvITGTdwsL108+hXIGg9NgN
         9PbhBN72g9y39EJeFZ63skMw8fFQSFbwM9SBw0hcxXedzZFRqavhoQlouRcWCpG4kVrf
         W3UOegJR2UKYChvc4iADAXSE4KrJo/HfQqua+TaXWfSSmLKK5HMKHb5MKQ8+BglD4jsh
         niZpjvBvd9Dw3XD3+vDV11X2agnQhzxJVFelWCKhcLZwmffD/cnp0naEPOsGOjNKMEhF
         Kl8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=4VabQENKhOFEIbveodoolgPjhP7/0T0j8ZEePdOPNY4=;
        b=lhzBnm8Is5EcyExlCJl29fgRGtL6CkgC+ZRCO0DkRWaBV/z3aV7FTI3os0VwDqOwkP
         qRJr+gOl7ZYmDUYJ2D5igP6i8tv/WgzlMqHaxDd6IGPKNcbV2Q37kS7+XMyuP44nlbq7
         +IrtutFgf0Oj/9Z1kigBDl1TqxYGxkhN87JKi2RHGFAOE9LJw7KHsN1q79BJSM03jLEc
         qUjKip2pmFAGLDqAy3tNgR/bfpxMC5z6bnivNLzgBjqQZzKbLvcWbhSD2nBphbXxk8+H
         w1sA4KU0r6SiSu2pUr8kEBR0+nmYlwO5+MiSIz3qkDLUnpI53XXc8bWN+101Wr0ZpinD
         sdpQ==
X-Gm-Message-State: AOAM530Pxr+bcq0+3mRFbPUCH5FN8qpjb5EPMzA0PHV9DoNMgaR4Ptrr
        /eucPnCwBPqGDQ5vdMFmCJQ=
X-Google-Smtp-Source: ABdhPJy4sWHN3TxenVyTNGrR6CFOq6nBOjZUz+rT8F//cNBbez+APmSG7snusE68quT4+GhiB1Q0XQ==
X-Received: by 2002:a05:6830:310f:: with SMTP id b15mr2552992ots.31.1639755832323;
        Fri, 17 Dec 2021 07:43:52 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q10sm1708274oiw.17.2021.12.17.07.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 07:43:51 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 17 Dec 2021 07:43:50 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Chris Lesiak <chris.lesiak@licor.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] hwmon: (ntc_thermistor): Add Samsung 1404-001221 NTC
Message-ID: <20211217154350.GA2849960@roeck-us.net>
References: <20211215174241.1496169-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215174241.1496169-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Dec 15, 2021 at 06:42:41PM +0100, Linus Walleij wrote:
> This adds the Samsung 1404-001221 NTC thermistor to the
> NTC thermistor driver. As far as I can tell it is electrically
> compatible with the Murata 47K NTC thermistor.
> 
> This thermistor is mounted in a variety of Samsung products.
> 
> Cc: Peter Rosin <peda@axentia.se>
> Cc: Chris Lesiak <chris.lesiak@licor.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Rob Herring <robh@kernel.org>

Applied.

Thanks,
Guenter

> ---
> The DT binding oneline is included, I see no point in splitting
> that into a separate patch.
> ---
>  Documentation/devicetree/bindings/hwmon/ntc-thermistor.yaml | 1 +
>  drivers/hwmon/ntc_thermistor.c                              | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ntc-thermistor.yaml b/Documentation/devicetree/bindings/hwmon/ntc-thermistor.yaml
> index 9e77cee07dbc..3d3b139a91a2 100644
> --- a/Documentation/devicetree/bindings/hwmon/ntc-thermistor.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/ntc-thermistor.yaml
> @@ -76,6 +76,7 @@ properties:
>        - const: murata,ncp15wl333
>        - const: murata,ncp03wf104
>        - const: murata,ncp15xh103
> +      - const: samsung,1404-001221
>        # Deprecated "ntp," compatible strings
>        - const: ntc,ncp15wb473
>          deprecated: true
> diff --git a/drivers/hwmon/ntc_thermistor.c b/drivers/hwmon/ntc_thermistor.c
> index 00356c28e8c8..414204f5704c 100644
> --- a/drivers/hwmon/ntc_thermistor.c
> +++ b/drivers/hwmon/ntc_thermistor.c
> @@ -45,6 +45,7 @@ enum {
>  	NTC_NCP15XH103,
>  	NTC_NCP18WB473,
>  	NTC_NCP21WB473,
> +	NTC_SSG1404001221,
>  	NTC_LAST,
>  };
>  
> @@ -58,6 +59,7 @@ static const struct platform_device_id ntc_thermistor_id[] = {
>  	[NTC_NCP15XH103]      = { "ncp15xh103",      TYPE_NCPXXXH103 },
>  	[NTC_NCP18WB473]      = { "ncp18wb473",      TYPE_NCPXXWB473 },
>  	[NTC_NCP21WB473]      = { "ncp21wb473",      TYPE_NCPXXWB473 },
> +	[NTC_SSG1404001221]   = { "ssg1404-001221",  TYPE_NCPXXWB473 },
>  	[NTC_LAST]            = { },
>  };
>  
> @@ -671,6 +673,8 @@ static const struct of_device_id ntc_match[] = {
>  		.data = &ntc_thermistor_id[NTC_NCP18WB473] },
>  	{ .compatible = "murata,ncp21wb473",
>  		.data = &ntc_thermistor_id[NTC_NCP21WB473] },
> +	{ .compatible = "samsung,1404-001221",
> +		.data = &ntc_thermistor_id[NTC_SSG1404001221] },
>  
>  	/* Usage of vendor name "ntc" is deprecated */
>  	{ .compatible = "ntc,ncp03wb473",
