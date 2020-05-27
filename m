Return-Path: <SRS0=H3vz=7J=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D59C433DF
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 May 2020 03:25:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 644B12084C
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 May 2020 03:25:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SG8o27GO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728472AbgE0DZt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 26 May 2020 23:25:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgE0DZs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 May 2020 23:25:48 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9979EC061A0F;
        Tue, 26 May 2020 20:25:47 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id v63so11151785pfb.10;
        Tue, 26 May 2020 20:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+LoutGusB/DPRmQJ774sLiZdDOwxl2Urz+NIX0qJuGk=;
        b=SG8o27GOj8uGlIOjHmSbmkDbPXp9q2jD5zg+tjj9kWkRV66mAhxC/sO5mgNM7fdmUH
         0CMJa5/KJnAgjzog3jsp9eSoWKbDtsqss4qdtnkzLvVh+Zzw4jAKSXaFpjzUofqUi0dY
         I8xCNqO6gRs3sLPhy7KwgTD0oy2SdNWkYLahQja8HdvTkVYDXMOhxEzFm5EVwNlgpiMU
         mc+V7lcWPGuVjvdQlArigQLoSBZ2nvHYVlbkX+B6dQ5CYm0iyvXbgE9M/W4zO2Py/MFQ
         inE5iW6zJe5CcuZhsWUvm9lq7NjDvb+6QAMsdsLfbq1S5Tw0Ll3LXyXICRU8+mIGg6+E
         YXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=+LoutGusB/DPRmQJ774sLiZdDOwxl2Urz+NIX0qJuGk=;
        b=J28NkEhKtM9O1c55Vwki05txAm2hmwlOkYPN6CVSYYkpgYCzDQMh/orw3iTGeVvD1c
         VGwD2wkynBfVN93BHvimxLMxbFT/S0sLX+BWMH4hCcebHubQGYu5p1vPQ6QKc/2pYoXF
         fesYqpXQrtLez5XZZWazleACSSZSTwrX1UmHe2JRlDX5LpdU3nn71Pf77POSJWTLD/kB
         2UZjhU4wA25OSy3niTR1wO1haPHBX+Q86eAuO/75lUBZCNfHHGmxYEVnnTBj+JWsW9FH
         R3i8e1DCZDXMOuGiVZuofI2Di5QaKKjiHgOfwEJ1jE56+uuY2SfLXYEey2mxlFYuIOki
         SjmQ==
X-Gm-Message-State: AOAM533k95YLgG5uCRyZaoSVr5qQtGJ+VLOp1ZWwSl/lV6D2cBKcjAIQ
        OfGB/LGxGeuY9AN1LcgicjY=
X-Google-Smtp-Source: ABdhPJyL7/Ee2xG8f4YZQOo5SM6fDnvglKdX92dvDKXoNDVPGc1PO3DAs8c4RmF5mmJZsmNSaJAnMQ==
X-Received: by 2002:a63:c311:: with SMTP id c17mr1965284pgd.103.1590549947242;
        Tue, 26 May 2020 20:25:47 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u5sm750419pjv.54.2020.05.26.20.25.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 May 2020 20:25:46 -0700 (PDT)
Date:   Tue, 26 May 2020 20:25:45 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] hwmon: amd_energy: Missing
 platform_driver_unregister() on error in amd_energy_init()
Message-ID: <20200527032545.GA259122@roeck-us.net>
References: <20200527022417.105620-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527022417.105620-1-weiyongjun1@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, May 27, 2020 at 02:24:17AM +0000, Wei Yongjun wrote:
> Add the missing platform_driver_unregister() before return
> from amd_energy_init() in the error handling case.
> 
> Fixes: 8abee9566b7e ("hwmon: Add amd_energy driver to report energy counters")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Acked-by: Naveen krishna Chatradhi <nchatrad@amd.com>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/amd_energy.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
> index bc8b643a37d5..e95b7426106e 100644
> --- a/drivers/hwmon/amd_energy.c
> +++ b/drivers/hwmon/amd_energy.c
> @@ -379,8 +379,10 @@ static int __init amd_energy_init(void)
>  		return ret;
>  
>  	amd_energy_platdev = platform_device_alloc(DRVNAME, 0);
> -	if (!amd_energy_platdev)
> +	if (!amd_energy_platdev) {
> +		platform_driver_unregister(&amd_energy_driver);
>  		return -ENOMEM;
> +	}
>  
>  	ret = platform_device_add(amd_energy_platdev);
>  	if (ret) {
