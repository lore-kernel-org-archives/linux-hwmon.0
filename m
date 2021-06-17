Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1297EC2B9F4
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jun 2021 07:14:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E67476100A
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jun 2021 07:14:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbhFQHQI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Jun 2021 03:16:08 -0400
Received: from ms-10.1blu.de ([178.254.4.101]:34266 "EHLO ms-10.1blu.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229515AbhFQHQH (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Jun 2021 03:16:07 -0400
X-Greylist: delayed 2790 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Jun 2021 03:16:07 EDT
Received: from [37.209.98.109] (helo=marius.localnet)
        by ms-10.1blu.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        (envelope-from <mail@mariuszachmann.de>)
        id 1ltlUt-0001ZD-Et; Thu, 17 Jun 2021 08:27:29 +0200
From:   Marius Zachmann <mail@mariuszachmann.de>
To:     Aleksandr Mezin <mezin.alexander@gmail.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: corsair-cpro and hidraw
Date:   Thu, 17 Jun 2021 08:27:25 +0200
Message-ID: <2199169.9u6qy3EJ5v@marius>
In-Reply-To: <CADnvcf+LhxZoZk9eRUahSWZ3xVJLkxcAt3+4dS-JCjV8gZE_0A@mail.gmail.com>
References: <CADnvcf+LhxZoZk9eRUahSWZ3xVJLkxcAt3+4dS-JCjV8gZE_0A@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Con-Id: 241080
X-Con-U: 0-mail
X-Originating-IP: 37.209.98.109
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Am Donnerstag, 17. Juni 2021, 05:11:10 CEST schrieben Sie:
> Hello.
> 
> I've noticed that corsair-cpro communicates with the device in
> request-reply pattern, and also exposes hidraw interface, so userspace
> can also send requests. How does the driver figure out that the
> current input report is a response to the request sent by the driver,
> and not for some other request from userspace? Also if userspace reads
> from hidraw, how can it be sure that the report it read is the
> response to its last request, and not to some driver's request?
> 
> I do not have the hardware, I was just looking at corsair-cpro as a
> reference - I'm working on a driver for a similar device (nzxt rgb &
> fan controller)
> 

Hello,
Sadly, it doesn't. There is no way to distinguish where the reply is
coming from. The hardware should probably use report ids in the first
byte of the reply for something like this, but it does not.
I thought about possibilities to stop hidraw before a request and
restart it after the reply, but there is (as far as I know) no way
to do this without changing the hid-driver. Maybe I should have a
look at this idea again.
The choice was either to allow it or block most userspace tools.
I also tried to get false readings and it can be done, albeit
highly unlikely.
As a "solution" I slapped a comment at the beginning of the driver
to point out the problem.

I do not know, what your device is doing, but the (similar) corsair-psu
driver has the same problem. This device uses an echo of the command
in the answer and if they don't match it returns an error. This could
maybe lead to a false error when the replies are switched, but is
probably preferable.

Greetings
Marius


