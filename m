Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DDE2C6FD1D
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Mar 2023 15:02:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231495AbjCUPCa (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 21 Mar 2023 11:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231265AbjCUPC3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Mar 2023 11:02:29 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94D7E4FF12
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Mar 2023 08:02:28 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id i19so8233001ila.10
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Mar 2023 08:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679410948;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1uuN65SIjM8S4gfvUV5NCJl7fznyVaxh1cWVPeTsZSc=;
        b=oDM5VcR/VedynO/CXHi3FZvH0J4cgk7YP+qTuDq9b5uAJP9h/TE/SL5kT19NCiu6Q+
         u3PpaWb0RdGcMTTP/eXtigi49vBNWALZRSwKwFdMFCEeknX+CPthSR5+VJwX+OZOAJMu
         RVSdWLtbgcMiNSFjG6h6UUn5ecX26MTLSyiIpEtsbbgo3He8YK9raknmb8mHkxnKONng
         IjS4cr5l6phSXzP/Rl+hU2kOP/Ypzqlp4W5vOB4NxnDRJejhGgJCl0SE2Y99QLMKGkQq
         1UcDWzTbm1hKElNuR/NHh3laAiLytaWxMiuRMdtH5TQcNOOOcwJOvl1wwZDVWIarithM
         iepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679410948;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1uuN65SIjM8S4gfvUV5NCJl7fznyVaxh1cWVPeTsZSc=;
        b=aAitP2+N9fW87MRUs1wtvxuyRls9L8lZlYeqsQ60ZUtrRALidLX2QcrDmA9e8aUwLb
         GNAuvbG64NnPSJbZftA1JUhwx5y7zjBDO30LDzHEA/lTb7s7HmKJBf2YDRBifJoGNk3g
         VjYtm3SKHPg+UB5HQCTRv0yI3U9LgGqVi2zJ6K1UddMXSFJ9m1kCq8xpfMjtiznwADgv
         Vhl9v3epwrE3A/tizVYrVB+Pyb8GyShY42jeZ3UQjFIV4DuTzlpFY5x4+rdJePjsKjyi
         pWX9hzju0dn3r0mVm/nFIanYoCOkP1ousGXGsbfPK3nk/PSXuIXIvKJqN2ZNu9dU2KYd
         +FaQ==
X-Gm-Message-State: AO0yUKVhM+Pw7tEegkvqrfZ+/kzxTDT1wQpcO1tJCX2Cne884PT3wT3Y
        6kTZtaTbOZSOR99voyIiZ0KrFdrsXv8=
X-Google-Smtp-Source: AK7set/cGl1RPg7PZHF9mWYuVh7h4MNAWyJjuEATylbLrZfw0z7/YR0eTHGkVVxYvTRD2GvKQNoMDQ==
X-Received: by 2002:a92:d90b:0:b0:322:f272:30d2 with SMTP id s11-20020a92d90b000000b00322f27230d2mr1541352iln.4.1679410947869;
        Tue, 21 Mar 2023 08:02:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y3-20020a929503000000b00315972e90a2sm3644188ilh.64.2023.03.21.08.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 08:02:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 21 Mar 2023 08:02:26 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon (it87): Generalise matching labels
Message-ID: <99537fd9-2c3d-4442-9a83-b78cf5457f82@roeck-us.net>
References: <20230318080543.1226700-1-frank@crawford.emu.id.au>
 <20230318080543.1226700-3-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230318080543.1226700-3-frank@crawford.emu.id.au>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Mar 18, 2023 at 07:05:43PM +1100, Frank Crawford wrote:
> Apply scaling macro to match the labels for internal voltage sensors.
> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>

Applied. Please note that I updated the subject because "Generalise
matching labels" didn't really describe what the patch is doing.

> ---
> 
> v2:
>  * Split out the change to match labels to a separate patch.
> 
> ---
>  drivers/hwmon/it87.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index e9614eb557d4..f774a0732a7c 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -2004,7 +2004,7 @@ static ssize_t show_label(struct device *dev, struct device_attribute *attr,
>  
>  	if (has_vin3_5v(data) && nr == 0)
>  		label = labels[0];
> -	else if (has_12mv_adc(data) || has_10_9mv_adc(data))
> +	else if (has_scaling(data))
>  		label = labels_it8721[nr];
>  	else
>  		label = labels[nr];
