Return-Path: <SRS0=lHFq=6T=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 910C0C4725D
	for <linux-hwmon@archiver.kernel.org>; Tue,  5 May 2020 15:43:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 70F37206FA
	for <linux-hwmon@archiver.kernel.org>; Tue,  5 May 2020 15:43:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IumkbGNL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730595AbgEEPn4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 5 May 2020 11:43:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730582AbgEEPny (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 5 May 2020 11:43:54 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5408DC061A10
        for <linux-hwmon@vger.kernel.org>; Tue,  5 May 2020 08:43:52 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id g10so1725536lfj.13
        for <linux-hwmon@vger.kernel.org>; Tue, 05 May 2020 08:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0PkNH18pvdaNohryPADm7fHY6dmGp3QduG1bwlO6F8k=;
        b=IumkbGNLojnT7Ljp/Jx/bW6rwA06oglm3nNnC9ZBjd8ymY5myodiQ//TSPJ2LcYFQn
         Iv/vNf/WzwwbWhWt0DbkkrLOLkDshcFAmFU3S7t0bqkvtA5X6xtwDrmJKGszPgyGoJkd
         VeD/CgYKeaE8xtVTJFRys/BcJfOV0IJyiOtNw5244DoyEDdwuAOFGb2KG/DW6ihLIwN5
         GKIht4V21OfJK0+xK1rHLHLRakVvDaXUzs+OhzbkJDIdMyxI/ya1a7ClyMPChLXE5bii
         bifxDQq89fwV91Neqd7QzI7BC3972CI0n5hX2mOtqmx0FU5yinuB2gMJKNECziP3puWN
         6TFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0PkNH18pvdaNohryPADm7fHY6dmGp3QduG1bwlO6F8k=;
        b=po0pF1wyBP1o7k6vcTv2Sx5diaLdgS9hIz5llf7y1RFlUc35V39TsYOjfMRlk0CqIK
         YzdrDD6RrWSf2M6ywN7vMeI96uYSYC3xqenIcl/tr8/KVk0H48uHftcw/jie9qMcSQ+I
         v1Fi3ioH4eZf8XsDi/2LFNwdyy54w3lvMZDblh2a3MP35rqtPE7kNoclk2uMWkVCyIwB
         1ARAMIzGzNxDLx+HTBA2vEQwmhFvKBpJ8xToH+R4w1TAODwEWKoRK71sh+j5HfRCY1A5
         j36lNBg1DuP42KUGexIzzMHHfSJ5fpjgn3uQVvgPybFzz6p+wpSsWB2KpgqFnii3PwnS
         INPw==
X-Gm-Message-State: AGi0PuYxLsGreD8dehoPbSq8ghkzWVD+au1zpdY1gG4DS25htkXVLa2o
        mqCIA+vpnfRgbzRbUah2XzNuJ/wYehAtkXl3amS+FQ==
X-Google-Smtp-Source: APiQypJ+pQCiwTeuYZy1EgQF70eB9XbMWSBtvbNAwN9JhvnII/HyABXKUWFPw4XTcCMu3GmdZjdyzNTCS5EA6QBZ8XQ=
X-Received: by 2002:a05:6512:308c:: with SMTP id z12mr2027245lfd.195.1588693430689;
 Tue, 05 May 2020 08:43:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200425161750.GA67085@roeck-us.net> <CAHfPSqAj+Ga8u-bL3TrhWJAmMpJ4y4C9t627j3er=UoV9LfGHQ@mail.gmail.com>
 <23f57a70-9c1e-2b1d-eaa4-80b093db8146@roeck-us.net> <CAHfPSqAKWKw_kCwQc4TM8zx4cckYbrffWbtQB5qii9wtKpfgpw@mail.gmail.com>
In-Reply-To: <CAHfPSqAKWKw_kCwQc4TM8zx4cckYbrffWbtQB5qii9wtKpfgpw@mail.gmail.com>
From:   Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Date:   Tue, 5 May 2020 21:13:38 +0530
Message-ID: <CAHfPSqBzpkv1geUbRs0457NodTk84gzkmTKwm7X7FT6384HZDA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] hwmon: Add amd_energy driver to report energy counters
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter

