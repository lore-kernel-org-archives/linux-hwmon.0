Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2D37FA3742
	for <linux-hwmon@archiver.kernel.org>; Thu, 27 Oct 2022 13:07:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235969AbiJ0NHL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 27 Oct 2022 09:07:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235542AbiJ0NHH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Oct 2022 09:07:07 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E644410DE43
        for <linux-hwmon@vger.kernel.org>; Thu, 27 Oct 2022 06:07:05 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id o64so1865376oib.12
        for <linux-hwmon@vger.kernel.org>; Thu, 27 Oct 2022 06:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZmIr542z9YlhIOZ0AZ3CyQpVsRxqB4QWTWFqnbemRo8=;
        b=JBKXAvlXbmRsFWsurqYZdqpWq5Jmxc7q+t/75Y0QYCnPwbLwBOsOmFo65jQqHo7msX
         9c4KSsyTTbNWVXaFUIPYvkfRAhwjyjRG8la6cGEQ96RODIhCvM1hnuqZJcKMUx7GjJqp
         H90n27/nvEXxFrEE42QzVVwdHQVjbZE7Fhhb+BCjYnkOkEl5Si/lhZfil9X9e2WG/mcf
         0e59rvmMkRFFB3sqgU53qpXvqnzOFwquKU76eYh3MdwS+EULzRRY4rCThzM7RIFSZKux
         ltQh+dSMAo/TgmyK4HCsYHaC+xowlPMlIXxX/PLQGM8zeF2dnhxvm+QoYfLTJzrUEiMO
         E6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZmIr542z9YlhIOZ0AZ3CyQpVsRxqB4QWTWFqnbemRo8=;
        b=TJgJJYUpulFpht4AXZRRRAr+iv6NUDpPqK7Q9Bny7hEMU02OMNigQoMOT4danwZDeU
         x6qVIyI/ALpiNfbHCFarQ+HgdqyFGv2TxZWb1DSPnT9tR6pt9v6RQNaDD1yt0FUug7s9
         zy0MEb3IqeT0SFgzcbsXokPG0libhtzMOfxca+1MLJmTHXHqwPaJorg5ArVXjN8aFtNY
         FHWRIiry1rZ/0TnkQ0NuAYWwXN964ciX7QTcvfG+SoiVci6vLPBQz82QAQaTQIzButYj
         lD3tr96QpdvpT5jS0ti5+4Jo7dyb1avzsgnuxTHjYrIah9YWXR/TM2gpm9PhFWrEyD7Z
         afcA==
X-Gm-Message-State: ACrzQf3lL3MeaPMVTqC058gFZfjEJ1b0itivLAo265vAfICZAdmEghx/
        4ztrv1jpALu+hSMfQwVa7Hk=
X-Google-Smtp-Source: AMsMyM4Z+knajTc0oxliqABszBZ+4fm6+uF0tRPHeQ5TW3I2cf8eS5Qeaxixq0qXA7d4B+RdmVw5/g==
X-Received: by 2002:a05:6808:f14:b0:355:5204:dd6b with SMTP id m20-20020a0568080f1400b003555204dd6bmr4774526oiw.93.1666876024760;
        Thu, 27 Oct 2022 06:07:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l19-20020a056871069300b001372c1902afsm476574oao.52.2022.10.27.06.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 06:07:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 27 Oct 2022 06:07:02 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-hwmon@vger.kernel.org, martin.blumenstingl@googlemail.com,
        jdelvare@suse.com
Subject: Re: [PATCH -next] hwmon: (jc42) Fix missing unlock on error in
 jc42_write()
Message-ID: <20221027130702.GA395203@roeck-us.net>
References: <20221027062931.598247-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221027062931.598247-1-yangyingliang@huawei.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Oct 27, 2022 at 02:29:31PM +0800, Yang Yingliang wrote:
> Add the missing unlock before return from function jc42_write()
> in the error handling case.
> 
> Fixes: 37dedaee8bc6 ("hwmon: (jc42) Convert register access and caching to regmap/regcache")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Excellent catch. Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/jc42.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/jc42.c b/drivers/hwmon/jc42.c
> index 0554b41c32bc..6593d81cb901 100644
> --- a/drivers/hwmon/jc42.c
> +++ b/drivers/hwmon/jc42.c
> @@ -350,7 +350,7 @@ static int jc42_write(struct device *dev, enum hwmon_sensor_types type,
>  		ret = regmap_read(data->regmap, JC42_REG_TEMP_CRITICAL,
>  				  &regval);
>  		if (ret)
> -			return ret;
> +			break;
>  
>  		/*
>  		 * JC42.4 compliant chips only support four hysteresis values.
