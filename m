Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB16C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 29 Apr 2022 16:22:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379029AbiD2QZv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 29 Apr 2022 12:25:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379024AbiD2QZs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 29 Apr 2022 12:25:48 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC6C7D115C;
        Fri, 29 Apr 2022 09:22:28 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id e4so9034130oif.2;
        Fri, 29 Apr 2022 09:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bhF0TwLUxRzgpZ+1ye50Ao6wae6x1YI9aJWCwBh1vdU=;
        b=plGh1IyQpHIilkTQlbw5uOFnv6BVy/O/wFMNj8m6514djtV5wcUIYEO1mwHn5jIfl9
         Ufm9G+wNJhYmo/CcR6Ybwd7Y7g/O5doIrFrmyn6E8GZlaMHtGKIYQhW0g9joYJMkKxqN
         ofPIzNCo77oO/rg69slx8esuEa4URz18OPLeISQTZLl7o8xtSK5DPgz9g6nZHMwS1Gz9
         CYOmg9KES5NfTLUz0HvRsLUTn/TnRDW6s8juOpMb1O47JCAGR0vyKy1L0RhQDvwM5FGo
         2QHCWcthyqtSLOrBuwgX0qNHvTCO8/t4XLTTTB6/UvHJH/7o+okIE7j/CXKyJ7ohsKLJ
         yoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bhF0TwLUxRzgpZ+1ye50Ao6wae6x1YI9aJWCwBh1vdU=;
        b=l2ld6X64zKQ91GVsATIYuFsKmSKIKPbKqQHxWld6xdsesemCEJKvv70/6DvehqPZgF
         R2gEa2VukzOegOAKnjt6iWSpFj8iIVnbY7dJfGxbz+/Vaprs8M6QUkb1P0ubOIi+lGVJ
         TgzxaCu9ls/WI23SKJTOsxUh4BGRy/wMbyTMMUi5pHbVgo5vnGC+xbY29qfq4DQZY6WT
         rD0W+cGdfxHosEpx/+I/rF3VrVgRct+SPHE8WXpsRPhdH8CxOrmSfvetPy4ZCIOGfl8H
         HZvKX3dpfvIwdRqcGQ0zwAfoCMX/2fIOVk0bNajVGC7wOHj16dHEMinGwqavusrpypyw
         y/5A==
X-Gm-Message-State: AOAM532Bsic3Fukb87cfjDbCs3+GntlpBxTJrVwqXFPmXqyJeDK3ZvJH
        8XLQQr/CPzCoP39+fyxqG+anV0+/ELo=
X-Google-Smtp-Source: ABdhPJyyFE+FYXJ1mu8EKyPHqPwrIY5FZrJ7Xhi0XTUedzNN5e5/pTZaileU4EaOAseF2Xegon8YOA==
X-Received: by 2002:a05:6808:308a:b0:323:e5:57ac with SMTP id bl10-20020a056808308a00b0032300e557acmr79189oib.110.1651249348307;
        Fri, 29 Apr 2022 09:22:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q4-20020a056870028400b000e5aa7f2cadsm3139075oaf.3.2022.04.29.09.22.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Apr 2022 09:22:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <737ea26d-2e25-b39b-af9b-190958008f8d@roeck-us.net>
Date:   Fri, 29 Apr 2022 09:22:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] hwmon: (tmp401) Add of_match_table
Content-Language: en-US
To:     Camel Guo <camel.guo@axis.com>, Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com
References: <20220429095201.2932180-1-camel.guo@axis.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220429095201.2932180-1-camel.guo@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/29/22 02:52, Camel Guo wrote:
> Add the missing of_match_table to allow device tree probing
> 

I2C devices probe based on the I2C device table even on devicetree systems,
so this isn't a correct statement. Please provide evidence and explain
in detail the circumstances where this does not work.

Guenter

> Signed-off-by: Camel Guo <camel.guo@axis.com>
> ---
>   drivers/hwmon/tmp401.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/hwmon/tmp401.c b/drivers/hwmon/tmp401.c
> index a58a2f31a07e..cc0a1c219b1f 100644
> --- a/drivers/hwmon/tmp401.c
> +++ b/drivers/hwmon/tmp401.c
> @@ -750,10 +750,21 @@ static int tmp401_probe(struct i2c_client *client)
>   	return 0;
>   }
>   
> +static const struct of_device_id __maybe_unused tmp4xx_of_match[] = {
> +	{ .compatible = "ti,tmp401", },
> +	{ .compatible = "ti,tmp411", },
> +	{ .compatible = "ti,tmp431", },
> +	{ .compatible = "ti,tmp432", },
> +	{ .compatible = "ti,tmp435", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, tmp4xx_of_match);
> +
>   static struct i2c_driver tmp401_driver = {
>   	.class		= I2C_CLASS_HWMON,
>   	.driver = {
>   		.name	= "tmp401",
> +		.of_match_table = of_match_ptr(tmp4xx_of_match),
>   	},
>   	.probe_new	= tmp401_probe,
>   	.id_table	= tmp401_id,

