Return-Path: <SRS0=GxSE=44=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FAKE_REPLY_C,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7778DC10F27
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 Mar 2020 15:09:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9096A206C0
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 Mar 2020 15:09:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bq9a47th"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729809AbgCKPJ5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 11 Mar 2020 11:09:57 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40716 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729805AbgCKPJ5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 Mar 2020 11:09:57 -0400
Received: by mail-pf1-f195.google.com with SMTP id l184so1503164pfl.7
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Mar 2020 08:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=SzPZSXP14NkzscV5DleAKzqm85L61ntsbY9ghopjt6s=;
        b=bq9a47th/jJJjrVJC91MGeBK1PCRiAt14iryhx6x0Hy9UzpvBla4OQoL1GBeyq4EOD
         Obvb2uFN6lEWduwJuOENsok15S10uzjq+xjDgfkHY7Eucl6PazIL78O3/T1yn919swwS
         /oqJknbXKvGmlyJ2RuS5/7vE1aVpuHuz1j0+8VOIIslhd2+co8SFLTIGslSKi55VyNYK
         p/JUvJPGOBbGojnB/rP2uI+UwNABZ3bmPaY4691cHFXfIFg+Geq26B4kZlY81pY8xOqK
         yJn4v+rXvOoiQRp1rAjsx17gehmSOZ8HkDRUht3lLamkHaWLhwU/H/8StUVMjmhMJ1Ii
         4Wow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition:user-agent;
        bh=SzPZSXP14NkzscV5DleAKzqm85L61ntsbY9ghopjt6s=;
        b=aLeC4BkpW53UBAo0UtTvGWagziQgAhGyuUHsQ7DPesVxPG4LYOvh95FRgaQsAxC1xN
         6whhsuGGLLpI+mbFeFV/NV68gRcfCf8fpmFq81fMx5xvFuI9IicqlPKz/fh8Z++AxYht
         5jnmQqVDmk2DdpSD+3ZW/JvZFWtaViA/KNZ0lYSmmuGlJwK8dWFc5dlWx3gzT8EMWKXN
         EjsXaW0rj58Jy2O0IY2wW0F9CUSO1yrUl99eZKPiYTWv0u78LWCDKl/7M37Rm0+0M2R2
         qwG2q0L+K0yXlKu7P3OiihBf8nEyxrT9vK+Bvgo500rM4XR+TwAJ9DNtfJPqrjPPxgKA
         8Z0g==
X-Gm-Message-State: ANhLgQ2YrZ6es++RTbaz0DQ88S3ssonzTbGQgREIKvPt+92hbQY0pXiJ
        AKuaU1RoyK4fMQqRTL908Is=
X-Google-Smtp-Source: ADFU+vvXQ6Wilrn2WD3lGYfIAEgqIS4ce+464O8gOZ5mvljOhED6km4oQ2CRFgQWVIuLYsLA/0EXvg==
X-Received: by 2002:a63:2:: with SMTP id 2mr3221746pga.102.1583939396321;
        Wed, 11 Mar 2020 08:09:56 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g5sm959149pfo.192.2020.03.11.08.09.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Mar 2020 08:09:55 -0700 (PDT)
Date:   Wed, 11 Mar 2020 08:09:54 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] hwmon: (ibmpowernv) Use scnprintf() for avoiding
 potential buffer overflow
Message-ID: <20200311150954.GA10207@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Mar 11, 2020 at 08:39:44AM +0100, Takashi Iwai wrote:
> Since snprintf() returns the would-be-output size instead of the
> actual output size, the succeeding calls may go beyond the given
> buffer limit.  Fix it by replacing with scnprintf().
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/ibmpowernv.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/ibmpowernv.c b/drivers/hwmon/ibmpowernv.c
> index 0e525cfbdfc5..a750647e66a4 100644
> --- a/drivers/hwmon/ibmpowernv.c
> +++ b/drivers/hwmon/ibmpowernv.c
> @@ -186,7 +186,7 @@ static void make_sensor_label(struct device_node *np,
>  	u32 id;
>  	size_t n;
>  
> -	n = snprintf(sdata->label, sizeof(sdata->label), "%s", label);
> +	n = scnprintf(sdata->label, sizeof(sdata->label), "%s", label);
>  
>  	/*
>  	 * Core temp pretty print
> @@ -199,11 +199,11 @@ static void make_sensor_label(struct device_node *np,
>  			 * The digital thermal sensors are associated
>  			 * with a core.
>  			 */
> -			n += snprintf(sdata->label + n,
> +			n += scnprintf(sdata->label + n,
>  				      sizeof(sdata->label) - n, " %d",
>  				      cpuid);
>  		else
> -			n += snprintf(sdata->label + n,
> +			n += scnprintf(sdata->label + n,
>  				      sizeof(sdata->label) - n, " phy%d", id);
>  	}
>  
> @@ -211,7 +211,7 @@ static void make_sensor_label(struct device_node *np,
>  	 * Membuffer pretty print
>  	 */
>  	if (!of_property_read_u32(np, "ibm,chip-id", &id))
> -		n += snprintf(sdata->label + n, sizeof(sdata->label) - n,
> +		n += scnprintf(sdata->label + n, sizeof(sdata->label) - n,
>  			      " %d", id & 0xffff);
>  }
>  
> -- 
> 2.16.4
> 
