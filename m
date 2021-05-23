Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3202FC47080
	for <linux-hwmon@archiver.kernel.org>; Sun, 23 May 2021 17:53:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 069AE6117A
	for <linux-hwmon@archiver.kernel.org>; Sun, 23 May 2021 17:52:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231893AbhEWRyZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 23 May 2021 13:54:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231857AbhEWRyZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 23 May 2021 13:54:25 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 720B0C061756
        for <linux-hwmon@vger.kernel.org>; Sun, 23 May 2021 10:52:58 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id c4so5515190iln.7
        for <linux-hwmon@vger.kernel.org>; Sun, 23 May 2021 10:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metormote-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=05vz9I/MF5N8EuBmgeaTm3kpG3BPBz43NAejnYDL8rg=;
        b=jf3CN50MczZ8g0QtUQ5SHGWmUfOajk6RPW78SGcf4uf3X4XfbIpggpM3ZQI+ujYj+z
         sdKE1k0RKe8RtOyZZwvdq1vuBrpuqPBLG72zdqU9xp108iTkCqypjC8LV2334khNfi38
         TwmmWE2Ti1q2hYQVKA5hVX+TGDO70GlV6xL/3aCuxfIwomWcELEUku+z05YIzs3uPu9h
         h89Sf1LqLjIu0pjwmvFd+ElC1/o4wO6GZnxd5MYbz1e2/FPj16pIxnpUpB3VBJxyXbuY
         718G2xCm9VIuAwLwXrSUBaJu+m0x2p91e6aRUHTs39EFuV9jeVGCFhh/UvH1ud6kT8Te
         6zOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=05vz9I/MF5N8EuBmgeaTm3kpG3BPBz43NAejnYDL8rg=;
        b=Y8iSvqv15ZrCtZU5gyjxvpTN8jWUrOVypQmFM0qF1XAzHrlOLrTS/SeEFW7/BpfLar
         oa60D+hUH33CxLkHs/m8u+jjet6tkhMU7N4DgpqKq3LMojDWoydoKN4rdaQhA4LIPT/k
         WaUUTn9yUqorHU5343r9DMg1drGr+t3q+BWAJdincGvAZedUAE4GmLMXtl8/ULv++OtJ
         k8mK7/UoN68sZbHDEDrNUeS06tvDD/62dypewjh8YrowktTp+e7S6p2VMIDAhq9tZdq8
         aJpDKb64BtvFP/r3Cc1ke2+49TEnq698SrRQlDn+7DMP0NdNuEAJ5eFsMGrHNpECioVs
         ruHA==
X-Gm-Message-State: AOAM532UwtXJmn+khVDNyUUc0n7FQbVDIi+gXzVI35t+tFzGfMz6W4C9
        ib/XtzFVbWPR+wy1N6aDxKnPcVC955qgDDAKwdmyfg==
X-Google-Smtp-Source: ABdhPJyhSlBBavDbjIHB/GTOjMKky9wJKFaoO/4oLDlpN3uOlp4AE60rTIHditZTdxbLb7xZcpA3a/vGxx1Tvdsigxs=
X-Received: by 2002:a05:6e02:f81:: with SMTP id v1mr13126189ilo.243.1621792377638;
 Sun, 23 May 2021 10:52:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210522105528.87629-1-erik.rosen@metormote.com>
 <20210522105528.87629-4-erik.rosen@metormote.com> <24ff79b6-29f5-6921-7418-9ba93bcf7193@roeck-us.net>
