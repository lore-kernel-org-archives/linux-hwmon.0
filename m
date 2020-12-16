Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE9DC4361B
	for <linux-hwmon@archiver.kernel.org>; Wed, 16 Dec 2020 16:37:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5BAB5233E2
	for <linux-hwmon@archiver.kernel.org>; Wed, 16 Dec 2020 16:37:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbgLPQh3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 16 Dec 2020 11:37:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbgLPQh3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 16 Dec 2020 11:37:29 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55747C061794
        for <linux-hwmon@vger.kernel.org>; Wed, 16 Dec 2020 08:36:49 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id d203so6972572oia.0
        for <linux-hwmon@vger.kernel.org>; Wed, 16 Dec 2020 08:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QVEcHtxq1D9Q2D3bWwH1wLrXLuZvOUMMSBpEBhNkZ2I=;
        b=KGiw28Ab6qqe93iZJ2qPM7WR3b5oCKWAuj9GMuWN8coQsYTKgvc6ZhJ8bDF7frVHTw
         XgZa+3NiF5t3ZbeU3Ixw5JUls2YPHRb6rVfTvwV1jXUc1quzBEEMka163uD8kXRG53ko
         1YeEhnYv6QPWNWSVs7okLyKwoNw67cpYV9MxMmOKlXQ+IrCDP4A6diOJRK8McqNa3hVx
         ib+QXZSj9N//sXNoRGSxLoFaKQ5SYc0k9DI+C3FgIczRaMDT2M4jAnfYdg7cF7a2FrN7
         PHa/LPVaPqhbUgC9GWEPSI+pAPYF/PVibOSXcAOr0wSruCXCchYlOwwT278ENDMY9KAW
         tZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=QVEcHtxq1D9Q2D3bWwH1wLrXLuZvOUMMSBpEBhNkZ2I=;
        b=Tvbq5BMlxfO2HLM1TfFfwkZo8rg4ibvXMZSfd561uLRO4S2kPO54mldR8X56w1nDJW
         Os+XmeFy1W5KtNwQiB21GKygcLR+07dgOZY1CxLHGo7PETylEjjlt1RU5sDZxM7Ez4pZ
         QywncDy6cbypel/k8SeXRfokzdHoiruWNak0jbM7wSv42fqy6DVUNLucOpsJYd0GBdBN
         QM3+T7J5ysql7EK24dYCWOwaWBAhc6oO1eINhwnFWziZ1irCO3/gsZgKUx8ctx7m/Axl
         YCt2CsS0CeJv8FLmyKt5q92Zu2cIk9uDm3scZ96lp6FN3+vP64E2XLt6SoVW/Me/Gh27
         hAQg==
X-Gm-Message-State: AOAM5310HG8pV3MXu8bqDLdXzkWOKy+ihVCpmm0GxL8Q6CmEEvvJXKVE
        iURm+q1Rb0327Mn30t2ydV1deraQv80=
X-Google-Smtp-Source: ABdhPJx7qYU1Nic2ppk7xLU9wZOc5+EKTbhJk4DKfIIAygHVknb9l0asG3MGBHms8oTTI7JbY0w48w==
X-Received: by 2002:aca:bc41:: with SMTP id m62mr2439022oif.16.1608136608812;
        Wed, 16 Dec 2020 08:36:48 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g12sm537311otg.10.2020.12.16.08.36.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Dec 2020 08:36:48 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 16 Dec 2020 08:36:47 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (w83627ehf)  Switch to using the new API
 kobj_to_dev()
Message-ID: <20201216163647.GA59939@roeck-us.net>
References: <1607907735-17510-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1607907735-17510-1-git-send-email-tiantao6@hisilicon.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Dec 14, 2020 at 09:02:15AM +0800, Tian Tao wrote:
> Switch to using the new API kobj_to_dev() to fix the below warnning:
> drivers/hwmon/w83627ehf.c:1113:60-61: WARNING opportunity for
> kobj_to_dev().
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/w83627ehf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
> index 3964cea..8618aaf 100644
> --- a/drivers/hwmon/w83627ehf.c
> +++ b/drivers/hwmon/w83627ehf.c
> @@ -1110,7 +1110,7 @@ clear_caseopen(struct device *dev, struct w83627ehf_data *data, int channel,
>  static umode_t w83627ehf_attrs_visible(struct kobject *kobj,
>  				       struct attribute *a, int n)
>  {
> -	struct device *dev = container_of(kobj, struct device, kobj);
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct w83627ehf_data *data = dev_get_drvdata(dev);
>  	struct device_attribute *devattr;
>  	struct sensor_device_attribute *sda;
