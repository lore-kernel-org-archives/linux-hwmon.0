Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E6CCC4338F
	for <linux-hwmon@archiver.kernel.org>; Fri, 30 Jul 2021 17:10:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B03A6024A
	for <linux-hwmon@archiver.kernel.org>; Fri, 30 Jul 2021 17:10:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbhG3RLD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 30 Jul 2021 13:11:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbhG3RLC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 30 Jul 2021 13:11:02 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5401C06175F
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Jul 2021 10:10:56 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id o185so14001103oih.13
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Jul 2021 10:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Htwr0N1TxFj/22xCN8xeoCwYky6JSN3+0oL44RjFRpc=;
        b=nd7aKE876yssFcl3MBrIIpve3Lhv0WIedmGdxHajNAiNAwVOYwkRJKVj8TXKeK23MI
         BIaPHXhZgBGsKjf+3q2kQoN3X3ZWUH6nbKRmXj2sVtTluDQgrlwkTMPetBRuTGIVRsrt
         hrfeARUOtLNM2pkfWU9R9RjDj4i3S76LOhHSco9TRAATnNcPFnsIly9KQvzKmilnHeVS
         5RBQNNhiEZnKmu4/Byv5fYkJ2bf6ikk15kFAhw7pZHVUXEH1XqkZMZYinwr5zQ7/bM0F
         kjcsAcnFcosirlyaLVpWRdvNyPGrlb23C6+nT6/XdnUVQ26APJPmVoEfQArGft+aqFW3
         pz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Htwr0N1TxFj/22xCN8xeoCwYky6JSN3+0oL44RjFRpc=;
        b=Z/LsuAlr9a67TtWOi+8pwuwUXooFiE66PZL9QPOem6T0uhNHo4o8+AFqHC3N7e0nIZ
         RtyMhg7WnRWXXJ+Arl6UIczI6eWnyyV2TipiOwvvDKIu7CzJ86Ha1CmGdqdrQ/C/+2jm
         eKxGzcxHJQQioRUZqNsKqlJgA+0SIuMccA4Dyo8eb5a6M9vYm0aZna/kxzng3f0p3T4o
         glU0SruLgYrm388R6u9pX2+anu4y3jskQK0tG/N1gF1tbkBsth8JNCLD9x+5wnI2twXL
         DlA9tmd4x/N+vK/UHeDUNS4/S6xomGhttCkYgZdDpwHGexx0G2szSKOKgDJxHu9VO9Ti
         vkDg==
X-Gm-Message-State: AOAM533elMpDe5N8f/cl0oNl0ne/G0HduEKE3ldWSCZaH9s8mUu1jOww
        bsot3IWfaFJINfcIwimGqI0883el00E=
X-Google-Smtp-Source: ABdhPJwR0hIUjyrfAQicgNDwN7yE46aOVs2HNjG+5IENRyhvlEPHH2sZqorvCYHLrzWVZcIabfs6Mw==
X-Received: by 2002:a05:6808:288:: with SMTP id z8mr2589170oic.148.1627665055969;
        Fri, 30 Jul 2021 10:10:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z18sm379738oto.71.2021.07.30.10.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jul 2021 10:10:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 2/2] hwmon: (w83781d) Match on device tree compatibles
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org
References: <20210729230543.2853485-1-linus.walleij@linaro.org>
 <20210729230543.2853485-2-linus.walleij@linaro.org>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <f7d474a5-a196-97dc-3043-74465bead290@roeck-us.net>
Date:   Fri, 30 Jul 2021 10:10:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729230543.2853485-2-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/29/21 4:05 PM, Linus Walleij wrote:
> I2C devices should match on the proper compatible string.
> This is already used in one device tree in the kernel (MIPS)
> so let's add the matches.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Waiting for Rob's approval of the devicetree patch.

Thanks,
Guenter

> ---
>   drivers/hwmon/w83781d.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/hwmon/w83781d.c b/drivers/hwmon/w83781d.c
> index e84aa5604e64..ce8e2c10e854 100644
> --- a/drivers/hwmon/w83781d.c
> +++ b/drivers/hwmon/w83781d.c
> @@ -1571,10 +1571,21 @@ static const struct i2c_device_id w83781d_ids[] = {
>   };
>   MODULE_DEVICE_TABLE(i2c, w83781d_ids);
>   
> +static const struct of_device_id w83781d_of_match[] = {
> +	{ .compatible = "winbond,w83781d" },
> +	{ .compatible = "winbond,w83781g" },
> +	{ .compatible = "winbond,w83782d" },
> +	{ .compatible = "winbond,w83783s" },
> +	{ .compatible = "asus,as99127f" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, w83781d_of_match);
> +
>   static struct i2c_driver w83781d_driver = {
>   	.class		= I2C_CLASS_HWMON,
>   	.driver = {
>   		.name = "w83781d",
> +		.of_match_table = w83781d_of_match,
>   	},
>   	.probe_new	= w83781d_probe,
>   	.remove		= w83781d_remove,
> 

