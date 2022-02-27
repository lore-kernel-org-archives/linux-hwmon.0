Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55CDAC433EF
	for <linux-hwmon@archiver.kernel.org>; Sun, 27 Feb 2022 00:45:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbiB0Aqb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 26 Feb 2022 19:46:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiB0Aqb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 26 Feb 2022 19:46:31 -0500
Received: from ipmail03.adl6.internode.on.net (ipmail03.adl6.internode.on.net [150.101.137.143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 85045206465
        for <linux-hwmon@vger.kernel.org>; Sat, 26 Feb 2022 16:45:53 -0800 (PST)
X-SMTP-MATCH: 0
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail03.adl6.internode.on.net with ESMTP; 27 Feb 2022 11:15:33 +1030
Received: from sac.crawford.emu.id.au (sac.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc02])
        by bits.crawford.emu.id.au (8.17.1/8.16.1) with ESMTP id 21R0jRkE891173;
        Sun, 27 Feb 2022 11:45:27 +1100
Message-ID: <b96779743fb690c5e556760465b4e2cd923de73b.camel@crawford.emu.id.au>
Subject: Re: Reviving Support for it87.c
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     linux-hwmon@vger.kernel.org
Date:   Sun, 27 Feb 2022 11:45:27 +1100
In-Reply-To: <e8e5bca6-9014-ae36-ad02-b2edaf5e046e@roeck-us.net>
References: <6c8b5fbd514df708af84630544eca6ee12766bbd.camel@crawford.emu.id.au>
         <e8e5bca6-9014-ae36-ad02-b2edaf5e046e@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Greylist: inspected by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sun, 27 Feb 2022 11:45:27 +1100 (AEDT) for IP:'fdd2:7aad:d478:1::cb10:cc02' DOMAIN:'sac.crawford.emu.id.au' HELO:'sac.crawford.emu.id.au' FROM:'frank@crawford.emu.id.au' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sun, 27 Feb 2022 11:45:27 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.5 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, 2022-02-26 at 10:47 -0800, Guenter Roeck wrote:
> On 2/26/22 02:38, Frank Crawford wrote:
> > Folks,
> > 
> > For sometime there has been no activity to update the it87 module,
> > but
> > for I've been collecting the various suggested patches and I've
> > tested a
> > number of them and am keen get these into the official kernel.
> > 
> > In fact the biggest set of patches are the set that seems to have
> > come
> > from here in late 2016 but never seems to have made it into the
> > official
> > kernel.
> > 
> > How can I go about getting this moving again?
> > 
> 
> If you refer to my earlier patches, there are two problems with them.
> First, they were not in a form acceptable for upstream submission
> (one patch per logical change).
> Second, and more severe, a lot of the code is experimental and
> sometimes caused problems (restarts) on my systems. This was
> especially the case if the hardware had a second device (another
> it87xx or an embedded controller) accessing the chip in parallel.
> I had tried some workarounds, but never really managed to stabilize
> the code. While this is kind of ok for out-of-tree code, it isn't
> acceptable for the upstream kernel. Getting support from ITE and/or
> from a board vendor was all but impossible. ITE typically doesn't
> even admit that a chip exists, and all I got from board vendors
> - if anything - was "we don't support Linux". I don't know if it
> is even remotely possible to fix those problems without support
> from ITE and/or board vendors.

Unfortunately, this just leads to the current result where the it87
module is almost useless, as there are no current chips supported and all
we get is regular requests to support current chip.  We need to work out
some way around the support, with or without support by the vendor.  I
also suspect we can get better support from Gigabyte and ITE if we are
trying to do something ourselves.

From a personal viewpoint I haven't seen any stability issues from the
current out of tree module, but then that is only my experience.  Even
then some instability seems to be common across a number of drivers and
as long as we work to resolve it I feel it will be accepted.

As for the how to apply the patches, that is where I will need some help,
as we now have over 5 years of changes to try and split up.

Regards
Frank

