Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE6BC6379D
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 Nov 2020 22:27:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10AD5206F9
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 Nov 2020 22:27:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.b="yc0I02J9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387490AbgKYW10 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 Nov 2020 17:27:26 -0500
Received: from gproxy3-pub.mail.unifiedlayer.com ([69.89.30.42]:60646 "EHLO
        gproxy3-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387474AbgKYW1Z (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Nov 2020 17:27:25 -0500
Received: from CMGW (unknown [10.9.0.13])
        by gproxy3.mail.unifiedlayer.com (Postfix) with ESMTP id 1A0D64000E
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Nov 2020 15:27:23 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id i3FykoIaTi1lMi3FyknCon; Wed, 25 Nov 2020 15:27:23 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.2 cv=CoPPSjwD c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10 a=nNwsprhYR40A:10
 a=evQFzbml-YQA:10 a=k-42gJp3AAAA:8 a=VwQbUJbxAAAA:8 a=rCKKwiYUAAAA:20
 a=Sjg5zyESi43zRNGYTtgA:9 a=CjuIK1q_8ugA:10 a=uCSXFHLys93vLW5PjgO_:22
 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=GAxD1Bw9wbDDgLrYVtYOJKfJpiz/+m2eJJw+44jLvhE=; b=yc0I02J9RJ/Gj3JLD45LqdL3ue
        G9VggGbR035jytGQ2AjM6ZQWqxkOj1h0iC+L9F+x/g2iRHaZg+VcbB0XpAkXn6xNl7Wn1WUTUDJsm
        89YEK29O0dIBGfMBvud9Y10PNVWoShJkxeXykIzovdcHK+hKTIfkm/SLWqtKAiygZlp+p3EBlbxJ2
        aYTvnwY8dZsf8jhaent3HneT+8sTKXjGJ9KzFznvLvm61iPb23I6EzOlS4aHpsuW2P7hIwMAFKwT7
        wlhcvSQeam444XjkQ9dU8eoQBxWSwv8wBqZuGk7yC1m378K1Km1ws+6g5M7YoQ9pe0xjFDWlBh0XH
        CxiJ5Fwg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:35802 helo=localhost)
        by bh-25.webhostbox.net with esmtpa (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1ki3Fy-001OZt-2b; Wed, 25 Nov 2020 22:27:22 +0000
Date:   Wed, 25 Nov 2020 14:27:21 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Paul Barker <pbarker@konsulko.com>
Cc:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Dongjin Kim <tobetter@gmail.com>
Subject: Re: [PATCH v2 0/4] pwm-fan: Support multiple tachometer inputs
Message-ID: <20201125222721.GA106613@roeck-us.net>
References: <20201113150853.155495-1-pbarker@konsulko.com>
 <CAM9ZRVvng=E_-ZPYSYwC0537+CxTv3=BsiWp0_eGprt8Jqgzkw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAM9ZRVvng=E_-ZPYSYwC0537+CxTv3=BsiWp0_eGprt8Jqgzkw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1ki3Fy-001OZt-2b
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:35802
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 4
X-Org:  HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Nov 25, 2020 at 04:45:27PM +0000, Paul Barker wrote:
> On Fri, 13 Nov 2020 at 15:09, Paul Barker <pbarker@konsulko.com> wrote:
> >
> > These changes were made to support a custom board where one PWM output
> > is routed to two fans, each of which has a tachometer signal routed to a
> > GPIO input on the SoC.
> >
> > As the custom board doesn't currently support the latest mainline kernel
> > I've tested these changes on a SanCloud BeagleBone Enhanced using an
> > oscilloscope to check the PWM output and a signal generator to simulate
> > the fan tachometer signals. I've tested variants of the device tree with
> > 0, 1 and 2 fan tachometer inputs configured to ensure the logic in the
> > probe function is correct.
> >
> > The device tree bindings changes have been submitted in a separate
> > series:
> > https://lore.kernel.org/linux-devicetree/20200920180943.352526-1-pbarker@konsulko.com/
> >
> > These changes can also be pulled from:
> >
> >   https://gitlab.com/pbarker.dev/staging/linux.git
> >   tag: for-hwmon/pwm-fan-tachometers-v2_2020-11-13
> >
> > Changes since v1:
> >
> >   * Split RPM calculation fix into a separate patch which has now been
> >     accepted.
> >
> >   * Break the changes down into smaller patches so they're easier to
> >     review.
> >
> >   * Rebased changes on hwmon-next.
> >
> > Paul Barker (4):
> >   hwmon: pwm-fan: Refactor pwm_fan_probe
> >   hwmon: pwm-fan: Dynamically setup attribute groups
> >   hwmon: pwm-fan: Store tach data separately
> >   hwmon: pwm-fan: Support multiple fan tachometers
> >
> >  drivers/hwmon/pwm-fan.c | 155 ++++++++++++++++++++++++----------------
> >  1 file changed, 95 insertions(+), 60 deletions(-)
> >
> >
> > base-commit: 414920a4a5d5613e4aa77c89944f9c1dc86b06c4
> > --
> > 2.29.2
> >
> 
> Has anyone had a chance to look at this series? I see that the
> corresponding dt-bindings change has been accepted into the hwmon-next
> tree but I've not heard anything back on these patches.
> 
Still on my list. Sorry, I have been buried in work, and being stuck in
the middle of nowhere (aka Wyoming) last week with a broken charge port
on a Tesla didn't help.

> I also see that a patch just got sent to this list which will conflict
> with this series
> (https://lore.kernel.org/linux-hwmon/20201125163242.GA1264232@paju/T/#u).
> It'd be good to get feedback so that either myself, Dongjin Kim or
> both of us can re-work our patches to be compatible.
> 
I have seen it. I hope I'll get to your series over the weekend.
Sorry for the delay.

Guenter
