Return-Path: <SRS0=COWf=VV=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 337D2C7618B
	for <linux-hwmon@archiver.kernel.org>; Wed, 24 Jul 2019 15:00:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F2CD721655
	for <linux-hwmon@archiver.kernel.org>; Wed, 24 Jul 2019 15:00:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jkc00hK5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbfGXPAc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 24 Jul 2019 11:00:32 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41045 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbfGXPAc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 24 Jul 2019 11:00:32 -0400
Received: by mail-wr1-f68.google.com with SMTP id c2so44144314wrm.8
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Jul 2019 08:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=otEboxA/PMUP1hTjEyO+fY8cg6pAULQ2ZqUwIv05qpE=;
        b=jkc00hK5RD9Df5TVlMBBfCkcFUFPDK+ttNcj8GBfadMUPDGFWpk8CRGCJed3hIZ1ng
         aCTozKZqJ9TnXik3sXqwv5ohDyptsBJAH1qur6VH/mzaVfDXDUCw36TUKmgoCc7kMjiY
         J5OXUnb6ed20oOczfoeR/BuiFe9bB57oEhMT2fSfe63rh1A7IqDsRiyc4iYihT6zONOk
         Nn1211Ku3jLX3mo8nJ0p6sCRr1mFZqmRfNvjpcxP+0jCnmkzivvjqC3Oi68HW6KKhXQb
         gmy3ehPzXCrRy3XOGT6JguAu/2Cl/1xrvcOyp0Ufokti5aAX6i+QlFORu8a7KfkrnxuF
         LKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=otEboxA/PMUP1hTjEyO+fY8cg6pAULQ2ZqUwIv05qpE=;
        b=ukw932Do1n2KPMB0MHwPYWm/SvaDzB3a5uDDvL8COC3vnm6TlqvL1NL+dFBHg+oJpb
         eOhKZ5pyhe2iBDzI07ddxVhBkVvRw1kuInPLJKL5NbE4ZXkgVdQvfJGJIY2QpZMUUboG
         lbZYHw7mOSOGd5aGVF7EFlln9HNHru4oh3TWyy5/+VrDTo7RmZSUxTfrJPK0rd4mgTQK
         eOvSUra+6Dra5tkDnpCr5QgZUrM5W8wZ7k3Dhe/BjKXDIJep1g8ot9QODoMHqncJahKj
         wZDsr/84GFk6AZnFHbAnCHJAexL7NEWNm3RsZwIP95h74zv1IFtDlgDxKaWGavbdZub0
         O5Qg==
X-Gm-Message-State: APjAAAWTJuQP4UYXfzryeMGb/5KEfXtt1qdaoeQaUxDuMLc7ihIgbEtf
        W2v606Dgm8xepmhXM45zLmHgsFnSjyuxteeNPD4Wtor6UiQ=
X-Google-Smtp-Source: APXvYqyD4n7WnBOm2cL8YOr/Fqa6UmDIDhbLUUO5w5bKZvG4T8zehAyDQMD4JqPFHsN9M+Y6Nd0wGBGnq08dW17jvd0=
X-Received: by 2002:adf:f186:: with SMTP id h6mr75213728wro.274.1563980430551;
 Wed, 24 Jul 2019 08:00:30 -0700 (PDT)
MIME-Version: 1.0
References: <6b6af74c-2a2b-1704-173b-bb1b466b2197@roeck-us.net>
 <20190724080110.6952-1-shenran268@gmail.com> <20190724140730.GA27362@roeck-us.net>
In-Reply-To: <20190724140730.GA27362@roeck-us.net>
From:   Shenran Wang <shenran268@gmail.com>
Date:   Wed, 24 Jul 2019 18:00:22 +0300
Message-ID: <CAGfeh_8nevm+U482Gtbn_GxjLHVtWM88unUdZ0ynT_iOZUUvBw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] drivers/hwmon/acpi_power_meter.c: Change log level
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Great, thanks!

Shenran

On Wed, Jul 24, 2019 at 5:07 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Wed, Jul 24, 2019 at 11:01:10AM +0300, Wang Shenran wrote:
> > At boot time, the acpi_power_meter driver logs the following error level
> > message: "Ignoring unsafe software power cap". Having read about it from
> > a few sources, it seems that the error message can be quite misleading.
> >
> > While the message can imply that Linux is ignoring the fact that the
> > system is operating in potentially dangerous conditions, the truth is
> > the driver found an ACPI_PMC object that supports software power
> > capping. The driver simply decides not to use it, perhaps because it
> > doesn't support the object.
> >
> > The best solution is probably changing the log level from error to warning.
> > All sources I have found, regarding the error, have downplayed its
> > significance. There is not much of a reason for it to be on error level,
> > while causing potential confusions or misinterpretations.
> >
> > Signed-off-by: Wang Shenran <shenran268@gmail.com>
>
> Applied to hwmon-next.
>
> Thanks,
> Guenter
>
> > ---
> >  drivers/hwmon/acpi_power_meter.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
> > index 6ba1a08253f0..4cf25458f0b9 100644
> > --- a/drivers/hwmon/acpi_power_meter.c
> > +++ b/drivers/hwmon/acpi_power_meter.c
> > @@ -681,8 +681,8 @@ static int setup_attrs(struct acpi_power_meter_resource *resource)
> >
> >       if (resource->caps.flags & POWER_METER_CAN_CAP) {
> >               if (!can_cap_in_hardware()) {
> > -                     dev_err(&resource->acpi_dev->dev,
> > -                             "Ignoring unsafe software power cap!\n");
> > +                     dev_warn(&resource->acpi_dev->dev,
> > +                              "Ignoring unsafe software power cap!\n");
> >                       goto skip_unsafe_cap;
> >               }
> >
