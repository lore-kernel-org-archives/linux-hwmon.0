Return-Path: <SRS0=Zrk+=AG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E62EEC433E0
	for <linux-hwmon@archiver.kernel.org>; Thu, 25 Jun 2020 13:51:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD41A206A1
	for <linux-hwmon@archiver.kernel.org>; Thu, 25 Jun 2020 13:51:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WbKZc2cg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405146AbgFYNvJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 25 Jun 2020 09:51:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404803AbgFYNvI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 25 Jun 2020 09:51:08 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DDFCC08C5C1
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Jun 2020 06:51:09 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id d10so2816845pls.5
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Jun 2020 06:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hqOH2L2B9qeOnppOE4QUvHpg8ocWhv6eYwrdCblwbPI=;
        b=WbKZc2cgHOvPbiaDNnZZSoanJTtmIr0HmjNiQon6Kh2lF1EPQb3ZBanVxk/FSeUbsi
         Iw/YJSN3pMPdZpo9HlhyO7X2PZscAocfe8rKZgswbLVINirhO12XSaZUnYpUL+r+AnpK
         RhP2aNQnAwQOI50tyCaoSlWIAp3OlJ1V8SzT9FY5LqgUUP0aQPEKKzTAm8l42NaiCerN
         tnFUfVrSXyvZo+hR1vG42jOSuOA4+MH8IyJ/zltAzn7++K6r33FGRwZbuUTVFqSQXyJf
         7bGiOuvJvUx0GXukhnJ8OXbf07NxcrHbZBkqCQbgNbcWHIsjhJGTLvPFhFac/WuN/NqP
         3HSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=hqOH2L2B9qeOnppOE4QUvHpg8ocWhv6eYwrdCblwbPI=;
        b=RZyDnH/yfBsxt0iuFaySfHpapF/AH0/IaCZHHuR4DfOXWx9Fzn4rkwtuOXjfyOBhA4
         O0Jyq4Ic22fvpO4GAe6mIQRvOXm/m05sQBeYw4Afdn6Na94WCHQYdnBVuY+oHMXYidWK
         KkJY/xLsqiFJIzPJVPn9LYRI6iAss60AInPqFoksKxDWy98tuHQ01osEHFhunpjYdXcC
         2OYeNuf60Y6sVj28SP1M6gZ1ogAAvIDqKYUssgqp3jm/f/LSkqsmb4n0AdWx2/B8VXsN
         HqRNQI5SIgr7MpMc8YppgLzbnG/KE0Cukmz4rvgupPHARkLjLFOwZCT8kjvrVWkneuYp
         Q8Uw==
X-Gm-Message-State: AOAM530TFXRaQfRxbnKKN2GnAcpjxC6fiJ0pkp59JUDx3NTy8VM1jl5g
        +2f6AfvuljawgNY89Rs0gbsF+IHY
X-Google-Smtp-Source: ABdhPJx60z/rqm3i89hK5y9ilkbx9M1H9qjqZU9hZfEu0FcO91EAo7HNHS98B0PkMzg2Bd6XgNsE9w==
X-Received: by 2002:a17:90b:143:: with SMTP id em3mr3494242pjb.92.1593093068750;
        Thu, 25 Jun 2020 06:51:08 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s15sm8161334pfm.129.2020.06.25.06.51.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 06:51:08 -0700 (PDT)
Date:   Thu, 25 Jun 2020 06:51:07 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (acpi_power_meter) Fix potential memory leak in
 acpi_power_meter_add()
Message-ID: <20200625135107.GA128565@roeck-us.net>
References: <20200625043242.31175-1-misono.tomohiro@jp.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200625043242.31175-1-misono.tomohiro@jp.fujitsu.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Jun 25, 2020 at 01:32:42PM +0900, Misono Tomohiro wrote:
> Although it rarely happens, we should call free_capabilities()
> if error happens after read_capabilities() to free allocated strings.
> 
> Fixes: commit de584afa5e188 ("hwmon driver for ACPI 4.0 power meters")
> Signed-off-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/acpi_power_meter.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
> index 0db8ef4fd6e1..a270b975e90b 100644
> --- a/drivers/hwmon/acpi_power_meter.c
> +++ b/drivers/hwmon/acpi_power_meter.c
> @@ -883,7 +883,7 @@ static int acpi_power_meter_add(struct acpi_device *device)
>  
>  	res = setup_attrs(resource);
>  	if (res)
> -		goto exit_free;
> +		goto exit_free_capability;
>  
>  	resource->hwmon_dev = hwmon_device_register(&device->dev);
>  	if (IS_ERR(resource->hwmon_dev)) {
> @@ -896,6 +896,8 @@ static int acpi_power_meter_add(struct acpi_device *device)
>  
>  exit_remove:
>  	remove_attrs(resource);
> +exit_free_capability:
> +	free_capabilities(resource);
>  exit_free:
>  	kfree(resource);
>  exit:
