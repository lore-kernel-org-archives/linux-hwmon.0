Return-Path: <SRS0=GW+N=ZY=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A0EBC432C0
	for <linux-hwmon@archiver.kernel.org>; Mon,  2 Dec 2019 22:33:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E21D5206F0
	for <linux-hwmon@archiver.kernel.org>; Mon,  2 Dec 2019 22:33:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nG215zeh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725835AbfLBWdk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 2 Dec 2019 17:33:40 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:47043 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbfLBWdk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 2 Dec 2019 17:33:40 -0500
Received: by mail-qt1-f196.google.com with SMTP id 38so1507740qtb.13
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Dec 2019 14:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z53bicsOgnucIBbiAVqDo3FoYGDr5z5WfWByLMT439k=;
        b=nG215zehN8mldQCZa8AUuTV6NHY1w1kBQEbNJQCIBR5gtTklOlAVwgNSCugyzogPF7
         O5DRiiKvxKo9ZmDVHz0lrt9ypOjEJNYeIIT1xg1KZ0h9Pnsbz6c1tZyiQei6nAd/+Xzg
         sI0CaL1nnIA8uw9gAOrXntsUBUhGjaDcdfNULFlSsHHa3x3GQUlMCWEbr5RB+SKhaNuH
         giq67q/8TkmdWPcqUWUfMcuD4EgDJJGNtF4e8CJ5cuytkRmFcfGA8jmv7QYtM/NG+K+L
         dNPyUxnDp3pjRErt4W9NAHbYNEkOcKobqLj9tRhC1/1AG5ghR5wQzTdcS8RlIMCIKZud
         D1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z53bicsOgnucIBbiAVqDo3FoYGDr5z5WfWByLMT439k=;
        b=f5g21nviYnQhDRWv0vDtJF1ndOg1jNpFOl0jj105ki2tJGms//2YVIp4l4N96CM2NS
         mhzAVBxpbQFOMpKOR8UIvyUSEnkoWjSSf9GbKTtth9ZZuXQsvwLo9IEBoDGJxo4lNaWw
         J/8ipsXInRiRNuoJm0Uz1tgcUpT/6Q3+wQU36Be9CJuNXIffA+t6GC1+yplGyBjz9lyp
         pUn4YrK7fHxfFUXs62YSt20MPNQjFmlzedIp8IPSErGgP4W1qUG5mtc2TNtVYpIO0GJS
         FsS650npLjiz/qzLWArX7RNGX1EBht08+Ewz2fx8eLe3ITzjGc3slpvIyU1YLmPC0nhX
         hwTg==
X-Gm-Message-State: APjAAAXOPkMfNm5YhUAVwK3MicmHNxUTj9StCscjak/tv/BH/SEeBRMD
        Y0GIz61bi948hRSQk18xuINOaFVW8orjlkfVQBU=
X-Google-Smtp-Source: APXvYqw2k2+ENte1YateFCRR+Pu3qPAaKJUg/ikItJ9aP0qlzjqXLUnUK783hhMbatJzzxHsDQn1h8OoGzzT5fQGdBU=
X-Received: by 2002:ac8:1afc:: with SMTP id h57mr2014572qtk.250.1575326019060;
 Mon, 02 Dec 2019 14:33:39 -0800 (PST)
MIME-Version: 1.0
References: <CALUKdZ_-pjXPouBYxdm_LriN04Jp-vR5+7SBMkCK1reV2Lq_LA@mail.gmail.com>
 <4e6fda8d-761a-741a-d4af-5dc8ea5fe072@roeck-us.net> <CALUKdZ9pDpMNeKY4wb21gxF7Dqdp=9CJLTEmeRNtDP1N1Pw_9A@mail.gmail.com>
 <e4b5b93e-65ee-dd23-93a6-1737ede87ef4@roeck-us.net> <CALUKdZ9CZWf6KVyPMhsQGLvVN_Ec8JRmVddf=aZw0JOv-5bixQ@mail.gmail.com>
 <20191202175224.GC29323@roeck-us.net>
