Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1077C4361B
	for <linux-hwmon@archiver.kernel.org>; Wed, 16 Dec 2020 16:33:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C7132339E
	for <linux-hwmon@archiver.kernel.org>; Wed, 16 Dec 2020 16:33:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbgLPQdu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 16 Dec 2020 11:33:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbgLPQdt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 16 Dec 2020 11:33:49 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B284C061794;
        Wed, 16 Dec 2020 08:33:09 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id f132so28121251oib.12;
        Wed, 16 Dec 2020 08:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NrC+AwFlpb77u/07yhvwT59vn9jfKlYeR6xv1LL3xY0=;
        b=WNRcgSt2Bqg/TQCZv1ZGUfKRD+768BXLBmrIvoX8JehcQW7ZqeAZYhwWRGuIPPClSv
         lK9xbPkIyAmhZGFZpO1oMaZqTKrRWXKZSPk7Ny+ozG70lIG7uNW6LphDbi0huTIzF+tT
         NqNLassACNaFNuV4TgmcCKHAWAUyMNrmmnmxPnRfYsa14usb1wRd/RHe89KbD3LEFCdI
         0rNwTaBYv4EK/SB+NcuFVCiSp0oQMogRFN26rDlVytO84PS0h8Qfjky7hMrSlN7GOLbE
         X1amwdnJzBlhc/b81KvCzXXLMhuR1kgiB04q9KN21yMPp1uZR1U6kLW+cLZX2Y/dupkM
         MsMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=NrC+AwFlpb77u/07yhvwT59vn9jfKlYeR6xv1LL3xY0=;
        b=ngk2fMn3H4IKZ7e7pXHf2ZPsKLJOlcj21BaSYhQ/1E/lyYsGbAyOGcPAzKYlMKCryj
         RFmNVSjgWLWeRh0rHzk6sJn8WgQq9U4p+lMxNCVCODgNfPrz3C3czAEi/zh1BNHNe3XN
         xF5Nbk3UOAsdSRne8YEqT1e989zS/iKjj7DTe/tE4CFQr1HkRJvdxNcuwkHmQqpuwFKd
         bEyEvDLbaolEGycXTZ08dFwe6tcQhz4B0DBSOLgSoaQazfEoAfdVbN/yddB10avE4f55
         i3FmpH9sHEhVTbQufxFaqwODqE3f+r6jP5W7UAsWCvvsD2pWX+zlIK3URVR+jnWuviD7
         1bBw==
X-Gm-Message-State: AOAM530k+H9NkdWW54fpN/F6MnQcizxH2H1x5SrsZg2BTfiocKWFjjnw
        wVEo55ECKBhLx/U1ZP5xlUD2Ld+mMZw=
X-Google-Smtp-Source: ABdhPJwdr965CDa97FvKZimRRUefdbt4WmAypsUkiPpDOs53RL6zxxCotSvhkaDs8KmOyBMlHhrHxQ==
X-Received: by 2002:aca:b657:: with SMTP id g84mr2477387oif.86.1608136388931;
        Wed, 16 Dec 2020 08:33:08 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s189sm493156oia.7.2020.12.16.08.33.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Dec 2020 08:33:08 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 16 Dec 2020 08:33:07 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     jim.cromie@gmail.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] hwmon/pc87360: convert comma to semicolon
Message-ID: <20201216163307.GA59684@roeck-us.net>
References: <20201214133114.3516-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201214133114.3516-1-zhengyongjun3@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Dec 14, 2020 at 09:31:14PM +0800, Zheng Yongjun wrote:
> Replace a comma between expression statements by a semicolon.
> 
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/pc87360.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/pc87360.c b/drivers/hwmon/pc87360.c
> index 94f4b8b4a2ba..6a9ba23cd302 100644
> --- a/drivers/hwmon/pc87360.c
> +++ b/drivers/hwmon/pc87360.c
> @@ -1700,8 +1700,8 @@ static int __init pc87360_device_add(unsigned short address)
>  			continue;
>  		res[res_count].start = extra_isa[i];
>  		res[res_count].end = extra_isa[i] + PC87360_EXTENT - 1;
> -		res[res_count].name = "pc87360",
> -		res[res_count].flags = IORESOURCE_IO,
> +		res[res_count].name = "pc87360";
> +		res[res_count].flags = IORESOURCE_IO;
>  
>  		err = acpi_check_resource_conflict(&res[res_count]);
>  		if (err)
