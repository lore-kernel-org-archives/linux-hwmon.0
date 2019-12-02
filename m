Return-Path: <SRS0=GW+N=ZY=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BCE4C432C0
	for <linux-hwmon@archiver.kernel.org>; Mon,  2 Dec 2019 17:07:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2394D20833
	for <linux-hwmon@archiver.kernel.org>; Mon,  2 Dec 2019 17:07:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RLWVHYG8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727589AbfLBRHW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 2 Dec 2019 12:07:22 -0500
Received: from mail-qv1-f66.google.com ([209.85.219.66]:42677 "EHLO
        mail-qv1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727513AbfLBRHW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 2 Dec 2019 12:07:22 -0500
Received: by mail-qv1-f66.google.com with SMTP id q19so96486qvy.9
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Dec 2019 09:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4lu/Z1gaY87GTnHLNUcLHna32OEwhGTwT4j7l/Sa8zA=;
        b=RLWVHYG8d3abSSGm3RnSyqSCn70t20/O7mUdkFriPJbwULiq43Zdy01m0wXvNq4VaE
         FfppktJGTVJLnw5JqbRl97sikK1Vrptv1hVC1PeVideOg2cYweZmynBiXD1W+UPobiy/
         tNnXzhFKkRDOdfxD9Dm8kk1Z3JcFtivdVjBkHaLuR17J9k4jlDYWyoNMEPC1cQqE+XJ3
         SZQHXY6yFWV/xIKNJipZI1e9eMd/J0oWDDGD7gB6k0hcA6eYX+tSBK6A0dQIDp7Y8f8l
         bJhyQbzXR+mciPwyzq+FP+YfVpH5ystMbQOFrLmQWRoTCXQRZDO0MzJJ2vquvFq0Q2na
         oaaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4lu/Z1gaY87GTnHLNUcLHna32OEwhGTwT4j7l/Sa8zA=;
        b=bZevhs480uL3jWmO44PD/GXlk3i49JZS7TZkTP9R8Ul1TxRQEHok9KK/lHQo4+ay3a
         VwlHF38PEsMmxYzD008iu9cNgSaqc6om1VMpUD48NxqGZuewOrU9fsnoB2yet9vlw2jz
         AwL4+k/vbVFcQGkPc1yJIOihgmqC2mwluC4Bbyt58vVdCLgApvSf9pyfBfPN6zIdwYuy
         W8LcN83b7YGPtWo+miy2u0aiid6T1sBHQuzjGeCEaUjSXaKjii8joFTzdQ9ei8Tw6MqD
         Z169HHzE9a+6IoQebzu51/O1S7TYMXryqzi0pxT9bv+sse9cr33mqzWZ/aZhjZ+wfW6d
         ttHg==
X-Gm-Message-State: APjAAAVGLPr+fuL5Rm/ZxTJCRtDweu1iFNBG8lAt2fVj4jo/B2vZBbmi
        kiUsGtR7ym+BdeGDKX0MikyfftX2hWMnKXokMok=
X-Google-Smtp-Source: APXvYqxsw1Gss1rsEZUMQd1oICcdrZj99N3y8SOMj7L12fK2FFknFnRzU2Zx6p/aXBvVfLBT3fIF8R9UbcFmNUwBPf4=
X-Received: by 2002:a0c:ecc6:: with SMTP id o6mr20014207qvq.220.1575306440977;
 Mon, 02 Dec 2019 09:07:20 -0800 (PST)
MIME-Version: 1.0
References: <CALUKdZ_-pjXPouBYxdm_LriN04Jp-vR5+7SBMkCK1reV2Lq_LA@mail.gmail.com>
 <4e6fda8d-761a-741a-d4af-5dc8ea5fe072@roeck-us.net> <CALUKdZ9pDpMNeKY4wb21gxF7Dqdp=9CJLTEmeRNtDP1N1Pw_9A@mail.gmail.com>
 <e4b5b93e-65ee-dd23-93a6-1737ede87ef4@roeck-us.net>
In-Reply-To: <e4b5b93e-65ee-dd23-93a6-1737ede87ef4@roeck-us.net>
From:   Corey Ashford <yeroca@gmail.com>
Date:   Mon, 2 Dec 2019 09:07:10 -0800
Message-ID: <CALUKdZ9CZWf6KVyPMhsQGLvVN_Ec8JRmVddf=aZw0JOv-5bixQ@mail.gmail.com>
Subject: Re: [RFC] hwmon: add support for IT8686E to it87.c
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Dec 2, 2019 at 6:32 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 11/29/19 8:48 PM, Corey Ashford wrote:
> > On Fri, Nov 29, 2019 at 8:17 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >>
> >> On 11/29/19 6:11 PM, Corey Ashford wrote:
> >>> Hello folks.  I am running a newly-built system that uses an IT8686E
> >>> chip.  Currently, the latest kernel from kernel.org doesn't have code
> >>> in drivers/hwmon/it87.c to support it, however, I found some source on
> >>> the net which has added support for quite a few more variants of that
> >>> brand of Super I/O chip:
> >>> https://github.com/xdarklight/hwmon-it87/blob/master/it87.c
> >>> I tried it out by building the module and "insmod"ing it into my
> >>> running system, and it appears to work fine.
> >>>
> >>> It seems the original developer had a difficult time pushing the
> >>> changes upstream, so he abandoned the project.
> >>>
> >>
> >> I abandoned the project (and dropped the driver from my github page)
> >> because people started _demanding_ that I push the driver from github
> >> upstream, without offering any assistance whatsoever.
> >>
> >>> My thought was that I could add support for just the IT8686E chip as a
> >>> single patch, and since I can test it locally I would have a better
> >>> chance of getting the patch accepted.  The changes to the source at
> >>> the above git tree have quite a number of changes that aren't really
> >>> necessary for supporting the IT8686E chip, so I think the patch could
> >>> be pretty small, but will still credit the original author.
> >>>
> >>
> >> IT8686 is a multi-page chip, meaning you'll need the entire protection
> >> against multi-page accesses by the EC in the system. It also supports
> >> the new temperature map. I don't think it is that simple.
> >>
> >> Guenter
> >
> > Thanks for the quick reply!
> >
> > When you said they didn't offer any assistance, do you mean assistance
> > with testing?  If so, how about if the support is trimmed out for the
> > newly-added chips that have no available test system volunteers, and
> > then slowly add those back as people make test systems and testing
> > time available.  Should I presume that you have access to one or more
> > systems with the added ITnnnn chips?  I volunteer my system for
> > testing the IT8686E support.
> >
>
> Testing and, more importantly, detailed code review. No one but me has
> seriously (if at all) scrutinized that code for years. Just picking it
> into mainline and hope that it won't cause trouble is, by itself, troublesome.
>
> On top of that, the multi-page access problems are well known by board vendors
> using this chip as well as by the chip vendor. Yet, neither board vendors nor
> ITE talk with kernel developers. The workarounds I implemented are based on
> information I got from one of the Windows tools developers, and are not
> validated by any board vendor nor by ITE. Every board vendor I tried to contact
> tells me that they don't support Linux, and I never got any reply from ITE.
> I do know that the code causes problems on early Gigabyte board using the 8686
> and similar multi-page chips. Just accessing the chip from Linux may cause trouble
> because the built-in EC tries to access it as well in parallel (I suspect this
> causes the board to reset because that access is turned off for a while by
> the driver). This is all fine for an out-of-tree driver, but it would be
> unacceptable in the upstream kernel.
>
> In summary, you'll not only need to port the code, you'll also need to establish
> contact to ITE and/or to board vendors to ensure that the code works as intended
> with the EC on the affected boards.
>
> Guenter

Ah, thank you for your detailed explanation.  How you did as much as
you did is beyond me.  ITE's web site seems to lack any usable
information, and doesn't even list the IT8686 as one of their chips.
Other "supported" chips don't appear to have any documentation easily
available, other than a very generic-y description of the chip.  Quite
an uphill battle for marginal gain.

Is it possible there's a way to access the sensors by using the EC as
a proxy, rather than trying to gain direct and exclusive access to the
sensors?  Just a thought.  I have no idea of the architecture of these
things.  Your mention of EC was the first I had heard of it :/

Thanks,

- Corey