In-Reply-To: <24ff79b6-29f5-6921-7418-9ba93bcf7193@roeck-us.net>
From:   Erik Rosen <erik.rosen@metormote.com>
Date:   Sun, 23 May 2021 19:52:46 +0200
Message-ID: <CA+ui0H=Q5Xei0Uts_VzNV2PcKHc5jhM+dum59+Q4Lg5GYFdEJg@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] hwmon: (pmbus/pim4328) Add support for reading
 direct format coefficients
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, May 22, 2021 at 3:41 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 5/22/21 3:55 AM, Erik Rosen wrote:
> > Add support for reading and decoding direct format coefficients to
> > the PMBus core driver. If the new flag PMBUS_USE_COEFFICIENTS_CMD
> > is set, the driver will use the COEFFICIENTS register together with
> > the information in the pmbus_sensor_attr structs to initialize
> > relevant coefficients for the direct mode format.
> >
> > Signed-off-by: Erik Rosen <erik.rosen@metormote.com>
> > ---
> >   drivers/hwmon/pmbus/pmbus_core.c | 93 ++++++++++++++++++++++++++++++++
> >   include/linux/pmbus.h            |  8 +++
> >   2 files changed, 101 insertions(+)
> >
> > diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> > index 460cbfd716e4..03c169bf5633 100644
> > --- a/drivers/hwmon/pmbus/pmbus_core.c
> > +++ b/drivers/hwmon/pmbus/pmbus_core.c
> > @@ -2177,6 +2177,38 @@ static int pmbus_find_attributes(struct i2c_client *client,
> >       return ret;
> >   }
> >
> > +static int pmbus_init_coefficients(struct i2c_client *client,
> > +                                struct pmbus_data *data, int page,
>
> This seems wrong. Coefficients are not maintained per page but per class,
> and (re-)reading them for each supported page doesn't really add value or
> even make sense.
>
> > +                                enum pmbus_sensor_classes sensor_class,
> > +                                const struct pmbus_sensor_attr *attrs,
> > +                                int nattrs)
> > +{
> > +     int i, status;
> > +
> > +     for (i = 0; i < nattrs; i++) {
> > +             if (attrs->class == sensor_class &&
> > +                 (attrs->func & data->info->func[page])) {
> > +                     status = pmbus_read_coefficients(client,
> > +                                                      (struct pmbus_driver_info *)data->info,
> > +                                                      sensor_class,
> > +                                                      attrs->reg);
> > +                     if (status < 0) {
> > +                             dev_err(&client->dev,
> > +                                     "Failed to read coefficients for register: %x\n",
> > +                                     attrs->reg);
> > +                             return status;
> > +                     }
> > +                     return 0;
> > +             }
> > +             attrs++;
> > +     }
> > +
> > +     dev_err(&client->dev, "No coefficients found for register: %x\n",
> > +             attrs->reg);
> > +
>
> attrs points beyond the array size here, so attrs->reg does not point
> to a valid array element. The problem would also not be the register
> this happens to point to, but the class (ie the chip does not support
> a sensor of the requested class).
>
> Not sure if this should trigger a message or error in the first place.
> It won't matter since the chip will never need those coefficients.
> If anything, this would be a misconfiguration (the driver should
> not set direct format for this sensor class), and the return value
> should be -EINVAL.
>
> Either case, I wonder if this can be handled with less complex code,
> ie without having to check data->info->func[] for all pages. How
> about just walking through attrs and try all class matches until
> one is found that works (ie not return on error but keep trying) ?

Ok, I'll send a new version based on your comments.
I'm not entirely comfortable with just silently ignoring any failure to
retrieve the coefficients for a sensor class. I mean it could be due to any
reason; a bus error for instance. I'll return a -EINVAL for now if you don't
disagree.

/Erik

>
> > +     return -ENODEV;
> > +}
> > +
> >   /*
> >    * Identify chip parameters.
> >    * This function is called for all chips.
> > @@ -2185,6 +2217,7 @@ static int pmbus_identify_common(struct i2c_client *client,
> >                                struct pmbus_data *data, int page)
> >   {
> >       int vout_mode = -1;
> > +     int ret;
> >
> >       if (pmbus_check_byte_register(client, page, PMBUS_VOUT_MODE))
> >               vout_mode = _pmbus_read_byte_data(client, page,
> > @@ -2214,6 +2247,66 @@ static int pmbus_identify_common(struct i2c_client *client,
> >               }
> >       }
> >
> > +     if (data->flags & PMBUS_USE_COEFFICIENTS_CMD) {
>
> I think there should be a separate function to handle that,
> to be called only once, not once per page.
>
> > +             if (!i2c_check_functionality(client->adapter,
> > +                                          I2C_FUNC_SMBUS_BLOCK_PROC_CALL))
> > +                     return -ENODEV;
> > +
> > +             if (data->info->format[PSC_VOLTAGE_IN] == direct) {
> > +                     ret = pmbus_init_coefficients(client, data, page,
> > +                                                   PSC_VOLTAGE_IN,
> > +                                                   voltage_attributes,
> > +                                                   ARRAY_SIZE(voltage_attributes));
> > +                     if (ret)
> > +                             return ret;
> > +             }
>
> It might be useful to have a little structure with {class, attribute list pointer,
> attribute list size} and walk through that in a loop instead of repeating essentially
> the same code multiple times.
>
> > +
> > +             if (data->info->format[PSC_VOLTAGE_OUT] == direct) {
> > +                     ret = pmbus_init_coefficients(client, data, page,
> > +                                                   PSC_VOLTAGE_OUT,
> > +                                                   voltage_attributes,
> > +                                                   ARRAY_SIZE(voltage_attributes));
> > +                     if (ret)
> > +                             return ret;
> > +             }
> > +
> > +             if (data->info->format[PSC_CURRENT_IN] == direct) {
> > +                     ret = pmbus_init_coefficients(client, data, page,
> > +                                                   PSC_CURRENT_IN,
> > +                                                   current_attributes,
> > +                                                   ARRAY_SIZE(current_attributes));
> > +                     if (ret)
> > +                             return ret;
> > +             }
> > +
> > +             if (data->info->format[PSC_CURRENT_OUT] == direct) {
> > +                     ret = pmbus_init_coefficients(client, data, page,
> > +                                                   PSC_CURRENT_OUT,
> > +                                                   current_attributes,
> > +                                                   ARRAY_SIZE(current_attributes));
> > +                     if (ret)
> > +                             return ret;
> > +             }
> > +
> > +             if (data->info->format[PSC_POWER] == direct) {
> > +                     ret = pmbus_init_coefficients(client, data, page,
> > +                                                   PSC_POWER,
> > +                                                   power_attributes,
> > +                                                   ARRAY_SIZE(power_attributes));
> > +                     if (ret)
> > +                             return ret;
> > +             }
> > +
> > +             if (data->info->format[PSC_TEMPERATURE] == direct) {
> > +                     ret = pmbus_init_coefficients(client, data, page,
> > +                                                   PSC_TEMPERATURE,
> > +                                                   temp_attributes,
> > +                                                   ARRAY_SIZE(temp_attributes));
> > +                     if (ret)
> > +                             return ret;
> > +             }
> > +     }
> > +
> >       pmbus_clear_fault_page(client, page);
> >       return 0;
> >   }
> > diff --git a/include/linux/pmbus.h b/include/linux/pmbus.h
> > index f720470b1bab..7fdc282dab5a 100644
> > --- a/include/linux/pmbus.h
> > +++ b/include/linux/pmbus.h
> > @@ -52,6 +52,14 @@
> >    */
> >   #define PMBUS_NO_WRITE_PROTECT                      BIT(4)
> >
> > +/*
> > + * PMBUS_USE_COEFFICIENTS_CMD
> > + *
> > + * When this flag is set the PMBus core driver will use the COEFFICIENTS
> > + * register to initialize the coefficients for the direct mode format.
> > + */
> > +#define PMBUS_USE_COEFFICIENTS_CMD           BIT(5)
> > +
> >   struct pmbus_platform_data {
> >       u32 flags;              /* Device specific flags */
> >
> >
>
