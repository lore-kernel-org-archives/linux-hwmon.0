Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F62C05027
	for <linux-hwmon@archiver.kernel.org>; Sat, 18 Feb 2023 00:25:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbjBRAZU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 17 Feb 2023 19:25:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbjBRAZT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 17 Feb 2023 19:25:19 -0500
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A039068AD2
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Feb 2023 16:25:15 -0800 (PST)
Received: by mail-il1-x131.google.com with SMTP id m16so857552ilq.10
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Feb 2023 16:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GaACgaiBl0eq2VXbNmnuvVNc7jw+0+Q30SACf5FWVM4=;
        b=G/v8dhApt2MH0JUVB14MpwmmeRqj+8uD7rKk6W3z/qhwPwb5MugnLNx38kkA8fhVWz
         RR7KrdNSq61zF8Fpi88zSsSoUkpokY57IwPL3yUuxvz8PrZmqde8zpWueaiX4Fd3TPLA
         O7tWlf0lX6iM9b/NBP7kloys0OHBYfN/tgkj8tX6VcFbcDX/bjiEqQ2J3fuuiZSrSBku
         jkGSlo8PgEL1LAtJUOb3dkch33iGSDspptjzi50yikEmR/6zz2RKuXgEshTtk7lewd3d
         AE/6zFXL8ucKf8EQFF6kilfrxwL7qmJ6oz8NkOMz6u/p/yRS8mNRdi9cqn0qhKjEpq1Q
         Tw/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GaACgaiBl0eq2VXbNmnuvVNc7jw+0+Q30SACf5FWVM4=;
        b=0VWyoRzxw6Ii6OiAtRmngeTxVpJ4o7Gvqx+pl7oKyS7Dt+dUzFk50GcmoUr1CTerqv
         UGxLyZ7y16ABeqKNVGjLPs2b8BBxWWE9vgTsl5MLxvQeq+Uh2lsrSAEMndqa9zAZuD7X
         AyZuqA1F6PnsRHNjqDU/a6p+zFSQIe2WHBfHBBRQdTCRxnc7TTFbRVEIBR5Wlb/AFrMl
         XDNzlVTt27ZS/f2C8jykha/nN/cMqkbSjmp0lGtd5XYO7Dn3RnkTygsORmHHE8L9cipc
         DyV2iAEo7plq+0PBh9nn5JO494C0P27qCqCslVdT4ypjmv3WzlVlOqwcZUx9Nq1+SMRp
         a85Q==
X-Gm-Message-State: AO0yUKW75mIAiCUXn/oP50QsKJH+LMyxaej9v86/PjdynmO5cYvYFf1/
        Qzr2dkUQT0MUxAYgzsyejrewdmHPxIo=
X-Google-Smtp-Source: AK7set9Svg4x+Zf2bNtu5DWDQWs8gdDvxp37dK+wf/6v5T21g3imjB8iCmf0XzAZJuIfrNxybkOd0w==
X-Received: by 2002:a92:ae08:0:b0:315:34a4:4e55 with SMTP id s8-20020a92ae08000000b0031534a44e55mr1388605ilh.29.1676679914990;
        Fri, 17 Feb 2023 16:25:14 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o12-20020a02cc2c000000b003b331f0bbdfsm1860753jap.97.2023.02.17.16.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 16:25:14 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 17 Feb 2023 16:25:12 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Enrico Mioso <mrkiko.rs@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
        Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH] net: phy: aquantia: clamp temperature value in
 aqr_hwmon_set
Message-ID: <20230218002512.GA2617824@roeck-us.net>
References: <20230217231647.968107-1-mrkiko.rs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217231647.968107-1-mrkiko.rs@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Feb 18, 2023 at 12:16:47AM +0100, Enrico Mioso wrote:
> React like otherdrivers do when an out-of-range value is passed from hwmon
> core.
> 

This is not an appropriate patch description.

> Signed-off-by: Enrico Mioso <mrkiko.rs@gmail.com>
> CC: Andrew Lunn <andrew@lunn.ch>
> CC: Russell King <linux@armlinux.org.uk>
> ---
> I implemented this patch based on observing how other drivers are reacting,
> and after experiencing the hwmon core passing -INT MAX. Based on a

I don't understand "after experiencing the hwmon core passing -INT MAX".

> cursory look at the hwmon code, I don't believe this to be a bug. If this is
> instead the case, I hope I will be corrected and this patch rejected.

The bug, if anything, in the current code is that it should return -EINVAL.
-ERANGE is "Math result not representable" which doesn't make sense here.

Other than that, it is up to the driver author to decide if they want to
return an error in this situation or if they want to clamp the range.
We recommend to clamp because users won't normally know the valid range,
but, again, it is up to the driver author to decide if they want to burden
users with figuring out the valid range.

Guenter

> ---
>  drivers/net/phy/aquantia_hwmon.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/net/phy/aquantia_hwmon.c b/drivers/net/phy/aquantia_hwmon.c
> index 19c4c280a6cd..6444055e720c 100644
> --- a/drivers/net/phy/aquantia_hwmon.c
> +++ b/drivers/net/phy/aquantia_hwmon.c
> @@ -70,8 +70,7 @@ static int aqr_hwmon_set(struct phy_device *phydev, int reg, long value)
>  {
>  	int temp;
>  
> -	if (value >= 128000 || value < -128000)
> -		return -ERANGE;
> +	clamp_val(value, -128000, 128000);
>  
>  	temp = value * 256 / 1000;
>  
> -- 
> 2.39.2
> 
