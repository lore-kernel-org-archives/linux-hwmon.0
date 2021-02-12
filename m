Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C2D2C433E0
	for <linux-hwmon@archiver.kernel.org>; Fri, 12 Feb 2021 04:30:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C8C9D64E62
	for <linux-hwmon@archiver.kernel.org>; Fri, 12 Feb 2021 04:30:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbhBLEaB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 11 Feb 2021 23:30:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbhBLEaA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 11 Feb 2021 23:30:00 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E0FCC061574
        for <linux-hwmon@vger.kernel.org>; Thu, 11 Feb 2021 20:29:20 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id k10so7350772otl.2
        for <linux-hwmon@vger.kernel.org>; Thu, 11 Feb 2021 20:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mO/EQ3ImhmnftnWHylmfgd7wo6YIsDmwlJLbtuyLszw=;
        b=kCtPTZ1Pl62ZYCdaCWpuqhFIyoB2c+kiEfLBVDOyGvwouy3ha8Yzndne5cQL3DZH80
         H0uxMKJ6FYVsZs7cH6PdcUNrikQiP+0iv/JGdQ1DdiwaF0fg2mRQFbB9cTDXb0L4R4HI
         TRoV+gKytuq9jNraKYtU1SuWOSgauUNh3tlaZUPCGcbvfzfe4Tpx4FsAsdM9cSpxe2Hd
         vhzsXSYxRCH0RmA7Wi+mq5NnmDRIH+2lNRkcn7ztaN/CwoP7Ljo7LmleTP7KTC0YJD0G
         rvIzvrXpSCWqnklr4wv5VPn/XXkVh64fBl3DEDMSbqRbxlGl7qCLjajDKG9InbJffJ57
         EmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=mO/EQ3ImhmnftnWHylmfgd7wo6YIsDmwlJLbtuyLszw=;
        b=uHCyoFZZJdZk8N3EHFJOSfBCJ/DX+V9G/+zb0X2fDuyNrC4KxCmxz8O714UWcIQamB
         2E24PFhpU76HMxIDhzUyiHogCFQVLA+j4LL1vRWfrkQVkkxa2I32hsuOmeJdv9/+GYPh
         f1lmYdaCN5gNDO7ZptXWW09XuHV9+RJPDuyPXcPlprE4P4bedpKsEVtbC7uFV9PsaxuP
         5i5G5u/QFuamnGtmJEghEP0MVR9VadWo0FAf+59nsPILstGw/9qgOOcE+2qVokvuEGyB
         S/3lfwqhg05GIh5EBCecrNanpSQgNpnlaUPwXHOfCchifAQfz50cc/v8N+J5hTZuWA0V
         7rsA==
X-Gm-Message-State: AOAM533GVodq+5gmqqWTzP6jEfSboB0n/k4RIr0o2LL5hKaIefXkTNoF
        QF+k12rnFCJE/g9nv6/keAU=
X-Google-Smtp-Source: ABdhPJz7T0Mhmu3piwAb5MOhkUM00m3HnSOSS9NuO0gV0BCrNYccXH+3iJ3vItYqoZhuRtGfm++WWw==
X-Received: by 2002:a9d:2c2:: with SMTP id 60mr822099otl.357.1613104160036;
        Thu, 11 Feb 2021 20:29:20 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b14sm1340138ooj.26.2021.02.11.20.29.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Feb 2021 20:29:19 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 11 Feb 2021 20:29:18 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (da9052): Switch to using the new API
 kobj_to_dev()
Message-ID: <20210212042918.GA104534@roeck-us.net>
References: <1612860208-51088-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1612860208-51088-1-git-send-email-tiantao6@hisilicon.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Feb 09, 2021 at 04:43:28PM +0800, Tian Tao wrote:
> Switch to using the new API kobj_to_dev() to fix the below warnning:
> /drivers/hwmon/da9052-hwmon.c:302:60-61: WARNING opportunity for
> kobj_to_dev().
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/da9052-hwmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/da9052-hwmon.c b/drivers/hwmon/da9052-hwmon.c
> index 4af2fc3..ed6c5df 100644
> --- a/drivers/hwmon/da9052-hwmon.c
> +++ b/drivers/hwmon/da9052-hwmon.c
> @@ -299,7 +299,7 @@ static ssize_t label_show(struct device *dev,
>  static umode_t da9052_channel_is_visible(struct kobject *kobj,
>  					 struct attribute *attr, int index)
>  {
> -	struct device *dev = container_of(kobj, struct device, kobj);
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct da9052_hwmon *hwmon = dev_get_drvdata(dev);
>  	struct device_attribute *dattr = container_of(attr,
>  				struct device_attribute, attr);
