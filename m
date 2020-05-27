Return-Path: <SRS0=H3vz=7J=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7450C433DF
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 May 2020 14:48:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF6A8207D8
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 May 2020 14:48:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tphHz3NM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388680AbgE0Osm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 May 2020 10:48:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388379AbgE0Osl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 May 2020 10:48:41 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 759A0C05BD1E
        for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2020 07:48:41 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id m1so5600928pgk.1
        for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2020 07:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3b6R5xYmoneomv6GMVsWf4cEaVDl+ZmWizH1YOekvlo=;
        b=tphHz3NMXbCSU82YnywGz2v64ZGgTp7cZDb8JiJimUnLSzayL1iRGmBYxHxY8tWqG+
         EBW/dkVtIul1LKUYK8oUJtt1Zu9y6q/dZxjBWaaaPRfy8crvM+gPlD9ic8KhafypVBJz
         P/0uOgLK8atOQ5I3GK9WRXrsnPsV6rPz05e6ScOfDZ1BqLJwd5z4vNUBndOjfPZK8zAS
         NUPMNyLnZYfjubRDdc0U//DAtVN1NE0deYKi/cenA+8V4dICaWiA81DDjB8BYW6fkSuh
         jRQWWaQaj8nJC6YNdmAT5lHmJmsCM97BUU2Gpfq0q2R6dAWIi2gMtNCRsKJNdQ2G6jSx
         T8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=3b6R5xYmoneomv6GMVsWf4cEaVDl+ZmWizH1YOekvlo=;
        b=BokMB7MR7CoqIHIMMUpWEvZXrDbyz1AWjOmuiEvsaiZFCoAvgmC3uWPTpL+Kl09HzU
         KP2tAETTdu5YoO5TYt2URR8Tii/XQtkpbxiDGIlUUR9zZuLc/BX+Coz/9JAtU1pFcyZN
         TC593ZivWakOnwTpoCPe9QSOeX2TF5InIrRU6E+26FtczMYppnqewPS8XQ8IEC0cnDe5
         a7hcg8ekPmptS/ANJ7OwbxrUTgMM2qTmqMGLOWB8vlg6D52rxeqot4i+qnK1U1hN5Dur
         9xr6+VSi0UCzV7pj071VFf0wW15zRnXVYyowpHbKKSe1ut/h6+eG32b+kwghsr/xN7cR
         9P/Q==
X-Gm-Message-State: AOAM532ZU+gu4zR6+NyTPo9IM1BQrFI/NwWJKWyljBMEqHNQ58q3w2eD
        pg9qa8n+USg94Qi+P50f0a0=
X-Google-Smtp-Source: ABdhPJwkOBBQd5lCajcS9hA0TozJ+VLHbfmtdHi4ViDiPi1ajLdtZNqX4pj2dUrcJWFuzh0F0z90Rw==
X-Received: by 2002:a62:d41a:: with SMTP id a26mr4260221pfh.290.1590590921012;
        Wed, 27 May 2020 07:48:41 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y4sm2212574pfn.101.2020.05.27.07.48.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 May 2020 07:48:40 -0700 (PDT)
Date:   Wed, 27 May 2020 07:48:39 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Alexander Monakov <amonakov@ispras.ru>
Cc:     Naveen Krishna Ch <naveenkrishna.ch@gmail.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/3 v7] hwmon: Add amd_energy driver to report energy
 counters
Message-ID: <20200527144838.GA209591@roeck-us.net>
References: <20200519155011.56184-1-nchatrad@amd.com>
 <d3cf6e06-8cda-a3d6-b528-fd2b5360585a@roeck-us.net>
 <CAHfPSqAUYjT_QDmLoQBSQwtjfzyTeNqGqxtBpfGUGc+uO8j+KA@mail.gmail.com>
 <alpine.LNX.2.20.13.2005270120271.8241@monopod.intra.ispras.ru>
 <CAHfPSqCDSQkR03B_g+OAWvja9-+Zwo4Pbx0jLpsHUu_sn9K77Q@mail.gmail.com>
 <alpine.LNX.2.20.13.2005270940400.18802@monopod.intra.ispras.ru>
 <CAHfPSqC6gQzRt-_O-zHTHoSa=vOO064+dfoGrV2abQr=rMvfgA@mail.gmail.com>
 <9a4bbf2f-114a-4c69-b03e-0d9326816d44@roeck-us.net>
 <alpine.LNX.2.20.13.2005271703220.18802@monopod.intra.ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.20.13.2005271703220.18802@monopod.intra.ispras.ru>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, May 27, 2020 at 05:08:55PM +0300, Alexander Monakov wrote:
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
> 
> I'm not exactly complaining, I'm proposing a solution: at probe time, populate
> prev_value members with MSR values instead of zeros. That way, the module will
> correctly count energy over the time it's been loaded. It can be unloaded and
> reloaded freely, and doing so would allow to easily measure energy across large
> spans of time, which sounds like an improvement.
> 
That would ignore energy accumulated from before the driver was loaded, and
would thus trigger another set of complaints.

A slight improvement might be to add up core energy counters when loading
the driver, compare it against the package counter, and pick the larger
value for the initial package counter(s). This would at least ensure that
the package counter is never less than the sum of the core counters.

Guenter

> I can try to cook a corresponding patch if that sounds alright.
> 
> Cheers.
> Alexander
