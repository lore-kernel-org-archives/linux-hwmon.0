Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78796C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon,  2 May 2022 18:59:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386996AbiEBTDH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 2 May 2022 15:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386995AbiEBTDF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 2 May 2022 15:03:05 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10731654C
        for <linux-hwmon@vger.kernel.org>; Mon,  2 May 2022 11:59:35 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id c190-20020a1c35c7000000b0038e37907b5bso123324wma.0
        for <linux-hwmon@vger.kernel.org>; Mon, 02 May 2022 11:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=kw3f9KINiTdwTbt/+DaeVDEWIMOIamgUP2eEKwHR5N4=;
        b=pengUl1W4caLgN0nR8g2V3IGDf5pF1lFNpM1u0PHT5U2Td+eIGaE5Sen9sYQ41Wd1U
         xD6vQUdoHIwmAnFWyLf+8P5IbkKnTzp8BFns86e3UL/9sm3p58W7Q+IGRHa1aMWiBejZ
         Kv6xYMwdKQN56XoGZCCvF295rtXA0Y1IQSQVjyoFtBSJ+XttLPo+R7Gc80l5XT90Qjlq
         +oi1l/hkuTGIZZarjokL4J/FYQ58qU822UMti3u2AkFmXfHOMnqGPwFUi5QTjXV7TFu6
         OUaXy89ndWjTb8vhTsoazLnas/ltBvY7EZL8skhpVBuS1INz7d1pk3uQg98311gwgMNa
         2pFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=kw3f9KINiTdwTbt/+DaeVDEWIMOIamgUP2eEKwHR5N4=;
        b=yuvSoqDxqtRw4N22JBo6T15IHvG+H/WMUWNIBsnSP+OTdDkJiFod+1DeKuwo/y6a9x
         AU4BYqp17SBi0RuK06fXZec0UaV/HyMG3gYg9Cl4quWIot/46dJDl/3Y8MSjc80n3z5C
         6jz0DiZVvXaezFgcZlSDHIlnGSkMSyWr4/dKcpTdP+dszN02yLklD7e5J9bV4GkxkhOr
         qK/jqkVB5U21PkCBPrCIZRGrgvKZM0fIaog5bPTJORgVqszCyhjaJNWN4q2hVfIbHnH3
         DjfO8zpw/1tTJswj+xOZlVtefZu84PKAE9OUjEq3v/I9J6s2lajnYU1eDu8efRH0hPTA
         IQPA==
X-Gm-Message-State: AOAM532YveFC70xc3T52k3hAI5D1QOMtikCl8IfRTNJtw30CevoxaA4w
        ab5c+/3/k/mjB+35vqv4hQWeQA==
X-Google-Smtp-Source: ABdhPJwIeLgYMEwUxrmCp/aC/3AN4cpDx01maV+9LVll+JoEtq9Ti7ElrqO73oW279Eb4NXFDCjRzA==
X-Received: by 2002:a05:600c:4f56:b0:394:3fa3:97bb with SMTP id m22-20020a05600c4f5600b003943fa397bbmr391224wmq.83.1651517973538;
        Mon, 02 May 2022 11:59:33 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id p6-20020a05600c1d8600b003942a244f34sm80137wms.13.2022.05.02.11.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 11:59:32 -0700 (PDT)
Date:   Mon, 2 May 2022 20:59:27 +0200
From:   LABBE Corentin <clabbe@baylibre.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: acpi_power_meter: convert to
 hwmon_device_register_with_info
Message-ID: <YnAqDxfTU27USQI+@Red>
References: <20220502124249.682058-1-clabbe@baylibre.com>
 <20220502124249.682058-2-clabbe@baylibre.com>
 <0b154a30-7765-e3ac-9980-0ecc7447d7ad@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0b154a30-7765-e3ac-9980-0ecc7447d7ad@roeck-us.net>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Le Mon, May 02, 2022 at 06:34:44AM -0700, Guenter Roeck a écrit :
> On 5/2/22 05:42, Corentin Labbe wrote:
> > Booting lead to a hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
> > So let's convert the driver to use hwmon_device_register_with_info().
> > 
> > Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> > ---
> >   drivers/hwmon/acpi_power_meter.c | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
> > index d2545a1be9fc..98293727f980 100644
> > --- a/drivers/hwmon/acpi_power_meter.c
> > +++ b/drivers/hwmon/acpi_power_meter.c
> > @@ -891,7 +891,10 @@ static int acpi_power_meter_add(struct acpi_device *device)
> >   	if (res)
> >   		goto exit_free_capability;
> >   
> > -	resource->hwmon_dev = hwmon_device_register(&device->dev);
> > +	resource->hwmon_dev = hwmon_device_register_with_info(&device->dev,
> > +							      ACPI_POWER_METER_DEVICE_NAME,
> > +							      NULL, NULL,
> > +							      NULL);
> 
> NACK. That isn't a conversion to the new API, it just abuses the fact
> that the new API has to accept a NULL info pointer for historic reasons.
> 

Hello

I am sorry, I found a driver doing it, so I believed it was okay.
Converting seems not to hard but, by using the new API, how can I convert power1_model_number/power1_is_battery attribute ?
There are the remaining attributes I dont find how to convert.

Regards
