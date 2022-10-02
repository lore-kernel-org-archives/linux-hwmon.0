Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC6E3C433F5
	for <linux-hwmon@archiver.kernel.org>; Sun,  2 Oct 2022 15:11:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbiJBPLy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 2 Oct 2022 11:11:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbiJBPLw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 2 Oct 2022 11:11:52 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AD4132BBA
        for <linux-hwmon@vger.kernel.org>; Sun,  2 Oct 2022 08:11:51 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id 129so7847142pgc.5
        for <linux-hwmon@vger.kernel.org>; Sun, 02 Oct 2022 08:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=+mgb+jQdZcCmroJakNImULeMOoe0BzvvYaOiXkbA16A=;
        b=Uz8Q/kC4K4G/m/KfbGJPhm3DySrmB9YT8/B0sl4KWse6l2nDj1I4WsMDnwuL5rpQU3
         WIB9a74gxwc8oQYr3H/p8tYwzNi5k34kGWo6WDUujLEsZTlWQHKI9Ga59nTDJzNPb1y2
         vNKRYIBX6EFtWV9ZK6TJq6HB/BA0BQBZ6wa6epSNxgL9joNUqvD5T3HpZF83l+8+cl8B
         X50wm7vsWmuwhCEz/cHxhe9HDxWE6sCfCP41sUa1bpheZu5FbIMxN6Hji2szbtOiPOfb
         Iu/gVPfofNTwW3+Fu/5Ee+EOe2HEi9HRfP0aMNT/v3EWU/njNSHBib+8t/QFDLQskhPz
         1Ihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date;
        bh=+mgb+jQdZcCmroJakNImULeMOoe0BzvvYaOiXkbA16A=;
        b=3RX6qivJqgp3YGUlbIyASut4QM7MCw9bvYlcOHkoStQNSpfDvvPAHbxvwatwCgIOXk
         GQAqo2Jw3Ltpn52i9afry2arhEzoR551EniD2qP0zhh3wETw5WTt0vHrZMjgG0bp30VM
         9OSi70j9E3/guGC8bo1RsT8Mqb2lQPxklZd5xi+rZtnrEUdoUrh+4DbuOP50Ei49Nbr4
         FnOWOe1FxRUxS1l8yyHgtDn99Sc4oreeS0YgH9OngSLbDw8vtAFXFDoKZPOQ6dXNryRm
         9kVuMzwK+py9spC4mzvVt9K/SkgPy7a+hz9imWDmrH+ndj3fvgMLBehv9mClmWyO3aDs
         BhIA==
X-Gm-Message-State: ACrzQf3IbUGfll7QNfHTDWuuxcxnVl2O4JKjkntwfu8gxr/CIuQ8X8b5
        OT43GpwdGKuOSVjSSdP0qy5CUDvP4+taLQ==
X-Google-Smtp-Source: AMsMyM7reQxmHNW/R+UESMl1pjZ2CLepk7SPsM0cbuRaGpOvfCQjkTYLJUMemCGWvHiiVKpMNisO6w==
X-Received: by 2002:a05:6a00:1704:b0:55a:d85a:f226 with SMTP id h4-20020a056a00170400b0055ad85af226mr18163854pfc.19.1664723510887;
        Sun, 02 Oct 2022 08:11:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o41-20020a17090a0a2c00b00202df748e91sm4896186pjo.16.2022.10.02.08.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Oct 2022 08:11:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 2 Oct 2022 08:11:48 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ahmad Khalifa <ahmad@khalifa.ws>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/1] it87: Add param to ignore ACPI resource conflicts
Message-ID: <20221002151148.GA2896730@roeck-us.net>
References: <20220930144637.48904-1-ahmad@khalifa.ws>
 <20220930144637.48904-2-ahmad@khalifa.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220930144637.48904-2-ahmad@khalifa.ws>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Sep 30, 2022 at 03:46:37PM +0100, Ahmad Khalifa wrote:
> Signed-off-by: Ahmad Khalifa <ahmad@khalifa.ws>

Patch description missing. What are you doing, and why ?

> ---
>  drivers/hwmon/it87.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index 0e543dbe0a6b..6d71f6c481c8 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -69,6 +69,10 @@ static unsigned short force_id;
>  module_param(force_id, ushort, 0);
>  MODULE_PARM_DESC(force_id, "Override the detected device ID");
>  
> +static bool ignore_resource_conflict;
> +module_param(ignore_resource_conflict, bool, false);
> +MODULE_PARM_DESC(ignore_resource_conflict, "Ignore ACPI resource conflict");
> +
>  static struct platform_device *it87_pdev[2];
>  
>  #define	REG_2E	0x2e	/* The register to read/write */
> @@ -2397,7 +2401,13 @@ static int __init it87_find(int sioaddr, unsigned short *address,
>  		return err;
>  
>  	err = -ENODEV;
> -	chip_type = force_id ? force_id : superio_inw(sioaddr, DEVID);
> +	chip_type = superio_inw(sioaddr, DEVID);
> +	/* check first so force_id doesn't register a second empty device */
> +	if (chip_type == 0xffff)
> +		goto exit;
> +
> +	if (force_id)
> +		chip_type = force_id;

Undocumented change, violating "one logical change per patch" rule.

>  
>  	switch (chip_type) {
>  	case IT8705F_DEVID:
> @@ -3261,8 +3271,10 @@ static int __init it87_device_add(int index, unsigned short address,
>  	int err;
>  
>  	err = acpi_check_resource_conflict(&res);
> -	if (err)
> -		return err;
> +	if (err){
> +		if (!ignore_resource_conflict)
> +			return err;
> +	}
>  
>  	pdev = platform_device_alloc(DRVNAME, address);
>  	if (!pdev)
