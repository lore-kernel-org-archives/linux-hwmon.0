Return-Path: <SRS0=zEzc=VQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47195C7618F
	for <linux-hwmon@archiver.kernel.org>; Fri, 19 Jul 2019 16:08:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 13DD32184E
	for <linux-hwmon@archiver.kernel.org>; Fri, 19 Jul 2019 16:08:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sPxwV+y6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730708AbfGSQIo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 19 Jul 2019 12:08:44 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34985 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726837AbfGSQIo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 19 Jul 2019 12:08:44 -0400
Received: by mail-pg1-f195.google.com with SMTP id s1so8361127pgr.2
        for <linux-hwmon@vger.kernel.org>; Fri, 19 Jul 2019 09:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3/IP3/jgs++Xcu3bg0gycTSCDgaul/c8SzcrGVIEmY0=;
        b=sPxwV+y6ILHb9ny+iQLPtp6ObI8zwxIVTctfHwSzBqfTDpEmhoURZqZxd09Hhb+Z3V
         /k47wIJ+xlftFci5WneqyGaT1OZdRedEPxfSbi3DQs0KrjUL6xgNGFxIQoiBTR64qsaa
         L6nv34aCXRhZO3/5kHiG+927EKMcRJR1MxX6T9jKxN8obVnffpp/rJmWjbF2pWYy9PjU
         Ri+IiOSUGOT5ghrK+qtGwxDbdinqmmglkFkagVkJR6kL9cLAN/iNJwSOffcb66Fh9moo
         xc4Z1hl3VI3vDAb0kaNr9KDHGR3FZ745ipd+RRltjwxdTPOX9dpstsPX0bSqOVx7QMqJ
         07vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=3/IP3/jgs++Xcu3bg0gycTSCDgaul/c8SzcrGVIEmY0=;
        b=ljOubu0sjJmJq8iZu5rl4ehQyUyk3PH4uy399q/NQKN4NBrTSLhToAerU1xOwl72Ce
         +3V5/EGKXfq1O0GLy9eA0bslcSWxZU9KmiuTTYZsP5WI3S2+DfhET0TVlgmR0Q5ljpjc
         bS1diszVd1yLY3FdjPNqg1Gk8ijzQ+UCo2aZntVCTtze6b6dRR0OVFWWqcgCJXuOaLpB
         aDCdHDKisPQuf1x+dbedmNqWAdKQ/RoQ6dox61nvRgTpAG6BcheiwDeUP2iF+c2trPlX
         T0I2Uae38YqdNL3DWUyQ7mMQXuQhHuMPbMdpZY7hGgNqc8TXFYf0z5cGhp8hDLXJ55Tl
         aU1A==
X-Gm-Message-State: APjAAAXBwiQS979GFNhByzcVkjRqxafg+/3feA+UtgZBDeguzdb4ka3x
        P18ntju6MOYfOPZC2xVT5n4=
X-Google-Smtp-Source: APXvYqwrJoLxUFJEiCJ+uVQv765YktBdIChiXcyAJPHRwSHC6B6OIPNhIS7YWXug6TAhJAxSv3Hkxg==
X-Received: by 2002:a63:3d8d:: with SMTP id k135mr56310432pga.23.1563552523777;
        Fri, 19 Jul 2019 09:08:43 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n26sm32794598pfa.83.2019.07.19.09.08.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Jul 2019 09:08:42 -0700 (PDT)
Date:   Fri, 19 Jul 2019 09:08:40 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Marcel Bocu <marcel.p.bocu@gmail.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        "Woods, Brian" <Brian.Woods@amd.com>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Vicki Pfau <vi@endrift.com>
Subject: Re: [PATCH 1/2] x86/amd_nb: Add PCI device IDs for family 17h, model
 71h
Message-ID: <20190719160840.GA26100@roeck-us.net>
References: <20190718182617.6964-1-marcel.p.bocu@gmail.com>
 <20190718193330.GA23809@roeck-us.net>
 <690c10a3-0f5f-6ba7-9dc9-b7150b300dd1@gmail.com>
 <91c6b4cb-2ae4-c2fb-faf4-110b2c426901@roeck-us.net>
 <33703f78-c704-b904-8643-59a1fb1849fa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33703f78-c704-b904-8643-59a1fb1849fa@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Jul 19, 2019 at 06:30:56PM +0300, Marcel Bocu wrote:
> On 19/07/2019 16:27, Guenter Roeck wrote:
> > Hi Marcel,
> > 
> > On 7/19/19 12:40 AM, Marcel Bocu wrote:
> >> On 18/07/2019 22:33, Guenter Roeck wrote:
> >>> On Thu, Jul 18, 2019 at 09:26:16PM +0300, Marcel Bocu wrote:
> >>>> The AMD Ryzen gen 3 processors came with a different PCI IDs for the
> >>>> function 3 & 4 which are used to access the SMN interface. The root
> >>>> PCI address however remained at the same address as the model 30h.
> >>>>
> >>>> Adding the F3/F4 PCI IDs respectively to the misc and link ids appear
> >>>> to be sufficient for k10temp, so let's add them and follow up on the
> >>>> patch if other functions need more tweaking.
> >>>>
> >>>> Signed-off-by: Marcel Bocu <marcel.p.bocu@gmail.com>
> >>>> Tested-by: Marcel Bocu <marcel.p.bocu@gmail.com>
> >>>>
> >>>
> >>> How is this version of the patch series different to the first version ?
> >>
> >> They seem pretty much identical except for the macro's name (71h vs 70h)
> > 
> > Normally (or at least so far) the device ID specifications are for a group
> > of models, not just for one chip in the group. Traditionally, AMD uses the
> > same PCI ID for model numbers 7xh, so 70h would probably be more appropriate.
> > Of course, that is hard to say without documentation from AMD, and I don't
> > see anything published for Ryzen 3000.
> 
> Makes sense. Thanks for giving me some historical background!
> 
> > 
> >> and the fact that I already Cc:ed the x86 crew. I had checked this
> >> weekend if there were patches already for this, but I guess Vicki sent
> >> his patches right after I checked. Sorry for the noise!
> >>
> >> Could anyone add Vicki Pfau (I don't have his email address because I
> >> subscribed to this list after he sent his patches), and then we can ask
> >> him if he already submited his patches to x86 or not.
> >>
> >> In any case, whatever patchset gets selected for inclusion, I suggest we
> >> both sign off on the commit (I do not care about authorship). I will
> >> anyway try to follow up with other patches to access the chipset's
> >> temperature and the fan speed.
> >>
> > 
> > Wouldn't that require patches to the Super-IO chip on your board ?
> > That seems orthogonal to this patch series (and to the R3000 CPU).
> 
> Yes, but what I meant is that I don't mind not having authorship on
> these patches since most of my work will be on adding new features.
> Sorry for not being clear.
> 
> > 
> >> Sorry again for the noise!
> > 
> > Sorry myself, I didn't realize that the patches were from different people
> > since they looked similar.
> 
> I can't blame you for that! Could anyone in this thread add Vicki Pfau
> to figure out what's the best course of action?
> 
Copied. Can the two of you sort this out ?

Note that Vicki's patch series is in patchwork:
	https://patchwork.kernel.org/patch/11043277/
	https://patchwork.kernel.org/patch/11043271/

> We could merge his patches (if he contacted the x86 crew), make a v2 of
> mine (71h -> 70h, add his Signed-off-by?) and merge, or some other option?
> 
Either case, we'll need feedback from x86 maintainers. They are not exactly
happy if anyone pushes a patch into arch/x86 without their approval.

Guenter

> Marcel
> 
> > 
> > Guenter
> > 
> 
