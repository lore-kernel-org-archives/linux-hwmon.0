Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A27AC433E0
	for <linux-hwmon@archiver.kernel.org>; Wed, 23 Dec 2020 21:09:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D67F223E4
	for <linux-hwmon@archiver.kernel.org>; Wed, 23 Dec 2020 21:09:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728895AbgLWVJZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 23 Dec 2020 16:09:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728795AbgLWVJZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 23 Dec 2020 16:09:25 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE6C1C06179C
        for <linux-hwmon@vger.kernel.org>; Wed, 23 Dec 2020 13:08:44 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id m12so452231lfo.7
        for <linux-hwmon@vger.kernel.org>; Wed, 23 Dec 2020 13:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=maTn0LM0BWKlqcKve0mImmfykdvalUohHV65FQVvuPI=;
        b=rbij9x6yuwyxJn74eSefsJRnNd2egVRl13nRwkdY2PsVCCcBPA7UJAT3vLEnh58QZm
         zOQj6vYM35tBpJamDzNBHPYE2MiW5XZGN9kxHrWB1wqqoEgOlDaqPe5Tx2OCPhp0I9Lo
         tpEiArvFKdqdoaelzn3rDNdA78vspy4McWghRH4eWwT3/3xJem5ZHc6qi44aGezh5EtF
         CU5rBls8g3VEfdRrkK903a4z/1VBauDXzPw2hHRkSD9Iu9J39kpEKiSeVy2TmtAmHaCq
         1JtqtJiMV8hUK4D008PsXm2ltZylmNlmQd+O6AeqhnqaZ78pipkDI9RXFwy3yaRV3X6r
         0jTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=maTn0LM0BWKlqcKve0mImmfykdvalUohHV65FQVvuPI=;
        b=t3jZEeS8hqRakMkxio8WFzcOlBM/Ao0Q/NonjxdyzuuYse+NgeRVT8wGuesMNMXYVd
         6o66BH7+KhFvWw5Cujs7COQ9PH+AXJ/uDDNvOPfnso5PftnhZgNq0z9lqehhL7L50YE7
         pYAiln7Fe8OsYJPDEmltGMta8anl4XcYk9i5TCKzDd05d9twNtNdLT/g/sxexPthaZIQ
         zk9ckIFH6eUE+/B4k0XlTb4bjyW43X8oJx+fQGHKYzs0MsdK/k2WLfOUa6oquxmcsBIV
         nzQNCRzFwshA9Pnk6bOD0jJ21LWPUjr6ZUW6kvfFew+fijxhgzW3kxsD+1P1SZTBYyFD
         XZ3A==
X-Gm-Message-State: AOAM5321+xchSrvPexeiCNRTilTg8tQvOw7xNvzek0vz3hWYgLkpgxNx
        tmVGFKESzHre+Vbn61Fz7U1KgYyYmY1BEVCEOUwrfw==
X-Google-Smtp-Source: ABdhPJwYUKCus3zJkukEAETymaOYdmfvX0IbPR4K+QSuHUGB2bupVJyTcGCCusb7gAVm+1oXeVoXHKkEl7U/2ssX8+Q=
X-Received: by 2002:ac2:5597:: with SMTP id v23mr6043297lfg.649.1608757723127;
 Wed, 23 Dec 2020 13:08:43 -0800 (PST)
MIME-Version: 1.0
References: <20201219224143.686074-1-linus.walleij@linaro.org> <6d339a6c-6f8c-4a5e-718b-c90a9fbb8c01@roeck-us.net>
In-Reply-To: <6d339a6c-6f8c-4a5e-718b-c90a9fbb8c01@roeck-us.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 23 Dec 2020 22:08:31 +0100
Message-ID: <CACRpkdZTVAoDbbJqTJbxv1ZDyAMsB_h9TAdKKbxqBYGp4-b_jg@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (ntc_thermistor): try reading processed
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Chris Lesiak <chris.lesiak@licor.com>,
        Jonathan Cameron <jic23@cam.ac.uk>,
        linux-iio <linux-iio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Dec 21, 2020 at 5:15 PM Guenter Roeck <linux@roeck-us.net> wrote:

