Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B69D6C433FE
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 Oct 2022 15:01:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233373AbiJZPBs (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 26 Oct 2022 11:01:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234428AbiJZPBo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 Oct 2022 11:01:44 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 606BF7A526
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Oct 2022 08:01:39 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id br15-20020a056830390f00b0061c9d73b8bdso10059692otb.6
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Oct 2022 08:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s9P/1ySeEA3QZ/JZuz1CjtiZDuCR93d0OsTGlTiHMSw=;
        b=FjuyrxiOS+vLVQS0/c1JcjFwG9f5XLBmV4PnixpZnzIqDK0YXDgLH8o3fHsiKG68WB
         0fKbLkYYDTJytrZLrhTKCgtms6MKKjA9f0B8sbxygFem5N2sqkPkEJfxTeB+G5572rUC
         IQ7dzoqAASCZ5w7hvz+DpFIVDc31L0gLxappYApJtWcFKvx/5PlTCn2Z0W9v5/4tt99H
         UnZ625o/VEyzmRFuUweFhKv1RgvmWun7UxQeOzQjI2/An1WFmksHTFGpHnZtR1rRBTxS
         8IY1ioB/Scv2tvJ4YLR6rN3P2Q6TTMxcA/IMTUudI8SAMVcumoC3g4qi2gD7RB6BfcDS
         vvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9P/1ySeEA3QZ/JZuz1CjtiZDuCR93d0OsTGlTiHMSw=;
        b=NNs5JSpdFsekhx4JejSPMwkF6dLmP6blNfyEL7sk3o11ZKcgWuhFNae3H89rBVSrOL
         kI1eJBY+M8W1i9fzOUPGi3zulxj9frJFkZQl+wxtJ3b0WRkEzkzNHJmGoNOSRkwPtOnO
         9ApidEQ21VGC606I/A/5eCjwlebIbeRR1o6v3NDUx2Vlauc3ywULTpqvo92djAXGVmSF
         cJxf+1LQP1m6IN8yyt8Wy0DulIm6QV1O4mA/UaoqdWNECS9MRKtNDBYTM9qd/XVn9dH1
         sVHNXa7k5zewNEp9grHXe+SHxsOv/MJ+uPxoWzu1znKJiBqU+SP95Resff4cKVZeC/lD
         z0KQ==
X-Gm-Message-State: ACrzQf2uF2vVSFEFdgElBaoVQuNDhRjXw5muuQt9gGBpF9yA7/CA8l9s
        tcu8e9nhslG0MtCLjkjtLBc=
X-Google-Smtp-Source: AMsMyM6IF1Ni/ZBHuBVlreLsKChJ53rWbjx6bCvORcL5Ohy7sm84ButUcD5ltC1nKJKdeJ39iQgqKQ==
X-Received: by 2002:a05:6830:610b:b0:65b:eb36:6336 with SMTP id ca11-20020a056830610b00b0065beb366336mr21255363otb.131.1666796498592;
        Wed, 26 Oct 2022 08:01:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u18-20020a056870305200b0013b911d5960sm3067911oau.49.2022.10.26.08.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 08:01:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 26 Oct 2022 08:01:37 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jeremy Kerr <jk@codeconstruct.com.au>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Eddie James <eajames@linux.ibm.com>,
        Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] hwmon/occ: OCC sensors aren't arch-specific
Message-ID: <20221026150137.GA2545794@roeck-us.net>
References: <20221024081527.3842565-1-jk@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221024081527.3842565-1-jk@codeconstruct.com.au>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Oct 24, 2022 at 04:15:27PM +0800, Jeremy Kerr wrote:
> Commit c112d75840fb ("hwmon: OCC drivers are ARM-only") made the OCC
> sensor drivers not selectable on powerpc64:
> 
>   These drivers are for a BMC inside PowerPC servers. The BMC runs on
>   ARM hardware, so only propose the drivers on this architecture, unless
>   build-testing.
> 
> ... but we now have a powerpc64 BMC (still for a powerpc64 host), so
> drop the `depends on` that excludes building for this platform.
> 
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> Acked-by: Joel Stanley <joel@jms.id.au>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/occ/Kconfig | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/hwmon/occ/Kconfig b/drivers/hwmon/occ/Kconfig
> index 35a7070db827..348c21100a37 100644
> --- a/drivers/hwmon/occ/Kconfig
> +++ b/drivers/hwmon/occ/Kconfig
> @@ -6,7 +6,6 @@
>  config SENSORS_OCC_P8_I2C
>  	tristate "POWER8 OCC through I2C"
>  	depends on I2C
> -	depends on ARM || ARM64 || COMPILE_TEST
>  	select SENSORS_OCC
>  	help
>  	 This option enables support for monitoring sensors provided by the
> @@ -21,7 +20,6 @@ config SENSORS_OCC_P8_I2C
>  config SENSORS_OCC_P9_SBE
>  	tristate "POWER9 OCC through SBE"
>  	depends on FSI_OCC
> -	depends on ARM || ARM64 || COMPILE_TEST
>  	select SENSORS_OCC
>  	help
>  	 This option enables support for monitoring sensors provided by the
