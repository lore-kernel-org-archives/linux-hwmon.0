Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E45C433F5
	for <linux-hwmon@archiver.kernel.org>; Mon, 31 Jan 2022 22:25:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232766AbiAaWZQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 31 Jan 2022 17:25:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230517AbiAaWZQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 31 Jan 2022 17:25:16 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 060E5C061714
        for <linux-hwmon@vger.kernel.org>; Mon, 31 Jan 2022 14:25:16 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id b17-20020a9d4791000000b005a17fc2dfc1so14482598otf.1
        for <linux-hwmon@vger.kernel.org>; Mon, 31 Jan 2022 14:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=hUepN8A7h5Sd2JznDiUD44kDpMzhu/+qs7qnfpfdC84=;
        b=Wi/NHbb7crp5r2+KpWEfSvGZ8Js4+1f9bzUUlo0xwWTzE7qbcdCXsn4RSB44xnbdr5
         l7pIWnt1GUDDjBV9jMiCRy3OpvEQZ4xRQGOdt53mu8QIfawBXVsVpxL1y0xi1mtYYzKu
         jlS/jeDnRWP8sD76JM/+ylsDw1/VXbsmwSDyvzPgZfnUp07eaf1p3OGIHKGvIqrgaj4E
         ETMgomkw/RG8Sm01vq4qUwOYIXZ6cpCIvPMK8MyDoaRMBC/dimfkVonh6NhV44KO5TQ9
         kXWcKXOje1HUqWX9ZqdTIWgBC3MG4xpoLXhetLo18FlsRdzT/oP2GsrHV3S8zX6tLOan
         LDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition;
        bh=hUepN8A7h5Sd2JznDiUD44kDpMzhu/+qs7qnfpfdC84=;
        b=t5RST45eOiADs9XEX8mLo7ZH5Ual8RA/QmOTZklGmMtymwE0LN7Nxbw0h79JBP+U3q
         FZ21k5wa0+U26oaikNwwDzMjIkAw14UM/3ZIKDwmlODlvlILwxUb5QwpI9h1nk+Oyovt
         p1Vv8yb7Ov9uscmO7vPCkhvorflIfiFadv1MjOtNRQyg76lAqCIaVPAvahoAHqrK8enZ
         lL0CVRBLXKn9Msn95B5j28wVwIYCRxh/I0xQTZTEdT+gPIefniPeyYcjkdl6IiuAKORF
         V07/QnLQtXvQS88tNVuzk+fdbgAGcy0hX3EBi3Fpb7zYmKQs1NHE6gPyhlG1eh8JKC3S
         mUkw==
X-Gm-Message-State: AOAM532O2iz0RfrgrG+7vVR1470D6NO4Gk6a3mBPjneJfiVOKYk7nhvJ
        bhEuvlFi5lXJjcBbG7vRX7EAcx/LN1scDg==
X-Google-Smtp-Source: ABdhPJyYzneh5KVxWYEqvCxS8RVa9Wz+iL1d+Xo4rxryR1smZxCQuro84vEkYZBCKKjGXbroq+vhrA==
X-Received: by 2002:a9d:12e7:: with SMTP id g94mr1228240otg.236.1643667915390;
        Mon, 31 Jan 2022 14:25:15 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v4sm11541314oou.1.2022.01.31.14.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 14:25:14 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 31 Jan 2022 14:25:12 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-hwmon <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH] hwmon: Fix possible NULL pointer
Message-ID: <20220131222512.GA3374780@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jan 31, 2022 at 04:27:40PM +0000, Paul Cercueil wrote:
> The recent addition of the label attribute added some code that read the
> "label" device property, without checking first that "dev" was non-NULL.
> 
> Fix this issue by first checking that "dev" is non-NULL.
> 
> Fixes: ccd98cba6a18 ("hwmon: Add "label" attribute")
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/hwmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
> index e36ea82da147..5915fedee69b 100644
> --- a/drivers/hwmon/hwmon.c
> +++ b/drivers/hwmon/hwmon.c
> @@ -807,7 +807,7 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
>  		hdev->groups = groups;
>  	}
>  
> -	if (device_property_present(dev, "label")) {
> +	if (dev && device_property_present(dev, "label")) {
>  		err = device_property_read_string(dev, "label", &label);
>  		if (err < 0)
>  			goto free_hwmon;
> -- 
> 2.34.1
> 
