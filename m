Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A65DEC433E9
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Feb 2021 18:36:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 711AB64EC2
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Feb 2021 18:36:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233196AbhBISfl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Feb 2021 13:35:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233401AbhBISYq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Feb 2021 13:24:46 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BECA8C06121F;
        Tue,  9 Feb 2021 10:13:01 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id d20so20384236oiw.10;
        Tue, 09 Feb 2021 10:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oa6DIBlUBDjgLjl7fKLR0bNKD9fvWJxSjDvRdBN8rNs=;
        b=RJmjruDbCmhPnGCXvObmynJVXh1yxk7CBtbLPrpQEXxqGNgxi1luf7EP/q4LQtX+j8
         fcXzc7Ppxwftg8R4Lqg+kOXTgLoKUWeinEXw52irLwN1PCLe7+xEPQbrZ+rM2nk8JbdJ
         gVRBYjXxw5whBcdjicCbPmEnB2x6ms/FPvpz3t3uxkN3rPZRO7aEl7UJgNK68DYpVXDZ
         9bIaTcqhtPAFDjK6OXy9SYTcuNiJlaxwMpXZ2SeRcLJ94doUqVMrGKv35ELa4M9IlHOL
         hskQUl7eHDoMuxEMgvDYzlnBK9PthdgcwOtSyG0tviphcUcYBCDekRyVQ20rj+1NneaF
         AD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=oa6DIBlUBDjgLjl7fKLR0bNKD9fvWJxSjDvRdBN8rNs=;
        b=j4yDRXeaiNbFs31osZKRZ+JjGJDGAirCd/M5vfJEbBW2bCh40QwC3XXlBIZUt4aaa4
         h6LwuSlNQH85UHP7HGumpJzU/uS0qbeZxSA07XsJq1gFsPtXRFVzwMjApJ+0jD9ahiHb
         gu3Q7wXhXYC0y04IYkUkMOsdDkQKoPyvVStgqhfF4dxFttrY3Ymo8U1ReGhuMGG/uSNp
         5BNpUQ164eMkRb/wkt59Z0dlM4zeXdcMGALkaeS/Dy43Wpv8kxznz8kWDh8FNxu5F29/
         n+ERRK4ny0L4VlTKMN0TqiqQvYlNtbEfwZ1E+PzAR/Y2XLOlOfH/9Yd9hyFD68UirMG4
         TR9Q==
X-Gm-Message-State: AOAM5302Ztx2HmoZYvsFbeNMphK5m/o3N//7IT7L7jaQyUam5zvSB9RW
        f5n/QTkKVgB2b/S0Os8vMQkf1vzGu/0=
X-Google-Smtp-Source: ABdhPJwBs8uqKWKjyg3tFGRyqCiOBygH3sD2GheG1zUroFxQ3azgE2HwLzZ1SPbtDfwc3JCleHzSMQ==
X-Received: by 2002:a05:6808:1c5:: with SMTP id x5mr3281063oic.160.1612894381280;
        Tue, 09 Feb 2021 10:13:01 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m10sm4502608oim.42.2021.02.09.10.13.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Feb 2021 10:13:00 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 9 Feb 2021 10:12:59 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Eddie James <eajames@linux.ibm.com>
Cc:     linux-hwmon@vger.kernel.org, linux-fsi@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, jk@ozlabs.org, joel@jms.id.au,
        alistair@popple.id.au, jdelvare@suse.com
Subject: Re: [PATCH 4/4] hwmon: (occ) Print response status in first poll
 error message
Message-ID: <20210209181259.GF142661@roeck-us.net>
References: <20210209171235.20624-1-eajames@linux.ibm.com>
 <20210209171235.20624-5-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210209171235.20624-5-eajames@linux.ibm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Feb 09, 2021 at 11:12:35AM -0600, Eddie James wrote:
> In order to better debug problems starting up the driver, print
> the response status from the OCC in the error logged when the first
> poll command fails.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/hwmon/occ/common.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> index ee0c5d12dfdf..f71d62b57468 100644
> --- a/drivers/hwmon/occ/common.c
> +++ b/drivers/hwmon/occ/common.c
> @@ -1161,8 +1161,9 @@ int occ_setup(struct occ *occ, const char *name)
>  		dev_info(occ->bus_dev, "host is not ready\n");
>  		return rc;
>  	} else if (rc < 0) {
> -		dev_err(occ->bus_dev, "failed to get OCC poll response: %d\n",
> -			rc);
> +		dev_err(occ->bus_dev,
> +			"failed to get OCC poll response=%02x: %d\n",
> +			occ->resp.return_status, rc);
>  		return rc;
>  	}
>  
> -- 
> 2.27.0
> 