In-Reply-To: <20191202175224.GC29323@roeck-us.net>
From:   Corey Ashford <yeroca@gmail.com>
Date:   Mon, 2 Dec 2019 14:33:27 -0800
Message-ID: <CALUKdZ8GeTiSDieFnCeK_wTr52FoUcfZUYkco7wBL-2rO+Fe1g@mail.gmail.com>
Subject: Re: [RFC] hwmon: add support for IT8686E to it87.c
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Dec 2, 2019 at 9:52 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Mon, Dec 02, 2019 at 09:07:10AM -0800, Corey Ashford wrote:
> > On Mon, Dec 2, 2019 at 6:32 AM Guenter Roeck <linux@roeck-us.net> wrote:
> > >
> > > On 11/29/19 8:48 PM, Corey Ashford wrote:
> > > > On Fri, Nov 29, 2019 at 8:17 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > > >>
> > > >> On 11/29/19 6:11 PM, Corey Ashford wrote:
> > > >>> Hello folks.  I am running a newly-built system that uses an IT8686E
> > > >>> chip.  Currently, the latest kernel from kernel.org doesn't have code
> > > >>> in drivers/hwmon/it87.c to support it, however, I found some source on
> > > >>> the net which has added support for quite a few more variants of that
> > > >>> brand of Super I/O chip:
> > > >>> https://github.com/xdarklight/hwmon-it87/blob/master/it87.c
> > > >>> I tried it out by building the module and "insmod"ing it into my
> > > >>> running system, and it appears to work fine.
> > > >>>
> > > >>> It seems the original developer had a difficult time pushing the
> > > >>> changes upstream, so he abandoned the project.
> > > >>>
> > > >>
> > > >> I abandoned the project (and dropped the driver from my github page)
> > > >> because people started _demanding_ that I push the driver from github
> > > >> upstream, without offering any assistance whatsoever.
> > > >>
> > > >>> My thought was that I could add support for just the IT8686E chip as a
> > > >>> single patch, and since I can test it locally I would have a better
> > > >>> chance of getting the patch accepted.  The changes to the source at
> > > >>> the above git tree have quite a number of changes that aren't really
> > > >>> necessary for supporting the IT8686E chip, so I think the patch could
> > > >>> be pretty small, but will still credit the original author.
> > > >>>
> > > >>
> > > >> IT8686 is a multi-page chip, meaning you'll need the entire protection
> > > >> against multi-page accesses by the EC in the system. It also supports
> > > >> the new temperature map. I don't think it is that simple.
> > > >>
> > > >> Guenter
> > > >
> > > > Thanks for the quick reply!
> > > >
> > > > When you said they didn't offer any assistance, do you mean assistance
> > > > with testing?  If so, how about if the support is trimmed out for the
> > > > newly-added chips that have no available test system volunteers, and
> > > > then slowly add those back as people make test systems and testing
> > > > time available.  Should I presume that you have access to one or more
> > > > systems with the added ITnnnn chips?  I volunteer my system for
> > > > testing the IT8686E support.
> > > >
> > >
> > > Testing and, more importantly, detailed code review. No one but me has
> > > seriously (if at all) scrutinized that code for years. Just picking it
> > > into mainline and hope that it won't cause trouble is, by itself, troublesome.
> > >
> > > On top of that, the multi-page access problems are well known by board vendors
> > > using this chip as well as by the chip vendor. Yet, neither board vendors nor
> > > ITE talk with kernel developers. The workarounds I implemented are based on
> > > information I got from one of the Windows tools developers, and are not
> > > validated by any board vendor nor by ITE. Every board vendor I tried to contact
> > > tells me that they don't support Linux, and I never got any reply from ITE.
> > > I do know that the code causes problems on early Gigabyte board using the 8686
> > > and similar multi-page chips. Just accessing the chip from Linux may cause trouble
> > > because the built-in EC tries to access it as well in parallel (I suspect this
> > > causes the board to reset because that access is turned off for a while by
> > > the driver). This is all fine for an out-of-tree driver, but it would be
> > > unacceptable in the upstream kernel.
> > >
> > > In summary, you'll not only need to port the code, you'll also need to establish
> > > contact to ITE and/or to board vendors to ensure that the code works as intended
> > > with the EC on the affected boards.
> > >
> > > Guenter
> >
> > Ah, thank you for your detailed explanation.  How you did as much as
> > you did is beyond me.  ITE's web site seems to lack any usable
> > information, and doesn't even list the IT8686 as one of their chips.
> > Other "supported" chips don't appear to have any documentation easily
> > available, other than a very generic-y description of the chip.  Quite
> > an uphill battle for marginal gain.
> >
> Exactly. The only real recommendation I have at this time is for anyone
> running Linux to stay away from boards with ITE chips.
>
> > Is it possible there's a way to access the sensors by using the EC as
> > a proxy, rather than trying to gain direct and exclusive access to the
> > sensors?  Just a thought.  I have no idea of the architecture of these
> > things.  Your mention of EC was the first I had heard of it :/
> >
>
> Not that I know of, sorry. The EC is actually running inside the Super-IO
> chip(s). I have no idea if and how it is accessible from Linux. Either case,
> that would be even worse, since EC programming is board vendor specific.
>
> Guenter

Just for my clarification, it seems that what you're implying is that
the embedded EC still uses the SMbus to access those paged registers,
and so needs to use the same mechanism that an external device would
use.  If that's true, ugh.  If it has its own private access to the
entire register set in one "address space", it could bypass the paging
mechanism.

I guess the next time I build a Linux machine, I should pay attention
to the type of Super I/O chip, but I'm guessing there's no search
selection for that on Newegg  :D

- Corey
