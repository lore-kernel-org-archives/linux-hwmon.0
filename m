Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F4FC433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Jan 2022 16:51:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243611AbiANQvC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 14 Jan 2022 11:51:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243609AbiANQu6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Jan 2022 11:50:58 -0500
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F25ACC061574
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jan 2022 08:50:57 -0800 (PST)
Received: by mail-oo1-xc2e.google.com with SMTP id b15-20020a4a9bcf000000b002dc83a61053so2729459ook.1
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jan 2022 08:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2bupduGFwAstCARTbfaPu4ukW2CIHYhheesjdbwm4xM=;
        b=fFaPFRfwBTc5BycLCu64JyzBZ9apUfNcnfi9g3kDmzn6w92gPDJeeqjLR/ebKz3+NZ
         ncU9GX/+co6Wd/XZoCZ1KuShsyf5wGv4Bcmyv4ksMWf6WYGB9Sk7JYiTy98uVQP4A4+a
         AAPGLVGfgM1rtVjueXPKJJpwpgtDhDLKd3EPxKBDVVik0l2fsIh9HZC7hwFBmbXNSpyu
         6oILWQX8dkPep+CBcksTvcbt4wrnUVcRZAtmERWWSw6qGFeL4v4EVKWBiEZKukHxopsf
         HxPmLaRp7DUnoedet8AB3ney8LRT5VLors9ruXQOktEgojFMdOCopPFQrJ3MfCPlFxD0
         eSMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=2bupduGFwAstCARTbfaPu4ukW2CIHYhheesjdbwm4xM=;
        b=KsS8XoaJKu5KkLZWVsp60Y5rGkyXbO9oKvzg2NUxZUHoVpZnia/J5J+lAO+7pwYwEK
         PW6CSfA1mSYSMNRjs99xZSB6ID4P5/L0PeNJs1aCvnFzR66No6EMl4HBsDon5nu7QNcz
         v1ELfKMN0hHGlXICxh7Y603Ch0QxJhM+qWW92XxFfcrCL99jZrSqxMRl9RIvR6f+tVX5
         2Bp/aPJICXGoEyZ6OiG2WRdla/51YyOLmhcpO9cQUR/E4ewoCocWi1Qy//IYTgV1khz7
         5Ygpo2+aLcwB+CkiHS++U5m04Ln8rh3458qYn8ZDppjzcKSvFBuMWJVt2YieXsDKeFGx
         NOfQ==
X-Gm-Message-State: AOAM530d19Xu1+RZOa+fLfx7ZCOa9IhlnfY5QNDiTu3uNe5LvlT5y1hx
        WeGQv30C5aLwGGcf1Zcue5yC22Xlehk=
X-Google-Smtp-Source: ABdhPJykgkIw9UQP8+onvkeW96B5oR1n32XCbu3spV8Tp7r6+pxFPk0VNQ51NHfENQe8Jgdb2vRBHg==
X-Received: by 2002:a4a:b48d:: with SMTP id b13mr7108535ooo.37.1642179057007;
        Fri, 14 Jan 2022 08:50:57 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w13sm1827254otq.30.2022.01.14.08.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 08:50:56 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 14 Jan 2022 08:50:55 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (nct6775) add PRIME B550-PLUS motherboard to
 whitelist
Message-ID: <20220114165055.GA1553406@roeck-us.net>
References: <20220110024712.753492-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220110024712.753492-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jan 10, 2022 at 05:47:12AM +0300, Dmitry Baryshkov wrote:
> Asus PRIME B550-PLUS motherboards have got an nct6775 chip. Its resource
> range is covered by the \AMW0.SHWM OpRegion, so the chip is unusable
> when using SIO. However ASUS WMI access works.
> 
> Add PRIME B550-PLUS to the list of motherboards using ASUS WMI to read
> data.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/nct6775.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
> index fd3f91cb01c6..616728598b57 100644
> --- a/drivers/hwmon/nct6775.c
> +++ b/drivers/hwmon/nct6775.c
> @@ -4988,6 +4988,7 @@ static const char * const asus_wmi_boards[] = {
>  	"Pro WS X570-ACE",
>  	"PRIME B360-PLUS",
>  	"PRIME B460-PLUS",
> +	"PRIME B550-PLUS",
>  	"PRIME X570-PRO",
>  	"ROG CROSSHAIR VIII DARK HERO",
>  	"ROG CROSSHAIR VIII FORMULA",