On Mon, 27 Apr 2020 at 20:34, Naveen Krishna Ch
<naveenkrishna.ch@gmail.com> wrote:
>
> Hi Guenter,
>
> On Mon, 27 Apr 2020 at 19:04, Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On 4/27/20 5:39 AM, Naveen Krishna Ch wrote:
> > > Hi Guenter,
> > >
> > > On Sat, 25 Apr 2020 at 21:47, Guenter Roeck <linux@roeck-us.net> wrote:
> > >>
> > >> On Fri, Apr 24, 2020 at 08:50:54AM +0530, Naveen Krishna Chatradhi wrote:
> > >>> This patch adds hwmon based amd_energy driver support for
> > >>> family 17h processors from AMD.
> > >>>
> > >>> The driver provides following interface to the userspace
> > >>> 1. Reports the per core consumption
> > >>>       * file: "energy%d_input", label: "Ecore%03d"
> > >>> 2. Reports per socket energy consumption
> > >>>       * file: "energy%d_input", label: "Esocket%d"
> > >>> 2. Reports scaled energy value in Joules.
> > >>>
> > >>> Cc: Guenter Roeck <linux@roeck-us.net>
> > >>> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> > >>
> > >> Couple of additional comments below.
> > >>
> > >> On a higher level, I noticed that the data overflows quickly
> > >> (ie within a day or so), which is the reason why the matching
> > >> code for Intel CPUs never made it into the kernel. With that
> > >> in mind, I do wonder if this is really valuable. I am quite
> > >> concerned about people complaining that the data is useless,
> > >> and I have to say that I find it quite useless myself. Any
> > >> system running for more than a few hours will report more or
> > >> less random data. Any thoughts on that ?
> > > This driver will also address the future platforms with
> > > support for 64-bit counters.
> > >
> > > We do have platforms that will come out very shortly, which will
> > > support a different energy resolution to increase the wraparound
> > > time with 32bit counters,
> > >
> > > On a platform with 2 sockets each with 64 cores,
> > > Assuming 240W, new resolution of 15.6 milli Joules
> > >
> > > -  Wrap around time for socket energy counter will be
> > > (up to ~3 to 4 days with maximum load).
> > >
> > > 2^32*15.625e-3/240 = 279620.2667 secs to wrap (i.e 3.2 days)
> > >
> > > - Wrap around time for the per-core energy counters with the
> > > new resolution will be
> > >
> > > 2^32*15.6e-3/ (240 * 128) = 2184533.33 secs to wrap (i.e 25 days)
> > >
> > > When a work load is to be run on certain predefined cores.
> > > The Work load managers can gather the energy status before starting
> > > and after completion of the job and measure power consumed by the
> > > work load.
> > >
> > All that doesn't help much for existing platforms, nor for users who
> > expect that counters don't wrap around at all (at least not until they
> > reach the 64-bit limit).
>
> The 3 energy counter MSRs are added newly in family 17h, and this
> driver supports family 17h and later.
>
> >
> > I see two options. Either provide power reporting instead (which should
> > be done in the k10temp driver), or implement a kernel thread which runs
> > often enough to catch wraparounds. While not perfect (it will only report
> > the energy since the driver was loaded), it will at least avoid the
> > frequent wraparounds seen today, and that caveat can be documented.
> Sure, i can updated the k10temp driver once a documented way of power
> reporting is available. For now, i will implement a kernel thread to reduce
> the wrap around and update the documentation.
I've addressed your comments and submitted the next version. Could you
review and let us your know comments. Thank you.
>
> >
> > >>
> > >> How about making the power reporting registers available and
> > >> reporting per-CPU power consumption instead ? I think that would
> > >> add much more value.
> > > We will expose power reporting when platform exposes that information.
> > > Until then, energy reporting becomes further critical.
> > >
> >
> > Some Windows tools such as HwInfo report power readings today,
> > on existing CPUs, so I don't really buy the claim that existing
> > chips don't report it.
> This driver is needed for servers based on Naples and Rome
> which runs on Linux. The energy MSRs are accumulating registers
> updated every 1ms. At present, this is a reliable and documented
> way to measure power consumption over a period. Also, there
> is no documented way to report power readings at this point.
>
> >
> > Thanks,
> > Guenter
> --
> Shine bright,
> (: Nav :)



-- 
Shine bright,
(: Nav :)
