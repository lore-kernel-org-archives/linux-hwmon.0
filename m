Return-Path: <SRS0=7kdz=6E=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7428CC3815B
	for <linux-hwmon@archiver.kernel.org>; Mon, 20 Apr 2020 10:51:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FD23206B9
	for <linux-hwmon@archiver.kernel.org>; Mon, 20 Apr 2020 10:51:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gR89r3Wf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbgDTKvq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 20 Apr 2020 06:51:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725773AbgDTKvp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 20 Apr 2020 06:51:45 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3888FC061A0C
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Apr 2020 03:51:45 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id r17so7518026lff.2
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Apr 2020 03:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6SI13zg+Kyh1UMc/wEsTaUBCcl0+HbmmuPm7W1E/Vqc=;
        b=gR89r3Wfz0vs+jrEyeMMs8dyc0hw57yS2vSSNgjZDkVC6pomMquXcy3jr6mC7C7PZa
         I/YEAbRyj2dcy+B/YKzFLoHBYuUNXiyG98xaY2qFn0DsUAOacI68MWAlC/pPU5zq2nEm
         +L33Ij3jiKVQguymdAhSzFSzdWgXMDWzViHR4dpb+HZadVcHRzLFF8wUWuBTLkDN7brh
         8UNUQbq3knRfFRHZvNgUEAuJJZO5Oe0zQn+vnldO3Qffivae/ap2TYrfVVgBomTKA8Mw
         utuxOhjwVoziXHPq40E+8zAOcnmXqkvoxDOGkgoWPq/NWZUrLqRCdN29bvb8GSAivktW
         Sj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6SI13zg+Kyh1UMc/wEsTaUBCcl0+HbmmuPm7W1E/Vqc=;
        b=OxY/TQmcuOYFKJ2vd17JP3NE9MT45P3goAYRre7GDkuvOsen05MMHM5ATpYMOiQPMr
         Hk34ssuy63XGrZ3EpekjjcSYry57DtlIE5W393gN05KkIhH+TGnXXnV0dCuB6V0z7PQu
         AHMcrsQPF4w7pvaclcKH1Bc/8G0YZXw5RVId6QTOX0LWzb+aX/fSWPs+mXFx/beWm0qK
         ufbI+c6BWTUDM+GHIAivwrrcVwtiHv2iR3+RPSLGxxBKnvQk4bpcUZY3CcFm17pZaDmA
         fLWhhJwNBdklNOT8djn/0elR/LYpu56VIYm1rUgO1do73IekiX76QK+ZTf0Lp4H/0rrS
         m1kw==
X-Gm-Message-State: AGi0PuYMuIibUwWw48RFDy1b7eDsnyiUvyhpZTvby3Nf4UlJJCpnMyds
        Itc4+Czz5bqIQ20TLNWfx65LX7bbjsQHkWx92FU=
X-Google-Smtp-Source: APiQypKngqYQY1W92/I7C010k4ulnfxNqerTmI0Il7KG3zNEKtcSbSibQt91d1airpvkAU4F4hVOFAs18V3PCOxkSa4=
X-Received: by 2002:ac2:47f0:: with SMTP id b16mr10355765lfp.81.1587379903665;
 Mon, 20 Apr 2020 03:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200409153939.38730-1-nchatrad@amd.com> <e0d1a13c-e475-2b9f-c951-92aeb1dce9c0@roeck-us.net>
 <CAHfPSqAsuo+ac49L=f0Bg-iPj5gVQp3MRE9kfjSFysUx7WMHpg@mail.gmail.com>
 <75bc1938-104d-4d53-f46a-247e5ce2d2d2@roeck-us.net> <CAHfPSqDQmQFaN-VqrPLPz8GOGh_4VHq6=4moJQB3eEGPdRfMiA@mail.gmail.com>
 <CAHfPSqD6b-=KPVzHr0TOjrNQd5Sub1JnChGhD_aaR6b5+HO6BQ@mail.gmail.com> <20200412222735.GA232180@roeck-us.net>
In-Reply-To: <20200412222735.GA232180@roeck-us.net>
From:   Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Date:   Mon, 20 Apr 2020 16:21:32 +0530
Message-ID: <CAHfPSqBu7rv3UTuwgEXbbwWMv46UMYZAMAcy9FvPwGeEOOWh4A@mail.gmail.com>
Subject: Re: [PATCH 1/2] hwmon: Add amd_energy driver to report energy counters
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

On Mon, 13 Apr 2020 at 03:57, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Mon, Apr 13, 2020 at 01:34:19AM +0530, Naveen Krishna Ch wrote:
> > Hi Guenter
> >
> [ ... ]
> >
> > Constraint:
> > The platform has 2 sets of energy sensors, one at core level, one at
> > socket level.
> > If i populate the chip_info type as "hwmon_energy" for both sensors.
> > The naming of the sysfs entries are going to be continuous and the
> > user application
> > should read the label to identify which entry belongs to which sensor set.
> >
>
> I am a bit at loss. what is the problem with having multiple _energy attributes
> (energy1_input, energy2_input, ..., energy100_input) ?
>
> > Possible solutions :
> > I could think of following ways to avoid this
> > 1. Create 2 different hwmon devices
>
> You could do that, following the approach used by the k10temp driver. This is
> really your call. The question in that case, though, would be why you would want
> have a separate driver to start with and not just enhance the k10temp driver to
> also report energy (and power consumption, though I understand that the registers
> reporting it are not published).
>
> > 2. Use "hwmon_in" as type for one of the sensor sets and
> > "hwmon_energy" for other.
>
> _in is for voltages. Please don't tell me you plan to report voltages with this
> driver. If so, please extend the k10temp driver instead.
>
> > 3. Use "groups" for one of the sensor sets and populate the other via chip.
>
> This is a no-go.
>
> > What do you suggest ?
> >
> > Also, I noticed that the sysfs filename index for the hwmon_energy
> > type is starting with 1,
> > while hwmon_in starts with 0. Was this a design choice ?
>
> I think this was mostly historic, but it preceeds my involvement with the
> hwmon subsystem, so I don't really know.

Thanks for your inputs, i've submitted V2 version of the patch with your
comments addressed. Could you please review them and let us know your opinion.

https://lore.kernel.org/linux-hwmon/20200417190459.233179-1-nchatrad@amd.com/T/#t

>
> Guenter



-- 
Shine bright,
(: Nav :)
