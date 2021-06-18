Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 816A0C48BE8
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jun 2021 19:47:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 589B761279
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jun 2021 19:47:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbhFRTtR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jun 2021 15:49:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbhFRTtR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jun 2021 15:49:17 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D43BC061574;
        Fri, 18 Jun 2021 12:47:06 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id d19so11738057oic.7;
        Fri, 18 Jun 2021 12:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=J2h/rtErddJtuwrYdyLo1SQwC1ntbYiJsiSR6HTN2Og=;
        b=NQCE/gZocnMZcvq8elnPGBJBPteCqw+j5NMJkwvZGaywf4fnqM+DHpRyWBhw3fxOdk
         kUf5eDB4fnwnQTiCKKL3P0Fka2T9gjFLLnd23ThJ27tpsc4mkCx8at/XyAaEv964FljA
         /Kjs5Ad/9R/JtS0Oj7nYJ9DIlrBIzScOetvP17xegQjejFZP6099nGoNqAw+EHHhBvVw
         IkKC0EAzamiMDT+KSJkp/+WZplr2VWguLiOl27rFY9Sou2efBGfUNZJaCL9COicI0rAn
         HSw3+f5GtdVRTs3j8iz5b9MqBauMCMJJII5IHz2Jlwrw84zSVxBF+ohqoC5ynX5z8ZNM
         53qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=J2h/rtErddJtuwrYdyLo1SQwC1ntbYiJsiSR6HTN2Og=;
        b=TCEAULAoqRRiihQyndxThvyohmeUKCV2NMIjohWGujL3qzIZDibTUZOWqnlgna9Jg9
         qUfA1ueJtrPOC5/fblsxUUBlm8FwSXczl3s4zRYpxq8oMVMNTd5N1DUd5V56T2W2bKqD
         pqDamwqXdr23j9yXrv3A5gJldt/2+brNcMemJYRbY2oFveMUrOisvfcRqwRkLJmdGALe
         B7Rzy4SzD5MfrzkTm4nVGWzmhlx49QLtm+9sie3YT00ueTn0sZ2QBFvSkVQNtUIs5gcG
         x/i+ULnFFGYCXgFc66FAXNiVYxlf9ebO5NN9H2UGheFaiJPpvNK5xDglIpFyZzRRWNf/
         /rbg==
X-Gm-Message-State: AOAM5325jsrZMazvJBpuVk6sS6dfESRlY+nq3ugufIDyZ/rKM5Vy0/7B
        f+derCneEkEy22IqQ18Au4M=
X-Google-Smtp-Source: ABdhPJy/xWdCw8eQDigk1I4QrsBJKp+amnflfMZHsUPuGB3phbXrPgbaYhdb56ZOGvgL+x5oUB/SXA==
X-Received: by 2002:aca:acd3:: with SMTP id v202mr15889329oie.176.1624045625885;
        Fri, 18 Jun 2021 12:47:05 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s187sm2012770oig.6.2021.06.18.12.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 12:47:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 18 Jun 2021 12:47:04 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/dps920ab) Delete some dead code
Message-ID: <20210618194704.GC1664689@roeck-us.net>
References: <YMyjmR54ErLtc1sH@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMyjmR54ErLtc1sH@mwanda>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Jun 18, 2021 at 04:46:01PM +0300, Dan Carpenter wrote:
> The debugfs_create_dir() function returns error pointers, it doesn't
> return NULL.  But debugfs functions don't need to be checked in normal
> situations and we can just delete this code.
> 
> Fixes: 1f442e213ce5 ("hwmon: (pmbus) Add driver for Delta DPS-920AB PSU")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/dps920ab.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/dps920ab.c b/drivers/hwmon/pmbus/dps920ab.c
> index bd2df2a3c8e3..d3941f6eb29a 100644
> --- a/drivers/hwmon/pmbus/dps920ab.c
> +++ b/drivers/hwmon/pmbus/dps920ab.c
> @@ -119,8 +119,6 @@ static void dps920ab_init_debugfs(struct dps920ab_data *data, struct i2c_client
>  		return;
>  
>  	debugfs_dir = debugfs_create_dir(client->name, root);
> -	if (!debugfs_dir)
> -		return;
>  
>  	debugfs_create_file("mfr_id",
>  			    0400,
> -- 
> 2.30.2
> 
