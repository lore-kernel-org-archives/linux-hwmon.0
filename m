Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA81C433F5
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Oct 2022 18:32:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbiJEScm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 5 Oct 2022 14:32:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbiJEScm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 5 Oct 2022 14:32:42 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36F5F220D6
        for <linux-hwmon@vger.kernel.org>; Wed,  5 Oct 2022 11:32:41 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id a5-20020a17090aa50500b002008eeb040eso3437541pjq.1
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Oct 2022 11:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=c2dJjhcCC83ULCwTKGKArE1qWIwpnkvRNJY1T2Qxpp0=;
        b=COXbt5NbIVAPERP4Ubn37I798qdWcQmBXWxqFWprlFx0ssEQAPt/RVWQooShQZSMs5
         o656ICB2aD2TlthT+FwLJDFW3gj2ymsm8EortLBDdabeJ1dD7pj88Wy9D3tuZ7sl2GLd
         7V3073Db4WZRR2WDPM5JuhVNRTnd5Ih3hjt/hz9rxdHQ/k0/p/D+RSyzHsDLsKcCuVh1
         dY6IyumLKeczLqFWEQHPCalxk3yV85gPJI3h3ZtdGMzhMvt3XcxaCb6qColmWlfPmoGt
         pE0V+vzv00iIkCUPAcbl01obj/YRRrrcFDh9nUpxp86MiQONXChM9n0FeWN6+tem1k6V
         GD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date;
        bh=c2dJjhcCC83ULCwTKGKArE1qWIwpnkvRNJY1T2Qxpp0=;
        b=joOpXsEO7OOE0afXrSQgCnI1//3oHxPjZ3xZRE0HEVoeYWzuWJwCdq4TYGVyFqjL+T
         8E24WqUXTSN33tUwHQYzLo74v4NWiWDK1GX8fSaMbxqfEKPdresKVy0qnYHy+suYeV1R
         SfAunp4GMoFWUSWEMxAmcgFGyBOakwJPp0/BCs/hrRS0E+EQiEtsVXeJkhiWNcuPelJx
         zRQR2GwiJ92KGmqLHgrsmsYZkd3uDSIL1AP68IgQDl/Mp1MT0d0LcPujCWhxwHxak/2K
         xEQ45hgfsR8hBGF6DTHi4jnfc5l288gEQq8Gxy+QeftH+TDdomvga3rrn47NMxbjm2up
         DriQ==
X-Gm-Message-State: ACrzQf1OKJCz43iS9xQ0/uu8qapAJh12u9C5XfxC88DPKeUKpYYphrjb
        TaSGyio2pd68mDyz9chQVaTQ1HJRJdrYhg==
X-Google-Smtp-Source: AMsMyM63UoPdV3tYm+6lfMjmWSc/WGfZIesR21wU9/wwvvwg8Rkz45hsbg3MvD1Jy8CE5ou1c2rQkw==
X-Received: by 2002:a17:90a:8b93:b0:20a:bd84:5182 with SMTP id z19-20020a17090a8b9300b0020abd845182mr6584382pjn.161.1664994760747;
        Wed, 05 Oct 2022 11:32:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2-20020a655ac2000000b0043ba3d6ea3fsm46723pgt.54.2022.10.05.11.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 11:32:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 5 Oct 2022 11:32:38 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ahmad Khalifa <ahmad@khalifa.ws>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: (it87) Check for a valid chip before using
 force_id
Message-ID: <20221005183238.GA2760812@roeck-us.net>
References: <20221004210100.540120-1-ahmad@khalifa.ws>
 <20221004210100.540120-3-ahmad@khalifa.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221004210100.540120-3-ahmad@khalifa.ws>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Oct 04, 2022 at 10:01:03PM +0100, Ahmad Khalifa wrote:
> Check there is a chip before using force_id parameter as there
> is no value in registering a non-existent chip
> 
> Signed-off-by: Ahmad Khalifa <ahmad@khalifa.ws>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/it87.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index c4f5500dcf3c..bb9870c79ffe 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -2401,7 +2401,13 @@ static int __init it87_find(int sioaddr, unsigned short *address,
>  		return err;
>  
>  	err = -ENODEV;
> -	chip_type = force_id ? force_id : superio_inw(sioaddr, DEVID);
> +	chip_type = superio_inw(sioaddr, DEVID);
> +	/* check first for a valid chip before forcing chip id */
> +	if (chip_type == 0xffff)
> +		goto exit;
> +
> +	if (force_id)
> +		chip_type = force_id;
>  
>  	switch (chip_type) {
>  	case IT8705F_DEVID:
