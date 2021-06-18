Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ADA9C48BDF
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jun 2021 05:45:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 110846054E
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jun 2021 05:45:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232575AbhFRFrM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jun 2021 01:47:12 -0400
Received: from mout01.posteo.de ([185.67.36.65]:46705 "EHLO mout01.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229671AbhFRFrM (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jun 2021 01:47:12 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout01.posteo.de (Postfix) with ESMTPS id 38530240029
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jun 2021 07:45:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1623995102; bh=TBXfBfPS++dG62eO82LcAb9tOtn8vfMXmG87A5uWp/o=;
        h=Date:From:To:Cc:Subject:From;
        b=Svq4U5uaejS2IDzVxWBd0XfGfCe0TAw4mOc6i++UCLLr3ritIuZScn+VoFGAeuw24
         6OfnBB2+jfoQME7kpH/MnzjdA0+yPfUfNNyjCMvY4JRwV0QtKIWsTtl9PUbgd16THe
         QIro9YYGCmQidwV4+8IlYNZfK69ck/sBs0NZbRGeXT2me5s7/MknkTyj9sA9h0/jjo
         ME9fnxUD8vrcpny2UwQ+LIDQmqZWNDfIEk/54micx9ungcoSr49xVaY1Mlg5ZBnABP
         Y3ShPMri7Yabz695f0HvNX3EXsFPSSrAC7Rrwg0fjVvGe5VSX8DorPCOaSmvO89R7t
         n0Uk4ajBxakQQ==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4G5nv11sHWz6tm9;
        Fri, 18 Jun 2021 07:45:01 +0200 (CEST)
Date:   Fri, 18 Jun 2021 05:45:00 +0000
From:   Wilken Gottwalt <wilken.gottwalt@posteo.net>
To:     Aleksandr Mezin <mezin.alexander@gmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Marius Zachmann <mail@mariuszachmann.de>,
        linux-hwmon@vger.kernel.org
Subject: Re: corsair-cpro and hidraw
Message-ID: <20210618074500.7215532b@monster.powergraphx.local>
In-Reply-To: <CADnvcf+W0fLJ8Yh-=dktVR63TXECNKtk5BvUfCBxazkLTw1N6g@mail.gmail.com>
References: <CADnvcf+LhxZoZk9eRUahSWZ3xVJLkxcAt3+4dS-JCjV8gZE_0A@mail.gmail.com>
        <2199169.9u6qy3EJ5v@marius>
        <CADnvcfK1EzyXY83wd7CJYpZ=S9+KnT0ftF9CiYhJScBGXKmm5A@mail.gmail.com>
        <20210617131402.GB59767@roeck-us.net>
        <CADnvcf+W0fLJ8Yh-=dktVR63TXECNKtk5BvUfCBxazkLTw1N6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, 18 Jun 2021 05:56:29 +0600
Aleksandr Mezin <mezin.alexander@gmail.com> wrote:

> I've looked through corsair-psu sources, and I think filtering in
> raw_event won't be enough.
> 
> For example, in corsairpsu_request, there are 2 commands, and they
> should be executed consecutively:
> 1) corsairpsu_usb_cmd(priv, 2, PSU_CMD_SELECT_RAIL, rail, NULL);
> 2) corsairpsu_usb_cmd(priv, 3, cmd, 0, data);
> 
> If the userspace will squeeze another PSU_CMD_SELECT_RAIL between (1)
> and (2), the driver will get data for a wrong rail (and with the
> current code won't even notice it).
> 
> So unless there is a way to "lock" hidraw (and it seems that there
> isn't - looking at the code, hidraw calls the low-level hid driver
> directly, as far as I understand), it won't work correctly.
> 
> And if a driver can't work correctly with hidraw enabled - maybe it
> shouldn't enable hidraw? So that the user can 1) notice that something
> is wrong 2) blacklist or unbind the driver (or userspace tools that
> use hidraw can unbind automatically). Otherwise everything seems to be
> silently broken.
> 
> On the other hand, maybe races between the kernel driver and userspace
> tools are unlikely, because the driver doesn't talk to the device
> continuously - only when sysfs reads happen.

I never noticed any issues of that kind. I actually did quite a lot of
userspace testing. A result of this a userspace tool you can find here:
https://github.com/wgottwalt/corsair-psu/tree/main/tools/rmi-hxi-query

Though, if you find a way to trigger such a race condition I have no
problem to remove the hidraw part.

greetings
Will

> Added corsair-psu maintainer to Cc:
> 
> On Thu, Jun 17, 2021 at 7:14 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On Thu, Jun 17, 2021 at 01:11:38PM +0600, Aleksandr Mezin wrote:
> > > On Thu, Jun 17, 2021 at 12:27 PM Marius Zachmann <mail@mariuszachmann.de> wrote:
> > > ...
> > > > I do not know, what your device is doing
> > >
> > > Actually, NZXT devices (at least grid/"smart device" and "smart device
> > > v2"/rgb&fan controller) don't have such issues - they use report ids,
> > > and don't even expect request-reply communication pattern. I've just
> > > noticed that something seems to be wrong with corsair-cpro (but
> > > somehow didn't notice the comment) and decided to ask.
> > >
> > > > This device uses an echo of the command
> > > > in the answer and if they don't match it returns an error. This could
> > > > maybe lead to a false error when the replies are switched, but is
> > > > probably preferable.
> > >
> > > Hm... If the response includes the id of the request, it should be
> > > possible to filter reports in raw_event, i. e. don't signal completion
> > > if the report doesn't match, and wait more. Yes, there is a corner
> > > case, "if a command is not supported, the length value in the reply is
> > > okay, but the command value is set to 0". But timing out (250 ms) in
> > > this case should probably be fine... Actually I have a compatible
> > > Corsair PSU so maybe I'll send a patch.
> >
> > Patches to improve the situation are welcome. My understanding is
> > that with the current driver users should disable the kernel driver
> > if they plan to use userspace tools to access the device.
> >
> > Guenter

