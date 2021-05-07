Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8421C433ED
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 May 2021 21:43:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE62560C41
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 May 2021 21:43:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbhEGVoy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 7 May 2021 17:44:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbhEGVox (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 7 May 2021 17:44:53 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94582C061574
        for <linux-hwmon@vger.kernel.org>; Fri,  7 May 2021 14:43:53 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id 65-20020a9d03470000b02902808b4aec6dso9149912otv.6
        for <linux-hwmon@vger.kernel.org>; Fri, 07 May 2021 14:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zUq2Hsr1QCwCNOP3YAW/ijCHT8xuvAtDEa0riKbSYoc=;
        b=DIE+r7dnx+XmVzkC5tkc/nWn12Vm96UiDaO6P+tecHh+V1w0xDHJwxb3730Kr9Fc4z
         gBOzvoNUQAvdqzWQWiNEz/52h265fvORGxN3LJh+bVtC0qRevN73qDBx8DBjM7cxv966
         k3m+VSUn8w1DIurkU1eYf3UZyL7TDm5Pw1vG8QIer9/ld64yQsjuzBisy8gsORloAJIZ
         6qkO89bqrl34llq2E8L9BRkDfqA1TLu0nzJDdjPBjdZ+px4bA39tV0RK0d8p0+HEx+xZ
         D64cS+gGdcf2A3S1aC+mxe1udh6Q9ysehpiBqhKZL+KM2RM7Vs2Qq++RiAZaGaI07mEy
         V6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zUq2Hsr1QCwCNOP3YAW/ijCHT8xuvAtDEa0riKbSYoc=;
        b=Y0yj0MI6UcnlpRMzUnyOOs6InAEjjd1LXoVThv9LpoDIoW361/08OQ95JjKk6D9Il9
         lvRR7jac88UgEeskHLTPiTsVx/2rwflp0Rz8YPD8nbV3lQR9uTKqZ8fAgDhICCJpCl6u
         Y11Uk8hv6qxmehGhfbhrd1V/yPIUE7hL/nhMyLu4dffi7/OxBT/17TeJmvQtrdUFAZ42
         TTAVbkyuUOS4awLCY4wwN6R78pi/P+z1r9OFNyQ9BWJFOcwELhx6NtdUPhxIcwIHRJ4V
         Jh8FNYDc1rcTpIeqPZdEWF+f4sRfR6pw+OgO0saypjdhSK5J035vJk1NgJ4n3EsfeZJn
         mASQ==
X-Gm-Message-State: AOAM533QD0Z6+YeGNS/Yk0QNU5PDb4oWOeG4q2Pgs+FKuzb/3EklTaeL
        VL63646CRWkiupLvnVua14Q=
X-Google-Smtp-Source: ABdhPJzVP/lTrbxgYMqu0Tnd4S4RocIpVyiBgNaS+krmVNfZZkAgfgot7zHkiRTKedBBB3GUwdG6yA==
X-Received: by 2002:a9d:bd1:: with SMTP id 75mr10019440oth.140.1620423833011;
        Fri, 07 May 2021 14:43:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 64sm1305999oob.12.2021.05.07.14.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 May 2021 14:43:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     W_Armin@gmx.de, hdegoede@redhat.com
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com
References: <20210507212404.6781-1-W_Armin@gmx.de>
 <20210507212404.6781-2-W_Armin@gmx.de>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/4] hwmon: (sch56xx) Use devres functions for watchdog
