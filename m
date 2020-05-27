Return-Path: <SRS0=H3vz=7J=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA098C433DF
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 May 2020 14:42:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0BBF207D8
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 May 2020 14:42:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pyQwk5/a"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388395AbgE0Omg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 May 2020 10:42:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387942AbgE0Omf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 May 2020 10:42:35 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47E56C05BD1E
        for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2020 07:42:35 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id m18so29213365ljo.5
        for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2020 07:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IEXEPuRJ+eK50hO4eGn3/5MV+IbIN+w5kUxwHNf7HdM=;
        b=pyQwk5/aWxQSoiHDUYcqABFXBN2jutEGHetwwDkuKxv9s1QST1yXJgwXnwenAY5oyk
         AKtbA2SXnMmT57d29nCfN1Gq494MvHVSCyBeuECdhh64r4Eg6qQlCsFPG9kjo/a7P3ng
         zLSXALobQczn78WwX1LWsscXA4eF+2ZkKP4ap/PfuBkYSwOdB7Pag/tbHXxlq7kEXKXc
         +PxaQ6ScTZM/AWbjWgt50kU/10o66KDPCAVjqwJsn629L1m/3SNJuySMSwtGxoQfmKJe
         /Yw9njv3RUU7345zvqfqmmezUznwvljjFP4HjWVruZmglGViDda6fTVO/DmCDcQ7TQtK
         5mmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IEXEPuRJ+eK50hO4eGn3/5MV+IbIN+w5kUxwHNf7HdM=;
        b=W7LxJMu80W0OcvmcwbzbMuNVeG4ev2QjU27p20NqFPn0xWOLZVhBLFU/mfVyaxy1h/
         IaJwwPweJRijMLFNW7tRJbq+zNdybB3pQnoq+Hf/XHA9p957UgtfHJ4qiQFa5bvbUy87
         zduKP961CW6SI6ufchWw0LI62TaOvbAlrtthZgSB9ibkv6XvnCAmqNvbn7EYuIeYeNtv
         EXiHkOf9mTeB5Zdw04Oc0f0MAN/+3rGn6PGxnA0yiO4c7zAEpw9JqwYcfuE4wHHRHBiP
         /fGN6liOO4XMMuphWVFBcOrN4reIqyIVNNEvTZEjpg8t3Hkhx+1HVjf0WXdAj4iOFmty
         ozwA==
X-Gm-Message-State: AOAM531KadJ8cX9LzJDot9zxCZKWsaMYtpN6JRbFEbAdiUMke+n3nilE
        Uy75ee2noCNzDG+6nBbBmneKo6XWN0oDHXp8HY8=
X-Google-Smtp-Source: ABdhPJxR1Uvz5yQHlpcYMyxwzMPHPk2k3+PSxYsfuuJZ9X2qFcy0T5F+IDya2Qtm4bqKshwh9vGJtqSm3T69ci9QX10=
X-Received: by 2002:a2e:9b10:: with SMTP id u16mr3049131lji.210.1590590553601;
 Wed, 27 May 2020 07:42:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200519155011.56184-1-nchatrad@amd.com> <d3cf6e06-8cda-a3d6-b528-fd2b5360585a@roeck-us.net>
 <CAHfPSqAUYjT_QDmLoQBSQwtjfzyTeNqGqxtBpfGUGc+uO8j+KA@mail.gmail.com>
 <alpine.LNX.2.20.13.2005270120271.8241@monopod.intra.ispras.ru>
 <CAHfPSqCDSQkR03B_g+OAWvja9-+Zwo4Pbx0jLpsHUu_sn9K77Q@mail.gmail.com>
 <alpine.LNX.2.20.13.2005270940400.18802@monopod.intra.ispras.ru>
 <CAHfPSqC6gQzRt-_O-zHTHoSa=vOO064+dfoGrV2abQr=rMvfgA@mail.gmail.com>
 <9a4bbf2f-114a-4c69-b03e-0d9326816d44@roeck-us.net> <alpine.LNX.2.20.13.2005271703220.18802@monopod.intra.ispras.ru>
In-Reply-To: <alpine.LNX.2.20.13.2005271703220.18802@monopod.intra.ispras.ru>
From:   Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Date:   Wed, 27 May 2020 20:12:20 +0530
Message-ID: <CAHfPSqA_0NhpEvn+jAGb3O7uc+EbZDKWajdR_A=RK9Y_-QgKnQ@mail.gmail.com>
Subject: Re: [PATCH 1/3 v7] hwmon: Add amd_energy driver to report energy counters
To:     Alexander Monakov <amonakov@ispras.ru>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Alexander

On Wed, 27 May 2020 at 19:38, Alexander Monakov <amonakov@ispras.ru> wrote:
>
> On Wed, 27 May 2020, Guenter Roeck wrote:
>
> > >> I understand that. If you anticipate that the module may be inserted after a
> > >> wraparound, the driver should populate 'prev_value' with actual counter
> > >> values instead of zeros. That way the driver will properly accumulate
> > >> energy over time it's been inserted. As implemented, the driver counts
> > >> energy since boot time, minus unknown amount lost to wraparounds if the
> > >> driver was loaded too late.
> > > No problem if this module is built into the kernel.
> > > If this module is inserted at later point, unless the user keeps the
> > > counters since
> > > the boot and provide it as an input during the module insert (we can
> > > implement this).
> >
> > I won't accept such a parameter. If you may recall, I did bring this up as
> > reason why I abandoned the matching change for the coretemp driver, predicting
> > that people would complain about it. Now they do. Not surprising. We (and you)
> > will have to live with it.
Yes agree, letting user provide initial values is not appropriate. My bad.

>
> I'm not exactly complaining, I'm proposing a solution: at probe time, populate
> prev_value members with MSR values instead of zeros. That way, the module will
> correctly count energy over the time it's been loaded. It can be unloaded and
> reloaded freely, and doing so would allow to easily measure energy across large
> spans of time, which sounds like an improvement.

In the current driver, the accumulation thread starts during the probe and the
prev_value of sockets and the core0 is updated with the current MSR value.
It takes (nr_cpus - 1) iterations of the thread to populate the prev_value for
the other cores.

By populating prev_value of all the cores during probe, we can
certainly save some
information (values with in one wrap-around at the best). If this
information is
useful, i can submit a patch to do so. Guenter, could you suggest us on this.

>
> I can try to cook a corresponding patch if that sounds alright.
>
> Cheers.
> Alexander



-- 
Shine bright,
(: Nav :)
