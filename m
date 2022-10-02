Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FFB3C433FE
	for <linux-hwmon@archiver.kernel.org>; Sun,  2 Oct 2022 15:01:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbiJBPBv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 2 Oct 2022 11:01:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbiJBPBu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 2 Oct 2022 11:01:50 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20C322B638
        for <linux-hwmon@vger.kernel.org>; Sun,  2 Oct 2022 08:01:49 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id gf8so5415363pjb.5
        for <linux-hwmon@vger.kernel.org>; Sun, 02 Oct 2022 08:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=GyQ0gT3wrNoHntYDNZL9obMAwGH/4+OIJjhw06gQ+Yc=;
        b=bXv2Gf+Iy2Iv/iZA90cCMCTAcoqC45ZVLuoxSnlBLjfEImtIyGQe0FnBPsN6YU2AHX
         iy1T6EO3nnV9Q2sdg+k98Zkh9O8ayre1PggRN1765ttg5C5guQYW/MfLImG6T7k2/7GV
         YdLext8cW0lxDwGEe/anEASy9thJEvWueOQX7Jy+FA18/mYOBrF7+ZYMjpJP5R2k2wuv
         oe4duvCR3/BdtO3B9wqWRG1p/svyFqxs9gy80oKbUs8QRLlNIcsATLQbIDsO4Vp8CEHa
         sc0jQG1Oxmzsp45WIGCK3MhiEzdfFjCTeEppuF5Q7BTo71VTc2zeh9Hk2aXTVpKJZfZp
         e8Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date;
        bh=GyQ0gT3wrNoHntYDNZL9obMAwGH/4+OIJjhw06gQ+Yc=;
        b=cgbzK+YBYn3/i9qwmQwzS7WEXQyubbtvBDfpThpWq3WBZpImRrf3RSlmgP1Lir9nb9
         HrX7Lam7XjlaWx2mdIXdvzvQ1uYAcGsA2J2rnoSTE3qgtgt4/vRyKA6csQxL9bTTbZHq
         qWWqdNUdkTrVsUKxkySh1wt/q99HpauGlwvQjVab5Q0YKkrxbDmxmieZLX/2Aqjbla/k
         vEyMVptPvI+PFEc2gbFqxqlTiF58k9te8tSz675jYtQVFpQqsuzIhX9T76BOiuq5s/t/
         mtklozrt9RSN7oLASrCFP/sXuaWscjJz4esWbd8fskTTdT4WaVw61lb65jytFnrh778S
         hK8A==
X-Gm-Message-State: ACrzQf36ccV/xeiL2PIMt/TWhF1itEg1Ddy4xXV5hkiKMLiwG/w2qYwJ
        mSuKv17ulrN080UmPiAg9oQ=
X-Google-Smtp-Source: AMsMyM55HCRZWJFA5hsOtM+3Mv+5r+PIcP/t7z8MdWsQpvvdprYqq0g0+Fv1YLXPpBsa9io+JA0BmA==
X-Received: by 2002:a17:90b:4a91:b0:202:59ed:94d5 with SMTP id lp17-20020a17090b4a9100b0020259ed94d5mr7636071pjb.213.1664722908539;
        Sun, 02 Oct 2022 08:01:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f5-20020aa79685000000b0053e22c7f135sm5675457pfk.141.2022.10.02.08.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Oct 2022 08:01:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 2 Oct 2022 08:01:45 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Zeng Heng <zengheng4@huawei.com>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org, liwei391@huawei.com
Subject: Re: [PATCH -next] hwmon: (nct6683) remove unused variable in
 nct6683_create_attr_group
Message-ID: <20221002150145.GA2895775@roeck-us.net>
References: <20220927114352.2498079-1-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220927114352.2498079-1-zengheng4@huawei.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Sep 27, 2022 at 07:43:52PM +0800, Zeng Heng wrote:
> When enable 'unused-but-set-variable' compile
> warning option, it would raise warning as below:
> 
> drivers/hwmon/nct6683.c:415:9:
> warning: variable 'j' set but not used [-Wunused-but-set-variable]
> 
> Variable 'j' in nct6683_create_attr_group is unused,
> so remove it and simplify the 'for' loop.
> 
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/nct6683.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
> index 6a9f420e7d32..a872f783e9cc 100644
> --- a/drivers/hwmon/nct6683.c
> +++ b/drivers/hwmon/nct6683.c
> @@ -412,7 +412,7 @@ nct6683_create_attr_group(struct device *dev,
>  	struct sensor_device_attr_u *su;
>  	struct attribute_group *group;
>  	struct attribute **attrs;
> -	int i, j, count;
> +	int i, count;
>  
>  	if (repeat <= 0)
>  		return ERR_PTR(-EINVAL);
> @@ -443,7 +443,7 @@ nct6683_create_attr_group(struct device *dev,
>  
>  	for (i = 0; i < repeat; i++) {
>  		t = tg->templates;
> -		for (j = 0; *t != NULL; j++) {
> +		while (*t) {
>  			snprintf(su->name, sizeof(su->name),
>  				 (*t)->dev_attr.attr.name, tg->base + i);
>  			if ((*t)->s2) {
