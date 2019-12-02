Return-Path: <SRS0=GW+N=ZY=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC61C432C0
	for <linux-hwmon@archiver.kernel.org>; Mon,  2 Dec 2019 17:52:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2BE4120672
	for <linux-hwmon@archiver.kernel.org>; Mon,  2 Dec 2019 17:52:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CB232eqV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727628AbfLBRw3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 2 Dec 2019 12:52:29 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:37968 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726673AbfLBRw2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 2 Dec 2019 12:52:28 -0500
Received: by mail-ot1-f65.google.com with SMTP id z25so262587oti.5
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Dec 2019 09:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PkYaU9/2RgMAIlQf+KrkL0dxAZhbmD/fxykigenZ0YM=;
        b=CB232eqVycLHpcknVZWSbUfNTnC1kxoVK8RbFg+IE42z45vj0SeWrjUnHg9fEftIGp
         8WcKgLrc9OBITHbAxqsZFcQB6jS5GRDWqotKOwvamcymstHDF2nxqzjSvUaLAzU4jZqe
         Rs18aacxhuw7t8jHdqwL/ws9qZDmrKjcgi/sBK/4MXbch4T/InbQij90FafnO9yrCqgA
         JAl0Oekb988hyddO+/6bPtbp/qlAKOFX+OSBuHiZUvVR3X01qCYFZEadjEzyaYUc5tUt
         7lXU+fJVDa6fL7om4RLaLbn3Ue0lR3FPUKI1S9MG9Aq2UFo5NViz4TC6OTvwM8uxsw81
         70Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=PkYaU9/2RgMAIlQf+KrkL0dxAZhbmD/fxykigenZ0YM=;
        b=cr9X+P/LII4gwwbgGdV2x2wlj1KkaryZkdhtjHC1yUoBtJNJ1HUamFWedcX9y0ITLw
         X+kTiqFjmCIR+dEOCkKceejwuFeCF85T7KgUzQijNqHnx8jPeUZh0QJNIGBkre7mfsST
         NqWAaf22S71ymSl2CXlRx/E8BANFqLzX6+Px9Zci1LD6GnWDhI0+s+sEeZTam7naNUGN
         FiPmrD85+vu1sCOCKZGQ0BKB5x90J03YGRGGUv/RRFcpfvizhXSRe5Ek1hUvSTEMSDP3
         ZGlb3bFAhu1fbxAP6UQOfVyWO6M56Mc3Z9m3dzbRRZHy21kK9Xn6nqHvpuQjBkHuFbYj
         siNw==
X-Gm-Message-State: APjAAAVNpgI0F1EHKK8XGQLEM3Fj4FOJNRM1RAWqlXLRavyi1RyIU2/P
        KL0wN8z3dTmUCe53vveOFgF2UiM7
X-Google-Smtp-Source: APXvYqySx7CkiUHh0tdsCSMOAHva4DHOfnZlDAG/0OqQYTaUxRr+jYckCwjE52UbSYDJWT6/MV7x8w==
X-Received: by 2002:a05:6830:4d1:: with SMTP id s17mr226143otd.188.1575309147328;
        Mon, 02 Dec 2019 09:52:27 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 18sm13626oip.57.2019.12.02.09.52.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2019 09:52:26 -0800 (PST)
Date:   Mon, 2 Dec 2019 09:52:24 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Corey Ashford <yeroca@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [RFC] hwmon: add support for IT8686E to it87.c
Message-ID: <20191202175224.GC29323@roeck-us.net>
References: <CALUKdZ_-pjXPouBYxdm_LriN04Jp-vR5+7SBMkCK1reV2Lq_LA@mail.gmail.com>
 <4e6fda8d-761a-741a-d4af-5dc8ea5fe072@roeck-us.net>
 <CALUKdZ9pDpMNeKY4wb21gxF7Dqdp=9CJLTEmeRNtDP1N1Pw_9A@mail.gmail.com>
 <e4b5b93e-65ee-dd23-93a6-1737ede87ef4@roeck-us.net>
 <CALUKdZ9CZWf6KVyPMhsQGLvVN_Ec8JRmVddf=aZw0JOv-5bixQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALUKdZ9CZWf6KVyPMhsQGLvVN_Ec8JRmVddf=aZw0JOv-5bixQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Dec 02, 2019 at 09:07:10AM -0800, Corey Ashford wrote:
