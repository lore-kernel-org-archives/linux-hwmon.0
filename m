Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B01C48BCD
	for <linux-hwmon@archiver.kernel.org>; Wed,  9 Jun 2021 18:46:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B78A61182
	for <linux-hwmon@archiver.kernel.org>; Wed,  9 Jun 2021 18:46:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbhFISse (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 9 Jun 2021 14:48:34 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:41658 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbhFISse (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 9 Jun 2021 14:48:34 -0400
Received: by mail-ot1-f42.google.com with SMTP id 36-20020a9d0ba70000b02902e0a0a8fe36so24946966oth.8;
        Wed, 09 Jun 2021 11:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=p61mKAt1p/Ut0yjoZzGQebqB5nZdfeZ37MtaPp/DjKM=;
        b=NtA18dDo3vDzM4e7101MRwo2LdmZi7/KqvjvJ+q+j/VrOMCfNJ7CiLGOYIiKdTTxiS
         3BOXhubvsMUUi6+brrSkt8U4px3fk2OnGlwVhVfS5rqsiA9tPPQIn0QinCEaV1JGQPxJ
         2AQUJ4vFehId/N0T1RvDRrvoYqiHvw657BjyTTejCXFGiLO1A6qc8CHukhkW6gJvyeKp
         2G4T5YhHBDWyTofZLHVRxoGhh6G7TUYPcLklJbcFysxGJWL4Qz3SpS3+Z89y/gukMlv9
         7CxxWvSrFeXdkDwy41dBDSeHS0yNtDgjcPjGjK09LHtRUAdK/GzyluOrEj3bMvBX7wJL
         e91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition;
        bh=p61mKAt1p/Ut0yjoZzGQebqB5nZdfeZ37MtaPp/DjKM=;
        b=k3VcVEDBEUTvM3B8KzEivzb304DYs/qbwodjY9eRjBFkyq5V1t62x0BhuPbroidF8m
         0nP7/l2HWEs+DsczmJFcD3iEzhS0eAC2KdPXmZPWBMAcUuZGbgZ98CxEFGkvFMT6sc2x
         7LgIX0QVtXVIAxBal9t0lxCDVGQzDTp0nSDXy4cAuIzSMsQZKh2eLII9RKATtir8LNYy
         wFSsNYCQYhEFzJ/X1QoDo+c/kRY4vmLsFlssVna9kIt8WNNUIiYJpkUHKsLOyLuwMwXK
         PdJZHwMipxvI8xmfXLHOGqjiaJAivdzTtVUdU+a9Zr0Mh4bu/jiiSAtAVHDG4U3wX0co
         zABw==
X-Gm-Message-State: AOAM530dsM3XJnF3gkXyHEISUN2nCJQMKKsEcBxrqMCllkLr1kuJeWSf
        ws+8D8ATGQVAeThHg9xQT3Q=
X-Google-Smtp-Source: ABdhPJyZHghqFqWUpK2/aGn/5Ulp4o1MAl+skqdDfhHNvkaxe/DuGYLEuP2v4qaqcSlBJs9drcXq2A==
X-Received: by 2002:a9d:4614:: with SMTP id y20mr666514ote.323.1623264322805;
        Wed, 09 Jun 2021 11:45:22 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y16sm158296oto.60.2021.06.09.11.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 11:45:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 9 Jun 2021 11:45:20 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Erik Rosen <erik.rosen@metormote.com>
Cc:     Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/5] hwmon: (pmbus/pim4328) Add new pmbus flag
 NO_WRITE_PROTECT
Message-ID: <20210609184520.GA2531459@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Jun 09, 2021 at 11:32:05AM +0200, Erik Rosen wrote:
> Some PMBus chips respond with invalid data when reading the WRITE_PROTECT
> register. For such chips, this flag should be set so that the PMBus core
> driver doesn't use the WRITE_PROTECT command to determine its behavior.
> 
> Signed-off-by: Erik Rosen <erik.rosen@metormote.com>

Series applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/pmbus_core.c | 8 +++++---
>  include/linux/pmbus.h            | 9 +++++++++
>  2 files changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index bbd745178147..0579521b6c0a 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -2226,9 +2226,11 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
>  	 * faults, and we should not try it. Also, in that case, writes into
>  	 * limit registers need to be disabled.
>  	 */
> -	ret = i2c_smbus_read_byte_data(client, PMBUS_WRITE_PROTECT);
> -	if (ret > 0 && (ret & PB_WP_ANY))
> -		data->flags |= PMBUS_WRITE_PROTECTED | PMBUS_SKIP_STATUS_CHECK;
> +	if (!(data->flags & PMBUS_NO_WRITE_PROTECT)) {
> +		ret = i2c_smbus_read_byte_data(client, PMBUS_WRITE_PROTECT);
> +		if (ret > 0 && (ret & PB_WP_ANY))
> +			data->flags |= PMBUS_WRITE_PROTECTED | PMBUS_SKIP_STATUS_CHECK;
> +	}
>  
>  	if (data->info->pages)
>  		pmbus_clear_faults(client);
> diff --git a/include/linux/pmbus.h b/include/linux/pmbus.h
> index 12cbbf305969..86bacf57f8e9 100644
> --- a/include/linux/pmbus.h
> +++ b/include/linux/pmbus.h
> @@ -43,6 +43,15 @@
>   */
>  #define PMBUS_NO_CAPABILITY			BIT(2)
>  
> +/*
> + * PMBUS_NO_WRITE_PROTECT
> + *
> + * Some PMBus chips respond with invalid data when reading the WRITE_PROTECT
> + * register. For such chips, this flag should be set so that the PMBus core
> + * driver doesn't use the WRITE_PROTECT command to determine its behavior.
> + */
> +#define PMBUS_NO_WRITE_PROTECT			BIT(4)
> +
>  struct pmbus_platform_data {
>  	u32 flags;		/* Device specific flags */
>  
