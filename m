Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64406C4332F
	for <linux-hwmon@archiver.kernel.org>; Fri, 25 Nov 2022 15:48:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbiKYPsL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 25 Nov 2022 10:48:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbiKYPsK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 25 Nov 2022 10:48:10 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C82521928E
        for <linux-hwmon@vger.kernel.org>; Fri, 25 Nov 2022 07:48:09 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id h132so4799582oif.2
        for <linux-hwmon@vger.kernel.org>; Fri, 25 Nov 2022 07:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aJNXoyDWcRP+S8EgW9XuaOi1JwqjEQirr26fBk5EB20=;
        b=BbTw8XUQ04qaOfei+i6CKGJp6R6l+/9tKkavT3YeAwW8nQ6TsbjMhRE9jPTmyeLmRu
         jaG9tyYRSPIQQeyKCEax9f61CSf5G8ZJMyw6ouj+NNi7MDkkWYSFuQ6zKlKeoQTGup2w
         MSYnCpP1P9bliTTlGnUrWpnEaYTvss8bGYXRHj2uKmgEf6BJu3rxm447yHSJLsPaWaRw
         ThEjhP2PKqqffc8hiXCzOs1dSstPdXzBGUcKbyyVXFO+bchfbNKoUqkxHE/PXiOCxFXG
         XrEj1P0oZ1L6kqeVN1fGm54E/cVqvBGlWVlfwtHIMnPRFn3S1fxqcuQKDKg5NGHhzsvD
         n98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aJNXoyDWcRP+S8EgW9XuaOi1JwqjEQirr26fBk5EB20=;
        b=wRD+B0yvfzpNOG6tHrYtObkhQef5aJnXWR0Zy1xSBjoKiFppZSZSUxVxNfViIoYSW7
         iecqJuvd9tvIX6TYQgOcg31/tX0kc5txDomm+c/Dz5JxfObr/wd4UJn1jJ1deDmjLgvg
         OfESkT95//WZKdq4br/KTnGGCTbfJNT+2K8F1Tbtg7CHdpo7a06kzghvnfXM7ZHVyMm4
         AIGuQNtv0xbaovrc47pEL/7b03Nx1EuwY/YjGaUqKumYWqX0Jy0tNKbJkfpUGnxRBFKb
         Rn1EOk7fouN87ICWxGmRHHl6xcUPlQQCZ+LdpiwxGeoIUQGu1JQCNCYToTKx1h5yTs77
         TEzA==
X-Gm-Message-State: ANoB5pmNHSTWxlycG3DRgGrmKcIdX/ZhJJBw4d/rqX7zEVH4QJZkp35i
        qDvZPES/CxDhHLj1HyZb6FXuO6iih/k=
X-Google-Smtp-Source: AA0mqf504tfvV4YeGzPtbc7FsBx99jizhmWb3+rvw1L3urLmp1CXDJ/AHTY/N4ChO85sv80USLx9jA==
X-Received: by 2002:aca:906:0:b0:354:68aa:9c59 with SMTP id 6-20020aca0906000000b0035468aa9c59mr21067265oij.35.1669391289142;
        Fri, 25 Nov 2022 07:48:09 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u10-20020a0568301f4a00b0066c7733be43sm1746051oth.30.2022.11.25.07.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 07:48:08 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 25 Nov 2022 07:48:07 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Yuan Can <yuancan@huawei.com>
Cc:     eugene.shalygin@gmail.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) Add checks for devm_kcalloc
Message-ID: <20221125154807.GA1169711@roeck-us.net>
References: <20221125014329.121560-1-yuancan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221125014329.121560-1-yuancan@huawei.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Nov 25, 2022 at 01:43:29AM +0000, Yuan Can wrote:
> As the devm_kcalloc may return NULL, the return value needs to be checked
> to avoid NULL poineter dereference.
> 
> Fixes: d0ddfd241e57 ("hwmon: (asus-ec-sensors) add driver for ASUS EC")
> Signed-off-by: Yuan Can <yuancan@huawei.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/asus-ec-sensors.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
> index 81e688975c6a..a901e4e33d81 100644
> --- a/drivers/hwmon/asus-ec-sensors.c
> +++ b/drivers/hwmon/asus-ec-sensors.c
> @@ -938,6 +938,8 @@ static int asus_ec_probe(struct platform_device *pdev)
>  	ec_data->nr_sensors = hweight_long(ec_data->board_info->sensors);
>  	ec_data->sensors = devm_kcalloc(dev, ec_data->nr_sensors,
>  					sizeof(struct ec_sensor), GFP_KERNEL);
> +	if (!ec_data->sensors)
> +		return -ENOMEM;
>  
>  	status = setup_lock_data(dev);
>  	if (status) {
