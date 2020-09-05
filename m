Return-Path: <SRS0=Sfjw=CO=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 597F7C43461
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Sep 2020 16:28:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11A3E20714
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Sep 2020 16:28:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oXt6zs9J"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726468AbgIEQ2C (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 5 Sep 2020 12:28:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726590AbgIEQ2B (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 5 Sep 2020 12:28:01 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D240DC061244
        for <linux-hwmon@vger.kernel.org>; Sat,  5 Sep 2020 09:28:00 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id a22so4996966ljp.13
        for <linux-hwmon@vger.kernel.org>; Sat, 05 Sep 2020 09:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g7H3d/iJaCeLx/zEqeyFoW2vZIvu1rPDRBehjzS9BmE=;
        b=oXt6zs9JNpN5WZSwAyqC7L8pSd3N+pI0aEc6m/bFCs5HMTwrZ3N27IbQnQVCKaOrGw
         4STbkHpURvDeP7sfB9XHtsQkhk8XZIenHxhZ4nXS1s8ePFQ9V17yR19ek6yMgnLOZmbq
         b7ZlKtQDUZXJCR7vqlD0G3Sfw3oieZPEOvsF5rRhuS+Z9hbo18+/lyw4LB18bIeY2O0X
         Sn8Fthi5eXMEmv8m90g7mIZCr8tG+V+14ZjcB9xMOh1WWWzwzSaIbTGpqhQaUvEvy0d5
         u3DR6H543mpsm1Vz9lbmwEVaoC5sPLJov9WlvpLVspzA1uDzmL5/1BlgrhV+b49l8txJ
         WidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g7H3d/iJaCeLx/zEqeyFoW2vZIvu1rPDRBehjzS9BmE=;
        b=ANtXlvR63YvsaMIg4pJbiTAfEB2zyp5nwcNrxfdXhjrVoUYXA3tsdnvmbLcwRi3SL8
         /LU79wQBPR2CrtlAmiduIkwwFd4SN8mfdyggAjDRCMbF2ASvRooeC8Bgpvy4v4n090xf
         FKt9xNParih3m9op8f+7Y3Sahz7J7lfGkWpi0t4+Ux0+yADzWFWfJWpM0Gh2swef+H8r
         RuTyO8GJYTGWhR6Z+7Kw4h4LfBEYDukmyKXSrpBF1R3nf1ebyJIMI9DCRjktf1v4xmKb
         f6S6yPjD6M7hTRfNIJ6oaBSF7xLy+eJ2+a8UQrH8HxX5aUXsush4f1XLDpj8ltzbgtdp
         KSAg==
X-Gm-Message-State: AOAM533UdE3U65SVt/fWQ//LwXDFUnn6CbI2SL6NpPAwlGTgEC/LHdrk
        rz4vuOaC7jOOmDjdq4nv+7YyajIQ8yMwiJgFI/gifcwcZgg=
X-Google-Smtp-Source: ABdhPJzDwmwgxyetDDoM/2BsHHhuzltB06EaBtbIdord1fKxhVKWv5gtdfWeMWrYDUoHn6MXmqStZB6pc5XGKQhqpGQ=
X-Received: by 2002:a2e:a418:: with SMTP id p24mr2998259ljn.205.1599323278774;
 Sat, 05 Sep 2020 09:27:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200905143230.195049-1-nchatrad@amd.com> <20200905143230.195049-3-nchatrad@amd.com>
 <65863d33-2af7-5c40-010c-6cc5b5300a0a@roeck-us.net> <DM6PR12MB4388DCF9B42BA0093774606FE82A0@DM6PR12MB4388.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB4388DCF9B42BA0093774606FE82A0@DM6PR12MB4388.namprd12.prod.outlook.com>
From:   Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Date:   Sat, 5 Sep 2020 21:57:47 +0530
Message-ID: <CAHfPSqDYpixg=Mj6ANMtH3r_ENQ24h8tvxi2FpKbpbtogXi9Dg@mail.gmail.com>
Subject: Re: [PATCH 2/6] hwmon: amd_energy: optimize accumulation interval
To:     linux-hwmon@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

> On 9/5/20 7:32 AM, Naveen Krishna Chatradhi wrote:
> > On a system with course grain resolution of energy unit (milli J) the
> > accumulation thread can be executed less frequently than on the system
> > with fine grain resolution(micro J).
> >
> > This patch sets the accumulation thread interval to an optimum value
> > calculated based on the (energy unit) resolution supported by the
> > hardware (assuming a peak wattage of 240W).
> >
> > Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> > ---
> >  drivers/hwmon/amd_energy.c | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
> > index 9580a16185b8..f0a13d6cc419 100644
> > --- a/drivers/hwmon/amd_energy.c
> > +++ b/drivers/hwmon/amd_energy.c
> > @@ -48,6 +48,7 @@ struct amd_energy_data {
> >       struct sensor_accumulator *accums;
> >       /* Energy Status Units */
> >       u64 energy_units;
> > +     unsigned int timeout;
> >       int nr_cpus;
> >       int nr_socks;
> >       int core_id;
> > @@ -215,6 +216,7 @@ static umode_t amd_energy_is_visible(const void
> > *_data,  static int energy_accumulator(void *p)  {
> >       struct amd_energy_data *data = (struct amd_energy_data *)p;
> > +     unsigned int timeout = data->timeout;
> >
> >       while (!kthread_should_stop()) {
> >               /*
> > @@ -234,7 +236,7 @@ static int energy_accumulator(void *p)
> >                *
> >                * let us accumulate for every 100secs
> >                */
> > -             schedule_timeout(msecs_to_jiffies(100000));
> > +             schedule_timeout(msecs_to_jiffies(timeout));
>
> Numbers below are in seconds, used as milli-seconds here.
>
> >       }
> >       return 0;
> >  }
> > @@ -331,6 +333,14 @@ static int amd_energy_probe(struct platform_device *pdev)
> >       if (IS_ERR(hwmon_dev))
> >               return PTR_ERR(hwmon_dev);
> >
> > +     /* Once in 3 minutes for a resolution of 1/2*16 */
>
> * 16 or ^ 16 ?
>
> > +     if (data->energy_units == 0x10)
> > +             data->timeout = 3 * 60;
>
> 180 ms ? I assume this is a bug and meant to be 3 * 60 * 1000.
>
> > +
> > +     /* Once in 3 days for a resolution of 1/2^6 */
> > +     if (data->energy_units == 0x6)
> > +             data->timeout = 3 * 24 * 60 * 60;
> > +
>
> ... and else ?
>
> This needs to cover all cases, including those not currently existing.
> I would suggest to define a formula based on data->energy_units.
> The energy units value can be anything from 0..31. Based on your numbers, something like
>     timeout_ms = BIT(34 - data->energy_units); should do. It translates to about 3.1 days for energy_units=6, and
> 4.3 minutes for energy_units=16. If that is too much, you can make it
>    timeout_ms = BIT(33 - data->energy_units);
>
> To avoid overflow, it might make sense to max out at BIT(31).
>     timeout_ms = BIT((min(31, 33 - data->energy_units));
>
Thank you for the feedback and suggestions. I will implement and
submit the updated version.

> Guenter
>
> >       data->wrap_accumulate = kthread_run(energy_accumulator, data,
> >                                           "%s", dev_name(hwmon_dev));
> >       if (IS_ERR(data->wrap_accumulate))
> >
Naveen
