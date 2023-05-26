Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF2C7C77B7A
	for <linux-hwmon@archiver.kernel.org>; Fri, 26 May 2023 21:07:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244009AbjEZVHn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 26 May 2023 17:07:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237887AbjEZVHm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 26 May 2023 17:07:42 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2879C18D
        for <linux-hwmon@vger.kernel.org>; Fri, 26 May 2023 14:07:41 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2564b0921f1so14256a91.3
        for <linux-hwmon@vger.kernel.org>; Fri, 26 May 2023 14:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685135260; x=1687727260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ne0yELtV2QExS3Xji+nzfMBu1HvSnw5v3FXjRlzj9Dc=;
        b=rlFPyz+BVsyFg3Sb+3EUfANuFDvku95CmnS/Pk+dsi62XzLgqQriDLPY8QVTPdsyYZ
         H5xKvsor0pG08j+Hefkxwp621Qd2XmFHhvP1vI9BJM4jdDO/IOpjwPbzDDzMM2a2IHS0
         jzes84tthQ1jMAL61Y8Cbopoe2VpUljTvQqsosfiSyFkiiyukW8JUmkYVLM/khlJUgP6
         G9fryXjWeLun1LS50zQQ0nuTAgPvC3qmqtdDAqbjKlMN/59tpkf/0gvFKHsQ2gD1KUn0
         hT/H7MIUEmXbyh45Ma/wuKGiQPq15W34q0aWy1i9OpktHdT3ByqloM4llYxK41GIOZxw
         RAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685135260; x=1687727260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ne0yELtV2QExS3Xji+nzfMBu1HvSnw5v3FXjRlzj9Dc=;
        b=c1g+0iV7YweoVQ/PcSnhSoonUrUXGLwkGKw6UIRKaGKHI8D9Gza9U5RtgXTHG8cCiF
         vmZvoAAZsBKYJ93eahk1vJmMrBrugG3kj6nsbkeW+CKJX7TVce1/KAqrISES93+E3T2M
         mshjw2YgdmJVlzWLKwlAveE9Wdx0FIg0bDGLNwbX88JQYZiWPkWEHQIKxuvC/4fvGzSQ
         I2mnArHXpauoeHNJ1Z3P5O7rvR7ByQTGgVm3MhDyQJnCFrpHntgBaG6/FKMSdVPnS+SO
         89S21ZuUo8Nt6bYY5p7+Bci9DnYEAyCmo39C0MrTz5piuBTmme4if05AoFTsi72qSx0H
         AcZw==
X-Gm-Message-State: AC+VfDy1r7jhojPmam4gOiSaf5DaIC4oZYuU54XvhDAQfKsKhqHnrtq0
        OAIHJKqUOE1ya/abeAYCGEwRw7WJLvg=
X-Google-Smtp-Source: ACHHUZ71CptY5xdK7LoHlszttu5QJFNjme4jKykf8l2S/D3cbVzPvQPi7h/UGza41tHf7kBuO4T49g==
X-Received: by 2002:a17:90a:9403:b0:252:8f70:c807 with SMTP id r3-20020a17090a940300b002528f70c807mr3745576pjo.12.1685135260530;
        Fri, 26 May 2023 14:07:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v4-20020a17090a458400b00246f9725ffcsm3147636pjg.33.2023.05.26.14.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 14:07:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 26 May 2023 14:07:38 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Osama Muhammad <osmtendev@gmail.com>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2] hwmon:(pmbus/ucd9000): Drop unnecessary error check
 for debugfs_create_dir
Message-ID: <9e9f9b29-f1e5-48aa-93e1-a9f7a664f355@roeck-us.net>
References: <20230526154906.6370-1-osmtendev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230526154906.6370-1-osmtendev@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, May 26, 2023 at 08:49:06PM +0500, Osama Muhammad wrote:
> This patch removes the error checking for debugfs_create_dir
> in ucd9000.c. This is because the debugfs_create_dir() does not
> return NULL but an ERR_PTR after an error.
> The DebugFS kernel API is developed in a way that the
> caller can safely ignore the errors that occur during
> the creation of DebugFS nodes.The debugfs Api handles
> it gracefully. The check is unnecessary.
> 
> Link to the comment above debugfs_create_dir:
> https://elixir.bootlin.com/linux/latest/source/fs/debugfs/inode.c#L565
> 
> Signed-off-by: Osama Muhammad <osmtendev@gmail.com>

Applied.

Thanks,
Guenter

> ---
> changes since v1
> 	-Added more descriptive commit message.
> ---
>  drivers/hwmon/pmbus/ucd9000.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
> index 3daaf2237832..73559afa8ba7 100644
> --- a/drivers/hwmon/pmbus/ucd9000.c
> +++ b/drivers/hwmon/pmbus/ucd9000.c
> @@ -512,8 +512,6 @@ static int ucd9000_init_debugfs(struct i2c_client *client,
>  		return -ENOENT;
>  
>  	data->debugfs = debugfs_create_dir(client->name, debugfs);
> -	if (!data->debugfs)
> -		return -ENOENT;
>  
>  	/*
>  	 * Of the chips this driver supports, only the UCD9090, UCD90160,
