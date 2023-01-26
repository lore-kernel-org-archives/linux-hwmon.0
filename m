Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 392A3C05027
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Jan 2023 13:54:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231860AbjAZNyD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 Jan 2023 08:54:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231874AbjAZNxh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Jan 2023 08:53:37 -0500
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A13730C7
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Jan 2023 05:53:17 -0800 (PST)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-16332831ed0so2390096fac.10
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Jan 2023 05:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rXFAlgB6wpO5hnNA64ezQhUqBbRsULsfgF3AZIsqFXY=;
        b=gvL/ULeCqje36i2CcI1+6VFhPwYN9wyhPdF6YEprhNETgAudu5T2nsVEKX97qzrD5V
         9kObmmuawx18tpeh23zidnIFtcfjw+laZLKtjRQlCLdRLzdGCX1yQIP1upLvqK/T3Fga
         m9r12gA55CnFrME8lwEyJrOB981rbtLMnIG2QMqTT7S7eEQ1de830cK3dqln1dyELlTR
         AM2zpPJiiDnMVLt7HsISQvcjFPbx/+rTMiK0zdIRfVAu0qZaZStfvDMwNrwbAYCj/g3S
         tH02lKHlXWG7rePgOfJdgSbETjlA0nvttEjqOqwmt+BlWj4lyJsLt4lijj9db9t8sw7H
         4KOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rXFAlgB6wpO5hnNA64ezQhUqBbRsULsfgF3AZIsqFXY=;
        b=xWv0go7CvGQYGd9g+u+FuSezD8K+y2b89WFZCjstdFONyAvW+ZEGcawRCVFojxvLOg
         cnVAAeULuItIRamwuGSNGXBqktMfUxB5yLndZJAKdt94ukmtHwj1qDNDlWifUMqTawVP
         ykoM/9OC3mAB6pRUlObJcN9thlMLScpMbghA9jGwcKQEKp5qLXOQ1P0GKveFhNvQXiz1
         nDVCJ5A6Nn4Vj/rAg6IGDxSg/ENIx114Fj7TfFv8zdeJpHfKABf0Wz3qTzkx9WCgfXgx
         k2z8O2Jm/CMBTCpR/zvuDBiOYwkkGVo1W3cQ+R5XWjtDTQDYPqrYGyNZM+5RX+KPU3aZ
         xIGA==
X-Gm-Message-State: AFqh2kq9hrwxUsclba37DtJ96OIBiteDidIx71jA2BC2+McdARrphai3
        syrReYXaqm1PATbtPz4Y48A=
X-Google-Smtp-Source: AMrXdXvND+1UUHWdwjWfh0Z29yw0WVo3MWkrQ3nYGnFhIsRb2px7MINYnUOqUymB/h1tS0hIzlQcxQ==
X-Received: by 2002:a05:6870:cc8e:b0:15f:20b4:40c6 with SMTP id ot14-20020a056870cc8e00b0015f20b440c6mr18509654oab.24.1674741195876;
        Thu, 26 Jan 2023 05:53:15 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id gn12-20020a056870d98c00b0013ae39d0575sm501602oab.15.2023.01.26.05.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 05:53:15 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 26 Jan 2023 05:53:14 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v1 6/7] hwmon: (it87) Add new chipset IT87952E
Message-ID: <20230126135314.GB1635195@roeck-us.net>
References: <20230126040223.986189-1-frank@crawford.emu.id.au>
 <20230126040223.986189-7-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126040223.986189-7-frank@crawford.emu.id.au>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Jan 26, 2023 at 03:02:22PM +1100, Frank Crawford wrote:
> Add IT87952E, a new chip ID (DEV ID 0x8695), which appears to be an
> updated version of the IT8792E and takes the same configuration.
> 
> The model name comes from the model name printed on the chip.
> 
> There is no datasheet publicly available.
> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
> ---
>  drivers/hwmon/it87.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index e8eeedd23bee..85ecc61dbf9e 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -34,6 +34,7 @@
>   *            IT8786E  Super I/O chip w/LPC interface
>   *            IT8790E  Super I/O chip w/LPC interface
>   *            IT8792E  Super I/O chip w/LPC interface
> + *            IT87952E  Super I/O chip w/LPC interface
>   *            Sis950   A clone of the IT8705F
>   *
>   *  Copyright (C) 2001 Chris Gauthron
> @@ -63,7 +64,7 @@
>  
>  enum chips { it87, it8712, it8716, it8718, it8720, it8721, it8728, it8732,
>  	     it8771, it8772, it8781, it8782, it8783, it8786, it8790,
> -	     it8792, it8603, it8620, it8622, it8628 };
> +	     it8792, it8603, it8620, it8622, it8628, it87952 };
>  
>  static struct platform_device *it87_pdev[2];
>  
> @@ -160,6 +161,7 @@ static inline void superio_exit(int ioreg, bool doexit)
>  #define IT8622E_DEVID 0x8622
>  #define IT8623E_DEVID 0x8623
>  #define IT8628E_DEVID 0x8628
> +#define IT87952E_DEVID 0x8695
>  #define IT87_ACT_REG  0x30
>  #define IT87_BASE_REG 0x60
>  
> @@ -470,6 +472,15 @@ static const struct it87_devices it87_devices[] = {
>  		  | FEAT_SIX_TEMP | FEAT_VIN3_5V,
>  		.peci_mask = 0x07,
>  	},
> +	[it87952] = {
> +		.name = "it87952",
> +		.model = "IT87952E",
> +		.features = FEAT_NEWER_AUTOPWM | FEAT_16BIT_FANS
> +		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
> +		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL,
> +		.peci_mask = 0x07,
> +		.old_peci_mask = 0x02,	/* Actually reports PCH */
> +	},
>  };
>  
>  #define has_16bit_fans(data)	((data)->features & FEAT_16BIT_FANS)
> @@ -2501,6 +2512,10 @@ static int __init it87_find(int sioaddr, unsigned short *address,
>  	case IT8628E_DEVID:
>  		sio_data->type = it8628;
>  		break;
> +	case IT87952E_DEVID:
> +		sio_data->type = it87952;
> +		doexit = false;	/* See IT8792E comment above */
> +		break;

Is that true for this chip as well ? I would have hoped they fix
the problem for an updated version of the same chip.

Thanks,
Guenter

>  	case 0xffff:	/* No device at all */
>  		goto exit;
>  	default:
> -- 
> 2.39.1
> 
