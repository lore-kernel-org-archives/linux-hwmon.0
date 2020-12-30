Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B4CFC433E6
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Dec 2020 16:05:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF5EF2222A
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Dec 2020 16:05:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbgL3QF1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 30 Dec 2020 11:05:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726161AbgL3QF1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Dec 2020 11:05:27 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05090C061799
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Dec 2020 08:04:47 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id d8so15715367otq.6
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Dec 2020 08:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rUfS6vmHBIAz8tP+boIh2aUKllg96I3C66K3oakk940=;
        b=REU1isX5LoQbuxZGbUpOpGDz0wkBAsDK+ofMG9MeZ3P/f/UCaVMq1ii0vs9e/4yrP4
         1Z/hqQfx1LkInBI3V/8DxzMYp5NMqvOwBH06fYrWbkPSQ871SYh4SDE02kydNSHXuKHp
         xFdTp+TfF+sL0KFZo1tjmU6iVyIYwRHVofM7WqplQtBJaL4i/CkALtFC+KqAqzYp2G+Q
         vWoGwifRjQ8rbzJFzFVUy175y+79CQ7ejuiBR7cdz0c4dyFQT+y7+sGfVL+PWB8DrATX
         6hZJrnT+5poVpO/5366nbT3jbBt8dipzSfgEWPm21xTFGh8pY0NmcIVYKjhgCgAiob5n
         7F1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=rUfS6vmHBIAz8tP+boIh2aUKllg96I3C66K3oakk940=;
        b=Sc0/Hd2Y/rq51pV1gqUXdEXEUXJsxpNQyRRF7rN3retduqLcZGSQzoOFgKWt2hOD5x
         Zh1dQkxJJlZyeajIwYXTngNKBFlRd+kTIvdzFWaULmfkPOjQPN8ZAKePgmm6TFQJQye0
         kW6+v/oiLnfuJzsC1UmeWk7+NkiJ4oQbLyAZk8w25Efb0fDXNnhIsBRFWlu+RZSAqf4B
         ASY3Juokxbm4JlElUc13Gf0rwIzRboLNUr/2EmKC0cw405YuP0VX4HqNRdDSF1B2jeBv
         2tBL4VbzIvgYvkDBkxq7OonqKBbC8aCooRU4wxlVUL///YwLNbH7I4DAJp9nF4h8CIfy
         iGMg==
X-Gm-Message-State: AOAM5332cz0OMTjAnPwcSnUxzTv9NwOEPdin/lDEztMwt4u5ngb81U8w
        ZFx8cqu2k0WK8bHGuFLayOyt1ezY+04=
X-Google-Smtp-Source: ABdhPJzBxQn0KGbyypy4jD4w/zGX0bXV3tiguiGcy982GVdHTQb7uB0WVd+M/xZnfsIM7rIr1Cqw9Q==
X-Received: by 2002:a9d:6c11:: with SMTP id f17mr39805819otq.83.1609344286435;
        Wed, 30 Dec 2020 08:04:46 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j9sm5902463ooq.1.2020.12.30.08.04.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Dec 2020 08:04:45 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 30 Dec 2020 08:04:43 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (gpio-fan): Switch to using the new API
 kobj_to_dev()
Message-ID: <20201230160443.GA100576@roeck-us.net>
References: <1609211837-54930-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1609211837-54930-1-git-send-email-tiantao6@hisilicon.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Dec 29, 2020 at 11:17:17AM +0800, Tian Tao wrote:
> fixed the following coccicheck:
> drivers/hwmon/gpio-fan.c:302:60-61: WARNING opportunity for
> kobj_to_dev()
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/gpio-fan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
> index 3ea4021..befe989 100644
> --- a/drivers/hwmon/gpio-fan.c
> +++ b/drivers/hwmon/gpio-fan.c
> @@ -299,7 +299,7 @@ static DEVICE_ATTR(fan1_target, 0644, fan1_input_show, set_rpm);
>  static umode_t gpio_fan_is_visible(struct kobject *kobj,
>  				   struct attribute *attr, int index)
>  {
> -	struct device *dev = container_of(kobj, struct device, kobj);
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct gpio_fan_data *data = dev_get_drvdata(dev);
>  
>  	if (index == 0 && !data->alarm_gpio)
