Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD28C49EA2
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jun 2021 06:47:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B0B1F61164
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jun 2021 06:47:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232678AbhFRGtv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jun 2021 02:49:51 -0400
Received: from mout02.posteo.de ([185.67.36.66]:46001 "EHLO mout02.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232675AbhFRGtt (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jun 2021 02:49:49 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout02.posteo.de (Postfix) with ESMTPS id F11AE2400FC
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jun 2021 08:47:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1623998860; bh=szcwPXp0+rvveh1UIia/grk4Qa0m/mMRxeh6zfbJ268=;
        h=Date:From:To:Cc:Subject:From;
        b=QXgt71O91hoSUhxtYdq8QAm8Jv53hfmvuGoAgJTI58fwMOnRnFeoYPCm1btwvNaN2
         g3ZcFIcUwxYvRBdxJj4pb3zc9SLV+oMS/0WC9rGTxDbrhdYH1G2ZVDmquQGJH6/ma9
         TCL2CnTjZlTcul36xBtnTgeKtYmw5PSbnOXaYNfY0Fs602xZJ/E7UIHdeSFmL0g1jD
         wCrRl2n4Ae0QVTtCkLwHM8u2nNj8wU6mzbi0DIotSsgZd1UCmvAYfLO6Vu5DA0Ek5M
         0uZqRKQG32XVVptpWjIUh5P4aOpXILM5AdrmMTFueZYN8Gjz20XZREHwiWO0HDoTbt
         anr1zMOCWYPHg==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4G5qHH0yNDz6tmK;
        Fri, 18 Jun 2021 08:47:39 +0200 (CEST)
Date:   Fri, 18 Jun 2021 06:47:37 +0000
From:   Wilken Gottwalt <wilken.gottwalt@posteo.net>
To:     Marius Zachmann <mail@mariuszachmann.de>
Cc:     Aleksandr Mezin <mezin.alexander@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, Jiri Kosina <jikos@kernel.org>
Subject: Re: corsair-cpro and hidraw
Message-ID: <20210618084737.200f8575@monster.powergraphx.local>
In-Reply-To: <4451002.svKJrzdh7d@marius>
References: <CADnvcf+LhxZoZk9eRUahSWZ3xVJLkxcAt3+4dS-JCjV8gZE_0A@mail.gmail.com>
        <CADnvcf+W0fLJ8Yh-=dktVR63TXECNKtk5BvUfCBxazkLTw1N6g@mail.gmail.com>
        <20210618074500.7215532b@monster.powergraphx.local>
        <4451002.svKJrzdh7d@marius>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, 18 Jun 2021 08:18:23 +0200
Marius Zachmann <mail@mariuszachmann.de> wrote:

> On 18.06.21 at 07:45:00 CEST, Wilken Gottwalt wrote
> > On Fri, 18 Jun 2021 05:56:29 +0600
> > Aleksandr Mezin <mezin.alexander@gmail.com> wrote:
> > 
> > > I've looked through corsair-psu sources, and I think filtering in
> > > raw_event won't be enough.
> > > 
> > > For example, in corsairpsu_request, there are 2 commands, and they
> > > should be executed consecutively:
> > > 1) corsairpsu_usb_cmd(priv, 2, PSU_CMD_SELECT_RAIL, rail, NULL);
> > > 2) corsairpsu_usb_cmd(priv, 3, cmd, 0, data);
> > > 
> > > If the userspace will squeeze another PSU_CMD_SELECT_RAIL between (1)
> > > and (2), the driver will get data for a wrong rail (and with the
> > > current code won't even notice it).
> > > 
> > > So unless there is a way to "lock" hidraw (and it seems that there
> > > isn't - looking at the code, hidraw calls the low-level hid driver
> > > directly, as far as I understand), it won't work correctly.
> > > 
> > > And if a driver can't work correctly with hidraw enabled - maybe it
> > > shouldn't enable hidraw? So that the user can 1) notice that something
> > > is wrong 2) blacklist or unbind the driver (or userspace tools that
> > > use hidraw can unbind automatically). Otherwise everything seems to be
> > > silently broken.
> > > 
> > > On the other hand, maybe races between the kernel driver and userspace
> > > tools are unlikely, because the driver doesn't talk to the device
> > > continuously - only when sysfs reads happen.
> > 
> > I never noticed any issues of that kind. I actually did quite a lot of
> > userspace testing. A result of this a userspace tool you can find here:
> > https://github.com/wgottwalt/corsair-psu/tree/main/tools/rmi-hxi-query
> > 
> > Though, if you find a way to trigger such a race condition I have no
> > problem to remove the hidraw part.
> > 
> > greetings
> > Will
> 
> It is possible. Making a userspace tool with just a loop of read/writes
> will get you wrong readings in the driver sometimes.

Hmm, did you read the comments in the driver? I warn about writing nonsense
values to the micro-controller because you can make it stall. If I let you
access the device by hidraw I assume you know what you are doing. You
actually can damage your PSU by this, something I also warn about. I even
mention that I may remove the hidraw feature in future versions.

> Removing hidraw from the drivers is not a solution, because there are
> many userspace tools for these devices and it should be an expected use case
> to have them running at the same time (eg OpenRGB for rgb)

corsair-psu is a hwmon driver, not a gadget driver. This driver does not
have to provide hidraw, only hwmon api access. The hidraw is just a nice
to have feature. And like my query tool shows, you actually don't need the
driver to query it from userspace. The first prototypes of the driver did
locking in the hidraw part which sometimes resulted in lockups. I will
not increase complexity for a nice-to-have feature. So the only option is,
I remove the feature if it causes trouble.

Guenter, what do you think?

greetings,
Will

> I think the correct solution would be to lock hidraw while the
> drivers are doing requests.
> After a (short) look:
> Introducing a mutex in the hidraw struct which would be locked in
> hidraw_ioctl and could also be locked in the corsair-psu and
> corsair-cpro drivers could be a solution.
> If there are no objections or better suggestions, I will try this
> over the weekend.
> 
> Greetings
> Marius
> 
> Added Jiri Kosina for hidraw to Cc:
> 
> 
> > 
> > > Added corsair-psu maintainer to Cc:
> > > 
> > > On Thu, Jun 17, 2021 at 7:14 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > > >
> > > > On Thu, Jun 17, 2021 at 01:11:38PM +0600, Aleksandr Mezin wrote:
> > > > > On Thu, Jun 17, 2021 at 12:27 PM Marius Zachmann <mail@mariuszachmann.de> wrote:
> > > > > ...
> > > > > > This device uses an echo of the command
> > > > > > in the answer and if they don't match it returns an error. This could
> > > > > > maybe lead to a false error when the replies are switched, but is
> > > > > > probably preferable.
> > > > >
> > > > > Hm... If the response includes the id of the request, it should be
> > > > > possible to filter reports in raw_event, i. e. don't signal completion
> > > > > if the report doesn't match, and wait more. Yes, there is a corner
> > > > > case, "if a command is not supported, the length value in the reply is
> > > > > okay, but the command value is set to 0". But timing out (250 ms) in
> > > > > this case should probably be fine... Actually I have a compatible
> > > > > Corsair PSU so maybe I'll send a patch.
> > > >
> > > > Patches to improve the situation are welcome. My understanding is
> > > > that with the current driver users should disable the kernel driver
> > > > if they plan to use userspace tools to access the device.
> > > >
> > > > Guenter
> > 
> > 
> 
> 
> 
> 

