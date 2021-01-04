Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42760C433DB
	for <linux-hwmon@archiver.kernel.org>; Mon,  4 Jan 2021 02:14:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0DB172078D
	for <linux-hwmon@archiver.kernel.org>; Mon,  4 Jan 2021 02:14:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727852AbhADCNw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 3 Jan 2021 21:13:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727850AbhADCNw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 3 Jan 2021 21:13:52 -0500
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D928FC061574
        for <linux-hwmon@vger.kernel.org>; Sun,  3 Jan 2021 18:13:11 -0800 (PST)
Received: by mail-qt1-x82f.google.com with SMTP id j26so17618711qtq.8
        for <linux-hwmon@vger.kernel.org>; Sun, 03 Jan 2021 18:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zrfbktkP7+jm+CVexaXtl8hdzXJE0joxlDW/C7HxFeo=;
        b=Ivw73FChOg7aiKOQJ7U35boqdG7P6i/+nwJ6sok5ICJKpSId9Z8Xdsj+ZhccFalEtz
         MJQ4KLeptQc61d2IaraFBjWQ9eSe2GQzXqaCZGpUAQ1q2YiObJlC/fQy2/aFNi2N8f+G
         ehSKWOAQiST7lBFJFtR1n7VWJ+K7KWDLQyrdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zrfbktkP7+jm+CVexaXtl8hdzXJE0joxlDW/C7HxFeo=;
        b=CU3fMMxaHAaUnP8yzsH1eNqhLsGPK426usl47FqIfBxaXxY/FIXmVSFNXCQpUFDmVT
         6HsUrq5pP//tWXPrYCoUdJsuZB4mHk1U5tGoQAgIrQXzICYiae7gSVlMXnO8oF0kr865
         NK1BwIINzxttDWgy3wi1/wQVH0/pBujB48QeKFScZD4t2F1W14d5CWtVn0e27HRieZh7
         5fIR4PgIvb0ADqf5HMf0j9giAXEFWz8HHCvGDbemmAgDb5oxMpipaI5RYTwhWHhZbTSn
         rm+D28Q5KeZ3vYJCfurrbUJhGKkacQJJplT30U4juvCpiDhgyV4V5UcxFKLhBjKEVkx7
         X8sg==
X-Gm-Message-State: AOAM531Iy4ZIsqovgPRSjXTX5SvdSIto+XwhV4hiMq4aiwBWgzFVfiZj
        OtaMpopUULWHysp1cGMSQ5FMsiTwDRXVwwI5Lhrb3k5E5M0=
X-Google-Smtp-Source: ABdhPJyB4uGcG1pAL9Py2J4L5er2++p3paIWHL1ibisrx11L1HvgxFIqHSB+515WhK/fRyLc7CZFc923Ofw6O/s3asM=
X-Received: by 2002:ac8:6651:: with SMTP id j17mr70702854qtp.176.1609726391048;
 Sun, 03 Jan 2021 18:13:11 -0800 (PST)
MIME-Version: 1.0
References: <1609725945-13895-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1609725945-13895-1-git-send-email-tiantao6@hisilicon.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Mon, 4 Jan 2021 02:12:58 +0000
Message-ID: <CACPK8XdvL9yacNKkZ4Ut8b2m9jFrMv=Ri-8qn1DSu0547ZecGw@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (aspeed-pwm-tacho): Switch to using the new API kobj_to_dev()
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Andrew Jeffery <andrew@aj.id.au>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-hwmon@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, 4 Jan 2021 at 02:05, Tian Tao <tiantao6@hisilicon.com> wrote:
>
> fixed the following coccicheck:
> drivers/hwmon/aspeed-pwm-tacho.c:634:60-61: WARNING opportunity for
> kobj_to_dev()
> drivers/hwmon/aspeed-pwm-tacho.c:623:60-61: WARNING opportunity for
> kobj_to_dev()
>
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Acked-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/hwmon/aspeed-pwm-tacho.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
> index 3d8239f..3cb88d6 100644
> --- a/drivers/hwmon/aspeed-pwm-tacho.c
> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
> @@ -620,7 +620,7 @@ static ssize_t rpm_show(struct device *dev, struct device_attribute *attr,
>  static umode_t pwm_is_visible(struct kobject *kobj,
>                               struct attribute *a, int index)
>  {
> -       struct device *dev = container_of(kobj, struct device, kobj);
> +       struct device *dev = kobj_to_dev(kobj);
>         struct aspeed_pwm_tacho_data *priv = dev_get_drvdata(dev);
>
>         if (!priv->pwm_present[index])
> @@ -631,7 +631,7 @@ static umode_t pwm_is_visible(struct kobject *kobj,
>  static umode_t fan_dev_is_visible(struct kobject *kobj,
>                                   struct attribute *a, int index)
>  {
> -       struct device *dev = container_of(kobj, struct device, kobj);
> +       struct device *dev = kobj_to_dev(kobj);
>         struct aspeed_pwm_tacho_data *priv = dev_get_drvdata(dev);
>
>         if (!priv->fan_tach_present[index])
> --
> 2.7.4
>
