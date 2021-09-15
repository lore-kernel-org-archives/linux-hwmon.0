Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 299AFC433EF
	for <linux-hwmon@archiver.kernel.org>; Wed, 15 Sep 2021 15:16:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0879761279
	for <linux-hwmon@archiver.kernel.org>; Wed, 15 Sep 2021 15:16:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234024AbhIOPRf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 15 Sep 2021 11:17:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233977AbhIOPRe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 15 Sep 2021 11:17:34 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE29DC061574
        for <linux-hwmon@vger.kernel.org>; Wed, 15 Sep 2021 08:16:15 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id q11-20020a9d4b0b000000b0051acbdb2869so4028924otf.2
        for <linux-hwmon@vger.kernel.org>; Wed, 15 Sep 2021 08:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8temXE3qZLSIljF3KhXvWIeml2Dx4S6vL87ISrZQlBM=;
        b=qQDAmD3Un+9nCfT90gKb/rn+8MEiCjA/O7UW35N42E9M/sAHS//MNvL07AQfPhgJ5L
         qCul48W8wSShrfe7W18jBBU84C92VrUP2Wdsr+A7hEiGutQgcAhae2FMeCjew2sNUrw/
         1mh9IG+uCr914UTEs4zSkmMHlOvgKcxTysRpSPwdMVLsKtZh5mBxEFmF2yWkcV3BRXGp
         H1zhcZNgt9fBUOJY8z6dZTi7OaQgZh9u4qJWjto70jDJ0fPJhEt7KuAtUQgiNIEU75UO
         TXER84sONZMhwItdHfYKbUTKloWN9K/IJAFUjkoChdC/MQso2qMWDwzuz0dU/MyFetyL
         bzqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=8temXE3qZLSIljF3KhXvWIeml2Dx4S6vL87ISrZQlBM=;
        b=V+VV2yoaGJWtkZYHA3pTfXHjQOyNc2meSfJ6tAqw0J/oK+r4hz5Gqd9L4iG3uXzp9u
         4HybOsTedR+JzMc1BrYD+d0YJ/vo/dAqBKsqr54G/IkbUJdD6MxaBduSzfPBvYziaHH4
         I/HBgCckmwWLknZgRPFkAZ5gMCX7sbEzwKG3vWz/IwLu0/u9e4LStj1m9HIYCWa0zXCL
         Dels9OUzFfGJLEYf/FX4cugdYLup1FDyLKq7uk6g+pJZLE4d4o6gh4AIq5jfTGxrMxRa
         f6IeQy9ftXruSbi6KMRv2BdAtywu4gN1iWGWPgz2OLkgIOfpX2NVvcQQSxg5bYdFCogR
         ZNJg==
X-Gm-Message-State: AOAM533O0VFHFyseoek/TVGBlfrKnHPGcKrMkytVRqubx02ymXih1VqH
        A2wd7w3LCQhiAGOKa+1QI011kfUzFuo=
X-Google-Smtp-Source: ABdhPJy9Gf3betFQKTM3iqp1YP3fu3lVfQQQxoRor11hAGxMYEZtUu1A8G8f/VHsufa8dOTtfcpMMA==
X-Received: by 2002:a05:6830:17c3:: with SMTP id p3mr383943ota.297.1631718975169;
        Wed, 15 Sep 2021 08:16:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i5sm79196oie.11.2021.09.15.08.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 08:16:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 15 Sep 2021 08:16:13 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Adam Borowski <kilobyte@angband.pl>
Cc:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (dell-smm) Don't build the proc interface if
 there's no /proc
Message-ID: <20210915151613.GA3272120@roeck-us.net>
References: <7a259cc4-69a8-fc0c-e256-5d82b6f1bb35@roeck-us.net>
 <20210915143801.43419-1-kilobyte@angband.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210915143801.43419-1-kilobyte@angband.pl>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Sep 15, 2021 at 04:38:01PM +0200, Adam Borowski wrote:

There should be some description here.

> Signed-off-by: Adam Borowski <kilobyte@angband.pl>

Otherwise, for the content:

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Guenter wrote:
> > > -#if IS_ENABLED(CONFIG_I8K)
> > > +#if IS_ENABLED(CONFIG_I8K) && IS_ENABLED(CONFIG_PROCFS)
> 
> > This should be expressed as Kconfig dependency: I8K should depend on PROCFS.
> > Otherwise the configuration flag is misleading.
> 
> Right, I did not notice I8K does nothing otherwise.
> 
>  arch/x86/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 4e001bbbb425..a7365695ff72 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -1253,6 +1253,7 @@ config I8K
>  	tristate "Dell i8k legacy laptop support"
>  	select HWMON
>  	select SENSORS_DELL_SMM
> +	depends on PROC_FS
>  	help
>  	  This option enables legacy /proc/i8k userspace interface in hwmon
>  	  dell-smm-hwmon driver. Character file /proc/i8k reports bios version,
> -- 
> 2.33.0
> 