> On Mon, Dec 2, 2019 at 6:32 AM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On 11/29/19 8:48 PM, Corey Ashford wrote:
> > > On Fri, Nov 29, 2019 at 8:17 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > >>
> > >> On 11/29/19 6:11 PM, Corey Ashford wrote:
> > >>> Hello folks.  I am running a newly-built system that uses an IT8686E
> > >>> chip.  Currently, the latest kernel from kernel.org doesn't have code
> > >>> in drivers/hwmon/it87.c to support it, however, I found some source on
> > >>> the net which has added support for quite a few more variants of that
> > >>> brand of Super I/O chip:
> > >>> https://github.com/xdarklight/hwmon-it87/blob/master/it87.c
> > >>> I tried it out by building the module and "insmod"ing it into my
> > >>> running system, and it appears to work fine.
> > >>>
> > >>> It seems the original developer had a difficult time pushing the
> > >>> changes upstream, so he abandoned the project.
> > >>>
> > >>
> > >> I abandoned the project (and dropped the driver from my github page)
> > >> because people started _demanding_ that I push the driver from github
> > >> upstream, without offering any assistance whatsoever.
> > >>
> > >>> My thought was that I could add support for just the IT8686E chip as a
> > >>> single patch, and since I can test it locally I would have a better
> > >>> chance of getting the patch accepted.  The changes to the source at
> > >>> the above git tree have quite a number of changes that aren't really
> > >>> necessary for supporting the IT8686E chip, so I think the patch could
> > >>> be pretty small, but will still credit the original author.
> > >>>
> > >>
> > >> IT8686 is a multi-page chip, meaning you'll need the entire protection
> > >> against multi-page accesses by the EC in the system. It also supports
> > >> the new temperature map. I don't think it is that simple.
> > >>
> > >> Guenter
> > >
> > > Thanks for the quick reply!
> > >
> > > When you said they didn't offer any assistance, do you mean assistance
> > > with testing?  If so, how about if the support is trimmed out for the
> > > newly-added chips that have no available test system volunteers, and
> > > then slowly add those back as people make test systems and testing
> > > time available.  Should I presume that you have access to one or more
> > > systems with the added ITnnnn chips?  I volunteer my system for
> > > testing the IT8686E support.
> > >
> >
> > Testing and, more importantly, detailed code review. No one but me has
> > seriously (if at all) scrutinized that code for years. Just picking it
> > into mainline and hope that it won't cause trouble is, by itself, troublesome.
> >
> > On top of that, the multi-page access problems are well known by board vendors
> > using this chip as well as by the chip vendor. Yet, neither board vendors nor
> > ITE talk with kernel developers. The workarounds I implemented are based on
> > information I got from one of the Windows tools developers, and are not
> > validated by any board vendor nor by ITE. Every board vendor I tried to contact
> > tells me that they don't support Linux, and I never got any reply from ITE.
> > I do know that the code causes problems on early Gigabyte board using the 8686
> > and similar multi-page chips. Just accessing the chip from Linux may cause trouble
> > because the built-in EC tries to access it as well in parallel (I suspect this
> > causes the board to reset because that access is turned off for a while by
> > the driver). This is all fine for an out-of-tree driver, but it would be
> > unacceptable in the upstream kernel.
> >
> > In summary, you'll not only need to port the code, you'll also need to establish
> > contact to ITE and/or to board vendors to ensure that the code works as intended
> > with the EC on the affected boards.
> >
> > Guenter
> 
> Ah, thank you for your detailed explanation.  How you did as much as
> you did is beyond me.  ITE's web site seems to lack any usable
> information, and doesn't even list the IT8686 as one of their chips.
> Other "supported" chips don't appear to have any documentation easily
> available, other than a very generic-y description of the chip.  Quite
> an uphill battle for marginal gain.
> 
Exactly. The only real recommendation I have at this time is for anyone
running Linux to stay away from boards with ITE chips.

> Is it possible there's a way to access the sensors by using the EC as
> a proxy, rather than trying to gain direct and exclusive access to the
> sensors?  Just a thought.  I have no idea of the architecture of these
> things.  Your mention of EC was the first I had heard of it :/
> 

Not that I know of, sorry. The EC is actually running inside the Super-IO
chip(s). I have no idea if and how it is accessible from Linux. Either case,
that would be even worse, since EC programming is board vendor specific.

Guenter