Message-ID: <65ffae02-cef6-c3e8-6302-a0610fc4af53@roeck-us.net>
Date:   Fri, 7 May 2021 14:43:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210507212404.6781-2-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/7/21 2:24 PM, W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> Use devm_kzalloc()/devm_watchdog_register() for
> watchdog registration since it allows us to remove
> the sch56xx_watchdog_data struct from the drivers
> own data structs.
> Remove sch56xx_watchdog_unregister since devres
> takes care of that now.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>   drivers/hwmon/sch5627.c        | 12 +++---------
>   drivers/hwmon/sch5636.c        |  9 ++-------
>   drivers/hwmon/sch56xx-common.c | 13 +++----------
>   3 files changed, 8 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/hwmon/sch5627.c b/drivers/hwmon/sch5627.c
> index 4324a5dbc968..8a71fba33ea0 100644
> --- a/drivers/hwmon/sch5627.c
> +++ b/drivers/hwmon/sch5627.c
> @@ -64,7 +64,6 @@ static const char * const SCH5627_IN_LABELS[SCH5627_NO_IN] = {
> 
>   struct sch5627_data {
>   	unsigned short addr;
> -	struct sch56xx_watchdog_data *watchdog;
>   	u8 control;
>   	u8 temp_max[SCH5627_NO_TEMPS];
>   	u8 temp_crit[SCH5627_NO_TEMPS];
> @@ -359,11 +358,6 @@ static const struct hwmon_chip_info sch5627_chip_info = {
> 
>   static int sch5627_remove(struct platform_device *pdev)
>   {
> -	struct sch5627_data *data = platform_get_drvdata(pdev);
> -
> -	if (data->watchdog)
> -		sch56xx_watchdog_unregister(data->watchdog);
> -
>   	return 0;
>   }

This function is no longer necessary and can be dropped as well.

> 
> @@ -460,9 +454,9 @@ static int sch5627_probe(struct platform_device *pdev)
>   		return PTR_ERR(hwmon_dev);
> 
>   	/* Note failing to register the watchdog is not a fatal error */
> -	data->watchdog = sch56xx_watchdog_register(&pdev->dev, data->addr,
> -			(build_code << 24) | (build_id << 8) | hwmon_rev,
> -			&data->update_lock, 1);
> +	sch56xx_watchdog_register(&pdev->dev, data->addr,
> +				  (build_code << 24) | (build_id << 8) | hwmon_rev,
> +				  &data->update_lock, 1);
> 
>   	return 0;
>   }
> diff --git a/drivers/hwmon/sch5636.c b/drivers/hwmon/sch5636.c
> index 5683a38740f6..a5cd4de36575 100644
> --- a/drivers/hwmon/sch5636.c
> +++ b/drivers/hwmon/sch5636.c
> @@ -54,7 +54,6 @@ static const u16 SCH5636_REG_FAN_VAL[SCH5636_NO_FANS] = {
>   struct sch5636_data {
>   	unsigned short addr;
>   	struct device *hwmon_dev;
> -	struct sch56xx_watchdog_data *watchdog;
> 
>   	struct mutex update_lock;
>   	char valid;			/* !=0 if following fields are valid */
> @@ -372,9 +371,6 @@ static int sch5636_remove(struct platform_device *pdev)
>   	struct sch5636_data *data = platform_get_drvdata(pdev);
>   	int i;
> 
> -	if (data->watchdog)
> -		sch56xx_watchdog_unregister(data->watchdog);
> -
>   	if (data->hwmon_dev)
>   		hwmon_device_unregister(data->hwmon_dev);
> 
> @@ -495,9 +491,8 @@ static int sch5636_probe(struct platform_device *pdev)
>   	}
> 
>   	/* Note failing to register the watchdog is not a fatal error */
> -	data->watchdog = sch56xx_watchdog_register(&pdev->dev, data->addr,
> -					(revision[0] << 8) | revision[1],
> -					&data->update_lock, 0);
> +	sch56xx_watchdog_register(&pdev->dev, data->addr, (revision[0] << 8) | revision[1],
> +				  &data->update_lock, 0);
> 
>   	return 0;
> 
> diff --git a/drivers/hwmon/sch56xx-common.c b/drivers/hwmon/sch56xx-common.c
> index 6c84780e358e..9c884fd0beb2 100644
> --- a/drivers/hwmon/sch56xx-common.c
> +++ b/drivers/hwmon/sch56xx-common.c
> @@ -401,7 +401,7 @@ struct sch56xx_watchdog_data *sch56xx_watchdog_register(struct device *parent,
>   		return NULL;
>   	}
> 
> -	data = kzalloc(sizeof(struct sch56xx_watchdog_data), GFP_KERNEL);
> +	data = devm_kzalloc(parent, sizeof(struct sch56xx_watchdog_data), GFP_KERNEL);
>   	if (!data)
>   		return NULL;
> 
> @@ -438,10 +438,10 @@ struct sch56xx_watchdog_data *sch56xx_watchdog_register(struct device *parent,

Since the return value is no longer used, the function does not need
to return it anymore.

>   	data->watchdog_output_enable = output_enable;
> 
>   	watchdog_set_drvdata(&data->wddev, data);
> -	err = watchdog_register_device(&data->wddev);
> +	err = devm_watchdog_register_device(parent, &data->wddev);
>   	if (err) {
>   		pr_err("Registering watchdog chardev: %d\n", err);
> -		kfree(data);
> +		devm_kfree(parent, data);
>   		return NULL;
>   	}
> 
> @@ -449,13 +449,6 @@ struct sch56xx_watchdog_data *sch56xx_watchdog_register(struct device *parent,
>   }
>   EXPORT_SYMBOL(sch56xx_watchdog_register);
> 
> -void sch56xx_watchdog_unregister(struct sch56xx_watchdog_data *data)
> -{
> -	watchdog_unregister_device(&data->wddev);
> -	kfree(data);
> -}
> -EXPORT_SYMBOL(sch56xx_watchdog_unregister);
> -
>   /*
>    * platform dev find, add and remove functions
>    */
> --
> 2.20.1
> 

