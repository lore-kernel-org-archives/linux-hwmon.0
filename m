Return-Path: <SRS0=0msx=BA=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDD5AC433E1
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Jul 2020 13:53:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9AB0A20771
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Jul 2020 13:53:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q+cjUK9J"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbgGUNxD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 21 Jul 2020 09:53:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbgGUNxD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Jul 2020 09:53:03 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED4A2C061794
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2020 06:53:02 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id o13so11991424pgf.0
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2020 06:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9OXVlLaChlap/QTgTsJC7nmHvLeaJ0xmB0eb8ugQzxs=;
        b=q+cjUK9JB8+wHB61kMpvHVdE4VYzi5NUtg9heNGJgoh0wcaRFCzbevGPULTRL/XrbJ
         kEl6FILv9AeCN5Mt7rLxr4hQ+JuNnZZTXtwWjYxuyoyyi9f2aIi9q/De59BHZodyKLQm
         CAYP2m66fVdJqCEuWVADFjpnHPFi309y0NnxuaXM6mqwPSlLqtaKmtfM1R/M96mdny9p
         JVNtRZjkEUTz8oXMaQySGtu0ytuIL/g1BKEAXnyOOVaZ+qIGTk9s11Arkch+NVQQS9Ui
         v79/S90IufadFczDFynKfowl5CHOws6dygFWx859ZvRdnhuAM8R3xGWyBGHaG2sJI+1D
         xaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=9OXVlLaChlap/QTgTsJC7nmHvLeaJ0xmB0eb8ugQzxs=;
        b=MLvypHuxsCmHFfw6M/1+/7fmoHBS2jv17cBy9b3lrd6rLxmsQrca5FdjSKc5Zqz9u1
         J2sU+zj3Ytj+wHlxD/djMbj3uEsSC08SqMCwkZQ852nyqB+Lpd4dhm0KC+p8HlTXVv47
         LrnaSL8KLEskUFmXhpmIc895H0ZCMnxq0XcguPftobreLUjyAmwzHO2m0B2ZDWtlbBQU
         /PiyfmHyPbzgwhP2Vy2otdnS0tnyhuu5/gOawzMRbn+RGf0ei1hEszDep3sX2Vymppit
         zkX7L9jUu2lJ47VPoZiD7kQL5RdtQ6+1I6Q/BWnOnQFdf/p2GQswhYQLZSJij5oFPV+v
         PbIg==
X-Gm-Message-State: AOAM533wTcT2T37/ZQcEpGVzasYH+xFg+zdm4uu/FBsksJMOctcM29QF
        j+i3Tp3Q+AgWcoJpVM1/aeYbKFfW
X-Google-Smtp-Source: ABdhPJzgbG2GNPa7N6eRRnb5qyPhcFJdBOuuuoLDCefO8tfk+mJk55MlHstMMOcBTyUDKlNfOYCpUw==
X-Received: by 2002:a63:7c5:: with SMTP id 188mr23384870pgh.48.1595339582442;
        Tue, 21 Jul 2020 06:53:02 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t137sm18944724pgc.32.2020.07.21.06.53.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jul 2020 06:53:01 -0700 (PDT)
Date:   Tue, 21 Jul 2020 06:53:00 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Hulk Robot <hulkci@huawei.com>, Jean Delvare <jdelvare@suse.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH -next] hwmon: sparx5: Make symbol 's5_temp_match' static
Message-ID: <20200721135300.GA151560@roeck-us.net>
References: <20200721134919.34033-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721134919.34033-1-weiyongjun1@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jul 21, 2020 at 09:49:19PM +0800, Wei Yongjun wrote:
> The sparse tool complains as follows:
> 
> drivers/hwmon/sparx5-temp.c:150:27: warning:
>  symbol 's5_temp_match' was not declared. Should it be static?
> 
> This variable is not used outside of sparx5-temp.c, this commit
> marks it static.
> 
> Fixes: c2cb4b5777e1 ("hwmon: sparx5: Add Sparx5 SoC temperature driver")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/sparx5-temp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/sparx5-temp.c b/drivers/hwmon/sparx5-temp.c
> index 7d7a060259a8..1a2b1026b026 100644
> --- a/drivers/hwmon/sparx5-temp.c
> +++ b/drivers/hwmon/sparx5-temp.c
> @@ -147,7 +147,7 @@ static int s5_temp_probe(struct platform_device *pdev)
>  	return PTR_ERR_OR_ZERO(hwmon_dev);
>  }
>  
> -const struct of_device_id s5_temp_match[] = {
> +static const struct of_device_id s5_temp_match[] = {
>  	{ .compatible = "microchip,sparx5-temp" },
>  	{},
>  };
