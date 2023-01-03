Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 413C2C3DA7D
	for <linux-hwmon@archiver.kernel.org>; Tue,  3 Jan 2023 18:37:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233409AbjACShR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 3 Jan 2023 13:37:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238730AbjACShL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 3 Jan 2023 13:37:11 -0500
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E768B281
        for <linux-hwmon@vger.kernel.org>; Tue,  3 Jan 2023 10:37:09 -0800 (PST)
Received: by mail-oo1-xc31.google.com with SMTP id 189-20020a4a18c6000000b004d25d8c5af9so4630231ooo.13
        for <linux-hwmon@vger.kernel.org>; Tue, 03 Jan 2023 10:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hElJ+Ceu0JHns3sCsiM/UE99HBfGz5qnE1Mo7Q27T6I=;
        b=ZO+f5+jwI02fu5eGAfeRlRXSnLxPH+715Xh9Yj7vr0I+wREsgmNRt9mT0nHoXEWGFv
         1oi1fsAQFks+g4h5nhQ/tKdER1tMkSMvVuy6i7zgkeUCi6lUvd2uykE3hq2iLIdlHfxl
         +UYpSISeiIUJlXm5Xxx8XsY6gL6IrwlPJlBSXTiEBWYpMKnuDm3mVWqhxLGusfvc61kJ
         jy8etFMqgDf9giVI8tRKxMMza31sh1Ov1OKbKfqx0hqrO1zc17CZuMYhhIog37ExRf8k
         1MZHykgjsfK7TPB8rAOqS0+WKrFK/JENmEjC5LayONvNyH7pFunCUQFnuZ7n2vroxevU
         h9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hElJ+Ceu0JHns3sCsiM/UE99HBfGz5qnE1Mo7Q27T6I=;
        b=hYHfOEaKzh9rP7XQhX5AYHRK1CAatzXoTZhU7Jb04mKba/ZCzwQXrKOlJwPRs6v/sY
         pkHUlEGlJuuLYsirBkh8QMO+sjaI5PzsCx9PA45l/bX/LI6PUvMZ0olPHElzQ2TBn4zX
         S3rSxkBoFbCdw1Jdug1aRDPifcHMFbHgbTQuozwR+6gP0kuXhzpIFra6+bBvvK42S8yI
         Rxty67SZYq0hgSUy18XOSaIxXONyCIoZBsIf37FqzPIzPnzSmLGSG0897OGM12BEd3OG
         11nu0uUo7Y4tJwaAyNrCXi4rqWoHjR6BV0f7A/Ew782B6qHZI3xs7CWdilNj23TcXpqD
         LXYA==
X-Gm-Message-State: AFqh2koIcOjK8ZT22h+LUFdy+1s3sqP6abcybshmFL2Ghfct5BLafa/A
        r+avCN4ZOESujtV0/UY/R6w=
X-Google-Smtp-Source: AMrXdXt5Fi2baVpPouDQMJzD/9WjP7LbanX1GbSkbzi+uHwdmcynsWkZGMTB7s/ODUPf8dTwSUHeJA==
X-Received: by 2002:a4a:e706:0:b0:4e6:f87c:bdf8 with SMTP id y6-20020a4ae706000000b004e6f87cbdf8mr6117110oou.0.1672771029146;
        Tue, 03 Jan 2023 10:37:09 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w9-20020a4ae4c9000000b0049f9731ae1esm3974322oov.41.2023.01.03.10.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 10:37:08 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 3 Jan 2023 10:37:07 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v1 1/2] hwmon: (it87) Allow calling superio_enter outside
 mux
Message-ID: <20230103183707.GA204971@roeck-us.net>
References: <20230103064612.404401-1-frank@crawford.emu.id.au>
 <20230103064612.404401-2-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230103064612.404401-2-frank@crawford.emu.id.au>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jan 03, 2023 at 05:46:11PM +1100, Frank Crawford wrote:
> Allow for superio_enter to be called outside mux, in particular for

"outside mux" is really a bad wording. I had to look into the code
to understand what it means. "without requesting the muxed memory
region", maybe.

Guenter

> initialisation of the second chipset, which must be entered, but never
> exited.

The second chipset is not "entered", it must enter configuration
mode (or be put into configuration mode). The name of the function
does not reflect the associated functionality.

Please rephrase.

Thanks,
Guenter

> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
> ---
>  drivers/hwmon/it87.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index 9997f76b1f4a..4ebce2c661d7 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -87,6 +87,14 @@ static struct platform_device *it87_pdev[2];
>  #define	DEVID	0x20	/* Register: Device ID */
>  #define	DEVREV	0x22	/* Register: Device Revision */
>  
> +static inline void __superio_enter(int ioreg)
> +{
> +	outb(0x87, ioreg);
> +	outb(0x01, ioreg);
> +	outb(0x55, ioreg);
> +	outb(ioreg == REG_4E ? 0xaa : 0x55, ioreg);
> +}
> +
>  static inline int superio_inb(int ioreg, int reg)
>  {
>  	outb(reg, ioreg);
> @@ -124,10 +132,7 @@ static inline int superio_enter(int ioreg)
>  	if (!request_muxed_region(ioreg, 2, DRVNAME))
>  		return -EBUSY;
>  
> -	outb(0x87, ioreg);
> -	outb(0x01, ioreg);
> -	outb(0x55, ioreg);
> -	outb(ioreg == REG_4E ? 0xaa : 0x55, ioreg);
> +	__superio_enter(ioreg);
>  	return 0;
>  }
>  
> -- 
> 2.38.1
> 
