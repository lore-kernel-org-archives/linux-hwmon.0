Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32933C433F5
	for <linux-hwmon@archiver.kernel.org>; Mon,  3 Oct 2022 18:02:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbiJCSCW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 3 Oct 2022 14:02:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbiJCSCB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 3 Oct 2022 14:02:01 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A0AC2F654
        for <linux-hwmon@vger.kernel.org>; Mon,  3 Oct 2022 11:01:59 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id x1so10368272plv.5
        for <linux-hwmon@vger.kernel.org>; Mon, 03 Oct 2022 11:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=+IJJVlfV5ITrE7xp7K1NPGZMJ4r9Pu7lhyOElKgBlXk=;
        b=d0DtxUG1mshLJd9Hz3y8cnE0a39PX/Emep0z+8gYA/nQsV/WZBYtagMxAJTQTu3PVt
         zDw9krj3FvUwowZFjjT90UAHxxtsMJjpN5KQKAScYt5njl/mk0qaiJUc2tXAjAbQ4lgQ
         UfFzj7tD7YFETVUBxhlr5EVuTpeUCLLfIRbcOvFIUEdfHK0pkdAs5uJwgJq4BNQrZMF3
         87/aCFTkl6ge7l3nlGjStsu4ezGwOMf6Ib8gICVZFvJKcCUR31BvF0cao4/FbB92xXvi
         NPkD2BE80laOH0Wrjp3liuMDrKG5w8l/FMg/n7PR5X+ZYYGTQChfBhsxJPIsrvh1wueX
         skzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date;
        bh=+IJJVlfV5ITrE7xp7K1NPGZMJ4r9Pu7lhyOElKgBlXk=;
        b=yfDa5iUDtUSpHVjCVFXGvUnbWpgOU1iFe+auX04AdM+okUjOhpWu5yDZN30XOoPLnn
         HxRgTBpoISINQz0PoFeiMFwCL/SpYOspYN/Dpkbjxq2ZgbHXdlSwkkpIYOvGFLBynK6w
         fExCq3kya6AHZjc5MFtrwUPQbNVYBuZAXQ+o8va8GXCs6s/lsJqUAPCQdHLkOtUQKV8I
         UTJELdoDWW+K+pDMZO+Gd73sAHDb1HSCVpEsuLfJpsJysLsbURjH9dhoyZkjcyKbbhsz
         qjbNCqvk+wfNr1pMmkOnM6O8AaqWlylLIAOS1EqmzsMabyqMkLU2/INGBfEfpPt06wdI
         NEmA==
X-Gm-Message-State: ACrzQf2sLaRCl//b+gLM6XctKjaxUZaLTeBi1rUuiRTcHm/7DQgJPf5D
        YX0wTqdG8qiXvJT+2PBTr7M=
X-Google-Smtp-Source: AMsMyM795CBljYlT4lTzdOHFuohzVQy0/qR8wXAs413YMxHBk59f/zqxhgBg76mQjO+xerHWsYqXaA==
X-Received: by 2002:a17:903:244d:b0:178:a0eb:d4bc with SMTP id l13-20020a170903244d00b00178a0ebd4bcmr22953290pls.33.1664820118841;
        Mon, 03 Oct 2022 11:01:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e14-20020aa7980e000000b00560bb4a57f7sm3950308pfl.179.2022.10.03.11.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 11:01:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 3 Oct 2022 11:01:57 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ahmad Khalifa <ahmad@khalifa.ws>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 2/2] it87: check device is valid before using force_id
Message-ID: <20221003180157.GB1023056@roeck-us.net>
References: <20221002174259.14609-1-ahmad@khalifa.ws>
 <20221002174259.14609-3-ahmad@khalifa.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221002174259.14609-3-ahmad@khalifa.ws>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Oct 02, 2022 at 06:43:02PM +0100, Ahmad Khalifa wrote:
> Check if there is a valid device before using force_id parameter value
> in order to avoid registering two devices.
> 

For the subject, please use "hwmon: (it87) ..."
in the future.

> Signed-off-by: Ahmad Khalifa <ahmad@khalifa.ws>
> ---
>  drivers/hwmon/it87.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index ce579f5aebcf..6d71f6c481c8 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -2401,7 +2401,13 @@ static int __init it87_find(int sioaddr, unsigned short *address,
>  		return err;
>  
>  	err = -ENODEV;
> -	chip_type = force_id ? force_id : superio_inw(sioaddr, DEVID);
> +	chip_type = superio_inw(sioaddr, DEVID);
> +	/* check first so force_id doesn't register a second empty device */

The reasoning is wrong: the ID is checked to avoid registering a
non-existing or a completely incompatible device. It doesn't matter
if the skipped device is the first or the second device.

> +	if (chip_type == 0xffff)
> +		goto exit;
> +
> +	if (force_id)
> +		chip_type = force_id;
>  
>  	switch (chip_type) {
>  	case IT8705F_DEVID:
> -- 
> 2.30.2
> 
