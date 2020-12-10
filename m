Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D24D4C433FE
	for <linux-hwmon@archiver.kernel.org>; Thu, 10 Dec 2020 15:48:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 808D322B45
	for <linux-hwmon@archiver.kernel.org>; Thu, 10 Dec 2020 15:48:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391998AbgLJPsK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 10 Dec 2020 10:48:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390949AbgLJPsI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Dec 2020 10:48:08 -0500
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3997AC0613D6
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Dec 2020 07:47:28 -0800 (PST)
Received: by mail-yb1-xb43.google.com with SMTP id u203so5138033ybb.2
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Dec 2020 07:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jhqb3UCIoKLOM1iC5rOP5PTGtPU4WeiB3/2qI9RroLo=;
        b=OgMHMn2l7vG0IH6rFWkoGD9fjiX4C2R/CnpkNDvJpx/KoSJOpdXbwKN7KsWAEAza3I
         YQ6cRlwmk/taPgrnJ5OH4iwAm5rE1kHkAX8+3LmIGKRytmDwJ2m3J6k97K29aQRjnSKQ
         vGnBrf4oQv2LGDsFVKt4DzMC7/9Ic2TsO+Oq0z+tKn08RxxrAO2aaKF7ao3RvjfcR0EK
         YB1RtYJdfBQ445neV2ZnNmNXmPk45rDUIHm0aRbTYvdioiJEz8OvvyhFyowPK1a2jxLx
         7nN2VK6SmimyKUOz9qlQ0EbF//q6OxqEjJiP+G2oUHR6HWtzK7Hsh5RkSZAJaV5M/ojI
         KSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jhqb3UCIoKLOM1iC5rOP5PTGtPU4WeiB3/2qI9RroLo=;
        b=f4pxcjzuY28QTqdyZ3+ofMuUs9N2nH0BrYBTLrrNj3R3ZhJScN6KeahFoYwsiHQwve
         OwhS656OaHS7mGfYOBNP1AN1EATjeLa1P0e1ACoFINo9O0Zj7476MBoZiTj+K7NV/BAD
         A0gRU+i2uzAYvCndMx9ngppQG2++pRRCpSQ3l5dVUVLje9Qc+5TO9nxxfpwW6BTHDTNE
         hGE4QyEOzA81tTaF8PCyHZ/OMfmIuMrh0FxxEVgWPQDteFW1tVIgVhelW1JYOsf4ABMQ
         He2wuhGEDtobLPEQuXSfF6/kD6jkWeCxexRx6db23vYTTh2tb8+1VQTJygaRQ56+B9PR
         xouA==
X-Gm-Message-State: AOAM533nIxiD4kSXDdK9q6nwgTQ5pm4T6M3jpti1uH3VTJUfN1CND9TF
        Mi2fRMA9k42VIY5cRaazpfxyduawiBHS4U+hjHg=
X-Google-Smtp-Source: ABdhPJzNT8yltBmWbAQGAqvOmi5Wu5zJtNCLQP/TUCGueFCBDc5g/VPycguXCnZzi8XNwf/mWrYR1DKUGdOZ+V7tZkE=
X-Received: by 2002:a25:e04f:: with SMTP id x76mr12018414ybg.461.1607615247391;
 Thu, 10 Dec 2020 07:47:27 -0800 (PST)
MIME-Version: 1.0
References: <a14b8be6-e8b4-c658-2cd6-a2f280be0f99@gmail.com>
 <20201208204059.GA73427@roeck-us.net> <DM6PR12MB4388D95FCC7AD13E3E6AE26FE8CC0@DM6PR12MB4388.namprd12.prod.outlook.com>
 <CAGPDPzDC4zqoeR9dctNfmHv21uB4+NQ5ij7WfeOa2ueT0DY1zw@mail.gmail.com>
 <DM6PR12MB438881D1D0F87627E78310C7E8CC0@DM6PR12MB4388.namprd12.prod.outlook.com>
 <CAGPDPzB_h651WdkZJWSopfTAisHqBjXd1SXat_vMD8EZf7Oy_A@mail.gmail.com> <CAGPDPzBRfM0un57qiq5WjN+-EtpEoFcZGfWqrirXg_LHkjSAzA@mail.gmail.com>
In-Reply-To: <CAGPDPzBRfM0un57qiq5WjN+-EtpEoFcZGfWqrirXg_LHkjSAzA@mail.gmail.com>
From:   Sandeep <sandy.8925@gmail.com>
Date:   Thu, 10 Dec 2020 21:17:11 +0530
Message-ID: <CAGPDPzCbT3vBYeT92H-X1Rj2cHKcsOjPbBNRi=Oe9ufPTjKiLQ@mail.gmail.com>
Subject: Re: [PATCH] Add support for Zen 2 CPUs to amd_energy driver
To:     "Chatradhi, Naveen Krishna" <NaveenKrishna.Chatradhi@amd.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, 10 Dec 2020 at 04:43, Sandeep <sandy.8925@gmail.com> wrote:
>
> On Thu, 10 Dec 2020 at 01:35, Sandeep <sandy.8925@gmail.com> wrote:
> >
> > On Wed, 9 Dec 2020 at 20:58, Chatradhi, Naveen Krishna
> > <NaveenKrishna.Chatradhi@amd.com> wrote:
> > >
> > > [AMD Official Use Only - Approved for External Use]
> > >
> > > Hi Sandeep,
> > >
> > > >> Sure, I'll run that test. I have a 3900X though, which is 12 core, so do I have to adjust anything for that CPU, or just run with the parameters you've specified?
> > >
> > > I'm trying to get hold of a system to test it myself. In the meanwhile, you may run the following command
> > > in the back ground and read the counters (cores and socket) at 5 to 10 secs apart and
> > > sum of the diff of core counters should be not be > diff of socket counters
> > >
> > > sudo ./avx-turbo --iters 1000000000 --spec avx256_fma_t/12
> > >
> > > You may refer https://www.spinics.net/lists/linux-hwmon/msg08255.html link for more background of the testing.
> > >
> > > Regards,
> > > Naveenk
> > >
> >
> > Do you already have a script or something that I can run to
> > automatically gather this information (i.e check values every 5
> > seconds, calculate differences and check if the results line up)?
> > Doing this manually, sounds like a lot of work that I really don't
> > want to get into.
> >
> > - Sandeep
>
> Ok, I was able to write a small program to automate the test, and it
> looks like the following condition "sum of the diff of core counters
> > diff of socket counters" is indeed true. Looks like the values are
> indeed incorrect sometimes.
> - Sandeep

I've uploaded the test program I wrote here -
https://github.com/sandy-8925/amd-energy-tester - in case it's useful
for anyone else. Let me know if you spot any bugs in that code.

- Sandeep
