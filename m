Return-Path: <SRS0=YkMd=A2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46DA8C433E2
	for <linux-hwmon@archiver.kernel.org>; Wed, 15 Jul 2020 15:04:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22F46206F5
	for <linux-hwmon@archiver.kernel.org>; Wed, 15 Jul 2020 15:04:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZmPzVXj3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbgGOPEG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 15 Jul 2020 11:04:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbgGOPEF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 15 Jul 2020 11:04:05 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FFA1C061755;
        Wed, 15 Jul 2020 08:04:05 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id h22so2931245lji.9;
        Wed, 15 Jul 2020 08:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RpI2C8qmgW5MJyg+2tVr8/k+PXa4WUpHb5ww0GOLklQ=;
        b=ZmPzVXj36T/vzjIyfFeZ7IiBtYjDgOnYjSEqKajUKmxvBy/ZKuTIYy98Qws/ZrNmMl
         kfsunMaWbnbWOG9+EyLN3eNSDbZf1acsM6YTuK0JK/NG97YJiM3BAtF+x8tLg5Rul1VS
         FIQi57pVzC6R79W0aS9I66MRCg8QHXt1RZOwByQe2fHTX04y9T9dz2Z1iV9PmTdgKJvd
         QdpYRQfbeA4KUgo+9Y+wVICunWvOCtnomZEa9If60vzvxEhYPFDwMa7uzc0NN3HA9pID
         9oLQb9TRbIO9AYs2TuNC/elsp2LybRCFhvhCI8+JRU/noRST8SfyOJurS1WjJixSJkw7
         0oqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RpI2C8qmgW5MJyg+2tVr8/k+PXa4WUpHb5ww0GOLklQ=;
        b=ecg8R1bJk2+ubHoACAu/80CNdSOENzBjfmtS5BkbVoP27H2tHTbCsmtpHe01yFkjJ4
         mJhow3ejf4vhbghhXDWhl70IydzkkmP0ETpSQGOkHgqDpL8CkxVXfcqAnW1I45EaGZA3
         enwD8NRL04VCd+9cdn1rGmDf94duxZS9EX5aSiJIm70sOo1f7GIHlrlvKXT4/Ix0ZSGl
         Fv1k6idb1dZFawaj9u4MlbmB2qr14gAC2gK0d9y8fR4BGcjCCzeY7c99C58fRY7Fr5Hp
         16eb0zZRDh307Yjt6NycxiJDmB1tQMr1kYI3TuFW/VY1RSBI6rqs93cYb3WI7JX4pZRV
         JIaw==
X-Gm-Message-State: AOAM531OUnO7K6Bq2uZFgZnj3Zh1xzECVfVU3f9GzkfEhkhqGYwqINcs
        QUP7yU8D2cdyN271L2liEoh5n/MeGoFaaSJdtMbQWOC/5HzRNg==
X-Google-Smtp-Source: ABdhPJwIKIaK+E3krgStHIOSxMB5uHXGks00rhuj91fwm8k/zq0cSpEyF3YRIzP/MvXQVscRNOzthaX4DzoTKZHM3/A=
X-Received: by 2002:a2e:9b42:: with SMTP id o2mr4824432ljj.102.1594825443551;
 Wed, 15 Jul 2020 08:04:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200714100337.48719-1-jaap.aarts1@gmail.com> <20200715030740.GB164279@roeck-us.net>
 <CACtzdJ1XNjF7d4WcMCtxWkGiWHoF37aQfYNMn+9UtKHeo07X1g@mail.gmail.com> <20200715144737.GD201840@roeck-us.net>
In-Reply-To: <20200715144737.GD201840@roeck-us.net>
From:   jaap aarts <jaap.aarts1@gmail.com>
Date:   Wed, 15 Jul 2020 17:03:52 +0200
Message-ID: <CACtzdJ2c6H+hbbt42Y4mjF_xgbJEiPEROK-hawGxqanH_ZHpug@mail.gmail.com>
Subject: Re: [PATCH] hwmon: add fan/pwm driver for corsair h100i platinum
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-usb@vger.kernel.org, Marius Zachmann <mail@mariuszachmann.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, 15 Jul 2020 at 16:47, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Wed, Jul 15, 2020 at 01:18:58PM +0200, jaap aarts wrote:
> > On Wed, 15 Jul 2020 at 05:07, Guenter Roeck <linux@roeck-us.net> wrote:
> > >
> > > On Tue, Jul 14, 2020 at 12:03:38PM +0200, jaap aarts wrote:
> > > > Adds fan/pwm support for H1000i platinum.
> > > > Custom temp/fan curves are not supported, however
> > > > the presets found in the proprietary drivers are avaiable.
> > > >
> > > > Signed-off-by: Jaap Aarts <jaap.aarts1@gmail.com>
> > >
> > > +Marius Zachmann for input.
> > >
> > > Questions:
> > > - Does this really have to be a different driver or can it be merged into
> > >   the corsair-cpro driver ?
> > I cannot find this driver at the moment, the only corsair driver I can find
> > is the HID driver. As far as I know all asetek gen 6 products use the same
> > interface. Out of curiosity I contacted asetek to confirm, but other userland
> > drivers have used the same code for all products of previous generations.
> > > - What about HID vs. USB driver ?
> > This is not really a HID. I asked in the kernel newbies mailing list and
> > I was told HWMON is probably the right place. Most of the code is
> > related to HWMON so this seems to be the right place to me as well.
>
> Question is if this identifies itself as HID device. If it does,
> it would either have to be blacklisted in the HID core, or it would
> have to be implemented as hid driver. The latter would be preferred,
> since otherwise a userspace application accessing it directly would
> no longer work. Either case, the driver can and should still reside
> in hwmon; that was not the question.
Thanks for the clarification, lsusb lists bInterfaceClass as 255 or
"Vendor Specific Class", so not as a HID.
>
> Thanks,
> Guenter
