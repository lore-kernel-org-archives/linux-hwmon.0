Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B39C6C61D97
	for <linux-hwmon@archiver.kernel.org>; Sun, 29 Jan 2023 20:56:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230489AbjA2U4w (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 29 Jan 2023 15:56:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230073AbjA2U4v (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 29 Jan 2023 15:56:51 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67E8914EA3
        for <linux-hwmon@vger.kernel.org>; Sun, 29 Jan 2023 12:56:50 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id i5so8542590oih.11
        for <linux-hwmon@vger.kernel.org>; Sun, 29 Jan 2023 12:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s2WnSGJyGgy8PCTck0OmurOwVCMy+56HvlELd4SRj1Q=;
        b=aQzDPVYaMk1ToUCfcL+En5vMklsyj00n0J3tZRmtqFNbVzX30ltTwUThk+W0o5xhox
         aDi0z/X/oVVAEXXdDlgLhgYXgx31GFbOxiZv2KCdwtCuoCQi5zaXEuSheaZdrDGRPKHS
         AHIUzwF08KqIEBPRrWMTsqlU0+He8IQcE5p9geCqmlS53hdCgv9Ur8nDTUvalklWLumI
         tkSxT+O3ah8pPnmj0aSn+aX1C6crKFvMhesUzESMNuCdA79C41d1O8hpoZR4JJMIcSPW
         aNZw5mlUyaajrEmI9JNUuV74Gqh1eXT3rCeoImlAz/CKFQDa8tqjpSHanj3Ivu+qdArJ
         zsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s2WnSGJyGgy8PCTck0OmurOwVCMy+56HvlELd4SRj1Q=;
        b=ZJpJBwPI+vyt1sw8s9do8Zjx4rzvI4awJVgihXw98OYElCmevLocgAKHxWIqlQz3sK
         mbSuShqZQczpb2vZc+aIYk84niM0Io3frbyGRu7dTkJgkq75i4CeFDYgNOciL/eBDgyl
         ZF2yPcCzneuvYKaaLcAuzJypkT6kFh65q+0V//IKKXye8PXdJWk3+izhI7d7QxSr4+so
         T777Qw45//53i6ufsnpPiwmFwiIPqSv3Tt2SpyDKhujx2LRVsnMf3kFenC4XlMZaxgIU
         8eEmN93S3SGwWGn8ghxAotyVyKXUeKUuq9y5LOkMpTU7zSq7h+fX7vk5adY2R/k7J051
         1TEQ==
X-Gm-Message-State: AO0yUKUCDJVG1wE+MoKGJtxU5d6uMQ82czeju6rOvEvPn7kMPouyAKWP
        ndMq3vo+wbDm+3zFUSCe6HjwUIK2g2o=
X-Google-Smtp-Source: AK7set/i++aWWHHLYwq1iRMT0oqIFQctn3DvgPd+C/OFH3WoaZ5Mwrb0DEu7W5qLSQMmAX28k4JPMQ==
X-Received: by 2002:a05:6808:651:b0:378:4265:f347 with SMTP id z17-20020a056808065100b003784265f347mr850265oih.31.1675025809725;
        Sun, 29 Jan 2023 12:56:49 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o51-20020a0568301c7300b0068bbb818c64sm2346359otg.25.2023.01.29.12.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 12:56:48 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 29 Jan 2023 12:56:47 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 1/7] hwmon: (it87) Allow disabling exiting of
 configuration mode
Message-ID: <20230129205647.GA1951466@roeck-us.net>
References: <20230128060308.1549707-1-frank@crawford.emu.id.au>
 <20230128060308.1549707-2-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230128060308.1549707-2-frank@crawford.emu.id.au>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Jan 28, 2023 at 05:03:02PM +1100, Frank Crawford wrote:
> Disabling configuration mode on some chips can result in system
> hang-ups and access failures to the Super-IO chip at the
> second SIO address. Never exit configuration mode on these
> chips to avoid the problem.
> 
> This patch should be applied in conjunction with a previous one to
> initialise the second chip for certain mother boards.
> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
> ---
> 
> v3:
>  * Correct possible uninitialised pointer issue.
> 
> v2:
>  * Convert to use feature flag and related macros rather than a separate
>    field, as suggested in review.
>  * Reverse sense of flag in superio_exit to simplify feature macro.
> 
> ---
>  drivers/hwmon/it87.c | 26 ++++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index a8a6a0ffee82..923a9563be92 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -128,10 +128,12 @@ static inline int superio_enter(int ioreg)
>  	return 0;
>  }
>  
> -static inline void superio_exit(int ioreg)
> +static inline void superio_exit(int ioreg, bool noexit)
>  {
> -	outb(0x02, ioreg);
> -	outb(0x02, ioreg + 1);
> +	if (!noexit) {
> +		outb(0x02, ioreg);
> +		outb(0x02, ioreg + 1);
> +	}
>  	release_region(ioreg, 2);
>  }
>  
> @@ -300,6 +302,13 @@ struct it87_devices {
>  #define FEAT_PWM_FREQ2		BIT(16)	/* Separate pwm freq 2 */
>  #define FEAT_SIX_TEMP		BIT(17)	/* Up to 6 temp sensors */
>  #define FEAT_VIN3_5V		BIT(18)	/* VIN3 connected to +5V */
> +/*
> + * Disabling configuration mode on some chips can result in system
> + * hang-ups and access failures to the Super-IO chip at the
> + * second SIO address. Never exit configuration mode on these
> + * chips to avoid the problem.
> + */
> +#define FEAT_CONF_NOEXIT	BIT(28)	/* Chip should not exit conf mode */

Feature bits are supposed to be numbered sequentially, not randomly
assigned. Please use bit 19.

>  
>  static const struct it87_devices it87_devices[] = {
>  	[it87] = {
> @@ -493,6 +502,7 @@ static const struct it87_devices it87_devices[] = {
>  #define has_pwm_freq2(data)	((data)->features & FEAT_PWM_FREQ2)
>  #define has_six_temp(data)	((data)->features & FEAT_SIX_TEMP)
>  #define has_vin3_5v(data)	((data)->features & FEAT_VIN3_5V)
> +#define has_conf_noexit(data)	((data)->features & FEAT_CONF_NOEXIT)
>  
>  struct it87_sio_data {
>  	int sioaddr;
> @@ -2404,7 +2414,7 @@ static int __init it87_find(int sioaddr, unsigned short *address,
>  {
>  	int err;
>  	u16 chip_type;
> -	const struct it87_devices *config;
> +	const struct it87_devices *config = NULL;
>  
>  	err = superio_enter(sioaddr);
>  	if (err)
> @@ -2489,6 +2499,8 @@ static int __init it87_find(int sioaddr, unsigned short *address,
>  		goto exit;
>  	}
>  
> +	config = &it87_devices[sio_data->type];
> +
>  	superio_select(sioaddr, PME);
>  	if (!(superio_inb(sioaddr, IT87_ACT_REG) & 0x01)) {
>  		pr_info("Device not activated, skipping\n");
> @@ -2508,8 +2520,6 @@ static int __init it87_find(int sioaddr, unsigned short *address,
>  		it87_devices[sio_data->type].suffix,
>  		*address, sio_data->revision);
>  
> -	config = &it87_devices[sio_data->type];
> -
>  	/* in7 (VSB or VCCH5V) is always internal on some chips */
>  	if (has_in7_internal(config))
>  		sio_data->internal |= BIT(1);
> @@ -2827,7 +2837,7 @@ static int __init it87_find(int sioaddr, unsigned short *address,
>  		sio_data->skip_pwm |= dmi_data->skip_pwm;
>  
>  exit:
> -	superio_exit(sioaddr);
> +	superio_exit(sioaddr, config ? has_conf_noexit(config) : false);

Nit: "config && has_conf_noexit(config)" would avoid the conditional code.

>  	return err;
>  }
>  
> @@ -3213,7 +3223,7 @@ static void it87_resume_sio(struct platform_device *pdev)
>  			     reg2c);
>  	}
>  
> -	superio_exit(data->sioaddr);
> +	superio_exit(data->sioaddr, has_conf_noexit(data));
>  }
>  
>  static int it87_resume(struct device *dev)
