Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61214C6FD1D
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Mar 2023 02:14:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbjCPCOp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 15 Mar 2023 22:14:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbjCPCOo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 15 Mar 2023 22:14:44 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F071324CAD
        for <linux-hwmon@vger.kernel.org>; Wed, 15 Mar 2023 19:14:39 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id w4so263792ilv.0
        for <linux-hwmon@vger.kernel.org>; Wed, 15 Mar 2023 19:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678932879;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n/jbcn4eB0kYDuEpK1FR3/23TwkeXJn/LiAxdrdCatk=;
        b=lRs0uYWlpBWYF2VzL1Th7sMWRaTD7z4dQeNV3ed1se7jELeILNKhK/YTEP3uXzPTvY
         xWFlHo0yUZuCkinPNFhxQj9y2zlixleflnzFBRR7CPuZ+nM5etSRONGlaLy182EZCFdP
         fcBCqpInGn6/g58ua3MvekMkmJ+++m8N4b83dMCosXlI7FKAFVC0zG2j97ahNz02P3Nd
         UUAr9YiXxptaq3xrVZL7tGIn5QMU83cYHoppKXyYZK/RvBQgjQ4HDaEHVL1GSXh6x8yM
         R7dJENgRJZ+CLWEOLB2gSd4LUnCJI5cKxJaO3rwKImwE/Wz7wusOGOvq2aKOPIiDGdH6
         sHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678932879;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n/jbcn4eB0kYDuEpK1FR3/23TwkeXJn/LiAxdrdCatk=;
        b=0Ralg4VOsvtXNF6M4WYKhMn0ChW/BMakJ9Dmr7S/5nUiIkMaeVMvGkqg+kuFQH9gy/
         +sXVvpKmZTTTmj4BTAWqfb/4R3MWZBS06RAh50uuoVhjgCFcdMSfkd8mq4z7b0GInW2H
         2oLJCafQ1JE2N112WbY76G8MMe2oJ5vIU9TK+CUoyAZGcoBW0NnteiFUiMRgrn0tehCJ
         o/fesBGvwoZw2QlviuaQ3+cncBYuYarzLRGSCANzDd2D8hpEBM67bI82c/9yiK85A2Ly
         6zzyYd9XTdx0pl+pN6SckuUolHpz8WuhFlliVcel+j+jL+vAx5xZ9UpuTlsCgKwjoIBK
         1NPg==
X-Gm-Message-State: AO0yUKXCPHxHRKluDOMCOcg1jpoYK5JHG/i4cd1tLM42VLzKPm73Feb+
        7SUUJn0dpIeCLk146T4NmhU=
X-Google-Smtp-Source: AK7set8qqyJUPWd+h3bTFR8G3ugGDP39dbAWzWeHm4rld/f73wiVsMjPON5zbkni2p3SVCfiJGWrnA==
X-Received: by 2002:a92:da8e:0:b0:315:53b6:d293 with SMTP id u14-20020a92da8e000000b0031553b6d293mr6299982iln.21.1678932879381;
        Wed, 15 Mar 2023 19:14:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y17-20020a02a391000000b00374bf3b62a0sm2090854jak.99.2023.03.15.19.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 19:14:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 15 Mar 2023 19:14:37 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Lars-Peter Clausen <lars@metafoo.de>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        Alexandru Tachici <alexandru.tachici@analog.com>,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: (adm1266) Set `can_sleep` flag for GPIO chip
Message-ID: <26e558fe-6bef-4777-85de-0c5746bf86ba@roeck-us.net>
References: <20230314093146.2443845-1-lars@metafoo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230314093146.2443845-1-lars@metafoo.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Mar 14, 2023 at 02:31:45AM -0700, Lars-Peter Clausen wrote:
> The adm1266 driver uses I2C bus access in its GPIO chip `set` and `get`
> implementation. This means these functions can sleep and the GPIO chip
> should set the `can_sleep` property to true.
> 
> This will ensure that a warning is printed when trying to set or get the
> GPIO value from a context that potentially can't sleep.
> 
> Fixes: d98dfad35c38 ("hwmon: (pmbus/adm1266) Add support for GPIOs")
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/adm1266.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index ec5f932fc6f0..1ac2b2f4c570 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c
> @@ -301,6 +301,7 @@ static int adm1266_config_gpio(struct adm1266_data *data)
>  	data->gc.label = name;
>  	data->gc.parent = &data->client->dev;
>  	data->gc.owner = THIS_MODULE;
> +	data->gc.can_sleep = true;
>  	data->gc.base = -1;
>  	data->gc.names = data->gpio_names;
>  	data->gc.ngpio = ARRAY_SIZE(data->gpio_names);
