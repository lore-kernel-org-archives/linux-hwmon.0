Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B5CDC48BE8
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jun 2021 12:23:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E00B16113E
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jun 2021 12:23:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232011AbhFRMZK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jun 2021 08:25:10 -0400
Received: from ms-10.1blu.de ([178.254.4.101]:48844 "EHLO ms-10.1blu.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231474AbhFRMZK (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jun 2021 08:25:10 -0400
Received: from [37.209.98.109] (helo=marius.localnet)
        by ms-10.1blu.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        (envelope-from <mail@mariuszachmann.de>)
        id 1luDWU-00025I-6U; Fri, 18 Jun 2021 14:22:58 +0200
From:   Marius Zachmann <mail@mariuszachmann.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wilken Gottwalt <wilken.gottwalt@posteo.net>,
        Aleksandr Mezin <mezin.alexander@gmail.com>,
        linux-hwmon@vger.kernel.org, Jiri Kosina <jikos@kernel.org>
Subject: Re: corsair-cpro and hidraw
Date:   Fri, 18 Jun 2021 14:22:57 +0200
Message-ID: <36091016.oId77RFrrH@marius>
In-Reply-To: <20210618121300.GB1202484@roeck-us.net>
References: <CADnvcf+LhxZoZk9eRUahSWZ3xVJLkxcAt3+4dS-JCjV8gZE_0A@mail.gmail.com> <27527118.vr9HtJ8RzA@marius> <20210618121300.GB1202484@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Con-Id: 241080
X-Con-U: 0-mail
X-Originating-IP: 37.209.98.109
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 18.06.21 at 14:13:00 CEST, Guenter Roeck wrote
> On Fri, Jun 18, 2021 at 09:06:02AM +0200, Marius Zachmann wrote:
> > On 18.06.21 at 08:47:37 CEST, Wilken Gottwalt wrote
> > > On Fri, 18 Jun 2021 08:18:23 +0200
> > > Marius Zachmann <mail@mariuszachmann.de> wrote:
> > > 
> > > > On 18.06.21 at 07:45:00 CEST, Wilken Gottwalt wrote
> > > > > On Fri, 18 Jun 2021 05:56:29 +0600
> > > > > Aleksandr Mezin <mezin.alexander@gmail.com> wrote:
> > > > > 
> > > > > > I've looked through corsair-psu sources, and I think filtering in
> > > > > > raw_event won't be enough.
> > > > > > 
> > > > > > For example, in corsairpsu_request, there are 2 commands, and they
> > > > > > should be executed consecutively:
> > > > > > 1) corsairpsu_usb_cmd(priv, 2, PSU_CMD_SELECT_RAIL, rail, NULL);
> > > > > > 2) corsairpsu_usb_cmd(priv, 3, cmd, 0, data);
> > > > > > 
> > > > > > If the userspace will squeeze another PSU_CMD_SELECT_RAIL between (1)
> > > > > > and (2), the driver will get data for a wrong rail (and with the
> > > > > > current code won't even notice it).
> > > > > > 
> > > > > > So unless there is a way to "lock" hidraw (and it seems that there
> > > > > > isn't - looking at the code, hidraw calls the low-level hid driver
> > > > > > directly, as far as I understand), it won't work correctly.
> > > > > > 
> > > > > > And if a driver can't work correctly with hidraw enabled - maybe it
> > > > > > shouldn't enable hidraw? So that the user can 1) notice that something
> > > > > > is wrong 2) blacklist or unbind the driver (or userspace tools that
> > > > > > use hidraw can unbind automatically). Otherwise everything seems to be
> > > > > > silently broken.
> > > > > > 
> > > > > > On the other hand, maybe races between the kernel driver and userspace
> > > > > > tools are unlikely, because the driver doesn't talk to the device
> > > > > > continuously - only when sysfs reads happen.
> > > > > 
> > > > > I never noticed any issues of that kind. I actually did quite a lot of
> > > > > userspace testing. A result of this a userspace tool you can find here:
> > > > > https://github.com/wgottwalt/corsair-psu/tree/main/tools/rmi-hxi-query
> > > > > 
> > > > > Though, if you find a way to trigger such a race condition I have no
> > > > > problem to remove the hidraw part.
> > > > > 
> > > > > greetings
> > > > > Will
> > > > 
> > > > It is possible. Making a userspace tool with just a loop of read/writes
> > > > will get you wrong readings in the driver sometimes.
> > > 
> > > Hmm, did you read the comments in the driver? I warn about writing nonsense
> > > values to the micro-controller because you can make it stall. If I let you
> > > access the device by hidraw I assume you know what you are doing. You
> > > actually can damage your PSU by this, something I also warn about. I even
> > > mention that I may remove the hidraw feature in future versions.
> > 
> > Sorry for the confusion. I did not test with corsair-psu. (Do not have
> > the hardware) I tested with corsair-cpro. Reading temps with userspace and
> > reading fan speed with the driver simultaneously.
> > But you are right. This is also not, what a userspace tool should do this
> > fast and if it doesn't, races are really unlikely.
> > 
> 
> Same there: Make userspace and kernel mutually exclusive if parallel access
> is shown to be problematic. "Mutually exclusive" means disable userspace
> access completely while the driver is loaded, not some cross-subsystem
> mutex.
> 
> Guenter
> 

For now I did not get a bug report nor did anyone seem to have a real problem.
It is mostly a theoretical issue.
I am not unhappy about how it is.
Maybe until a real problem occurs, we should just do nothing?

Greetings
Marius