> > -     ret = iio_convert_raw_to_processed(channel, raw, &uv, 1000);
> > -     if (ret < 0) {
> > -             /* Assume 12 bit ADC with vref at pullup_uv */
> > -             uv = (pdata->pullup_uv * (s64)raw) >> 12;
> > +             /*
> > +              * FIXME: This fallback to using a raw read and then right
> > +              * out assume the ADC is 12 bits and hard-coding scale
> > +              * to 1000 seems a bit dangerous. Should it simply be
> > +              * deleted?
> > +              */
>
> The hwmon ABI specifically supports unscaled values, which can then be
> scaled in userspace using the sensors configuration file.
> Given that we return the pseudo-scaled value to userspace today,
> it seems to me that it would do more harm to change that instead of just
> leaving it in place.

I see.

I tried to drill down and see the history of the driver and in the
original commit all values are scaled with the function
get_temp_mC() which indicates that the driver has always
intended to return millicentigrades, not unscaled values (as
far as I can tell).

First commit 9e8269de100dd0be1199778dc175ff22417aebd2
"hwmon: (ntc_thermistor) Add DT with IIO support to NTC thermistor driver"
adds the result  >>= 12 thing on top of a raw IIO read,
so here is a silent assumption of a 12 bit ADC.

Then commit 0315253b19bbc63eedad2f6125c21e280c76e29b
"hwmon: (ntc_thermistor) fix iio raw to microvolts conversion"
calls iio_convert_raw_to_processed() to get around the 12
bit assumption, instead adding a 1000x scale assumption
on the value passed in from the raw read. This just looks
wrong, why would it be 1000 and not 1 like the IIO core does
when we call iio_read_channel_processed()? It looks like it is
actually compensating for a bug in the ADC returning
the wrong scale: the author may have used a buggy ADC
driver return a scaling to volts instead of millivolts and then this
was a trial-and-error solution to that bug in the ADC
driver.

In that case it would be nice to know which ADC driver,
so we can fix it! I suspect maybe an out-of-tree ADC?

So there is first a hardcoded solution to handle raw 12 bit
values and then a trial-and-error fix for 1000x scaling in the
code that was supposed to make it generic.

The actual situation I have is that I used the thermistor for a thermal
zone, and AFAICT these require that the temperature be in millicelsius,
at least it will be very hard to handle the thermal zone in the device
tree that define the trip points in millicelsius, so since the driver sets
HWMON_C_REGISTER_TZ it might break
the thermal zone ABI rather than the hwmon/sensors ABI, right?

At least commit c08860ffe5c0e986e208e8217dae8191c0b40b24
"hwmon: (ntc_thermistor) Add ntc thermistor to thermal subsystem as a sensor"
adds a thermal zone calling the function get_temp_mc()
clearly requiring a millicentigrade measure.

I also think it is indeed resulting in millicelsius on the platform that
commit 0315253b19bbc63eedad2f6125c21e280c76e29b
is intended for, it's just that it fixes a bug in the wrong place...

> Either case, calling iio_convert_raw_to_processed() does not seem to add
> value here. This is already done by iio_read_channel_processed().
> The best we can do is to use the original fallback.

I don't know if the patch is especially messy but this part inside
the if (ret < 0) clause:

> > +             ret = iio_read_channel_raw(channel, &raw);
> > +             if (ret < 0) {
> > +                     pr_err("read channel() error: %d\n", ret);
> > +                     return ret;
> > +             }
> > +             ret = iio_convert_raw_to_processed(channel, raw, &uv, 1000);
> > +             if (ret < 0) {
> > +                     /* Assume 12 bit ADC with vref at pullup_uv */
> > +                     uv = (pdata->pullup_uv * (s64)raw) >> 12;
> > +             }

shold be identical to the original fallback.

If you want me to revise the patch in some way, I can fix, to me
it looks like the fallback will just work on a certain platform with
erroneous 1000x offset scaling, it would be good to know which
one so we can fix the actual problem.

Yours,
Linus Walleij
