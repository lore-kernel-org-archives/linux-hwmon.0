Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:43728 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753529AbeFJFOW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 10 Jun 2018 01:14:22 -0400
Date: Sat, 9 Jun 2018 22:14:20 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: Chris Ouellet <rabbit.of.war@gmail.com>,
        linux-hwmon@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Ryzen 2700 Temperature offset?
Message-ID: <20180610051420.GA22601@roeck-us.net>
References: <C85830A6-BCC7-4137-84E5-38503873F278@canonical.com>
 <20180607154915.GA7061@roeck-us.net>
 <54EAD835-C48D-4751-9BFF-71536241129A@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54EAD835-C48D-4751-9BFF-71536241129A@canonical.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sun, Jun 10, 2018 at 03:03:47AM +0800, Kai-Heng Feng wrote:
> at 23:49, Guenter Roeck <linux@roeck-us.net> wrote:
> 
> >On Thu, Jun 07, 2018 at 11:03:13AM +0800, Kai Heng Feng wrote:
> >>Hi Guenter,
> >>
> >>A user thinks the Ryzen 2700 temperature may not be correct [1].
> >>Can you take a look when you have time? Thanks.
> >>
> >>Also, where can I find all these temperature offsets? I googled but with
> >>no
> >>result.
> >Problem is that the offsets are not documented in public, making it
> >difficult to find out. For Ryzen 2700, there is currently no offset
> >configured; I was told that there is none. For Ryzen 2700X, the offset
> >is 10 degrees C.
> 
> I am still quite interesting where you get this information...
> 
Primarily lots of online research. Windows tools usually support the
offsets, so screendumps help in some cases. 

> >
> >>[1] https://bugs.launchpad.net/bugs/1774817
> >
> >The key here is the commit mentioned in the log (1b59788979acd). It does
> >not only adjust the per-CPU offset, but also takes a configurable offset
> >of 49 degrees C into account. You'll need to apply that patch in your
> >kernel, or the temperature may be off by 49 degrees C.
> 
> So unless AMD shares these offsets value, we can never know what correct
> offsets are?
> 
Unfortunately that is correct.

AFAIK the information is available from AMD under NDA. I can not sign such an
NDA, and even if I could and would, I could not use the information in an open
source driver. Kind of a loose-loose situation. If you (Canonical) have any
influence at AMD, it might be useful to let them know that their policy is
not very helpful.

Guenter


> Kai-Heng
> 
> >
> >Hope this helps. If not, please let me know. Note that I am travelling;
> >responses may be delayed.
> >
> >Guenter
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
