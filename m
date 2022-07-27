Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE44C19F21
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Jul 2022 03:17:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240313AbiG0DRg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 26 Jul 2022 23:17:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240303AbiG0DRU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 Jul 2022 23:17:20 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 901113DBDE
        for <linux-hwmon@vger.kernel.org>; Tue, 26 Jul 2022 20:17:19 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id i4so9396689oif.2
        for <linux-hwmon@vger.kernel.org>; Tue, 26 Jul 2022 20:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Y/P14HDEuPtfGyQyACbXKlziRq+bgCk0xQ2fX5DFeIU=;
        b=EPeQdC20zWtkuRuQ29ntbzNK9JTMj6YW2b1Mo2c2LA9uU9eoI7bFR65uoqXbb5Obil
         3FPp0Lqowqky+UvGwqOgEPL7NASWboKVdPKSQDySHr7sl+X8N5pTKdkIqV4q6EHHjgAZ
         68wlQe1Ko2oMsElh6Onnsfa9ruBHOGhpydN3gtT0fobKXEbYZ5hcBpkG9NMfFN1U4olk
         kWxa+JO9T0zqCvyYL5KNJeektToyRcwgPfpikpc5RifLr9BVbH6qakJe8psypfmnKwio
         yv3rVr/e3KNfZ82jLoXN8J7u3nxe7IUswLkE+t2ANN1LPZs6DvpWVcea4mPBTU0u1Hdx
         e+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=Y/P14HDEuPtfGyQyACbXKlziRq+bgCk0xQ2fX5DFeIU=;
        b=6tiLryHw9YUQqJmxgcrQ7NQNrdjHTLYDo9M5NZ9apfm3m9J4J06O75xxJ8IG9dT/KL
         U1MzyGLxF+6aTLpiLUG4T7q/pjsDulm6g1wuDvpdo9/XS802BrgTQOHAuEjMzzn/ZBH2
         D6Yd2Q819O/Kv+ezsZaOtK9oMaFNoVRWMl5BuzQlPI8L5stESWTgSs00AIbsVQtvVjV+
         0WID9fuN8r4M13pTgXdWM5w0ixK0Hd4n7712uCbwNjZIEbRlfULmENeNfGL/GIsHZ720
         kYCDct8nP2wLoIvcdZ/X136rRxclMHUFcMQ08/ZM1gyUPorvMP2pjZ8QMvpnKxVofcxQ
         5Njg==
X-Gm-Message-State: AJIora8sq1VntMpPyhrugh3jiX1ktXGWmJ4y+d1NfZfEVqR/UZWOmkKc
        L9UVD0GYFfmrKpvUC1t1KyY=
X-Google-Smtp-Source: AGRyM1sGKNaZ4nOWWQgWvcmMbNGepnBeTbMG/VUyBCfIVxr1jaI8PMsNU580jDC58M0BKRoGx89GzA==
X-Received: by 2002:a05:6808:1b1f:b0:33a:df99:4616 with SMTP id bx31-20020a0568081b1f00b0033adf994616mr979234oib.289.1658891838852;
        Tue, 26 Jul 2022 20:17:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id cz16-20020a056870649000b0010c17e6c699sm8382644oab.47.2022.07.26.20.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 20:17:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 26 Jul 2022 20:17:15 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Robert Schmidt <r-schmidt@web.de>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (nct6775) add ASUS TUF GAMING B550-PLUS WIFI II
Message-ID: <20220727031715.GA2012317@roeck-us.net>
References: <YuBZodZHOnDll5zy@hydra>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YuBZodZHOnDll5zy@hydra>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jul 26, 2022 at 11:16:17PM +0200, Robert Schmidt wrote:
> Add ASUS TUF GAMING B550-PLUS WIFI II to the WMI monitoring list
> to enable support for HW monitoring on that board.
> 
> Signed-off-by: Robert Schmidt <r-schmidt@web.de>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/nct6775-platform.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> --
> 2.35.1
> 
> diff --git a/drivers/hwmon/nct6775-platform.c b/drivers/hwmon/nct6775-platform.c
> index 6d46c9401898..adc9be817130 100644
> --- a/drivers/hwmon/nct6775-platform.c
> +++ b/drivers/hwmon/nct6775-platform.c
> @@ -1083,6 +1083,7 @@ static const char * const asus_wmi_boards[] = {
>  	"TUF GAMING B550M-PLUS",
>  	"TUF GAMING B550M-PLUS (WI-FI)",
>  	"TUF GAMING B550-PLUS",
> +	"TUF GAMING B550-PLUS WIFI II",
>  	"TUF GAMING B550-PRO",
>  	"TUF GAMING X570-PLUS",
>  	"TUF GAMING X570-PLUS (WI-FI)",
